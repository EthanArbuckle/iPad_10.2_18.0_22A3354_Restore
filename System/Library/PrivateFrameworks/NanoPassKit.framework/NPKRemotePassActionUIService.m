@implementation NPKRemotePassActionUIService

- (NPKCompanionViewServiceConnection)connection
{
  NPKCompanionViewServiceConnection *connection;
  NPKCompanionViewServiceConnection *v4;
  NPKCompanionViewServiceConnection *v5;

  connection = self->_connection;
  if (!connection)
  {
    v4 = objc_alloc_init(NPKCompanionViewServiceConnection);
    v5 = self->_connection;
    self->_connection = v4;

    -[NPKCompanionViewServiceConnection setDelegate:](self->_connection, "setDelegate:", self);
    connection = self->_connection;
  }
  return connection;
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
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_RemotePassAction_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_RemotePassAction_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x2199B6780](v10);
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKRemotePassActionUIService: Present remote pass value entry view controller for request: %@ contact: %@ completion: %@", (uint8_t *)&v16, 0x20u);

    }
  }
  -[NPKRemotePassActionUIService connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentRemotePassValueEntryViewControllerForRequest:contact:completion:", v8, v9, v10);

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
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_RemotePassAction_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_RemotePassAction_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x2199B6780](v10);
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKRemotePassActionUIService: Present remote pass value select item controller for request: %@ contact: %@ completion: %@", (uint8_t *)&v16, 0x20u);

    }
  }
  -[NPKRemotePassActionUIService connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentRemotePassItemSelectionViewControllerForRequest:contact:completion:", v8, v9, v10);

}

- (void)companionViewServiceConnection:(id)a3 handleCompanionValueEntryDidFinishWithCurrencyAmount:(id)a4 forRequestWithIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[NPKRemotePassActionUIService delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remotePassActionUIService:didSelectEnteredValueAmount:forRequestIdentifier:", self, v8, v7);

}

- (void)companionViewServiceConnection:(id)a3 handleCompanionValueEntryDidCancelForRequestIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NPKRemotePassActionUIService delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remotePassActionUIService:didCancelForRequestIdentifier:", self, v5);

}

- (void)companionViewServiceConnection:(id)a3 handleCompanionItemSelectionDidFinishWithRenewalAmount:(id)a4 serviceProviderData:(id)a5 forRequestWithIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[NPKRemotePassActionUIService delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remotePassActionUIService:didSelectItemForRenewalAmount:serviceProviderData:forRequestIdentifier:", self, v11, v10, v9);

}

- (void)companionViewServiceConnection:(id)a3 handleCompanionItemSelectionDidCancelForRequestIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NPKRemotePassActionUIService delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remotePassActionUIService:didCancelForRequestIdentifier:", self, v5);

}

- (NPKRemotePassActionUIServiceDelegate)delegate
{
  return (NPKRemotePassActionUIServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
