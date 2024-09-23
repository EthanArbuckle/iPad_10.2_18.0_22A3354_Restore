@implementation IMEditMessageCommandPipelineParameter

- (IMEditMessageCommandPipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  int v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  IMEditMessageCommandPipelineParameter *v29;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  IMEditMessageCommandPipelineParameter *v34;
  id v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  void *v39;
  void *v40;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v10, "copy");

  v11 = objc_msgSend(v8, "has_timestamp");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "timestamp"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    objc_msgSend(v12, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "storageContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v14, "isFromStorage");

  v36 = v8;
  objc_msgSend(v8, "storageContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v15, "isLastFromStorage");

  objc_msgSend(v6, "editedMessageGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMEditMessageCommandPipelineParameter _existingFileTransfersForMessageGuid:](self, "_existingFileTransfersForMessageGuid:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v6, "editType");
  v19 = objc_msgSend(v6, "has_editedMessagePartIndex");
  if (v18)
    v20 = v19;
  else
    v20 = 0;
  if (v20 == 1)
  {
    v33 = objc_msgSend(v6, "editedMessagePartIndex");
    v32 = -[IMEditMessageCommandPipelineParameter _messageItemEditTypeForBlastdoorEditType:](self, "_messageItemEditTypeForBlastdoorEditType:", v18);
    v21 = objc_msgSend(v6, "shouldRetractSubject");
    objc_msgSend(v6, "editedMessagePartBody");
    v35 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "content");
    v34 = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMTextMessagePipelineParameter convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:supportingStickerAttributes:existingFileTransfersForMessage:](IMTextMessagePipelineParameter, "convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:supportingStickerAttributes:existingFileTransfersForMessage:", v23, 0, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "messageBodyWithNativeAttributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fileTransferGuids");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    self = v34;
    v28 = v32;
    v27 = v33;
    v7 = v35;
  }
  else
  {
    v27 = 0;
    v25 = 0;
    v26 = 0;
    v21 = 0;
    v28 = 1;
  }
  BYTE1(v31) = v20;
  LOBYTE(v31) = v21;
  v29 = -[IMEditMessageCommandPipelineParameter initWithIdsTrustedData:editCommandGUID:timestamp:isFromStorage:isLastFromStorage:editedMessageGUID:editedMessagePartIndex:editType:editedMessagePartBody:editedMessagePartFileTransferGUIDs:shouldRetractMessageSubject:hasEditTypeAndPartIndex:](self, "initWithIdsTrustedData:editCommandGUID:timestamp:isFromStorage:isLastFromStorage:editedMessageGUID:editedMessagePartIndex:editType:editedMessagePartBody:editedMessagePartFileTransferGUIDs:shouldRetractMessageSubject:hasEditTypeAndPartIndex:", v7, v40, v39, v38, v37, v16, v27, v28, v25, v26, v31);

  return v29;
}

- (IMEditMessageCommandPipelineParameter)initWithIdsTrustedData:(id)a3 editCommandGUID:(id)a4 timestamp:(id)a5 isFromStorage:(BOOL)a6 isLastFromStorage:(BOOL)a7 editedMessageGUID:(id)a8 editedMessagePartIndex:(int64_t)a9 editType:(unint64_t)a10 editedMessagePartBody:(id)a11 editedMessagePartFileTransferGUIDs:(id)a12 shouldRetractMessageSubject:(BOOL)a13 hasEditTypeAndPartIndex:(BOOL)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  IMEditMessageCommandPipelineParameter *v23;
  uint64_t v24;
  IMDiMessageIDSTrustedData *idsTrustedData;
  uint64_t v26;
  NSString *editCommandGUID;
  uint64_t v28;
  NSNumber *timestamp;
  uint64_t v30;
  NSString *fromIdentifier;
  uint64_t v32;
  NSString *toIdentifier;
  id v36;
  id v37;
  objc_super v38;

  v19 = a3;
  v37 = a4;
  v36 = a5;
  v20 = a8;
  v21 = a11;
  v22 = a12;
  v38.receiver = self;
  v38.super_class = (Class)IMEditMessageCommandPipelineParameter;
  v23 = -[IMEditMessageCommandPipelineParameter init](&v38, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v19, "copy");
    idsTrustedData = v23->_idsTrustedData;
    v23->_idsTrustedData = (IMDiMessageIDSTrustedData *)v24;

    v26 = objc_msgSend(v37, "copy");
    editCommandGUID = v23->_editCommandGUID;
    v23->_editCommandGUID = (NSString *)v26;

    v28 = objc_msgSend(v36, "copy");
    timestamp = v23->_timestamp;
    v23->_timestamp = (NSNumber *)v28;

    v23->_isFromStorage = a6;
    v23->_isLastFromStorage = a7;
    objc_storeStrong((id *)&v23->_editedMessageGUID, a8);
    v23->_editedMessagePartIndex = a9;
    v23->_editType = a10;
    objc_storeStrong((id *)&v23->_editedMessagePartBody, a11);
    objc_storeStrong((id *)&v23->_editedMessagePartFileTransferGUIDs, a12);
    v23->_shouldRetractMessageSubject = a13;
    v23->_hasEditTypeAndPartIndex = a14;
    objc_msgSend(v19, "fromIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();
    fromIdentifier = v23->_fromIdentifier;
    v23->_fromIdentifier = (NSString *)v30;

    objc_msgSend(v19, "toIdentifier");
    v32 = objc_claimAutoreleasedReturnValue();
    toIdentifier = v23->_toIdentifier;
    v23->_toIdentifier = (NSString *)v32;

  }
  return v23;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMEditMessageCommandPipelineParameter editCommandGUID](self, "editCommandGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMEditMessageCommandPipelineParameter editedMessageGUID](self, "editedMessageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMEditMessageCommandPipelineParameter timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMEditMessageCommandPipelineParameter isFromStorage](self, "isFromStorage"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[IMEditMessageCommandPipelineParameter isLastFromStorage](self, "isLastFromStorage"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[IMEditMessageCommandPipelineParameter idsTrustedData](self, "idsTrustedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMEditMessageCommandPipelineParameter chat](self, "chat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMEditMessageCommandPipelineParameter messageItems](self, "messageItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMEditMessageCommandPipelineParameter %p; editCommandGUID = %@; editedMessageGUID = %@; timestamp = %@; isFromStorage = %@; isLastFromStorage = %@; idsTrustedData = %@; OUTPUT chat = %@; numMessageItems = %lu}"),
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_createSuperFormattedStringWithAttributedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "__im_attributedStringByAssigningMessagePartNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = v4;

  return v6;
}

- (id)_existingFileTransfersForMessageGuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageWithGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileTransferGUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v6, "transferForGUID:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  return v15;
}

- (unint64_t)_messageItemEditTypeForBlastdoorEditType:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
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

- (NSString)editCommandGUID
{
  return self->_editCommandGUID;
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

- (NSString)editedMessageGUID
{
  return self->_editedMessageGUID;
}

- (int64_t)editedMessagePartIndex
{
  return self->_editedMessagePartIndex;
}

- (unint64_t)editType
{
  return self->_editType;
}

- (NSAttributedString)editedMessagePartBody
{
  return self->_editedMessagePartBody;
}

- (NSArray)editedMessagePartFileTransferGUIDs
{
  return self->_editedMessagePartFileTransferGUIDs;
}

- (BOOL)shouldRetractMessageSubject
{
  return self->_shouldRetractMessageSubject;
}

- (BOOL)hasEditTypeAndPartIndex
{
  return self->_hasEditTypeAndPartIndex;
}

- (NSArray)messageItems
{
  return self->_messageItems;
}

- (void)setMessageItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
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
  objc_storeStrong((id *)&self->_editedMessagePartFileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_editedMessagePartBody, 0);
  objc_storeStrong((id *)&self->_editedMessageGUID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_editCommandGUID, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_idsTrustedData, 0);
}

@end
