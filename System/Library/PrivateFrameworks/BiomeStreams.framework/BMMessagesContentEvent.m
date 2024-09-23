@implementation BMMessagesContentEvent

- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 conversationId:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 suggestedNickname:(id)a10 suggestedPhotoPath:(id)a11 content:(id)a12 accountIdentifier:(id)a13 accountHandles:(id)a14 accountType:(id)a15 attachment:(id)a16 URL:(id)a17 contentProtection:(id)a18 isNew:(id)a19 isTwoFactorCode:(id)a20 isFromMe:(id)a21 isGroupThread:(id)a22 isJunk:(id)a23 isRead:(id)a24 isPinned:(id)a25 isBusinessChat:(id)a26 tapbackAssociatedMessageID:(id)a27 tapbackType:(id)a28 messageType:(id)a29 messagesService:(id)a30 messageEffect:(id)a31 isKnownSender:(id)a32 conversationUUID:(id)a33
{
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  BMMessagesContentEvent *v46;
  BMMessagesContentEvent *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v55;
  id v56;
  id v57;
  id v58;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  objc_super v83;

  v82 = a3;
  v55 = a4;
  v79 = a4;
  v56 = a5;
  v78 = a5;
  v57 = a7;
  v39 = a7;
  v58 = a8;
  v81 = a8;
  v77 = a9;
  v76 = a10;
  v75 = a11;
  v80 = a12;
  v74 = a13;
  v73 = a14;
  v72 = a15;
  v71 = a16;
  v70 = a17;
  v69 = a18;
  v68 = a19;
  v67 = a20;
  v66 = a21;
  v65 = a22;
  v40 = a23;
  v63 = a24;
  v61 = a25;
  v41 = a26;
  v42 = a27;
  v43 = a28;
  v44 = a29;
  v64 = a30;
  v62 = a31;
  v60 = a32;
  v45 = a33;
  if (v82)
  {
    if (v39)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMessagesContentEvent.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

    if (v39)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMessagesContentEvent.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conversationId"));

LABEL_3:
  if (!v81)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMessagesContentEvent.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromHandle"));

  }
  if (!v80)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMessagesContentEvent.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content"));

  }
  v83.receiver = self;
  v83.super_class = (Class)BMMessagesContentEvent;
  v46 = -[BMMessagesContentEvent init](&v83, sel_init);
  v47 = v46;
  if (v46)
  {
    objc_storeStrong((id *)&v46->_uniqueId, a3);
    objc_storeStrong((id *)&v47->_domainId, v55);
    objc_storeStrong((id *)&v47->_personaId, v56);
    v47->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v47->_conversationId, v57);
    objc_storeStrong((id *)&v47->_fromHandle, v58);
    objc_storeStrong((id *)&v47->_toHandles, a9);
    objc_storeStrong((id *)&v47->_suggestedNickname, a10);
    objc_storeStrong((id *)&v47->_suggestedPhotoPath, a11);
    objc_storeStrong((id *)&v47->_content, a12);
    objc_storeStrong((id *)&v47->_accountIdentifier, a13);
    objc_storeStrong((id *)&v47->_accountHandles, a14);
    objc_storeStrong((id *)&v47->_accountType, a15);
    objc_storeStrong((id *)&v47->_attachment, a16);
    objc_storeStrong((id *)&v47->_URL, a17);
    objc_storeStrong((id *)&v47->_contentProtection, a18);
    objc_storeStrong((id *)&v47->_isNew, a19);
    objc_storeStrong((id *)&v47->_isTwoFactorCode, a20);
    objc_storeStrong((id *)&v47->_isFromMe, a21);
    objc_storeStrong((id *)&v47->_isGroupThread, a22);
    objc_storeStrong((id *)&v47->_isJunk, a23);
    objc_storeStrong((id *)&v47->_isRead, a24);
    objc_storeStrong((id *)&v47->_isPinned, a25);
    objc_storeStrong((id *)&v47->_isBusinessChat, a26);
    objc_storeStrong((id *)&v47->_tapbackAssociatedMessageID, a27);
    objc_storeStrong((id *)&v47->_tapbackType, a28);
    objc_storeStrong((id *)&v47->_messageType, a29);
    objc_storeStrong((id *)&v47->_messagesService, a30);
    objc_storeStrong((id *)&v47->_messageEffect, a31);
    objc_storeStrong((id *)&v47->_isKnownSender, a32);
    objc_storeStrong((id *)&v47->_conversationUUID, a33);
  }

  return v47;
}

- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 conversationId:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 suggestedNickname:(id)a10 suggestedPhotoPath:(id)a11 content:(id)a12 accountIdentifier:(id)a13 accountHandles:(id)a14 accountType:(id)a15 attachment:(id)a16 URL:(id)a17 contentProtection:(id)a18 isNew:(id)a19 isTwoFactorCode:(id)a20 isFromMe:(id)a21 isGroupThread:(id)a22 isJunk:(id)a23 isRead:(id)a24 isPinned:(id)a25 isBusinessChat:(id)a26 tapbackAssociatedMessageID:(id)a27 tapbackType:(id)a28 messageType:(id)a29 messagesService:(id)a30
{
  return -[BMMessagesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", a3, a4, a5, a7, a8, a9, a6, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           0,
           0,
           0);
}

- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 conversationId:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 suggestedNickname:(id)a10 suggestedPhotoPath:(id)a11 content:(id)a12 accountIdentifier:(id)a13 accountHandles:(id)a14 accountType:(id)a15 attachment:(id)a16 URL:(id)a17 contentProtection:(id)a18
{
  return -[BMMessagesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:", a3, a4, a5, a7, a8, a9, a6, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 conversationId:(id)a6 fromHandle:(id)a7 toHandles:(id)a8 suggestedNickname:(id)a9 suggestedPhotoPath:(id)a10 content:(id)a11 accountIdentifier:(id)a12 accountHandles:(id)a13 accountType:(id)a14 attachment:(id)a15 URL:(id)a16 contentProtection:(id)a17
{
  return -[BMMessagesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:", a3, a4, 0, a6, a7, a8, a5, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 conversationId:(id)a6 fromHandle:(id)a7 toHandles:(id)a8 suggestedNickname:(id)a9 suggestedPhotoPath:(id)a10 content:(id)a11 accountIdentifier:(id)a12 accountHandles:(id)a13 accountType:(id)a14 attachment:(id)a15 URL:(id)a16
{
  return -[BMMessagesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:", a3, a4, 0, a6, a7, a8, a5, a9, a10, a11, a12, a13, a14, a15,
           a16,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMMessagesContentEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v2;
  void *v3;

  -[BMMessagesContentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMMessagesContentEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMMessagesContentEvent json].cold.1((uint64_t)v5, v6);

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMMessagesContentEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMMessagesContentEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMMessagesContentEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMMessagesContentEvent initWithProtoData:](self, "initWithProtoData:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMMessagesContentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMMessagesContentEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  BMNamedHandle *v8;
  uint64_t v9;
  void *v10;
  BMContentAttachment *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  BMMessagesContentEvent *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  BMContentAttachment *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  BMNamedHandle *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasUniqueId](v5, "hasUniqueId")
        && -[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp")
        && -[NSObject hasConversationId](v5, "hasConversationId")
        && -[NSObject hasFromHandle](v5, "hasFromHandle")
        && (-[NSObject hasContent](v5, "hasContent") & 1) != 0)
      {
        -[NSObject uniqueId](v5, "uniqueId");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject domainId](v5, "domainId");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject personaId](v5, "personaId");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        v7 = v6;
        -[NSObject conversationId](v5, "conversationId");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = [BMNamedHandle alloc];
        -[NSObject fromHandle](v5, "fromHandle");
        v9 = objc_claimAutoreleasedReturnValue();
        v73 = -[BMNamedHandle initWithProto:](v8, "initWithProto:", v9);
        -[NSObject toHandles](v5, "toHandles");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_3);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject suggestedNickname](v5, "suggestedNickname");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject suggestedPhotoPath](v5, "suggestedPhotoPath");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject content](v5, "content");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject accountIdentifier](v5, "accountIdentifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject accountHandles](v5, "accountHandles");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject accountType](v5, "accountType");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = [BMContentAttachment alloc];
        -[NSObject attachment](v5, "attachment");
        v12 = objc_claimAutoreleasedReturnValue();
        v65 = -[BMContentAttachment initWithProto:](v11, "initWithProto:", v12);
        -[NSObject url](v5, "url");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = objc_alloc(MEMORY[0x1E0C99E98]);
          -[NSObject url](v5, "url");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (void *)objc_msgSend(v14, "initWithString:");
        }
        else
        {
          v62 = 0;
        }
        -[NSObject contentProtection](v5, "contentProtection");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[NSObject hasIsNew](v5, "hasIsNew");
        if (v48)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isNew](v5, "isNew"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v61 = 0;
        }
        v47 = -[NSObject hasIsTwoFactorCode](v5, "hasIsTwoFactorCode");
        if (v47)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isTwoFactorCode](v5, "isTwoFactorCode"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v60 = 0;
        }
        v46 = -[NSObject hasIsFromMe](v5, "hasIsFromMe");
        if (v46)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isFromMe](v5, "isFromMe"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v59 = 0;
        }
        v45 = -[NSObject hasIsGroupThread](v5, "hasIsGroupThread");
        if (v45)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isGroupThread](v5, "isGroupThread"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v58 = 0;
        }
        v44 = -[NSObject hasIsJunk](v5, "hasIsJunk");
        if (v44)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isJunk](v5, "isJunk"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v57 = 0;
        }
        v43 = -[NSObject hasIsRead](v5, "hasIsRead");
        if (v43)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isRead](v5, "isRead"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v56 = 0;
        }
        v42 = -[NSObject hasIsPinned](v5, "hasIsPinned");
        if (v42)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isPinned](v5, "isPinned"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = 0;
        }
        v41 = -[NSObject hasIsBusinessChat](v5, "hasIsBusinessChat");
        if (v41)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isBusinessChat](v5, "isBusinessChat"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v54 = 0;
        }
        -[NSObject tapbackAssociatedMessageID](v5, "tapbackAssociatedMessageID");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v10;
        v52 = (void *)v9;
        v40 = -[NSObject hasTapbackType](v5, "hasTapbackType");
        if (v40)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSObject tapbackType](v5, "tapbackType"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v53 = 0;
        }
        -[NSObject messageType](v5, "messageType");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject messagesService](v5, "messagesService");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[NSObject hasMessageEffect](v5, "hasMessageEffect");
        v50 = (void *)v12;
        if (v34)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NSObject messageEffect](v5, "messageEffect"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = 0;
        }
        v36 = -[NSObject hasIsKnownSender](v5, "hasIsKnownSender");
        v49 = (void *)v13;
        if (v36)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isKnownSender](v5, "isKnownSender"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v37 = 0;
        }
        -[NSObject conversationUUID](v5, "conversationUUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        self = objc_retain(-[BMMessagesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", v77, v76, v75, v74, v73, v72, v7, v71, v70, v69, v68, v67, v66,
                   v65,
                   v62,
                   v64,
                   v61,
                   v60,
                   v59,
                   v58,
                   v57,
                   v56,
                   v55,
                   v54,
                   v63,
                   v53,
                   v32,
                   v33,
                   v35,
                   v37,
                   v38));

        if (v36)
        if (v34)

        if (v40)
        if (v41)

        if (v42)
        if (v43)

        if (v44)
        if (v45)

        if (v46)
        if (v47)

        if (v48)
        if (v49)
        {

        }
        v15 = self;
        goto LABEL_17;
      }
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[BMMessagesContentEvent initWithProto:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMMessagesContentEvent initWithProto:].cold.2(v5, v16, v17, v18, v19, v20, v21, v22);
    }
    v15 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

BMNamedHandle *__40__BMMessagesContentEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BMNamedHandle *v3;

  v2 = a2;
  v3 = -[BMNamedHandle initWithProto:]([BMNamedHandle alloc], "initWithProto:", v2);

  return v3;
}

- (BMMessagesContentEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBMessagesContentEvent *v5;
  BMMessagesContentEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBMessagesContentEvent initWithData:]([BMPBMessagesContentEvent alloc], "initWithData:", v4);

    self = -[BMMessagesContentEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v3 = (void *)objc_opt_new();
  -[BMMessagesContentEvent uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v4);

  -[BMMessagesContentEvent domainId](self, "domainId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDomainId:", v5);

  -[BMMessagesContentEvent personaId](self, "personaId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonaId:", v6);

  -[BMMessagesContentEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  -[BMMessagesContentEvent conversationId](self, "conversationId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConversationId:", v7);

  -[BMMessagesContentEvent fromHandle](self, "fromHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proto");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFromHandle:", v9);

  -[BMMessagesContentEvent toHandles](self, "toHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v3, "setToHandles:", v12);

  -[BMMessagesContentEvent suggestedNickname](self, "suggestedNickname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestedNickname:", v13);

  -[BMMessagesContentEvent suggestedPhotoPath](self, "suggestedPhotoPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestedPhotoPath:", v14);

  -[BMMessagesContentEvent content](self, "content");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContent:", v15);

  -[BMMessagesContentEvent accountIdentifier](self, "accountIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountIdentifier:", v16);

  -[BMMessagesContentEvent accountType](self, "accountType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountType:", v17);

  -[BMMessagesContentEvent accountHandles](self, "accountHandles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v3, "setAccountHandles:", v19);

  -[BMMessagesContentEvent attachment](self, "attachment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "proto");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttachment:", v21);

  -[BMMessagesContentEvent URL](self, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "absoluteString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUrl:", v23);

  -[BMMessagesContentEvent contentProtection](self, "contentProtection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentProtection:", v24);

  -[BMMessagesContentEvent isNew](self, "isNew");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[BMMessagesContentEvent isNew](self, "isNew");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsNew:", objc_msgSend(v26, "BOOLValue"));

  }
  -[BMMessagesContentEvent isTwoFactorCode](self, "isTwoFactorCode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[BMMessagesContentEvent isTwoFactorCode](self, "isTwoFactorCode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsTwoFactorCode:", objc_msgSend(v28, "BOOLValue"));

  }
  -[BMMessagesContentEvent isFromMe](self, "isFromMe");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[BMMessagesContentEvent isFromMe](self, "isFromMe");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsFromMe:", objc_msgSend(v30, "BOOLValue"));

  }
  -[BMMessagesContentEvent isGroupThread](self, "isGroupThread");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[BMMessagesContentEvent isGroupThread](self, "isGroupThread");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsGroupThread:", objc_msgSend(v32, "BOOLValue"));

  }
  -[BMMessagesContentEvent isJunk](self, "isJunk");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[BMMessagesContentEvent isJunk](self, "isJunk");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsJunk:", objc_msgSend(v34, "BOOLValue"));

  }
  -[BMMessagesContentEvent isRead](self, "isRead");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[BMMessagesContentEvent isRead](self, "isRead");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsRead:", objc_msgSend(v36, "BOOLValue"));

  }
  -[BMMessagesContentEvent isPinned](self, "isPinned");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[BMMessagesContentEvent isPinned](self, "isPinned");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsPinned:", objc_msgSend(v38, "BOOLValue"));

  }
  -[BMMessagesContentEvent isBusinessChat](self, "isBusinessChat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[BMMessagesContentEvent isBusinessChat](self, "isBusinessChat");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsBusinessChat:", objc_msgSend(v40, "BOOLValue"));

  }
  -[BMMessagesContentEvent tapbackAssociatedMessageID](self, "tapbackAssociatedMessageID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[BMMessagesContentEvent tapbackAssociatedMessageID](self, "tapbackAssociatedMessageID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTapbackAssociatedMessageID:", v42);

  }
  -[BMMessagesContentEvent tapbackType](self, "tapbackType");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[BMMessagesContentEvent tapbackType](self, "tapbackType");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTapbackType:", objc_msgSend(v44, "integerValue"));

  }
  -[BMMessagesContentEvent messageType](self, "messageType");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[BMMessagesContentEvent messageType](self, "messageType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMessageType:", v46);

  }
  -[BMMessagesContentEvent messagesService](self, "messagesService");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[BMMessagesContentEvent messagesService](self, "messagesService");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMessagesService:", v48);

  }
  -[BMMessagesContentEvent messageEffect](self, "messageEffect");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[BMMessagesContentEvent messageEffect](self, "messageEffect");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMessageEffect:", objc_msgSend(v50, "intValue"));

  }
  -[BMMessagesContentEvent isKnownSender](self, "isKnownSender");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    -[BMMessagesContentEvent isKnownSender](self, "isKnownSender");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsKnownSender:", objc_msgSend(v52, "BOOLValue"));

  }
  -[BMMessagesContentEvent conversationUUID](self, "conversationUUID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[BMMessagesContentEvent conversationUUID](self, "conversationUUID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setConversationUUID:", v54);

  }
  return v3;
}

uint64_t __31__BMMessagesContentEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_uniqueId, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSString hash](self->_conversationId, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMessagesContentEvent proto](self, "proto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proto");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (self->_uniqueId && self->_conversationId && self->_fromHandle && self->_toHandles && self->_content)
  {
    v7 = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (BMNamedHandle)fromHandle
{
  return self->_fromHandle;
}

- (NSArray)toHandles
{
  return self->_toHandles;
}

- (NSString)suggestedNickname
{
  return self->_suggestedNickname;
}

- (NSString)suggestedPhotoPath
{
  return self->_suggestedPhotoPath;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSArray)accountHandles
{
  return self->_accountHandles;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (BMContentAttachment)attachment
{
  return self->_attachment;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSNumber)isNew
{
  return self->_isNew;
}

- (NSNumber)isTwoFactorCode
{
  return self->_isTwoFactorCode;
}

- (NSNumber)isFromMe
{
  return self->_isFromMe;
}

- (NSNumber)isGroupThread
{
  return self->_isGroupThread;
}

- (NSNumber)isJunk
{
  return self->_isJunk;
}

- (NSNumber)isRead
{
  return self->_isRead;
}

- (NSNumber)isPinned
{
  return self->_isPinned;
}

- (NSNumber)isBusinessChat
{
  return self->_isBusinessChat;
}

- (NSString)tapbackAssociatedMessageID
{
  return self->_tapbackAssociatedMessageID;
}

- (NSNumber)tapbackType
{
  return self->_tapbackType;
}

- (NSString)messageType
{
  return self->_messageType;
}

- (NSString)messagesService
{
  return self->_messagesService;
}

- (NSNumber)messageEffect
{
  return self->_messageEffect;
}

- (NSNumber)isKnownSender
{
  return self->_isKnownSender;
}

- (NSString)conversationUUID
{
  return self->_conversationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationUUID, 0);
  objc_storeStrong((id *)&self->_isKnownSender, 0);
  objc_storeStrong((id *)&self->_messageEffect, 0);
  objc_storeStrong((id *)&self->_messagesService, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_tapbackType, 0);
  objc_storeStrong((id *)&self->_tapbackAssociatedMessageID, 0);
  objc_storeStrong((id *)&self->_isBusinessChat, 0);
  objc_storeStrong((id *)&self->_isPinned, 0);
  objc_storeStrong((id *)&self->_isRead, 0);
  objc_storeStrong((id *)&self->_isJunk, 0);
  objc_storeStrong((id *)&self->_isGroupThread, 0);
  objc_storeStrong((id *)&self->_isFromMe, 0);
  objc_storeStrong((id *)&self->_isTwoFactorCode, 0);
  objc_storeStrong((id *)&self->_isNew, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountHandles, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_suggestedPhotoPath, 0);
  objc_storeStrong((id *)&self->_suggestedNickname, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 2;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMMessagesContentEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMMessagesContentEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMMessagesContentEvent: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMMessagesContentEvent: tried to initialize with a non-BMMessagesContentEvent proto", a5, a6, a7, a8, 0);
}

@end
