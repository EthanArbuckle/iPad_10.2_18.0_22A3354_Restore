@implementation IMReadReceiptPipelineParameter

- (IMReadReceiptPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  id v7;
  IMReadReceiptPipelineParameter *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *fromIdentifier;
  uint64_t v21;
  NSString *toIdentifier;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)IMReadReceiptPipelineParameter;
  v8 = -[IMReadReceiptPipelineParameter init](&v24, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v9, "timestamp");
    -[IMReadReceiptPipelineParameter setGUID:](v8, "setGUID:", v11);
    v13 = objc_msgSend(v9, "has_timestamp");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    if ((v13 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMReadReceiptPipelineParameter setTimestamp:](v8, "setTimestamp:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSince1970");
      objc_msgSend(v14, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMReadReceiptPipelineParameter setTimestamp:](v8, "setTimestamp:", v16);

    }
    objc_msgSend(v9, "storageContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMReadReceiptPipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", objc_msgSend(v17, "isFromStorage"));

    objc_msgSend(v9, "storageContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMReadReceiptPipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", objc_msgSend(v18, "isLastFromStorage"));

    objc_msgSend(v7, "fromIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v19;

    objc_msgSend(v7, "toIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v21;

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
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMReadReceiptPipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMReadReceiptPipelineParameter timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMReadReceiptPipelineParameter isFromStorage](self, "isFromStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMReadReceiptPipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMReadReceiptPipelineParameter isFromMe](self, "isFromMe"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMReadReceiptPipelineParameter messageItems](self, "messageItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMReadReceiptPipelineParameter %p> { guid: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu}"), self, v4, v5, v6, v7, v8, objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (NSString)fromPushID
{
  return self->_fromPushID;
}

- (void)setFromPushID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isFromDefaultPairedDevice
{
  return self->_isFromDefaultPairedDevice;
}

- (void)setIsFromDefaultPairedDevice:(BOOL)a3
{
  self->_isFromDefaultPairedDevice = a3;
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

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
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
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_fromPushID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

@end
