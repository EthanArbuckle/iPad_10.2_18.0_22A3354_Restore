@implementation IMDiMessagePipelineResources

- (IMDiMessagePipelineResources)initWithIMDAccount:(id)a3 service:(id)a4 messageStore:(id)a5 storageController:(id)a6 broadcaster:(id)a7 recentsController:(id)a8 chatRegistry:(id)a9 attachmentStore:(id)a10
{
  id v17;
  IMDiMessagePipelineResources *v18;
  IMDiMessagePipelineResources *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)IMDiMessagePipelineResources;
  v18 = -[IMDiMessagePipelineResources init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imdAccount, a3);
    objc_storeStrong((id *)&v19->_service, a4);
    objc_storeStrong((id *)&v19->_messageStore, a5);
    objc_storeStrong((id *)&v19->_storageController, a6);
    objc_storeStrong((id *)&v19->_broadcaster, a7);
    objc_storeStrong((id *)&v19->_recentsController, a8);
    objc_storeStrong((id *)&v19->_chatRegistry, a9);
    objc_storeStrong((id *)&v19->_attachmentStore, a10);
  }

  return v19;
}

- (IMDAccount)imdAccount
{
  return self->_imdAccount;
}

- (IDSService)service
{
  return self->_service;
}

- (IMDMessageStore)messageStore
{
  return self->_messageStore;
}

- (IMDMessageFromStorageController)storageController
{
  return self->_storageController;
}

- (IMDaemonListenerProtocol)broadcaster
{
  return self->_broadcaster;
}

- (IMDRecentsController)recentsController
{
  return self->_recentsController;
}

- (IMDChatRegistry)chatRegistry
{
  return self->_chatRegistry;
}

- (IMDAttachmentStore)attachmentStore
{
  return self->_attachmentStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentStore, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_storeStrong((id *)&self->_broadcaster, 0);
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_imdAccount, 0);
}

@end
