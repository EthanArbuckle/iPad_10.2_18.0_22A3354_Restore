@implementation MFDAMessageStoreSaveDraftRequest

- (MFDAMessageStoreSaveDraftRequest)initWithMessage:(id)a3 mailbox:(id)a4
{
  id v6;
  id v7;
  MFDADraftMessage *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MFDADraftMessage *v13;
  MFDAMessageStoreSaveDraftRequest *v14;
  uint64_t v15;
  NSString *messageIDHeader;
  uint64_t v17;
  NSString *folderID;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v8 = [MFDADraftMessage alloc];
  if (_nextClientID_onceToken != -1)
    dispatch_once(&_nextClientID_onceToken, &__block_literal_global_29);
  v9 = (id)_nextClientID___clientID;
  objc_sync_enter(v9);
  v10 = objc_msgSend((id)_nextClientID___clientID, "unsignedIntegerValue") + 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_nextClientID___clientID;
  _nextClientID___clientID = v11;

  objc_sync_exit(v9);
  v13 = -[MFDADraftMessage initWithMailMessage:clientID:](v8, "initWithMailMessage:clientID:", v6, v10);
  v20.receiver = self;
  v20.super_class = (Class)MFDAMessageStoreSaveDraftRequest;
  v14 = -[DADraftMessageRequest initWithRequestType:message:send:](&v20, sel_initWithRequestType_message_send_, 4, v13, 0);
  if (v14)
  {
    objc_msgSend(v6, "messageIDHeader");
    v15 = objc_claimAutoreleasedReturnValue();
    messageIDHeader = v14->_messageIDHeader;
    v14->_messageIDHeader = (NSString *)v15;

    v17 = objc_msgSend(v7, "copy");
    folderID = v14->_folderID;
    v14->_folderID = (NSString *)v17;

  }
  return v14;
}

- (unint64_t)generationNumber
{
  return 0;
}

- (BOOL)shouldSend
{
  return 1;
}

- (BOOL)isUserRequested
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_messageIDHeader, 0);
}

@end
