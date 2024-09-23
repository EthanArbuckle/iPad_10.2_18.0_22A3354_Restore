@implementation BMProactiveHarvestingMail

- (BMProactiveHarvestingMail)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromField:(id)a8 toField:(id)a9 ccField:(id)a10 bccField:(id)a11 headers:(id)a12 subject:(id)a13 htmlContentData:(id)a14 isFullyDownloaded:(id)a15 htmlContent:(id)a16 textContent:(id)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listID:(id)a22 accountType:(id)a23 attachments:(id)a24 fromHandle:(id)a25 toHandles:(id)a26 ccHandles:(id)a27 bccHandles:(id)a28 contentProtection:(id)a29 personaId:(id)a30
{
  return -[BMProactiveHarvestingMail initWithUniqueID:domainID:absoluteTimestamp:accountIdentifier:messageIdentifier:fromField:toField:ccField:bccField:headers:subject:htmlContentData:isFullyDownloaded:htmlContent:textContent:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listID:accountType:attachments:fromHandle:toHandles:ccHandles:bccHandles:contentProtection:personaId:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:](self, "initWithUniqueID:domainID:absoluteTimestamp:accountIdentifier:messageIdentifier:fromField:toField:ccField:bccField:headers:subject:htmlContentData:isFullyDownloaded:htmlContent:textContent:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listID:accountType:attachments:fromHandle:toHandles:ccHandles:bccHandles:contentProtection:personaId:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
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
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (BMProactiveHarvestingMail)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromField:(id)a8 toField:(id)a9 ccField:(id)a10 bccField:(id)a11 headers:(id)a12 subject:(id)a13 htmlContentData:(id)a14 isFullyDownloaded:(id)a15 htmlContent:(id)a16 textContent:(id)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listID:(id)a22 accountType:(id)a23 attachments:(id)a24 fromHandle:(id)a25 toHandles:(id)a26 ccHandles:(id)a27 bccHandles:(id)a28 contentProtection:(id)a29 personaId:(id)a30 conversationId:(id)a31 dateReceived:(id)a32 mailCategories:(id)a33 isNew:(id)a34 isTwoFactorCode:(id)a35 isFromMe:(id)a36 isJunk:(id)a37 isRead:(id)a38 isVIP:(id)a39 isFlagged:(id)a40
{
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  BMProactiveHarvestingMail *v52;
  double v53;
  double v54;
  int v55;
  id v58;
  id v59;
  id v60;
  id v61;
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
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v93;
  objc_super v94;

  v89 = a3;
  v58 = a4;
  v88 = a4;
  v93 = a5;
  v59 = a6;
  v87 = a6;
  v60 = a7;
  v86 = a7;
  v61 = a8;
  v85 = a8;
  v84 = a9;
  v83 = a10;
  v82 = a11;
  v81 = a12;
  v80 = a13;
  v79 = a14;
  v91 = a15;
  v78 = a16;
  v77 = a17;
  v76 = a18;
  v75 = a19;
  v74 = a20;
  v73 = a21;
  v72 = a22;
  v71 = a23;
  v70 = a24;
  v69 = a25;
  v68 = a26;
  v67 = a27;
  v66 = a28;
  v65 = a29;
  v64 = a30;
  v63 = a31;
  v44 = a32;
  v45 = a33;
  v46 = a34;
  v47 = a35;
  v48 = a36;
  v49 = a37;
  v90 = a38;
  v50 = a39;
  v51 = a40;
  v94.receiver = self;
  v94.super_class = (Class)BMProactiveHarvestingMail;
  v52 = -[BMEventBase init](&v94, sel_init);
  if (v52)
  {
    v52->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v52->_uniqueID, a3);
    objc_storeStrong((id *)&v52->_domainID, v58);
    if (v93)
    {
      v52->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v93, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v52->_hasRaw_absoluteTimestamp = 0;
      v53 = -1.0;
    }
    v52->_raw_absoluteTimestamp = v53;
    objc_storeStrong((id *)&v52->_accountIdentifier, v59);
    objc_storeStrong((id *)&v52->_messageIdentifier, v60);
    objc_storeStrong((id *)&v52->_fromField, v61);
    objc_storeStrong((id *)&v52->_toField, a9);
    objc_storeStrong((id *)&v52->_ccField, a10);
    objc_storeStrong((id *)&v52->_bccField, a11);
    objc_storeStrong((id *)&v52->_headers, a12);
    objc_storeStrong((id *)&v52->_subject, a13);
    objc_storeStrong((id *)&v52->_htmlContentData, a14);
    if (v91)
    {
      v52->_hasIsFullyDownloaded = 1;
      v52->_isFullyDownloaded = objc_msgSend(v91, "BOOLValue");
    }
    else
    {
      v52->_hasIsFullyDownloaded = 0;
      v52->_isFullyDownloaded = 0;
    }
    objc_storeStrong((id *)&v52->_htmlContent, a16);
    objc_storeStrong((id *)&v52->_textContent, a17);
    objc_storeStrong((id *)&v52->_securityMethod, a18);
    objc_storeStrong((id *)&v52->_accountHandles, a19);
    objc_storeStrong((id *)&v52->_replyTo, a20);
    objc_storeStrong((id *)&v52->_mailboxIdentifiers, a21);
    objc_storeStrong((id *)&v52->_listID, a22);
    objc_storeStrong((id *)&v52->_accountType, a23);
    objc_storeStrong((id *)&v52->_attachments, a24);
    objc_storeStrong((id *)&v52->_fromHandle, a25);
    objc_storeStrong((id *)&v52->_toHandles, a26);
    objc_storeStrong((id *)&v52->_ccHandles, a27);
    objc_storeStrong((id *)&v52->_bccHandles, a28);
    objc_storeStrong((id *)&v52->_contentProtection, a29);
    objc_storeStrong((id *)&v52->_personaId, a30);
    objc_storeStrong((id *)&v52->_conversationId, a31);
    if (v44)
    {
      v52->_hasRaw_dateReceived = 1;
      objc_msgSend(v44, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v52->_hasRaw_dateReceived = 0;
      v54 = -1.0;
    }
    v52->_raw_dateReceived = v54;
    if (v45)
    {
      v52->_hasMailCategories = 1;
      v55 = objc_msgSend(v45, "intValue");
    }
    else
    {
      v52->_hasMailCategories = 0;
      v55 = -1;
    }
    v52->_mailCategories = v55;
    if (v46)
    {
      v52->_hasIsNew = 1;
      v52->_isNew = objc_msgSend(v46, "BOOLValue");
    }
    else
    {
      v52->_hasIsNew = 0;
      v52->_isNew = 0;
    }
    if (v47)
    {
      v52->_hasIsTwoFactorCode = 1;
      v52->_isTwoFactorCode = objc_msgSend(v47, "BOOLValue");
    }
    else
    {
      v52->_hasIsTwoFactorCode = 0;
      v52->_isTwoFactorCode = 0;
    }
    if (v48)
    {
      v52->_hasIsFromMe = 1;
      v52->_isFromMe = objc_msgSend(v48, "BOOLValue");
    }
    else
    {
      v52->_hasIsFromMe = 0;
      v52->_isFromMe = 0;
    }
    if (v49)
    {
      v52->_hasIsJunk = 1;
      v52->_isJunk = objc_msgSend(v49, "BOOLValue");
    }
    else
    {
      v52->_hasIsJunk = 0;
      v52->_isJunk = 0;
    }
    if (v90)
    {
      v52->_hasIsRead = 1;
      v52->_isRead = objc_msgSend(v90, "BOOLValue");
    }
    else
    {
      v52->_hasIsRead = 0;
      v52->_isRead = 0;
    }
    if (v50)
    {
      v52->_hasIsVIP = 1;
      v52->_isVIP = objc_msgSend(v50, "BOOLValue");
    }
    else
    {
      v52->_hasIsVIP = 0;
      v52->_isVIP = 0;
    }
    if (v51)
    {
      v52->_hasIsFlagged = 1;
      v52->_isFlagged = objc_msgSend(v51, "BOOLValue");
    }
    else
    {
      v52->_hasIsFlagged = 0;
      v52->_isFlagged = 0;
    }
  }

  return v52;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
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
  id v20;
  id v21;
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

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProactiveHarvestingMail uniqueID](self, "uniqueID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail domainID](self, "domainID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail absoluteTimestamp](self, "absoluteTimestamp");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail accountIdentifier](self, "accountIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail messageIdentifier](self, "messageIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail fromField](self, "fromField");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail toField](self, "toField");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail ccField](self, "ccField");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail bccField](self, "bccField");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail headers](self, "headers");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail subject](self, "subject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail htmlContentData](self, "htmlContentData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isFullyDownloaded](self, "isFullyDownloaded"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail htmlContent](self, "htmlContent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail textContent](self, "textContent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail securityMethod](self, "securityMethod");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail accountHandles](self, "accountHandles");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail replyTo](self, "replyTo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail mailboxIdentifiers](self, "mailboxIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail listID](self, "listID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail accountType](self, "accountType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail attachments](self, "attachments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail fromHandle](self, "fromHandle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail toHandles](self, "toHandles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail ccHandles](self, "ccHandles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail bccHandles](self, "bccHandles");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail contentProtection](self, "contentProtection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail personaId](self, "personaId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail conversationId](self, "conversationId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail dateReceived](self, "dateReceived");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMProactiveHarvestingMail mailCategories](self, "mailCategories"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isNew](self, "isNew"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isTwoFactorCode](self, "isTwoFactorCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isFromMe](self, "isFromMe"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isJunk](self, "isJunk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isRead](self, "isRead"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isVIP](self, "isVIP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isFlagged](self, "isFlagged"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "initWithFormat:", CFSTR("BMProactiveHarvestingMail with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, accountIdentifier: %@, messageIdentifier: %@, fromField: %@, toField: %@, ccField: %@, bccField: %@, headers: %@, subject: %@, htmlContentData: %@, isFullyDownloaded: %@, htmlContent: %@, textContent: %@, securityMethod: %@, accountHandles: %@, replyTo: %@, mailboxIdentifiers: %@, listID: %@, accountType: %@, attachments: %@, fromHandle: %@, toHandles: %@, ccHandles: %@, bccHandles: %@, contentProtection: %@, personaId: %@, conversationId: %@, dateReceived: %@, mailCategories: %@, isNew: %@, isTwoFactorCode: %@, isFromMe: %@, isJunk: %@, isRead: %@, isVIP: %@, isFlagged: %@"), v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v30, v32, v29, v28, v27,
              v26,
              v31,
              v23,
              v25,
              v22,
              v19,
              v18,
              v17,
              v16,
              v24,
              v15,
              v12,
              v14,
              v13,
              v11,
              v10,
              v9,
              v8,
              v7,
              v3,
              v4,
              v5);

  return (NSString *)v21;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingMail *v5;
  void *v6;
  void *v7;
  void *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  objc_class *v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  void *v39;
  objc_class *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  char v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  BOOL v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSArray *headers;
  uint64_t v112;
  NSArray *accountHandles;
  uint64_t v114;
  NSArray *mailboxIdentifiers;
  uint64_t v116;
  NSArray *attachments;
  uint64_t v118;
  NSArray *toHandles;
  uint64_t v120;
  NSArray *ccHandles;
  uint64_t v122;
  NSArray *bccHandles;
  int v124;
  BMProactiveHarvestingMail *v125;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  objc_super v132;
  uint64_t v133;
  uint64_t v134;

  v4 = a3;
  v132.receiver = self;
  v132.super_class = (Class)BMProactiveHarvestingMail;
  v5 = -[BMEventBase init](&v132, sel_init);
  if (!v5)
    goto LABEL_186;
  v129 = (void *)objc_opt_new();
  v131 = (void *)objc_opt_new();
  v130 = (void *)objc_opt_new();
  v127 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (int *)MEMORY[0x1E0D82BF0];
  v10 = (int *)MEMORY[0x1E0D82BD8];
  v11 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v11])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v9;
        v17 = *(_QWORD *)&v4[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v4[*v10])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
        *(_QWORD *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v20 = v14++ >= 9;
        if (v20)
        {
          v15 = 0;
          v21 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      v21 = v4[*v11];
      if (v4[*v11])
        v15 = 0;
LABEL_15:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
          goto LABEL_81;
        case 2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 88;
          goto LABEL_81;
        case 3u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v25 = *v9;
          v26 = *(_QWORD *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v26);
            *(_QWORD *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v109 = 24;
          goto LABEL_182;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 96;
          goto LABEL_81;
        case 5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
          goto LABEL_81;
        case 6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 112;
          goto LABEL_81;
        case 7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 120;
          goto LABEL_81;
        case 8u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 128;
          goto LABEL_81;
        case 9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 136;
          goto LABEL_81;
        case 0xAu:
          v133 = 0;
          v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v28 = -[BMProactiveHarvestingMailHeaderEntry initByReadFrom:]([BMProactiveHarvestingMailHeaderEntry alloc], "initByReadFrom:", v4);
          if (!v28)
            goto LABEL_188;
          v29 = v28;
          v30 = v129;
          goto LABEL_76;
        case 0xBu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 152;
          goto LABEL_81;
        case 0xCu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 160;
          goto LABEL_81;
        case 0xDu:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasIsFullyDownloaded = 1;
          while (2)
          {
            v34 = *v9;
            v35 = *(_QWORD *)&v4[v34];
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v35);
              *(_QWORD *)&v4[v34] = v36;
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                v20 = v32++ >= 9;
                if (v20)
                {
                  v33 = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v33 = 0;
LABEL_144:
          v107 = v33 != 0;
          v108 = 48;
          goto LABEL_177;
        case 0xEu:
          PBReaderReadData();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 168;
          goto LABEL_81;
        case 0xFu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 176;
          goto LABEL_81;
        case 0x10u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 184;
          goto LABEL_81;
        case 0x11u:
          PBReaderReadString();
          v38 = objc_claimAutoreleasedReturnValue();
          if (!v38)
            goto LABEL_188;
          v29 = (void *)v38;
          v39 = v131;
          goto LABEL_55;
        case 0x12u:
          v133 = 0;
          v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v40 = -[BMProactiveHarvestingNamedHandle initByReadFrom:]([BMProactiveHarvestingNamedHandle alloc], "initByReadFrom:", v4);
          if (!v40)
            goto LABEL_188;
          v41 = 200;
          goto LABEL_66;
        case 0x13u:
          PBReaderReadString();
          v42 = objc_claimAutoreleasedReturnValue();
          if (!v42)
            goto LABEL_188;
          v29 = (void *)v42;
          v39 = v130;
LABEL_55:
          objc_msgSend(v39, "addObject:", v29, v127);
          goto LABEL_77;
        case 0x14u:
          v133 = 0;
          v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v40 = -[BMProactiveHarvestingNamedHandle initByReadFrom:]([BMProactiveHarvestingNamedHandle alloc], "initByReadFrom:", v4);
          if (!v40)
            goto LABEL_188;
          v41 = 216;
          goto LABEL_66;
        case 0x15u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 224;
          goto LABEL_81;
        case 0x16u:
          v133 = 0;
          v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v43 = -[BMProactiveHarvestingContentAttachment initByReadFrom:]([BMProactiveHarvestingContentAttachment alloc], "initByReadFrom:", v4);
          if (!v43)
            goto LABEL_188;
          v29 = v43;
          v30 = v127;
          goto LABEL_76;
        case 0x17u:
          v133 = 0;
          v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v40 = -[BMProactiveHarvestingNamedHandle initByReadFrom:]([BMProactiveHarvestingNamedHandle alloc], "initByReadFrom:", v4);
          if (!v40)
            goto LABEL_188;
          v41 = 240;
LABEL_66:
          v44 = *(Class *)((char *)&v5->super.super.isa + v41);
          *(Class *)((char *)&v5->super.super.isa + v41) = v40;

          PBReaderRecallMark();
          continue;
        case 0x18u:
          v133 = 0;
          v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v45 = -[BMProactiveHarvestingNamedHandle initByReadFrom:]([BMProactiveHarvestingNamedHandle alloc], "initByReadFrom:", v4);
          if (!v45)
            goto LABEL_188;
          v29 = v45;
          v30 = v6;
          goto LABEL_76;
        case 0x19u:
          v133 = 0;
          v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v46 = -[BMProactiveHarvestingNamedHandle initByReadFrom:]([BMProactiveHarvestingNamedHandle alloc], "initByReadFrom:", v4);
          if (!v46)
            goto LABEL_188;
          v29 = v46;
          v30 = v7;
          goto LABEL_76;
        case 0x1Au:
          v133 = 0;
          v134 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_188;
          v47 = -[BMProactiveHarvestingNamedHandle initByReadFrom:]([BMProactiveHarvestingNamedHandle alloc], "initByReadFrom:", v4);
          if (!v47)
            goto LABEL_188;
          v29 = v47;
          v30 = v8;
LABEL_76:
          objc_msgSend(v30, "addObject:", v29, v127);
          PBReaderRecallMark();
LABEL_77:

          continue;
        case 0x1Bu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 272;
          goto LABEL_81;
        case 0x1Cu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 280;
          goto LABEL_81;
        case 0x1Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 288;
LABEL_81:
          v48 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0x1Eu:
          v5->_hasRaw_dateReceived = 1;
          v49 = *v9;
          v50 = *(_QWORD *)&v4[v49];
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v50);
            *(_QWORD *)&v4[v49] = v50 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0;
          }
          v109 = 40;
LABEL_182:
          *(Class *)((char *)&v5->super.super.isa + v109) = v27;
          continue;
        case 0x1Fu:
          v51 = 0;
          v52 = 0;
          v53 = 0;
          v5->_hasMailCategories = 1;
          while (2)
          {
            v54 = *v9;
            v55 = *(_QWORD *)&v4[v54];
            v56 = v55 + 1;
            if (v55 == -1 || v56 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v55);
              *(_QWORD *)&v4[v54] = v56;
              v53 |= (unint64_t)(v57 & 0x7F) << v51;
              if (v57 < 0)
              {
                v51 += 7;
                v20 = v52++ >= 9;
                if (v20)
                {
                  LODWORD(v53) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v53) = 0;
LABEL_148:
          v5->_mailCategories = v53;
          continue;
        case 0x20u:
          v58 = 0;
          v59 = 0;
          v60 = 0;
          v5->_hasIsNew = 1;
          while (2)
          {
            v61 = *v9;
            v62 = *(_QWORD *)&v4[v61];
            v63 = v62 + 1;
            if (v62 == -1 || v63 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v64 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v62);
              *(_QWORD *)&v4[v61] = v63;
              v60 |= (unint64_t)(v64 & 0x7F) << v58;
              if (v64 < 0)
              {
                v58 += 7;
                v20 = v59++ >= 9;
                if (v20)
                {
                  v60 = 0;
                  goto LABEL_152;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v60 = 0;
LABEL_152:
          v107 = v60 != 0;
          v108 = 51;
          goto LABEL_177;
        case 0x21u:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          v5->_hasIsTwoFactorCode = 1;
          while (2)
          {
            v68 = *v9;
            v69 = *(_QWORD *)&v4[v68];
            v70 = v69 + 1;
            if (v69 == -1 || v70 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v69);
              *(_QWORD *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                v20 = v66++ >= 9;
                if (v20)
                {
                  v67 = 0;
                  goto LABEL_156;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v67 = 0;
LABEL_156:
          v107 = v67 != 0;
          v108 = 53;
          goto LABEL_177;
        case 0x22u:
          v72 = 0;
          v73 = 0;
          v74 = 0;
          v5->_hasIsFromMe = 1;
          while (2)
          {
            v75 = *v9;
            v76 = *(_QWORD *)&v4[v75];
            v77 = v76 + 1;
            if (v76 == -1 || v77 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v78 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v76);
              *(_QWORD *)&v4[v75] = v77;
              v74 |= (unint64_t)(v78 & 0x7F) << v72;
              if (v78 < 0)
              {
                v72 += 7;
                v20 = v73++ >= 9;
                if (v20)
                {
                  v74 = 0;
                  goto LABEL_160;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v74 = 0;
LABEL_160:
          v107 = v74 != 0;
          v108 = 55;
          goto LABEL_177;
        case 0x23u:
          v79 = 0;
          v80 = 0;
          v81 = 0;
          v5->_hasIsJunk = 1;
          while (2)
          {
            v82 = *v9;
            v83 = *(_QWORD *)&v4[v82];
            v84 = v83 + 1;
            if (v83 == -1 || v84 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v83);
              *(_QWORD *)&v4[v82] = v84;
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                v20 = v80++ >= 9;
                if (v20)
                {
                  v81 = 0;
                  goto LABEL_164;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v81 = 0;
LABEL_164:
          v107 = v81 != 0;
          v108 = 57;
          goto LABEL_177;
        case 0x24u:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          v5->_hasIsRead = 1;
          while (2)
          {
            v89 = *v9;
            v90 = *(_QWORD *)&v4[v89];
            v91 = v90 + 1;
            if (v90 == -1 || v91 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v92 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v90);
              *(_QWORD *)&v4[v89] = v91;
              v88 |= (unint64_t)(v92 & 0x7F) << v86;
              if (v92 < 0)
              {
                v86 += 7;
                v20 = v87++ >= 9;
                if (v20)
                {
                  v88 = 0;
                  goto LABEL_168;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v88 = 0;
LABEL_168:
          v107 = v88 != 0;
          v108 = 59;
          goto LABEL_177;
        case 0x25u:
          v93 = 0;
          v94 = 0;
          v95 = 0;
          v5->_hasIsVIP = 1;
          while (2)
          {
            v96 = *v9;
            v97 = *(_QWORD *)&v4[v96];
            v98 = v97 + 1;
            if (v97 == -1 || v98 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v99 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v97);
              *(_QWORD *)&v4[v96] = v98;
              v95 |= (unint64_t)(v99 & 0x7F) << v93;
              if (v99 < 0)
              {
                v93 += 7;
                v20 = v94++ >= 9;
                if (v20)
                {
                  v95 = 0;
                  goto LABEL_172;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v95 = 0;
LABEL_172:
          v107 = v95 != 0;
          v108 = 61;
          goto LABEL_177;
        case 0x26u:
          v100 = 0;
          v101 = 0;
          v102 = 0;
          v5->_hasIsFlagged = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_188:

          goto LABEL_185;
      }
      while (1)
      {
        v103 = *v9;
        v104 = *(_QWORD *)&v4[v103];
        v105 = v104 + 1;
        if (v104 == -1 || v105 > *(_QWORD *)&v4[*v10])
          break;
        v106 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v104);
        *(_QWORD *)&v4[v103] = v105;
        v102 |= (unint64_t)(v106 & 0x7F) << v100;
        if ((v106 & 0x80) == 0)
          goto LABEL_174;
        v100 += 7;
        v20 = v101++ >= 9;
        if (v20)
        {
          v102 = 0;
          goto LABEL_176;
        }
      }
      v4[*v11] = 1;
LABEL_174:
      if (v4[*v11])
        v102 = 0;
LABEL_176:
      v107 = v102 != 0;
      v108 = 63;
LABEL_177:
      *((_BYTE *)&v5->super.super.isa + v108) = v107;
    }
    while (*(_QWORD *)&v4[*v9] < *(_QWORD *)&v4[*v10]);
  }
  v110 = objc_msgSend(v129, "copy", v127);
  headers = v5->_headers;
  v5->_headers = (NSArray *)v110;

  v112 = objc_msgSend(v131, "copy");
  accountHandles = v5->_accountHandles;
  v5->_accountHandles = (NSArray *)v112;

  v114 = objc_msgSend(v130, "copy");
  mailboxIdentifiers = v5->_mailboxIdentifiers;
  v5->_mailboxIdentifiers = (NSArray *)v114;

  v116 = objc_msgSend(v128, "copy");
  attachments = v5->_attachments;
  v5->_attachments = (NSArray *)v116;

  v118 = objc_msgSend(v6, "copy");
  toHandles = v5->_toHandles;
  v5->_toHandles = (NSArray *)v118;

  v120 = objc_msgSend(v7, "copy");
  ccHandles = v5->_ccHandles;
  v5->_ccHandles = (NSArray *)v120;

  v122 = objc_msgSend(v8, "copy");
  bccHandles = v5->_bccHandles;
  v5->_bccHandles = (NSArray *)v122;

  v124 = v4[*v11];
  if (v124)
LABEL_185:
    v125 = 0;
  else
LABEL_186:
    v125 = v5;

  return v125;
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
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_domainID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_accountIdentifier)
    PBDataWriterWriteStringField();
  if (self->_messageIdentifier)
    PBDataWriterWriteStringField();
  if (self->_fromField)
    PBDataWriterWriteStringField();
  if (self->_toField)
    PBDataWriterWriteStringField();
  if (self->_ccField)
    PBDataWriterWriteStringField();
  if (self->_bccField)
    PBDataWriterWriteStringField();
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v5 = self->_headers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v71;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v71 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v9);
        v69 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    }
    while (v7);
  }

  if (self->_subject)
    PBDataWriterWriteStringField();
  if (self->_htmlContentData)
    PBDataWriterWriteStringField();
  if (self->_hasIsFullyDownloaded)
    PBDataWriterWriteBOOLField();
  if (self->_htmlContent)
    PBDataWriterWriteDataField();
  if (self->_textContent)
    PBDataWriterWriteStringField();
  if (self->_securityMethod)
    PBDataWriterWriteStringField();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v11 = self->_accountHandles;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v66;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
    }
    while (v13);
  }

  if (self->_replyTo)
  {
    v69 = 0;
    PBDataWriterPlaceMark();
    -[BMProactiveHarvestingNamedHandle writeTo:](self->_replyTo, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v16 = self->_mailboxIdentifiers;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v62;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v62 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
    }
    while (v18);
  }

  if (self->_listID)
  {
    v69 = 0;
    PBDataWriterPlaceMark();
    -[BMProactiveHarvestingNamedHandle writeTo:](self->_listID, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_accountType)
    PBDataWriterWriteStringField();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v21 = self->_attachments;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v58;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v58 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v25);
        v69 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v26, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
    }
    while (v23);
  }

  if (self->_fromHandle)
  {
    v69 = 0;
    PBDataWriterPlaceMark();
    -[BMProactiveHarvestingNamedHandle writeTo:](self->_fromHandle, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v27 = self->_toHandles;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v53, v76, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v54;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v54 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v31);
        v69 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v32, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v53, v76, 16);
    }
    while (v29);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v33 = self->_ccHandles;
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v49, v75, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v50;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v50 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v37);
        v69 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v38, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v37;
      }
      while (v35 != v37);
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v49, v75, 16);
    }
    while (v35);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v39 = self->_bccHandles;
  v40 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v45, v74, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v46;
    do
    {
      v43 = 0;
      do
      {
        if (*(_QWORD *)v46 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v43);
        v69 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v44, "writeTo:", v4, (_QWORD)v45);
        PBDataWriterRecallMark();
        ++v43;
      }
      while (v41 != v43);
      v41 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v45, v74, 16);
    }
    while (v41);
  }

  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();
  if (self->_conversationId)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_dateReceived)
    PBDataWriterWriteDoubleField();
  if (self->_hasMailCategories)
    PBDataWriterWriteInt32Field();
  if (self->_hasIsNew)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsTwoFactorCode)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsFromMe)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsJunk)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsRead)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsVIP)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsFlagged)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingMail writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingMail)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  BMProactiveHarvestingMail *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  BMProactiveHarvestingMail *v25;
  BMProactiveHarvestingMail *v26;
  id v27;
  id v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  id *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  void *v82;
  id v83;
  BMProactiveHarvestingMailHeaderEntry *v84;
  BMProactiveHarvestingMailHeaderEntry *v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  uint64_t v93;
  void *v94;
  id *v95;
  uint64_t *v96;
  uint64_t v97;
  void *v98;
  id v99;
  uint64_t v100;
  BMProactiveHarvestingMail *v101;
  id v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  id *v111;
  void *v112;
  id v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  int v122;
  void *v123;
  id v124;
  uint64_t v125;
  void *v126;
  id v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  id v136;
  void *v137;
  id v138;
  id v139;
  uint64_t v140;
  id v141;
  void *v142;
  id v143;
  id v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  id *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  id v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  id v164;
  id v165;
  uint64_t v166;
  id v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  id *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  id v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  int v187;
  id v188;
  BMProactiveHarvestingNamedHandle *v189;
  id v190;
  void *v191;
  id *v192;
  id v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  id v197;
  id v198;
  uint64_t v199;
  id v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  id *v208;
  uint64_t v209;
  void *v210;
  BMProactiveHarvestingNamedHandle *v211;
  BMProactiveHarvestingContentAttachment *v212;
  BMProactiveHarvestingContentAttachment *v213;
  id v214;
  uint64_t v215;
  void *v216;
  BMProactiveHarvestingNamedHandle *v217;
  void *v218;
  void *v219;
  int v220;
  id v221;
  BMProactiveHarvestingNamedHandle *v222;
  id v223;
  void *v224;
  id *v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  id v229;
  id v230;
  uint64_t v231;
  id v232;
  id v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  id v237;
  void *v238;
  id v239;
  uint64_t v240;
  void *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t j;
  void *v246;
  id v247;
  BMProactiveHarvestingNamedHandle *v248;
  BMProactiveHarvestingNamedHandle *v249;
  id v250;
  void *v251;
  void *v252;
  int v253;
  id v254;
  BMProactiveHarvestingNamedHandle *v255;
  id v256;
  id v257;
  void *v258;
  id v259;
  uint64_t v260;
  uint64_t v261;
  id v262;
  id v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  id v267;
  uint64_t v268;
  id v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t k;
  void *v274;
  id v275;
  BMProactiveHarvestingNamedHandle *v276;
  BMProactiveHarvestingNamedHandle *v277;
  id v278;
  void *v279;
  void *v280;
  int v281;
  id v282;
  uint64_t v283;
  id v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  id v288;
  id v289;
  id v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  id v297;
  BMProactiveHarvestingNamedHandle *v298;
  BMProactiveHarvestingNamedHandle *v299;
  id v300;
  void *v301;
  void *v302;
  id v303;
  id v304;
  uint64_t v305;
  id v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  id v310;
  id v311;
  id v312;
  id v313;
  uint64_t v314;
  id v315;
  id v316;
  uint64_t v317;
  id v318;
  id v319;
  uint64_t v320;
  id v321;
  id v322;
  id v323;
  void *v324;
  id v325;
  id v327;
  uint64_t v328;
  id v329;
  id v330;
  uint64_t v331;
  id v332;
  id v333;
  uint64_t v334;
  id v335;
  id v336;
  uint64_t v337;
  id v338;
  id v339;
  uint64_t v340;
  id v341;
  id v342;
  uint64_t v343;
  id v344;
  id v345;
  uint64_t v346;
  id v347;
  uint64_t v348;
  void *v349;
  void *v350;
  id v351;
  uint64_t v352;
  id v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  id v357;
  id v358;
  void *v359;
  id v360;
  void *v361;
  id v362;
  void *v363;
  id v364;
  void *v365;
  id v366;
  id v367;
  void *v368;
  id v369;
  void *v370;
  id v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  id v376;
  void *v377;
  void *v378;
  BMProactiveHarvestingNamedHandle *v379;
  void *v380;
  id v381;
  void *v382;
  void *v383;
  void *v384;
  id v385;
  id v386;
  id v387;
  BMProactiveHarvestingNamedHandle *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  id *v393;
  id *v394;
  BMProactiveHarvestingNamedHandle *v395;
  id v396;
  id v397;
  id v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  id v404;
  id v405;
  void *v406;
  id v407;
  void *v408;
  id v409;
  void *v410;
  void *v411;
  id v412;
  id v413;
  void *v414;
  void *v415;
  id v416;
  id v417;
  id v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  id v424;
  id v425;
  void *v426;
  id v427;
  id v428;
  void *v429;
  id v430;
  void *v431;
  id v432;
  id v433;
  id obj;
  void *v435;
  id *v436;
  BMProactiveHarvestingMail *v437;
  void *v438;
  id v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  id v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  id v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  id v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  id v460;
  id v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  id v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  id v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  id v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  uint64_t v481;
  void *v482;
  uint64_t v483;
  id v484;
  uint64_t v485;
  id v486;
  uint64_t v487;
  id v488;
  uint64_t v489;
  id v490;
  uint64_t v491;
  id v492;
  uint64_t v493;
  id v494;
  uint64_t v495;
  id v496;
  uint64_t v497;
  id v498;
  uint64_t v499;
  id v500;
  uint64_t v501;
  id v502;
  uint64_t v503;
  id v504;
  uint64_t v505;
  void *v506;
  uint64_t v507;
  void *v508;
  _BYTE v509[128];
  uint64_t v510;
  void *v511;
  uint64_t v512;
  void *v513;
  uint64_t v514;
  void *v515;
  _BYTE v516[128];
  uint64_t v517;
  void *v518;
  uint64_t v519;
  void *v520;
  uint64_t v521;
  void *v522;
  _BYTE v523[128];
  uint64_t v524;
  void *v525;
  uint64_t v526;
  BMProactiveHarvestingNamedHandle *v527;
  uint64_t v528;
  BMProactiveHarvestingNamedHandle *v529;
  uint64_t v530;
  BMProactiveHarvestingNamedHandle *v531;
  _BYTE v532[128];
  uint64_t v533;
  void *v534;
  uint64_t v535;
  id v536;
  uint64_t v537;
  BMProactiveHarvestingNamedHandle *v538;
  uint64_t v539;
  BMProactiveHarvestingNamedHandle *v540;
  uint64_t v541;
  BMProactiveHarvestingNamedHandle *v542;
  _BYTE v543[128];
  uint64_t v544;
  void *v545;
  uint64_t v546;
  BMProactiveHarvestingNamedHandle *v547;
  uint64_t v548;
  BMProactiveHarvestingNamedHandle *v549;
  uint64_t v550;
  BMProactiveHarvestingNamedHandle *v551;
  _BYTE v552[128];
  uint64_t v553;
  void *v554;
  uint64_t v555;
  id v556;
  uint64_t v557;
  id v558;
  uint64_t v559;
  id v560;
  uint64_t v561;
  id v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  id v566;
  uint64_t v567;
  id v568;
  uint64_t v569;
  id v570;
  _BYTE v571[128];
  uint64_t v572;
  void *v573;
  uint64_t v574;
  void *v575;
  uint64_t v576;
  id v577;
  uint64_t v578;
  id v579;
  uint64_t v580;
  id v581;
  uint64_t v582;
  id v583;
  uint64_t v584;
  id v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  id *v589;
  uint64_t v590;
  _QWORD v591[4];

  v591[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domainID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v439 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v439 = v9;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
      v10 = objc_claimAutoreleasedReturnValue();
      v437 = self;
      v441 = (void *)v10;
      if (!v10 || (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v436 = 0;
LABEL_23:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accountIdentifier"));
        v35 = objc_claimAutoreleasedReturnValue();
        v440 = (void *)v35;
        if (v35 && (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v55 = 0;
              v25 = 0;
              v21 = v439;
              a4 = v436;
              self = v437;
              goto LABEL_467;
            }
            v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v51 = v6;
            v52 = *MEMORY[0x1E0D025B8];
            v584 = *MEMORY[0x1E0CB2D50];
            v433 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("accountIdentifier"));
            v585 = v433;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v585, &v584, 1);
            v53 = objc_claimAutoreleasedReturnValue();
            v54 = v52;
            v6 = v51;
            v435 = (void *)v53;
            v55 = 0;
            v25 = 0;
            *a4 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v54, 2);
            v21 = v439;
            a4 = v436;
            goto LABEL_101;
          }
          v432 = v36;
        }
        else
        {
          v432 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("messageIdentifier"));
        v37 = objc_claimAutoreleasedReturnValue();
        v435 = (void *)v37;
        if (!v37 || (v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v433 = 0;
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v433 = v38;
LABEL_29:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fromField"));
          v39 = objc_claimAutoreleasedReturnValue();
          v431 = (void *)v39;
          if (!v39 || (v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v430 = 0;
            goto LABEL_32;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v430 = v40;
LABEL_32:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("toField"));
            v41 = objc_claimAutoreleasedReturnValue();
            v429 = (void *)v41;
            if (!v41 || (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v428 = 0;
              goto LABEL_35;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v428 = v42;
LABEL_35:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ccField"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v444 = v43;
              if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v427 = 0;
LABEL_38:
                v438 = v6;
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bccField"));
                v44 = objc_claimAutoreleasedReturnValue();
                v419 = v9;
                v426 = (void *)v44;
                if (v44 && (v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (a4)
                    {
                      v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v89 = *MEMORY[0x1E0D025B8];
                      v574 = *MEMORY[0x1E0CB2D50];
                      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bccField"));
                      v575 = v46;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v575, &v574, 1);
                      v90 = objc_claimAutoreleasedReturnValue();
                      v91 = v88;
                      v43 = v444;
                      v443 = (void *)v90;
                      v425 = 0;
                      v25 = 0;
                      *a4 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v89, 2);
                      v21 = v439;
                      a4 = v436;
                      v55 = v432;
                      v6 = v438;

                      goto LABEL_461;
                    }
                    v425 = 0;
                    v25 = 0;
                    v21 = v439;
                    a4 = v436;
                    v55 = v432;
                    v6 = v438;
                    goto LABEL_462;
                  }
                  v425 = v45;
                }
                else
                {
                  v425 = 0;
                }
                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("headers"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v46, "isEqual:", v47);

                v418 = v8;
                if (v48)
                {
                  v49 = a4;
                  v421 = v7;

                  v46 = 0;
                }
                else
                {
                  if (v46)
                  {
                    objc_opt_class();
                    v6 = v438;
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (a4)
                      {
                        v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v100 = *MEMORY[0x1E0D025B8];
                        v572 = *MEMORY[0x1E0CB2D50];
                        v442 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("headers"));
                        v573 = v442;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v573, &v572, 1);
                        v87 = (id)objc_claimAutoreleasedReturnValue();
                        v25 = 0;
                        *a4 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v100, 2, v87);
                        v21 = v439;
                        a4 = v436;
                        v55 = v432;
                        v43 = v444;
                        goto LABEL_460;
                      }
                      v25 = 0;
                      v21 = v439;
                      a4 = v436;
                      v55 = v432;
                      v43 = v444;
                      goto LABEL_461;
                    }
                    v49 = a4;
                    v421 = v7;
                    goto LABEL_74;
                  }
                  v49 = a4;
                  v421 = v7;
                }
                v6 = v438;
LABEL_74:
                v442 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v46, "count"));
                v477 = 0u;
                v478 = 0u;
                v479 = 0u;
                v480 = 0u;
                obj = v46;
                v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v477, v571, 16);
                if (!v78)
                  goto LABEL_84;
                v79 = v78;
                v80 = *(_QWORD *)v478;
                while (1)
                {
                  for (i = 0; i != v79; ++i)
                  {
                    if (*(_QWORD *)v478 != v80)
                      objc_enumerationMutation(obj);
                    v82 = *(void **)(*((_QWORD *)&v477 + 1) + 8 * i);
                    objc_opt_class();
                    v43 = v444;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      if (v49)
                      {
                        v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v93 = *MEMORY[0x1E0D025B8];
                        v569 = *MEMORY[0x1E0CB2D50];
                        v83 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("headers"));
                        v570 = v83;
                        v94 = (void *)MEMORY[0x1E0C99D80];
                        v95 = &v570;
                        v96 = &v569;
LABEL_93:
                        objc_msgSend(v94, "dictionaryWithObjects:forKeys:count:", v95, v96, 1);
                        v97 = objc_claimAutoreleasedReturnValue();
                        v98 = v92;
                        v43 = v444;
                        v416 = (id)v97;
                        v25 = 0;
                        *v49 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v93, 2);
                        v87 = obj;
                        v7 = v421;
                        v21 = v439;
                        a4 = v436;
                        v55 = v432;

                        goto LABEL_459;
                      }
LABEL_102:
                      v25 = 0;
                      v87 = obj;
                      v46 = obj;
                      v7 = v421;
                      v21 = v439;
                      a4 = v436;
                      v55 = v432;
                      goto LABEL_460;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (v49)
                      {
                        v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v93 = *MEMORY[0x1E0D025B8];
                        v567 = *MEMORY[0x1E0CB2D50];
                        v83 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("headers"));
                        v568 = v83;
                        v94 = (void *)MEMORY[0x1E0C99D80];
                        v95 = &v568;
                        v96 = &v567;
                        goto LABEL_93;
                      }
                      goto LABEL_102;
                    }
                    v83 = v82;
                    v84 = [BMProactiveHarvestingMailHeaderEntry alloc];
                    v476 = 0;
                    v85 = -[BMProactiveHarvestingMailHeaderEntry initWithJSONDictionary:error:](v84, "initWithJSONDictionary:error:", v83, &v476);
                    v86 = v476;
                    if (v86)
                    {
                      v417 = v86;
                      if (v49)
                        *v49 = objc_retainAutorelease(v86);

                      v25 = 0;
                      v87 = obj;
                      v7 = v421;
                      v21 = v439;
                      a4 = v436;
                      v55 = v432;
                      v43 = v444;
                      goto LABEL_458;
                    }
                    objc_msgSend(v442, "addObject:", v85);

                  }
                  v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v477, v571, 16);
                  v6 = v438;
                  if (!v79)
                  {
LABEL_84:

                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subject"));
                    v83 = (id)objc_claimAutoreleasedReturnValue();
                    if (!v83)
                    {
                      v87 = 0;
                      v43 = v444;
                      goto LABEL_110;
                    }
                    objc_opt_class();
                    v43 = v444;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v87 = 0;
                      goto LABEL_110;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v87 = v83;
LABEL_110:
                      objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("htmlContentData"));
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      v412 = v87;
                      if (!v109)
                      {
                        v417 = 0;
                        v7 = v421;
                        goto LABEL_118;
                      }
                      objc_opt_class();
                      v7 = v421;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v417 = 0;
LABEL_118:
                        objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("isFullyDownloaded"));
                        v110 = objc_claimAutoreleasedReturnValue();
                        v111 = v49;
                        v411 = (void *)v110;
                        if (v110 && (v112 = (void *)v110, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v113 = v112;
                            goto LABEL_121;
                          }
                          if (!v49)
                          {
                            v113 = 0;
                            v25 = 0;
                            v21 = v439;
                            a4 = v436;
                            v55 = v432;
                            goto LABEL_456;
                          }
                          v134 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v135 = *MEMORY[0x1E0D025B8];
                          v561 = *MEMORY[0x1E0CB2D50];
                          v136 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v355 = objc_opt_class();
                          v137 = v136;
                          v43 = v444;
                          v409 = (id)objc_msgSend(v137, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v355, CFSTR("isFullyDownloaded"));
                          v562 = v409;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v562, &v561, 1);
                          v410 = (void *)objc_claimAutoreleasedReturnValue();
                          v138 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v135, 2);
                          v113 = 0;
                          v25 = 0;
                          *v111 = v138;
                        }
                        else
                        {
                          v113 = 0;
LABEL_121:
                          objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("htmlContent"));
                          v114 = objc_claimAutoreleasedReturnValue();
                          v410 = (void *)v114;
                          if (!v114 || (v115 = (void *)v114, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v409 = 0;
LABEL_124:
                            objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("textContent"));
                            v116 = objc_claimAutoreleasedReturnValue();
                            v408 = (void *)v116;
                            if (v116 && (v117 = (void *)v116, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v407 = v117;
                                goto LABEL_127;
                              }
                              if (!v111)
                              {
                                v407 = 0;
                                v25 = 0;
                                v21 = v439;
                                a4 = v436;
                                v55 = v432;
                                v43 = v444;
                                goto LABEL_454;
                              }
                              v144 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v145 = *MEMORY[0x1E0D025B8];
                              v557 = *MEMORY[0x1E0CB2D50];
                              v405 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("textContent"));
                              v558 = v405;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v558, &v557, 1);
                              v406 = (void *)objc_claimAutoreleasedReturnValue();
                              v146 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v145, 2);
                              v407 = 0;
                              v25 = 0;
                              *v111 = v146;
                            }
                            else
                            {
                              v407 = 0;
LABEL_127:
                              objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("securityMethod"));
                              v118 = objc_claimAutoreleasedReturnValue();
                              v406 = (void *)v118;
                              if (!v118 || (v119 = (void *)v118, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v405 = 0;
                                goto LABEL_130;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v405 = v119;
LABEL_130:
                                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("accountHandles"));
                                v120 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                v121 = (void *)objc_claimAutoreleasedReturnValue();
                                v122 = objc_msgSend(v120, "isEqual:", v121);

                                if (v122)
                                {
                                  v399 = v109;

                                  goto LABEL_159;
                                }
                                v43 = v444;
                                v87 = v412;
                                if (v120)
                                {
                                  objc_opt_class();
                                  v413 = v120;
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v399 = v109;
                                    v123 = v120;
                                    goto LABEL_160;
                                  }
                                  if (v111)
                                  {
                                    v168 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v169 = *MEMORY[0x1E0D025B8];
                                    v553 = *MEMORY[0x1E0CB2D50];
                                    v414 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("accountHandles"));
                                    v554 = v414;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v554, &v553, 1);
                                    v170 = objc_claimAutoreleasedReturnValue();
                                    v171 = v168;
                                    v43 = v444;
                                    v172 = v169;
                                    v87 = v412;
                                    v402 = (void *)v170;
                                    v25 = 0;
                                    *v111 = (id)objc_msgSend(v171, "initWithDomain:code:userInfo:", v172, 2);
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;

                                    goto LABEL_451;
                                  }
                                  v25 = 0;
                                  v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
LABEL_452:

LABEL_453:
LABEL_454:

LABEL_455:
LABEL_456:

LABEL_457:
LABEL_458:

LABEL_459:
                                  v46 = obj;

LABEL_460:
                                  v9 = v419;
                                  v6 = v438;
                                  v8 = v418;

LABEL_461:
LABEL_462:

LABEL_463:
LABEL_464:

LABEL_465:
                                  self = v437;

LABEL_466:
LABEL_467:

                                  goto LABEL_468;
                                }
                                v399 = v109;
LABEL_159:
                                v123 = 0;
LABEL_160:
                                v414 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v123, "count"));
                                v472 = 0u;
                                v473 = 0u;
                                v474 = 0u;
                                v475 = 0u;
                                v413 = v123;
                                v147 = objc_msgSend(v413, "countByEnumeratingWithState:objects:count:", &v472, v552, 16);
                                if (v147)
                                {
                                  v148 = v147;
                                  v149 = *(_QWORD *)v473;
                                  v396 = v113;
LABEL_162:
                                  v150 = v111;
                                  v151 = v7;
                                  v152 = 0;
                                  while (1)
                                  {
                                    if (*(_QWORD *)v473 != v149)
                                      objc_enumerationMutation(v413);
                                    v153 = *(void **)(*((_QWORD *)&v472 + 1) + 8 * v152);
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                      break;
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v150)
                                      {
                                        v164 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v161 = *MEMORY[0x1E0D025B8];
                                        v548 = *MEMORY[0x1E0CB2D50];
                                        v395 = (BMProactiveHarvestingNamedHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("accountHandles"));
                                        v549 = v395;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v549, &v548, 1);
                                        v162 = objc_claimAutoreleasedReturnValue();
                                        v163 = v164;
                                        goto LABEL_178;
                                      }
                                      goto LABEL_179;
                                    }
                                    v154 = v153;
                                    objc_msgSend(v414, "addObject:", v154);

                                    if (v148 == ++v152)
                                    {
                                      v148 = objc_msgSend(v413, "countByEnumeratingWithState:objects:count:", &v472, v552, 16);
                                      v7 = v151;
                                      v111 = v150;
                                      v113 = v396;
                                      if (!v148)
                                        goto LABEL_169;
                                      goto LABEL_162;
                                    }
                                  }
                                  if (v150)
                                  {
                                    v160 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v161 = *MEMORY[0x1E0D025B8];
                                    v550 = *MEMORY[0x1E0CB2D50];
                                    v395 = (BMProactiveHarvestingNamedHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("accountHandles"));
                                    v551 = v395;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v551, &v550, 1);
                                    v162 = objc_claimAutoreleasedReturnValue();
                                    v163 = v160;
LABEL_178:
                                    v404 = (id)v162;
                                    v7 = v151;
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    v109 = v399;
                                    v25 = 0;
                                    *v150 = (id)objc_msgSend(v163, "initWithDomain:code:userInfo:", v161, 2);
                                    v401 = v413;
                                    v43 = v444;
                                    v87 = v412;
                                    v113 = v396;
                                    goto LABEL_449;
                                  }
LABEL_179:
                                  v25 = 0;
                                  v7 = v151;
                                  v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  v43 = v444;
                                  v87 = v412;
                                  v109 = v399;
                                  v113 = v396;

                                  goto LABEL_451;
                                }
LABEL_169:

                                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("replyTo"));
                                v155 = objc_claimAutoreleasedReturnValue();
                                v401 = (void *)v155;
                                if (!v155
                                  || (v156 = (void *)v155, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v395 = 0;
                                  goto LABEL_172;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  v109 = v399;
                                  if (v111)
                                  {
                                    v198 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v199 = *MEMORY[0x1E0D025B8];
                                    v546 = *MEMORY[0x1E0CB2D50];
                                    v395 = (BMProactiveHarvestingNamedHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("replyTo"));
                                    v547 = v395;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v547, &v546, 1);
                                    v404 = (id)objc_claimAutoreleasedReturnValue();
                                    v200 = (id)objc_msgSend(v198, "initWithDomain:code:userInfo:", v199, 2);
                                    v25 = 0;
                                    *v111 = v200;
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    v43 = v444;
                                    v87 = v412;
                                    goto LABEL_449;
                                  }
                                  v25 = 0;
                                  v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  v43 = v444;
                                  v87 = v412;
                                  goto LABEL_450;
                                }
                                v188 = v156;
                                v189 = [BMProactiveHarvestingNamedHandle alloc];
                                v471 = 0;
                                v395 = -[BMProactiveHarvestingNamedHandle initWithJSONDictionary:error:](v189, "initWithJSONDictionary:error:", v188, &v471);
                                v190 = v471;
                                if (v190)
                                {
                                  v191 = v190;
                                  v404 = v188;
                                  v21 = v439;
                                  v192 = v111;
                                  a4 = v436;
                                  v55 = v432;
                                  v87 = v412;
                                  if (v192)
                                    *v192 = objc_retainAutorelease(v190);

                                  v25 = 0;
                                  v401 = v404;
                                  v43 = v444;
                                  v109 = v399;
LABEL_449:

LABEL_450:
LABEL_451:

                                  goto LABEL_452;
                                }

LABEL_172:
                                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("mailboxIdentifiers"));
                                v157 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                v158 = (void *)objc_claimAutoreleasedReturnValue();
                                v159 = objc_msgSend(v157, "isEqual:", v158);

                                if (v159)
                                {

                                  v157 = 0;
                                  goto LABEL_189;
                                }
                                v87 = v412;
                                v109 = v399;
                                if (v157)
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    v404 = v157;
                                    if (!v111)
                                    {
                                      v25 = 0;
                                      v21 = v439;
                                      a4 = v436;
                                      v55 = v432;
                                      v43 = v444;
                                      goto LABEL_449;
                                    }
                                    v201 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v202 = *MEMORY[0x1E0D025B8];
                                    v544 = *MEMORY[0x1E0CB2D50];
                                    v403 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("mailboxIdentifiers"));
                                    v545 = v403;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v545, &v544, 1);
                                    v203 = objc_claimAutoreleasedReturnValue();
                                    v204 = v202;
                                    v87 = v412;
                                    v392 = (void *)v203;
                                    v25 = 0;
                                    *v111 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v204, 2);
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    v43 = v444;

                                    goto LABEL_448;
                                  }
                                }
LABEL_189:
                                v403 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v157, "count"));
                                v467 = 0u;
                                v468 = 0u;
                                v469 = 0u;
                                v470 = 0u;
                                v404 = v157;
                                v173 = objc_msgSend(v404, "countByEnumeratingWithState:objects:count:", &v467, v543, 16);
                                if (v173)
                                {
                                  v174 = v173;
                                  v175 = *(_QWORD *)v468;
                                  v397 = v113;
LABEL_191:
                                  v176 = v111;
                                  v177 = v7;
                                  v178 = 0;
                                  while (1)
                                  {
                                    if (*(_QWORD *)v468 != v175)
                                      objc_enumerationMutation(v404);
                                    v179 = *(void **)(*((_QWORD *)&v467 + 1) + 8 * v178);
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                      break;
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v176)
                                      {
                                        v197 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v194 = *MEMORY[0x1E0D025B8];
                                        v539 = *MEMORY[0x1E0CB2D50];
                                        v388 = (BMProactiveHarvestingNamedHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("mailboxIdentifiers"));
                                        v540 = v388;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v540, &v539, 1);
                                        v195 = objc_claimAutoreleasedReturnValue();
                                        v196 = v197;
                                        goto LABEL_221;
                                      }
                                      goto LABEL_225;
                                    }
                                    v180 = v179;
                                    objc_msgSend(v403, "addObject:", v180);

                                    if (v174 == ++v178)
                                    {
                                      v174 = objc_msgSend(v404, "countByEnumeratingWithState:objects:count:", &v467, v543, 16);
                                      v7 = v177;
                                      v111 = v176;
                                      v113 = v397;
                                      if (!v174)
                                        goto LABEL_198;
                                      goto LABEL_191;
                                    }
                                  }
                                  if (v176)
                                  {
                                    v193 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v194 = *MEMORY[0x1E0D025B8];
                                    v541 = *MEMORY[0x1E0CB2D50];
                                    v388 = (BMProactiveHarvestingNamedHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("mailboxIdentifiers"));
                                    v542 = v388;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v542, &v541, 1);
                                    v195 = objc_claimAutoreleasedReturnValue();
                                    v196 = v193;
LABEL_221:
                                    v385 = (id)v195;
                                    v7 = v177;
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    v109 = v399;
                                    v25 = 0;
                                    *v176 = (id)objc_msgSend(v196, "initWithDomain:code:userInfo:", v194, 2);
                                    v391 = v404;
                                    v43 = v444;
                                    v87 = v412;
                                    v113 = v397;
                                    goto LABEL_445;
                                  }
LABEL_225:
                                  v25 = 0;
                                  v7 = v177;
                                  v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  v43 = v444;
                                  v87 = v412;
                                  v109 = v399;
                                  v113 = v397;

                                  goto LABEL_448;
                                }
LABEL_198:

                                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("listID"));
                                v181 = objc_claimAutoreleasedReturnValue();
                                v391 = (void *)v181;
                                if (v181)
                                {
                                  v182 = (void *)v181;
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    objc_opt_class();
                                    v109 = v399;
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v221 = v182;
                                      v222 = [BMProactiveHarvestingNamedHandle alloc];
                                      v466 = 0;
                                      v386 = v221;
                                      v388 = -[BMProactiveHarvestingNamedHandle initWithJSONDictionary:error:](v222, "initWithJSONDictionary:error:", v221, &v466);
                                      v223 = v466;
                                      if (!v223)
                                      {

                                        goto LABEL_201;
                                      }
                                      v224 = v223;
                                      v21 = v439;
                                      v225 = v111;
                                      a4 = v436;
                                      v55 = v432;
                                      v87 = v412;
                                      if (v225)
                                        *v225 = objc_retainAutorelease(v223);

                                      v25 = 0;
                                      v226 = v386;
                                      v391 = v386;
                                      v43 = v444;
                                      v109 = v399;
                                      goto LABEL_446;
                                    }
                                    if (v111)
                                    {
                                      v424 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v227 = *MEMORY[0x1E0D025B8];
                                      v537 = *MEMORY[0x1E0CB2D50];
                                      v388 = (BMProactiveHarvestingNamedHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("listID"));
                                      v538 = v388;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v538, &v537, 1);
                                      v228 = objc_claimAutoreleasedReturnValue();
                                      v229 = (id)objc_msgSend(v424, "initWithDomain:code:userInfo:", v227, 2, v228);
                                      v25 = 0;
                                      *v111 = v229;
                                      v226 = (void *)v228;
                                      v21 = v439;
                                      a4 = v436;
                                      v55 = v432;
                                      v43 = v444;
                                      v87 = v412;
                                      goto LABEL_446;
                                    }
                                    v25 = 0;
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    v43 = v444;
                                    v87 = v412;
LABEL_447:

LABEL_448:
                                    goto LABEL_449;
                                  }
                                }
                                v388 = 0;
                                v109 = v399;
LABEL_201:
                                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("accountType"));
                                v183 = objc_claimAutoreleasedReturnValue();
                                v384 = (void *)v183;
                                if (!v183
                                  || (v184 = (void *)v183, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v385 = 0;
                                  goto LABEL_204;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  if (v111)
                                  {
                                    v230 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v231 = *MEMORY[0x1E0D025B8];
                                    v535 = *MEMORY[0x1E0CB2D50];
                                    v387 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("accountType"));
                                    v536 = v387;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v536, &v535, 1);
                                    v390 = (void *)objc_claimAutoreleasedReturnValue();
                                    v232 = (id)objc_msgSend(v230, "initWithDomain:code:userInfo:", v231, 2);
                                    v385 = 0;
                                    v25 = 0;
                                    *v111 = v232;
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    v43 = v444;
                                    v87 = v412;

                                    goto LABEL_443;
                                  }
                                  v385 = 0;
                                  v25 = 0;
                                  v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  v43 = v444;
                                  v87 = v412;
                                  goto LABEL_444;
                                }
                                v385 = v184;
LABEL_204:
                                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("attachments"));
                                v185 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                v186 = (void *)objc_claimAutoreleasedReturnValue();
                                v187 = objc_msgSend(v185, "isEqual:", v186);

                                if (v187)
                                {
                                  v400 = v109;
                                  v423 = v7;

                                  v185 = 0;
                                  goto LABEL_231;
                                }
                                if (v185)
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    v387 = v185;
                                    if (v111)
                                    {
                                      v239 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v240 = *MEMORY[0x1E0D025B8];
                                      v533 = *MEMORY[0x1E0CB2D50];
                                      v389 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("attachments"));
                                      v534 = v389;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v534, &v533, 1);
                                      v383 = (void *)objc_claimAutoreleasedReturnValue();
                                      v25 = 0;
                                      *v111 = (id)objc_msgSend(v239, "initWithDomain:code:userInfo:", v240, 2);
                                      v21 = v439;
                                      a4 = v436;
                                      v55 = v432;
                                      v43 = v444;
                                      v87 = v412;

                                      goto LABEL_442;
                                    }
                                    v25 = 0;
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    v43 = v444;
                                    v87 = v412;
                                    goto LABEL_443;
                                  }
                                }
                                v400 = v109;
                                v423 = v7;
LABEL_231:
                                v389 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v185, "count"));
                                v462 = 0u;
                                v463 = 0u;
                                v464 = 0u;
                                v465 = 0u;
                                v387 = v185;
                                v205 = objc_msgSend(v387, "countByEnumeratingWithState:objects:count:", &v462, v532, 16);
                                v398 = v113;
                                if (v205)
                                {
                                  v206 = v205;
                                  v207 = *(_QWORD *)v463;
LABEL_233:
                                  v208 = v111;
                                  v209 = 0;
                                  while (1)
                                  {
                                    if (*(_QWORD *)v463 != v207)
                                      objc_enumerationMutation(v387);
                                    v210 = *(void **)(*((_QWORD *)&v462 + 1) + 8 * v209);
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                      break;
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v208)
                                      {
                                        v237 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v234 = *MEMORY[0x1E0D025B8];
                                        v528 = *MEMORY[0x1E0CB2D50];
                                        v379 = (BMProactiveHarvestingNamedHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("attachments"));
                                        v529 = v379;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v529, &v528, 1);
                                        v235 = objc_claimAutoreleasedReturnValue();
                                        v236 = v237;
                                        goto LABEL_264;
                                      }
                                      goto LABEL_271;
                                    }
                                    v211 = v210;
                                    v212 = [BMProactiveHarvestingContentAttachment alloc];
                                    v461 = 0;
                                    v213 = -[BMProactiveHarvestingContentAttachment initWithJSONDictionary:error:](v212, "initWithJSONDictionary:error:", v211, &v461);
                                    v214 = v461;
                                    if (v214)
                                    {
                                      v381 = v214;
                                      v379 = v211;
                                      if (v208)
                                        *v208 = objc_retainAutorelease(v214);

                                      v25 = 0;
                                      v382 = v387;
                                      v7 = v423;
                                      v21 = v439;
                                      a4 = v436;
                                      v55 = v432;
                                      v43 = v444;
                                      v87 = v412;
                                      v109 = v400;
                                      v113 = v398;
                                      goto LABEL_439;
                                    }
                                    objc_msgSend(v389, "addObject:", v213);

                                    if (v206 == ++v209)
                                    {
                                      v206 = objc_msgSend(v387, "countByEnumeratingWithState:objects:count:", &v462, v532, 16);
                                      v111 = v208;
                                      v113 = v398;
                                      if (!v206)
                                        goto LABEL_241;
                                      goto LABEL_233;
                                    }
                                  }
                                  if (v208)
                                  {
                                    v233 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v234 = *MEMORY[0x1E0D025B8];
                                    v530 = *MEMORY[0x1E0CB2D50];
                                    v379 = (BMProactiveHarvestingNamedHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("attachments"));
                                    v531 = v379;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v531, &v530, 1);
                                    v235 = objc_claimAutoreleasedReturnValue();
                                    v236 = v233;
LABEL_264:
                                    v25 = 0;
                                    *v208 = (id)objc_msgSend(v236, "initWithDomain:code:userInfo:", v234, 2, v235);
                                    v238 = (void *)v235;
                                    v382 = v387;
                                    goto LABEL_265;
                                  }
LABEL_271:
                                  v25 = 0;
                                  v7 = v423;
                                  v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  v43 = v444;
                                  v87 = v412;
                                  v109 = v400;
                                  v113 = v398;

LABEL_442:
LABEL_443:

LABEL_444:
LABEL_445:
                                  v226 = v385;
LABEL_446:

                                  goto LABEL_447;
                                }
LABEL_241:

                                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("fromHandle"));
                                v215 = objc_claimAutoreleasedReturnValue();
                                v382 = (void *)v215;
                                if (!v215
                                  || (v216 = (void *)v215, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v217 = 0;
                                  goto LABEL_244;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  if (v111)
                                  {
                                    v259 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v260 = *MEMORY[0x1E0D025B8];
                                    v526 = *MEMORY[0x1E0CB2D50];
                                    v379 = (BMProactiveHarvestingNamedHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("fromHandle"));
                                    v527 = v379;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v527, &v526, 1);
                                    v261 = objc_claimAutoreleasedReturnValue();
                                    v262 = (id)objc_msgSend(v259, "initWithDomain:code:userInfo:", v260, 2, v261);
                                    v25 = 0;
                                    *v111 = v262;
                                    v238 = (void *)v261;
                                    v7 = v423;
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    v43 = v444;
                                    v87 = v412;
                                    v109 = v400;
                                    goto LABEL_440;
                                  }
                                  v25 = 0;
                                  v7 = v423;
                                  v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  v43 = v444;
                                  v87 = v412;
                                  v109 = v400;
                                  goto LABEL_441;
                                }
                                v254 = v216;
                                v255 = [BMProactiveHarvestingNamedHandle alloc];
                                v460 = 0;
                                v256 = v254;
                                v379 = -[BMProactiveHarvestingNamedHandle initWithJSONDictionary:error:](v255, "initWithJSONDictionary:error:", v254, &v460);
                                v257 = v460;
                                if (v257)
                                {
                                  v258 = v257;
                                  if (v111)
                                    *v111 = objc_retainAutorelease(v257);

                                  v25 = 0;
                                  v238 = v256;
                                  v382 = v256;
LABEL_265:
                                  v7 = v423;
                                  v21 = v439;
                                  a4 = v436;
                                  v55 = v432;
                                  v43 = v444;
                                  v87 = v412;
                                  v109 = v400;
                                  v113 = v398;
LABEL_440:

LABEL_441:
                                  goto LABEL_442;
                                }

                                v113 = v398;
                                v217 = v379;
LABEL_244:
                                v379 = v217;
                                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("toHandles"));
                                v218 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                v219 = (void *)objc_claimAutoreleasedReturnValue();
                                v220 = objc_msgSend(v218, "isEqual:", v219);

                                if (v220)
                                {

                                  goto LABEL_275;
                                }
                                if (v218)
                                {
                                  objc_opt_class();
                                  v381 = v218;
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (v111)
                                    {
                                      v282 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v283 = *MEMORY[0x1E0D025B8];
                                      v524 = *MEMORY[0x1E0CB2D50];
                                      v380 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("toHandles"));
                                      v525 = v380;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v525, &v524, 1);
                                      v377 = (void *)objc_claimAutoreleasedReturnValue();
                                      v25 = 0;
                                      *v111 = (id)objc_msgSend(v282, "initWithDomain:code:userInfo:", v283, 2);
                                      v7 = v423;
                                      v21 = v439;
                                      a4 = v436;
                                      v55 = v432;
                                      v43 = v444;
                                      v87 = v412;
                                      v109 = v400;
                                      goto LABEL_438;
                                    }
                                    v25 = 0;
                                    v7 = v423;
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    v43 = v444;
                                    v87 = v412;
                                    v109 = v400;
LABEL_439:
                                    v238 = v381;
                                    goto LABEL_440;
                                  }
                                  v241 = v218;
                                }
                                else
                                {
LABEL_275:
                                  v241 = 0;
                                }
                                v394 = v111;
                                v380 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v241, "count"));
                                v456 = 0u;
                                v457 = 0u;
                                v458 = 0u;
                                v459 = 0u;
                                v381 = v241;
                                v242 = objc_msgSend(v381, "countByEnumeratingWithState:objects:count:", &v456, v523, 16);
                                if (!v242)
                                  goto LABEL_286;
                                v243 = v242;
                                v244 = *(_QWORD *)v457;
                                while (1)
                                {
                                  for (j = 0; j != v243; ++j)
                                  {
                                    if (*(_QWORD *)v457 != v244)
                                      objc_enumerationMutation(v381);
                                    v246 = *(void **)(*((_QWORD *)&v456 + 1) + 8 * j);
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      if (v394)
                                      {
                                        v263 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v264 = *MEMORY[0x1E0D025B8];
                                        v521 = *MEMORY[0x1E0CB2D50];
                                        v378 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("toHandles"));
                                        v522 = v378;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v522, &v521, 1);
                                        v265 = objc_claimAutoreleasedReturnValue();
                                        v266 = v263;
                                        goto LABEL_303;
                                      }
LABEL_324:
                                      v25 = 0;
                                      v377 = v381;
                                      goto LABEL_325;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (!v394)
                                        goto LABEL_324;
                                      v267 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v264 = *MEMORY[0x1E0D025B8];
                                      v519 = *MEMORY[0x1E0CB2D50];
                                      v378 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("toHandles"));
                                      v520 = v378;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v520, &v519, 1);
                                      v265 = objc_claimAutoreleasedReturnValue();
                                      v266 = v267;
LABEL_303:
                                      v376 = (id)v265;
                                      v25 = 0;
                                      *v394 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v264, 2);
LABEL_307:
                                      v377 = v381;
                                      goto LABEL_436;
                                    }
                                    v247 = v246;
                                    v248 = [BMProactiveHarvestingNamedHandle alloc];
                                    v455 = 0;
                                    v249 = -[BMProactiveHarvestingNamedHandle initWithJSONDictionary:error:](v248, "initWithJSONDictionary:error:", v247, &v455);
                                    v250 = v455;
                                    if (v250)
                                    {
                                      v376 = v250;
                                      v378 = v247;
                                      if (v394)
                                        *v394 = objc_retainAutorelease(v250);

                                      v25 = 0;
                                      goto LABEL_307;
                                    }
                                    objc_msgSend(v380, "addObject:", v249);

                                  }
                                  v243 = objc_msgSend(v381, "countByEnumeratingWithState:objects:count:", &v456, v523, 16);
                                  if (!v243)
                                  {
LABEL_286:

                                    objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("ccHandles"));
                                    v251 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                    v252 = (void *)objc_claimAutoreleasedReturnValue();
                                    v253 = objc_msgSend(v251, "isEqual:", v252);

                                    if (v253)
                                    {

                                      v251 = 0;
LABEL_310:
                                      v268 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v251, "count"));
                                      v451 = 0u;
                                      v452 = 0u;
                                      v453 = 0u;
                                      v454 = 0u;
                                      v269 = v251;
                                      v270 = objc_msgSend(v269, "countByEnumeratingWithState:objects:count:", &v451, v516, 16);
                                      v377 = v269;
                                      v378 = (void *)v268;
                                      if (!v270)
                                        goto LABEL_320;
                                      v271 = v270;
                                      v272 = *(_QWORD *)v452;
                                      while (1)
                                      {
                                        for (k = 0; k != v271; ++k)
                                        {
                                          if (*(_QWORD *)v452 != v272)
                                            objc_enumerationMutation(v269);
                                          v274 = *(void **)(*((_QWORD *)&v451 + 1) + 8 * k);
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            if (v394)
                                            {
                                              v284 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v285 = *MEMORY[0x1E0D025B8];
                                              v514 = *MEMORY[0x1E0CB2D50];
                                              v375 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("ccHandles"));
                                              v515 = v375;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v515, &v514, 1);
                                              v286 = objc_claimAutoreleasedReturnValue();
                                              v287 = v284;
                                              goto LABEL_333;
                                            }
LABEL_367:
                                            v25 = 0;
                                            v376 = v269;
                                            goto LABEL_436;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            if (!v394)
                                              goto LABEL_367;
                                            v288 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v285 = *MEMORY[0x1E0D025B8];
                                            v512 = *MEMORY[0x1E0CB2D50];
                                            v375 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("ccHandles"));
                                            v513 = v375;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v513, &v512, 1);
                                            v286 = objc_claimAutoreleasedReturnValue();
                                            v287 = v288;
LABEL_333:
                                            v289 = (id)v286;
                                            v25 = 0;
                                            *v394 = (id)objc_msgSend(v287, "initWithDomain:code:userInfo:", v285, 2);
LABEL_337:
                                            v376 = v269;
                                            goto LABEL_435;
                                          }
                                          v275 = v274;
                                          v276 = [BMProactiveHarvestingNamedHandle alloc];
                                          v450 = 0;
                                          v277 = -[BMProactiveHarvestingNamedHandle initWithJSONDictionary:error:](v276, "initWithJSONDictionary:error:", v275, &v450);
                                          v278 = v450;
                                          if (v278)
                                          {
                                            v289 = v278;
                                            v375 = v275;
                                            if (v394)
                                              *v394 = objc_retainAutorelease(v278);

                                            v25 = 0;
                                            goto LABEL_337;
                                          }
                                          objc_msgSend(v378, "addObject:", v277);

                                        }
                                        v271 = objc_msgSend(v269, "countByEnumeratingWithState:objects:count:", &v451, v516, 16);
                                        if (!v271)
                                        {
LABEL_320:

                                          objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("bccHandles"));
                                          v279 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                          v280 = (void *)objc_claimAutoreleasedReturnValue();
                                          v376 = v279;
                                          v281 = objc_msgSend(v279, "isEqual:", v280);

                                          if (v281)
                                          {

                                            goto LABEL_342;
                                          }
                                          if (v279)
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (v394)
                                              {
                                                v290 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v291 = *MEMORY[0x1E0D025B8];
                                                v510 = *MEMORY[0x1E0CB2D50];
                                                v375 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("bccHandles"));
                                                v511 = v375;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v511, &v510, 1);
                                                v289 = (id)objc_claimAutoreleasedReturnValue();
                                                v25 = 0;
                                                *v394 = (id)objc_msgSend(v290, "initWithDomain:code:userInfo:", v291, 2);
                                                goto LABEL_435;
                                              }
                                              v25 = 0;
                                              goto LABEL_436;
                                            }
                                          }
                                          else
                                          {
LABEL_342:
                                            v376 = 0;
                                          }
                                          v375 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v376, "count"));
                                          v446 = 0u;
                                          v447 = 0u;
                                          v448 = 0u;
                                          v449 = 0u;
                                          v376 = v376;
                                          v292 = objc_msgSend(v376, "countByEnumeratingWithState:objects:count:", &v446, v509, 16);
                                          if (!v292)
                                            goto LABEL_353;
                                          v293 = v292;
                                          v294 = *(_QWORD *)v447;
LABEL_345:
                                          v295 = 0;
                                          while (1)
                                          {
                                            if (*(_QWORD *)v447 != v294)
                                              objc_enumerationMutation(v376);
                                            v296 = *(void **)(*((_QWORD *)&v446 + 1) + 8 * v295);
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                              break;
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (v394)
                                              {
                                                v310 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v307 = *MEMORY[0x1E0D025B8];
                                                v505 = *MEMORY[0x1E0CB2D50];
                                                v301 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("bccHandles"));
                                                v506 = v301;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v506, &v505, 1);
                                                v308 = objc_claimAutoreleasedReturnValue();
                                                v309 = v310;
                                                goto LABEL_373;
                                              }
                                              goto LABEL_378;
                                            }
                                            v297 = v296;
                                            v298 = [BMProactiveHarvestingNamedHandle alloc];
                                            v445 = 0;
                                            v299 = -[BMProactiveHarvestingNamedHandle initWithJSONDictionary:error:](v298, "initWithJSONDictionary:error:", v297, &v445);
                                            v300 = v445;
                                            if (v300)
                                            {
                                              v303 = v300;
                                              v301 = v297;
                                              if (v394)
                                                *v394 = objc_retainAutorelease(v300);

                                              v25 = 0;
                                              goto LABEL_377;
                                            }
                                            objc_msgSend(v375, "addObject:", v299);

                                            if (v293 == ++v295)
                                            {
                                              v293 = objc_msgSend(v376, "countByEnumeratingWithState:objects:count:", &v446, v509, 16);
                                              if (v293)
                                                goto LABEL_345;
LABEL_353:

                                              objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("contentProtection"));
                                              v301 = (void *)objc_claimAutoreleasedReturnValue();
                                              if (v301 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v289 = v301;
                                                  goto LABEL_356;
                                                }
                                                if (v394)
                                                {
                                                  v313 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v314 = *MEMORY[0x1E0D025B8];
                                                  v503 = *MEMORY[0x1E0CB2D50];
                                                  v303 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentProtection"));
                                                  v504 = v303;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v504, &v503, 1);
                                                  v302 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v315 = (id)objc_msgSend(v313, "initWithDomain:code:userInfo:", v314, 2, v302);
                                                  v289 = 0;
                                                  v25 = 0;
                                                  *v394 = v315;
                                                  goto LABEL_432;
                                                }
                                                v289 = 0;
                                                v25 = 0;
                                              }
                                              else
                                              {
                                                v289 = 0;
LABEL_356:
                                                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("personaId"));
                                                v302 = (void *)objc_claimAutoreleasedReturnValue();
                                                if (v302 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                {
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v303 = v302;
                                                    goto LABEL_359;
                                                  }
                                                  if (v394)
                                                  {
                                                    v316 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v317 = *MEMORY[0x1E0D025B8];
                                                    v501 = *MEMORY[0x1E0CB2D50];
                                                    v371 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("personaId"));
                                                    v502 = v371;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v502, &v501, 1);
                                                    v374 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v318 = (id)objc_msgSend(v316, "initWithDomain:code:userInfo:", v317, 2);
                                                    v303 = 0;
                                                    v25 = 0;
                                                    *v394 = v318;
                                                    goto LABEL_431;
                                                  }
                                                  v303 = 0;
                                                  v25 = 0;
                                                }
                                                else
                                                {
                                                  v303 = 0;
LABEL_359:
                                                  objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("conversationId"));
                                                  v374 = (void *)objc_claimAutoreleasedReturnValue();
                                                  if (v374 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                  {
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v371 = v374;
                                                      goto LABEL_362;
                                                    }
                                                    if (v394)
                                                    {
                                                      v319 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v320 = *MEMORY[0x1E0D025B8];
                                                      v499 = *MEMORY[0x1E0CB2D50];
                                                      v369 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("conversationId"));
                                                      v500 = v369;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v500, &v499, 1);
                                                      v373 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v321 = (id)objc_msgSend(v319, "initWithDomain:code:userInfo:", v320, 2);
                                                      v371 = 0;
                                                      v25 = 0;
                                                      *v394 = v321;
                                                      goto LABEL_430;
                                                    }
                                                    v371 = 0;
                                                    v25 = 0;
                                                  }
                                                  else
                                                  {
                                                    v371 = 0;
LABEL_362:
                                                    objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("dateReceived"));
                                                    v373 = (void *)objc_claimAutoreleasedReturnValue();
                                                    if (!v373
                                                      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v369 = 0;
LABEL_397:
                                                      objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("mailCategories"));
                                                      v372 = (void *)objc_claimAutoreleasedReturnValue();
                                                      if (v372
                                                        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                      {
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v367 = v372;
                                                          goto LABEL_400;
                                                        }
                                                        if (v394)
                                                        {
                                                          v327 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v328 = *MEMORY[0x1E0D025B8];
                                                          v495 = *MEMORY[0x1E0CB2D50];
                                                          v366 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mailCategories"));
                                                          v496 = v366;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v496, &v495, 1);
                                                          v370 = (void *)objc_claimAutoreleasedReturnValue();
                                                          v329 = (id)objc_msgSend(v327, "initWithDomain:code:userInfo:", v328, 2);
                                                          v25 = 0;
                                                          v367 = 0;
                                                          *v394 = v329;
                                                          goto LABEL_428;
                                                        }
                                                        v367 = 0;
                                                        v25 = 0;
                                                      }
                                                      else
                                                      {
                                                        v367 = 0;
LABEL_400:
                                                        objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("isNew"));
                                                        v370 = (void *)objc_claimAutoreleasedReturnValue();
                                                        if (v370
                                                          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v366 = v370;
                                                            goto LABEL_403;
                                                          }
                                                          if (v394)
                                                          {
                                                            v330 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v331 = *MEMORY[0x1E0D025B8];
                                                            v493 = *MEMORY[0x1E0CB2D50];
                                                            v364 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isNew"));
                                                            v494 = v364;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v494, &v493, 1);
                                                            v368 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v332 = (id)objc_msgSend(v330, "initWithDomain:code:userInfo:", v331, 2);
                                                            v25 = 0;
                                                            v366 = 0;
                                                            *v394 = v332;
                                                            goto LABEL_427;
                                                          }
                                                          v366 = 0;
                                                          v25 = 0;
                                                        }
                                                        else
                                                        {
                                                          v366 = 0;
LABEL_403:
                                                          objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("isTwoFactorCode"));
                                                          v368 = (void *)objc_claimAutoreleasedReturnValue();
                                                          if (v368
                                                            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                          {
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v364 = v368;
                                                              goto LABEL_406;
                                                            }
                                                            if (v394)
                                                            {
                                                              v333 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v334 = *MEMORY[0x1E0D025B8];
                                                              v491 = *MEMORY[0x1E0CB2D50];
                                                              v362 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isTwoFactorCode"));
                                                              v492 = v362;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v492, &v491, 1);
                                                              v365 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v335 = (id)objc_msgSend(v333, "initWithDomain:code:userInfo:", v334, 2);
                                                              v25 = 0;
                                                              v364 = 0;
                                                              *v394 = v335;
                                                              goto LABEL_426;
                                                            }
                                                            v364 = 0;
                                                            v25 = 0;
                                                          }
                                                          else
                                                          {
                                                            v364 = 0;
LABEL_406:
                                                            objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("isFromMe"));
                                                            v365 = (void *)objc_claimAutoreleasedReturnValue();
                                                            if (v365
                                                              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                            {
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v362 = v365;
                                                                goto LABEL_409;
                                                              }
                                                              if (v394)
                                                              {
                                                                v336 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v337 = *MEMORY[0x1E0D025B8];
                                                                v489 = *MEMORY[0x1E0CB2D50];
                                                                v360 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isFromMe"));
                                                                v490 = v360;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v490, &v489, 1);
                                                                v363 = (void *)objc_claimAutoreleasedReturnValue();
                                                                v338 = (id)objc_msgSend(v336, "initWithDomain:code:userInfo:", v337, 2);
                                                                v25 = 0;
                                                                v362 = 0;
                                                                *v394 = v338;
                                                                goto LABEL_425;
                                                              }
                                                              v362 = 0;
                                                              v25 = 0;
                                                            }
                                                            else
                                                            {
                                                              v362 = 0;
LABEL_409:
                                                              objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("isJunk"));
                                                              v363 = (void *)objc_claimAutoreleasedReturnValue();
                                                              if (v363
                                                                && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                              {
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v360 = v363;
                                                                  goto LABEL_412;
                                                                }
                                                                if (v394)
                                                                {
                                                                  v339 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v340 = *MEMORY[0x1E0D025B8];
                                                                  v487 = *MEMORY[0x1E0CB2D50];
                                                                  v358 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isJunk"));
                                                                  v488 = v358;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v488, &v487, 1);
                                                                  v361 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v341 = (id)objc_msgSend(v339, "initWithDomain:code:userInfo:", v340, 2);
                                                                  v25 = 0;
                                                                  v360 = 0;
                                                                  *v394 = v341;
                                                                  goto LABEL_424;
                                                                }
                                                                v360 = 0;
                                                                v25 = 0;
                                                              }
                                                              else
                                                              {
                                                                v360 = 0;
LABEL_412:
                                                                objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("isRead"));
                                                                v361 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if (v361
                                                                  && (objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    v358 = v361;
                                                                    goto LABEL_415;
                                                                  }
                                                                  if (v394)
                                                                  {
                                                                    v342 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v343 = *MEMORY[0x1E0D025B8];
                                                                    v485 = *MEMORY[0x1E0CB2D50];
                                                                    v323 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isRead"));
                                                                    v486 = v323;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v486, &v485, 1);
                                                                    v359 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v344 = (id)objc_msgSend(v342, "initWithDomain:code:userInfo:", v343, 2);
                                                                    v25 = 0;
                                                                    v358 = 0;
                                                                    *v394 = v344;
                                                                    goto LABEL_423;
                                                                  }
                                                                  v358 = 0;
                                                                  v25 = 0;
                                                                }
                                                                else
                                                                {
                                                                  v358 = 0;
LABEL_415:
                                                                  objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("isVIP"));
                                                                  v359 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  if (v359
                                                                    && (objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                                  {
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v323 = v359;
                                                                      goto LABEL_418;
                                                                    }
                                                                    if (v394)
                                                                    {
                                                                      v345 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v346 = *MEMORY[0x1E0D025B8];
                                                                      v483 = *MEMORY[0x1E0CB2D50];
                                                                      v325 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isVIP"));
                                                                      v484 = v325;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v484, &v483, 1);
                                                                      v324 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      v347 = (id)objc_msgSend(v345, "initWithDomain:code:userInfo:", v346, 2);
                                                                      v25 = 0;
                                                                      v323 = 0;
                                                                      *v394 = v347;
                                                                      goto LABEL_422;
                                                                    }
                                                                    v323 = 0;
                                                                    v25 = 0;
                                                                  }
                                                                  else
                                                                  {
                                                                    v323 = 0;
LABEL_418:
                                                                    objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("isFlagged"));
                                                                    v324 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if (!v324
                                                                      || (objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      v325 = 0;
                                                                      goto LABEL_421;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v325 = v324;
LABEL_421:
                                                                      v25 = objc_retain(-[BMProactiveHarvestingMail initWithUniqueID:domainID:absoluteTimestamp:accountIdentifier:messageIdentifier:fromField:toField:ccField:bccField:headers:subject:htmlContentData:isFullyDownloaded:htmlContent:textContent:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listID:accountType:attachments:fromHandle:toHandles:ccHandles:bccHandles:contentProtection:personaId:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:](v437, "initWithUniqueID:domainID:absoluteTimestamp:accountIdentifier:messageIdentifier:fromField:toField:ccField:bccField:headers:subject:htmlContentData:isFullyDownloaded:htmlContent:textContent:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listID:accountType:attachments:fromHandle:toHandles:ccHandles:bccHandles:contentProtection:personaId:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", v418, v439, v436, v432, v433, v430,
                                                                                v428,
                                                                                v427,
                                                                                v425,
                                                                                v442,
                                                                                v412,
                                                                                v417,
                                                                                v398,
                                                                                v409,
                                                                                v407,
                                                                                v405,
                                                                                v414,
                                                                                v395,
                                                                                v403,
                                                                                v388,
                                                                                v385,
                                                                                v389,
                                                                                v379,
                                                                                v380,
                                                                                v378,
                                                                                v375,
                                                                                v289,
                                                                                v303,
                                                                                v371,
                                                                                v369,
                                                                                v367,
                                                                                v366,
                                                                                v364,
                                                                                v362,
                                                                                v360,
                                                                                v358,
                                                                                v323,
                                                                                v325));
                                                                      v437 = v25;
                                                                    }
                                                                    else
                                                                    {
                                                                      if (v394)
                                                                      {
                                                                        v357 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v348 = *MEMORY[0x1E0D025B8];
                                                                        v481 = *MEMORY[0x1E0CB2D50];
                                                                        v349 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isFlagged"));
                                                                        v482 = v349;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v482, &v481, 1);
                                                                        v350 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        *v394 = (id)objc_msgSend(v357, "initWithDomain:code:userInfo:", v348, 2, v350);

                                                                      }
                                                                      v325 = 0;
                                                                      v25 = 0;
                                                                    }
LABEL_422:

                                                                  }
LABEL_423:

                                                                }
LABEL_424:

                                                              }
LABEL_425:

                                                            }
LABEL_426:

                                                          }
LABEL_427:

                                                        }
LABEL_428:

                                                      }
LABEL_429:

                                                      goto LABEL_430;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v311 = v373;
                                                      v312 = objc_alloc(MEMORY[0x1E0C99D68]);
                                                      objc_msgSend(v311, "doubleValue");
                                                      v369 = (id)objc_msgSend(v312, "initWithTimeIntervalSinceReferenceDate:");
LABEL_396:

                                                      goto LABEL_397;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v311 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                                                      v322 = v373;
                                                      objc_msgSend(v311, "dateFromString:", v322);
                                                      v369 = (id)objc_claimAutoreleasedReturnValue();

                                                      goto LABEL_396;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v369 = v373;
                                                      goto LABEL_397;
                                                    }
                                                    if (v394)
                                                    {
                                                      v351 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v352 = *MEMORY[0x1E0D025B8];
                                                      v497 = *MEMORY[0x1E0CB2D50];
                                                      v367 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("dateReceived"));
                                                      v498 = v367;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v498, &v497, 1);
                                                      v372 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v353 = (id)objc_msgSend(v351, "initWithDomain:code:userInfo:", v352, 2);
                                                      v369 = 0;
                                                      v25 = 0;
                                                      *v394 = v353;
                                                      goto LABEL_429;
                                                    }
                                                    v369 = 0;
                                                    v25 = 0;
LABEL_430:

                                                  }
LABEL_431:

                                                }
LABEL_432:

LABEL_433:
                                              }

LABEL_435:
LABEL_436:
                                              v7 = v423;
                                              v21 = v439;
                                              a4 = v436;
                                              v55 = v432;
                                              v87 = v412;
                                              v109 = v400;

                                              v43 = v444;
LABEL_437:
                                              v113 = v398;
LABEL_438:

                                              goto LABEL_439;
                                            }
                                          }
                                          if (v394)
                                          {
                                            v306 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v307 = *MEMORY[0x1E0D025B8];
                                            v507 = *MEMORY[0x1E0CB2D50];
                                            v301 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("bccHandles"));
                                            v508 = v301;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v508, &v507, 1);
                                            v308 = objc_claimAutoreleasedReturnValue();
                                            v309 = v306;
LABEL_373:
                                            v303 = (id)v308;
                                            v25 = 0;
                                            *v394 = (id)objc_msgSend(v309, "initWithDomain:code:userInfo:", v307, 2);
LABEL_377:
                                            v289 = v376;
                                            goto LABEL_433;
                                          }
LABEL_378:
                                          v25 = 0;
                                          v289 = v376;
                                          goto LABEL_435;
                                        }
                                      }
                                    }
                                    v377 = v251;
                                    if (!v251)
                                      goto LABEL_310;
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                      goto LABEL_310;
                                    if (v394)
                                    {
                                      v304 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v305 = *MEMORY[0x1E0D025B8];
                                      v517 = *MEMORY[0x1E0CB2D50];
                                      v378 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("ccHandles"));
                                      v518 = v378;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v518, &v517, 1);
                                      v376 = (id)objc_claimAutoreleasedReturnValue();
                                      v25 = 0;
                                      *v394 = (id)objc_msgSend(v304, "initWithDomain:code:userInfo:", v305, 2);
                                      goto LABEL_436;
                                    }
                                    v25 = 0;
LABEL_325:
                                    v7 = v423;
                                    v21 = v439;
                                    a4 = v436;
                                    v55 = v432;
                                    v43 = v444;
                                    v87 = v412;
                                    v109 = v400;
                                    goto LABEL_437;
                                  }
                                }
                              }
                              if (v111)
                              {
                                v165 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v166 = *MEMORY[0x1E0D025B8];
                                v555 = *MEMORY[0x1E0CB2D50];
                                v413 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("securityMethod"));
                                v556 = v413;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v556, &v555, 1);
                                v415 = (void *)objc_claimAutoreleasedReturnValue();
                                v167 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v166, 2);
                                v405 = 0;
                                v25 = 0;
                                *v111 = v167;
                                v21 = v439;
                                a4 = v436;
                                v55 = v432;
                                v43 = v444;

                                goto LABEL_452;
                              }
                              v405 = 0;
                              v25 = 0;
                            }
                            v21 = v439;
                            a4 = v436;
                            v55 = v432;
                            v43 = v444;
                            goto LABEL_453;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v409 = v115;
                            goto LABEL_124;
                          }
                          if (v111)
                          {
                            v139 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v140 = *MEMORY[0x1E0D025B8];
                            v559 = *MEMORY[0x1E0CB2D50];
                            v141 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v356 = objc_opt_class();
                            v142 = v141;
                            v43 = v444;
                            v407 = (id)objc_msgSend(v142, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), v356, CFSTR("htmlContent"));
                            v560 = v407;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v560, &v559, 1);
                            v408 = (void *)objc_claimAutoreleasedReturnValue();
                            v143 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v140, 2);
                            v409 = 0;
                            v25 = 0;
                            *v111 = v143;
                            v21 = v439;
                            a4 = v436;
                            v55 = v432;
                            goto LABEL_454;
                          }
                          v409 = 0;
                          v25 = 0;
                        }
                        v21 = v439;
                        a4 = v436;
                        v55 = v432;
                        goto LABEL_455;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v417 = v109;
                        goto LABEL_118;
                      }
                      if (v49)
                      {
                        v128 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v129 = *MEMORY[0x1E0D025B8];
                        v563 = *MEMORY[0x1E0CB2D50];
                        v130 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("htmlContentData"));
                        v564 = v130;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v564, &v563, 1);
                        v131 = objc_claimAutoreleasedReturnValue();
                        v132 = v128;
                        v43 = v444;
                        v133 = v129;
                        v87 = v412;
                        v411 = (void *)v131;
                        v417 = 0;
                        v25 = 0;
                        *v49 = (id)objc_msgSend(v132, "initWithDomain:code:userInfo:", v133, 2);
                        v113 = (id)v130;
                        v21 = v439;
                        a4 = v436;
                        v55 = v432;
                        goto LABEL_456;
                      }
                      v417 = 0;
                      v25 = 0;
                    }
                    else
                    {
                      v7 = v421;
                      if (!v49)
                      {
                        v87 = 0;
                        v25 = 0;
                        v21 = v439;
                        a4 = v436;
                        v55 = v432;
                        goto LABEL_459;
                      }
                      v124 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v125 = *MEMORY[0x1E0D025B8];
                      v565 = *MEMORY[0x1E0CB2D50];
                      v417 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subject"));
                      v566 = v417;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v566, &v565, 1);
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      v126 = v124;
                      v43 = v444;
                      v127 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v125, 2, v109);
                      v87 = 0;
                      v25 = 0;
                      *v49 = v127;
                    }
                    v21 = v439;
                    a4 = v436;
                    v55 = v432;
                    goto LABEL_457;
                  }
                }
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v427 = v43;
                goto LABEL_38;
              }
              if (a4)
              {
                v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v73 = v6;
                v74 = *MEMORY[0x1E0D025B8];
                v576 = *MEMORY[0x1E0CB2D50];
                v425 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("ccField"));
                v577 = v425;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v577, &v576, 1);
                v75 = objc_claimAutoreleasedReturnValue();
                v76 = v72;
                v43 = v444;
                v77 = v74;
                v6 = v73;
                v426 = (void *)v75;
                v427 = 0;
                v25 = 0;
                *a4 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
                v21 = v439;
                a4 = v436;
                v55 = v432;
                goto LABEL_462;
              }
              v427 = 0;
              v25 = 0;
LABEL_133:
              v21 = v439;
              a4 = v436;
              v55 = v432;
              goto LABEL_463;
            }
            if (a4)
            {
              v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v67 = v6;
              v68 = *MEMORY[0x1E0D025B8];
              v578 = *MEMORY[0x1E0CB2D50];
              v427 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("toField"));
              v579 = v427;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v579, &v578, 1);
              v69 = objc_claimAutoreleasedReturnValue();
              v70 = v66;
              v43 = (void *)v69;
              v71 = v68;
              v6 = v67;
              v428 = 0;
              v25 = 0;
              *a4 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v71, 2, v69);
              goto LABEL_133;
            }
            v428 = 0;
            v25 = 0;
LABEL_115:
            v21 = v439;
            a4 = v436;
            v55 = v432;
            goto LABEL_464;
          }
          if (a4)
          {
            v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v62 = v6;
            v63 = *MEMORY[0x1E0D025B8];
            v580 = *MEMORY[0x1E0CB2D50];
            v428 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("fromField"));
            v581 = v428;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v581, &v580, 1);
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = v63;
            v6 = v62;
            v429 = (void *)v64;
            v430 = 0;
            v25 = 0;
            *a4 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v65, 2);
            goto LABEL_115;
          }
          v430 = 0;
          v25 = 0;
LABEL_105:
          v21 = v439;
          a4 = v436;
          v55 = v432;
          goto LABEL_465;
        }
        if (a4)
        {
          v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v57 = v6;
          v58 = *MEMORY[0x1E0D025B8];
          v582 = *MEMORY[0x1E0CB2D50];
          v430 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("messageIdentifier"));
          v583 = v430;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v583, &v582, 1);
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = v58;
          v6 = v57;
          v431 = (void *)v59;
          v433 = 0;
          v25 = 0;
          *a4 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v60, 2);
          goto LABEL_105;
        }
        v433 = 0;
        v25 = 0;
        v21 = v439;
        a4 = v436;
        v55 = v432;
LABEL_101:
        self = v437;
        goto LABEL_466;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        v13 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend(v12, "doubleValue");
        v436 = (id *)objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:");
LABEL_22:

        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        v34 = v11;
        objc_msgSend(v12, "dateFromString:", v34);
        v436 = (id *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v436 = v11;
        goto LABEL_23;
      }
      if (a4)
      {
        v422 = v7;
        v101 = self;
        v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v103 = v6;
        v104 = *MEMORY[0x1E0D025B8];
        v586 = *MEMORY[0x1E0CB2D50];
        v393 = a4;
        v105 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
        v587 = v105;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v587, &v586, 1);
        v106 = objc_claimAutoreleasedReturnValue();
        v107 = v102;
        self = v101;
        v7 = v422;
        v108 = v104;
        v6 = v103;
        v55 = (void *)v105;
        v440 = (void *)v106;
        a4 = 0;
        v25 = 0;
        *v393 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v108, 2);
        v21 = v439;
        goto LABEL_467;
      }
      v25 = 0;
      v21 = v439;
LABEL_468:

      goto LABEL_469;
    }
    if (a4)
    {
      v420 = v7;
      v26 = self;
      v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = v6;
      v29 = *MEMORY[0x1E0D025B8];
      v588 = *MEMORY[0x1E0CB2D50];
      v30 = a4;
      a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domainID"));
      v589 = a4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v589, &v588, 1);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v27;
      self = v26;
      v7 = v420;
      v33 = v29;
      v6 = v28;
      v441 = (void *)v31;
      v21 = 0;
      v25 = 0;
      *v30 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2);
      goto LABEL_468;
    }
    v21 = 0;
    v25 = 0;
LABEL_469:

    goto LABEL_470;
  }
  if (a4)
  {
    v14 = self;
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = v6;
    v17 = *MEMORY[0x1E0D025B8];
    v590 = *MEMORY[0x1E0CB2D50];
    v18 = v7;
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    v354 = objc_opt_class();
    v20 = v19;
    v7 = v18;
    v21 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v354, CFSTR("uniqueID"));
    v591[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v591, &v590, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v15;
    self = v14;
    v24 = v17;
    v6 = v16;
    v9 = (void *)v22;
    v8 = 0;
    v25 = 0;
    *a4 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v22);
    goto LABEL_469;
  }
  v8 = 0;
  v25 = 0;
LABEL_470:

  return v25;
}

- (id)_headersJSONArray
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
  -[BMProactiveHarvestingMail headers](self, "headers", 0);
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
  -[BMProactiveHarvestingMail accountHandles](self, "accountHandles", 0);
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

- (id)_mailboxIdentifiersJSONArray
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
  -[BMProactiveHarvestingMail mailboxIdentifiers](self, "mailboxIdentifiers", 0);
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

- (id)_attachmentsJSONArray
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
  -[BMProactiveHarvestingMail attachments](self, "attachments", 0);
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
  -[BMProactiveHarvestingMail toHandles](self, "toHandles", 0);
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

- (id)_ccHandlesJSONArray
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
  -[BMProactiveHarvestingMail ccHandles](self, "ccHandles", 0);
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

- (id)_bccHandlesJSONArray
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
  -[BMProactiveHarvestingMail bccHandles](self, "bccHandles", 0);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v61;
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
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  _QWORD v129[38];
  _QWORD v130[40];

  v130[38] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingMail uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail domainID](self, "domainID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingMail absoluteTimestamp](self, "absoluteTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMProactiveHarvestingMail accountIdentifier](self, "accountIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail messageIdentifier](self, "messageIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail fromField](self, "fromField");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail toField](self, "toField");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail ccField](self, "ccField");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail bccField](self, "bccField");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail _headersJSONArray](self, "_headersJSONArray");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail subject](self, "subject");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail htmlContentData](self, "htmlContentData");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMProactiveHarvestingMail hasIsFullyDownloaded](self, "hasIsFullyDownloaded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isFullyDownloaded](self, "isFullyDownloaded"));
    v121 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v121 = 0;
  }
  -[BMProactiveHarvestingMail htmlContent](self, "htmlContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMProactiveHarvestingMail textContent](self, "textContent");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail securityMethod](self, "securityMethod");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail _accountHandlesJSONArray](self, "_accountHandlesJSONArray");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail replyTo](self, "replyTo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsonDictionary");
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMProactiveHarvestingMail _mailboxIdentifiersJSONArray](self, "_mailboxIdentifiersJSONArray");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail listID](self, "listID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "jsonDictionary");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMProactiveHarvestingMail accountType](self, "accountType");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail _attachmentsJSONArray](self, "_attachmentsJSONArray");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail fromHandle](self, "fromHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsonDictionary");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMProactiveHarvestingMail _toHandlesJSONArray](self, "_toHandlesJSONArray");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail _ccHandlesJSONArray](self, "_ccHandlesJSONArray");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail _bccHandlesJSONArray](self, "_bccHandlesJSONArray");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail contentProtection](self, "contentProtection");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail personaId](self, "personaId");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail conversationId](self, "conversationId");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingMail dateReceived](self, "dateReceived");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingMail dateReceived](self, "dateReceived");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    objc_msgSend(v16, "numberWithDouble:");
    v104 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v104 = 0;
  }

  if (-[BMProactiveHarvestingMail hasMailCategories](self, "hasMailCategories"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMProactiveHarvestingMail mailCategories](self, "mailCategories"));
    v103 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v103 = 0;
  }
  if (-[BMProactiveHarvestingMail hasIsNew](self, "hasIsNew"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isNew](self, "isNew"));
    v102 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v102 = 0;
  }
  if (-[BMProactiveHarvestingMail hasIsTwoFactorCode](self, "hasIsTwoFactorCode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isTwoFactorCode](self, "isTwoFactorCode"));
    v101 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v101 = 0;
  }
  if (-[BMProactiveHarvestingMail hasIsFromMe](self, "hasIsFromMe"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isFromMe](self, "isFromMe"));
    v100 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v100 = 0;
  }
  if (-[BMProactiveHarvestingMail hasIsJunk](self, "hasIsJunk"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isJunk](self, "isJunk"));
    v99 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v99 = 0;
  }
  if (-[BMProactiveHarvestingMail hasIsRead](self, "hasIsRead"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isRead](self, "isRead"));
    v98 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v98 = 0;
  }
  if (-[BMProactiveHarvestingMail hasIsVIP](self, "hasIsVIP"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isVIP](self, "isVIP"));
    v97 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v97 = 0;
  }
  if (-[BMProactiveHarvestingMail hasIsFlagged](self, "hasIsFlagged"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingMail isFlagged](self, "isFlagged"));
    v96 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v96 = 0;
  }
  v129[0] = CFSTR("uniqueID");
  v18 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v87 = (void *)v18;
  v130[0] = v18;
  v129[1] = CFSTR("domainID");
  v19 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v86 = (void *)v19;
  v130[1] = v19;
  v129[2] = CFSTR("absoluteTimestamp");
  v20 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v85 = (void *)v20;
  v130[2] = v20;
  v129[3] = CFSTR("accountIdentifier");
  v21 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v84 = (void *)v21;
  v130[3] = v21;
  v129[4] = CFSTR("messageIdentifier");
  v22 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v83 = (void *)v22;
  v130[4] = v22;
  v129[5] = CFSTR("fromField");
  v23 = (uint64_t)v128;
  if (!v128)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v130[5] = v23;
  v129[6] = CFSTR("toField");
  v24 = v127;
  if (!v127)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v130[6] = v24;
  v129[7] = CFSTR("ccField");
  v25 = (uint64_t)v126;
  if (!v126)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v130[7] = v25;
  v129[8] = CFSTR("bccField");
  v26 = (uint64_t)v125;
  if (!v125)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v130[8] = v26;
  v129[9] = CFSTR("headers");
  v27 = (uint64_t)v124;
  if (!v124)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v79 = (void *)v27;
  v130[9] = v27;
  v129[10] = CFSTR("subject");
  v28 = (uint64_t)v123;
  if (!v123)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v93 = (void *)v28;
  v130[10] = v28;
  v129[11] = CFSTR("htmlContentData");
  v29 = (uint64_t)v122;
  if (!v122)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v92 = (void *)v29;
  v130[11] = v29;
  v129[12] = CFSTR("isFullyDownloaded");
  v30 = (uint64_t)v121;
  if (!v121)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v9;
  v91 = (void *)v30;
  v130[12] = v30;
  v129[13] = CFSTR("htmlContent");
  v32 = (uint64_t)v120;
  if (!v120)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v3;
  v90 = (void *)v32;
  v130[13] = v32;
  v129[14] = CFSTR("textContent");
  v34 = (uint64_t)v119;
  if (!v119)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v34;
  v130[14] = v34;
  v129[15] = CFSTR("securityMethod");
  v36 = (uint64_t)v118;
  if (!v118)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v78 = (void *)v36;
  v130[15] = v36;
  v129[16] = CFSTR("accountHandles");
  v37 = (uint64_t)v117;
  if (!v117)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v77 = (void *)v37;
  v130[16] = v37;
  v129[17] = CFSTR("replyTo");
  v38 = (uint64_t)v116;
  if (!v116)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v76 = (void *)v38;
  v130[17] = v38;
  v129[18] = CFSTR("mailboxIdentifiers");
  v39 = (uint64_t)v115;
  if (!v115)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)v39;
  v130[18] = v39;
  v129[19] = CFSTR("listID");
  v40 = (uint64_t)v114;
  if (!v114)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)v40;
  v130[19] = v40;
  v129[20] = CFSTR("accountType");
  v41 = (uint64_t)v113;
  if (!v113)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v41;
  v130[20] = v41;
  v129[21] = CFSTR("attachments");
  v42 = (uint64_t)v112;
  if (!v112)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v72 = (void *)v42;
  v130[21] = v42;
  v129[22] = CFSTR("fromHandle");
  v43 = (uint64_t)v111;
  if (!v111)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v43;
  v130[22] = v43;
  v129[23] = CFSTR("toHandles");
  v44 = (uint64_t)v110;
  if (!v110)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)v44;
  v130[23] = v44;
  v129[24] = CFSTR("ccHandles");
  v45 = (uint64_t)v109;
  if (!v109)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v69 = (void *)v45;
  v130[24] = v45;
  v129[25] = CFSTR("bccHandles");
  v46 = (uint64_t)v108;
  if (!v108)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v46;
  v130[25] = v46;
  v129[26] = CFSTR("contentProtection");
  v47 = (uint64_t)v107;
  if (!v107)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v67 = (void *)v47;
  v130[26] = v47;
  v129[27] = CFSTR("personaId");
  v48 = (uint64_t)v106;
  if (!v106)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v48;
  v130[27] = v48;
  v129[28] = CFSTR("conversationId");
  v49 = (uint64_t)v105;
  if (!v105)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v95 = (void *)v4;
  v65 = (void *)v49;
  v130[28] = v49;
  v129[29] = CFSTR("dateReceived");
  v50 = (uint64_t)v104;
  if (!v104)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v64 = (void *)v50;
  v130[29] = v50;
  v129[30] = CFSTR("mailCategories");
  v51 = (uint64_t)v103;
  if (!v103)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v94 = v8;
  v63 = (void *)v51;
  v130[30] = v51;
  v129[31] = CFSTR("isNew");
  v52 = (uint64_t)v102;
  if (!v102)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v81 = (void *)v25;
  v61 = v52;
  v130[31] = v52;
  v129[32] = CFSTR("isTwoFactorCode");
  v53 = v101;
  if (!v101)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v52, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78,
      v79);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v80 = (void *)v26;
  v130[32] = v53;
  v129[33] = CFSTR("isFromMe");
  v54 = v100;
  if (!v100)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v89 = (void *)v10;
  v130[33] = v54;
  v129[34] = CFSTR("isJunk");
  v55 = v99;
  if (!v99)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v130[34] = v55;
  v129[35] = CFSTR("isRead");
  v56 = v98;
  if (!v98)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v82 = (void *)v23;
  v130[35] = v56;
  v129[36] = CFSTR("isVIP");
  v57 = v97;
  if (!v97)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v130[36] = v57;
  v129[37] = CFSTR("isFlagged");
  v58 = v96;
  if (!v96)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v130[37] = v58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 38, v61);
  v88 = (id)objc_claimAutoreleasedReturnValue();
  if (!v96)

  v59 = v35;
  if (!v97)
  {

    v59 = v35;
  }
  if (!v98)
  {

    v59 = v35;
  }
  if (!v99)
  {

    v59 = v35;
  }
  if (!v100)
  {

    v59 = v35;
  }
  if (!v101)
  {

    v59 = v35;
  }
  if (!v102)
  {

    v59 = v35;
  }
  if (!v103)
  {

    v59 = v35;
  }
  if (!v104)
  {

    v59 = v35;
  }
  if (!v105)
  {

    v59 = v35;
  }
  if (!v106)
  {

    v59 = v35;
  }
  if (!v107)
  {

    v59 = v35;
  }
  if (!v108)
  {

    v59 = v35;
  }
  if (!v109)
  {

    v59 = v35;
  }
  if (!v110)
  {

    v59 = v35;
  }
  if (!v111)
  {

    v59 = v35;
  }
  if (!v112)
  {

    v59 = v35;
  }
  if (!v113)
  {

    v59 = v35;
  }
  if (!v114)
  {

    v59 = v35;
  }
  if (!v115)
  {

    v59 = v35;
  }
  if (!v116)
  {

    v59 = v35;
  }
  if (!v117)
  {

    v59 = v35;
  }
  if (!v118)
  {

    v59 = v35;
  }
  if (!v119)

  if (!v120)
  if (!v121)

  if (!v122)
  if (!v123)

  if (!v124)
  if (!v125)

  if (!v126)
  if (!v127)

  if (v128)
  {
    if (v89)
      goto LABEL_176;
  }
  else
  {

    if (v89)
    {
LABEL_176:
      if (v31)
        goto LABEL_177;
      goto LABEL_183;
    }
  }

  if (v31)
  {
LABEL_177:
    if (v94)
      goto LABEL_178;
    goto LABEL_184;
  }
LABEL_183:

  if (v94)
  {
LABEL_178:
    if (v95)
      goto LABEL_179;
LABEL_185:

    if (v33)
      goto LABEL_180;
LABEL_186:

    goto LABEL_180;
  }
LABEL_184:

  if (!v95)
    goto LABEL_185;
LABEL_179:
  if (!v33)
    goto LABEL_186;
LABEL_180:

  return v88;
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

- (NSDate)dateReceived
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_dateReceived)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_dateReceived);
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
  int v12;
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
  int v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  int v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  int v157;
  void *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  int v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  int v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  int v175;
  void *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  _BOOL4 v189;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingMail uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingMail uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail domainID](self, "domainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingMail domainID](self, "domainID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail absoluteTimestamp](self, "absoluteTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingMail absoluteTimestamp](self, "absoluteTimestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail accountIdentifier](self, "accountIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingMail accountIdentifier](self, "accountIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail messageIdentifier](self, "messageIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageIdentifier");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingMail messageIdentifier](self, "messageIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail fromField](self, "fromField");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fromField");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMProactiveHarvestingMail fromField](self, "fromField");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fromField");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail toField](self, "toField");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toField");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMProactiveHarvestingMail toField](self, "toField");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "toField");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail ccField](self, "ccField");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ccField");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMProactiveHarvestingMail ccField](self, "ccField");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ccField");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail bccField](self, "bccField");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bccField");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMProactiveHarvestingMail bccField](self, "bccField");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bccField");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail headers](self, "headers");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headers");
    v62 = objc_claimAutoreleasedReturnValue();
    if (v61 == (void *)v62)
    {

    }
    else
    {
      v63 = (void *)v62;
      -[BMProactiveHarvestingMail headers](self, "headers");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "headers");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v64, "isEqual:", v65);

      if (!v66)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail subject](self, "subject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subject");
    v68 = objc_claimAutoreleasedReturnValue();
    if (v67 == (void *)v68)
    {

    }
    else
    {
      v69 = (void *)v68;
      -[BMProactiveHarvestingMail subject](self, "subject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subject");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v70, "isEqual:", v71);

      if (!v72)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail htmlContentData](self, "htmlContentData");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "htmlContentData");
    v74 = objc_claimAutoreleasedReturnValue();
    if (v73 == (void *)v74)
    {

    }
    else
    {
      v75 = (void *)v74;
      -[BMProactiveHarvestingMail htmlContentData](self, "htmlContentData");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "htmlContentData");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v76, "isEqual:", v77);

      if (!v78)
        goto LABEL_164;
    }
    if (-[BMProactiveHarvestingMail hasIsFullyDownloaded](self, "hasIsFullyDownloaded")
      || objc_msgSend(v5, "hasIsFullyDownloaded"))
    {
      if (!-[BMProactiveHarvestingMail hasIsFullyDownloaded](self, "hasIsFullyDownloaded"))
        goto LABEL_164;
      if (!objc_msgSend(v5, "hasIsFullyDownloaded"))
        goto LABEL_164;
      v79 = -[BMProactiveHarvestingMail isFullyDownloaded](self, "isFullyDownloaded");
      if (v79 != objc_msgSend(v5, "isFullyDownloaded"))
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail htmlContent](self, "htmlContent");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "htmlContent");
    v81 = objc_claimAutoreleasedReturnValue();
    if (v80 == (void *)v81)
    {

    }
    else
    {
      v82 = (void *)v81;
      -[BMProactiveHarvestingMail htmlContent](self, "htmlContent");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "htmlContent");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v83, "isEqual:", v84);

      if (!v85)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail textContent](self, "textContent");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContent");
    v87 = objc_claimAutoreleasedReturnValue();
    if (v86 == (void *)v87)
    {

    }
    else
    {
      v88 = (void *)v87;
      -[BMProactiveHarvestingMail textContent](self, "textContent");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textContent");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v89, "isEqual:", v90);

      if (!v91)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail securityMethod](self, "securityMethod");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "securityMethod");
    v93 = objc_claimAutoreleasedReturnValue();
    if (v92 == (void *)v93)
    {

    }
    else
    {
      v94 = (void *)v93;
      -[BMProactiveHarvestingMail securityMethod](self, "securityMethod");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "securityMethod");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v95, "isEqual:", v96);

      if (!v97)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail accountHandles](self, "accountHandles");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountHandles");
    v99 = objc_claimAutoreleasedReturnValue();
    if (v98 == (void *)v99)
    {

    }
    else
    {
      v100 = (void *)v99;
      -[BMProactiveHarvestingMail accountHandles](self, "accountHandles");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountHandles");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v101, "isEqual:", v102);

      if (!v103)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail replyTo](self, "replyTo");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replyTo");
    v105 = objc_claimAutoreleasedReturnValue();
    if (v104 == (void *)v105)
    {

    }
    else
    {
      v106 = (void *)v105;
      -[BMProactiveHarvestingMail replyTo](self, "replyTo");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "replyTo");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v107, "isEqual:", v108);

      if (!v109)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail mailboxIdentifiers](self, "mailboxIdentifiers");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxIdentifiers");
    v111 = objc_claimAutoreleasedReturnValue();
    if (v110 == (void *)v111)
    {

    }
    else
    {
      v112 = (void *)v111;
      -[BMProactiveHarvestingMail mailboxIdentifiers](self, "mailboxIdentifiers");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mailboxIdentifiers");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v113, "isEqual:", v114);

      if (!v115)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail listID](self, "listID");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "listID");
    v117 = objc_claimAutoreleasedReturnValue();
    if (v116 == (void *)v117)
    {

    }
    else
    {
      v118 = (void *)v117;
      -[BMProactiveHarvestingMail listID](self, "listID");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "listID");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v119, "isEqual:", v120);

      if (!v121)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail accountType](self, "accountType");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountType");
    v123 = objc_claimAutoreleasedReturnValue();
    if (v122 == (void *)v123)
    {

    }
    else
    {
      v124 = (void *)v123;
      -[BMProactiveHarvestingMail accountType](self, "accountType");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountType");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = objc_msgSend(v125, "isEqual:", v126);

      if (!v127)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail attachments](self, "attachments");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachments");
    v129 = objc_claimAutoreleasedReturnValue();
    if (v128 == (void *)v129)
    {

    }
    else
    {
      v130 = (void *)v129;
      -[BMProactiveHarvestingMail attachments](self, "attachments");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachments");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend(v131, "isEqual:", v132);

      if (!v133)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail fromHandle](self, "fromHandle");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fromHandle");
    v135 = objc_claimAutoreleasedReturnValue();
    if (v134 == (void *)v135)
    {

    }
    else
    {
      v136 = (void *)v135;
      -[BMProactiveHarvestingMail fromHandle](self, "fromHandle");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fromHandle");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = objc_msgSend(v137, "isEqual:", v138);

      if (!v139)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail toHandles](self, "toHandles");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toHandles");
    v141 = objc_claimAutoreleasedReturnValue();
    if (v140 == (void *)v141)
    {

    }
    else
    {
      v142 = (void *)v141;
      -[BMProactiveHarvestingMail toHandles](self, "toHandles");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "toHandles");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = objc_msgSend(v143, "isEqual:", v144);

      if (!v145)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail ccHandles](self, "ccHandles");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ccHandles");
    v147 = objc_claimAutoreleasedReturnValue();
    if (v146 == (void *)v147)
    {

    }
    else
    {
      v148 = (void *)v147;
      -[BMProactiveHarvestingMail ccHandles](self, "ccHandles");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ccHandles");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = objc_msgSend(v149, "isEqual:", v150);

      if (!v151)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail bccHandles](self, "bccHandles");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bccHandles");
    v153 = objc_claimAutoreleasedReturnValue();
    if (v152 == (void *)v153)
    {

    }
    else
    {
      v154 = (void *)v153;
      -[BMProactiveHarvestingMail bccHandles](self, "bccHandles");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bccHandles");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = objc_msgSend(v155, "isEqual:", v156);

      if (!v157)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail contentProtection](self, "contentProtection");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v159 = objc_claimAutoreleasedReturnValue();
    if (v158 == (void *)v159)
    {

    }
    else
    {
      v160 = (void *)v159;
      -[BMProactiveHarvestingMail contentProtection](self, "contentProtection");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = objc_msgSend(v161, "isEqual:", v162);

      if (!v163)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail personaId](self, "personaId");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v165 = objc_claimAutoreleasedReturnValue();
    if (v164 == (void *)v165)
    {

    }
    else
    {
      v166 = (void *)v165;
      -[BMProactiveHarvestingMail personaId](self, "personaId");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = objc_msgSend(v167, "isEqual:", v168);

      if (!v169)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail conversationId](self, "conversationId");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationId");
    v171 = objc_claimAutoreleasedReturnValue();
    if (v170 == (void *)v171)
    {

    }
    else
    {
      v172 = (void *)v171;
      -[BMProactiveHarvestingMail conversationId](self, "conversationId");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationId");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = objc_msgSend(v173, "isEqual:", v174);

      if (!v175)
        goto LABEL_164;
    }
    -[BMProactiveHarvestingMail dateReceived](self, "dateReceived");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateReceived");
    v177 = objc_claimAutoreleasedReturnValue();
    if (v176 == (void *)v177)
    {

    }
    else
    {
      v178 = (void *)v177;
      -[BMProactiveHarvestingMail dateReceived](self, "dateReceived");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateReceived");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = objc_msgSend(v179, "isEqual:", v180);

      if (!v181)
        goto LABEL_164;
    }
    if (!-[BMProactiveHarvestingMail hasMailCategories](self, "hasMailCategories")
      && !objc_msgSend(v5, "hasMailCategories")
      || -[BMProactiveHarvestingMail hasMailCategories](self, "hasMailCategories")
      && objc_msgSend(v5, "hasMailCategories")
      && (v182 = -[BMProactiveHarvestingMail mailCategories](self, "mailCategories"),
          v182 == objc_msgSend(v5, "mailCategories")))
    {
      if (!-[BMProactiveHarvestingMail hasIsNew](self, "hasIsNew") && !objc_msgSend(v5, "hasIsNew")
        || -[BMProactiveHarvestingMail hasIsNew](self, "hasIsNew")
        && objc_msgSend(v5, "hasIsNew")
        && (v183 = -[BMProactiveHarvestingMail isNew](self, "isNew"), v183 == objc_msgSend(v5, "isNew")))
      {
        if (!-[BMProactiveHarvestingMail hasIsTwoFactorCode](self, "hasIsTwoFactorCode")
          && !objc_msgSend(v5, "hasIsTwoFactorCode")
          || -[BMProactiveHarvestingMail hasIsTwoFactorCode](self, "hasIsTwoFactorCode")
          && objc_msgSend(v5, "hasIsTwoFactorCode")
          && (v184 = -[BMProactiveHarvestingMail isTwoFactorCode](self, "isTwoFactorCode"),
              v184 == objc_msgSend(v5, "isTwoFactorCode")))
        {
          if (!-[BMProactiveHarvestingMail hasIsFromMe](self, "hasIsFromMe")
            && !objc_msgSend(v5, "hasIsFromMe")
            || -[BMProactiveHarvestingMail hasIsFromMe](self, "hasIsFromMe")
            && objc_msgSend(v5, "hasIsFromMe")
            && (v185 = -[BMProactiveHarvestingMail isFromMe](self, "isFromMe"),
                v185 == objc_msgSend(v5, "isFromMe")))
          {
            if (!-[BMProactiveHarvestingMail hasIsJunk](self, "hasIsJunk")
              && !objc_msgSend(v5, "hasIsJunk")
              || -[BMProactiveHarvestingMail hasIsJunk](self, "hasIsJunk")
              && objc_msgSend(v5, "hasIsJunk")
              && (v186 = -[BMProactiveHarvestingMail isJunk](self, "isJunk"),
                  v186 == objc_msgSend(v5, "isJunk")))
            {
              if (!-[BMProactiveHarvestingMail hasIsRead](self, "hasIsRead")
                && !objc_msgSend(v5, "hasIsRead")
                || -[BMProactiveHarvestingMail hasIsRead](self, "hasIsRead")
                && objc_msgSend(v5, "hasIsRead")
                && (v187 = -[BMProactiveHarvestingMail isRead](self, "isRead"),
                    v187 == objc_msgSend(v5, "isRead")))
              {
                if (!-[BMProactiveHarvestingMail hasIsVIP](self, "hasIsVIP")
                  && !objc_msgSend(v5, "hasIsVIP")
                  || -[BMProactiveHarvestingMail hasIsVIP](self, "hasIsVIP")
                  && objc_msgSend(v5, "hasIsVIP")
                  && (v188 = -[BMProactiveHarvestingMail isVIP](self, "isVIP"),
                      v188 == objc_msgSend(v5, "isVIP")))
                {
                  if (!-[BMProactiveHarvestingMail hasIsFlagged](self, "hasIsFlagged")
                    && !objc_msgSend(v5, "hasIsFlagged"))
                  {
                    LOBYTE(v12) = 1;
                    goto LABEL_165;
                  }
                  if (-[BMProactiveHarvestingMail hasIsFlagged](self, "hasIsFlagged")
                    && objc_msgSend(v5, "hasIsFlagged"))
                  {
                    v189 = -[BMProactiveHarvestingMail isFlagged](self, "isFlagged");
                    v12 = v189 ^ objc_msgSend(v5, "isFlagged") ^ 1;
LABEL_165:

                    goto LABEL_166;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_164:
    LOBYTE(v12) = 0;
    goto LABEL_165;
  }
  LOBYTE(v12) = 0;
LABEL_166:

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

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (NSString)fromField
{
  return self->_fromField;
}

- (NSString)toField
{
  return self->_toField;
}

- (NSString)ccField
{
  return self->_ccField;
}

- (NSString)bccField
{
  return self->_bccField;
}

- (NSArray)headers
{
  return self->_headers;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)htmlContentData
{
  return self->_htmlContentData;
}

- (BOOL)isFullyDownloaded
{
  return self->_isFullyDownloaded;
}

- (BOOL)hasIsFullyDownloaded
{
  return self->_hasIsFullyDownloaded;
}

- (void)setHasIsFullyDownloaded:(BOOL)a3
{
  self->_hasIsFullyDownloaded = a3;
}

- (NSData)htmlContent
{
  return self->_htmlContent;
}

- (NSString)textContent
{
  return self->_textContent;
}

- (NSString)securityMethod
{
  return self->_securityMethod;
}

- (NSArray)accountHandles
{
  return self->_accountHandles;
}

- (BMProactiveHarvestingNamedHandle)replyTo
{
  return self->_replyTo;
}

- (NSArray)mailboxIdentifiers
{
  return self->_mailboxIdentifiers;
}

- (BMProactiveHarvestingNamedHandle)listID
{
  return self->_listID;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (BMProactiveHarvestingNamedHandle)fromHandle
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

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (int)mailCategories
{
  return self->_mailCategories;
}

- (BOOL)hasMailCategories
{
  return self->_hasMailCategories;
}

- (void)setHasMailCategories:(BOOL)a3
{
  self->_hasMailCategories = a3;
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

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (BOOL)hasIsVIP
{
  return self->_hasIsVIP;
}

- (void)setHasIsVIP:(BOOL)a3
{
  self->_hasIsVIP = a3;
}

- (BOOL)isFlagged
{
  return self->_isFlagged;
}

- (BOOL)hasIsFlagged
{
  return self->_hasIsFlagged;
}

- (void)setHasIsFlagged:(BOOL)a3
{
  self->_hasIsFlagged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_bccHandles, 0);
  objc_storeStrong((id *)&self->_ccHandles, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_listID, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifiers, 0);
  objc_storeStrong((id *)&self->_replyTo, 0);
  objc_storeStrong((id *)&self->_accountHandles, 0);
  objc_storeStrong((id *)&self->_securityMethod, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_htmlContent, 0);
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_bccField, 0);
  objc_storeStrong((id *)&self->_ccField, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_fromField, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

+ (unsigned)latestDataVersion
{
  return 3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 3)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMProactiveHarvestingMail initByReadFrom:]([BMProactiveHarvestingMail alloc], "initByReadFrom:", v6);
    v7[17] = 3;

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
  id v10;
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
  _QWORD v42[40];

  v42[38] = *MEMORY[0x1E0C80C00];
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domainID"), 2, 0, 2, 13, 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 3, 0, 1);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accountIdentifier"), 2, 0, 4, 13, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messageIdentifier"), 2, 0, 5, 13, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fromField"), 2, 0, 6, 13, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("toField"), 2, 0, 7, 13, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ccField"), 2, 0, 8, 13, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bccField"), 2, 0, 9, 13, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("headers_json"), 5, 1, &__block_literal_global_47006);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subject"), 2, 0, 11, 13, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("htmlContentData"), 2, 0, 12, 13, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFullyDownloaded"), 0, 0, 13, 12, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("htmlContent"), 4, 0, 14, 14, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("textContent"), 2, 0, 15, 13, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("securityMethod"), 2, 0, 16, 13, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("accountHandles_json"), 5, 1, &__block_literal_global_222_47007);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("replyTo_json"), 5, 1, &__block_literal_global_223);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("mailboxIdentifiers_json"), 5, 1, &__block_literal_global_224_47008);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("listID_json"), 5, 1, &__block_literal_global_225);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accountType"), 2, 0, 21, 13, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("attachments_json"), 5, 1, &__block_literal_global_226);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("fromHandle_json"), 5, 1, &__block_literal_global_227);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("toHandles_json"), 5, 1, &__block_literal_global_228);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("ccHandles_json"), 5, 1, &__block_literal_global_229);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("bccHandles_json"), 5, 1, &__block_literal_global_230);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 27, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 28, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("conversationId"), 2, 0, 29, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dateReceived"), 3, 0, 30, 0, 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mailCategories"), 0, 0, 31, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isNew"), 0, 0, 32, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isTwoFactorCode"), 0, 0, 33, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFromMe"), 0, 0, 34, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isJunk"), 0, 0, 35, 12, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRead"), 0, 0, 36, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isVIP"), 0, 0, 37, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFlagged"), 0, 0, 38, 12, 0);
  v42[0] = v41;
  v42[1] = v40;
  v42[2] = v39;
  v42[3] = v38;
  v42[4] = v37;
  v42[5] = v36;
  v42[6] = v35;
  v42[7] = v34;
  v42[8] = v33;
  v42[9] = v32;
  v42[10] = v31;
  v42[11] = v30;
  v42[12] = v29;
  v42[13] = v28;
  v42[14] = v27;
  v42[15] = v26;
  v42[16] = v25;
  v42[17] = v24;
  v42[18] = v23;
  v42[19] = v22;
  v42[20] = v20;
  v42[21] = v18;
  v42[22] = v17;
  v42[23] = v21;
  v42[24] = v16;
  v42[25] = v15;
  v42[26] = v19;
  v42[27] = v14;
  v42[28] = v2;
  v42[29] = v3;
  v42[30] = v4;
  v42[31] = v13;
  v42[32] = v5;
  v42[33] = v12;
  v42[34] = v6;
  v42[35] = v11;
  v42[36] = v7;
  v42[37] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 38);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D7A0;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[40];

  v42[38] = *MEMORY[0x1E0C80C00];
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v42[0] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domainID"), 2, 13, 0);
  v42[1] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 3, 0, 0);
  v42[2] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accountIdentifier"), 4, 13, 0);
  v42[3] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messageIdentifier"), 5, 13, 0);
  v42[4] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fromField"), 6, 13, 0);
  v42[5] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("toField"), 7, 13, 0);
  v42[6] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ccField"), 8, 13, 0);
  v42[7] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bccField"), 9, 13, 0);
  v42[8] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("headers"), 10, 14, objc_opt_class());
  v42[9] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subject"), 11, 13, 0);
  v42[10] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("htmlContentData"), 12, 13, 0);
  v42[11] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFullyDownloaded"), 13, 12, 0);
  v42[12] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("htmlContent"), 14, 14, 0);
  v42[13] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("textContent"), 15, 13, 0);
  v42[14] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("securityMethod"), 16, 13, 0);
  v42[15] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accountHandles"), 17, 13, 0);
  v42[16] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("replyTo"), 18, 14, objc_opt_class());
  v42[17] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mailboxIdentifiers"), 19, 13, 0);
  v42[18] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("listID"), 20, 14, objc_opt_class());
  v42[19] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accountType"), 21, 13, 0);
  v42[20] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("attachments"), 22, 14, objc_opt_class());
  v42[21] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fromHandle"), 23, 14, objc_opt_class());
  v42[22] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("toHandles"), 24, 14, objc_opt_class());
  v42[23] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ccHandles"), 25, 14, objc_opt_class());
  v42[24] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bccHandles"), 26, 14, objc_opt_class());
  v42[25] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 27, 13, 0);
  v42[26] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 28, 13, 0);
  v42[27] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("conversationId"), 29, 13, 0);
  v42[28] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dateReceived"), 30, 0, 0);
  v42[29] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mailCategories"), 31, 2, 0);
  v42[30] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isNew"), 32, 12, 0);
  v42[31] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isTwoFactorCode"), 33, 12, 0);
  v42[32] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFromMe"), 34, 12, 0);
  v42[33] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isJunk"), 35, 12, 0);
  v42[34] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRead"), 36, 12, 0);
  v42[35] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isVIP"), 37, 12, 0);
  v42[36] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFlagged"), 38, 12, 0);
  v42[37] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 38);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bccHandlesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_ccHandlesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_8(uint64_t a1, void *a2)
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

id __36__BMProactiveHarvestingMail_columns__block_invoke_7(uint64_t a1, void *a2)
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

id __36__BMProactiveHarvestingMail_columns__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_attachmentsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mailboxIdentifiersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replyTo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__BMProactiveHarvestingMail_columns__block_invoke_2(uint64_t a1, void *a2)
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

id __36__BMProactiveHarvestingMail_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_headersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
