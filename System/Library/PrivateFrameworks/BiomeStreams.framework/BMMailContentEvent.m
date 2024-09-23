@implementation BMMailContentEvent

- (id)proto
{
  -[BMMailContentEvent _loadData](self, "_loadData");
  return self->_proto;
}

- (void)_inflateFromProto:(id)a3
{
  BMPBMailContentEvent *v5;
  BMNamedHandle *v6;
  void *v7;
  BMNamedHandle *v8;
  BMNamedHandle *fromHandle;
  BMNamedHandle *v10;
  void *v11;
  BMNamedHandle *v12;
  BMNamedHandle *replyTo;
  BMNamedHandle *v14;
  void *v15;
  BMNamedHandle *v16;
  BMNamedHandle *listId;
  void *v18;
  NSArray *v19;
  NSArray *toHandles;
  void *v21;
  NSArray *v22;
  NSArray *ccHandles;
  void *v24;
  NSArray *v25;
  NSArray *bccHandles;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSDictionary *headers;
  void *v43;
  uint64_t v44;
  NSArray *attachments;
  id v46;
  uint64_t v47;
  NSDate *dateReceived;
  uint64_t v49;
  NSNumber *mailCategories;
  uint64_t v51;
  NSNumber *isNew;
  uint64_t v53;
  NSNumber *isTwoFactorCode;
  uint64_t v55;
  NSNumber *isFromMe;
  uint64_t v57;
  NSNumber *isJunk;
  uint64_t v59;
  NSNumber *isRead;
  uint64_t v61;
  NSNumber *isVIP;
  uint64_t v63;
  NSNumber *isFlagged;
  BMPBMailContentEvent *proto;
  void *v66;
  BMPBMailContentEvent *v67;
  BMMailContentEvent *v68;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = (BMPBMailContentEvent *)a3;
  if (self->_proto)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMailContentEvent.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_proto == nil"));

  }
  v6 = [BMNamedHandle alloc];
  -[BMPBMailContentEvent fromHandle](v5, "fromHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMNamedHandle initWithProto:](v6, "initWithProto:", v7);
  fromHandle = self->_fromHandle;
  self->_fromHandle = v8;

  if (-[BMPBMailContentEvent hasReplyTo](v5, "hasReplyTo"))
  {
    v10 = [BMNamedHandle alloc];
    -[BMPBMailContentEvent replyTo](v5, "replyTo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BMNamedHandle initWithProto:](v10, "initWithProto:", v11);
    replyTo = self->_replyTo;
    self->_replyTo = v12;

  }
  if (-[BMPBMailContentEvent hasListId](v5, "hasListId"))
  {
    v14 = [BMNamedHandle alloc];
    -[BMPBMailContentEvent listId](v5, "listId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[BMNamedHandle initWithProto:](v14, "initWithProto:", v15);
    listId = self->_listId;
    self->_listId = v16;

  }
  -[BMPBMailContentEvent toHandles](v5, "toHandles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_18);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  toHandles = self->_toHandles;
  self->_toHandles = v19;

  -[BMPBMailContentEvent ccHandles](v5, "ccHandles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_pas_mappedArrayWithTransform:", &__block_literal_global_9_1);
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  ccHandles = self->_ccHandles;
  self->_ccHandles = v22;

  -[BMPBMailContentEvent bccHandles](v5, "bccHandles");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_pas_mappedArrayWithTransform:", &__block_literal_global_10);
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  bccHandles = self->_bccHandles;
  v68 = self;
  self->_bccHandles = v25;

  v27 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[BMPBMailContentEvent headers](v5, "headers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithCapacity:", objc_msgSend(v28, "count"));

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v67 = v5;
  -[BMPBMailContentEvent headers](v5, "headers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v71 != v32)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v35 = (void *)MEMORY[0x193FECFB4]();
        objc_msgSend(v34, "key");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "value");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_msgSend(v29, "objectForKeyedSubscript:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "arrayByAddingObject:", v37);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v40, v36);

        }
        else
        {
          v74 = v37;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v39, v36);
        }

        objc_autoreleasePoolPop(v35);
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    }
    while (v31);
  }

  v41 = objc_msgSend(v29, "copy");
  headers = v68->_headers;
  v68->_headers = (NSDictionary *)v41;

  -[BMPBMailContentEvent attachments](v67, "attachments");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "_pas_mappedArrayWithTransform:", &__block_literal_global_14);
  v44 = objc_claimAutoreleasedReturnValue();
  attachments = v68->_attachments;
  v68->_attachments = (NSArray *)v44;

  if (-[BMPBMailContentEvent hasDateReceived](v67, "hasDateReceived"))
  {
    v46 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[BMPBMailContentEvent dateReceived](v67, "dateReceived");
    v47 = objc_msgSend(v46, "initWithTimeIntervalSinceReferenceDate:");
    dateReceived = v68->_dateReceived;
    v68->_dateReceived = (NSDate *)v47;

  }
  if (-[BMPBMailContentEvent hasMailCategories](v67, "hasMailCategories"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPBMailContentEvent mailCategories](v67, "mailCategories"));
    v49 = objc_claimAutoreleasedReturnValue();
    mailCategories = v68->_mailCategories;
    v68->_mailCategories = (NSNumber *)v49;

  }
  if (-[BMPBMailContentEvent hasIsNew](v67, "hasIsNew"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPBMailContentEvent isNew](v67, "isNew"));
    v51 = objc_claimAutoreleasedReturnValue();
    isNew = v68->_isNew;
    v68->_isNew = (NSNumber *)v51;

  }
  if (-[BMPBMailContentEvent hasIsTwoFactorCode](v67, "hasIsTwoFactorCode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPBMailContentEvent isTwoFactorCode](v67, "isTwoFactorCode"));
    v53 = objc_claimAutoreleasedReturnValue();
    isTwoFactorCode = v68->_isTwoFactorCode;
    v68->_isTwoFactorCode = (NSNumber *)v53;

  }
  if (-[BMPBMailContentEvent hasIsFromMe](v67, "hasIsFromMe"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPBMailContentEvent isFromMe](v67, "isFromMe"));
    v55 = objc_claimAutoreleasedReturnValue();
    isFromMe = v68->_isFromMe;
    v68->_isFromMe = (NSNumber *)v55;

  }
  if (-[BMPBMailContentEvent hasIsJunk](v67, "hasIsJunk"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPBMailContentEvent isJunk](v67, "isJunk"));
    v57 = objc_claimAutoreleasedReturnValue();
    isJunk = v68->_isJunk;
    v68->_isJunk = (NSNumber *)v57;

  }
  if (-[BMPBMailContentEvent hasIsRead](v67, "hasIsRead"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPBMailContentEvent isRead](v67, "isRead"));
    v59 = objc_claimAutoreleasedReturnValue();
    isRead = v68->_isRead;
    v68->_isRead = (NSNumber *)v59;

  }
  if (-[BMPBMailContentEvent hasIsVIP](v67, "hasIsVIP"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPBMailContentEvent isVIP](v67, "isVIP"));
    v61 = objc_claimAutoreleasedReturnValue();
    isVIP = v68->_isVIP;
    v68->_isVIP = (NSNumber *)v61;

  }
  if (-[BMPBMailContentEvent hasIsFlagged](v67, "hasIsFlagged"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPBMailContentEvent isFlagged](v67, "isFlagged"));
    v63 = objc_claimAutoreleasedReturnValue();
    isFlagged = v68->_isFlagged;
    v68->_isFlagged = (NSNumber *)v63;

  }
  proto = v68->_proto;
  v68->_proto = v67;

}

BMNamedHandle *__40__BMMailContentEvent__inflateFromProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BMNamedHandle *v3;

  v2 = a2;
  v3 = -[BMNamedHandle initWithProto:]([BMNamedHandle alloc], "initWithProto:", v2);

  return v3;
}

BMNamedHandle *__40__BMMailContentEvent__inflateFromProto___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  BMNamedHandle *v3;

  v2 = a2;
  v3 = -[BMNamedHandle initWithProto:]([BMNamedHandle alloc], "initWithProto:", v2);

  return v3;
}

BMNamedHandle *__40__BMMailContentEvent__inflateFromProto___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  BMNamedHandle *v3;

  v2 = a2;
  v3 = -[BMNamedHandle initWithProto:]([BMNamedHandle alloc], "initWithProto:", v2);

  return v3;
}

BMContentAttachment *__40__BMMailContentEvent__inflateFromProto___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  BMContentAttachment *v3;

  v2 = a2;
  v3 = -[BMContentAttachment initWithProto:]([BMContentAttachment alloc], "initWithProto:", v2);

  return v3;
}

- (void)_loadData
{
  os_unfair_lock_s *p_protoLock;
  BMPBMailContentEvent *v4;
  void *v5;
  BMPBMailContentEvent *v6;
  NSData *data;
  BMPBMailContentEvent *v8;
  BMPBMailContentEvent *v9;

  p_protoLock = &self->_protoLock;
  os_unfair_lock_lock(&self->_protoLock);
  v4 = self->_proto;
  if (!v4)
  {
    if (self->_data)
    {
      v5 = (void *)MEMORY[0x193FECFB4]();
      v6 = -[BMPBMailContentEvent initWithData:]([BMPBMailContentEvent alloc], "initWithData:", self->_data);
      v9 = v6;
      if (v6)
      {
        -[BMMailContentEvent _inflateFromProto:](self, "_inflateFromProto:", v6);
      }
      else
      {
        data = self->_data;
        self->_data = 0;

      }
      objc_autoreleasePoolPop(v5);
      v4 = v9;
    }
    else
    {
      v4 = 0;
    }
  }
  v8 = v4;
  os_unfair_lock_unlock(p_protoLock);

}

- (id)_initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMMailContentEvent *v11;
  BMMailContentEvent *v12;
  uint64_t v13;
  NSString *uniqueId;
  uint64_t v15;
  NSString *domainId;
  uint64_t v17;
  NSString *personaId;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BMMailContentEvent;
  v11 = -[BMMailContentEvent init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_protoLock._os_unfair_lock_opaque = 0;
    v13 = objc_msgSend(v8, "copy");
    uniqueId = v12->_uniqueId;
    v12->_uniqueId = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    domainId = v12->_domainId;
    v12->_domainId = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    personaId = v12->_personaId;
    v12->_personaId = (NSString *)v17;

  }
  return v12;
}

- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 accountIdentifier:(id)a7 messageIdentifier:(id)a8 fromHandle:(id)a9 toHandles:(id)a10 ccHandles:(id)a11 bccHandles:(id)a12 headers:(id)a13 subject:(id)a14 htmlContent:(id)a15 textContent:(id)a16 isFullyDownloaded:(BOOL)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listId:(id)a22 accountType:(id)a23 attachments:(id)a24 contentProtection:(id)a25 conversationId:(id)a26 dateReceived:(id)a27 mailCategories:(id)a28 isNew:(id)a29 isTwoFactorCode:(id)a30 isFromMe:(id)a31 isJunk:(id)a32 isRead:(id)a33 isVIP:(id)a34 isFlagged:(id)a35
{
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  BMMailContentEvent *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v86;
  id v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v112;
  id v113;
  _QWORD v114[4];
  id v115;

  v40 = a3;
  v41 = a4;
  v42 = a5;
  v43 = a7;
  v113 = a8;
  v112 = a9;
  v109 = a10;
  v108 = a11;
  v107 = a12;
  v44 = a13;
  v45 = a14;
  v46 = a15;
  v106 = a16;
  v105 = a18;
  v104 = a19;
  v103 = a20;
  v102 = a21;
  v101 = a22;
  v100 = a23;
  v99 = a24;
  v98 = a25;
  v97 = a26;
  v96 = a27;
  v95 = a28;
  v94 = a29;
  v47 = a30;
  v48 = a31;
  v110 = a32;
  v91 = a33;
  v90 = a34;
  v89 = a35;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = v46;
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMailContentEvent.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

    v46 = v73;
  }
  v92 = v48;
  v93 = v47;
  v49 = v43;
  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v75 = v46;
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMailContentEvent.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accountIdentifier"));

    v46 = v75;
  }
  v50 = v41;
  v51 = v94;
  if (!v113)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = v46;
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMailContentEvent.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageIdentifier"));

    v46 = v77;
  }
  v52 = v110;
  if (v112)
  {
    if (v44)
      goto LABEL_9;
LABEL_34:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v81 = v46;
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMailContentEvent.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("headers"));

    v46 = v81;
    if (v45)
      goto LABEL_10;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v79 = v46;
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMailContentEvent.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromHandle"));

  v46 = v79;
  if (!v44)
    goto LABEL_34;
LABEL_9:
  if (v45)
    goto LABEL_10;
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v83 = v46;
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMMailContentEvent.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subject"));

  v46 = v83;
LABEL_10:
  v53 = -[BMMailContentEvent _initWithUniqueId:domainId:personaId:](self, "_initWithUniqueId:domainId:personaId:", v40, v50, v42);
  if (v53)
  {
    v54 = v46;
    v55 = v45;
    v56 = (void *)objc_opt_new();
    objc_msgSend(v56, "setUniqueId:", v40);
    objc_msgSend(v56, "setDomainId:", v50);
    v88 = v42;
    objc_msgSend(v56, "setPersonaId:", v42);
    objc_msgSend(v56, "setAbsoluteTimestamp:", a6);
    v86 = v49;
    objc_msgSend(v56, "setAccountIdentifier:", v49);
    objc_msgSend(v56, "setMessageIdentifier:", v113);
    objc_msgSend(v112, "proto");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setFromHandle:", v57);

    objc_msgSend(v109, "_pas_mappedArrayWithTransform:", &__block_literal_global_32_0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v58, "mutableCopy");
    objc_msgSend(v56, "setToHandles:", v59);

    objc_msgSend(v108, "_pas_mappedArrayWithTransform:", &__block_literal_global_33);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v60, "mutableCopy");
    objc_msgSend(v56, "setCcHandles:", v61);

    objc_msgSend(v107, "_pas_mappedArrayWithTransform:", &__block_literal_global_34);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v62, "mutableCopy");
    objc_msgSend(v56, "setBccHandles:", v63);

    if (objc_msgSend(v44, "count"))
    {
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v44, "count"));
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke_4;
      v114[3] = &unk_1E2649830;
      v115 = v64;
      v65 = v64;
      objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v114);
      objc_msgSend(v56, "setHeaders:", v65);

    }
    objc_msgSend(v56, "setSubject:", v55);
    objc_msgSend(v56, "setHtmlContent:", v46);
    objc_msgSend(v56, "setTextContent:", v106);
    objc_msgSend(v56, "setIsFullyDownloaded:", a17);
    objc_msgSend(v56, "setSecurityMethod:", v105);
    v66 = (void *)objc_msgSend(v104, "mutableCopy");
    objc_msgSend(v56, "setAccountHandles:", v66);

    objc_msgSend(v103, "proto");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setReplyTo:", v67);

    v68 = (void *)objc_msgSend(v102, "mutableCopy");
    objc_msgSend(v56, "setMailboxIdentifiers:", v68);

    objc_msgSend(v101, "proto");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setListId:", v69);

    objc_msgSend(v56, "setAccountType:", v100);
    objc_msgSend(v99, "_pas_mappedArrayWithTransform:", &__block_literal_global_39);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v70, "mutableCopy");
    objc_msgSend(v56, "setAttachments:", v71);

    objc_msgSend(v56, "setContentProtection:", v98);
    objc_msgSend(v56, "setConversationId:", v97);
    if (v96)
    {
      objc_msgSend(v96, "timeIntervalSinceReferenceDate");
      objc_msgSend(v56, "setDateReceived:");
    }
    v49 = v86;
    v42 = v88;
    if (v95)
      objc_msgSend(v56, "setMailCategories:", objc_msgSend(v95, "intValue"));
    v46 = v54;
    v51 = v94;
    if (v94)
      objc_msgSend(v56, "setIsNew:", objc_msgSend(v94, "BOOLValue"));
    if (v93)
      objc_msgSend(v56, "setIsTwoFactorCode:", objc_msgSend(v93, "BOOLValue"));
    if (v92)
      objc_msgSend(v56, "setIsFromMe:", objc_msgSend(v92, "BOOLValue"));
    if (v110)
      objc_msgSend(v56, "setIsJunk:", objc_msgSend(v110, "BOOLValue"));
    if (v91)
      objc_msgSend(v56, "setIsRead:", objc_msgSend(v91, "BOOLValue"));
    if (v90)
      objc_msgSend(v56, "setIsVIP:", objc_msgSend(v90, "BOOLValue"));
    if (v89)
      objc_msgSend(v56, "setIsFlagged:", objc_msgSend(v89, "BOOLValue"));
    -[BMMailContentEvent _inflateFromProto:](v53, "_inflateFromProto:", v56);

    v45 = v55;
    v52 = v110;
  }

  return v53;
}

uint64_t __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

uint64_t __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

uint64_t __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

void __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x193FECFB4](v7);
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setKey:", v5, (_QWORD)v14);
        objc_msgSend(v13, "setValue:", v11);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v7;
    }
    while (v7);
  }

}

uint64_t __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 accountIdentifier:(id)a7 messageIdentifier:(id)a8 fromHandle:(id)a9 toHandles:(id)a10 ccHandles:(id)a11 bccHandles:(id)a12 headers:(id)a13 subject:(id)a14 htmlContent:(id)a15 textContent:(id)a16 isFullyDownloaded:(BOOL)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listId:(id)a22 accountType:(id)a23 attachments:(id)a24 contentProtection:(id)a25
{
  uint64_t v26;

  LOBYTE(v26) = a17;
  return -[BMMailContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", a3, a4, a5, a7, a8, a9, a6, a10, a11, a12, a13, a14, a15, a16,
           v26,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
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

- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 ccHandles:(id)a10 bccHandles:(id)a11 headers:(id)a12 subject:(id)a13 htmlContent:(id)a14 textContent:(id)a15 isFullyDownloaded:(BOOL)a16 securityMethod:(id)a17 accountHandles:(id)a18 replyTo:(id)a19 mailboxIdentifiers:(id)a20 listId:(id)a21 accountType:(id)a22 attachments:(id)a23 contentProtection:(id)a24
{
  uint64_t v25;

  LOBYTE(v25) = a16;
  return -[BMMailContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", a3, a4, 0, a6, a7, a8, a5, a9, a10, a11, a12, a13, a14, a15,
           v25,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
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

- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 ccHandles:(id)a10 bccHandles:(id)a11 headers:(id)a12 subject:(id)a13 htmlContent:(id)a14 textContent:(id)a15 isFullyDownloaded:(BOOL)a16 securityMethod:(id)a17 accountHandles:(id)a18 replyTo:(id)a19 mailboxIdentifiers:(id)a20 listId:(id)a21 accountType:(id)a22 attachments:(id)a23
{
  uint64_t v24;

  LOBYTE(v24) = a16;
  return -[BMMailContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", a3, a4, 0, a6, a7, a8, a5, a9, a10, a11, a12, a13, a14, a15,
           v24,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
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
  return 3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 3)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMMailContentEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[BMMailContentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("htmlContent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("htmlContent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("htmlContent"));

    v3 = v5;
  }
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
  -[BMMailContentEvent jsonDict](self, "jsonDict");
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
      -[BMMailContentEvent json].cold.1((uint64_t)v5, v6);

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
  -[BMMailContentEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMMailContentEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMMailContentEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMMailContentEvent initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMMailContentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMMailContentEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BMMailContentEvent *v10;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    if (objc_msgSend(v5, "hasUniqueId")
      && objc_msgSend(v5, "hasAbsoluteTimestamp")
      && objc_msgSend(v5, "hasAccountIdentifier")
      && objc_msgSend(v5, "hasMessageIdentifier")
      && objc_msgSend(v5, "hasFromHandle")
      && objc_msgSend(v5, "hasSubject")
      && objc_msgSend(v5, "hasIsFullyDownloaded"))
    {
      objc_msgSend(v5, "uniqueId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[BMMailContentEvent _initWithUniqueId:domainId:personaId:](self, "_initWithUniqueId:domainId:personaId:", v6, v7, v8);

      if (v9)
        objc_msgSend(v9, "_inflateFromProto:", v5);
      self = (BMMailContentEvent *)v9;
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMMailContentEvent)initWithProtoData:(id)a3
{
  id v5;
  BMPBMailContentEventFilteringSubset *v6;
  BMPBMailContentEventFilteringSubset *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  BMMailContentEvent *v12;

  v5 = a3;
  if (v5)
  {
    v6 = -[BMPBMailContentEventFilteringSubset initWithData:]([BMPBMailContentEventFilteringSubset alloc], "initWithData:", v5);
    v7 = v6;
    if (v6)
    {
      -[BMPBMailContentEventFilteringSubset uniqueId](v6, "uniqueId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMPBMailContentEventFilteringSubset domainId](v7, "domainId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMPBMailContentEventFilteringSubset personaId](v7, "personaId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[BMMailContentEvent _initWithUniqueId:domainId:personaId:](self, "_initWithUniqueId:domainId:personaId:", v8, v9, v10);

      if (v11)
        objc_storeStrong(v11 + 1, a3);
      self = v11;
      v12 = self;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_uniqueId, "hash");
  return -[NSString hash](self->_domainId, "hash") ^ v3;
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
    -[BMMailContentEvent proto](self, "proto");
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;

  -[BMMailContentEvent uniqueId](self, "uniqueId", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[BMMailContentEvent accountIdentifier](self, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[BMMailContentEvent messageIdentifier](self, "messageIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[BMMailContentEvent fromHandle](self, "fromHandle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[BMMailContentEvent headers](self, "headers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            -[BMMailContentEvent subject](self, "subject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              -[BMMailContentEvent htmlContent](self, "htmlContent");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                v13 = 0;
              }
              else
              {
                -[BMMailContentEvent textContent](self, "textContent");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = v14 == 0;

              }
            }
            else
            {
              v13 = 1;
            }

          }
          else
          {
            v13 = 1;
          }

        }
        else
        {
          v13 = 1;
        }

      }
      else
      {
        v13 = 1;
      }

    }
    else
    {
      v13 = 1;
    }

  }
  else
  {
    v13 = 1;
  }

  if (a4 && v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return !v13;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[BMMailContentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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

- (BMNamedHandle)fromHandle
{
  return self->_fromHandle;
}

- (NSArray)toHandles
{
  return self->_toHandles;
}

- (NSArray)ccHandles
{
  return self->_ccHandles;
}

- (NSArray)bccHandles
{
  return self->_bccHandles;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (BMNamedHandle)replyTo
{
  return self->_replyTo;
}

- (BMNamedHandle)listId
{
  return self->_listId;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSNumber)mailCategories
{
  return self->_mailCategories;
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

- (NSNumber)isJunk
{
  return self->_isJunk;
}

- (NSNumber)isRead
{
  return self->_isRead;
}

- (NSNumber)isVIP
{
  return self->_isVIP;
}

- (NSNumber)isFlagged
{
  return self->_isFlagged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isFlagged, 0);
  objc_storeStrong((id *)&self->_isVIP, 0);
  objc_storeStrong((id *)&self->_isRead, 0);
  objc_storeStrong((id *)&self->_isJunk, 0);
  objc_storeStrong((id *)&self->_isFromMe, 0);
  objc_storeStrong((id *)&self->_isTwoFactorCode, 0);
  objc_storeStrong((id *)&self->_isNew, 0);
  objc_storeStrong((id *)&self->_mailCategories, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_listId, 0);
  objc_storeStrong((id *)&self->_replyTo, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_bccHandles, 0);
  objc_storeStrong((id *)&self->_ccHandles, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_proto, 0);
  objc_storeStrong((id *)&self->_data, 0);
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
  v4 = 3;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMMailContentEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMMailContentEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

@end
