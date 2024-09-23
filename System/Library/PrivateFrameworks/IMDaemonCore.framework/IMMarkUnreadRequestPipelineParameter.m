@implementation IMMarkUnreadRequestPipelineParameter

- (IMMarkUnreadRequestPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  id v7;
  IMMarkUnreadRequestPipelineParameter *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *fromIdentifier;
  uint64_t v20;
  NSString *toIdentifier;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)IMMarkUnreadRequestPipelineParameter;
  v8 = -[IMMarkUnreadRequestPipelineParameter init](&v23, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMarkUnreadRequestPipelineParameter setGUID:](v8, "setGUID:", v11);

    v12 = objc_msgSend(v9, "has_timestamp");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    if ((v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "timestamp"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMarkUnreadRequestPipelineParameter setTimestamp:](v8, "setTimestamp:", v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSince1970");
      objc_msgSend(v13, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMarkUnreadRequestPipelineParameter setTimestamp:](v8, "setTimestamp:", v15);

    }
    -[IMMarkUnreadRequestPipelineParameter setIsFromMe:](v8, "setIsFromMe:", objc_msgSend(v7, "isFromMe"));
    objc_msgSend(v9, "storageContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMarkUnreadRequestPipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", objc_msgSend(v16, "isFromStorage"));

    objc_msgSend(v9, "storageContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMarkUnreadRequestPipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", objc_msgSend(v17, "isLastFromStorage"));

    objc_msgSend(v7, "fromIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v18;

    objc_msgSend(v7, "toIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v20;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMMarkUnreadRequestPipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMarkUnreadRequestPipelineParameter timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMarkUnreadRequestPipelineParameter messageItems](self, "messageItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMMarkUnreadRequestPipelineParameter %p> { guid: %@, timestamp: %@, output messageItems: %lu}"), self, v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (BOOL)isFromStorage
{
  return self->_isFromStorage;
}

- (void)setIsFromStorage:(BOOL)a3
{
  self->_isFromStorage = a3;
}

- (BOOL)isLastFromStorage
{
  return self->_isLastFromStorage;
}

- (void)setIsLastFromStorage:(BOOL)a3
{
  self->_isLastFromStorage = a3;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)messageItems
{
  return self->_messageItems;
}

- (void)setMessageItems:(id)a3
{
  objc_storeStrong((id *)&self->_messageItems, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

@end
