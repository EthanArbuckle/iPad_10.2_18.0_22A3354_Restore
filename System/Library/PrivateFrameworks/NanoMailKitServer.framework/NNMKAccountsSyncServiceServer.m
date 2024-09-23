@implementation NNMKAccountsSyncServiceServer

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NNMKAccountsSyncServiceServer)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NNMKAccountsSyncServiceServer;
  return -[NNMKSyncServiceEndpoint initWithIDSServiceName:queue:](&v4, sel_initWithIDSServiceName_queue_, CFSTR("com.apple.private.alloy.mail.sync.accounts"), a3);
}

- (id)requestWatchAccountsStatus:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeout:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeout:allowCloudDelivery:", v4, 5, 200, 1, 60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)addOrUpdateAccount:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 1, 200, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)deleteAccount:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 2, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendInitialAccountsSync:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 3, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendStandaloneAccountIdentity:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeout:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeout:allowCloudDelivery:", v4, 4, 200, 1, 60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)syncVIPList:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 6, 200, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  NNMKAccountsSyncServiceServerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "accountsSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:", self, v5);

}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  NNMKAccountsSyncServiceServerDelegate **p_delegate;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "accountsSyncServiceServer:didFailSendingProtobufWithIDSIdentifier:errorCode:", self, v7, a4);

}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  id v6;
  NNMKProtoAccountSourceType *v7;
  id v8;
  NNMKProtoAccountAuthenticationStatus *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id WeakRetained;
  NNMKProtoAccountSourceType *v20;
  NNMKAccountsSyncServiceServer *v21;
  uint8_t buf;
  _BYTE v23[15];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 == 2)
  {
    v21 = self;
    v9 = -[NNMKProtoAccountAuthenticationStatus initWithData:]([NNMKProtoAccountAuthenticationStatus alloc], "initWithData:", v6);
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = (NNMKProtoAccountSourceType *)v9;
    -[NNMKProtoAccountAuthenticationStatus accountsStatus](v9, "accountsStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "accountId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v15, "accountId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v17);

          }
          else
          {
            v18 = qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
              -[NNMKAccountsSyncServiceServer readProtobufData:type:].cold.1(&buf, v23, v18);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    WeakRetained = objc_loadWeakRetained((id *)&v21->_delegate);
    v7 = v20;
    -[NNMKProtoAccountSourceType requestTime](v20, "requestTime");
    objc_msgSend(WeakRetained, "accountsSyncServiceServer:didReceivedAccountAuthenticationStatus:requestTime:", v21, v8);

    goto LABEL_16;
  }
  if (a4 == 1)
  {
    v7 = -[NNMKProtoAccountSourceType initWithData:]([NNMKProtoAccountSourceType alloc], "initWithData:", v6);
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "accountsSyncServiceServer:didChangeAccountSourceType:", self, v7);
LABEL_16:

  }
}

- (NNMKAccountsSyncServiceServerDelegate)delegate
{
  return (NNMKAccountsSyncServiceServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)readProtobufData:(os_log_t)log type:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22E161000, log, OS_LOG_TYPE_ERROR, "NNMKProtoAccountAuthenticationStatus account does not have account id!", buf, 2u);
}

@end
