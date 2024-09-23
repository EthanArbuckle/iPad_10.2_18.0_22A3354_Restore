@implementation IMSyndicationActionPipelineParameter

- (IMSyndicationActionPipelineParameter)initWithDefusedSyndicationAction:(id)a3 idsTrustedData:(id)a4 pipelineResources:(id)a5
{
  id v7;
  id v8;
  IMSyndicationActionPipelineParameter *v9;
  int v10;
  int v11;
  uint64_t v12;
  NSString *messagePartGUID;
  NSUInteger v14;
  void *v15;
  uint64_t v16;
  NSString *groupID;
  uint64_t v18;
  NSString *currentGroupName;
  uint64_t v20;
  NSArray *participantIdentifiers;
  void *v22;
  uint64_t v23;
  NSString *fromIdentifier;
  void *v25;
  uint64_t v26;
  NSString *toIdentifier;
  NSArray *v28;
  IMSyndicationActionPipelineParameter *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSString *fromDisplayID;
  IMSyndicationActionPipelineParameter *v36;
  NSObject *v37;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[4];
  IMSyndicationActionPipelineParameter *v48;
  objc_super v49;

  v7 = a3;
  v8 = a4;
  v49.receiver = self;
  v49.super_class = (Class)IMSyndicationActionPipelineParameter;
  v9 = -[IMSyndicationActionPipelineParameter init](&v49, sel_init);
  if (!v9)
    goto LABEL_9;
  v10 = objc_msgSend(v7, "version");
  v9->_version = v10;
  v11 = (unsigned __int16)*MEMORY[0x1E0D393D8];
  if (v11 != v10)
  {
    IMLogHandleForCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_1D166657C(&v9->_version, v11, v37);

    goto LABEL_13;
  }
  v9->_actionType = objc_msgSend(v7, "actionType");
  v9->_encodedSyndicationStartDate = objc_msgSend(v7, "encodedSyndicationStartDate");
  v9->_itemType = objc_msgSend(v7, "itemType");
  objc_msgSend(v7, "messagePartGUID");
  v12 = objc_claimAutoreleasedReturnValue();
  messagePartGUID = v9->_messagePartGUID;
  v9->_messagePartGUID = (NSString *)v12;

  v9->_syndicatedMessagePartRange.location = objc_msgSend(v7, "syndicatedMessagePartRange");
  v9->_syndicatedMessagePartRange.length = v14;
  objc_msgSend(v7, "groupContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "groupID");
  v16 = objc_claimAutoreleasedReturnValue();
  groupID = v9->_groupID;
  v9->_groupID = (NSString *)v16;

  objc_msgSend(v15, "currentGroupName");
  v18 = objc_claimAutoreleasedReturnValue();
  currentGroupName = v9->_currentGroupName;
  v9->_currentGroupName = (NSString *)v18;

  objc_msgSend(v15, "participantDestinationIdentifiers");
  v20 = objc_claimAutoreleasedReturnValue();
  participantIdentifiers = v9->_participantIdentifiers;
  v9->_participantIdentifiers = (NSArray *)v20;

  v9->_isFromMe = objc_msgSend(v8, "isFromMe");
  objc_msgSend(v8, "fromIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "copy");
  fromIdentifier = v9->_fromIdentifier;
  v9->_fromIdentifier = (NSString *)v23;

  objc_msgSend(v8, "toIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "copy");
  toIdentifier = v9->_toIdentifier;
  v9->_toIdentifier = (NSString *)v26;

  v28 = v9->_participantIdentifiers;
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = sub_1D1467BEC;
  v47[3] = &unk_1E92294F8;
  v29 = v9;
  v48 = v29;
  -[NSArray __imArrayByFilteringWithBlock:](v28, "__imArrayByFilteringWithBlock:", v47);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_IDsFromURIs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSString _stripFZIDPrefix](v9->_fromIdentifier, "_stripFZIDPrefix");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](v9->_participantIdentifiers, "count") > 2 || !v9->_isFromMe || !objc_msgSend(v31, "count"))
    goto LABEL_8;
  if (objc_msgSend(v31, "count") != 1)
  {
    IMLogHandleForCategory();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_1D166654C(v39, v40, v41, v42, v43, v44, v45, v46);

LABEL_13:
    v36 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v31, "lastObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_stripFZIDPrefix");
  v34 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v34;
LABEL_8:
  fromDisplayID = v29->_fromDisplayID;
  v29->_fromDisplayID = (NSString *)v32;

LABEL_9:
  v36 = v9;
LABEL_14:

  return v36;
}

- (id)createSyndicationActionWithChat:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t actionType;
  int itemType;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  if (!v4)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1D1666608(v5, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)self->_encodedSyndicationStartDate);
  v5 = objc_claimAutoreleasedReturnValue();
  actionType = self->_actionType;
  itemType = self->_itemType;
  if (itemType == 2)
  {
    v18 = (actionType >> 2) & 1;
    v19 = objc_alloc(MEMORY[0x1E0D39748]);
    objc_msgSend(v4, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v19, "initWithChatGUID:syndicationStartDate:autoDonateMessages:", v9, v5, v18);
  }
  else
  {
    if (itemType != 1)
    {
      IMLogHandleForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1D1666638(itemType, v21);
      goto LABEL_13;
    }
    v8 = objc_alloc(MEMORY[0x1E0D39950]);
    objc_msgSend(v4, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:", v9, v5, actionType, self->_messagePartGUID, self->_syndicatedMessagePartRange.location, self->_syndicatedMessagePartRange.length);
  }
  v20 = (void *)v10;

  if (!v20)
  {
    IMLogHandleForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1D16666B0(v21, v22, v23, v24, v25, v26, v27, v28);
LABEL_13:

LABEL_14:
    v20 = 0;
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMSyndicationActionPipelineParameter syndicationAction](self, "syndicationAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMSyndicationActionPipelineParameter %p; OUTPUT syndicationAction = %@>"),
    self,
    v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (NSString)replicationSourceServiceName
{
  return 0;
}

- (void)setSyndicationAction:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationAction, a3);
}

- (IMSyndicationAction)syndicationAction
{
  return self->_syndicationAction;
}

- (IMDChat)chat
{
  return self->_chat;
}

- (void)setReplicationSourceServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)fromDisplayID
{
  return self->_fromDisplayID;
}

- (void)setFromDisplayID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)currentGroupName
{
  return self->_currentGroupName;
}

- (void)setCurrentGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (NSArray)participantIdentifiers
{
  return self->_participantIdentifiers;
}

- (void)setParticipantIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)encodedSyndicationStartDate
{
  return self->_encodedSyndicationStartDate;
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (NSString)messagePartGUID
{
  return self->_messagePartGUID;
}

- (_NSRange)syndicatedMessagePartRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_syndicatedMessagePartRange.length;
  location = self->_syndicatedMessagePartRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)actionType
{
  return self->_actionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagePartGUID, 0);
  objc_storeStrong((id *)&self->_participantIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentGroupName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_fromDisplayID, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_syndicationAction, 0);
}

@end
