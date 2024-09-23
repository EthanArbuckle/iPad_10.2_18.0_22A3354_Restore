@implementation IMRecoverJunkCommandPipelineParameter

- (IMRecoverJunkCommandPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  id v7;
  IMRecoverJunkCommandPipelineParameter *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *GUID;
  char v13;
  void *v14;
  uint64_t v15;
  void *timestamp;
  uint64_t v17;
  NSNumber *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *fromIdentifier;
  uint64_t v23;
  NSString *toIdentifier;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)IMRecoverJunkCommandPipelineParameter;
  v8 = -[IMRecoverJunkCommandPipelineParameter init](&v26, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    GUID = v8->_GUID;
    v8->_GUID = (NSString *)v11;

    v13 = objc_msgSend(v9, "has_timestamp");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    if ((v13 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "timestamp"));
      v15 = objc_claimAutoreleasedReturnValue();
      timestamp = v8->_timestamp;
      v8->_timestamp = (NSNumber *)v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      timestamp = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(timestamp, "timeIntervalSince1970");
      objc_msgSend(v14, "numberWithDouble:");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v8->_timestamp;
      v8->_timestamp = (NSNumber *)v17;

    }
    v8->_isFromMe = objc_msgSend(v7, "isFromMe");
    objc_msgSend(v9, "storageContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isFromStorage = objc_msgSend(v19, "isFromStorage");

    objc_msgSend(v9, "storageContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isLastFromStorage = objc_msgSend(v20, "isLastFromStorage");

    objc_msgSend(v7, "fromIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v21;

    objc_msgSend(v7, "toIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v23;

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
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMRecoverJunkCommandPipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRecoverJunkCommandPipelineParameter timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("YES");
  if (-[IMRecoverJunkCommandPipelineParameter isFromStorage](self, "isFromStorage"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[IMRecoverJunkCommandPipelineParameter isLastFromStorage](self, "isLastFromStorage"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!-[IMRecoverJunkCommandPipelineParameter isFromMe](self, "isFromMe"))
    v6 = CFSTR("NO");
  -[IMRecoverJunkCommandPipelineParameter chat](self, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMRecoverJunkCommandPipelineParameter %p; GUID = %@; timestamp = %@; isFromStorage = %@; isLastFromStorage = %@; isFromMe = %@; OUTPUT chat = %@;"),
    self,
    v4,
    v5,
    v7,
    v8,
    v6,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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

- (NSArray)messageItems
{
  return self->_messageItems;
}

- (void)setMessageItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
}

@end
