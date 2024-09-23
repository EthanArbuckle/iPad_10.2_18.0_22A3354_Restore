@implementation NPKCompanionViewServiceConnection

- (NPKCompanionViewServiceConnection)init
{
  NPKCompanionViewServiceConnection *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PKXPCService *remoteService;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NPKCompanionViewServiceConnection;
  v2 = -[NPKCompanionViewServiceConnection init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE6EF78]);
    NPKCompanionViewServiceConnectionServerProtocolInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NPKCompanionViewServiceConnectionClientProtocolInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.NanoPassbook.NPKCompanionViewService.connection.server"), v4, v5, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v6;

    -[PKXPCService setDelegate:](v2->_remoteService, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  NPKCompanionViewServiceConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[NPKCompanionViewServiceConnection dealloc]";
      v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: %s, %@", buf, 0x16u);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)NPKCompanionViewServiceConnection;
  -[NPKCompanionViewServiceConnection dealloc](&v6, sel_dealloc);
}

- (void)presentRemotePassValueEntryViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x2199B6780](v10);
      *(_DWORD *)buf = 138412802;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Requested to present remote pass value entry view controller for request: %@ contact: %@ with completion: %@", buf, 0x20u);

    }
  }
  v15 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __108__NPKCompanionViewServiceConnection_presentRemotePassValueEntryViewControllerForRequest_contact_completion___block_invoke;
  v23[3] = &unk_24CFE7B30;
  v24 = v8;
  v25 = v9;
  v16 = v10;
  v26 = v16;
  v17 = v9;
  v18 = v8;
  -[NPKCompanionViewServiceConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __108__NPKCompanionViewServiceConnection_presentRemotePassValueEntryViewControllerForRequest_contact_completion___block_invoke_34;
  v21[3] = &unk_24CFE7B58;
  v21[4] = self;
  v22 = v16;
  v20 = v16;
  objc_msgSend(v19, "presentRemotePassValueEntryViewControllerForRequest:contact:completion:", v18, v17, v21);

}

void __108__NPKCompanionViewServiceConnection_presentRemotePassValueEntryViewControllerForRequest_contact_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v8 = a1[5];
      v9 = (void *)MEMORY[0x2199B6780](a1[6]);
      v10 = 138413058;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Error presenting remote pass value entry view controller for request: %@ contact: %@ with completion: %@. Error:%@", (uint8_t *)&v10, 0x2Au);

    }
  }
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __108__NPKCompanionViewServiceConnection_presentRemotePassValueEntryViewControllerForRequest_contact_completion___block_invoke_34(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if (a2)
        v7 = CFSTR("YES");
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Finished presenting remote pass value entry view controller with success: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)presentRemotePassItemSelectionViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x2199B6780](v10);
      *(_DWORD *)buf = 138412802;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Requested to present remote pass item selection view controller for request: %@ contact: %@ with completion: %@", buf, 0x20u);

    }
  }
  v15 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __111__NPKCompanionViewServiceConnection_presentRemotePassItemSelectionViewControllerForRequest_contact_completion___block_invoke;
  v23[3] = &unk_24CFE7B30;
  v24 = v8;
  v25 = v9;
  v16 = v10;
  v26 = v16;
  v17 = v9;
  v18 = v8;
  -[NPKCompanionViewServiceConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __111__NPKCompanionViewServiceConnection_presentRemotePassItemSelectionViewControllerForRequest_contact_completion___block_invoke_40;
  v21[3] = &unk_24CFE7B58;
  v21[4] = self;
  v22 = v16;
  v20 = v16;
  objc_msgSend(v19, "presentRemotePassItemSelectionViewControllerForRequest:contact:completion:", v18, v17, v21);

}

void __111__NPKCompanionViewServiceConnection_presentRemotePassItemSelectionViewControllerForRequest_contact_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v8 = a1[5];
      v9 = (void *)MEMORY[0x2199B6780](a1[6]);
      v10 = 138413058;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Error presenting remote pass item selection view controller for request: %@ contact: %@ with completion: %@. Error:%@", (uint8_t *)&v10, 0x2Au);

    }
  }
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __111__NPKCompanionViewServiceConnection_presentRemotePassItemSelectionViewControllerForRequest_contact_completion___block_invoke_40(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if (a2)
        v7 = CFSTR("YES");
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Finished presenting remote pass item selection view controller with success: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  PKXPCService *remoteService;
  void *v4;
  void *v5;

  remoteService = self->_remoteService;
  -[NPKCompanionViewServiceConnection _errorHandlerWithCompletion:](self, "_errorHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKXPCService remoteObjectProxyWithErrorHandler:](remoteService, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__NPKCompanionViewServiceConnection__errorHandlerWithCompletion___block_invoke;
  v8[3] = &unk_24CFE7B80;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x2199B6780](v8);
  v6 = (void *)MEMORY[0x2199B6780]();

  return v6;
}

void __65__NPKCompanionViewServiceConnection__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKCompanionViewService: Error on connection: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)handleCompanionValueEntryFinishedWithCurrencyAmount:(id)a3 forRequestIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NPKCompanionViewServiceConnection delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "companionViewServiceConnection:handleCompanionValueEntryDidFinishWithCurrencyAmount:forRequestWithIdentifier:", self, v7, v6);

}

- (void)handleCompanionValueEntryCancelledForRequestIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NPKCompanionViewServiceConnection delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "companionViewServiceConnection:handleCompanionValueEntryDidCancelForRequestIdentifier:", self, v4);

}

- (void)handleCompanionItemSelectionRequestFinishedWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 forRequestIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NPKCompanionViewServiceConnection delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "companionViewServiceConnection:handleCompanionItemSelectionDidFinishWithRenewalAmount:serviceProviderData:forRequestWithIdentifier:", self, v10, v9, v8);

}

- (void)handleCompanionItemSelectionRequestCancelledForRequestIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NPKCompanionViewServiceConnection delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "companionViewServiceConnection:handleCompanionItemSelectionDidCancelForRequestIdentifier:", self, v4);

}

- (void)serviceResumed
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v5[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: View service connection resumed", v5, 2u);
    }

  }
}

- (void)serviceSuspended
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v5[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: View service connection suspended", v5, 2u);
    }

  }
}

- (void)remoteService:(id)a3 didEstablishConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Remote service (%@) did establish connection (%@)", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  NPKCompanionViewServiceConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: NPKCompanionViewServiceConnection (%@): XPC connection to daemon was interrupted", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (NPKCompanionViewServiceConnectionDelegate)delegate
{
  return (NPKCompanionViewServiceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
