@implementation CARSessionScreenBorrowToken

- (CARSessionScreenBorrowToken)initWithSession:(id)a3 client:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  CARSessionScreenBorrowToken *v11;
  CARSessionScreenBorrowToken *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CARSessionScreenBorrowToken;
  v11 = -[CARSessionScreenBorrowToken init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_session, v8);
    objc_storeStrong((id *)&v12->_client, a4);
    objc_storeStrong((id *)&v12->_reason, a5);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__CARSessionScreenBorrowToken_initWithSession_client_reason___block_invoke;
    v14[3] = &unk_1E54299B8;
    v15 = v9;
    v16 = v10;
    objc_msgSend(v8, "_performExtendedEndpointAction:", v14);

  }
  return v12;
}

uint64_t __61__CARSessionScreenBorrowToken_initWithSession_client_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  result = CMBaseObjectGetVTable();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 24) + 16);
  if (v6)
    return v6(a2, v3, v4);
  return result;
}

- (void)unborrowToken
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  -[CARSessionScreenBorrowToken client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionScreenBorrowToken reason](self, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionScreenBorrowToken session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__CARSessionScreenBorrowToken_unborrowToken__block_invoke;
  v8[3] = &unk_1E54299B8;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "_performExtendedEndpointAction:", v8);

}

uint64_t __44__CARSessionScreenBorrowToken_unborrowToken__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  result = CMBaseObjectGetVTable();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 24) + 24);
  if (v6)
    return v6(a2, v3, v4);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[CARSessionScreenBorrowToken unborrowToken](self, "unborrowToken");
  v3.receiver = self;
  v3.super_class = (Class)CARSessionScreenBorrowToken;
  -[CARSessionScreenBorrowToken dealloc](&v3, sel_dealloc);
}

- (CARSession)session
{
  return (CARSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (NSString)client
{
  return self->_client;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_session);
}

@end
