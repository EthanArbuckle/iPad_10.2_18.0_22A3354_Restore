@implementation NNMKMessageContentSyncServiceClient

- (NNMKMessageContentSyncServiceClient)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NNMKMessageContentSyncServiceClient;
  return -[NNMKSyncServiceEndpoint initWithIDSServiceName:queue:](&v4, sel_initWithIDSServiceName_queue_, CFSTR("com.apple.private.alloy.mail.sync.content"), a3);
}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  NNMKProtoInitialContentSyncCompletedNotification *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  switch(a4)
  {
    case 3uLL:
      v6 = -[NNMKProtoInitialContentSyncCompletedNotification initWithData:]([NNMKProtoInitialContentSyncCompletedNotification alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messageContentSyncServiceClient:didNotifyInitialContentSyncCompleted:", self, v6);
      goto LABEL_7;
    case 2uLL:
      v6 = -[NNMKProtoAttachmentSync initWithData:]([NNMKProtoAttachmentSync alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messageContentSyncServiceClient:didSyncAttachment:", self, v6);
      goto LABEL_7;
    case 1uLL:
      v6 = -[NNMKProtoMessageContentSync initWithData:]([NNMKProtoMessageContentSync alloc], "initWithData:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "messageContentSyncServiceClient:didSyncMessageContent:", self, v6);
LABEL_7:

      break;
  }

}

- (NNMKMessageContentSyncServiceClientDelegate)delegate
{
  return (NNMKMessageContentSyncServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
