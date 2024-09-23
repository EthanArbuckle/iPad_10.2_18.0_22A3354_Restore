@implementation NNMKFetchesSyncServiceClient

- (NNMKFetchesSyncServiceClient)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NNMKFetchesSyncServiceClient;
  return -[NNMKSyncServiceEndpoint initWithIDSServiceName:queue:](&v4, sel_initWithIDSServiceName_queue_, CFSTR("com.apple.private.alloy.mail.fetches"), a3);
}

- (id)requestFetch:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeout:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeout:allowCloudDelivery:", v4, 10, 200, 1, 20.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)requestMoreMessagesInBatch:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 9, 200, 2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)requestMoreMessagesForConversation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v5, "conversationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beforeDateReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%lu-%@-%@"), 3, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:repeatPreventionId:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:repeatPreventionId:timeoutCategory:allowCloudDelivery:", v8, 3, 200, v10, 2, 1);
}

- (id)requestContent:(id)a3 highPriority:(BOOL)a4
{
  void *v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  v7 = objc_msgSend(v6, "highPriority");
  objc_msgSend(v6, "messageId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%lu-%d-%@"), 4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:repeatPreventionId:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:repeatPreventionId:timeoutCategory:allowCloudDelivery:", v10, 4, 200, v9, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)requestFullSync:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 5, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)requestHaltSync:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 8, 200, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)notifyInitialSyncFinished:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 6, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)notifyCompanionAboutWebKitStatus:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v4, 11, 200, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  NNMKFetchesSyncServiceClientDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "fetchesSyncServiceClient:didSendProtobufSuccessfullyWithIDSIdentifier:", self, v5);

}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  NNMKFetchesSyncServiceClientDelegate **p_delegate;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "fetchesSyncServiceClient:didFailSendingProtobufWithIDSIdentifier:errorCode:", self, v7, a4);

}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  NNMKProtoPrepareForFullSyncRequest *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  switch(a4)
  {
    case 1uLL:
      v6 = -[NNMKProtoPrepareForFullSyncRequest initWithData:]([NNMKProtoPrepareForFullSyncRequest alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceClient:didRequestPrepareForFullSync:", self, v6);
      goto LABEL_7;
    case 3uLL:
      v6 = -[NNMKProtoErrorDownloadingContentForMessageWarning initWithData:]([NNMKProtoErrorDownloadingContentForMessageWarning alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceClient:didWarnErrorDownloadingContentForMessage:", self, v6);
      goto LABEL_7;
    case 4uLL:
      v6 = -[NNMKProtoOldMessagesAvailableNotification initWithData:]([NNMKProtoOldMessagesAvailableNotification alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceClient:didNotifyOldMessagesAvailable:", self, v6);
      goto LABEL_7;
    case 5uLL:
      v6 = -[NNMKProtoFetchRequestCompletedNotification initWithData:]([NNMKProtoFetchRequestCompletedNotification alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceClient:didNotifyFetchRequestCompleted:", self, v6);
      goto LABEL_7;
    case 6uLL:
      v6 = -[NNMKProtoComposedMessageSendingProgressReport initWithData:]([NNMKProtoComposedMessageSendingProgressReport alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "fetchesSyncServiceClient:didReportComposedMessageSendingProgress:", self, v6);
LABEL_7:

      break;
    default:
      break;
  }

}

- (NNMKFetchesSyncServiceClientDelegate)delegate
{
  return (NNMKFetchesSyncServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
