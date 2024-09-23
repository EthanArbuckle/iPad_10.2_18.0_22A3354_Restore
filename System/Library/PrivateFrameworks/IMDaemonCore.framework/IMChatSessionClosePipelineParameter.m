@implementation IMChatSessionClosePipelineParameter

- (IMChatSessionClosePipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  id v7;
  IMChatSessionClosePipelineParameter *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *fromIdentifier;
  uint64_t v25;
  NSString *toIdentifier;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)IMChatSessionClosePipelineParameter;
  v8 = -[IMChatSessionClosePipelineParameter init](&v28, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v9, "timestamp");
    -[IMChatSessionClosePipelineParameter setIsEmergencySOS:](v8, "setIsEmergencySOS:", objc_msgSend(v6, "isEmergencySOS"));
    -[IMChatSessionClosePipelineParameter setDeleteConversation:](v8, "setDeleteConversation:", objc_msgSend(v6, "deleteConversation"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatSessionClosePipelineParameter setVersion:](v8, "setVersion:", v13);

    objc_msgSend(v6, "handle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatSessionClosePipelineParameter setSenderHandle:](v8, "setSenderHandle:", v14);

    objc_msgSend(v6, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatSessionClosePipelineParameter setSenderName:](v8, "setSenderName:", v15);

    objc_msgSend(v6, "conversationID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatSessionClosePipelineParameter setConversationID:](v8, "setConversationID:", v16);

    -[IMChatSessionClosePipelineParameter setGUID:](v8, "setGUID:", v11);
    v17 = objc_msgSend(v9, "has_timestamp");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    if ((v17 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatSessionClosePipelineParameter setTimestamp:](v8, "setTimestamp:", v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSince1970");
      objc_msgSend(v18, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatSessionClosePipelineParameter setTimestamp:](v8, "setTimestamp:", v20);

    }
    objc_msgSend(v9, "storageContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatSessionClosePipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", objc_msgSend(v21, "isFromStorage"));

    objc_msgSend(v9, "storageContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatSessionClosePipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", objc_msgSend(v22, "isLastFromStorage"));

    objc_msgSend(v7, "fromIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v23;

    objc_msgSend(v7, "toIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v25;

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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMChatSessionClosePipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatSessionClosePipelineParameter timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMChatSessionClosePipelineParameter isFromStorage](self, "isFromStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMChatSessionClosePipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatSessionClosePipelineParameter messageItems](self, "messageItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMChatSessionClosePipelineParameter %p> { guid: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, output messageItems: %lu}"), self, v4, v5, v6, v7, objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)replicationSourceServiceName
{
  return 0;
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

- (BOOL)isEmergencySOS
{
  return self->_isEmergencySOS;
}

- (void)setIsEmergencySOS:(BOOL)a3
{
  self->_isEmergencySOS = a3;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)deleteConversation
{
  return self->_deleteConversation;
}

- (void)setDeleteConversation:(BOOL)a3
{
  self->_deleteConversation = a3;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

@end
