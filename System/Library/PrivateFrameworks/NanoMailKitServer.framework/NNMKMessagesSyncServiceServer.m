@implementation NNMKMessagesSyncServiceServer

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NNMKMessagesSyncServiceServer)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NNMKMessagesSyncServiceServer;
  return -[NNMKSyncServiceEndpoint initWithIDSServiceName:queue:](&v4, sel_initWithIDSServiceName_queue_, CFSTR("com.apple.private.alloy.mail.sync.messages"), a3);
}

- (id)updateMessagesStatus:(id)a3 notificationPriority:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  if (a4)
    v5 = 300;
  else
    v5 = 200;
  objc_msgSend(a3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v6, 1, v5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)deleteMessages:(id)a3 notificationPriority:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  if (a4)
    v5 = 300;
  else
    v5 = 200;
  objc_msgSend(a3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v6, 2, v5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)addMessages:(id)a3 notificationPriority:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  if (a4)
    v5 = 300;
  else
    v5 = 200;
  objc_msgSend(a3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v6, 3, v5, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sendInitialMessagesSync:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 4, 200, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendBatchedInitialMessagesSync:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 9, 200, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendMoreMessages:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 5, 200, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendMoreMessagesForConversation:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 6, 200, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendBatchedFetchResult:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 7, 200, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendCoalescedBatchedFetchResult:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 10, 200, 2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)updateMailboxSelection:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 8, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  NNMKMessagesSyncServiceServerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "messagesSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:", self, v5);

}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  NNMKMessagesSyncServiceServerDelegate **p_delegate;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "messagesSyncServiceServer:didFailSendingProtobufWithIDSIdentifier:errorCode:", self, v7, a4);

}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  NNMKProtoMessageStatusUpdates *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  switch(a4)
  {
    case 1uLL:
      v6 = -[NNMKProtoMessageStatusUpdates initWithData:]([NNMKProtoMessageStatusUpdates alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceServer:didUpdateMessagesStatus:", self, v6);
      goto LABEL_9;
    case 2uLL:
      v6 = -[NNMKProtoMessageDeletions initWithData:]([NNMKProtoMessageDeletions alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceServer:didDeleteMessages:", self, v6);
      goto LABEL_9;
    case 3uLL:
      v6 = -[NNMKProtoCompactMessagesRequest initWithData:]([NNMKProtoCompactMessagesRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceServer:didRequestCompactMessages:", self, v6);
      goto LABEL_9;
    case 4uLL:
      v6 = -[NNMKProtoMessagesFilteredOutWarning initWithData:]([NNMKProtoMessagesFilteredOutWarning alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceServer:didWarnMessagesFilteredOut:", self, v6);
      goto LABEL_9;
    case 5uLL:
      v6 = -[NNMKProtoSendMessageRequest initWithData:]([NNMKProtoSendMessageRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceServer:didRequestSendMessage:", self, v6);
      goto LABEL_9;
    case 6uLL:
      v6 = -[NNMKProtoMailboxSelection initWithData:]([NNMKProtoMailboxSelection alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceServer:didUpdateMailboxSelection:", self, v6);
      goto LABEL_9;
    case 7uLL:
      v6 = -[NNMKProtoMessageMailboxMoves initWithData:]([NNMKProtoMessageMailboxMoves alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceServer:didMoveMessages:", self, v6);
LABEL_9:

      break;
    default:
      break;
  }

}

- (void)readResourceAtURL:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id WeakRetained;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("messageId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "messagesSyncServiceServer:didRecieveAttachmentsAtURL:composedMessageId:", self, v6, v11);

  }
  else
  {
    v13 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKMessagesSyncServiceServer readResourceAtURL:metadata:].cold.1(v9, v13);
  }

}

- (void)spaceBecameAvailable
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "messagesSyncServiceServerSpaceBecameAvailable:", self);

}

- (void)connectivityChanged
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "messagesSyncServiceServerConnectivityChanged:", self);

}

- (NNMKMessagesSyncServiceServerDelegate)delegate
{
  return (NNMKMessagesSyncServiceServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)readResourceAtURL:(uint64_t)a1 metadata:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_22E161000, a2, OS_LOG_TYPE_ERROR, "Unknown type: %lu", (uint8_t *)&v2, 0xCu);
}

@end
