@implementation IMNotifyRecipientCommandPipelineParameter

- (IMNotifyRecipientCommandPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  IMNotifyRecipientCommandPipelineParameter *v19;

  v6 = a4;
  objc_msgSend(a3, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v7, "has_timestamp");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "timestamp"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "storageContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isFromStorage");

  objc_msgSend(v7, "storageContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isLastFromStorage");

  v19 = -[IMNotifyRecipientCommandPipelineParameter initWithIdsTrustedData:GUID:timestamp:isFromStorage:isLastFromStorage:](self, "initWithIdsTrustedData:GUID:timestamp:isFromStorage:isLastFromStorage:", v6, v10, v13, v16, v18);
  return v19;
}

- (IMNotifyRecipientCommandPipelineParameter)initWithIdsTrustedData:(id)a3 GUID:(id)a4 timestamp:(id)a5 isFromStorage:(BOOL)a6 isLastFromStorage:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  IMNotifyRecipientCommandPipelineParameter *v15;
  uint64_t v16;
  IMDiMessageIDSTrustedData *idsTrustedData;
  uint64_t v18;
  NSString *GUID;
  uint64_t v20;
  NSNumber *timestamp;
  uint64_t v22;
  NSString *fromIdentifier;
  uint64_t v24;
  NSString *toIdentifier;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)IMNotifyRecipientCommandPipelineParameter;
  v15 = -[IMNotifyRecipientCommandPipelineParameter init](&v27, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    idsTrustedData = v15->_idsTrustedData;
    v15->_idsTrustedData = (IMDiMessageIDSTrustedData *)v16;

    v18 = objc_msgSend(v13, "copy");
    GUID = v15->_GUID;
    v15->_GUID = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    timestamp = v15->_timestamp;
    v15->_timestamp = (NSNumber *)v20;

    v15->_isFromStorage = a6;
    v15->_isLastFromStorage = a7;
    objc_msgSend(v12, "fromIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    fromIdentifier = v15->_fromIdentifier;
    v15->_fromIdentifier = (NSString *)v22;

    objc_msgSend(v12, "toIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    toIdentifier = v15->_toIdentifier;
    v15->_toIdentifier = (NSString *)v24;

  }
  return v15;
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
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMNotifyRecipientCommandPipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNotifyRecipientCommandPipelineParameter timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMNotifyRecipientCommandPipelineParameter isFromStorage](self, "isFromStorage"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[IMNotifyRecipientCommandPipelineParameter isLastFromStorage](self, "isLastFromStorage"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[IMNotifyRecipientCommandPipelineParameter idsTrustedData](self, "idsTrustedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNotifyRecipientCommandPipelineParameter chat](self, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNotifyRecipientCommandPipelineParameter messageItems](self, "messageItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMNotifyRecipientCommandPipelineParameter %p; GUID = %@; timestamp = %@; isFromStorage = %@; isLastFromStorage = %@; idsTrustedData = %@; OUTPUT chat = %@; numMessageItems = %lu}"),
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (IMDiMessageIDSTrustedData)idsTrustedData
{
  return self->_idsTrustedData;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (BOOL)isFromStorage
{
  return self->_isFromStorage;
}

- (BOOL)isLastFromStorage
{
  return self->_isLastFromStorage;
}

- (NSArray)messageItems
{
  return self->_messageItems;
}

- (void)setMessageItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (IMDChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (NSString)replicationSourceServiceName
{
  return self->_replicationSourceServiceName;
}

- (void)setReplicationSourceServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_idsTrustedData, 0);
}

@end
