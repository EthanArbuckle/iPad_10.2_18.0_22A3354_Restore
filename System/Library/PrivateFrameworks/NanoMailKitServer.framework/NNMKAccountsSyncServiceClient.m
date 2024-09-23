@implementation NNMKAccountsSyncServiceClient

- (NNMKAccountsSyncServiceClient)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NNMKAccountsSyncServiceClient;
  return -[NNMKSyncServiceEndpoint initWithIDSServiceName:queue:](&v4, sel_initWithIDSServiceName_queue_, CFSTR("com.apple.private.alloy.mail.sync.accounts"), a3);
}

- (id)updateAccountSourceTypeForAccount:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 1, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendAccountAuthenticationStatus:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeout:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeout:allowCloudDelivery:", v4, 2, 200, 1, 60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  NNMKAccountsSyncServiceClientDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "accountsSyncServiceClient:didSendProtobufSuccessfullyWithIDSIdentifier:", self, v5);

}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  NNMKAccountsSyncServiceClientDelegate **p_delegate;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "accountsSyncServiceClient:didFailSendingProtobufWithIDSIdentifier:errorCode:", self, v7, a4);

}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  NNMKProtoAccountAdditionOrUpdate *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  switch(a4)
  {
    case 1uLL:
      v6 = -[NNMKProtoAccountAdditionOrUpdate initWithData:]([NNMKProtoAccountAdditionOrUpdate alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "accountsSyncServiceClient:didAddOrUpdateAccount:", self, v6);
      goto LABEL_8;
    case 2uLL:
      v6 = -[NNMKProtoAccountDeletion initWithData:]([NNMKProtoAccountDeletion alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "accountsSyncServiceClient:didDeleteAccount:", self, v6);
      goto LABEL_8;
    case 3uLL:
      v6 = -[NNMKProtoInitialAccountsSync initWithData:]([NNMKProtoInitialAccountsSync alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "accountsSyncServiceClient:didSyncInitialAccounts:", self, v6);
      goto LABEL_8;
    case 4uLL:
      v6 = -[NNMKProtoStandaloneAccountIdentity initWithData:]([NNMKProtoStandaloneAccountIdentity alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "accountsSyncServiceClient:didReceiveStandaloneAccountIdentity:", self, v6);
      goto LABEL_8;
    case 5uLL:
      v6 = -[NNMKProtoAccountAuthenticationStatusRequest initWithData:]([NNMKProtoAccountAuthenticationStatusRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "accountsSyncServiceClient:didRequestAccountAuthenticationStatus:", self, v6);
      goto LABEL_8;
    case 6uLL:
      v6 = -[NNMKProtoVIPSenderList initWithData:]([NNMKProtoVIPSenderList alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "accountsSyncServiceClient:didReceiveVIPList:", self, v6);
LABEL_8:

      break;
    default:
      break;
  }

}

- (NNMKAccountsSyncServiceClientDelegate)delegate
{
  return (NNMKAccountsSyncServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
