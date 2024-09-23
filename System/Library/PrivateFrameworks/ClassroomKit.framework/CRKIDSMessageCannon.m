@implementation CRKIDSMessageCannon

- (CRKIDSMessageCannon)initWithIDSPrimitives:(id)a3
{
  id v5;
  CRKIDSMessageCannon *v6;
  CRKIDSMessageCannon *v7;
  uint64_t v8;
  CRKIDSMessageFormatter *messageFormatter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKIDSMessageCannon;
  v6 = -[CRKIDSMessageCannon init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_IDSPrimitives, a3);
    v8 = objc_opt_new();
    messageFormatter = v7->_messageFormatter;
    v7->_messageFormatter = (CRKIDSMessageFormatter *)v8;

  }
  return v7;
}

- (void)sendIDSMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_opt_new();
  -[CRKIDSMessageCannon sendIDSMessage:destinationAddress:sourceAppleID:options:completion:](self, "sendIDSMessage:destinationAddress:sourceAppleID:options:completion:", v13, v12, v11, v14, v10);

}

- (void)sendIDSMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[CRKIDSMessageCannon messageFormatter](self, "messageFormatter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "formatMessageForSending:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKIDSMessageCannon IDSPrimitives](self, "IDSPrimitives");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __90__CRKIDSMessageCannon_sendIDSMessage_destinationAddress_sourceAppleID_options_completion___block_invoke;
  v21[3] = &unk_24D9C7DA0;
  v21[4] = self;
  v22 = v12;
  v20 = v12;
  objc_msgSend(v19, "sendMessage:destinationAddress:sourceAppleID:options:completion:", v18, v15, v14, v13, v21);

}

void __90__CRKIDSMessageCannon_sendIDSMessage_destinationAddress_sourceAppleID_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = *(id *)(a1 + 32);
  v5 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CRKIDSMessageFormatter)messageFormatter
{
  return self->_messageFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageFormatter, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

@end
