@implementation CRKCatalystIDSPrimitives

- (CRKCatalystIDSPrimitives)initWithPrimitives:(id)a3 addressTranslator:(id)a4
{
  id v7;
  id v8;
  CRKCatalystIDSPrimitives *v9;
  CRKCatalystIDSPrimitives *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKCatalystIDSPrimitives;
  v9 = -[CRKCatalystIDSPrimitives init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primitives, a3);
    objc_storeStrong((id *)&v10->_addressTranslator, a4);
  }

  return v10;
}

- (void)addMessageHandler:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke;
  v19[3] = &unk_24D9CABE8;
  v20 = v6;
  v9 = v6;
  v10 = (void *)MEMORY[0x219A226E8](v19);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke_2;
  v17[3] = &unk_24D9CAC10;
  v18 = v7;
  v11 = v7;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke_3;
  block[3] = &unk_24D9CAC38;
  block[4] = self;
  v15 = v10;
  v16 = (id)MEMORY[0x219A226E8](v17);
  v12 = v16;
  v13 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  CRKCancelableBackedCatalystIDSSubscription *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = -[CRKCancelableBackedCatalystIDSSubscription initWithCancelable:]([CRKCancelableBackedCatalystIDSSubscription alloc], "initWithCancelable:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "primitives");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscribeToMessagesWithHandler:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)addressForAppleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKCatalystIDSPrimitives addressTranslator](self, "addressTranslator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationAddressForAppleID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)sendMessage:(id)a3 toAddress:(id)a4 fromID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend((id)objc_opt_class(), "crkOptionsFromOptions:", v13);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[CRKCatalystIDSPrimitives primitives](self, "primitives");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:destinationAddress:sourceAppleID:options:completion:", v16, v15, v14, v18, v12);

}

+ (id)crkOptionsFromOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setFireAndForget:", objc_msgSend(v3, "shouldFireAndForget"));
  objc_msgSend(v3, "deliveryTimeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDeliveryTimeout:", v5);
  return v4;
}

- (CRKIDSPrimitives)primitives
{
  return self->_primitives;
}

- (CRKIDSAddressTranslator)addressTranslator
{
  return self->_addressTranslator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressTranslator, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
}

@end
