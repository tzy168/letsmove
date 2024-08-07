module task1::hello {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct Hello has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let object = Hello {
            id: object::new(ctx),
            text: string::utf8(b"cabbage-go")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}

