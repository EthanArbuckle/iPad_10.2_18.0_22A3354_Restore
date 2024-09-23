@implementation NNMKMessagesSyncServiceClient

- (NNMKMessagesSyncServiceClient)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NNMKMessagesSyncServiceClient;
  return -[NNMKSyncServiceEndpoint initWithIDSServiceName:queue:](&v4, sel_initWithIDSServiceName_queue_, CFSTR("com.apple.private.alloy.mail.sync.messages"), a3);
}

- (id)updateMessagesStatus:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 1, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)deleteMessages:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 2, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)moveMessages:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 7, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)warnMessagesFilteredOut:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v5, 4, 100, 2, 1);

}

- (void)requestCompactMessages:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v5, 3, 100, 2, 1);

}

- (id)sendMessage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "includeAttachments");

  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v5, 5, 200, 0, v6 ^ 1u);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sendAttachmentAtURL:(id)a3 forComposedMessageId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("type");
  v12[1] = CFSTR("messageId");
  v13[0] = &unk_24FA10C70;
  v13[1] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NNMKSyncServiceEndpoint sendResourceAtURL:metadata:priority:timeoutCategory:](self, "sendResourceAtURL:metadata:priority:timeoutCategory:", v8, v9, 200, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)updateMailboxSelection:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 6, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  NNMKMessagesSyncServiceClientDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "messagesSyncServiceClient:didSendProtobufSuccessfullyWithIDSIdentifier:", self, v5);

}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  NNMKMessagesSyncServiceClientDelegate **p_delegate;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "messagesSyncServiceClient:didFailSendingProtobufWithIDSIdentifier:errorCode:", self, v7, a4);

}

- (void)connectivityChanged
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "messagesSyncServiceClientConnectivityDidChange:", self);

}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  NNMKProtoMessageStatusUpdates *v6;
  id WeakRetained;
  NNMKProtoBatchedFetchResult *v8;
  id v9;

  v9 = a3;
  switch(a4)
  {
    case 1uLL:
      v6 = -[NNMKProtoMessageStatusUpdates initWithData:]([NNMKProtoMessageStatusUpdates alloc], "initWithData:", v9);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceClient:didUpdateMessagesStatus:", self, v6);
      goto LABEL_12;
    case 2uLL:
      v6 = -[NNMKProtoMessageDeletions initWithData:]([NNMKProtoMessageDeletions alloc], "initWithData:", v9);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceClient:didDeleteMessages:", self, v6);
      goto LABEL_12;
    case 3uLL:
      v6 = -[NNMKProtoMessageAdditions initWithData:]([NNMKProtoMessageAdditions alloc], "initWithData:", v9);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceClient:didAddMessages:", self, v6);
      goto LABEL_12;
    case 5uLL:
      v6 = -[NNMKProtoMoreMessages initWithData:]([NNMKProtoMoreMessages alloc], "initWithData:", v9);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceClient:didFetchMoreMessages:", self, v6);
      goto LABEL_12;
    case 6uLL:
      v6 = -[NNMKProtoMoreMessagesForConversation initWithData:]([NNMKProtoMoreMessagesForConversation alloc], "initWithData:", v9);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceClient:didFetchMoreMessagesForConversation:", self, v6);
      goto LABEL_12;
    case 7uLL:
      v6 = objc_alloc_init(NNMKProtoCoalescedBatchedFetchResult);
      v8 = -[NNMKProtoBatchedFetchResult initWithData:]([NNMKProtoBatchedFetchResult alloc], "initWithData:", v9);
      -[NNMKProtoMessageStatusUpdates addFetchResults:](v6, "addFetchResults:", v8);

      goto LABEL_11;
    case 8uLL:
      v6 = -[NNMKProtoMailboxSelection initWithData:]([NNMKProtoMailboxSelection alloc], "initWithData:", v9);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceClient:didUpdateMailboxSelection:", self, v6);
      goto LABEL_12;
    case 9uLL:
      v6 = -[NNMKProtoInitialMessagesSyncBatch initWithData:]([NNMKProtoInitialMessagesSyncBatch alloc], "initWithData:", v9);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceClient:didSendInitialMessagesSync:", self, v6);
      goto LABEL_12;
    case 0xAuLL:
      v6 = -[NNMKProtoCoalescedBatchedFetchResult initWithData:]([NNMKProtoCoalescedBatchedFetchResult alloc], "initWithData:", v9);
LABEL_11:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messagesSyncServiceClient:didReceivedCoalescedBatchedFetchResult:", self, v6);
LABEL_12:

      break;
    default:
      break;
  }

}

- (NNMKMessagesSyncServiceClientDelegate)delegate
{
  return (NNMKMessagesSyncServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
