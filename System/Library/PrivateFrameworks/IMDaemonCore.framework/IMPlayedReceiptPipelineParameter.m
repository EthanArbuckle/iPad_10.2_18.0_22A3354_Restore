@implementation IMPlayedReceiptPipelineParameter

- (IMPlayedReceiptPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4 isFromDefaultPairedDevice:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  IMPlayedReceiptPipelineParameter *v21;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a3, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v9, "has_timestamp");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "timestamp"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSince1970");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "storageContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isFromStorage");

  objc_msgSend(v9, "storageContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isLastFromStorage");

  v21 = -[IMPlayedReceiptPipelineParameter initWithIdsTrustedData:GUID:timestamp:isFromStorage:isLastFromStorage:isFromDefaultPairedDevice:](self, "initWithIdsTrustedData:GUID:timestamp:isFromStorage:isLastFromStorage:isFromDefaultPairedDevice:", v8, v12, v15, v18, v20, v5);
  return v21;
}

- (IMPlayedReceiptPipelineParameter)initWithIdsTrustedData:(id)a3 GUID:(id)a4 timestamp:(id)a5 isFromStorage:(BOOL)a6 isLastFromStorage:(BOOL)a7 isFromDefaultPairedDevice:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  IMPlayedReceiptPipelineParameter *v17;
  uint64_t v18;
  IMDiMessageIDSTrustedData *idsTrustedData;
  uint64_t v20;
  NSString *GUID;
  uint64_t v22;
  NSNumber *timestamp;
  uint64_t v24;
  NSString *toIdentifier;
  uint64_t v26;
  NSString *fromIdentifier;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v29.receiver = self;
  v29.super_class = (Class)IMPlayedReceiptPipelineParameter;
  v17 = -[IMPlayedReceiptPipelineParameter init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    idsTrustedData = v17->_idsTrustedData;
    v17->_idsTrustedData = (IMDiMessageIDSTrustedData *)v18;

    v20 = objc_msgSend(v15, "copy");
    GUID = v17->_GUID;
    v17->_GUID = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    timestamp = v17->_timestamp;
    v17->_timestamp = (NSNumber *)v22;

    v17->_isFromStorage = a6;
    v17->_isLastFromStorage = a7;
    v17->_isFromDefaultPairedDevice = a8;
    objc_msgSend(v14, "toIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    toIdentifier = v17->_toIdentifier;
    v17->_toIdentifier = (NSString *)v24;

    objc_msgSend(v14, "fromIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    fromIdentifier = v17->_fromIdentifier;
    v17->_fromIdentifier = (NSString *)v26;

  }
  return v17;
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
  -[IMPlayedReceiptPipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPlayedReceiptPipelineParameter timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMPlayedReceiptPipelineParameter isFromStorage](self, "isFromStorage"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[IMPlayedReceiptPipelineParameter isLastFromStorage](self, "isLastFromStorage"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[IMPlayedReceiptPipelineParameter idsTrustedData](self, "idsTrustedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPlayedReceiptPipelineParameter chat](self, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPlayedReceiptPipelineParameter messageItems](self, "messageItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMPlayedReceiptPipelineParameter %p; GUID = %@; timestamp = %@; isFromStorage = %@; isLastFromStorage = %@; idsTrustedData = %@; OUTPUT chat = %@; numMessageItems = %lu}"),
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

- (BOOL)isFromDefaultPairedDevice
{
  return self->_isFromDefaultPairedDevice;
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
