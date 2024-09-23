@implementation NNMKFetchesSyncServiceServer

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NNMKFetchesSyncServiceServer)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NNMKFetchesSyncServiceServer;
  return -[NNMKSyncServiceEndpoint initWithIDSServiceName:queue:](&v4, sel_initWithIDSServiceName_queue_, CFSTR("com.apple.private.alloy.mail.fetches"), a3);
}

- (void)requestPrepareForFullSync:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v5, 1, 200, 2, 0);

}

- (void)warnErrorDownloadingContentForMessage:(id)a3 notificationPriority:(BOOL)a4 userRequested:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

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
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v11, 3, v9, 2, v6 | v5);

}

- (void)notifyOldMessagesAvailable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  objc_msgSend(&unk_24FA10C88, "stringValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:repeatPreventionId:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:repeatPreventionId:timeoutCategory:allowCloudDelivery:", v5, 4, 200, v7, 2, 0);
}

- (void)notifyFetchRequestCompleted:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v5, 5, 200, 2, 0);

}

- (id)reportComposedMessageSendingProgress:(id)a3
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
  NNMKFetchesSyncServiceServerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:", self, v5);

}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  NNMKFetchesSyncServiceServerDelegate **p_delegate;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didFailSendingProtobufWithIDSIdentifier:errorCode:", self, v7, a4);

}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  NNMKProtoFetchRequest *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  switch(a4)
  {
    case 1uLL:
      v6 = -[NNMKProtoFetchRequest initWithData:]([NNMKProtoFetchRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didRequestFetch:", self, v6);
      goto LABEL_12;
    case 2uLL:
      v6 = -[NNMKProtoMoreMessagesRequest initWithData:]([NNMKProtoMoreMessagesRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didRequestMoreMessages:", self, v6);
      goto LABEL_12;
    case 3uLL:
      v6 = -[NNMKProtoMoreMessagesForConversationRequest initWithData:]([NNMKProtoMoreMessagesForConversationRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didRequestMoreMessagesForConversation:", self, v6);
      goto LABEL_12;
    case 4uLL:
      v6 = -[NNMKProtoContentRequest initWithData:]([NNMKProtoContentRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didRequestContent:", self, v6);
      goto LABEL_12;
    case 5uLL:
      v6 = -[NNMKProtoFullSyncRequest initWithData:]([NNMKProtoFullSyncRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didRequestFullSync:", self, v6);
      goto LABEL_12;
    case 6uLL:
      v6 = -[NNMKProtoInitialSyncFinishedNotification initWithData:]([NNMKProtoInitialSyncFinishedNotification alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didNotifyInitialSyncFinished:", self, v6);
      goto LABEL_12;
    case 8uLL:
      v6 = -[NNMKProtoHaltSyncRequest initWithData:]([NNMKProtoHaltSyncRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didRequestHaltSync:", self, v6);
      goto LABEL_12;
    case 9uLL:
      v6 = -[NNMKProtoMoreMessagesBatchRequest initWithData:]([NNMKProtoMoreMessagesBatchRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didRequestMoreMessagesInBatch:", self, v6);
      goto LABEL_12;
    case 0xAuLL:
      v6 = -[NNMKProtoFetchBatchRequest initWithData:]([NNMKProtoFetchBatchRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didRequestFetchInBatch:", self, v6);
      goto LABEL_12;
    case 0xBuLL:
      v6 = -[NNMKProtoWebKitStatusNotification initWithData:]([NNMKProtoWebKitStatusNotification alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceServer:didNotifyAboutWebKitStatus:", self, v6);
LABEL_12:

      break;
    default:
      break;
  }

}

- (NNMKFetchesSyncServiceServerDelegate)delegate
{
  return (NNMKFetchesSyncServiceServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
