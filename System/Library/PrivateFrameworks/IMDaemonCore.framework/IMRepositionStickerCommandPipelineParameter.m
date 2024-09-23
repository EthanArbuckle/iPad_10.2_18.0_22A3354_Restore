@implementation IMRepositionStickerCommandPipelineParameter

- (IMRepositionStickerCommandPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  id v7;
  IMRepositionStickerCommandPipelineParameter *v8;
  void *v9;
  uint64_t v10;
  NSString *fromIdentifier;
  uint64_t v12;
  NSString *toIdentifier;
  void *v14;
  uint64_t v15;
  NSString *GUID;
  uint64_t v17;
  BlastDoorStickerAttachmentInfo *stickerAttachmentInfo;
  uint64_t v19;
  NSString *stickerEditedMessageGuid;
  void *v21;
  void *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)IMRepositionStickerCommandPipelineParameter;
  v8 = -[IMRepositionStickerCommandPipelineParameter init](&v24, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fromIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v10;

    objc_msgSend(v7, "toIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v12;

    objc_msgSend(v9, "messageGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    GUID = v8->_GUID;
    v8->_GUID = (NSString *)v15;

    objc_msgSend(v6, "stickerMetadata");
    v17 = objc_claimAutoreleasedReturnValue();
    stickerAttachmentInfo = v8->_stickerAttachmentInfo;
    v8->_stickerAttachmentInfo = (BlastDoorStickerAttachmentInfo *)v17;

    objc_msgSend(v6, "stickerEditedMessageGUID");
    v19 = objc_claimAutoreleasedReturnValue();
    stickerEditedMessageGuid = v8->_stickerEditedMessageGuid;
    v8->_stickerEditedMessageGuid = (NSString *)v19;

    objc_msgSend(v9, "storageContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isFromStorage = objc_msgSend(v21, "isFromStorage");

    objc_msgSend(v9, "storageContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isLastFromStorage = objc_msgSend(v22, "isLastFromStorage");

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMRepositionStickerCommandPipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRepositionStickerCommandPipelineParameter stickerEditedMessageGuid](self, "stickerEditedMessageGuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("YES");
  if (-[IMRepositionStickerCommandPipelineParameter isFromStorage](self, "isFromStorage"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (!-[IMRepositionStickerCommandPipelineParameter isLastFromStorage](self, "isLastFromStorage"))
    v6 = CFSTR("NO");
  -[IMRepositionStickerCommandPipelineParameter chat](self, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMRepositionStickerCommandPipelineParameter %p; GUID = %@; stickerEditedMessageGUID = %@; isFromStorage = %@; isLastFromStorage = %@; OUTPUT chat = %@;"),
    self,
    v4,
    v5,
    v7,
    v6,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)GUID
{
  return self->_GUID;
}

- (BOOL)isFromStorage
{
  return self->_isFromStorage;
}

- (BOOL)isLastFromStorage
{
  return self->_isLastFromStorage;
}

- (NSString)replicationSourceServiceName
{
  return self->_replicationSourceServiceName;
}

- (void)setReplicationSourceServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (IMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (IMDServiceSession)serviceSession
{
  return self->_serviceSession;
}

- (void)setServiceSession:(id)a3
{
  objc_storeStrong((id *)&self->_serviceSession, a3);
}

- (BlastDoorStickerAttachmentInfo)stickerAttachmentInfo
{
  return self->_stickerAttachmentInfo;
}

- (NSString)stickerEditedMessageGuid
{
  return self->_stickerEditedMessageGuid;
}

- (NSArray)messageItems
{
  return self->_messageItems;
}

- (void)setMessageItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (IMDChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_stickerEditedMessageGuid, 0);
  objc_storeStrong((id *)&self->_stickerAttachmentInfo, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
}

@end
