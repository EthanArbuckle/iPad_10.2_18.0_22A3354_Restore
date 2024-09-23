@implementation BMProactiveHarvestingNotifications

- (BMProactiveHarvestingNotifications)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 bundleID:(id)a5 notificationID:(id)a6 title:(id)a7 subtitle:(id)a8 body:(id)a9 threadID:(id)a10 category:(id)a11 isGroupMessage:(id)a12 isTimeSensitive:(id)a13 isCritical:(id)a14 isCommunicationNotification:(id)a15 contentProtection:(id)a16 personaId:(id)a17 attachments:(id)a18 handles:(id)a19
{
  return -[BMProactiveHarvestingNotifications initWithUniqueID:absoluteTimestamp:bundleID:notificationID:title:subtitle:body:threadID:category:isGroupMessage:isTimeSensitive:isCritical:isCommunicationNotification:contentProtection:personaId:attachments:fromHandles:toHandles:](self, "initWithUniqueID:absoluteTimestamp:bundleID:notificationID:title:subtitle:body:threadID:category:isGroupMessage:isTimeSensitive:isCritical:isCommunicationNotification:contentProtection:personaId:attachments:fromHandles:toHandles:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
           a19,
           MEMORY[0x1E0C9AA60]);
}

- (BMProactiveHarvestingNotifications)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 bundleID:(id)a5 notificationID:(id)a6 title:(id)a7 subtitle:(id)a8 body:(id)a9 threadID:(id)a10 category:(id)a11 isGroupMessage:(id)a12 isTimeSensitive:(id)a13 isCritical:(id)a14 isCommunicationNotification:(id)a15 contentProtection:(id)a16 personaId:(id)a17 attachments:(id)a18 fromHandles:(id)a19 toHandles:(id)a20
{
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  BMProactiveHarvestingNotifications *v30;
  double v31;
  id v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;

  v48 = a3;
  v25 = a4;
  v47 = a5;
  v46 = a6;
  v34 = a7;
  v45 = a7;
  v44 = a8;
  v43 = a9;
  v42 = a10;
  v41 = a11;
  v26 = a12;
  v27 = a13;
  v28 = v25;
  v49 = a14;
  v29 = a15;
  v40 = a16;
  v39 = a17;
  v38 = a18;
  v37 = a19;
  v36 = a20;
  v50.receiver = self;
  v50.super_class = (Class)BMProactiveHarvestingNotifications;
  v30 = -[BMEventBase init](&v50, sel_init);
  if (v30)
  {
    v30->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v30->_uniqueID, a3);
    if (v28)
    {
      v30->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v30->_hasRaw_absoluteTimestamp = 0;
      v31 = -1.0;
    }
    v30->_raw_absoluteTimestamp = v31;
    objc_storeStrong((id *)&v30->_bundleID, a5);
    objc_storeStrong((id *)&v30->_notificationID, a6);
    objc_storeStrong((id *)&v30->_title, v34);
    objc_storeStrong((id *)&v30->_subtitle, a8);
    objc_storeStrong((id *)&v30->_body, a9);
    objc_storeStrong((id *)&v30->_threadID, a10);
    objc_storeStrong((id *)&v30->_category, a11);
    if (v26)
    {
      v30->_hasIsGroupMessage = 1;
      v30->_isGroupMessage = objc_msgSend(v26, "BOOLValue");
    }
    else
    {
      v30->_hasIsGroupMessage = 0;
      v30->_isGroupMessage = 0;
    }
    if (v27)
    {
      v30->_hasIsTimeSensitive = 1;
      v30->_isTimeSensitive = objc_msgSend(v27, "BOOLValue");
    }
    else
    {
      v30->_hasIsTimeSensitive = 0;
      v30->_isTimeSensitive = 0;
    }
    if (v49)
    {
      v30->_hasIsCritical = 1;
      v30->_isCritical = objc_msgSend(v49, "BOOLValue");
    }
    else
    {
      v30->_hasIsCritical = 0;
      v30->_isCritical = 0;
    }
    if (v29)
    {
      v30->_hasIsCommunicationNotification = 1;
      v30->_isCommunicationNotification = objc_msgSend(v29, "BOOLValue");
    }
    else
    {
      v30->_hasIsCommunicationNotification = 0;
      v30->_isCommunicationNotification = 0;
    }
    objc_storeStrong((id *)&v30->_contentProtection, a16);
    objc_storeStrong((id *)&v30->_personaId, a17);
    objc_storeStrong((id *)&v30->_attachments, a18);
    objc_storeStrong((id *)&v30->_fromHandles, a19);
    objc_storeStrong((id *)&v30->_toHandles, a20);
  }

  return v30;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProactiveHarvestingNotifications uniqueID](self, "uniqueID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications absoluteTimestamp](self, "absoluteTimestamp");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications bundleID](self, "bundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications notificationID](self, "notificationID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications title](self, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications subtitle](self, "subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications body](self, "body");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications threadID](self, "threadID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications category](self, "category");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingNotifications isGroupMessage](self, "isGroupMessage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingNotifications isTimeSensitive](self, "isTimeSensitive"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingNotifications isCritical](self, "isCritical"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingNotifications isCommunicationNotification](self, "isCommunicationNotification"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications contentProtection](self, "contentProtection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications personaId](self, "personaId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications fromHandles](self, "fromHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications toHandles](self, "toHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("BMProactiveHarvestingNotifications with uniqueID: %@, absoluteTimestamp: %@, bundleID: %@, notificationID: %@, title: %@, subtitle: %@, body: %@, threadID: %@, category: %@, isGroupMessage: %@, isTimeSensitive: %@, isCritical: %@, isCommunicationNotification: %@, contentProtection: %@, personaId: %@, attachments: %@, fromHandles: %@, toHandles: %@"), v23, v21, v22, v20, v17, v16, v15, v14, v13, v12, v11, v10, v9, v3, v4, v5,
                  v6,
                  v7);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingNotifications *v5;
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
  double v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  NSArray *attachments;
  uint64_t v66;
  NSArray *fromHandles;
  uint64_t v68;
  NSArray *toHandles;
  int v70;
  BMProactiveHarvestingNotifications *v71;
  objc_super v73;
  uint64_t v74;
  uint64_t v75;

  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)BMProactiveHarvestingNotifications;
  v5 = -[BMEventBase init](&v73, sel_init);
  if (!v5)
    goto LABEL_96;
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
          v24 = 48;
          goto LABEL_61;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v25 = *v9;
          v26 = *(_QWORD *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v10])
          {
            v27 = *(double *)(*(_QWORD *)&v4[*v12] + v26);
            *(_QWORD *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v11] = 1;
            v27 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v27;
          continue;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
          goto LABEL_61;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 64;
          goto LABEL_61;
        case 5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 72;
          goto LABEL_61;
        case 6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
          goto LABEL_61;
        case 7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 88;
          goto LABEL_61;
        case 8u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 96;
          goto LABEL_61;
        case 9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
          goto LABEL_61;
        case 0xAu:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasIsGroupMessage = 1;
          while (2)
          {
            v31 = *v9;
            v32 = *(_QWORD *)&v4[v31];
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v32);
              *(_QWORD *)&v4[v31] = v33;
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                v20 = v29++ >= 9;
                if (v20)
                {
                  v30 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v30 = 0;
LABEL_77:
          v62 = v30 != 0;
          v63 = 32;
          goto LABEL_90;
        case 0xBu:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v5->_hasIsTimeSensitive = 1;
          while (2)
          {
            v38 = *v9;
            v39 = *(_QWORD *)&v4[v38];
            v40 = v39 + 1;
            if (v39 == -1 || v40 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v39);
              *(_QWORD *)&v4[v38] = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                v20 = v36++ >= 9;
                if (v20)
                {
                  v37 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v37 = 0;
LABEL_81:
          v62 = v37 != 0;
          v63 = 34;
          goto LABEL_90;
        case 0xCu:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          v5->_hasIsCritical = 1;
          while (2)
          {
            v45 = *v9;
            v46 = *(_QWORD *)&v4[v45];
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v46);
              *(_QWORD *)&v4[v45] = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                v20 = v43++ >= 9;
                if (v20)
                {
                  v44 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            v44 = 0;
LABEL_85:
          v62 = v44 != 0;
          v63 = 36;
          goto LABEL_90;
        case 0xDu:
          v49 = 0;
          v50 = 0;
          v51 = 0;
          v5->_hasIsCommunicationNotification = 1;
          break;
        case 0xEu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 112;
          goto LABEL_61;
        case 0xFu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 120;
LABEL_61:
          v56 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0x10u:
          v74 = 0;
          v75 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_98;
          v57 = -[BMProactiveHarvestingContentAttachment initByReadFrom:]([BMProactiveHarvestingContentAttachment alloc], "initByReadFrom:", v4);
          if (!v57)
            goto LABEL_98;
          v58 = v57;
          v59 = v6;
          goto LABEL_73;
        case 0x12u:
          v74 = 0;
          v75 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_98;
          v60 = -[BMProactiveHarvestingNamedHandle initByReadFrom:]([BMProactiveHarvestingNamedHandle alloc], "initByReadFrom:", v4);
          if (!v60)
            goto LABEL_98;
          v58 = v60;
          v59 = v7;
          goto LABEL_73;
        case 0x13u:
          v74 = 0;
          v75 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_98;
          v61 = -[BMProactiveHarvestingNamedHandle initByReadFrom:]([BMProactiveHarvestingNamedHandle alloc], "initByReadFrom:", v4);
          if (!v61)
            goto LABEL_98;
          v58 = v61;
          v59 = v8;
LABEL_73:
          objc_msgSend(v59, "addObject:", v58);
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_98:

          goto LABEL_95;
      }
      while (1)
      {
        v52 = *v9;
        v53 = *(_QWORD *)&v4[v52];
        v54 = v53 + 1;
        if (v53 == -1 || v54 > *(_QWORD *)&v4[*v10])
          break;
        v55 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v53);
        *(_QWORD *)&v4[v52] = v54;
        v51 |= (unint64_t)(v55 & 0x7F) << v49;
        if ((v55 & 0x80) == 0)
          goto LABEL_87;
        v49 += 7;
        v20 = v50++ >= 9;
        if (v20)
        {
          v51 = 0;
          goto LABEL_89;
        }
      }
      v4[*v11] = 1;
LABEL_87:
      if (v4[*v11])
        v51 = 0;
LABEL_89:
      v62 = v51 != 0;
      v63 = 38;
LABEL_90:
      *((_BYTE *)&v5->super.super.isa + v63) = v62;
    }
    while (*(_QWORD *)&v4[*v9] < *(_QWORD *)&v4[*v10]);
  }
  v64 = objc_msgSend(v6, "copy");
  attachments = v5->_attachments;
  v5->_attachments = (NSArray *)v64;

  v66 = objc_msgSend(v7, "copy");
  fromHandles = v5->_fromHandles;
  v5->_fromHandles = (NSArray *)v66;

  v68 = objc_msgSend(v8, "copy");
  toHandles = v5->_toHandles;
  v5->_toHandles = (NSArray *)v68;

  v70 = v4[*v11];
  if (v70)
LABEL_95:
    v71 = 0;
  else
LABEL_96:
    v71 = v5;

  return v71;
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
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_notificationID)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_body)
    PBDataWriterWriteStringField();
  if (self->_threadID)
    PBDataWriterWriteStringField();
  if (self->_category)
    PBDataWriterWriteStringField();
  if (self->_hasIsGroupMessage)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsTimeSensitive)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsCritical)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsCommunicationNotification)
    PBDataWriterWriteBOOLField();
  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = self->_attachments;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v9);
        v31 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = self->_fromHandles;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
        v31 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v13);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = self->_toHandles;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v21);
        v31 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v22, "writeTo:", v4, (_QWORD)v23);
        PBDataWriterRecallMark();
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
    }
    while (v19);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingNotifications writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingNotifications)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  BMProactiveHarvestingNotifications *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  BMProactiveHarvestingNotifications *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  id *v48;
  id v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  void *v82;
  uint64_t v83;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  id v93;
  id v94;
  uint64_t v95;
  id v96;
  void *v97;
  uint64_t v98;
  void *v99;
  id v100;
  void *v101;
  uint64_t v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  uint64_t v113;
  uint64_t i;
  void *v115;
  id v116;
  BMProactiveHarvestingContentAttachment *v117;
  BMProactiveHarvestingContentAttachment *v118;
  id v119;
  id v120;
  void *v121;
  int v122;
  id v123;
  uint64_t v124;
  id v125;
  void *v126;
  uint64_t v127;
  void *v128;
  id v129;
  id v130;
  uint64_t v131;
  id v132;
  id v133;
  uint64_t v134;
  id v135;
  void *v136;
  uint64_t v137;
  void *v138;
  id v139;
  id v140;
  uint64_t v141;
  id v142;
  void *v143;
  uint64_t v144;
  void *v145;
  id v146;
  id v147;
  uint64_t v148;
  id v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  id v154;
  id v155;
  uint64_t v156;
  id v157;
  void *v158;
  uint64_t v159;
  void *v160;
  id v161;
  id v162;
  uint64_t v163;
  id v164;
  void *v165;
  uint64_t v166;
  void *v167;
  id v168;
  id *v169;
  id v170;
  uint64_t v171;
  void *v172;
  id *v173;
  uint64_t *v174;
  id v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t j;
  void *v181;
  id v182;
  BMProactiveHarvestingNamedHandle *v183;
  BMProactiveHarvestingNamedHandle *v184;
  id v185;
  void *v186;
  int v187;
  id v188;
  uint64_t v189;
  uint64_t v190;
  id *v191;
  id v192;
  uint64_t v193;
  void *v194;
  void *v195;
  uint64_t v196;
  id v197;
  uint64_t v198;
  void *v199;
  id v200;
  uint64_t v201;
  void *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  id v208;
  BMProactiveHarvestingNamedHandle *v209;
  BMProactiveHarvestingNamedHandle *v210;
  id v211;
  id v212;
  uint64_t v213;
  uint64_t v214;
  id v215;
  id *v216;
  void *v217;
  id *v218;
  uint64_t *v219;
  void *v220;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  id v238;
  id v239;
  id v240;
  void *v241;
  void *v242;
  void *v243;
  id v244;
  void *v245;
  id v246;
  id v247;
  void *v248;
  id v249;
  void *v250;
  id v251;
  id obj;
  void *v253;
  id v254;
  id v255;
  void *v256;
  id v257;
  void *v258;
  void *v259;
  id v260;
  void *v261;
  id v262;
  id v263;
  void *v264;
  id v265;
  id v266;
  BMProactiveHarvestingNotifications *v267;
  void *v268;
  id *v269;
  id v270;
  void *v271;
  void *v272;
  void *v273;
  id v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  id v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  id v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  uint64_t v290;
  id v291;
  uint64_t v292;
  id v293;
  _BYTE v294[128];
  uint64_t v295;
  id v296;
  uint64_t v297;
  id v298;
  uint64_t v299;
  id v300;
  _BYTE v301[128];
  uint64_t v302;
  id v303;
  uint64_t v304;
  id v305;
  uint64_t v306;
  id v307;
  _BYTE v308[128];
  uint64_t v309;
  void *v310;
  uint64_t v311;
  id v312;
  uint64_t v313;
  id v314;
  uint64_t v315;
  void *v316;
  uint64_t v317;
  id v318;
  uint64_t v319;
  id v320;
  uint64_t v321;
  id v322;
  uint64_t v323;
  id v324;
  uint64_t v325;
  void *v326;
  uint64_t v327;
  id v328;
  uint64_t v329;
  id v330;
  uint64_t v331;
  id v332;
  uint64_t v333;
  void *v334;
  uint64_t v335;
  void *v336;
  uint64_t v337;
  id *v338;
  uint64_t v339;
  _QWORD v340[4];

  v340[1] = *MEMORY[0x1E0C80C00];
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
        v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v13 = *MEMORY[0x1E0D025B8];
        v339 = *MEMORY[0x1E0CB2D50];
        v14 = self;
        v15 = objc_alloc(MEMORY[0x1E0CB3940]);
        v222 = objc_opt_class();
        v16 = v15;
        self = v14;
        v17 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v222, CFSTR("uniqueID"));
        v340[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v340, &v339, 1);
        v272 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 2);
        v7 = 0;
        v19 = 0;
        *a4 = v18;
        goto LABEL_238;
      }
      v7 = 0;
      v19 = 0;
      goto LABEL_239;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v8 = objc_claimAutoreleasedReturnValue();
  v272 = (void *)v8;
  if (!v8 || (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v270 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v10, "doubleValue");
    v270 = (id)objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    v20 = v9;
    objc_msgSend(v10, "dateFromString:", v20);
    v270 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v130 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v131 = *MEMORY[0x1E0D025B8];
      v337 = *MEMORY[0x1E0CB2D50];
      v48 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
      v338 = v48;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v338, &v337, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = (id)objc_msgSend(v130, "initWithDomain:code:userInfo:", v131, 2, v21);
      v17 = 0;
      v19 = 0;
      *a4 = v132;
      goto LABEL_237;
    }
    v17 = 0;
    v19 = 0;
    goto LABEL_238;
  }
  v270 = v9;
LABEL_16:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v273 = v21;
  if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v48 = a4;
      if (a4)
      {
        v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v50 = *MEMORY[0x1E0D025B8];
        v335 = *MEMORY[0x1E0CB2D50];
        v51 = objc_alloc(MEMORY[0x1E0CB3940]);
        v223 = objc_opt_class();
        v52 = v51;
        v21 = v273;
        v53 = (void *)objc_msgSend(v52, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v223, CFSTR("bundleID"));
        v336 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v336, &v335, 1);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v49;
        v22 = (void *)v54;
        v56 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v50, 2, v54);
        v19 = 0;
        v48 = 0;
        *a4 = v56;
        v17 = v270;
        goto LABEL_236;
      }
      v19 = 0;
      v17 = v270;
      goto LABEL_237;
    }
    v269 = v21;
  }
  else
  {
    v269 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notificationID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v271 = v22;
  v267 = self;
  if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v58 = *MEMORY[0x1E0D025B8];
        v333 = *MEMORY[0x1E0CB2D50];
        v59 = objc_alloc(MEMORY[0x1E0CB3940]);
        v224 = objc_opt_class();
        v60 = v59;
        v21 = v273;
        v61 = (void *)objc_msgSend(v60, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v224, CFSTR("notificationID"));
        v334 = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v334, &v333, 1);
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = v57;
        v22 = v271;
        v268 = (void *)v62;
        v64 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v58, 2);
        v19 = 0;
        v53 = 0;
        *a4 = v64;
        v48 = v269;
        v17 = v270;
        goto LABEL_235;
      }
      v53 = 0;
      v19 = 0;
      v48 = v269;
      v17 = v270;
      goto LABEL_236;
    }
    v265 = v22;
  }
  else
  {
    v265 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v23 = objc_claimAutoreleasedReturnValue();
  v268 = (void *)v23;
  if (v23 && (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v66 = *MEMORY[0x1E0D025B8];
        v331 = *MEMORY[0x1E0CB2D50];
        v67 = objc_alloc(MEMORY[0x1E0CB3940]);
        v225 = objc_opt_class();
        v68 = v67;
        v21 = v273;
        v266 = (id)objc_msgSend(v68, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v225, CFSTR("title"));
        v332 = v266;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v332, &v331, 1);
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = v65;
        v22 = v271;
        v264 = (void *)v69;
        v71 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v66, 2);
        v19 = 0;
        v61 = 0;
        *a4 = v71;
        v48 = v269;
        v17 = v270;
        v53 = v265;
        goto LABEL_234;
      }
      v61 = 0;
      v19 = 0;
      v48 = v269;
      v17 = v270;
      v53 = v265;
      goto LABEL_235;
    }
    v263 = v24;
  }
  else
  {
    v263 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v25 = objc_claimAutoreleasedReturnValue();
  v264 = (void *)v25;
  if (v25 && (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v266 = 0;
        v19 = 0;
        v48 = v269;
        v17 = v270;
        v53 = v265;
        v61 = v263;
        goto LABEL_234;
      }
      v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v73 = *MEMORY[0x1E0D025B8];
      v329 = *MEMORY[0x1E0CB2D50];
      v74 = objc_alloc(MEMORY[0x1E0CB3940]);
      v226 = objc_opt_class();
      v75 = v74;
      v21 = v273;
      v262 = (id)objc_msgSend(v75, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v226, CFSTR("subtitle"));
      v330 = v262;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v330, &v329, 1);
      v76 = objc_claimAutoreleasedReturnValue();
      v77 = v72;
      v22 = v271;
      v261 = (void *)v76;
      v78 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v73, 2);
      v19 = 0;
      v266 = 0;
      *a4 = v78;
      goto LABEL_129;
    }
    v266 = v26;
  }
  else
  {
    v266 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("body"));
  v27 = objc_claimAutoreleasedReturnValue();
  v261 = (void *)v27;
  if (v27)
  {
    v28 = (void *)v27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v262 = v28;
        goto LABEL_31;
      }
      if (a4)
      {
        v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v80 = *MEMORY[0x1E0D025B8];
        v327 = *MEMORY[0x1E0CB2D50];
        v81 = objc_alloc(MEMORY[0x1E0CB3940]);
        v227 = objc_opt_class();
        v82 = v81;
        v21 = v273;
        v260 = (id)objc_msgSend(v82, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v227, CFSTR("body"));
        v328 = v260;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v328, &v327, 1);
        v83 = objc_claimAutoreleasedReturnValue();
        v84 = v79;
        v22 = v271;
        v259 = (void *)v83;
        v85 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v80, 2);
        v19 = 0;
        v262 = 0;
        *a4 = v85;
        goto LABEL_133;
      }
      v262 = 0;
      v19 = 0;
LABEL_129:
      v48 = v269;
      v17 = v270;
      v53 = v265;
      v61 = v263;
      goto LABEL_233;
    }
  }
  v262 = 0;
LABEL_31:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("threadID"));
  v29 = objc_claimAutoreleasedReturnValue();
  v259 = (void *)v29;
  if (v29)
  {
    v30 = (void *)v29;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v260 = v30;
        goto LABEL_34;
      }
      if (a4)
      {
        v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v87 = *MEMORY[0x1E0D025B8];
        v325 = *MEMORY[0x1E0CB2D50];
        v88 = objc_alloc(MEMORY[0x1E0CB3940]);
        v228 = objc_opt_class();
        v89 = v88;
        v21 = v273;
        v90 = (void *)objc_msgSend(v89, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v228, CFSTR("threadID"));
        v326 = v90;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v326, &v325, 1);
        v91 = objc_claimAutoreleasedReturnValue();
        v92 = v86;
        v22 = v271;
        v258 = (void *)v91;
        v93 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v87, 2);
        v19 = 0;
        v260 = 0;
        *a4 = v93;
        goto LABEL_137;
      }
      v260 = 0;
      v19 = 0;
LABEL_133:
      v48 = v269;
      v17 = v270;
      v53 = v265;
      goto LABEL_232;
    }
  }
  v260 = 0;
LABEL_34:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
  v31 = objc_claimAutoreleasedReturnValue();
  v258 = (void *)v31;
  if (v31)
  {
    v32 = (void *)v31;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v255 = v32;
        goto LABEL_37;
      }
      if (a4)
      {
        v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v95 = *MEMORY[0x1E0D025B8];
        v323 = *MEMORY[0x1E0CB2D50];
        v96 = objc_alloc(MEMORY[0x1E0CB3940]);
        v229 = objc_opt_class();
        v97 = v96;
        v21 = v273;
        v257 = (id)objc_msgSend(v97, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v229, CFSTR("category"));
        v324 = v257;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v324, &v323, 1);
        v98 = objc_claimAutoreleasedReturnValue();
        v99 = v94;
        v22 = v271;
        v253 = (void *)v98;
        v100 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v95, 2);
        v19 = 0;
        v90 = 0;
        *a4 = v100;
        v48 = v269;
        v17 = v270;
        v53 = v265;
        goto LABEL_230;
      }
      v90 = 0;
      v19 = 0;
LABEL_137:
      v48 = v269;
      v17 = v270;
      v53 = v265;
      goto LABEL_231;
    }
  }
  v255 = 0;
LABEL_37:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isGroupMessage"));
  v33 = objc_claimAutoreleasedReturnValue();
  v253 = (void *)v33;
  if (v33 && (v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v257 = 0;
        v19 = 0;
        v48 = v269;
        v17 = v270;
        v53 = v265;
        v90 = v255;
        goto LABEL_230;
      }
      v123 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v124 = *MEMORY[0x1E0D025B8];
      v321 = *MEMORY[0x1E0CB2D50];
      v125 = objc_alloc(MEMORY[0x1E0CB3940]);
      v230 = objc_opt_class();
      v126 = v125;
      v21 = v273;
      v254 = (id)objc_msgSend(v126, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v230, CFSTR("isGroupMessage"));
      v322 = v254;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v322, &v321, 1);
      v127 = objc_claimAutoreleasedReturnValue();
      v128 = v123;
      v22 = v271;
      v250 = (void *)v127;
      v129 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v124, 2);
      v19 = 0;
      v257 = 0;
      *a4 = v129;
      goto LABEL_168;
    }
    v257 = v34;
  }
  else
  {
    v257 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isTimeSensitive"));
  v35 = objc_claimAutoreleasedReturnValue();
  v250 = (void *)v35;
  if (v35)
  {
    v36 = (void *)v35;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v254 = v36;
        goto LABEL_43;
      }
      if (a4)
      {
        v133 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v134 = *MEMORY[0x1E0D025B8];
        v319 = *MEMORY[0x1E0CB2D50];
        v135 = objc_alloc(MEMORY[0x1E0CB3940]);
        v231 = objc_opt_class();
        v136 = v135;
        v21 = v273;
        v251 = (id)objc_msgSend(v136, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v231, CFSTR("isTimeSensitive"));
        v320 = v251;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v320, &v319, 1);
        v137 = objc_claimAutoreleasedReturnValue();
        v138 = v133;
        v22 = v271;
        v248 = (void *)v137;
        v139 = (id)objc_msgSend(v138, "initWithDomain:code:userInfo:", v134, 2);
        v19 = 0;
        v254 = 0;
        *a4 = v139;
        goto LABEL_172;
      }
      v254 = 0;
      v19 = 0;
LABEL_168:
      v48 = v269;
      v17 = v270;
      v53 = v265;
      v90 = v255;
      goto LABEL_229;
    }
  }
  v254 = 0;
LABEL_43:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isCritical"));
  v37 = objc_claimAutoreleasedReturnValue();
  v248 = (void *)v37;
  if (v37)
  {
    v38 = (void *)v37;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v251 = v38;
        goto LABEL_46;
      }
      if (a4)
      {
        v140 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v141 = *MEMORY[0x1E0D025B8];
        v317 = *MEMORY[0x1E0CB2D50];
        v142 = objc_alloc(MEMORY[0x1E0CB3940]);
        v232 = objc_opt_class();
        v143 = v142;
        v21 = v273;
        v249 = (id)objc_msgSend(v143, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v232, CFSTR("isCritical"));
        v318 = v249;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v318, &v317, 1);
        v144 = objc_claimAutoreleasedReturnValue();
        v145 = v140;
        v22 = v271;
        v245 = (void *)v144;
        v146 = (id)objc_msgSend(v145, "initWithDomain:code:userInfo:", v141, 2);
        v19 = 0;
        v251 = 0;
        *a4 = v146;
        goto LABEL_174;
      }
      v251 = 0;
      v19 = 0;
LABEL_172:
      v48 = v269;
      v17 = v270;
      v53 = v265;
      v90 = v255;
      goto LABEL_228;
    }
  }
  v251 = 0;
LABEL_46:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isCommunicationNotification"));
  v39 = objc_claimAutoreleasedReturnValue();
  v245 = (void *)v39;
  if (v39)
  {
    v40 = (void *)v39;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v249 = v40;
        goto LABEL_49;
      }
      if (a4)
      {
        v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v148 = *MEMORY[0x1E0D025B8];
        v315 = *MEMORY[0x1E0CB2D50];
        v149 = objc_alloc(MEMORY[0x1E0CB3940]);
        v233 = objc_opt_class();
        v150 = v149;
        v21 = v273;
        v151 = (void *)objc_msgSend(v150, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v233, CFSTR("isCommunicationNotification"));
        v316 = v151;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v316, &v315, 1);
        v152 = objc_claimAutoreleasedReturnValue();
        v153 = v147;
        v22 = v271;
        v242 = (void *)v152;
        v154 = (id)objc_msgSend(v153, "initWithDomain:code:userInfo:", v148, 2);
        v19 = 0;
        v249 = 0;
        *a4 = v154;
        goto LABEL_176;
      }
      v249 = 0;
      v19 = 0;
LABEL_174:
      v48 = v269;
      v17 = v270;
      v53 = v265;
      goto LABEL_227;
    }
  }
  v249 = 0;
LABEL_49:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentProtection"));
  v41 = objc_claimAutoreleasedReturnValue();
  v242 = (void *)v41;
  if (v41)
  {
    v42 = (void *)v41;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v247 = v42;
        goto LABEL_52;
      }
      if (a4)
      {
        v155 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v156 = *MEMORY[0x1E0D025B8];
        v313 = *MEMORY[0x1E0CB2D50];
        v157 = objc_alloc(MEMORY[0x1E0CB3940]);
        v234 = objc_opt_class();
        v158 = v157;
        v21 = v273;
        v246 = (id)objc_msgSend(v158, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v234, CFSTR("contentProtection"));
        v314 = v246;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v314, &v313, 1);
        v159 = objc_claimAutoreleasedReturnValue();
        v160 = v155;
        v22 = v271;
        v241 = (void *)v159;
        v161 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v156, 2);
        v19 = 0;
        v151 = 0;
        *a4 = v161;
        v48 = v269;
        v17 = v270;
        v53 = v265;
        goto LABEL_225;
      }
      v151 = 0;
      v19 = 0;
LABEL_176:
      v48 = v269;
      v17 = v270;
      v53 = v265;
      goto LABEL_226;
    }
  }
  v247 = 0;
LABEL_52:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personaId"));
  v43 = objc_claimAutoreleasedReturnValue();
  v241 = (void *)v43;
  if (v43 && (v44 = (void *)v43, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v162 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v163 = *MEMORY[0x1E0D025B8];
        v311 = *MEMORY[0x1E0CB2D50];
        v164 = objc_alloc(MEMORY[0x1E0CB3940]);
        v235 = objc_opt_class();
        v165 = v164;
        v21 = v273;
        obj = (id)objc_msgSend(v165, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v235, CFSTR("personaId"));
        v312 = obj;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v312, &v311, 1);
        v166 = objc_claimAutoreleasedReturnValue();
        v167 = v162;
        v22 = v271;
        v256 = (void *)v166;
        v168 = (id)objc_msgSend(v167, "initWithDomain:code:userInfo:", v163, 2);
        v19 = 0;
        v246 = 0;
        *a4 = v168;
        v48 = v269;
        v17 = v270;
        v53 = v265;
        goto LABEL_223;
      }
      v246 = 0;
      v19 = 0;
      v48 = v269;
      v17 = v270;
      v53 = v265;
      v151 = v247;
      goto LABEL_225;
    }
    v246 = v44;
  }
  else
  {
    v246 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attachments"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v45, "isEqual:", v46);

  v243 = v6;
  v244 = v7;
  if (v47)
  {

  }
  else if (v45)
  {
    objc_opt_class();
    obj = v45;
    v22 = v271;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v19 = 0;
        v48 = v269;
        v17 = v270;
        v53 = v265;
        v151 = v247;
        goto LABEL_224;
      }
      v188 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v189 = *MEMORY[0x1E0D025B8];
      v309 = *MEMORY[0x1E0CB2D50];
      v256 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("attachments"));
      v310 = v256;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v310, &v309, 1);
      v120 = (id)objc_claimAutoreleasedReturnValue();
      v190 = v189;
      v22 = v271;
      v19 = 0;
      *a4 = (id)objc_msgSend(v188, "initWithDomain:code:userInfo:", v190, 2, v120);
      goto LABEL_170;
    }
    v101 = v45;
    goto LABEL_101;
  }
  v101 = 0;
  v22 = v271;
LABEL_101:
  v256 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v101, "count"));
  v286 = 0u;
  v287 = 0u;
  v288 = 0u;
  v289 = 0u;
  obj = v101;
  v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v286, v308, 16);
  v104 = v262;
  v103 = v263;
  v105 = v266;
  v106 = v260;
  v108 = v254;
  v107 = v255;
  v109 = v257;
  v110 = v251;
  v111 = v249;
  v112 = v246;
  if (!v102)
    goto LABEL_111;
  v113 = *(_QWORD *)v287;
  do
  {
    for (i = 0; i != v102; ++i)
    {
      if (*(_QWORD *)v287 != v113)
        objc_enumerationMutation(obj);
      v115 = *(void **)(*((_QWORD *)&v286 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v169 = a4;
        if (a4)
        {
          v170 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v171 = *MEMORY[0x1E0D025B8];
          v306 = *MEMORY[0x1E0CB2D50];
          v116 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("attachments"));
          v307 = v116;
          v172 = (void *)MEMORY[0x1E0C99D80];
          v173 = &v307;
          v174 = &v306;
          goto LABEL_144;
        }
LABEL_169:
        v19 = 0;
        v120 = obj;
        v6 = v243;
        v7 = v244;
LABEL_170:
        v48 = v269;
        v17 = v270;
        goto LABEL_221;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v169 = a4;
        if (!a4)
          goto LABEL_169;
        v170 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v171 = *MEMORY[0x1E0D025B8];
        v304 = *MEMORY[0x1E0CB2D50];
        v116 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("attachments"));
        v305 = v116;
        v172 = (void *)MEMORY[0x1E0C99D80];
        v173 = &v305;
        v174 = &v304;
LABEL_144:
        objc_msgSend(v172, "dictionaryWithObjects:forKeys:count:", v173, v174, 1);
        v175 = (id)objc_claimAutoreleasedReturnValue();
        v176 = v170;
        v21 = v273;
        v19 = 0;
        *v169 = (id)objc_msgSend(v176, "initWithDomain:code:userInfo:", v171, 2, v175);
        v120 = obj;
        v6 = v243;
        v7 = v244;
LABEL_145:
        v48 = v269;
        v17 = v270;
        goto LABEL_220;
      }
      v116 = v115;
      v117 = [BMProactiveHarvestingContentAttachment alloc];
      v285 = 0;
      v118 = -[BMProactiveHarvestingContentAttachment initWithJSONDictionary:error:](v117, "initWithJSONDictionary:error:", v116, &v285);
      v119 = v285;
      if (v119)
      {
        v175 = v119;
        v6 = v243;
        v7 = v244;
        if (a4)
          *a4 = objc_retainAutorelease(v119);

        v19 = 0;
        v120 = obj;
        goto LABEL_207;
      }
      objc_msgSend(v256, "addObject:", v118);

      v21 = v273;
      v22 = v271;
    }
    v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v286, v308, 16);
    v104 = v262;
    v103 = v263;
    v105 = v266;
    v106 = v260;
    v108 = v254;
    v107 = v255;
    v109 = v257;
    v110 = v251;
    v111 = v249;
    v112 = v246;
  }
  while (v102);
LABEL_111:
  v246 = v112;
  v249 = v111;
  v251 = v110;
  v254 = v108;
  v255 = v107;
  v257 = v109;
  v260 = v106;
  v262 = v104;
  v263 = v103;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fromHandles"));
  v120 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v120, "isEqual:", v121);

  if (!v122)
  {
    v266 = v105;
    v6 = v243;
    v7 = v244;
    v53 = v265;
    if (!v120)
      goto LABEL_152;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_152;
    if (!a4)
    {
      v19 = 0;
      v48 = v269;
      v17 = v270;
      v22 = v271;
      goto LABEL_222;
    }
    v212 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v213 = *MEMORY[0x1E0D025B8];
    v302 = *MEMORY[0x1E0CB2D50];
    v116 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("fromHandles"));
    v303 = v116;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v303, &v302, 1);
    v175 = (id)objc_claimAutoreleasedReturnValue();
    v214 = v213;
    v21 = v273;
    v215 = (id)objc_msgSend(v212, "initWithDomain:code:userInfo:", v214, 2, v175);
    v19 = 0;
    *a4 = v215;
    goto LABEL_145;
  }

  v120 = 0;
  v6 = v243;
  v7 = v244;
LABEL_152:
  v116 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v120, "count"));
  v281 = 0u;
  v282 = 0u;
  v283 = 0u;
  v284 = 0u;
  v120 = v120;
  v177 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v281, v301, 16);
  if (!v177)
    goto LABEL_162;
  v178 = v177;
  v179 = *(_QWORD *)v282;
  v239 = v120;
  do
  {
    for (j = 0; j != v178; ++j)
    {
      if (*(_QWORD *)v282 != v179)
        objc_enumerationMutation(v239);
      v181 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v191 = a4;
        if (a4)
        {
          v192 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v193 = *MEMORY[0x1E0D025B8];
          v299 = *MEMORY[0x1E0CB2D50];
          v182 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("fromHandles"));
          v300 = v182;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v300, &v299, 1);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          v195 = v192;
          v196 = v193;
          goto LABEL_183;
        }
LABEL_206:
        v19 = 0;
        v120 = v239;
        v175 = v239;
LABEL_207:
        v48 = v269;
        v17 = v270;
        v21 = v273;
        goto LABEL_220;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v191 = a4;
        if (!a4)
          goto LABEL_206;
        v197 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v198 = *MEMORY[0x1E0D025B8];
        v297 = *MEMORY[0x1E0CB2D50];
        v182 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("fromHandles"));
        v298 = v182;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v298, &v297, 1);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        v195 = v197;
        v196 = v198;
LABEL_183:
        *v191 = (id)objc_msgSend(v195, "initWithDomain:code:userInfo:", v196, 2, v194);

LABEL_187:
        v19 = 0;
        v120 = v239;
        v175 = v239;
        v48 = v269;
        v17 = v270;
        v21 = v273;
        goto LABEL_219;
      }
      v182 = v181;
      v183 = [BMProactiveHarvestingNamedHandle alloc];
      v280 = 0;
      v184 = -[BMProactiveHarvestingNamedHandle initWithJSONDictionary:error:](v183, "initWithJSONDictionary:error:", v182, &v280);
      v185 = v280;
      if (v185)
      {
        v199 = v185;
        if (a4)
          *a4 = objc_retainAutorelease(v185);

        goto LABEL_187;
      }
      objc_msgSend(v116, "addObject:", v184);

      v6 = v243;
      v7 = v244;
    }
    v120 = v239;
    v178 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v281, v301, 16);
  }
  while (v178);
LABEL_162:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("toHandles"));
  v175 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = objc_msgSend(v175, "isEqual:", v186);

  if (v187)
  {

    v175 = 0;
    goto LABEL_192;
  }
  if (v175)
  {
    objc_opt_class();
    v21 = v273;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v200 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v201 = *MEMORY[0x1E0D025B8];
        v295 = *MEMORY[0x1E0CB2D50];
        v182 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("toHandles"));
        v296 = v182;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v296, &v295, 1);
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        v203 = v201;
        v21 = v273;
        *a4 = (id)objc_msgSend(v200, "initWithDomain:code:userInfo:", v203, 2, v202);

        v19 = 0;
        v48 = v269;
        v17 = v270;
        goto LABEL_219;
      }
      v19 = 0;
      goto LABEL_145;
    }
  }
  else
  {
LABEL_192:
    v21 = v273;
  }
  v182 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v175, "count"));
  v276 = 0u;
  v277 = 0u;
  v278 = 0u;
  v279 = 0u;
  v175 = v175;
  v204 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v276, v294, 16);
  if (!v204)
    goto LABEL_203;
  v205 = v204;
  v237 = *(_QWORD *)v277;
  v240 = v120;
  while (2)
  {
    v206 = 0;
    while (2)
    {
      if (*(_QWORD *)v277 != v237)
        objc_enumerationMutation(v175);
      v207 = *(void **)(*((_QWORD *)&v276 + 1) + 8 * v206);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v269;
        v17 = v270;
        v216 = a4;
        v120 = v240;
        if (a4)
        {
          v238 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v236 = *MEMORY[0x1E0D025B8];
          v292 = *MEMORY[0x1E0CB2D50];
          v208 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("toHandles"));
          v293 = v208;
          v217 = (void *)MEMORY[0x1E0C99D80];
          v218 = &v293;
          v219 = &v292;
LABEL_213:
          objc_msgSend(v217, "dictionaryWithObjects:forKeys:count:", v218, v219, 1);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          *v216 = (id)objc_msgSend(v238, "initWithDomain:code:userInfo:", v236, 2, v220);
LABEL_217:

          v21 = v273;
        }
LABEL_218:

        v19 = 0;
        goto LABEL_219;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v48 = v269;
        v17 = v270;
        v216 = a4;
        v120 = v240;
        if (a4)
        {
          v238 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v236 = *MEMORY[0x1E0D025B8];
          v290 = *MEMORY[0x1E0CB2D50];
          v208 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("toHandles"));
          v291 = v208;
          v217 = (void *)MEMORY[0x1E0C99D80];
          v218 = &v291;
          v219 = &v290;
          goto LABEL_213;
        }
        goto LABEL_218;
      }
      v208 = v207;
      v209 = [BMProactiveHarvestingNamedHandle alloc];
      v275 = 0;
      v210 = -[BMProactiveHarvestingNamedHandle initWithJSONDictionary:error:](v209, "initWithJSONDictionary:error:", v208, &v275);
      v211 = v275;
      if (v211)
      {
        v220 = v211;
        if (a4)
          *a4 = objc_retainAutorelease(v211);

        v48 = v269;
        v17 = v270;
        v120 = v240;
        goto LABEL_217;
      }
      objc_msgSend(v182, "addObject:", v210);

      ++v206;
      v21 = v273;
      if (v205 != v206)
        continue;
      break;
    }
    v120 = v240;
    v205 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v276, v294, 16);
    if (v205)
      continue;
    break;
  }
LABEL_203:

  v48 = v269;
  v17 = v270;
  v19 = objc_retain(-[BMProactiveHarvestingNotifications initWithUniqueID:absoluteTimestamp:bundleID:notificationID:title:subtitle:body:threadID:category:isGroupMessage:isTimeSensitive:isCritical:isCommunicationNotification:contentProtection:personaId:attachments:fromHandles:toHandles:](v267, "initWithUniqueID:absoluteTimestamp:bundleID:notificationID:title:subtitle:body:threadID:category:isGroupMessage:isTimeSensitive:isCritical:isCommunicationNotification:contentProtection:personaId:attachments:fromHandles:toHandles:", v244, v270, v269, v265, v263, v266, v262, v260, v255, v257, v254, v251, v249, v247, v246,
            v256,
            v116,
            v182));
  v267 = v19;
LABEL_219:

  v6 = v243;
  v7 = v244;
LABEL_220:

  v22 = v271;
LABEL_221:
  v53 = v265;
LABEL_222:

LABEL_223:
  v151 = v247;

LABEL_224:
LABEL_225:

LABEL_226:
LABEL_227:
  v90 = v255;

LABEL_228:
LABEL_229:

LABEL_230:
LABEL_231:

LABEL_232:
  v61 = v263;

LABEL_233:
LABEL_234:

LABEL_235:
  self = v267;
LABEL_236:

LABEL_237:
LABEL_238:

LABEL_239:
  return v19;
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
  -[BMProactiveHarvestingNotifications attachments](self, "attachments", 0);
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

- (id)_fromHandlesJSONArray
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
  -[BMProactiveHarvestingNotifications fromHandles](self, "fromHandles", 0);
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
  -[BMProactiveHarvestingNotifications toHandles](self, "toHandles", 0);
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
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
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
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  _QWORD v63[18];
  _QWORD v64[20];

  v64[18] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingNotifications uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingNotifications absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMProactiveHarvestingNotifications bundleID](self, "bundleID");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications notificationID](self, "notificationID");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications title](self, "title");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications body](self, "body");
  v12 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications threadID](self, "threadID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications category](self, "category");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMProactiveHarvestingNotifications hasIsGroupMessage](self, "hasIsGroupMessage"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingNotifications isGroupMessage](self, "isGroupMessage"));
    v60 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v60 = 0;
  }
  if (-[BMProactiveHarvestingNotifications hasIsTimeSensitive](self, "hasIsTimeSensitive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingNotifications isTimeSensitive](self, "isTimeSensitive"));
    v59 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v59 = 0;
  }
  if (-[BMProactiveHarvestingNotifications hasIsCritical](self, "hasIsCritical"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingNotifications isCritical](self, "isCritical"));
    v58 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v58 = 0;
  }
  if (-[BMProactiveHarvestingNotifications hasIsCommunicationNotification](self, "hasIsCommunicationNotification"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMProactiveHarvestingNotifications isCommunicationNotification](self, "isCommunicationNotification"));
    v57 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v57 = 0;
  }
  -[BMProactiveHarvestingNotifications contentProtection](self, "contentProtection");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications personaId](self, "personaId");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications _attachmentsJSONArray](self, "_attachmentsJSONArray");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications _fromHandlesJSONArray](self, "_fromHandlesJSONArray");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingNotifications _toHandlesJSONArray](self, "_toHandlesJSONArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = CFSTR("uniqueID");
  v14 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v14;
  v64[0] = v14;
  v63[1] = CFSTR("absoluteTimestamp");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v15;
  v64[1] = v15;
  v63[2] = CFSTR("bundleID");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v16;
  v64[2] = v16;
  v63[3] = CFSTR("notificationID");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v17;
  v64[3] = v17;
  v63[4] = CFSTR("title");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v18;
  v64[4] = v18;
  v63[5] = CFSTR("subtitle");
  v19 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v19;
  v64[5] = v19;
  v63[6] = CFSTR("body");
  v20 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v20;
  v64[6] = v20;
  v63[7] = CFSTR("threadID");
  v21 = v62;
  if (!v62)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v64[7] = v21;
  v63[8] = CFSTR("category");
  v22 = (uint64_t)v61;
  if (!v61)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v64[8] = v22;
  v63[9] = CFSTR("isGroupMessage");
  v23 = (uint64_t)v60;
  if (!v60)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v52 = v7;
  v64[9] = v23;
  v63[10] = CFSTR("isTimeSensitive");
  v24 = (uint64_t)v59;
  v25 = (void *)v23;
  if (!v59)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v8;
  v47 = (void *)v24;
  v64[10] = v24;
  v63[11] = CFSTR("isCritical");
  v26 = (uint64_t)v58;
  if (!v58)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v3;
  v35 = v26;
  v64[11] = v26;
  v63[12] = CFSTR("isCommunicationNotification");
  v27 = v57;
  if (!v57)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v9;
  v64[12] = v27;
  v63[13] = CFSTR("contentProtection");
  v28 = v56;
  if (!v56)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v22;
  v48 = (void *)v10;
  v64[13] = v28;
  v63[14] = CFSTR("personaId");
  v29 = v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v12;
  v64[14] = v29;
  v63[15] = CFSTR("attachments");
  v31 = v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = v25;
  v64[15] = v31;
  v63[16] = CFSTR("fromHandles");
  v32 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v64[16] = v32;
  v63[17] = CFSTR("toHandles");
  v33 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v64[17] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 18, v35);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (!v53)
  if (!v54)

  if (!v55)
  if (!v56)

  if (!v57)
  if (!v58)

  if (!v59)
  if (!v60)

  if (!v61)
  if (v62)
  {
    if (v30)
      goto LABEL_74;
  }
  else
  {

    if (v30)
    {
LABEL_74:
      if (v11)
        goto LABEL_75;
      goto LABEL_83;
    }
  }

  if (v11)
  {
LABEL_75:
    if (v48)
      goto LABEL_76;
    goto LABEL_84;
  }
LABEL_83:

  if (v48)
  {
LABEL_76:
    if (v49)
      goto LABEL_77;
    goto LABEL_85;
  }
LABEL_84:

  if (v49)
  {
LABEL_77:
    if (v51)
      goto LABEL_78;
    goto LABEL_86;
  }
LABEL_85:

  if (v51)
  {
LABEL_78:
    if (v52)
      goto LABEL_79;
LABEL_87:

    if (v50)
      goto LABEL_80;
LABEL_88:

    goto LABEL_80;
  }
LABEL_86:

  if (!v52)
    goto LABEL_87;
LABEL_79:
  if (!v50)
    goto LABEL_88;
LABEL_80:

  return v46;
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
  int v61;
  int v62;
  int v63;
  int v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingNotifications uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingNotifications uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications absoluteTimestamp](self, "absoluteTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingNotifications absoluteTimestamp](self, "absoluteTimestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications bundleID](self, "bundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingNotifications bundleID](self, "bundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications notificationID](self, "notificationID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationID");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingNotifications notificationID](self, "notificationID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notificationID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications title](self, "title");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingNotifications title](self, "title");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications subtitle](self, "subtitle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtitle");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMProactiveHarvestingNotifications subtitle](self, "subtitle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subtitle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications body](self, "body");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "body");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMProactiveHarvestingNotifications body](self, "body");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "body");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications threadID](self, "threadID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadID");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMProactiveHarvestingNotifications threadID](self, "threadID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "threadID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications category](self, "category");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMProactiveHarvestingNotifications category](self, "category");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "category");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
        goto LABEL_73;
    }
    if (-[BMProactiveHarvestingNotifications hasIsGroupMessage](self, "hasIsGroupMessage")
      || objc_msgSend(v5, "hasIsGroupMessage"))
    {
      if (!-[BMProactiveHarvestingNotifications hasIsGroupMessage](self, "hasIsGroupMessage"))
        goto LABEL_73;
      if (!objc_msgSend(v5, "hasIsGroupMessage"))
        goto LABEL_73;
      v61 = -[BMProactiveHarvestingNotifications isGroupMessage](self, "isGroupMessage");
      if (v61 != objc_msgSend(v5, "isGroupMessage"))
        goto LABEL_73;
    }
    if (-[BMProactiveHarvestingNotifications hasIsTimeSensitive](self, "hasIsTimeSensitive")
      || objc_msgSend(v5, "hasIsTimeSensitive"))
    {
      if (!-[BMProactiveHarvestingNotifications hasIsTimeSensitive](self, "hasIsTimeSensitive"))
        goto LABEL_73;
      if (!objc_msgSend(v5, "hasIsTimeSensitive"))
        goto LABEL_73;
      v62 = -[BMProactiveHarvestingNotifications isTimeSensitive](self, "isTimeSensitive");
      if (v62 != objc_msgSend(v5, "isTimeSensitive"))
        goto LABEL_73;
    }
    if (-[BMProactiveHarvestingNotifications hasIsCritical](self, "hasIsCritical")
      || objc_msgSend(v5, "hasIsCritical"))
    {
      if (!-[BMProactiveHarvestingNotifications hasIsCritical](self, "hasIsCritical"))
        goto LABEL_73;
      if (!objc_msgSend(v5, "hasIsCritical"))
        goto LABEL_73;
      v63 = -[BMProactiveHarvestingNotifications isCritical](self, "isCritical");
      if (v63 != objc_msgSend(v5, "isCritical"))
        goto LABEL_73;
    }
    if (-[BMProactiveHarvestingNotifications hasIsCommunicationNotification](self, "hasIsCommunicationNotification")
      || objc_msgSend(v5, "hasIsCommunicationNotification"))
    {
      if (!-[BMProactiveHarvestingNotifications hasIsCommunicationNotification](self, "hasIsCommunicationNotification"))
        goto LABEL_73;
      if (!objc_msgSend(v5, "hasIsCommunicationNotification"))
        goto LABEL_73;
      v64 = -[BMProactiveHarvestingNotifications isCommunicationNotification](self, "isCommunicationNotification");
      if (v64 != objc_msgSend(v5, "isCommunicationNotification"))
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications contentProtection](self, "contentProtection");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v66 = objc_claimAutoreleasedReturnValue();
    if (v65 == (void *)v66)
    {

    }
    else
    {
      v67 = (void *)v66;
      -[BMProactiveHarvestingNotifications contentProtection](self, "contentProtection");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v68, "isEqual:", v69);

      if (!v70)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications personaId](self, "personaId");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v72 = objc_claimAutoreleasedReturnValue();
    if (v71 == (void *)v72)
    {

    }
    else
    {
      v73 = (void *)v72;
      -[BMProactiveHarvestingNotifications personaId](self, "personaId");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v74, "isEqual:", v75);

      if (!v76)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications attachments](self, "attachments");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachments");
    v78 = objc_claimAutoreleasedReturnValue();
    if (v77 == (void *)v78)
    {

    }
    else
    {
      v79 = (void *)v78;
      -[BMProactiveHarvestingNotifications attachments](self, "attachments");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachments");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v80, "isEqual:", v81);

      if (!v82)
        goto LABEL_73;
    }
    -[BMProactiveHarvestingNotifications fromHandles](self, "fromHandles");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fromHandles");
    v84 = objc_claimAutoreleasedReturnValue();
    if (v83 == (void *)v84)
    {

    }
    else
    {
      v85 = (void *)v84;
      -[BMProactiveHarvestingNotifications fromHandles](self, "fromHandles");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fromHandles");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v86, "isEqual:", v87);

      if (!v88)
      {
LABEL_73:
        v12 = 0;
LABEL_74:

        goto LABEL_75;
      }
    }
    -[BMProactiveHarvestingNotifications toHandles](self, "toHandles");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toHandles");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90 == v91)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingNotifications toHandles](self, "toHandles");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "toHandles");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v92, "isEqual:", v93);

    }
    goto LABEL_74;
  }
  v12 = 0;
LABEL_75:

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

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (NSString)category
{
  return self->_category;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (BOOL)hasIsGroupMessage
{
  return self->_hasIsGroupMessage;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  self->_hasIsGroupMessage = a3;
}

- (BOOL)isTimeSensitive
{
  return self->_isTimeSensitive;
}

- (BOOL)hasIsTimeSensitive
{
  return self->_hasIsTimeSensitive;
}

- (void)setHasIsTimeSensitive:(BOOL)a3
{
  self->_hasIsTimeSensitive = a3;
}

- (BOOL)isCritical
{
  return self->_isCritical;
}

- (BOOL)hasIsCritical
{
  return self->_hasIsCritical;
}

- (void)setHasIsCritical:(BOOL)a3
{
  self->_hasIsCritical = a3;
}

- (BOOL)isCommunicationNotification
{
  return self->_isCommunicationNotification;
}

- (BOOL)hasIsCommunicationNotification
{
  return self->_hasIsCommunicationNotification;
}

- (void)setHasIsCommunicationNotification:(BOOL)a3
{
  self->_hasIsCommunicationNotification = a3;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSArray)fromHandles
{
  return self->_fromHandles;
}

- (NSArray)toHandles
{
  return self->_toHandles;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandles, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMProactiveHarvestingNotifications initByReadFrom:]([BMProactiveHarvestingNotifications alloc], "initByReadFrom:", v7);
    v4[10] = 0;

  }
  return v4;
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
  _QWORD v23[21];

  v23[19] = *MEMORY[0x1E0C80C00];
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 2, 0, 1);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 3, 13, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("notificationID"), 2, 0, 4, 13, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 5, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subtitle"), 2, 0, 6, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("body"), 2, 0, 7, 13, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("threadID"), 2, 0, 8, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("category"), 2, 0, 9, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isGroupMessage"), 0, 0, 10, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isTimeSensitive"), 0, 0, 11, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCritical"), 0, 0, 12, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCommunicationNotification"), 0, 0, 13, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 14, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 15, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("attachments_json"), 5, 1, &__block_literal_global_43386);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("handles_json"), 5, 1, &__block_literal_global_74);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("fromHandles_json"), 5, 1, &__block_literal_global_75);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("toHandles_json"), 5, 1, &__block_literal_global_76_43387);
  v23[0] = v22;
  v23[1] = v21;
  v23[2] = v20;
  v23[3] = v18;
  v23[4] = v17;
  v23[5] = v16;
  v23[6] = v15;
  v23[7] = v19;
  v23[8] = v14;
  v23[9] = v2;
  v23[10] = v13;
  v23[11] = v3;
  v23[12] = v12;
  v23[13] = v4;
  v23[14] = v5;
  v23[15] = v6;
  v23[16] = v11;
  v23[17] = v7;
  v23[18] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 19);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D458;
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
  _QWORD v23[21];

  v23[19] = *MEMORY[0x1E0C80C00];
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v23[0] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 2, 0, 0);
  v23[1] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 3, 13, 0);
  v23[2] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("notificationID"), 4, 13, 0);
  v23[3] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 5, 13, 0);
  v23[4] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subtitle"), 6, 13, 0);
  v23[5] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("body"), 7, 13, 0);
  v23[6] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("threadID"), 8, 13, 0);
  v23[7] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("category"), 9, 13, 0);
  v23[8] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isGroupMessage"), 10, 12, 0);
  v23[9] = v13;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isTimeSensitive"), 11, 12, 0);
  v23[10] = v12;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCritical"), 12, 12, 0);
  v23[11] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCommunicationNotification"), 13, 12, 0);
  v23[12] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 14, 13, 0);
  v23[13] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 15, 13, 0);
  v23[14] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("attachments"), 16, 14, objc_opt_class());
  v23[15] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("handles"), 17, 14, objc_opt_class());
  v23[16] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fromHandles"), 18, 14, objc_opt_class());
  v23[17] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("toHandles"), 19, 14, objc_opt_class());
  v23[18] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __45__BMProactiveHarvestingNotifications_columns__block_invoke_4(uint64_t a1, void *a2)
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

id __45__BMProactiveHarvestingNotifications_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fromHandlesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __45__BMProactiveHarvestingNotifications_columns__block_invoke_2()
{
  return 0;
}

id __45__BMProactiveHarvestingNotifications_columns__block_invoke(uint64_t a1, void *a2)
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

@end
