@implementation IMCrossServiceAssociationMessagePipelineParameter

- (IMCrossServiceAssociationMessagePipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  id v7;
  IMCrossServiceAssociationMessagePipelineParameter *v8;
  IMCrossServiceAssociationMessagePipelineParameter *v9;
  NSString *replicationSourceServiceName;
  uint64_t v11;
  NSString *toIdentifier;
  uint64_t v13;
  NSString *fromIdentifier;
  void *v15;
  uint64_t v16;
  NSString *fromDisplayID;
  NSString *groupID;
  NSString *currentGroupName;
  NSArray *participantIdentifiers;
  void *v21;
  uint64_t v22;
  NSString *replacementGUID;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *GUID;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)IMCrossServiceAssociationMessagePipelineParameter;
  v8 = -[IMCrossServiceAssociationMessagePipelineParameter init](&v33, sel_init);
  v9 = v8;
  if (v8)
  {
    replicationSourceServiceName = v8->_replicationSourceServiceName;
    v8->_replicationSourceServiceName = 0;

    objc_msgSend(v7, "toIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    toIdentifier = v9->_toIdentifier;
    v9->_toIdentifier = (NSString *)v11;

    objc_msgSend(v7, "fromIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    fromIdentifier = v9->_fromIdentifier;
    v9->_fromIdentifier = (NSString *)v13;

    v9->_isFromMe = objc_msgSend(v7, "isFromMe");
    -[IMCrossServiceAssociationMessagePipelineParameter fromIdentifier](v9, "fromIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_stripFZIDPrefix");
    v16 = objc_claimAutoreleasedReturnValue();
    fromDisplayID = v9->_fromDisplayID;
    v9->_fromDisplayID = (NSString *)v16;

    groupID = v9->_groupID;
    v9->_groupID = 0;

    currentGroupName = v9->_currentGroupName;
    v9->_currentGroupName = 0;

    participantIdentifiers = v9->_participantIdentifiers;
    v9->_participantIdentifiers = 0;

    v9->_crossServiceDeduplicationMechanism = 1;
    objc_msgSend(v6, "replacementGUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = objc_claimAutoreleasedReturnValue();
    replacementGUID = v9->_replacementGUID;
    v9->_replacementGUID = (NSString *)v22;

    objc_msgSend(v6, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "messageGUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = objc_claimAutoreleasedReturnValue();
    GUID = v9->_GUID;
    v9->_GUID = (NSString *)v26;

    objc_msgSend(v6, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "storageContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isFromStorage = objc_msgSend(v29, "isFromStorage");

    objc_msgSend(v6, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "storageContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isLastFromStorage = objc_msgSend(v31, "isLastFromStorage");

  }
  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<IMCrossServiceAssociationMessagePipelineParameter %p> { guid: %@, replacementGUID: %@ }"), self, self->_GUID, self->_replacementGUID);
}

- (NSString)replicationSourceServiceName
{
  return self->_replicationSourceServiceName;
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
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

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (NSString)fromDisplayID
{
  return self->_fromDisplayID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSString)currentGroupName
{
  return self->_currentGroupName;
}

- (NSArray)participantIdentifiers
{
  return self->_participantIdentifiers;
}

- (IMDChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (NSString)replacementGUID
{
  return self->_replacementGUID;
}

- (unint64_t)crossServiceDeduplicationMechanism
{
  return self->_crossServiceDeduplicationMechanism;
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

- (NSArray)messageItems
{
  return self->_messageItems;
}

- (void)setMessageItems:(id)a3
{
  objc_storeStrong((id *)&self->_messageItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_replacementGUID, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_participantIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentGroupName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_fromDisplayID, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
}

@end
