@implementation NPKCompanionViewServiceConnectionServer

- (void)presentRemotePassValueEntryViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
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
      v17 = 138412802;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Requested present remote pass action entry view controller for request: %@ contact: %@ completion %@", (uint8_t *)&v17, 0x20u);

    }
  }
  -[NPKCompanionViewServiceConnectionServer _checkCompanionViewServiceConnectionEntitlement](self, "_checkCompanionViewServiceConnectionEntitlement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v10[2](v10, 0);
  }
  else
  {
    -[NPKCompanionViewServiceConnectionServer delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewServiceConnectionServer:didRequestPresentRemotePassValueEntryViewControllerForRequest:contact:completion:", self, v8, v9, v10);

  }
}

- (void)presentRemotePassItemSelectionViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
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
      v17 = 138412802;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Requested present remote pass action selection view controller for request: %@ contact: %@ completion %@", (uint8_t *)&v17, 0x20u);

    }
  }
  -[NPKCompanionViewServiceConnectionServer _checkCompanionViewServiceConnectionEntitlement](self, "_checkCompanionViewServiceConnectionEntitlement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v10[2](v10, 0);
  }
  else
  {
    -[NPKCompanionViewServiceConnectionServer delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewServiceConnectionServer:didRequestPresentRemotePassItemSelectionViewControllerForRequest:contact:completion:", self, v8, v9, v10);

  }
}

- (id)_checkCompanionViewServiceConnectionEntitlement
{
  void *v2;
  void *v3;
  void *v4;

  -[PDXPCService connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.NanoPassbook.NPKCompanionViewService.client"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    NPKCompanionViewServiceError(-1000, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (NPKCompanionViewServiceConnectionServerDelegate)delegate
{
  return (NPKCompanionViewServiceConnectionServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
