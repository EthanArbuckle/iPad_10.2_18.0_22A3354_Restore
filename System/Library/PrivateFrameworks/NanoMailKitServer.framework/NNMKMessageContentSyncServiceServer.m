@implementation NNMKMessageContentSyncServiceServer

- (NNMKMessageContentSyncServiceServer)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NNMKMessageContentSyncServiceServer;
  return -[NNMKSyncServiceEndpoint initWithIDSServiceName:queue:](&v4, sel_initWithIDSServiceName_queue_, CFSTR("com.apple.private.alloy.mail.sync.content"), a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)syncMessageContent:(id)a3 notificationPriority:(BOOL)a4 userRequested:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v8 = 100;
  if (a5)
    v8 = 200;
  if (a4)
    v9 = 300;
  else
    v9 = v8;
  objc_msgSend(a3, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v10, 1, v9, 1, v6 | v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)syncAttachment:(id)a3 notificationPriority:(BOOL)a4 userRequested:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v8 = 100;
  if (a5)
    v8 = 200;
  if (a4)
    v9 = 300;
  else
    v9 = v8;
  objc_msgSend(a3, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v10, 2, v9, 1, v6 | v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)notifyInitialContentSyncCompleted:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 3, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  NNMKMessageContentSyncServiceServerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "messageContentSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:", self, v5);

}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  NNMKMessageContentSyncServiceServerDelegate **p_delegate;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "messageContentSyncServiceServer:didFailSendingProtobufWithIDSIdentifier:errorCode:", self, v7, a4);

}

- (NNMKMessageContentSyncServiceServerDelegate)delegate
{
  return (NNMKMessageContentSyncServiceServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
