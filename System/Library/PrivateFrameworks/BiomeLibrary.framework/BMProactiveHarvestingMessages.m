@implementation BMProactiveHarvestingMessages

- (BMProactiveHarvestingMessages)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 conversationId:(id)a6 author:(id)a7 suggestedNickname:(id)a8 suggestedPhotoPath:(id)a9 recipients:(id)a10 attachmentURL:(id)a11 content:(id)a12 fromHandle:(id)a13 toHandles:(id)a14 accountIdentifier:(id)a15 accountType:(id)a16 accountHandles:(id)a17 attachment:(id)a18 url:(id)a19 contentProtection:(id)a20 personaId:(id)a21 isNew:(id)a22 isTwoFactorCode:(id)a23 isFromMe:(id)a24 isGroupThread:(id)a25 isJunk:(id)a26 isRead:(id)a27 isPinned:(id)a28 isBusinessChat:(id)a29 tapbackAssociatedMessageID:(id)a30 tapbackType:(id)a31 messageType:(id)a32 messagesService:(id)a33 messageEffect:(id)a34 isKnownSender:(id)a35 conversationUUID:(id)a36
{
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  BMProactiveHarvestingMessages *v46;
  double v47;
  int v48;
  int v49;
  id v52;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
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

  v73 = a3;
  v72 = a4;
  v82 = a5;
  v71 = a6;
  v70 = a7;
  v52 = a8;
  v69 = a8;
  v68 = a9;
  v67 = a10;
  v66 = a11;
  v65 = a12;
  v64 = a13;
  v63 = a14;
  v62 = a15;
  v61 = a16;
  v60 = a17;
  v59 = a18;
  v58 = a19;
  v57 = a20;
  v56 = a21;
  v80 = a22;
  v41 = a23;
  v42 = a24;
  v81 = a25;
  v79 = a26;
  v78 = a27;
  v77 = a28;
  v76 = a29;
  v43 = a30;
  v44 = a31;
  v45 = a32;
  v55 = a33;
  v75 = a34;
  v74 = a35;
  v54 = a36;
  v83.receiver = self;
  v83.super_class = (Class)BMProactiveHarvestingMessages;
  v46 = -[BMEventBase init](&v83, sel_init);
  if (v46)
  {
    v46->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v46->_uniqueID, a3);
    objc_storeStrong((id *)&v46->_domainID, a4);
    if (v82)
    {
      v46->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v82, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v46->_hasRaw_absoluteTimestamp = 0;
      v47 = -1.0;
    }
    v46->_raw_absoluteTimestamp = v47;
    objc_storeStrong((id *)&v46->_conversationId, a6);
    objc_storeStrong((id *)&v46->_author, a7);
    objc_storeStrong((id *)&v46->_suggestedNickname, v52);
    objc_storeStrong((id *)&v46->_suggestedPhotoPath, a9);
    objc_storeStrong((id *)&v46->_recipients, a10);
    objc_storeStrong((id *)&v46->_attachmentURL, a11);
    objc_storeStrong((id *)&v46->_content, a12);
    objc_storeStrong((id *)&v46->_fromHandle, a13);
    objc_storeStrong((id *)&v46->_toHandles, a14);
    objc_storeStrong((id *)&v46->_accountIdentifier, a15);
    objc_storeStrong((id *)&v46->_accountType, a16);
    objc_storeStrong((id *)&v46->_accountHandles, a17);
    objc_storeStrong((id *)&v46->_attachment, a18);
    objc_storeStrong((id *)&v46->_url, a19);
    objc_storeStrong((id *)&v46->_contentProtection, a20);
    objc_storeStrong((id *)&v46->_personaId, a21);
    if (v80)
    {
      v46->_hasIsNew = 1;
      v46->_isNew = objc_msgSend(v80, "BOOLValue");
    }
    else
    {
      v46->_hasIsNew = 0;
      v46->_isNew = 0;
    }
    if (v41)
    {
      v46->_hasIsTwoFactorCode = 1;
      v46->_isTwoFactorCode = objc_msgSend(v41, "BOOLValue");
    }
    else
    {
      v46->_hasIsTwoFactorCode = 0;
      v46->_isTwoFactorCode = 0;
    }
    if (v42)
    {
      v46->_hasIsFromMe = 1;
      v46->_isFromMe = objc_msgSend(v42, "BOOLValue");
    }
    else
    {
      v46->_hasIsFromMe = 0;
      v46->_isFromMe = 0;
    }
    if (v81)
    {
      v46->_hasIsGroupThread = 1;
      v46->_isGroupThread = objc_msgSend(v81, "BOOLValue");
    }
    else
    {
      v46->_hasIsGroupThread = 0;
      v46->_isGroupThread = 0;
    }
    if (v79)
    {
      v46->_hasIsJunk = 1;
      v46->_isJunk = objc_msgSend(v79, "BOOLValue");
    }
    else
    {
      v46->_hasIsJunk = 0;
      v46->_isJunk = 0;
    }
    if (v78)
    {
      v46->_hasIsRead = 1;
      v46->_isRead = objc_msgSend(v78, "BOOLValue");
    }
    else
    {
      v46->_hasIsRead = 0;
      v46->_isRead = 0;
    }
    if (v77)
    {
      v46->_hasIsPinned = 1;
      v46->_isPinned = objc_msgSend(v77, "BOOLValue");
    }
    else
    {
      v46->_hasIsPinned = 0;
      v46->_isPinned = 0;
    }
    if (v76)
    {
      v46->_hasIsBusinessChat = 1;
      v46->_isBusinessChat = objc_msgSend(v76, "BOOLValue");
    }
    else
    {
      v46->_hasIsBusinessChat = 0;
      v46->_isBusinessChat = 0;
    }
    objc_storeStrong((id *)&v46->_tapbackAssociatedMessageID, a30);
    if (v44)
    {
      v46->_hasTapbackType = 1;
      v48 = objc_msgSend(v44, "intValue");
    }
    else
    {
      v46->_hasTapbackType = 0;
      v48 = -1;
    }
    v46->_tapbackType = v48;
    objc_storeStrong((id *)&v46->_messageType, a32);
    objc_storeStrong((id *)&v46->_messagesService, a33);
    if (v75)
    {
      v46->_hasMessageEffect = 1;
      v49 = objc_msgSend(v75, "intValue");
    }
    else
    {
      v46->_hasMessageEffect = 0;
      v49 = -1;
    }
    v46->_messageEffect = v49;
    if (v74)
    {
      v46->_hasIsKnownSender = 1;
      v46->_isKnownSender = objc_msgSend(v74, "BOOLValue");
    }
    else
    {
      v46->_hasIsKnownSender = 0;
      v46->_isKnownSender = 0;
    }
    objc_storeStrong((id *)&v46->_conversationUUID, a36);
  }

  return v46;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
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

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProactiveHarvestingMessages uniqueID](self, "uniqueID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages domainID](self, "domainID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages absoluteTimestamp](self, "absoluteTimestamp");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages conversationId](self, "conversationId");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages author](self, "author");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages suggestedNickname](self, "suggestedNickname");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages suggestedPhotoPath](self, "suggestedPhotoPath");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages recipients](self, "recipients");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages attachmentURL](self, "attachmentURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages content](self, "content");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages fromHandle](self, "fromHandle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages toHandles](self, "toHandles");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages accountIdentifier](self, "accountIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages accountType](self, "accountType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages accountHandles](self, "accountHandles");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages attachment](self, "attachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages url](self, "url");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages contentProtection](self, "contentProtection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages personaId](self, "personaId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isNew](self, "isNew"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isTwoFactorCode](self, "isTwoFactorCode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isFromMe](self, "isFromMe"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isGroupThread](self, "isGroupThread"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isJunk](self, "isJunk"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isRead](self, "isRead"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isPinned](self, "isPinned"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isBusinessChat](self, "isBusinessChat"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages tapbackAssociatedMessageID](self, "tapbackAssociatedMessageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMProactiveHarvestingMessages tapbackType](self, "tapbackType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages messageType](self, "messageType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages messagesService](self, "messagesService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMProactiveHarvestingMessages messageEffect](self, "messageEffect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isKnownSender](self, "isKnownSender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages conversationUUID](self, "conversationUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "initWithFormat:", CFSTR("BMProactiveHarvestingMessages with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, conversationId: %@, author: %@, suggestedNickname: %@, suggestedPhotoPath: %@, recipients: %@, attachmentURL: %@, content: %@, fromHandle: %@, toHandles: %@, accountIdentifier: %@, accountType: %@, accountHandles: %@, attachment: %@, url: %@, contentProtection: %@, personaId: %@, isNew: %@, isTwoFactorCode: %@, isFromMe: %@, isGroupThread: %@, isJunk: %@, isRead: %@, isPinned: %@, isBusinessChat: %@, tapbackAssociatedMessageID: %@, tapbackType: %@, messageType: %@, messagesService: %@, messageEffect: %@, isKnownSender: %@, conversationUUID: %@"), v37, v39, v35, v38, v36, v33, v34, v31, v32, v28, v30, v26, v29, v25, v27, v16,
              v24,
              v23,
              v15,
              v22,
              v14,
              v21,
              v20,
              v19,
              v13,
              v12,
              v11,
              v3,
              v4,
              v5,
              v6,
              v7,
              v8,
              v9);

  return (NSString *)v18;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingMessages *v5;
  void *v6;
  void *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  objc_class *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  char v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char v95;
  char v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char v101;
  char v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char v108;
  void *v109;
  BOOL v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSArray *toHandles;
  uint64_t v115;
  NSArray *accountHandles;
  int v117;
  BMProactiveHarvestingMessages *v118;
  objc_super v120;
  uint64_t v121;
  uint64_t v122;

  v4 = a3;
  v120.receiver = self;
  v120.super_class = (Class)BMProactiveHarvestingMessages;
  v5 = -[BMEventBase init](&v120, sel_init);
  if (!v5)
    goto LABEL_186;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v10])
        break;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = *v8;
        v16 = *(_QWORD *)&v4[v15];
        v17 = v16 + 1;
        if (v16 == -1 || v17 > *(_QWORD *)&v4[*v9])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
        *(_QWORD *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0)
          goto LABEL_13;
        v12 += 7;
        v19 = v13++ >= 9;
        if (v19)
        {
          v14 = 0;
          v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      v20 = v4[*v10];
      if (v4[*v10])
        v14 = 0;
LABEL_15:
      if (v20 || (v14 & 7) == 4)
        break;
      switch((v14 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 64;
          goto LABEL_133;
        case 2u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 72;
          goto LABEL_133;
        case 3u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v24 = *v8;
          v25 = *(_QWORD *)&v4[v24];
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v26 = *(double *)(*(_QWORD *)&v4[*v11] + v25);
            *(_QWORD *)&v4[v24] = v25 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v26 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v26;
          continue;
        case 4u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 80;
          goto LABEL_133;
        case 5u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 88;
          goto LABEL_133;
        case 6u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 96;
          goto LABEL_133;
        case 7u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 104;
          goto LABEL_133;
        case 8u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 112;
          goto LABEL_133;
        case 9u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 120;
          goto LABEL_133;
        case 0xAu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 128;
          goto LABEL_133;
        case 0xBu:
          v121 = 0;
          v122 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v27 = -[BMProactiveHarvestingNamedHandle initByReadFrom:]([BMProactiveHarvestingNamedHandle alloc], "initByReadFrom:", v4);
          if (!v27)
            goto LABEL_188;
          v28 = 136;
          goto LABEL_48;
        case 0xCu:
          v121 = 0;
          v122 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v29 = -[BMProactiveHarvestingNamedHandle initByReadFrom:]([BMProactiveHarvestingNamedHandle alloc], "initByReadFrom:", v4);
          if (!v29)
            goto LABEL_188;
          v30 = v29;
          objc_msgSend(v6, "addObject:", v29);
          PBReaderRecallMark();
          goto LABEL_44;
        case 0xDu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 152;
          goto LABEL_133;
        case 0xEu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 160;
          goto LABEL_133;
        case 0xFu:
          PBReaderReadString();
          v31 = objc_claimAutoreleasedReturnValue();
          if (!v31)
            goto LABEL_188;
          v30 = (void *)v31;
          objc_msgSend(v7, "addObject:", v31);
LABEL_44:

          continue;
        case 0x10u:
          v121 = 0;
          v122 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v27 = -[BMProactiveHarvestingContentAttachment initByReadFrom:]([BMProactiveHarvestingContentAttachment alloc], "initByReadFrom:", v4);
          if (!v27)
            goto LABEL_188;
          v28 = 176;
LABEL_48:
          v32 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = v27;

          PBReaderRecallMark();
          continue;
        case 0x11u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 184;
          goto LABEL_133;
        case 0x12u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 192;
          goto LABEL_133;
        case 0x13u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 200;
          goto LABEL_133;
        case 0x14u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasIsNew = 1;
          while (2)
          {
            v36 = *v8;
            v37 = *(_QWORD *)&v4[v36];
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v37);
              *(_QWORD *)&v4[v36] = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                v19 = v34++ >= 9;
                if (v19)
                {
                  v35 = 0;
                  goto LABEL_137;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v35 = 0;
LABEL_137:
          v110 = v35 != 0;
          v111 = 32;
          goto LABEL_179;
        case 0x15u:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v5->_hasIsTwoFactorCode = 1;
          while (2)
          {
            v43 = *v8;
            v44 = *(_QWORD *)&v4[v43];
            v45 = v44 + 1;
            if (v44 == -1 || v45 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v46 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v44);
              *(_QWORD *)&v4[v43] = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                v19 = v41++ >= 9;
                if (v19)
                {
                  v42 = 0;
                  goto LABEL_141;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v42 = 0;
LABEL_141:
          v110 = v42 != 0;
          v111 = 34;
          goto LABEL_179;
        case 0x16u:
          v47 = 0;
          v48 = 0;
          v49 = 0;
          v5->_hasIsFromMe = 1;
          while (2)
          {
            v50 = *v8;
            v51 = *(_QWORD *)&v4[v50];
            v52 = v51 + 1;
            if (v51 == -1 || v52 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v51);
              *(_QWORD *)&v4[v50] = v52;
              v49 |= (unint64_t)(v53 & 0x7F) << v47;
              if (v53 < 0)
              {
                v47 += 7;
                v19 = v48++ >= 9;
                if (v19)
                {
                  v49 = 0;
                  goto LABEL_145;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v49 = 0;
LABEL_145:
          v110 = v49 != 0;
          v111 = 36;
          goto LABEL_179;
        case 0x17u:
          v54 = 0;
          v55 = 0;
          v56 = 0;
          v5->_hasIsGroupThread = 1;
          while (2)
          {
            v57 = *v8;
            v58 = *(_QWORD *)&v4[v57];
            v59 = v58 + 1;
            if (v58 == -1 || v59 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v58);
              *(_QWORD *)&v4[v57] = v59;
              v56 |= (unint64_t)(v60 & 0x7F) << v54;
              if (v60 < 0)
              {
                v54 += 7;
                v19 = v55++ >= 9;
                if (v19)
                {
                  v56 = 0;
                  goto LABEL_149;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v56 = 0;
LABEL_149:
          v110 = v56 != 0;
          v111 = 38;
          goto LABEL_179;
        case 0x18u:
          v61 = 0;
          v62 = 0;
          v63 = 0;
          v5->_hasIsJunk = 1;
          while (2)
          {
            v64 = *v8;
            v65 = *(_QWORD *)&v4[v64];
            v66 = v65 + 1;
            if (v65 == -1 || v66 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v67 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v65);
              *(_QWORD *)&v4[v64] = v66;
              v63 |= (unint64_t)(v67 & 0x7F) << v61;
              if (v67 < 0)
              {
                v61 += 7;
                v19 = v62++ >= 9;
                if (v19)
                {
                  v63 = 0;
                  goto LABEL_153;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v63 = 0;
LABEL_153:
          v110 = v63 != 0;
          v111 = 40;
          goto LABEL_179;
        case 0x19u:
          v68 = 0;
          v69 = 0;
          v70 = 0;
          v5->_hasIsRead = 1;
          while (2)
          {
            v71 = *v8;
            v72 = *(_QWORD *)&v4[v71];
            v73 = v72 + 1;
            if (v72 == -1 || v73 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v74 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v72);
              *(_QWORD *)&v4[v71] = v73;
              v70 |= (unint64_t)(v74 & 0x7F) << v68;
              if (v74 < 0)
              {
                v68 += 7;
                v19 = v69++ >= 9;
                if (v19)
                {
                  v70 = 0;
                  goto LABEL_157;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v70 = 0;
LABEL_157:
          v110 = v70 != 0;
          v111 = 42;
          goto LABEL_179;
        case 0x1Au:
          v75 = 0;
          v76 = 0;
          v77 = 0;
          v5->_hasIsPinned = 1;
          while (2)
          {
            v78 = *v8;
            v79 = *(_QWORD *)&v4[v78];
            v80 = v79 + 1;
            if (v79 == -1 || v80 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v81 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v79);
              *(_QWORD *)&v4[v78] = v80;
              v77 |= (unint64_t)(v81 & 0x7F) << v75;
              if (v81 < 0)
              {
                v75 += 7;
                v19 = v76++ >= 9;
                if (v19)
                {
                  v77 = 0;
                  goto LABEL_161;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v77 = 0;
LABEL_161:
          v110 = v77 != 0;
          v111 = 44;
          goto LABEL_179;
        case 0x1Bu:
          v82 = 0;
          v83 = 0;
          v84 = 0;
          v5->_hasIsBusinessChat = 1;
          while (2)
          {
            v85 = *v8;
            v86 = *(_QWORD *)&v4[v85];
            v87 = v86 + 1;
            if (v86 == -1 || v87 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v88 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v86);
              *(_QWORD *)&v4[v85] = v87;
              v84 |= (unint64_t)(v88 & 0x7F) << v82;
              if (v88 < 0)
              {
                v82 += 7;
                v19 = v83++ >= 9;
                if (v19)
                {
                  v84 = 0;
                  goto LABEL_165;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v84 = 0;
LABEL_165:
          v110 = v84 != 0;
          v111 = 46;
          goto LABEL_179;
        case 0x1Cu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 208;
          goto LABEL_133;
        case 0x1Du:
          v89 = 0;
          v90 = 0;
          v91 = 0;
          v5->_hasTapbackType = 1;
          while (2)
          {
            v92 = *v8;
            v93 = *(_QWORD *)&v4[v92];
            v94 = v93 + 1;
            if (v93 == -1 || v94 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v95 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v93);
              *(_QWORD *)&v4[v92] = v94;
              v91 |= (unint64_t)(v95 & 0x7F) << v89;
              if (v95 < 0)
              {
                v89 += 7;
                v19 = v90++ >= 9;
                if (v19)
                {
                  LODWORD(v91) = 0;
                  goto LABEL_169;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v91) = 0;
LABEL_169:
          v112 = 56;
          goto LABEL_174;
        case 0x1Eu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 216;
          goto LABEL_133;
        case 0x1Fu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 224;
          goto LABEL_133;
        case 0x20u:
          v96 = 0;
          v97 = 0;
          v91 = 0;
          v5->_hasMessageEffect = 1;
          while (2)
          {
            v98 = *v8;
            v99 = *(_QWORD *)&v4[v98];
            v100 = v99 + 1;
            if (v99 == -1 || v100 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v101 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v99);
              *(_QWORD *)&v4[v98] = v100;
              v91 |= (unint64_t)(v101 & 0x7F) << v96;
              if (v101 < 0)
              {
                v96 += 7;
                v19 = v97++ >= 9;
                if (v19)
                {
                  LODWORD(v91) = 0;
                  goto LABEL_173;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v91) = 0;
LABEL_173:
          v112 = 60;
LABEL_174:
          *(_DWORD *)((char *)&v5->super.super.isa + v112) = v91;
          continue;
        case 0x21u:
          v102 = 0;
          v103 = 0;
          v104 = 0;
          v5->_hasIsKnownSender = 1;
          break;
        case 0x22u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 232;
LABEL_133:
          v109 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_188:

          goto LABEL_185;
      }
      while (1)
      {
        v105 = *v8;
        v106 = *(_QWORD *)&v4[v105];
        v107 = v106 + 1;
        if (v106 == -1 || v107 > *(_QWORD *)&v4[*v9])
          break;
        v108 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v106);
        *(_QWORD *)&v4[v105] = v107;
        v104 |= (unint64_t)(v108 & 0x7F) << v102;
        if ((v108 & 0x80) == 0)
          goto LABEL_176;
        v102 += 7;
        v19 = v103++ >= 9;
        if (v19)
        {
          v104 = 0;
          goto LABEL_178;
        }
      }
      v4[*v10] = 1;
LABEL_176:
      if (v4[*v10])
        v104 = 0;
LABEL_178:
      v110 = v104 != 0;
      v111 = 50;
LABEL_179:
      *((_BYTE *)&v5->super.super.isa + v111) = v110;
    }
    while (*(_QWORD *)&v4[*v8] < *(_QWORD *)&v4[*v9]);
  }
  v113 = objc_msgSend(v6, "copy");
  toHandles = v5->_toHandles;
  v5->_toHandles = (NSArray *)v113;

  v115 = objc_msgSend(v7, "copy");
  accountHandles = v5->_accountHandles;
  v5->_accountHandles = (NSArray *)v115;

  v117 = v4[*v10];
  if (v117)
LABEL_185:
    v118 = 0;
  else
LABEL_186:
    v118 = v5;

  return v118;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_domainID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_conversationId)
    PBDataWriterWriteStringField();
  if (self->_author)
    PBDataWriterWriteStringField();
  if (self->_suggestedNickname)
    PBDataWriterWriteStringField();
  if (self->_suggestedPhotoPath)
    PBDataWriterWriteStringField();
  if (self->_recipients)
    PBDataWriterWriteStringField();
  if (self->_attachmentURL)
    PBDataWriterWriteStringField();
  if (self->_content)
    PBDataWriterWriteStringField();
  if (self->_fromHandle)
  {
    v24 = 0;
    PBDataWriterPlaceMark();
    -[BMProactiveHarvestingNamedHandle writeTo:](self->_fromHandle, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_toHandles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v24 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }

  if (self->_accountIdentifier)
    PBDataWriterWriteStringField();
  if (self->_accountType)
    PBDataWriterWriteStringField();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_accountHandles;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    }
    while (v13);
  }

  if (self->_attachment)
  {
    v24 = 0;
    PBDataWriterPlaceMark();
    -[BMProactiveHarvestingContentAttachment writeTo:](self->_attachment, "writeTo:", v4, v16);
    PBDataWriterRecallMark();
  }
  if (self->_url)
    PBDataWriterWriteStringField();
  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();
  if (self->_hasIsNew)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsTwoFactorCode)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsFromMe)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsGroupThread)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsJunk)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsRead)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsPinned)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsBusinessChat)
    PBDataWriterWriteBOOLField();
  if (self->_tapbackAssociatedMessageID)
    PBDataWriterWriteStringField();
  if (self->_hasTapbackType)
    PBDataWriterWriteInt32Field();
  if (self->_messageType)
    PBDataWriterWriteStringField();
  if (self->_messagesService)
    PBDataWriterWriteStringField();
  if (self->_hasMessageEffect)
    PBDataWriterWriteInt32Field();
  if (self->_hasIsKnownSender)
    PBDataWriterWriteBOOLField();
  if (self->_conversationUUID)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingMessages writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingMessages)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  BMProactiveHarvestingMessages *v20;
  id v21;
  uint64_t v22;
  id *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  BMProactiveHarvestingNamedHandle *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  id v58;
  BMProactiveHarvestingNamedHandle *v59;
  BMProactiveHarvestingNamedHandle *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  int v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  id v83;
  id v84;
  uint64_t v85;
  id v86;
  id v87;
  uint64_t v88;
  void *v89;
  id *v90;
  id v91;
  uint64_t v92;
  void *v93;
  id *v94;
  uint64_t *v95;
  id v96;
  uint64_t v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t j;
  void *v109;
  id v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  void *v122;
  id v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  id v137;
  BMProactiveHarvestingContentAttachment *v138;
  id v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  id v168;
  id v169;
  void *v170;
  id v171;
  uint64_t v172;
  id v173;
  void *v174;
  uint64_t v175;
  id v176;
  void *v177;
  id v178;
  id v179;
  id v180;
  void *v181;
  id v182;
  id v183;
  uint64_t v184;
  id v185;
  void *v186;
  id v187;
  uint64_t v188;
  id v189;
  void *v190;
  id v191;
  uint64_t v192;
  id v193;
  void *v194;
  uint64_t v195;
  void *v196;
  id v197;
  uint64_t v198;
  id v199;
  void *v200;
  uint64_t v201;
  void *v202;
  id v203;
  uint64_t v204;
  id v205;
  void *v206;
  uint64_t v207;
  void *v208;
  id v209;
  uint64_t v210;
  id v211;
  void *v212;
  id v213;
  uint64_t v214;
  id v215;
  void *v216;
  id v217;
  void *v218;
  id v219;
  uint64_t v220;
  id v221;
  void *v222;
  id v223;
  uint64_t v224;
  id v225;
  void *v226;
  id v227;
  uint64_t v228;
  id v229;
  void *v230;
  id v231;
  uint64_t v232;
  id v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  id v237;
  id v238;
  uint64_t v239;
  id v240;
  id v241;
  uint64_t v242;
  void *v243;
  void *v244;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  void *v262;
  void *v263;
  id v264;
  void *v265;
  void *v266;
  void *v267;
  id v268;
  void *v269;
  id v270;
  void *v271;
  id v272;
  void *v273;
  id v274;
  void *v275;
  id v276;
  void *v277;
  id v278;
  void *v279;
  id v280;
  void *v281;
  id v282;
  void *v283;
  id v284;
  void *v285;
  id v286;
  id v287;
  void *v288;
  void *v289;
  id v290;
  void *v291;
  id v292;
  uint64_t v293;
  void *v294;
  id v295;
  void *v296;
  id v297;
  uint64_t v298;
  void *v299;
  id v300;
  uint64_t v301;
  BMProactiveHarvestingContentAttachment *v302;
  id v303;
  id v304;
  BMProactiveHarvestingNamedHandle *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  BMProactiveHarvestingMessages *v311;
  id v312;
  void *v313;
  id v314;
  void *v315;
  id v316;
  void *v317;
  id v318;
  void *v319;
  id obj;
  id v321;
  void *v322;
  void *v323;
  id v324;
  id v325;
  void *v326;
  id *v327;
  id v328;
  void *v329;
  void *v330;
  void *v331;
  id v332;
  id v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  id v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  id v344;
  uint64_t v345;
  void *v346;
  uint64_t v347;
  void *v348;
  uint64_t v349;
  id v350;
  uint64_t v351;
  id v352;
  uint64_t v353;
  void *v354;
  uint64_t v355;
  id v356;
  uint64_t v357;
  id v358;
  uint64_t v359;
  id v360;
  uint64_t v361;
  id v362;
  uint64_t v363;
  id v364;
  uint64_t v365;
  id v366;
  uint64_t v367;
  id v368;
  uint64_t v369;
  id v370;
  uint64_t v371;
  id v372;
  uint64_t v373;
  id v374;
  uint64_t v375;
  id v376;
  uint64_t v377;
  id v378;
  uint64_t v379;
  void *v380;
  uint64_t v381;
  BMProactiveHarvestingContentAttachment *v382;
  uint64_t v383;
  BMProactiveHarvestingContentAttachment *v384;
  uint64_t v385;
  BMProactiveHarvestingContentAttachment *v386;
  _BYTE v387[128];
  uint64_t v388;
  void *v389;
  uint64_t v390;
  id v391;
  uint64_t v392;
  id v393;
  uint64_t v394;
  id v395;
  uint64_t v396;
  id v397;
  _BYTE v398[128];
  uint64_t v399;
  void *v400;
  uint64_t v401;
  BMProactiveHarvestingNamedHandle *v402;
  uint64_t v403;
  id v404;
  uint64_t v405;
  id v406;
  uint64_t v407;
  id v408;
  uint64_t v409;
  id v410;
  uint64_t v411;
  id v412;
  uint64_t v413;
  id v414;
  uint64_t v415;
  id v416;
  uint64_t v417;
  void *v418;
  uint64_t v419;
  id *v420;
  uint64_t v421;
  _QWORD v422[3];

  v422[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v14 = *MEMORY[0x1E0D025B8];
        v421 = *MEMORY[0x1E0CB2D50];
        v15 = v6;
        v16 = objc_alloc(MEMORY[0x1E0CB3940]);
        v246 = objc_opt_class();
        v17 = v16;
        v6 = v15;
        v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v246, CFSTR("uniqueID"));
        v422[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v422, &v421, 1);
        v331 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 2);
        v332 = 0;
        v20 = 0;
        *a4 = v19;
        goto LABEL_376;
      }
      v332 = 0;
      v20 = 0;
      goto LABEL_377;
    }
    v332 = v6;
  }
  else
  {
    v332 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("domainID"));
  v7 = objc_claimAutoreleasedReturnValue();
  v331 = (void *)v7;
  if (v7 && (v8 = (void *)v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v419 = *MEMORY[0x1E0CB2D50];
        v23 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domainID"));
        v420 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v420, &v419, 1);
        v330 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2);
        v18 = 0;
        v20 = 0;
        *a4 = v24;
        goto LABEL_375;
      }
      v18 = 0;
      v20 = 0;
      goto LABEL_376;
    }
    v328 = v8;
  }
  else
  {
    v328 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v9 = objc_claimAutoreleasedReturnValue();
  v330 = (void *)v9;
  if (!v9 || (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v327 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    v12 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v11, "doubleValue");
    v327 = (id *)objc_msgSend(v12, "initWithTimeIntervalSinceReferenceDate:");
LABEL_22:

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    v25 = v10;
    objc_msgSend(v11, "dateFromString:", v25);
    v327 = (id *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = a4;
    if (a4)
    {
      v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v97 = *MEMORY[0x1E0D025B8];
      v417 = *MEMORY[0x1E0CB2D50];
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
      v418 = v48;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v418, &v417, 1);
      v329 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v97, 2);
      v23 = 0;
      v20 = 0;
      *a4 = v98;
      v18 = v328;
      goto LABEL_374;
    }
    v20 = 0;
    v18 = v328;
    goto LABEL_375;
  }
  v327 = v10;
LABEL_23:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("conversationId"));
  v26 = objc_claimAutoreleasedReturnValue();
  v329 = (void *)v26;
  if (v26 && (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = *MEMORY[0x1E0D025B8];
        v415 = *MEMORY[0x1E0CB2D50];
        v325 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("conversationId"));
        v416 = v325;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v416, &v415, 1);
        v326 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2);
        v48 = 0;
        v20 = 0;
        *a4 = v47;
        v18 = v328;
        v23 = v327;
        goto LABEL_373;
      }
      v48 = 0;
      v20 = 0;
      v18 = v328;
      v23 = v327;
      goto LABEL_374;
    }
    v324 = v27;
  }
  else
  {
    v324 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("author"));
  v28 = objc_claimAutoreleasedReturnValue();
  v326 = (void *)v28;
  if (v28 && (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v325 = 0;
        v20 = 0;
        v18 = v328;
        v23 = v327;
        v48 = v324;
        goto LABEL_373;
      }
      v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v50 = *MEMORY[0x1E0D025B8];
      v413 = *MEMORY[0x1E0CB2D50];
      v321 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("author"));
      v414 = v321;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v414, &v413, 1);
      v323 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 2);
      v325 = 0;
      v20 = 0;
      *a4 = v51;
      goto LABEL_114;
    }
    v325 = v29;
  }
  else
  {
    v325 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suggestedNickname"));
  v30 = objc_claimAutoreleasedReturnValue();
  v323 = (void *)v30;
  if (v30)
  {
    v31 = (void *)v30;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v321 = v31;
        goto LABEL_32;
      }
      if (a4)
      {
        v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v70 = *MEMORY[0x1E0D025B8];
        v411 = *MEMORY[0x1E0CB2D50];
        v318 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("suggestedNickname"));
        v412 = v318;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v412, &v411, 1);
        v319 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2);
        v321 = 0;
        v20 = 0;
        *a4 = v71;
        goto LABEL_129;
      }
      v321 = 0;
      v20 = 0;
LABEL_114:
      v18 = v328;
      v23 = v327;
      v48 = v324;
      goto LABEL_372;
    }
  }
  v321 = 0;
LABEL_32:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suggestedPhotoPath"));
  v32 = objc_claimAutoreleasedReturnValue();
  v319 = (void *)v32;
  if (v32)
  {
    v33 = (void *)v32;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v318 = v33;
        goto LABEL_35;
      }
      if (a4)
      {
        v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v76 = *MEMORY[0x1E0D025B8];
        v409 = *MEMORY[0x1E0CB2D50];
        v316 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("suggestedPhotoPath"));
        v410 = v316;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v410, &v409, 1);
        v317 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v76, 2);
        v318 = 0;
        v20 = 0;
        *a4 = v77;
        goto LABEL_132;
      }
      v318 = 0;
      v20 = 0;
LABEL_129:
      v18 = v328;
      v23 = v327;
      v48 = v324;
      goto LABEL_371;
    }
  }
  v318 = 0;
LABEL_35:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recipients"));
  v34 = objc_claimAutoreleasedReturnValue();
  v317 = (void *)v34;
  if (v34)
  {
    v35 = (void *)v34;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v316 = v35;
        goto LABEL_38;
      }
      if (a4)
      {
        v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v79 = *MEMORY[0x1E0D025B8];
        v407 = *MEMORY[0x1E0CB2D50];
        v314 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("recipients"));
        v408 = v314;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v408, &v407, 1);
        v315 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2);
        v316 = 0;
        v20 = 0;
        *a4 = v80;
        goto LABEL_153;
      }
      v316 = 0;
      v20 = 0;
LABEL_132:
      v18 = v328;
      v23 = v327;
      v48 = v324;
      goto LABEL_370;
    }
  }
  v316 = 0;
LABEL_38:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attachmentURL"));
  v36 = objc_claimAutoreleasedReturnValue();
  v315 = (void *)v36;
  if (v36)
  {
    v37 = (void *)v36;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v314 = v37;
        goto LABEL_41;
      }
      if (a4)
      {
        v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v82 = *MEMORY[0x1E0D025B8];
        v405 = *MEMORY[0x1E0CB2D50];
        v312 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("attachmentURL"));
        v406 = v312;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v406, &v405, 1);
        v313 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v82, 2);
        v314 = 0;
        v20 = 0;
        *a4 = v83;
        goto LABEL_157;
      }
      v314 = 0;
      v20 = 0;
LABEL_153:
      v18 = v328;
      v23 = v327;
      v48 = v324;
      goto LABEL_369;
    }
  }
  v314 = 0;
LABEL_41:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("content"));
  v38 = objc_claimAutoreleasedReturnValue();
  v311 = self;
  v313 = (void *)v38;
  if (v38)
  {
    v39 = (void *)v38;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v312 = v39;
        goto LABEL_44;
      }
      if (a4)
      {
        v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v85 = *MEMORY[0x1E0D025B8];
        v403 = *MEMORY[0x1E0CB2D50];
        v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("content"));
        v404 = v72;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v404, &v403, 1);
        v41 = (BMProactiveHarvestingNamedHandle *)objc_claimAutoreleasedReturnValue();
        v86 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, 2, v41);
        v312 = 0;
        v20 = 0;
        *a4 = v86;
        goto LABEL_112;
      }
      v312 = 0;
      v20 = 0;
LABEL_157:
      v18 = v328;
      v23 = v327;
      v48 = v324;
      goto LABEL_368;
    }
  }
  v312 = 0;
LABEL_44:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fromHandle"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v306 = v40;
    v41 = 0;
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v20 = 0;
      v18 = v328;
      v23 = v327;
      v72 = v40;
      goto LABEL_367;
    }
    v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v88 = *MEMORY[0x1E0D025B8];
    v401 = *MEMORY[0x1E0CB2D50];
    v41 = (BMProactiveHarvestingNamedHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("fromHandle"));
    v402 = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v402, &v401, 1);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v88, 2, v89);

    v20 = 0;
    v72 = v40;
LABEL_112:
    v18 = v328;
    v23 = v327;
    goto LABEL_366;
  }
  v72 = v40;
  v344 = 0;
  v41 = -[BMProactiveHarvestingNamedHandle initWithJSONDictionary:error:]([BMProactiveHarvestingNamedHandle alloc], "initWithJSONDictionary:error:", v72, &v344);
  v73 = v344;
  if (v73)
  {
    v74 = v73;
    v18 = v328;
    v23 = v327;
    if (a4)
      *a4 = objc_retainAutorelease(v73);

    v20 = 0;
    goto LABEL_366;
  }
  v306 = v40;

LABEL_47:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("toHandles"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v42, "isEqual:", v43);

  v307 = v6;
  v305 = v41;
  if (v44)
  {

LABEL_68:
    v52 = 0;
    goto LABEL_69;
  }
  if (!v42)
    goto LABEL_68;
  objc_opt_class();
  obj = v42;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v100 = *MEMORY[0x1E0D025B8];
      v399 = *MEMORY[0x1E0CB2D50];
      v322 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("toHandles"));
      v400 = v322;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v400, &v399, 1);
      v101 = objc_claimAutoreleasedReturnValue();
      v102 = v100;
      v103 = (void *)v101;
      v20 = 0;
      *a4 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v102, 2, v101);
      v18 = v328;
      v23 = v327;
      goto LABEL_364;
    }
    v20 = 0;
    v18 = v328;
    v23 = v327;
    goto LABEL_365;
  }
  v52 = v42;
LABEL_69:
  v322 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v52, "count"));
  v340 = 0u;
  v341 = 0u;
  v342 = 0u;
  v343 = 0u;
  obj = v52;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v340, v398, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v341;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v341 != v55)
          objc_enumerationMutation(obj);
        v57 = *(void **)(*((_QWORD *)&v340 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v90 = a4;
          if (a4)
          {
            v91 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v92 = *MEMORY[0x1E0D025B8];
            v396 = *MEMORY[0x1E0CB2D50];
            v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("toHandles"));
            v397 = v58;
            v93 = (void *)MEMORY[0x1E0C99D80];
            v94 = &v397;
            v95 = &v396;
            goto LABEL_121;
          }
LABEL_130:
          v20 = 0;
          v103 = obj;
          v6 = v307;
          v18 = v328;
          v23 = v327;
          v41 = v305;
          goto LABEL_364;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v90 = a4;
          if (!a4)
            goto LABEL_130;
          v91 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v92 = *MEMORY[0x1E0D025B8];
          v394 = *MEMORY[0x1E0CB2D50];
          v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("toHandles"));
          v395 = v58;
          v93 = (void *)MEMORY[0x1E0C99D80];
          v94 = &v395;
          v95 = &v394;
LABEL_121:
          objc_msgSend(v93, "dictionaryWithObjects:forKeys:count:", v94, v95, 1);
          v65 = (id)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          *v90 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v92, 2, v65);
LABEL_125:
          v303 = obj;
          v6 = v307;
          v18 = v328;
          v23 = v327;
          v41 = v305;
          goto LABEL_362;
        }
        v58 = v57;
        v59 = [BMProactiveHarvestingNamedHandle alloc];
        v339 = 0;
        v60 = -[BMProactiveHarvestingNamedHandle initWithJSONDictionary:error:](v59, "initWithJSONDictionary:error:", v58, &v339);
        v61 = v339;
        if (v61)
        {
          v65 = v61;
          if (a4)
            *a4 = objc_retainAutorelease(v61);

          v20 = 0;
          goto LABEL_125;
        }
        objc_msgSend(v322, "addObject:", v60);

      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v340, v398, 16);
    }
    while (v54);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accountIdentifier"));
  v58 = (id)objc_claimAutoreleasedReturnValue();
  if (v58 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    v6 = v307;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v103 = 0;
        v20 = 0;
        v18 = v328;
        v23 = v327;
        v41 = v305;
        goto LABEL_363;
      }
      v124 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v125 = *MEMORY[0x1E0D025B8];
      v392 = *MEMORY[0x1E0CB2D50];
      v65 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("accountIdentifier"));
      v393 = v65;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v393, &v392, 1);
      v126 = objc_claimAutoreleasedReturnValue();
      v127 = v124;
      v64 = (void *)v126;
      v303 = 0;
      v20 = 0;
      *a4 = (id)objc_msgSend(v127, "initWithDomain:code:userInfo:", v125, 2, v126);
LABEL_230:
      v18 = v328;
      v23 = v327;
      v41 = v305;
      goto LABEL_361;
    }
    v62 = v58;
  }
  else
  {
    v62 = 0;
    v6 = v307;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accountType"));
  v63 = objc_claimAutoreleasedReturnValue();
  v310 = (void *)v63;
  v303 = v62;
  if (!v63 || (v64 = (void *)v63, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v65 = 0;
    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v128 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v129 = *MEMORY[0x1E0D025B8];
      v390 = *MEMORY[0x1E0CB2D50];
      v304 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("accountType"));
      v391 = v304;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v391, &v390, 1);
      v130 = objc_claimAutoreleasedReturnValue();
      v131 = v129;
      v64 = v310;
      v309 = (void *)v130;
      v132 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v131, 2);
      v65 = 0;
      v20 = 0;
      *a4 = v132;
      v18 = v328;
      v23 = v327;
      v41 = v305;

      goto LABEL_360;
    }
    v65 = 0;
    v20 = 0;
    goto LABEL_230;
  }
  v65 = v64;
LABEL_85:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accountHandles"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v66, "isEqual:", v67);

  if (v68)
  {

  }
  else
  {
    v41 = v305;
    if (v66)
    {
      objc_opt_class();
      v304 = v66;
      v64 = v310;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v20 = 0;
          v18 = v328;
          v23 = v327;
          goto LABEL_360;
        }
        v133 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v134 = *MEMORY[0x1E0D025B8];
        v388 = *MEMORY[0x1E0CB2D50];
        v308 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("accountHandles"));
        v389 = v308;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v389, &v388, 1);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = v134;
        v64 = v310;
        v136 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v135, 2, v112);
        v20 = 0;
        *a4 = v136;
LABEL_177:
        v18 = v328;
        v23 = v327;
        goto LABEL_358;
      }
      v104 = v66;
      goto LABEL_137;
    }
  }
  v104 = 0;
  v64 = v310;
LABEL_137:
  v308 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v104, "count"));
  v335 = 0u;
  v336 = 0u;
  v337 = 0u;
  v338 = 0u;
  v304 = v104;
  v105 = objc_msgSend(v304, "countByEnumeratingWithState:objects:count:", &v335, v387, 16);
  if (!v105)
    goto LABEL_146;
  v106 = v105;
  v107 = *(_QWORD *)v336;
  v64 = v310;
  while (2)
  {
    for (j = 0; j != v106; ++j)
    {
      if (*(_QWORD *)v336 != v107)
        objc_enumerationMutation(v304);
      v109 = *(void **)(*((_QWORD *)&v335 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
        {
          v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v116 = *MEMORY[0x1E0D025B8];
          v385 = *MEMORY[0x1E0CB2D50];
          v302 = (BMProactiveHarvestingContentAttachment *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("accountHandles"));
          v386 = v302;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v386, &v385, 1);
          v117 = objc_claimAutoreleasedReturnValue();
          v118 = v115;
          v119 = v116;
LABEL_168:
          v122 = (void *)v117;
          v18 = v328;
          v23 = v327;
          v20 = 0;
          *a4 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v119, 2);
          v123 = v304;
          v6 = v307;
          goto LABEL_169;
        }
LABEL_172:
        v20 = 0;
        v112 = v304;
        v6 = v307;
        v18 = v328;
        v23 = v327;
        v41 = v305;
        v64 = v310;
        goto LABEL_358;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v120 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v121 = *MEMORY[0x1E0D025B8];
          v383 = *MEMORY[0x1E0CB2D50];
          v302 = (BMProactiveHarvestingContentAttachment *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("accountHandles"));
          v384 = v302;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v384, &v383, 1);
          v117 = objc_claimAutoreleasedReturnValue();
          v118 = v120;
          v119 = v121;
          goto LABEL_168;
        }
        goto LABEL_172;
      }
      v110 = v109;
      objc_msgSend(v308, "addObject:", v110);

    }
    v106 = objc_msgSend(v304, "countByEnumeratingWithState:objects:count:", &v335, v387, 16);
    if (v106)
      continue;
    break;
  }
LABEL_146:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attachment"));
  v111 = objc_claimAutoreleasedReturnValue();
  v301 = v111;
  if (!v111 || (v112 = (void *)v111, objc_opt_class(), v41 = v305, (objc_opt_isKindOfClass() & 1) != 0))
  {
    v302 = 0;
    goto LABEL_149;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = v307;
    if (a4)
    {
      v300 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v298 = *MEMORY[0x1E0D025B8];
      v381 = *MEMORY[0x1E0CB2D50];
      v169 = objc_alloc(MEMORY[0x1E0CB3940]);
      v123 = v112;
      v247 = objc_opt_class();
      v170 = v169;
      v64 = v310;
      v302 = (BMProactiveHarvestingContentAttachment *)objc_msgSend(v170, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v247, CFSTR("attachment"));
      v382 = v302;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v382, &v381, 1);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      *a4 = (id)objc_msgSend(v300, "initWithDomain:code:userInfo:", v298, 2, v122);
      v18 = v328;
      v23 = v327;
      goto LABEL_357;
    }
    v20 = 0;
    goto LABEL_177;
  }
  v137 = v112;
  v138 = [BMProactiveHarvestingContentAttachment alloc];
  v334 = 0;
  v302 = -[BMProactiveHarvestingContentAttachment initWithJSONDictionary:error:](v138, "initWithJSONDictionary:error:", v137, &v334);
  v139 = v334;
  v6 = v307;
  if (!v139)
  {

LABEL_149:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
    v113 = objc_claimAutoreleasedReturnValue();
    v299 = (void *)v113;
    if (v113)
    {
      v114 = (void *)v113;
      objc_opt_class();
      v6 = v307;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v297 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v123 = (id)v301;
            v20 = 0;
            v297 = 0;
            v18 = v328;
            v23 = v327;
LABEL_356:

            v122 = v297;
            goto LABEL_357;
          }
          v171 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v172 = *MEMORY[0x1E0D025B8];
          v379 = *MEMORY[0x1E0CB2D50];
          v173 = objc_alloc(MEMORY[0x1E0CB3940]);
          v248 = objc_opt_class();
          v174 = v173;
          v64 = v310;
          v294 = (void *)objc_msgSend(v174, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v248, CFSTR("url"));
          v380 = v294;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v380, &v379, 1);
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          v297 = 0;
          *a4 = (id)objc_msgSend(v171, "initWithDomain:code:userInfo:", v172, 2);
          v18 = v328;
          v23 = v327;
          v142 = (void *)v301;
          goto LABEL_355;
        }
        v297 = v114;
      }
    }
    else
    {
      v297 = 0;
      v6 = v307;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentProtection"));
    v141 = objc_claimAutoreleasedReturnValue();
    v142 = (void *)v301;
    v296 = (void *)v141;
    if (!v141 || (v143 = (void *)v141, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v144 = 0;
      goto LABEL_190;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v144 = v143;
LABEL_190:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personaId"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v294 = v144;
      if (!v145 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v289 = v145;
        v292 = 0;
        goto LABEL_193;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v289 = v145;
        v292 = v145;
LABEL_193:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isNew"));
        v146 = objc_claimAutoreleasedReturnValue();
        v291 = (void *)v146;
        if (!v146 || (v147 = (void *)v146, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v290 = 0;
          goto LABEL_196;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v290 = v147;
LABEL_196:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isTwoFactorCode"));
          v148 = objc_claimAutoreleasedReturnValue();
          v288 = (void *)v148;
          if (!v148 || (v149 = (void *)v148, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v287 = 0;
            goto LABEL_199;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v287 = v149;
LABEL_199:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isFromMe"));
            v150 = objc_claimAutoreleasedReturnValue();
            v285 = (void *)v150;
            if (!v150 || (v151 = (void *)v150, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v286 = 0;
              goto LABEL_202;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v286 = v151;
LABEL_202:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isGroupThread"));
              v152 = objc_claimAutoreleasedReturnValue();
              v283 = (void *)v152;
              if (!v152 || (v153 = (void *)v152, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v284 = 0;
                goto LABEL_205;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v284 = v153;
LABEL_205:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isJunk"));
                v154 = objc_claimAutoreleasedReturnValue();
                v281 = (void *)v154;
                if (!v154 || (v155 = (void *)v154, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v282 = 0;
                  goto LABEL_208;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v282 = v155;
LABEL_208:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isRead"));
                  v156 = objc_claimAutoreleasedReturnValue();
                  v279 = (void *)v156;
                  if (!v156 || (v157 = (void *)v156, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v280 = 0;
                    goto LABEL_211;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v280 = v157;
LABEL_211:
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isPinned"));
                    v158 = objc_claimAutoreleasedReturnValue();
                    v277 = (void *)v158;
                    if (!v158 || (v159 = (void *)v158, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v278 = 0;
                      goto LABEL_214;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v278 = v159;
LABEL_214:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isBusinessChat"));
                      v160 = objc_claimAutoreleasedReturnValue();
                      v275 = (void *)v160;
                      if (!v160 || (v161 = (void *)v160, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v276 = 0;
                        goto LABEL_217;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v276 = v161;
LABEL_217:
                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tapbackAssociatedMessageID"));
                        v162 = objc_claimAutoreleasedReturnValue();
                        v273 = (void *)v162;
                        if (!v162 || (v163 = (void *)v162, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v274 = 0;
                          goto LABEL_220;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v274 = v163;
LABEL_220:
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tapbackType"));
                          v164 = objc_claimAutoreleasedReturnValue();
                          v271 = (void *)v164;
                          if (!v164 || (v165 = (void *)v164, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v272 = 0;
                            goto LABEL_223;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v272 = v165;
LABEL_223:
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messageType"));
                            v166 = objc_claimAutoreleasedReturnValue();
                            v269 = (void *)v166;
                            if (!v166 || (v167 = (void *)v166, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v270 = 0;
LABEL_226:
                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messagesService"));
                              v168 = (id)objc_claimAutoreleasedReturnValue();
                              v267 = v168;
                              if (!v168)
                                goto LABEL_291;
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v168 = 0;
                                goto LABEL_291;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v168 = v168;
LABEL_291:
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messageEffect"));
                                v265 = (void *)objc_claimAutoreleasedReturnValue();
                                v266 = v168;
                                if (!v265 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v268 = 0;
                                  goto LABEL_294;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v268 = v265;
LABEL_294:
                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isKnownSender"));
                                  v263 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (!v263 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v264 = 0;
LABEL_297:
                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("conversationUUID"));
                                    v217 = (id)objc_claimAutoreleasedReturnValue();
                                    v262 = v217;
                                    if (!v217)
                                    {
LABEL_318:
                                      v18 = v328;
                                      v23 = v327;
                                      v261 = v217;
                                      v20 = objc_retain(-[BMProactiveHarvestingMessages initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:](v311, "initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", v332, v328, v327, v324, v325, v321, v318, v316, v314, v312, v305,
                                                v322,
                                                v303,
                                                v65,
                                                v308,
                                                v302,
                                                v297,
                                                v144,
                                                v292,
                                                v290,
                                                v287,
                                                v286,
                                                v284,
                                                v282,
                                                v280,
                                                v278,
                                                v276,
                                                v274,
                                                v272,
                                                v270,
                                                v168,
                                                v268,
                                                v264,
                                                v217));
                                      v311 = v20;
LABEL_339:
                                      v142 = (void *)v301;

                                      v145 = v289;
LABEL_340:

LABEL_341:
LABEL_342:

LABEL_343:
LABEL_344:

                                      goto LABEL_345;
                                    }
                                    v218 = v217;
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v217 = 0;
                                      goto LABEL_318;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v217 = v218;
                                      goto LABEL_318;
                                    }
                                    if (a4)
                                    {
                                      v241 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v242 = *MEMORY[0x1E0D025B8];
                                      v345 = *MEMORY[0x1E0CB2D50];
                                      v243 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("conversationUUID"));
                                      v346 = v243;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v346, &v345, 1);
                                      v244 = (void *)objc_claimAutoreleasedReturnValue();
                                      *a4 = (id)objc_msgSend(v241, "initWithDomain:code:userInfo:", v242, 2, v244);

                                    }
                                    v261 = 0;
                                    v20 = 0;
LABEL_338:
                                    v18 = v328;
                                    v23 = v327;
                                    v64 = v310;
                                    goto LABEL_339;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v264 = v263;
                                    goto LABEL_297;
                                  }
                                  if (a4)
                                  {
                                    v238 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v239 = *MEMORY[0x1E0D025B8];
                                    v347 = *MEMORY[0x1E0CB2D50];
                                    v261 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isKnownSender"));
                                    v348 = v261;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v348, &v347, 1);
                                    v262 = (void *)objc_claimAutoreleasedReturnValue();
                                    v240 = (id)objc_msgSend(v238, "initWithDomain:code:userInfo:", v239, 2);
                                    v20 = 0;
                                    v264 = 0;
                                    *a4 = v240;
                                    goto LABEL_338;
                                  }
                                  v264 = 0;
                                  v20 = 0;
LABEL_387:
                                  v18 = v328;
                                  v23 = v327;
                                  v64 = v310;
                                  v145 = v289;
                                  v142 = (void *)v301;
                                  goto LABEL_340;
                                }
                                if (a4)
                                {
                                  v235 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v236 = *MEMORY[0x1E0D025B8];
                                  v349 = *MEMORY[0x1E0CB2D50];
                                  v264 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("messageEffect"));
                                  v350 = v264;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v350, &v349, 1);
                                  v263 = (void *)objc_claimAutoreleasedReturnValue();
                                  v237 = (id)objc_msgSend(v235, "initWithDomain:code:userInfo:", v236, 2);
                                  v20 = 0;
                                  v268 = 0;
                                  *a4 = v237;
                                  goto LABEL_387;
                                }
                                v268 = 0;
                                v20 = 0;
LABEL_385:
                                v18 = v328;
                                v23 = v327;
                                v64 = v310;
                                v145 = v289;
                                v142 = (void *)v301;
                                goto LABEL_341;
                              }
                              if (a4)
                              {
                                v233 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v234 = *MEMORY[0x1E0D025B8];
                                v351 = *MEMORY[0x1E0CB2D50];
                                v268 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("messagesService"));
                                v352 = v268;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v352, &v351, 1);
                                v265 = (void *)objc_claimAutoreleasedReturnValue();
                                v20 = 0;
                                v266 = 0;
                                *a4 = (id)objc_msgSend(v233, "initWithDomain:code:userInfo:", v234, 2);
                                goto LABEL_385;
                              }
                              v266 = 0;
                              v20 = 0;
LABEL_383:
                              v18 = v328;
                              v23 = v327;
                              v64 = v310;
                              v145 = v289;
                              v142 = (void *)v301;
                              goto LABEL_342;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v270 = v167;
                              goto LABEL_226;
                            }
                            if (a4)
                            {
                              v231 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v232 = *MEMORY[0x1E0D025B8];
                              v353 = *MEMORY[0x1E0CB2D50];
                              v266 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("messageType"));
                              v354 = v266;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v354, &v353, 1);
                              v267 = (void *)objc_claimAutoreleasedReturnValue();
                              v20 = 0;
                              v270 = 0;
                              *a4 = (id)objc_msgSend(v231, "initWithDomain:code:userInfo:", v232, 2);
                              goto LABEL_383;
                            }
                            v270 = 0;
                            v20 = 0;
                            v18 = v328;
                            v23 = v327;
                            v64 = v310;
LABEL_381:
                            v145 = v289;
                            v142 = (void *)v301;
                            goto LABEL_343;
                          }
                          if (a4)
                          {
                            v227 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v228 = *MEMORY[0x1E0D025B8];
                            v355 = *MEMORY[0x1E0CB2D50];
                            v229 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v260 = objc_opt_class();
                            v230 = v229;
                            v64 = v310;
                            v270 = (id)objc_msgSend(v230, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v260, CFSTR("tapbackType"));
                            v356 = v270;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v356, &v355, 1);
                            v269 = (void *)objc_claimAutoreleasedReturnValue();
                            v20 = 0;
                            v272 = 0;
                            *a4 = (id)objc_msgSend(v227, "initWithDomain:code:userInfo:", v228, 2);
                            v18 = v328;
                            v23 = v327;
                            goto LABEL_381;
                          }
                          v272 = 0;
                          v20 = 0;
LABEL_379:
                          v18 = v328;
                          v23 = v327;
                          v145 = v289;
                          v142 = (void *)v301;
                          goto LABEL_344;
                        }
                        if (a4)
                        {
                          v223 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v224 = *MEMORY[0x1E0D025B8];
                          v357 = *MEMORY[0x1E0CB2D50];
                          v225 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v259 = objc_opt_class();
                          v226 = v225;
                          v64 = v310;
                          v272 = (id)objc_msgSend(v226, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v259, CFSTR("tapbackAssociatedMessageID"));
                          v358 = v272;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v358, &v357, 1);
                          v271 = (void *)objc_claimAutoreleasedReturnValue();
                          v20 = 0;
                          v274 = 0;
                          *a4 = (id)objc_msgSend(v223, "initWithDomain:code:userInfo:", v224, 2);
                          goto LABEL_379;
                        }
                        v274 = 0;
                        v20 = 0;
LABEL_334:
                        v18 = v328;
                        v23 = v327;
                        v145 = v289;
                        v142 = (void *)v301;
LABEL_345:

                        goto LABEL_346;
                      }
                      if (a4)
                      {
                        v219 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v220 = *MEMORY[0x1E0D025B8];
                        v359 = *MEMORY[0x1E0CB2D50];
                        v221 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v258 = objc_opt_class();
                        v222 = v221;
                        v64 = v310;
                        v274 = (id)objc_msgSend(v222, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v258, CFSTR("isBusinessChat"));
                        v360 = v274;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v360, &v359, 1);
                        v273 = (void *)objc_claimAutoreleasedReturnValue();
                        v20 = 0;
                        v276 = 0;
                        *a4 = (id)objc_msgSend(v219, "initWithDomain:code:userInfo:", v220, 2);
                        goto LABEL_334;
                      }
                      v276 = 0;
                      v20 = 0;
LABEL_330:
                      v18 = v328;
                      v23 = v327;
                      v145 = v289;
                      v142 = (void *)v301;
LABEL_346:

                      goto LABEL_347;
                    }
                    if (a4)
                    {
                      v213 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v214 = *MEMORY[0x1E0D025B8];
                      v361 = *MEMORY[0x1E0CB2D50];
                      v215 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v257 = objc_opt_class();
                      v216 = v215;
                      v64 = v310;
                      v276 = (id)objc_msgSend(v216, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v257, CFSTR("isPinned"));
                      v362 = v276;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v362, &v361, 1);
                      v275 = (void *)objc_claimAutoreleasedReturnValue();
                      v20 = 0;
                      v278 = 0;
                      *a4 = (id)objc_msgSend(v213, "initWithDomain:code:userInfo:", v214, 2);
                      goto LABEL_330;
                    }
                    v278 = 0;
                    v20 = 0;
LABEL_326:
                    v18 = v328;
                    v23 = v327;
                    v145 = v289;
                    v142 = (void *)v301;
LABEL_347:

                    v208 = v279;
                    goto LABEL_348;
                  }
                  if (a4)
                  {
                    v209 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v210 = *MEMORY[0x1E0D025B8];
                    v363 = *MEMORY[0x1E0CB2D50];
                    v211 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v256 = objc_opt_class();
                    v212 = v211;
                    v64 = v310;
                    v278 = (id)objc_msgSend(v212, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v256, CFSTR("isRead"));
                    v364 = v278;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v364, &v363, 1);
                    v277 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = 0;
                    v280 = 0;
                    *a4 = (id)objc_msgSend(v209, "initWithDomain:code:userInfo:", v210, 2);
                    goto LABEL_326;
                  }
                  v280 = 0;
                  v20 = 0;
                  v18 = v328;
                  v23 = v327;
                  v145 = v289;
                  v208 = v279;
LABEL_322:
                  v142 = (void *)v301;
LABEL_348:

                  v202 = v281;
                  goto LABEL_349;
                }
                if (a4)
                {
                  v203 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v204 = *MEMORY[0x1E0D025B8];
                  v365 = *MEMORY[0x1E0CB2D50];
                  v205 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v255 = objc_opt_class();
                  v206 = v205;
                  v64 = v310;
                  v280 = (id)objc_msgSend(v206, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v255, CFSTR("isJunk"));
                  v366 = v280;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v366, &v365, 1);
                  v207 = objc_claimAutoreleasedReturnValue();
                  v20 = 0;
                  v282 = 0;
                  *a4 = (id)objc_msgSend(v203, "initWithDomain:code:userInfo:", v204, 2, v207);
                  v208 = (void *)v207;
                  v18 = v328;
                  v23 = v327;
                  v145 = v289;
                  goto LABEL_322;
                }
                v282 = 0;
                v20 = 0;
                v18 = v328;
                v23 = v327;
                v145 = v289;
                v202 = v281;
LABEL_315:
                v142 = (void *)v301;
LABEL_349:

                v196 = v283;
                goto LABEL_350;
              }
              if (a4)
              {
                v197 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v198 = *MEMORY[0x1E0D025B8];
                v367 = *MEMORY[0x1E0CB2D50];
                v199 = objc_alloc(MEMORY[0x1E0CB3940]);
                v254 = objc_opt_class();
                v200 = v199;
                v64 = v310;
                v282 = (id)objc_msgSend(v200, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v254, CFSTR("isGroupThread"));
                v368 = v282;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v368, &v367, 1);
                v201 = objc_claimAutoreleasedReturnValue();
                v20 = 0;
                v284 = 0;
                *a4 = (id)objc_msgSend(v197, "initWithDomain:code:userInfo:", v198, 2, v201);
                v202 = (void *)v201;
                v18 = v328;
                v23 = v327;
                v145 = v289;
                goto LABEL_315;
              }
              v284 = 0;
              v20 = 0;
              v18 = v328;
              v23 = v327;
              v145 = v289;
              v196 = v283;
LABEL_309:
              v142 = (void *)v301;
LABEL_350:

              goto LABEL_351;
            }
            if (a4)
            {
              v191 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v192 = *MEMORY[0x1E0D025B8];
              v369 = *MEMORY[0x1E0CB2D50];
              v193 = objc_alloc(MEMORY[0x1E0CB3940]);
              v253 = objc_opt_class();
              v194 = v193;
              v64 = v310;
              v284 = (id)objc_msgSend(v194, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v253, CFSTR("isFromMe"));
              v370 = v284;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v370, &v369, 1);
              v195 = objc_claimAutoreleasedReturnValue();
              v20 = 0;
              v286 = 0;
              *a4 = (id)objc_msgSend(v191, "initWithDomain:code:userInfo:", v192, 2, v195);
              v196 = (void *)v195;
              v18 = v328;
              v23 = v327;
              v145 = v289;
              goto LABEL_309;
            }
            v286 = 0;
            v20 = 0;
LABEL_303:
            v18 = v328;
            v23 = v327;
            v145 = v289;
            v142 = (void *)v301;
LABEL_351:

            goto LABEL_352;
          }
          if (a4)
          {
            v187 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v188 = *MEMORY[0x1E0D025B8];
            v371 = *MEMORY[0x1E0CB2D50];
            v189 = objc_alloc(MEMORY[0x1E0CB3940]);
            v252 = objc_opt_class();
            v190 = v189;
            v64 = v310;
            v286 = (id)objc_msgSend(v190, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v252, CFSTR("isTwoFactorCode"));
            v372 = v286;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v372, &v371, 1);
            v285 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = 0;
            v287 = 0;
            *a4 = (id)objc_msgSend(v187, "initWithDomain:code:userInfo:", v188, 2);
            goto LABEL_303;
          }
          v287 = 0;
          v20 = 0;
LABEL_288:
          v18 = v328;
          v23 = v327;
          v145 = v289;
          v142 = (void *)v301;
LABEL_352:

          goto LABEL_353;
        }
        if (a4)
        {
          v183 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v184 = *MEMORY[0x1E0D025B8];
          v373 = *MEMORY[0x1E0CB2D50];
          v185 = objc_alloc(MEMORY[0x1E0CB3940]);
          v251 = objc_opt_class();
          v186 = v185;
          v64 = v310;
          v287 = (id)objc_msgSend(v186, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v251, CFSTR("isNew"));
          v374 = v287;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v374, &v373, 1);
          v288 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          v290 = 0;
          *a4 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v184, 2);
          goto LABEL_288;
        }
        v290 = 0;
        v20 = 0;
        v18 = v328;
        v23 = v327;
        v145 = v289;
LABEL_282:
        v142 = (void *)v301;
LABEL_353:

        goto LABEL_354;
      }
      if (a4)
      {
        v179 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v293 = *MEMORY[0x1E0D025B8];
        v375 = *MEMORY[0x1E0CB2D50];
        v180 = objc_alloc(MEMORY[0x1E0CB3940]);
        v250 = objc_opt_class();
        v181 = v180;
        v64 = v310;
        v290 = (id)objc_msgSend(v181, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v250, CFSTR("personaId"));
        v376 = v290;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v376, &v375, 1);
        v291 = (void *)objc_claimAutoreleasedReturnValue();
        v182 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v293, 2);
        v20 = 0;
        v292 = 0;
        *a4 = v182;
        v18 = v328;
        v23 = v327;
        goto LABEL_282;
      }
      v292 = 0;
      v20 = 0;
      v18 = v328;
      v23 = v327;
      v142 = (void *)v301;
LABEL_354:

      goto LABEL_355;
    }
    if (a4)
    {
      v295 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v175 = *MEMORY[0x1E0D025B8];
      v377 = *MEMORY[0x1E0CB2D50];
      v176 = objc_alloc(MEMORY[0x1E0CB3940]);
      v249 = objc_opt_class();
      v177 = v176;
      v64 = v310;
      v292 = (id)objc_msgSend(v177, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v249, CFSTR("contentProtection"));
      v378 = v292;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v378, &v377, 1);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = (id)objc_msgSend(v295, "initWithDomain:code:userInfo:", v175, 2, v145);
      v20 = 0;
      v294 = 0;
      *a4 = v178;
      v18 = v328;
      v23 = v327;
      goto LABEL_354;
    }
    v294 = 0;
    v20 = 0;
    v18 = v328;
    v23 = v327;
LABEL_355:
    v123 = v142;

    goto LABEL_356;
  }
  v140 = v139;
  v122 = v137;
  v18 = v328;
  v23 = v327;
  if (a4)
    *a4 = objc_retainAutorelease(v139);

  v20 = 0;
  v123 = v122;
LABEL_169:
  v64 = v310;
LABEL_357:

  v112 = v123;
  v41 = v305;
LABEL_358:

LABEL_360:
LABEL_361:

LABEL_362:
  v103 = v303;
LABEL_363:

LABEL_364:
LABEL_365:
  v72 = v306;

LABEL_366:
LABEL_367:

  v48 = v324;
  self = v311;
LABEL_368:

LABEL_369:
LABEL_370:

LABEL_371:
LABEL_372:

LABEL_373:
LABEL_374:

LABEL_375:
LABEL_376:

LABEL_377:
  return v20;
}

- (id)_toHandlesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMProactiveHarvestingMessages toHandles](self, "toHandles", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_accountHandlesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMProactiveHarvestingMessages accountHandles](self, "accountHandles", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  _QWORD v113[34];
  _QWORD v114[36];

  v114[34] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingMessages uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages domainID](self, "domainID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingMessages absoluteTimestamp](self, "absoluteTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMProactiveHarvestingMessages conversationId](self, "conversationId");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages author](self, "author");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages suggestedNickname](self, "suggestedNickname");
  v11 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages suggestedPhotoPath](self, "suggestedPhotoPath");
  v12 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages recipients](self, "recipients");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages attachmentURL](self, "attachmentURL");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages content](self, "content");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages fromHandle](self, "fromHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "jsonDictionary");
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMProactiveHarvestingMessages _toHandlesJSONArray](self, "_toHandlesJSONArray");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages accountIdentifier](self, "accountIdentifier");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages accountType](self, "accountType");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages _accountHandlesJSONArray](self, "_accountHandlesJSONArray");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages attachment](self, "attachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsonDictionary");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMProactiveHarvestingMessages url](self, "url");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages contentProtection](self, "contentProtection");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages personaId](self, "personaId");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMProactiveHarvestingMessages hasIsNew](self, "hasIsNew"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isNew](self, "isNew"));
    v100 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v100 = 0;
  }
  if (-[BMProactiveHarvestingMessages hasIsTwoFactorCode](self, "hasIsTwoFactorCode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isTwoFactorCode](self, "isTwoFactorCode"));
    v99 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v99 = 0;
  }
  if (-[BMProactiveHarvestingMessages hasIsFromMe](self, "hasIsFromMe"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isFromMe](self, "isFromMe"));
    v98 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v98 = 0;
  }
  if (-[BMProactiveHarvestingMessages hasIsGroupThread](self, "hasIsGroupThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isGroupThread](self, "isGroupThread"));
    v97 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v97 = 0;
  }
  if (-[BMProactiveHarvestingMessages hasIsJunk](self, "hasIsJunk"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isJunk](self, "isJunk"));
    v96 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v96 = 0;
  }
  if (-[BMProactiveHarvestingMessages hasIsRead](self, "hasIsRead"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isRead](self, "isRead"));
    v95 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v95 = 0;
  }
  if (-[BMProactiveHarvestingMessages hasIsPinned](self, "hasIsPinned"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isPinned](self, "isPinned"));
    v94 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v94 = 0;
  }
  if (-[BMProactiveHarvestingMessages hasIsBusinessChat](self, "hasIsBusinessChat"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isBusinessChat](self, "isBusinessChat"));
    v93 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v93 = 0;
  }
  -[BMProactiveHarvestingMessages tapbackAssociatedMessageID](self, "tapbackAssociatedMessageID");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMProactiveHarvestingMessages hasTapbackType](self, "hasTapbackType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMProactiveHarvestingMessages tapbackType](self, "tapbackType"));
    v91 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v91 = 0;
  }
  -[BMProactiveHarvestingMessages messageType](self, "messageType");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMessages messagesService](self, "messagesService");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMProactiveHarvestingMessages hasMessageEffect](self, "hasMessageEffect"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMProactiveHarvestingMessages messageEffect](self, "messageEffect"));
    v88 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v88 = 0;
  }
  if (-[BMProactiveHarvestingMessages hasIsKnownSender](self, "hasIsKnownSender"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMessages isKnownSender](self, "isKnownSender"));
    v87 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v87 = 0;
  }
  -[BMProactiveHarvestingMessages conversationUUID](self, "conversationUUID");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = CFSTR("uniqueID");
  v15 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v76 = (void *)v15;
  v114[0] = v15;
  v113[1] = CFSTR("domainID");
  v16 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)v16;
  v114[1] = v16;
  v113[2] = CFSTR("absoluteTimestamp");
  v17 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)v17;
  v114[2] = v17;
  v113[3] = CFSTR("conversationId");
  v18 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v18;
  v114[3] = v18;
  v113[4] = CFSTR("author");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v72 = (void *)v19;
  v114[4] = v19;
  v113[5] = CFSTR("suggestedNickname");
  v20 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v20;
  v114[5] = v20;
  v113[6] = CFSTR("suggestedPhotoPath");
  v21 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)v21;
  v114[6] = v21;
  v113[7] = CFSTR("recipients");
  v22 = (uint64_t)v112;
  if (!v112)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v114[7] = v22;
  v113[8] = CFSTR("attachmentURL");
  v23 = v111;
  if (!v111)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v114[8] = v23;
  v113[9] = CFSTR("content");
  v24 = (uint64_t)v110;
  if (!v110)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v24;
  v114[9] = v24;
  v113[10] = CFSTR("fromHandle");
  v25 = (uint64_t)v109;
  if (!v109)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v80 = (void *)v25;
  v114[10] = v25;
  v113[11] = CFSTR("toHandles");
  v26 = (uint64_t)v108;
  if (!v108)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v79 = (void *)v26;
  v114[11] = v26;
  v113[12] = CFSTR("accountIdentifier");
  v27 = (uint64_t)v107;
  if (!v107)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v27;
  v114[12] = v27;
  v113[13] = CFSTR("accountType");
  v29 = (uint64_t)v106;
  if (!v106)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v67 = (void *)v29;
  v114[13] = v29;
  v113[14] = CFSTR("accountHandles");
  v30 = (uint64_t)v105;
  if (!v105)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v30;
  v114[14] = v30;
  v113[15] = CFSTR("attachment");
  v31 = (uint64_t)v104;
  if (!v104)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v65 = (void *)v31;
  v114[15] = v31;
  v113[16] = CFSTR("url");
  v32 = (uint64_t)v103;
  if (!v103)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v64 = (void *)v32;
  v114[16] = v32;
  v113[17] = CFSTR("contentProtection");
  v33 = (uint64_t)v102;
  if (!v102)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v63 = (void *)v33;
  v114[17] = v33;
  v113[18] = CFSTR("personaId");
  v34 = (uint64_t)v101;
  if (!v101)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v62 = (void *)v34;
  v114[18] = v34;
  v113[19] = CFSTR("isNew");
  v35 = (uint64_t)v100;
  if (!v100)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v35;
  v114[19] = v35;
  v113[20] = CFSTR("isTwoFactorCode");
  v36 = (uint64_t)v99;
  if (!v99)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v36;
  v114[20] = v36;
  v113[21] = CFSTR("isFromMe");
  v37 = (uint64_t)v98;
  if (!v98)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v37;
  v114[21] = v37;
  v113[22] = CFSTR("isGroupThread");
  v38 = (uint64_t)v97;
  if (!v97)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v38;
  v114[22] = v38;
  v113[23] = CFSTR("isJunk");
  v39 = (uint64_t)v96;
  if (!v96)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v39;
  v114[23] = v39;
  v113[24] = CFSTR("isRead");
  v40 = (uint64_t)v95;
  if (!v95)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v85 = (void *)v3;
  v56 = (void *)v40;
  v114[24] = v40;
  v113[25] = CFSTR("isPinned");
  v41 = (uint64_t)v94;
  if (!v94)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v82 = (void *)v10;
  v83 = (void *)v9;
  v84 = v8;
  v55 = (void *)v41;
  v114[25] = v41;
  v113[26] = CFSTR("isBusinessChat");
  v42 = (uint64_t)v93;
  if (!v93)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v53 = v42;
  v114[26] = v42;
  v113[27] = CFSTR("tapbackAssociatedMessageID");
  v43 = v92;
  if (!v92)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v42, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v81 = (void *)v4;
  v114[27] = v43;
  v113[28] = CFSTR("tapbackType");
  v44 = v91;
  if (!v91)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v78 = (void *)v11;
  v114[28] = v44;
  v113[29] = CFSTR("messageType");
  v45 = v90;
  if (!v90)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v69 = (void *)v22;
  v114[29] = v45;
  v113[30] = CFSTR("messagesService");
  v46 = v89;
  if (!v89)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v12;
  v114[30] = v46;
  v113[31] = CFSTR("messageEffect");
  v48 = v88;
  if (!v88)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v114[31] = v48;
  v113[32] = CFSTR("isKnownSender");
  v49 = v87;
  if (!v87)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v114[32] = v49;
  v113[33] = CFSTR("conversationUUID");
  v50 = v86;
  if (!v86)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v114[33] = v50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 34, v53);
  v77 = (id)objc_claimAutoreleasedReturnValue();
  if (!v86)

  v51 = v28;
  if (!v87)
  {

    v51 = v28;
  }
  if (!v88)
  {

    v51 = v28;
  }
  if (!v89)
  {

    v51 = v28;
  }
  if (!v90)
  {

    v51 = v28;
  }
  if (!v91)
  {

    v51 = v28;
  }
  if (!v92)
  {

    v51 = v28;
  }
  if (!v93)
  {

    v51 = v28;
  }
  if (!v94)
  {

    v51 = v28;
  }
  if (!v95)
  {

    v51 = v28;
  }
  if (!v96)
  {

    v51 = v28;
  }
  if (!v97)
  {

    v51 = v28;
  }
  if (!v98)
  {

    v51 = v28;
  }
  if (!v99)
  {

    v51 = v28;
  }
  if (!v100)
  {

    v51 = v28;
  }
  if (!v101)
  {

    v51 = v28;
  }
  if (!v102)
  {

    v51 = v28;
  }
  if (!v103)
  {

    v51 = v28;
  }
  if (!v104)
  {

    v51 = v28;
  }
  if (!v105)
  {

    v51 = v28;
  }
  if (!v106)
  {

    v51 = v28;
  }
  if (!v107)

  if (!v108)
  if (!v109)

  if (!v110)
  if (!v111)

  if (v112)
  {
    if (v47)
      goto LABEL_159;
  }
  else
  {

    if (v47)
    {
LABEL_159:
      if (v78)
        goto LABEL_160;
      goto LABEL_168;
    }
  }

  if (v78)
  {
LABEL_160:
    if (v82)
      goto LABEL_161;
    goto LABEL_169;
  }
LABEL_168:

  if (v82)
  {
LABEL_161:
    if (v83)
      goto LABEL_162;
    goto LABEL_170;
  }
LABEL_169:

  if (v83)
  {
LABEL_162:
    if (v84)
      goto LABEL_163;
    goto LABEL_171;
  }
LABEL_170:

  if (v84)
  {
LABEL_163:
    if (v81)
      goto LABEL_164;
LABEL_172:

    if (v85)
      goto LABEL_165;
LABEL_173:

    goto LABEL_165;
  }
LABEL_171:

  if (!v81)
    goto LABEL_172;
LABEL_164:
  if (!v85)
    goto LABEL_173;
LABEL_165:

  return v77;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  int v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  int v147;
  int v148;
  int v149;
  void *v151;
  void *v152;
  void *v153;
  void *v154;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingMessages uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingMessages uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages domainID](self, "domainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingMessages domainID](self, "domainID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages absoluteTimestamp](self, "absoluteTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingMessages absoluteTimestamp](self, "absoluteTimestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages conversationId](self, "conversationId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationId");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingMessages conversationId](self, "conversationId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages author](self, "author");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "author");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingMessages author](self, "author");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "author");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages suggestedNickname](self, "suggestedNickname");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestedNickname");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMProactiveHarvestingMessages suggestedNickname](self, "suggestedNickname");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestedNickname");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages suggestedPhotoPath](self, "suggestedPhotoPath");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestedPhotoPath");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMProactiveHarvestingMessages suggestedPhotoPath](self, "suggestedPhotoPath");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestedPhotoPath");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages recipients](self, "recipients");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipients");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMProactiveHarvestingMessages recipients](self, "recipients");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recipients");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages attachmentURL](self, "attachmentURL");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentURL");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMProactiveHarvestingMessages attachmentURL](self, "attachmentURL");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachmentURL");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages content](self, "content");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v62 = objc_claimAutoreleasedReturnValue();
    if (v61 == (void *)v62)
    {

    }
    else
    {
      v63 = (void *)v62;
      -[BMProactiveHarvestingMessages content](self, "content");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "content");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v64, "isEqual:", v65);

      if (!v66)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages fromHandle](self, "fromHandle");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fromHandle");
    v68 = objc_claimAutoreleasedReturnValue();
    if (v67 == (void *)v68)
    {

    }
    else
    {
      v69 = (void *)v68;
      -[BMProactiveHarvestingMessages fromHandle](self, "fromHandle");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fromHandle");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v70, "isEqual:", v71);

      if (!v72)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages toHandles](self, "toHandles");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toHandles");
    v74 = objc_claimAutoreleasedReturnValue();
    if (v73 == (void *)v74)
    {

    }
    else
    {
      v75 = (void *)v74;
      -[BMProactiveHarvestingMessages toHandles](self, "toHandles");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "toHandles");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v76, "isEqual:", v77);

      if (!v78)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages accountIdentifier](self, "accountIdentifier");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountIdentifier");
    v80 = objc_claimAutoreleasedReturnValue();
    if (v79 == (void *)v80)
    {

    }
    else
    {
      v81 = (void *)v80;
      -[BMProactiveHarvestingMessages accountIdentifier](self, "accountIdentifier");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountIdentifier");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v82, "isEqual:", v83);

      if (!v84)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages accountType](self, "accountType");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountType");
    v86 = objc_claimAutoreleasedReturnValue();
    if (v85 == (void *)v86)
    {

    }
    else
    {
      v87 = (void *)v86;
      -[BMProactiveHarvestingMessages accountType](self, "accountType");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountType");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v88, "isEqual:", v89);

      if (!v90)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages accountHandles](self, "accountHandles");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountHandles");
    v92 = objc_claimAutoreleasedReturnValue();
    if (v91 == (void *)v92)
    {

    }
    else
    {
      v93 = (void *)v92;
      -[BMProactiveHarvestingMessages accountHandles](self, "accountHandles");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountHandles");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v94, "isEqual:", v95);

      if (!v96)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages attachment](self, "attachment");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachment");
    v98 = objc_claimAutoreleasedReturnValue();
    if (v97 == (void *)v98)
    {

    }
    else
    {
      v99 = (void *)v98;
      -[BMProactiveHarvestingMessages attachment](self, "attachment");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachment");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v100, "isEqual:", v101);

      if (!v102)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages url](self, "url");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v104 = objc_claimAutoreleasedReturnValue();
    if (v103 == (void *)v104)
    {

    }
    else
    {
      v105 = (void *)v104;
      -[BMProactiveHarvestingMessages url](self, "url");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "url");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend(v106, "isEqual:", v107);

      if (!v108)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages contentProtection](self, "contentProtection");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v110 = objc_claimAutoreleasedReturnValue();
    if (v109 == (void *)v110)
    {

    }
    else
    {
      v111 = (void *)v110;
      -[BMProactiveHarvestingMessages contentProtection](self, "contentProtection");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend(v112, "isEqual:", v113);

      if (!v114)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages personaId](self, "personaId");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v116 = objc_claimAutoreleasedReturnValue();
    if (v115 == (void *)v116)
    {

    }
    else
    {
      v117 = (void *)v116;
      -[BMProactiveHarvestingMessages personaId](self, "personaId");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend(v118, "isEqual:", v119);

      if (!v120)
        goto LABEL_146;
    }
    if (-[BMProactiveHarvestingMessages hasIsNew](self, "hasIsNew") || objc_msgSend(v5, "hasIsNew"))
    {
      if (!-[BMProactiveHarvestingMessages hasIsNew](self, "hasIsNew"))
        goto LABEL_146;
      if (!objc_msgSend(v5, "hasIsNew"))
        goto LABEL_146;
      v121 = -[BMProactiveHarvestingMessages isNew](self, "isNew");
      if (v121 != objc_msgSend(v5, "isNew"))
        goto LABEL_146;
    }
    if (-[BMProactiveHarvestingMessages hasIsTwoFactorCode](self, "hasIsTwoFactorCode")
      || objc_msgSend(v5, "hasIsTwoFactorCode"))
    {
      if (!-[BMProactiveHarvestingMessages hasIsTwoFactorCode](self, "hasIsTwoFactorCode"))
        goto LABEL_146;
      if (!objc_msgSend(v5, "hasIsTwoFactorCode"))
        goto LABEL_146;
      v122 = -[BMProactiveHarvestingMessages isTwoFactorCode](self, "isTwoFactorCode");
      if (v122 != objc_msgSend(v5, "isTwoFactorCode"))
        goto LABEL_146;
    }
    if (-[BMProactiveHarvestingMessages hasIsFromMe](self, "hasIsFromMe")
      || objc_msgSend(v5, "hasIsFromMe"))
    {
      if (!-[BMProactiveHarvestingMessages hasIsFromMe](self, "hasIsFromMe"))
        goto LABEL_146;
      if (!objc_msgSend(v5, "hasIsFromMe"))
        goto LABEL_146;
      v123 = -[BMProactiveHarvestingMessages isFromMe](self, "isFromMe");
      if (v123 != objc_msgSend(v5, "isFromMe"))
        goto LABEL_146;
    }
    if (-[BMProactiveHarvestingMessages hasIsGroupThread](self, "hasIsGroupThread")
      || objc_msgSend(v5, "hasIsGroupThread"))
    {
      if (!-[BMProactiveHarvestingMessages hasIsGroupThread](self, "hasIsGroupThread"))
        goto LABEL_146;
      if (!objc_msgSend(v5, "hasIsGroupThread"))
        goto LABEL_146;
      v124 = -[BMProactiveHarvestingMessages isGroupThread](self, "isGroupThread");
      if (v124 != objc_msgSend(v5, "isGroupThread"))
        goto LABEL_146;
    }
    if (-[BMProactiveHarvestingMessages hasIsJunk](self, "hasIsJunk") || objc_msgSend(v5, "hasIsJunk"))
    {
      if (!-[BMProactiveHarvestingMessages hasIsJunk](self, "hasIsJunk"))
        goto LABEL_146;
      if (!objc_msgSend(v5, "hasIsJunk"))
        goto LABEL_146;
      v125 = -[BMProactiveHarvestingMessages isJunk](self, "isJunk");
      if (v125 != objc_msgSend(v5, "isJunk"))
        goto LABEL_146;
    }
    if (-[BMProactiveHarvestingMessages hasIsRead](self, "hasIsRead") || objc_msgSend(v5, "hasIsRead"))
    {
      if (!-[BMProactiveHarvestingMessages hasIsRead](self, "hasIsRead"))
        goto LABEL_146;
      if (!objc_msgSend(v5, "hasIsRead"))
        goto LABEL_146;
      v126 = -[BMProactiveHarvestingMessages isRead](self, "isRead");
      if (v126 != objc_msgSend(v5, "isRead"))
        goto LABEL_146;
    }
    if (-[BMProactiveHarvestingMessages hasIsPinned](self, "hasIsPinned")
      || objc_msgSend(v5, "hasIsPinned"))
    {
      if (!-[BMProactiveHarvestingMessages hasIsPinned](self, "hasIsPinned"))
        goto LABEL_146;
      if (!objc_msgSend(v5, "hasIsPinned"))
        goto LABEL_146;
      v127 = -[BMProactiveHarvestingMessages isPinned](self, "isPinned");
      if (v127 != objc_msgSend(v5, "isPinned"))
        goto LABEL_146;
    }
    if (-[BMProactiveHarvestingMessages hasIsBusinessChat](self, "hasIsBusinessChat")
      || objc_msgSend(v5, "hasIsBusinessChat"))
    {
      if (!-[BMProactiveHarvestingMessages hasIsBusinessChat](self, "hasIsBusinessChat"))
        goto LABEL_146;
      if (!objc_msgSend(v5, "hasIsBusinessChat"))
        goto LABEL_146;
      v128 = -[BMProactiveHarvestingMessages isBusinessChat](self, "isBusinessChat");
      if (v128 != objc_msgSend(v5, "isBusinessChat"))
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages tapbackAssociatedMessageID](self, "tapbackAssociatedMessageID");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tapbackAssociatedMessageID");
    v130 = objc_claimAutoreleasedReturnValue();
    if (v129 == (void *)v130)
    {

    }
    else
    {
      v131 = (void *)v130;
      -[BMProactiveHarvestingMessages tapbackAssociatedMessageID](self, "tapbackAssociatedMessageID");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tapbackAssociatedMessageID");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = objc_msgSend(v132, "isEqual:", v133);

      if (!v134)
        goto LABEL_146;
    }
    if (-[BMProactiveHarvestingMessages hasTapbackType](self, "hasTapbackType")
      || objc_msgSend(v5, "hasTapbackType"))
    {
      if (!-[BMProactiveHarvestingMessages hasTapbackType](self, "hasTapbackType"))
        goto LABEL_146;
      if (!objc_msgSend(v5, "hasTapbackType"))
        goto LABEL_146;
      v135 = -[BMProactiveHarvestingMessages tapbackType](self, "tapbackType");
      if (v135 != objc_msgSend(v5, "tapbackType"))
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages messageType](self, "messageType");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageType");
    v137 = objc_claimAutoreleasedReturnValue();
    if (v136 == (void *)v137)
    {

    }
    else
    {
      v138 = (void *)v137;
      -[BMProactiveHarvestingMessages messageType](self, "messageType");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageType");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = objc_msgSend(v139, "isEqual:", v140);

      if (!v141)
        goto LABEL_146;
    }
    -[BMProactiveHarvestingMessages messagesService](self, "messagesService");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messagesService");
    v143 = objc_claimAutoreleasedReturnValue();
    if (v142 == (void *)v143)
    {

    }
    else
    {
      v144 = (void *)v143;
      -[BMProactiveHarvestingMessages messagesService](self, "messagesService");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messagesService");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = objc_msgSend(v145, "isEqual:", v146);

      if (!v147)
        goto LABEL_146;
    }
    if (!-[BMProactiveHarvestingMessages hasMessageEffect](self, "hasMessageEffect")
      && !objc_msgSend(v5, "hasMessageEffect")
      || -[BMProactiveHarvestingMessages hasMessageEffect](self, "hasMessageEffect")
      && objc_msgSend(v5, "hasMessageEffect")
      && (v148 = -[BMProactiveHarvestingMessages messageEffect](self, "messageEffect"),
          v148 == objc_msgSend(v5, "messageEffect")))
    {
      if (!-[BMProactiveHarvestingMessages hasIsKnownSender](self, "hasIsKnownSender")
        && !objc_msgSend(v5, "hasIsKnownSender")
        || -[BMProactiveHarvestingMessages hasIsKnownSender](self, "hasIsKnownSender")
        && objc_msgSend(v5, "hasIsKnownSender")
        && (v149 = -[BMProactiveHarvestingMessages isKnownSender](self, "isKnownSender"),
            v149 == objc_msgSend(v5, "isKnownSender")))
      {
        -[BMProactiveHarvestingMessages conversationUUID](self, "conversationUUID");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "conversationUUID");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        if (v151 == v152)
        {
          v12 = 1;
        }
        else
        {
          -[BMProactiveHarvestingMessages conversationUUID](self, "conversationUUID");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "conversationUUID");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v153, "isEqual:", v154);

        }
        goto LABEL_147;
      }
    }
LABEL_146:
    v12 = 0;
LABEL_147:

    goto LABEL_148;
  }
  v12 = 0;
LABEL_148:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)suggestedNickname
{
  return self->_suggestedNickname;
}

- (NSString)suggestedPhotoPath
{
  return self->_suggestedPhotoPath;
}

- (NSString)recipients
{
  return self->_recipients;
}

- (NSString)attachmentURL
{
  return self->_attachmentURL;
}

- (NSString)content
{
  return self->_content;
}

- (BMProactiveHarvestingNamedHandle)fromHandle
{
  return self->_fromHandle;
}

- (NSArray)toHandles
{
  return self->_toHandles;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (NSArray)accountHandles
{
  return self->_accountHandles;
}

- (BMProactiveHarvestingContentAttachment)attachment
{
  return self->_attachment;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (BOOL)hasIsNew
{
  return self->_hasIsNew;
}

- (void)setHasIsNew:(BOOL)a3
{
  self->_hasIsNew = a3;
}

- (BOOL)isTwoFactorCode
{
  return self->_isTwoFactorCode;
}

- (BOOL)hasIsTwoFactorCode
{
  return self->_hasIsTwoFactorCode;
}

- (void)setHasIsTwoFactorCode:(BOOL)a3
{
  self->_hasIsTwoFactorCode = a3;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (BOOL)hasIsFromMe
{
  return self->_hasIsFromMe;
}

- (void)setHasIsFromMe:(BOOL)a3
{
  self->_hasIsFromMe = a3;
}

- (BOOL)isGroupThread
{
  return self->_isGroupThread;
}

- (BOOL)hasIsGroupThread
{
  return self->_hasIsGroupThread;
}

- (void)setHasIsGroupThread:(BOOL)a3
{
  self->_hasIsGroupThread = a3;
}

- (BOOL)isJunk
{
  return self->_isJunk;
}

- (BOOL)hasIsJunk
{
  return self->_hasIsJunk;
}

- (void)setHasIsJunk:(BOOL)a3
{
  self->_hasIsJunk = a3;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (BOOL)hasIsRead
{
  return self->_hasIsRead;
}

- (void)setHasIsRead:(BOOL)a3
{
  self->_hasIsRead = a3;
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (BOOL)hasIsPinned
{
  return self->_hasIsPinned;
}

- (void)setHasIsPinned:(BOOL)a3
{
  self->_hasIsPinned = a3;
}

- (BOOL)isBusinessChat
{
  return self->_isBusinessChat;
}

- (BOOL)hasIsBusinessChat
{
  return self->_hasIsBusinessChat;
}

- (void)setHasIsBusinessChat:(BOOL)a3
{
  self->_hasIsBusinessChat = a3;
}

- (NSString)tapbackAssociatedMessageID
{
  return self->_tapbackAssociatedMessageID;
}

- (int)tapbackType
{
  return self->_tapbackType;
}

- (BOOL)hasTapbackType
{
  return self->_hasTapbackType;
}

- (void)setHasTapbackType:(BOOL)a3
{
  self->_hasTapbackType = a3;
}

- (NSString)messageType
{
  return self->_messageType;
}

- (NSString)messagesService
{
  return self->_messagesService;
}

- (int)messageEffect
{
  return self->_messageEffect;
}

- (BOOL)hasMessageEffect
{
  return self->_hasMessageEffect;
}

- (void)setHasMessageEffect:(BOOL)a3
{
  self->_hasMessageEffect = a3;
}

- (BOOL)isKnownSender
{
  return self->_isKnownSender;
}

- (BOOL)hasIsKnownSender
{
  return self->_hasIsKnownSender;
}

- (void)setHasIsKnownSender:(BOOL)a3
{
  self->_hasIsKnownSender = a3;
}

- (NSString)conversationUUID
{
  return self->_conversationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationUUID, 0);
  objc_storeStrong((id *)&self->_messagesService, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_tapbackAssociatedMessageID, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_accountHandles, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_suggestedPhotoPath, 0);
  objc_storeStrong((id *)&self->_suggestedNickname, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 2)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMProactiveHarvestingMessages initByReadFrom:]([BMProactiveHarvestingMessages alloc], "initByReadFrom:", v6);
    v7[13] = 2;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
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
  _QWORD v38[36];

  v38[34] = *MEMORY[0x1E0C80C00];
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domainID"), 2, 0, 2, 13, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 3, 0, 1);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("conversationId"), 2, 0, 4, 13, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("author"), 2, 0, 5, 13, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestedNickname"), 2, 0, 6, 13, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestedPhotoPath"), 2, 0, 7, 13, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("recipients"), 2, 0, 8, 13, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("attachmentURL"), 2, 0, 9, 13, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("content"), 2, 0, 10, 13, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("fromHandle_json"), 5, 1, &__block_literal_global_17211);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("toHandles_json"), 5, 1, &__block_literal_global_106);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accountIdentifier"), 2, 0, 13, 13, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accountType"), 2, 0, 14, 13, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("accountHandles_json"), 5, 1, &__block_literal_global_107);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("attachment_json"), 5, 1, &__block_literal_global_108);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("url"), 2, 0, 17, 13, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 18, 13, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 19, 13, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isNew"), 0, 0, 20, 12, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isTwoFactorCode"), 0, 0, 21, 12, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFromMe"), 0, 0, 22, 12, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isGroupThread"), 0, 0, 23, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isJunk"), 0, 0, 24, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRead"), 0, 0, 25, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPinned"), 0, 0, 26, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBusinessChat"), 0, 0, 27, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tapbackAssociatedMessageID"), 2, 0, 28, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tapbackType"), 0, 0, 29, 2, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messageType"), 2, 0, 30, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messagesService"), 2, 0, 31, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messageEffect"), 0, 0, 32, 2, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isKnownSender"), 0, 0, 33, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("conversationUUID"), 2, 0, 34, 13, 0);
  v38[0] = v37;
  v38[1] = v36;
  v38[2] = v35;
  v38[3] = v34;
  v38[4] = v33;
  v38[5] = v32;
  v38[6] = v31;
  v38[7] = v30;
  v38[8] = v29;
  v38[9] = v28;
  v38[10] = v27;
  v38[11] = v26;
  v38[12] = v25;
  v38[13] = v24;
  v38[14] = v23;
  v38[15] = v22;
  v38[16] = v21;
  v38[17] = v20;
  v38[18] = v19;
  v38[19] = v18;
  v38[20] = v17;
  v38[21] = v16;
  v38[22] = v15;
  v38[23] = v14;
  v38[24] = v2;
  v38[25] = v3;
  v38[26] = v4;
  v38[27] = v13;
  v38[28] = v5;
  v38[29] = v6;
  v38[30] = v7;
  v38[31] = v12;
  v38[32] = v8;
  v38[33] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 34);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B838;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
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
  _QWORD v38[36];

  v38[34] = *MEMORY[0x1E0C80C00];
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v38[0] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domainID"), 2, 13, 0);
  v38[1] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 3, 0, 0);
  v38[2] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("conversationId"), 4, 13, 0);
  v38[3] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("author"), 5, 13, 0);
  v38[4] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestedNickname"), 6, 13, 0);
  v38[5] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestedPhotoPath"), 7, 13, 0);
  v38[6] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("recipients"), 8, 13, 0);
  v38[7] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("attachmentURL"), 9, 13, 0);
  v38[8] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("content"), 10, 13, 0);
  v38[9] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fromHandle"), 11, 14, objc_opt_class());
  v38[10] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("toHandles"), 12, 14, objc_opt_class());
  v38[11] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accountIdentifier"), 13, 13, 0);
  v38[12] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accountType"), 14, 13, 0);
  v38[13] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accountHandles"), 15, 13, 0);
  v38[14] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("attachment"), 16, 14, objc_opt_class());
  v38[15] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("url"), 17, 13, 0);
  v38[16] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 18, 13, 0);
  v38[17] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 19, 13, 0);
  v38[18] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isNew"), 20, 12, 0);
  v38[19] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isTwoFactorCode"), 21, 12, 0);
  v38[20] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFromMe"), 22, 12, 0);
  v38[21] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isGroupThread"), 23, 12, 0);
  v38[22] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isJunk"), 24, 12, 0);
  v38[23] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRead"), 25, 12, 0);
  v38[24] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPinned"), 26, 12, 0);
  v38[25] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBusinessChat"), 27, 12, 0);
  v38[26] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tapbackAssociatedMessageID"), 28, 13, 0);
  v38[27] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tapbackType"), 29, 2, 0);
  v38[28] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messageType"), 30, 13, 0);
  v38[29] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messagesService"), 31, 13, 0);
  v38[30] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messageEffect"), 32, 2, 0);
  v38[31] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isKnownSender"), 33, 12, 0);
  v38[32] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("conversationUUID"), 34, 13, 0);
  v38[33] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 34);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __40__BMProactiveHarvestingMessages_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __40__BMProactiveHarvestingMessages_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accountHandlesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMProactiveHarvestingMessages_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_toHandlesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMProactiveHarvestingMessages_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fromHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMProactiveHarvestingMessages)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 conversationId:(id)a6 author:(id)a7 suggestedNickname:(id)a8 suggestedPhotoPath:(id)a9 recipients:(id)a10 attachmentURL:(id)a11 content:(id)a12 fromHandle:(id)a13 toHandles:(id)a14 accountIdentifier:(id)a15 accountType:(id)a16 accountHandles:(id)a17 attachment:(id)a18 url:(id)a19 contentProtection:(id)a20 personaId:(id)a21 isNew:(id)a22 isTwoFactorCode:(id)a23 isFromMe:(id)a24 isGroupThread:(id)a25 isJunk:(id)a26 isRead:(id)a27 isPinned:(id)a28 isBusinessChat:(id)a29 tapbackAssociatedMessageID:(id)a30 tapbackType:(id)a31 messageType:(id)a32 messagesService:(id)a33
{
  return -[BMProactiveHarvestingMessages initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:](self, "initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
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
           a31,
           a32,
           a33,
           0,
           0,
           0);
}

- (BMProactiveHarvestingMessages)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 conversationId:(id)a6 author:(id)a7 suggestedNickname:(id)a8 suggestedPhotoPath:(id)a9 recipients:(id)a10 attachmentURL:(id)a11 content:(id)a12 fromHandle:(id)a13 toHandles:(id)a14 accountIdentifier:(id)a15 accountType:(id)a16 accountHandles:(id)a17 attachment:(id)a18 url:(id)a19 contentProtection:(id)a20 personaId:(id)a21
{
  return -[BMProactiveHarvestingMessages initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:](self, "initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
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
           0,
           0,
           0);
}

@end
