@implementation BMSiriRemembersInteraction

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14 appIntentInteractionIdentifier:(id)a15 interactionSource:(int)a16 contentHash:(id)a17 userDonatorType:(int)a18
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BMSiriRemembersInteraction *v27;
  double v28;
  double v29;
  uint64_t v30;
  id v33;
  id v34;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  v43 = a3;
  v33 = a4;
  v42 = a4;
  v34 = a5;
  v41 = a5;
  v40 = a6;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v39 = a12;
  v38 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a17;
  v44.receiver = self;
  v44.super_class = (Class)BMSiriRemembersInteraction;
  v27 = -[BMEventBase init](&v44, sel_init);
  if (v27)
  {
    v27->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v27->_identifier, a3);
    objc_storeStrong((id *)&v27->_type, v33);
    objc_storeStrong((id *)&v27->_domain, v34);
    objc_storeStrong((id *)&v27->_appBundleId, a6);
    v27->_status = a7;
    v27->_direction = a8;
    if (v21)
    {
      v27->_hasIsDonatedBySiri = 1;
      v27->_isDonatedBySiri = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v27->_hasIsDonatedBySiri = 0;
      v27->_isDonatedBySiri = 0;
    }
    if (v22)
    {
      v27->_hasRaw_startDate = 1;
      objc_msgSend(v22, "timeIntervalSince1970");
    }
    else
    {
      v27->_hasRaw_startDate = 0;
      v28 = -1.0;
    }
    v27->_raw_startDate = v28;
    if (v23)
    {
      v27->_hasDurationInSeconds = 1;
      objc_msgSend(v23, "doubleValue");
    }
    else
    {
      v27->_hasDurationInSeconds = 0;
      v29 = -1.0;
    }
    v27->_durationInSeconds = v29;
    objc_storeStrong((id *)&v27->_interactionFields, a12);
    objc_storeStrong((id *)&v27->_fields, a13);
    objc_storeStrong((id *)&v27->_groupIdentifier, a14);
    objc_storeStrong((id *)&v27->_appIntentInteractionIdentifier, a15);
    v27->_interactionSource = a16;
    if (v26)
    {
      v27->_hasContentHash = 1;
      v30 = objc_msgSend(v26, "longLongValue");
    }
    else
    {
      v27->_hasContentHash = 0;
      v30 = -1;
    }
    v27->_contentHash = v30;
    v27->_userDonatorType = a18;
  }

  return v27;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriRemembersInteraction identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction type](self, "type");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction domain](self, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction appBundleId](self, "appBundleId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriRemembersInteractionInteractionStatusAsString(-[BMSiriRemembersInteraction status](self, "status"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriRemembersInteractionInteractionDirectionAsString(-[BMSiriRemembersInteraction direction](self, "direction"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRemembersInteraction isDonatedBySiri](self, "isDonatedBySiri"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction startDate](self, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriRemembersInteraction durationInSeconds](self, "durationInSeconds");
  objc_msgSend(v3, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction interactionFields](self, "interactionFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction fields](self, "fields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction groupIdentifier](self, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction appIntentInteractionIdentifier](self, "appIntentInteractionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriRemembersInteractionInteractionSourceAsString(-[BMSiriRemembersInteraction interactionSource](self, "interactionSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriRemembersInteraction contentHash](self, "contentHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriRemembersInteractionUserDonatorTypeAsString(-[BMSiriRemembersInteraction userDonatorType](self, "userDonatorType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("BMSiriRemembersInteraction with identifier: %@, type: %@, domain: %@, appBundleId: %@, status: %@, direction: %@, isDonatedBySiri: %@, startDate: %@, durationInSeconds: %@, interactionFields: %@, fields: %@, groupIdentifier: %@, appIntentInteractionIdentifier: %@, interactionSource: %@, contentHash: %@, userDonatorType: %@"), v18, v22, v17, v16, v21, v15, v14, v13, v12, v11, v10, v4, v5, v6, v7, v8);

  return (NSString *)v20;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRemembersInteraction *v5;
  void *v6;
  int *v7;
  int *v8;
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  unint64_t v46;
  objc_class *v47;
  uint64_t v48;
  unint64_t v49;
  int *v50;
  int *v51;
  id v52;
  void *v53;
  void *v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSArray *interactionFields;
  int v78;
  BMSiriRemembersInteraction *v79;
  objc_super v81;
  uint64_t v82;
  uint64_t v83;

  v4 = a3;
  v81.receiver = self;
  v81.super_class = (Class)BMSiriRemembersInteraction;
  v5 = -[BMEventBase init](&v81, sel_init);
  if (!v5)
    goto LABEL_122;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v11 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v7;
        v17 = *(_QWORD *)&v4[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v4[*v8])
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
          v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v21 = v4[*v9];
      if (v4[*v9])
        v15 = 0;
LABEL_15:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v10[506];
          goto LABEL_59;
        case 2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v11[507];
          goto LABEL_59;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 72;
          goto LABEL_59;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
          goto LABEL_59;
        case 5u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (2)
          {
            v28 = *v7;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v29);
              *(_QWORD *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v20 = v26++ >= 9;
                if (v20)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v27) = 0;
LABEL_84:
          if (v27 >= 8)
            LODWORD(v27) = 0;
          v74 = 40;
          goto LABEL_113;
        case 6u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          while (2)
          {
            v34 = *v7;
            v35 = *(_QWORD *)&v4[v34];
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v35);
              *(_QWORD *)&v4[v34] = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v20 = v33++ >= 9;
                if (v20)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v27) = 0;
LABEL_90:
          if (v27 >= 4)
            LODWORD(v27) = 0;
          v74 = 44;
          goto LABEL_113;
        case 7u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v5->_hasIsDonatedBySiri = 1;
          while (2)
          {
            v41 = *v7;
            v42 = *(_QWORD *)&v4[v41];
            v43 = v42 + 1;
            if (v42 == -1 || v43 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v42);
              *(_QWORD *)&v4[v41] = v43;
              v40 |= (unint64_t)(v44 & 0x7F) << v38;
              if (v44 < 0)
              {
                v38 += 7;
                v20 = v39++ >= 9;
                if (v20)
                {
                  v40 = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v40 = 0;
LABEL_96:
          v5->_isDonatedBySiri = v40 != 0;
          continue;
        case 8u:
          v5->_hasRaw_startDate = 1;
          v45 = *v7;
          v46 = *(_QWORD *)&v4[v45];
          if (v46 <= 0xFFFFFFFFFFFFFFF7 && v46 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v47 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v46);
            *(_QWORD *)&v4[v45] = v46 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v47 = 0;
          }
          v75 = 24;
          goto LABEL_118;
        case 9u:
          v5->_hasDurationInSeconds = 1;
          v48 = *v7;
          v49 = *(_QWORD *)&v4[v48];
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v47 = *(objc_class **)(*(_QWORD *)&v4[*v12] + v49);
            *(_QWORD *)&v4[v48] = v49 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v47 = 0;
          }
          v75 = 88;
LABEL_118:
          *(Class *)((char *)&v5->super.super.isa + v75) = v47;
          continue;
        case 0xAu:
          v82 = 0;
          v83 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_124;
          v50 = v11;
          v51 = v10;
          v52 = -[BMSiriRemembersField initByReadFrom:]([BMSiriRemembersField alloc], "initByReadFrom:", v4);
          if (!v52)
            goto LABEL_124;
          v53 = v52;
          objc_msgSend(v6, "addObject:", v52);
          PBReaderRecallMark();

          v10 = v51;
          v11 = v50;
          continue;
        case 0xBu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
          goto LABEL_59;
        case 0xCu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 112;
          goto LABEL_59;
        case 0xDu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 120;
LABEL_59:
          v54 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0xEu:
          v55 = 0;
          v56 = 0;
          v27 = 0;
          while (2)
          {
            v57 = *v7;
            v58 = *(_QWORD *)&v4[v57];
            v59 = v58 + 1;
            if (v58 == -1 || v59 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v58);
              *(_QWORD *)&v4[v57] = v59;
              v27 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                v20 = v56++ >= 9;
                if (v20)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v27) = 0;
LABEL_100:
          if (v27 >= 3)
            LODWORD(v27) = 0;
          v74 = 48;
          goto LABEL_113;
        case 0xFu:
          v61 = 0;
          v62 = 0;
          v63 = 0;
          v5->_hasContentHash = 1;
          while (2)
          {
            v64 = *v7;
            v65 = *(_QWORD *)&v4[v64];
            v66 = v65 + 1;
            if (v65 == -1 || v66 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v67 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v65);
              *(_QWORD *)&v4[v64] = v66;
              v63 |= (unint64_t)(v67 & 0x7F) << v61;
              if (v67 < 0)
              {
                v61 += 7;
                v20 = v62++ >= 9;
                if (v20)
                {
                  v63 = 0;
                  goto LABEL_106;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v63 = 0;
LABEL_106:
          v5->_contentHash = v63;
          continue;
        case 0x10u:
          v68 = 0;
          v69 = 0;
          v27 = 0;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_124:

          goto LABEL_121;
      }
      while (1)
      {
        v70 = *v7;
        v71 = *(_QWORD *)&v4[v70];
        v72 = v71 + 1;
        if (v71 == -1 || v72 > *(_QWORD *)&v4[*v8])
          break;
        v73 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v71);
        *(_QWORD *)&v4[v70] = v72;
        v27 |= (unint64_t)(v73 & 0x7F) << v68;
        if ((v73 & 0x80) == 0)
          goto LABEL_108;
        v68 += 7;
        v20 = v69++ >= 9;
        if (v20)
        {
          LODWORD(v27) = 0;
          goto LABEL_110;
        }
      }
      v4[*v9] = 1;
LABEL_108:
      if (v4[*v9])
        LODWORD(v27) = 0;
LABEL_110:
      if (v27 >= 4)
        LODWORD(v27) = 0;
      v74 = 52;
LABEL_113:
      *(_DWORD *)((char *)&v5->super.super.isa + v74) = v27;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v76 = objc_msgSend(v6, "copy");
  interactionFields = v5->_interactionFields;
  v5->_interactionFields = (NSArray *)v76;

  v78 = v4[*v9];
  if (v78)
LABEL_121:
    v79 = 0;
  else
LABEL_122:
    v79 = v5;

  return v79;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_type)
    PBDataWriterWriteStringField();
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_appBundleId)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsDonatedBySiri)
    PBDataWriterWriteBOOLField();
  if (self->_hasRaw_startDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasDurationInSeconds)
    PBDataWriterWriteDoubleField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_interactionFields;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_fields)
    PBDataWriterWriteStringField();
  if (self->_groupIdentifier)
    PBDataWriterWriteStringField();
  if (self->_appIntentInteractionIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasContentHash)
    PBDataWriterWriteInt64Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriRemembersInteraction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRemembersInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  BMSiriRemembersInteraction *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  BMSiriRemembersInteraction *v30;
  id *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  objc_class *v39;
  void *v40;
  id v41;
  id v42;
  double v43;
  double v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  id *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  BMSiriRemembersInteraction *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  id v86;
  BMSiriRemembersField *v87;
  BMSiriRemembersField *v88;
  id v89;
  id v90;
  void *v91;
  uint64_t v92;
  id v93;
  id v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  id *v99;
  id v100;
  uint64_t v101;
  void *v102;
  id *v103;
  uint64_t *v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  void *v116;
  id v117;
  void *v118;
  uint64_t v119;
  void *v120;
  id v121;
  id v122;
  id v123;
  uint64_t v124;
  void *v125;
  id v126;
  void *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  id v144;
  uint64_t v145;
  id v146;
  id v147;
  uint64_t v148;
  void *v149;
  id v150;
  void *v151;
  uint64_t v152;
  void *v153;
  id v154;
  id v155;
  uint64_t v156;
  id v157;
  id v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  id v162;
  uint64_t v163;
  id v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  id v181;
  void *v182;
  void *v183;
  void *v184;
  id v185;
  id v186;
  void *v187;
  id v188;
  id v189;
  void *v190;
  id v191;
  void *v192;
  void *v193;
  id v194;
  void *v195;
  void *v196;
  id v197;
  void *v198;
  void *v199;
  id *v200;
  BMSiriRemembersInteraction *v201;
  BMSiriRemembersInteraction *v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id obj;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  id v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  uint64_t v218;
  void *v219;
  uint64_t v220;
  id v221;
  uint64_t v222;
  id v223;
  uint64_t v224;
  id v225;
  uint64_t v226;
  id v227;
  uint64_t v228;
  id v229;
  uint64_t v230;
  id v231;
  uint64_t v232;
  id v233;
  _BYTE v234[128];
  uint64_t v235;
  void *v236;
  uint64_t v237;
  id v238;
  uint64_t v239;
  id v240;
  uint64_t v241;
  void *v242;
  uint64_t v243;
  id v244;
  uint64_t v245;
  id v246;
  uint64_t v247;
  id v248;
  uint64_t v249;
  id v250;
  uint64_t v251;
  void *v252;
  uint64_t v253;
  _QWORD v254[3];

  v254[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v253 = *MEMORY[0x1E0CB2D50];
        v23 = self;
        v24 = objc_alloc(MEMORY[0x1E0CB3940]);
        v167 = objc_opt_class();
        v25 = v24;
        self = v23;
        v26 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v167, CFSTR("identifier"));
        v254[0] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v254, &v253, 1);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v21;
        v9 = (void *)v27;
        v29 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v22, 2, v27);
        v8 = 0;
        v30 = 0;
        *a4 = v29;
        goto LABEL_147;
      }
      v8 = 0;
      v30 = 0;
      goto LABEL_148;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = v6;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v201 = self;
        v31 = a4;
        v32 = v9;
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = v8;
        v35 = *MEMORY[0x1E0D025B8];
        v251 = *MEMORY[0x1E0CB2D50];
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("type"));
        v252 = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v252, &v251, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v33;
        v9 = v32;
        v38 = v35;
        v8 = v34;
        v26 = 0;
        v30 = 0;
        *v31 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v10);
        self = v201;
        goto LABEL_146;
      }
      v26 = 0;
      v30 = 0;
      goto LABEL_147;
    }
    v206 = v9;
  }
  else
  {
    v206 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domain"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = v10;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v46 = v9;
        v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v48 = v8;
        v49 = *MEMORY[0x1E0D025B8];
        v249 = *MEMORY[0x1E0CB2D50];
        v50 = v7;
        v51 = objc_alloc(MEMORY[0x1E0CB3940]);
        v202 = self;
        v52 = a4;
        v168 = objc_opt_class();
        v53 = v51;
        v7 = v50;
        v10 = v209;
        v205 = (id)objc_msgSend(v53, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v168, CFSTR("domain"));
        v250 = v205;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v250, &v249, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v47;
        v9 = v46;
        v55 = v49;
        v8 = v48;
        v36 = 0;
        v30 = 0;
        *v52 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v55, 2, v11);
        self = v202;
        v26 = v206;
        goto LABEL_145;
      }
      v36 = 0;
      v30 = 0;
      v26 = v206;
      goto LABEL_146;
    }
    v200 = a4;
    v203 = v10;
  }
  else
  {
    v200 = a4;
    v203 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appBundleId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = v8;
  v198 = v9;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v200)
      {
        v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v57 = *MEMORY[0x1E0D025B8];
        v247 = *MEMORY[0x1E0CB2D50];
        v58 = v7;
        v59 = objc_alloc(MEMORY[0x1E0CB3940]);
        v169 = objc_opt_class();
        v60 = v59;
        v7 = v58;
        v14 = (id)objc_msgSend(v60, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v169, CFSTR("appBundleId"));
        v248 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v248, &v247, 1);
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = v56;
        v9 = v198;
        v199 = (void *)v61;
        v63 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v57, 2);
        v205 = 0;
        v30 = 0;
        *v200 = v63;
        v26 = v206;
        v10 = v209;
        v36 = v203;
        goto LABEL_144;
      }
      v205 = 0;
      v30 = 0;
      v26 = v206;
      v36 = v203;
      goto LABEL_145;
    }
    v205 = v11;
  }
  else
  {
    v205 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v12 = objc_claimAutoreleasedReturnValue();
  v212 = v11;
  v199 = (void *)v12;
  if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
    }
    else
    {
      v64 = self;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v200)
        {
          v14 = 0;
          v30 = 0;
          v26 = v206;
          v36 = v203;
          v11 = v212;
          goto LABEL_144;
        }
        v114 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v115 = *MEMORY[0x1E0D025B8];
        v245 = *MEMORY[0x1E0CB2D50];
        v116 = v7;
        v117 = objc_alloc(MEMORY[0x1E0CB3940]);
        v172 = objc_opt_class();
        v118 = v117;
        v7 = v116;
        v197 = (id)objc_msgSend(v118, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v172, CFSTR("status"));
        v246 = v197;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v246, &v245, 1);
        v119 = objc_claimAutoreleasedReturnValue();
        v120 = v114;
        v9 = v198;
        v196 = (void *)v119;
        v121 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v115, 2);
        v14 = 0;
        v30 = 0;
        *v200 = v121;
        goto LABEL_166;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriRemembersInteractionInteractionStatusFromString(v13));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v212;
    }
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("direction"));
  v15 = objc_claimAutoreleasedReturnValue();
  v196 = (void *)v15;
  if (v15)
  {
    v16 = (void *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v197 = v16;
        goto LABEL_19;
      }
      v64 = self;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriRemembersInteractionInteractionDirectionFromString(v16));
        v197 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v212;
        goto LABEL_19;
      }
      if (v200)
      {
        v122 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v123 = v14;
        v124 = *MEMORY[0x1E0D025B8];
        v243 = *MEMORY[0x1E0CB2D50];
        v125 = v7;
        v126 = objc_alloc(MEMORY[0x1E0CB3940]);
        v173 = objc_opt_class();
        v127 = v126;
        v7 = v125;
        v194 = (id)objc_msgSend(v127, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v173, CFSTR("direction"));
        v244 = v194;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v244, &v243, 1);
        v128 = objc_claimAutoreleasedReturnValue();
        v129 = v122;
        v9 = v198;
        v130 = v124;
        v14 = v123;
        v195 = (void *)v128;
        v197 = 0;
        v30 = 0;
        *v200 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2);
        v26 = v206;
        v10 = v209;
        v36 = v203;
        v11 = v212;
        goto LABEL_142;
      }
      v197 = 0;
      v30 = 0;
LABEL_166:
      self = v64;
      v26 = v206;
      v10 = v209;
      v36 = v203;
      v11 = v212;
      goto LABEL_143;
    }
  }
  v197 = 0;
LABEL_19:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isDonatedBySiri"));
  v17 = objc_claimAutoreleasedReturnValue();
  v195 = (void *)v17;
  if (v17 && (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v200)
      {
        v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v66 = v14;
        v67 = *MEMORY[0x1E0D025B8];
        v241 = *MEMORY[0x1E0CB2D50];
        v68 = v7;
        v69 = objc_alloc(MEMORY[0x1E0CB3940]);
        v170 = objc_opt_class();
        v70 = v69;
        v7 = v68;
        v10 = v209;
        v193 = (void *)objc_msgSend(v70, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v170, CFSTR("isDonatedBySiri"));
        v242 = v193;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v242, &v241, 1);
        v71 = objc_claimAutoreleasedReturnValue();
        v72 = v65;
        v9 = v198;
        v73 = v67;
        v14 = v66;
        v192 = (void *)v71;
        v194 = 0;
        v30 = 0;
        *v200 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2);
        v26 = v206;
        v36 = v203;
        goto LABEL_141;
      }
      v194 = 0;
      v30 = 0;
      v26 = v206;
      v36 = v203;
      goto LABEL_142;
    }
    v194 = v18;
  }
  else
  {
    v194 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startDate"));
  v19 = objc_claimAutoreleasedReturnValue();
  v192 = (void *)v19;
  if (v19)
  {
    v20 = (void *)v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = (objc_class *)MEMORY[0x1E0C99D68];
        v40 = v9;
        v41 = v20;
        v42 = [v39 alloc];
        objc_msgSend(v41, "doubleValue");
        v44 = v43;

        v9 = v40;
        v45 = (id)objc_msgSend(v42, "initWithTimeIntervalSince1970:", v44);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v74 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v74, "dateFromString:", v20);
          v193 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_59;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v200)
          {
            v193 = 0;
            v30 = 0;
            v26 = v206;
            v36 = v203;
            goto LABEL_141;
          }
          v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v148 = *MEMORY[0x1E0D025B8];
          v239 = *MEMORY[0x1E0CB2D50];
          v149 = v7;
          v150 = objc_alloc(MEMORY[0x1E0CB3940]);
          v174 = objc_opt_class();
          v151 = v150;
          v7 = v149;
          v191 = (id)objc_msgSend(v151, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), v174, CFSTR("startDate"));
          v240 = v191;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v240, &v239, 1);
          v152 = objc_claimAutoreleasedReturnValue();
          v153 = v147;
          v9 = v198;
          v190 = (void *)v152;
          v154 = (id)objc_msgSend(v153, "initWithDomain:code:userInfo:", v148, 2);
          v193 = 0;
          v30 = 0;
          *v200 = v154;
          v26 = v206;
          v10 = v209;
          goto LABEL_162;
        }
        v45 = v20;
      }
      v193 = v45;
LABEL_59:
      v10 = v209;
      goto LABEL_60;
    }
  }
  v193 = 0;
LABEL_60:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("durationInSeconds"));
  v75 = objc_claimAutoreleasedReturnValue();
  v190 = (void *)v75;
  if (v75)
  {
    v76 = (void *)v75;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v188 = v14;
        v191 = v76;
        goto LABEL_63;
      }
      if (v200)
      {
        v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v91 = v7;
        v92 = *MEMORY[0x1E0D025B8];
        v237 = *MEMORY[0x1E0CB2D50];
        v93 = v14;
        v94 = objc_alloc(MEMORY[0x1E0CB3940]);
        v171 = objc_opt_class();
        v95 = v94;
        v14 = v93;
        obj = (id)objc_msgSend(v95, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v171, CFSTR("durationInSeconds"));
        v238 = obj;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v238, &v237, 1);
        v96 = objc_claimAutoreleasedReturnValue();
        v97 = v90;
        v9 = v198;
        v98 = v92;
        v7 = v91;
        v10 = v209;
        v211 = (void *)v96;
        v191 = 0;
        v30 = 0;
        *v200 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v98, 2);
        v26 = v206;
        v36 = v203;

        goto LABEL_139;
      }
      v191 = 0;
      v30 = 0;
      v26 = v206;
LABEL_162:
      v36 = v203;
      goto LABEL_140;
    }
  }
  v188 = v14;
  v191 = 0;
LABEL_63:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interactionFields"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v77, "isEqual:", v78);

  if (v79)
  {
    v187 = v7;

    v77 = 0;
  }
  else
  {
    if (v77)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        obj = v77;
        if (!v200)
        {
          v30 = 0;
          v9 = v198;
          v26 = v206;
          v36 = v203;
          v14 = v188;
          goto LABEL_139;
        }
        v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v108 = v7;
        v109 = *MEMORY[0x1E0D025B8];
        v235 = *MEMORY[0x1E0CB2D50];
        v210 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("interactionFields"));
        v236 = v210;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v236, &v235, 1);
        v110 = objc_claimAutoreleasedReturnValue();
        v111 = v107;
        v112 = (void *)v110;
        v113 = v109;
        v7 = v108;
        v30 = 0;
        *v200 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v113, 2, v110);
        v26 = v206;
        v36 = v203;
LABEL_101:
        v14 = v188;
        goto LABEL_137;
      }
    }
    v187 = v7;
  }
  v210 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v77, "count"));
  v214 = 0u;
  v215 = 0u;
  v216 = 0u;
  v217 = 0u;
  v80 = v77;
  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v214, v234, 16);
  obj = v80;
  if (!v81)
    goto LABEL_78;
  v82 = v81;
  v83 = *(_QWORD *)v215;
  while (2)
  {
    for (i = 0; i != v82; ++i)
    {
      if (*(_QWORD *)v215 != v83)
        objc_enumerationMutation(obj);
      v85 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v99 = v200;
        if (v200)
        {
          v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v101 = *MEMORY[0x1E0D025B8];
          v232 = *MEMORY[0x1E0CB2D50];
          v86 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("interactionFields"));
          v233 = v86;
          v102 = (void *)MEMORY[0x1E0C99D80];
          v103 = &v233;
          v104 = &v232;
LABEL_89:
          objc_msgSend(v102, "dictionaryWithObjects:forKeys:count:", v103, v104, 1);
          v105 = (id)objc_claimAutoreleasedReturnValue();
          v106 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v101, 2, v105);
          v30 = 0;
          *v99 = v106;
LABEL_93:
          v10 = v209;
          v186 = obj;
          v36 = v203;
          v7 = v187;
          v14 = v188;
          v26 = v206;
          goto LABEL_135;
        }
        goto LABEL_100;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v99 = v200;
        if (v200)
        {
          v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v101 = *MEMORY[0x1E0D025B8];
          v230 = *MEMORY[0x1E0CB2D50];
          v86 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("interactionFields"));
          v231 = v86;
          v102 = (void *)MEMORY[0x1E0C99D80];
          v103 = &v231;
          v104 = &v230;
          goto LABEL_89;
        }
LABEL_100:
        v30 = 0;
        v112 = obj;
        v10 = v209;
        v36 = v203;
        v7 = v187;
        v26 = v206;
        goto LABEL_101;
      }
      v86 = v85;
      v87 = [BMSiriRemembersField alloc];
      v213 = 0;
      v88 = -[BMSiriRemembersField initWithJSONDictionary:error:](v87, "initWithJSONDictionary:error:", v86, &v213);
      v89 = v213;
      if (v89)
      {
        v105 = v89;
        if (v200)
          *v200 = objc_retainAutorelease(v89);

        v30 = 0;
        goto LABEL_93;
      }
      objc_msgSend(v210, "addObject:", v88);

      v11 = v212;
    }
    v80 = obj;
    v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v214, v234, 16);
    if (v82)
      continue;
    break;
  }
LABEL_78:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fields"));
  v86 = (id)objc_claimAutoreleasedReturnValue();
  if (!v86)
  {
    v186 = 0;
    v14 = v188;
    goto LABEL_108;
  }
  objc_opt_class();
  v14 = v188;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v186 = 0;
    goto LABEL_108;
  }
  objc_opt_class();
  v10 = v209;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v186 = v86;
LABEL_108:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("groupIdentifier"));
    v105 = (id)objc_claimAutoreleasedReturnValue();
    v183 = v105;
    if (!v105)
    {
      v10 = v209;
      goto LABEL_117;
    }
    objc_opt_class();
    v10 = v209;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v105 = v105;
        goto LABEL_117;
      }
      if (v200)
      {
        v155 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v156 = *MEMORY[0x1E0D025B8];
        v226 = *MEMORY[0x1E0CB2D50];
        v185 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("groupIdentifier"));
        v227 = v185;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v227, &v226, 1);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = (id)objc_msgSend(v155, "initWithDomain:code:userInfo:", v156, 2);
        v105 = 0;
        v30 = 0;
        *v200 = v157;
        v26 = v206;
        v36 = v203;
        v7 = v187;
        goto LABEL_133;
      }
      v105 = 0;
      v30 = 0;
      v26 = v206;
      v36 = v203;
      v7 = v187;
      goto LABEL_134;
    }
    v105 = 0;
LABEL_117:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appIntentInteractionIdentifier"));
    v131 = objc_claimAutoreleasedReturnValue();
    v182 = (void *)v131;
    if (v131)
    {
      v132 = (void *)v131;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v185 = v132;
          goto LABEL_120;
        }
        if (v200)
        {
          v158 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v159 = *MEMORY[0x1E0D025B8];
          v224 = *MEMORY[0x1E0CB2D50];
          v189 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appIntentInteractionIdentifier"));
          v225 = v189;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v225, &v224, 1);
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          v185 = 0;
          v30 = 0;
          *v200 = (id)objc_msgSend(v158, "initWithDomain:code:userInfo:", v159, 2);
          v7 = v187;
          v26 = v206;
          v36 = v203;
          goto LABEL_132;
        }
        v185 = 0;
        v30 = 0;
        v7 = v187;
        v26 = v206;
        v36 = v203;
        goto LABEL_133;
      }
    }
    v185 = 0;
LABEL_120:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interactionSource"));
    v133 = objc_claimAutoreleasedReturnValue();
    v180 = (void *)v133;
    if (v133 && (v134 = (void *)v133, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v189 = v134;
        goto LABEL_123;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriRemembersInteractionInteractionSourceFromString(v134));
        v189 = (id)objc_claimAutoreleasedReturnValue();
        v10 = v209;
        goto LABEL_123;
      }
      if (!v200)
      {
        v189 = 0;
        v30 = 0;
        v7 = v187;
        v26 = v206;
        v10 = v209;
        v36 = v203;
        goto LABEL_132;
      }
      v162 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v163 = *MEMORY[0x1E0D025B8];
      v222 = *MEMORY[0x1E0CB2D50];
      v181 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("interactionSource"));
      v223 = v181;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v223, &v222, 1);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = 0;
      v30 = 0;
      *v200 = (id)objc_msgSend(v162, "initWithDomain:code:userInfo:", v163, 2);
      v7 = v187;
      v26 = v206;
      v10 = v209;
    }
    else
    {
      v189 = 0;
LABEL_123:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentHash"));
      v135 = objc_claimAutoreleasedReturnValue();
      v179 = (void *)v135;
      if (!v135 || (v136 = (void *)v135, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v181 = 0;
LABEL_126:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userDonatorType"));
        v137 = objc_claimAutoreleasedReturnValue();
        v178 = (void *)v137;
        if (!v137 || (v138 = (void *)v137, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v139 = 0;
          goto LABEL_129;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v139 = v138;
          goto LABEL_129;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriRemembersInteractionUserDonatorTypeFromString(v138));
          v139 = (id)objc_claimAutoreleasedReturnValue();
          v10 = v209;
LABEL_129:
          v140 = objc_msgSend(v14, "intValue");
          v141 = objc_msgSend(v197, "intValue");
          v142 = objc_msgSend(v189, "intValue");
          LODWORD(v176) = objc_msgSend(v139, "intValue");
          LODWORD(v175) = v142;
          v36 = v203;
          v26 = v206;
          self = objc_retain(-[BMSiriRemembersInteraction initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:contentHash:userDonatorType:](self, "initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:contentHash:userDonatorType:", v204, v206, v203, v205, v140, v141, v194, v193, v191, v210, v186, v105, v185, v175,
                     v181,
                     v176));
          v30 = self;
        }
        else
        {
          v26 = v206;
          v36 = v203;
          if (v200)
          {
            v164 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v177 = *MEMORY[0x1E0D025B8];
            v218 = *MEMORY[0x1E0CB2D50];
            v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userDonatorType"));
            v219 = v165;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            *v200 = (id)objc_msgSend(v164, "initWithDomain:code:userInfo:", v177, 2, v166);

          }
          v139 = 0;
          v30 = 0;
          v10 = v209;
        }
LABEL_130:

        v7 = v187;
LABEL_131:

LABEL_132:
LABEL_133:

LABEL_134:
LABEL_135:

        v11 = v212;
        goto LABEL_136;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v181 = v136;
        goto LABEL_126;
      }
      if (v200)
      {
        v160 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v161 = *MEMORY[0x1E0D025B8];
        v220 = *MEMORY[0x1E0CB2D50];
        v139 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("contentHash"));
        v221 = v139;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v181 = 0;
        v30 = 0;
        *v200 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v161, 2);
        v26 = v206;
        v36 = v203;
        goto LABEL_130;
      }
      v181 = 0;
      v30 = 0;
      v7 = v187;
      v26 = v206;
    }
    v36 = v203;
    goto LABEL_131;
  }
  if (v200)
  {
    v144 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v145 = *MEMORY[0x1E0D025B8];
    v228 = *MEMORY[0x1E0CB2D50];
    v105 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("fields"));
    v229 = v105;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v229, &v228, 1);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v145, 2);
    v186 = 0;
    v30 = 0;
    *v200 = v146;
    v7 = v187;
    v26 = v206;
    v36 = v203;

    goto LABEL_135;
  }
  v186 = 0;
  v30 = 0;
  v7 = v187;
  v26 = v206;
  v36 = v203;
LABEL_136:

  v112 = v186;
LABEL_137:

  v9 = v198;
LABEL_139:

LABEL_140:
LABEL_141:

LABEL_142:
LABEL_143:

LABEL_144:
  v8 = v204;
LABEL_145:

LABEL_146:
  v6 = v207;
LABEL_147:

LABEL_148:
  return v30;
}

- (id)_interactionFieldsJSONArray
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
  -[BMSiriRemembersInteraction interactionFields](self, "interactionFields", 0);
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
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  _QWORD v58[16];
  _QWORD v59[18];

  v59[16] = *MEMORY[0x1E0C80C00];
  -[BMSiriRemembersInteraction identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction type](self, "type");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction domain](self, "domain");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction appBundleId](self, "appBundleId");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRemembersInteraction status](self, "status"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRemembersInteraction direction](self, "direction"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriRemembersInteraction hasIsDonatedBySiri](self, "hasIsDonatedBySiri"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRemembersInteraction isDonatedBySiri](self, "isDonatedBySiri"));
    v56 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v56 = 0;
  }
  -[BMSiriRemembersInteraction startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v7;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriRemembersInteraction startDate](self, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v11 = v9;
    v7 = (uint64_t)v47;
    objc_msgSend(v11, "numberWithDouble:");
    v55 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v55 = 0;
  }

  if (!-[BMSiriRemembersInteraction hasDurationInSeconds](self, "hasDurationInSeconds")
    || (-[BMSiriRemembersInteraction durationInSeconds](self, "durationInSeconds"), fabs(v12) == INFINITY))
  {
    v54 = 0;
  }
  else
  {
    -[BMSiriRemembersInteraction durationInSeconds](self, "durationInSeconds");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriRemembersInteraction durationInSeconds](self, "durationInSeconds");
    objc_msgSend(v13, "numberWithDouble:");
    v54 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMSiriRemembersInteraction _interactionFieldsJSONArray](self, "_interactionFieldsJSONArray");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction fields](self, "fields");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction groupIdentifier](self, "groupIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersInteraction appIntentInteractionIdentifier](self, "appIntentInteractionIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRemembersInteraction interactionSource](self, "interactionSource"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriRemembersInteraction hasContentHash](self, "hasContentHash"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriRemembersInteraction contentHash](self, "contentHash"));
    v48 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRemembersInteraction userDonatorType](self, "userDonatorType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = CFSTR("identifier");
  v15 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v15;
  v59[0] = v15;
  v58[1] = CFSTR("type");
  v16 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v16;
  v59[1] = v16;
  v58[2] = CFSTR("domain");
  v17 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v17;
  v59[2] = v17;
  v58[3] = CFSTR("appBundleId");
  v18 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v18;
  v59[3] = v18;
  v58[4] = CFSTR("status");
  v19 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v19;
  v59[4] = v19;
  v58[5] = CFSTR("direction");
  v20 = v57;
  if (!v57)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v59[5] = v20;
  v58[6] = CFSTR("isDonatedBySiri");
  v21 = (uint64_t)v56;
  if (!v56)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v59[6] = v21;
  v58[7] = CFSTR("startDate");
  v22 = (uint64_t)v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v59[7] = v22;
  v58[8] = CFSTR("durationInSeconds");
  v23 = (uint64_t)v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v59[8] = v23;
  v58[9] = CFSTR("interactionFields");
  v24 = (uint64_t)v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v22;
  v38 = (void *)v21;
  v59[9] = v24;
  v58[10] = CFSTR("fields");
  v25 = v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v4;
  v46 = (void *)v6;
  v59[10] = v25;
  v58[11] = CFSTR("groupIdentifier");
  v26 = v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v23;
  v27 = (void *)v5;
  v59[11] = v26;
  v58[12] = CFSTR("appIntentInteractionIdentifier");
  v28 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v3;
  v59[12] = v28;
  v58[13] = CFSTR("interactionSource");
  v30 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = v24;
  v59[13] = v30;
  v58[14] = CFSTR("contentHash");
  v31 = v48;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v24, v36, v37, v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v59[14] = v31;
  v58[15] = CFSTR("userDonatorType");
  v32 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v59[15] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 16, v34);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)

  if (!v48)
  if (!v49)

  if (!v50)
  if (!v51)

  if (!v52)
  if (!v53)

  if (!v54)
  if (!v55)

  if (!v56)
  if (v57)
  {
    if (v47)
      goto LABEL_68;
  }
  else
  {

    if (v47)
    {
LABEL_68:
      if (v46)
        goto LABEL_69;
      goto LABEL_75;
    }
  }

  if (v46)
  {
LABEL_69:
    if (v27)
      goto LABEL_70;
    goto LABEL_76;
  }
LABEL_75:

  if (v27)
  {
LABEL_70:
    if (v45)
      goto LABEL_71;
LABEL_77:

    if (v29)
      goto LABEL_72;
LABEL_78:

    goto LABEL_72;
  }
LABEL_76:

  if (!v45)
    goto LABEL_77;
LABEL_71:
  if (!v29)
    goto LABEL_78;
LABEL_72:

  return v44;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_startDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
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
  BOOL v12;
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
  int v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  double v40;
  double v41;
  double v42;
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
  int v67;
  int64_t v68;
  int v69;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriRemembersInteraction identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriRemembersInteraction identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_58;
    }
    -[BMSiriRemembersInteraction type](self, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriRemembersInteraction type](self, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_58;
    }
    -[BMSiriRemembersInteraction domain](self, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriRemembersInteraction domain](self, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_58;
    }
    -[BMSiriRemembersInteraction appBundleId](self, "appBundleId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appBundleId");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriRemembersInteraction appBundleId](self, "appBundleId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appBundleId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_58;
    }
    v31 = -[BMSiriRemembersInteraction status](self, "status");
    if (v31 != objc_msgSend(v5, "status"))
      goto LABEL_58;
    v32 = -[BMSiriRemembersInteraction direction](self, "direction");
    if (v32 != objc_msgSend(v5, "direction"))
      goto LABEL_58;
    if (-[BMSiriRemembersInteraction hasIsDonatedBySiri](self, "hasIsDonatedBySiri")
      || objc_msgSend(v5, "hasIsDonatedBySiri"))
    {
      if (!-[BMSiriRemembersInteraction hasIsDonatedBySiri](self, "hasIsDonatedBySiri"))
        goto LABEL_58;
      if (!objc_msgSend(v5, "hasIsDonatedBySiri"))
        goto LABEL_58;
      v33 = -[BMSiriRemembersInteraction isDonatedBySiri](self, "isDonatedBySiri");
      if (v33 != objc_msgSend(v5, "isDonatedBySiri"))
        goto LABEL_58;
    }
    -[BMSiriRemembersInteraction startDate](self, "startDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v34 == (void *)v35)
    {

    }
    else
    {
      v36 = (void *)v35;
      -[BMSiriRemembersInteraction startDate](self, "startDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
        goto LABEL_58;
    }
    if (-[BMSiriRemembersInteraction hasDurationInSeconds](self, "hasDurationInSeconds")
      || objc_msgSend(v5, "hasDurationInSeconds"))
    {
      if (!-[BMSiriRemembersInteraction hasDurationInSeconds](self, "hasDurationInSeconds"))
        goto LABEL_58;
      if (!objc_msgSend(v5, "hasDurationInSeconds"))
        goto LABEL_58;
      -[BMSiriRemembersInteraction durationInSeconds](self, "durationInSeconds");
      v41 = v40;
      objc_msgSend(v5, "durationInSeconds");
      if (v41 != v42)
        goto LABEL_58;
    }
    -[BMSiriRemembersInteraction interactionFields](self, "interactionFields");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactionFields");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMSiriRemembersInteraction interactionFields](self, "interactionFields");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interactionFields");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_58;
    }
    -[BMSiriRemembersInteraction fields](self, "fields");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fields");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMSiriRemembersInteraction fields](self, "fields");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fields");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_58;
    }
    -[BMSiriRemembersInteraction groupIdentifier](self, "groupIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupIdentifier");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMSiriRemembersInteraction groupIdentifier](self, "groupIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
        goto LABEL_58;
    }
    -[BMSiriRemembersInteraction appIntentInteractionIdentifier](self, "appIntentInteractionIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appIntentInteractionIdentifier");
    v62 = objc_claimAutoreleasedReturnValue();
    if (v61 == (void *)v62)
    {

    }
    else
    {
      v63 = (void *)v62;
      -[BMSiriRemembersInteraction appIntentInteractionIdentifier](self, "appIntentInteractionIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appIntentInteractionIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v64, "isEqual:", v65);

      if (!v66)
        goto LABEL_58;
    }
    v67 = -[BMSiriRemembersInteraction interactionSource](self, "interactionSource");
    if (v67 == objc_msgSend(v5, "interactionSource"))
    {
      if (!-[BMSiriRemembersInteraction hasContentHash](self, "hasContentHash")
        && !objc_msgSend(v5, "hasContentHash")
        || -[BMSiriRemembersInteraction hasContentHash](self, "hasContentHash")
        && objc_msgSend(v5, "hasContentHash")
        && (v68 = -[BMSiriRemembersInteraction contentHash](self, "contentHash"), v68 == objc_msgSend(v5, "contentHash")))
      {
        v69 = -[BMSiriRemembersInteraction userDonatorType](self, "userDonatorType");
        v12 = v69 == objc_msgSend(v5, "userDonatorType");
LABEL_59:

        goto LABEL_60;
      }
    }
LABEL_58:
    v12 = 0;
    goto LABEL_59;
  }
  v12 = 0;
LABEL_60:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (int)status
{
  return self->_status;
}

- (int)direction
{
  return self->_direction;
}

- (BOOL)isDonatedBySiri
{
  return self->_isDonatedBySiri;
}

- (BOOL)hasIsDonatedBySiri
{
  return self->_hasIsDonatedBySiri;
}

- (void)setHasIsDonatedBySiri:(BOOL)a3
{
  self->_hasIsDonatedBySiri = a3;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (BOOL)hasDurationInSeconds
{
  return self->_hasDurationInSeconds;
}

- (void)setHasDurationInSeconds:(BOOL)a3
{
  self->_hasDurationInSeconds = a3;
}

- (NSArray)interactionFields
{
  return self->_interactionFields;
}

- (NSString)fields
{
  return self->_fields;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)appIntentInteractionIdentifier
{
  return self->_appIntentInteractionIdentifier;
}

- (int)interactionSource
{
  return self->_interactionSource;
}

- (int64_t)contentHash
{
  return self->_contentHash;
}

- (BOOL)hasContentHash
{
  return self->_hasContentHash;
}

- (void)setHasContentHash:(BOOL)a3
{
  self->_hasContentHash = a3;
}

- (int)userDonatorType
{
  return self->_userDonatorType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIntentInteractionIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_interactionFields, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMSiriRemembersInteraction initByReadFrom:]([BMSiriRemembersInteraction alloc], "initByReadFrom:", v7);
    v4[9] = 0;

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
  _QWORD v20[18];

  v20[16] = *MEMORY[0x1E0C80C00];
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 2, 0, 2, 13, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domain"), 2, 0, 3, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appBundleId"), 2, 0, 4, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("status"), 0, 0, 5, 4, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("direction"), 0, 0, 6, 4, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isDonatedBySiri"), 0, 0, 7, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startDate"), 3, 0, 8, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("durationInSeconds"), 1, 0, 9, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("interactionFields_json"), 5, 1, &__block_literal_global_103);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fields"), 2, 0, 11, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("groupIdentifier"), 2, 0, 12, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appIntentInteractionIdentifier"), 2, 0, 13, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interactionSource"), 0, 0, 14, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentHash"), 0, 0, 15, 3, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userDonatorType"), 0, 0, 16, 4, 0);
  v20[0] = v19;
  v20[1] = v18;
  v20[2] = v17;
  v20[3] = v16;
  v20[4] = v15;
  v20[5] = v14;
  v20[6] = v2;
  v20[7] = v3;
  v20[8] = v4;
  v20[9] = v5;
  v20[10] = v13;
  v20[11] = v6;
  v20[12] = v7;
  v20[13] = v12;
  v20[14] = v8;
  v20[15] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 16);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B640;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[18];

  v20[16] = *MEMORY[0x1E0C80C00];
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v20[0] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 2, 13, 0);
  v20[1] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domain"), 3, 13, 0);
  v20[2] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appBundleId"), 4, 13, 0);
  v20[3] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("status"), 5, 4, 0);
  v20[4] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("direction"), 6, 4, 0);
  v20[5] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isDonatedBySiri"), 7, 12, 0);
  v20[6] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startDate"), 8, 0, 0);
  v20[7] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("durationInSeconds"), 9, 0, 0);
  v20[8] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interactionFields"), 10, 14, objc_opt_class());
  v20[9] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fields"), 11, 13, 0);
  v20[10] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("groupIdentifier"), 12, 13, 0);
  v20[11] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appIntentInteractionIdentifier"), 13, 13, 0);
  v20[12] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interactionSource"), 14, 4, 0);
  v20[13] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentHash"), 15, 3, 0);
  v20[14] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userDonatorType"), 16, 4, 0);
  v20[15] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __37__BMSiriRemembersInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_interactionFieldsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12
{
  return -[BMSiriRemembersInteraction initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:](self, "initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:", a3, a4, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9, a10, a11, a12, 0, 0);
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13
{
  return -[BMSiriRemembersInteraction initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:](self, "initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:", a3, a4, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9, a10, a11, a12, a13, 0);
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14
{
  uint64_t v15;

  LODWORD(v15) = 0;
  return -[BMSiriRemembersInteraction initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:](self, "initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:", a3, a4, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9, a10, a11, a12, a13, a14, 0, v15);
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14 appIntentInteractionIdentifier:(id)a15 interactionSource:(int)a16
{
  uint64_t v17;

  LODWORD(v17) = a16;
  return -[BMSiriRemembersInteraction initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:contentHash:](self, "initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:contentHash:", a3, a4, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9, a10, a11, a12, a13, a14, a15, v17, 0);
}

- (BMSiriRemembersInteraction)initWithIdentifier:(id)a3 type:(id)a4 domain:(id)a5 appBundleId:(id)a6 status:(int)a7 direction:(int)a8 isDonatedBySiri:(id)a9 startDate:(id)a10 durationInSeconds:(id)a11 interactionFields:(id)a12 fields:(id)a13 groupIdentifier:(id)a14 appIntentInteractionIdentifier:(id)a15 interactionSource:(int)a16 contentHash:(id)a17
{
  uint64_t v18;
  uint64_t v19;

  LODWORD(v19) = 0;
  LODWORD(v18) = a16;
  return -[BMSiriRemembersInteraction initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:contentHash:userDonatorType:](self, "initWithIdentifier:type:domain:appBundleId:status:direction:isDonatedBySiri:startDate:durationInSeconds:interactionFields:fields:groupIdentifier:appIntentInteractionIdentifier:interactionSource:contentHash:userDonatorType:", a3, a4, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9, a10, a11, a12, a13, a14, a15, v18, a17, v19);
}

@end
