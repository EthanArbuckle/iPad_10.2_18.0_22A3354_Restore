@implementation BMAppActivity

- (BMAppActivity)initWithBundleID:(id)a3 activityType:(id)a4 beginningOfActivity:(id)a5 contentDescription:(id)a6 expirationDate:(id)a7 isEligibleForPrediction:(id)a8 isPubliclyIndexable:(id)a9 itemIdentifier:(id)a10 itemRelatedContentURL:(id)a11 itemRelatedUniqueIdentifier:(id)a12 shortcutAvailability:(id)a13 suggestedInvocationPhrase:(id)a14 title:(id)a15 userActivityRequiredString:(id)a16 userActivityUUID:(id)a17 sourceID:(id)a18 sourceBundleID:(id)a19 sourceItemID:(id)a20 sourceGroupID:(id)a21 calendarUserActivityDate:(id)a22 calendarUserActivityExternalID:(id)a23 calendarUserActivityEndDate:(id)a24
{
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  BMAppActivity *v38;
  double v39;
  uint64_t v40;
  NSString *raw_itemRelatedContentURL;
  int v42;
  double v43;
  double v44;
  id v47;
  id v48;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  objc_super v65;

  v62 = a3;
  v47 = a4;
  v61 = a4;
  v28 = a5;
  v48 = a6;
  v60 = a6;
  v64 = a7;
  v29 = a8;
  v30 = a9;
  v59 = a10;
  v31 = a11;
  v57 = a12;
  v63 = a13;
  v56 = a14;
  v55 = a15;
  v54 = a16;
  v53 = a17;
  v52 = a18;
  v51 = a19;
  v32 = a20;
  v50 = a21;
  v33 = v30;
  v34 = a22;
  v35 = a23;
  v36 = v31;
  v37 = a24;
  v65.receiver = self;
  v65.super_class = (Class)BMAppActivity;
  v38 = -[BMEventBase init](&v65, sel_init);
  if (v38)
  {
    v38->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v38->_bundleID, a3);
    objc_storeStrong((id *)&v38->_activityType, v47);
    if (v28)
    {
      v38->_hasBeginningOfActivity = 1;
      v38->_beginningOfActivity = objc_msgSend(v28, "BOOLValue");
    }
    else
    {
      v28 = 0;
      v38->_hasBeginningOfActivity = 0;
      v38->_beginningOfActivity = 0;
    }
    objc_storeStrong((id *)&v38->_contentDescription, v48);
    if (v64)
    {
      v38->_hasRaw_expirationDate = 1;
      objc_msgSend(v64, "timeIntervalSince1970");
    }
    else
    {
      v38->_hasRaw_expirationDate = 0;
      v39 = -1.0;
    }
    v38->_raw_expirationDate = v39;
    if (v29)
    {
      v38->_hasIsEligibleForPrediction = 1;
      v38->_isEligibleForPrediction = objc_msgSend(v29, "BOOLValue");
    }
    else
    {
      v38->_hasIsEligibleForPrediction = 0;
      v38->_isEligibleForPrediction = 0;
    }
    if (v33)
    {
      v38->_hasIsPubliclyIndexable = 1;
      v38->_isPubliclyIndexable = objc_msgSend(v33, "BOOLValue");
    }
    else
    {
      v38->_hasIsPubliclyIndexable = 0;
      v38->_isPubliclyIndexable = 0;
    }
    objc_storeStrong((id *)&v38->_itemIdentifier, a10);
    if (v36)
    {
      objc_msgSend(v36, "absoluteString");
      v40 = objc_claimAutoreleasedReturnValue();
      raw_itemRelatedContentURL = v38->_raw_itemRelatedContentURL;
      v38->_raw_itemRelatedContentURL = (NSString *)v40;
    }
    else
    {
      raw_itemRelatedContentURL = v38->_raw_itemRelatedContentURL;
      v38->_raw_itemRelatedContentURL = 0;
    }

    objc_storeStrong((id *)&v38->_itemRelatedUniqueIdentifier, a12);
    if (v63)
    {
      v38->_hasShortcutAvailability = 1;
      v42 = objc_msgSend(v63, "intValue");
    }
    else
    {
      v38->_hasShortcutAvailability = 0;
      v42 = -1;
    }
    v38->_shortcutAvailability = v42;
    objc_storeStrong((id *)&v38->_suggestedInvocationPhrase, a14);
    objc_storeStrong((id *)&v38->_title, a15);
    objc_storeStrong((id *)&v38->_userActivityRequiredString, a16);
    objc_storeStrong((id *)&v38->_userActivityUUID, a17);
    objc_storeStrong((id *)&v38->_sourceID, a18);
    objc_storeStrong((id *)&v38->_sourceBundleID, a19);
    objc_storeStrong((id *)&v38->_sourceItemID, a20);
    objc_storeStrong((id *)&v38->_sourceGroupID, a21);
    if (v34)
    {
      v38->_hasRaw_calendarUserActivityDate = 1;
      objc_msgSend(v34, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v38->_hasRaw_calendarUserActivityDate = 0;
      v43 = -1.0;
    }
    v38->_raw_calendarUserActivityDate = v43;
    objc_storeStrong((id *)&v38->_calendarUserActivityExternalID, a23);
    if (v37)
    {
      v38->_hasRaw_calendarUserActivityEndDate = 1;
      objc_msgSend(v37, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v38->_hasRaw_calendarUserActivityEndDate = 0;
      v44 = -1.0;
    }
    v38->_raw_calendarUserActivityEndDate = v44;
  }

  return v38;
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

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAppActivity bundleID](self, "bundleID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity activityType](self, "activityType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppActivity beginningOfActivity](self, "beginningOfActivity"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity contentDescription](self, "contentDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity expirationDate](self, "expirationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppActivity isEligibleForPrediction](self, "isEligibleForPrediction"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppActivity isPubliclyIndexable](self, "isPubliclyIndexable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity itemIdentifier](self, "itemIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity itemRelatedContentURL](self, "itemRelatedContentURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity itemRelatedUniqueIdentifier](self, "itemRelatedUniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppActivity shortcutAvailability](self, "shortcutAvailability"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity userActivityRequiredString](self, "userActivityRequiredString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity userActivityUUID](self, "userActivityUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity sourceID](self, "sourceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity sourceBundleID](self, "sourceBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity sourceItemID](self, "sourceItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity sourceGroupID](self, "sourceGroupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity calendarUserActivityDate](self, "calendarUserActivityDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity calendarUserActivityExternalID](self, "calendarUserActivityExternalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity calendarUserActivityEndDate](self, "calendarUserActivityEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("BMAppActivity with bundleID: %@, activityType: %@, beginningOfActivity: %@, contentDescription: %@, expirationDate: %@, isEligibleForPrediction: %@, isPubliclyIndexable: %@, itemIdentifier: %@, itemRelatedContentURL: %@, itemRelatedUniqueIdentifier: %@, shortcutAvailability: %@, suggestedInvocationPhrase: %@, title: %@, userActivityRequiredString: %@, userActivityUUID: %@, sourceID: %@, sourceBundleID: %@, sourceItemID: %@, sourceGroupID: %@, calendarUserActivityDate: %@, calendarUserActivityExternalID: %@, calendarUserActivityEndDate: %@"), v25, v27, v16, v26, v15, v24, v23, v22, v14, v21, v20, v19, v13, v12, v3, v11,
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
  BMAppActivity *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  objc_class *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  BMAppActivity *v61;
  objc_super v63;

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)BMAppActivity;
  v5 = -[BMEventBase init](&v63, sel_init);
  if (!v5)
    goto LABEL_103;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 88;
          goto LABEL_71;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 96;
          goto LABEL_71;
        case 3u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasBeginningOfActivity = 1;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                v17 = v23++ >= 9;
                if (v17)
                {
                  v24 = 0;
                  goto LABEL_80;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v24 = 0;
LABEL_80:
          v58 = v24 != 0;
          v59 = 72;
          goto LABEL_89;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 104;
          goto LABEL_71;
        case 5u:
          v5->_hasRaw_expirationDate = 1;
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v60 = 24;
          goto LABEL_100;
        case 6u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v5->_hasIsEligibleForPrediction = 1;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
              *(_QWORD *)&v4[v35] = v37;
              v34 |= (unint64_t)(v38 & 0x7F) << v32;
              if (v38 < 0)
              {
                v32 += 7;
                v17 = v33++ >= 9;
                if (v17)
                {
                  v34 = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v34 = 0;
LABEL_84:
          v58 = v34 != 0;
          v59 = 74;
          goto LABEL_89;
        case 7u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v5->_hasIsPubliclyIndexable = 1;
          while (2)
          {
            v42 = *v6;
            v43 = *(_QWORD *)&v4[v42];
            v44 = v43 + 1;
            if (v43 == -1 || v44 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v43);
              *(_QWORD *)&v4[v42] = v44;
              v41 |= (unint64_t)(v45 & 0x7F) << v39;
              if (v45 < 0)
              {
                v39 += 7;
                v17 = v40++ >= 9;
                if (v17)
                {
                  v41 = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v41 = 0;
LABEL_88:
          v58 = v41 != 0;
          v59 = 76;
LABEL_89:
          *((_BYTE *)&v5->super.super.isa + v59) = v58;
          continue;
        case 8u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 112;
          goto LABEL_71;
        case 9u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_71;
        case 0xAu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 120;
          goto LABEL_71;
        case 0xBu:
          v46 = 0;
          v47 = 0;
          v48 = 0;
          v5->_hasShortcutAvailability = 1;
          break;
        case 0xCu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 128;
          goto LABEL_71;
        case 0xDu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 136;
          goto LABEL_71;
        case 0xEu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 144;
          goto LABEL_71;
        case 0xFu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 152;
          goto LABEL_71;
        case 0x10u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 160;
          goto LABEL_71;
        case 0x11u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 168;
          goto LABEL_71;
        case 0x12u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 176;
          goto LABEL_71;
        case 0x13u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 184;
          goto LABEL_71;
        case 0x14u:
          v5->_hasRaw_calendarUserActivityDate = 1;
          v53 = *v6;
          v54 = *(_QWORD *)&v4[v53];
          if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v54);
            *(_QWORD *)&v4[v53] = v54 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v60 = 48;
          goto LABEL_100;
        case 0x15u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 192;
LABEL_71:
          v55 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 0x16u:
          v5->_hasRaw_calendarUserActivityEndDate = 1;
          v56 = *v6;
          v57 = *(_QWORD *)&v4[v56];
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v57);
            *(_QWORD *)&v4[v56] = v57 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v60 = 64;
LABEL_100:
          *(Class *)((char *)&v5->super.super.isa + v60) = v31;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_102;
          continue;
      }
      while (1)
      {
        v49 = *v6;
        v50 = *(_QWORD *)&v4[v49];
        v51 = v50 + 1;
        if (v50 == -1 || v51 > *(_QWORD *)&v4[*v7])
          break;
        v52 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v50);
        *(_QWORD *)&v4[v49] = v51;
        v48 |= (unint64_t)(v52 & 0x7F) << v46;
        if ((v52 & 0x80) == 0)
          goto LABEL_91;
        v46 += 7;
        v17 = v47++ >= 9;
        if (v17)
        {
          LODWORD(v48) = 0;
          goto LABEL_93;
        }
      }
      v4[*v8] = 1;
LABEL_91:
      if (v4[*v8])
        LODWORD(v48) = 0;
LABEL_93:
      v5->_shortcutAvailability = v48;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_102:
    v61 = 0;
  else
LABEL_103:
    v61 = v5;

  return v61;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_activityType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasBeginningOfActivity)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_contentDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRaw_expirationDate)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasIsEligibleForPrediction)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsPubliclyIndexable)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_itemIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_raw_itemRelatedContentURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_itemRelatedUniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasShortcutAvailability)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_suggestedInvocationPhrase)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_userActivityRequiredString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_userActivityUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceItemID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceGroupID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRaw_calendarUserActivityDate)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_calendarUserActivityExternalID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRaw_calendarUserActivityEndDate)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppActivity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  BMAppActivity *v20;
  id v21;
  uint64_t v22;
  id *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  id v95;
  void *v96;
  id v98;
  uint64_t v99;
  id v100;
  void *v101;
  id v102;
  id v103;
  uint64_t v104;
  id v105;
  void *v106;
  id v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  id v111;
  id v112;
  uint64_t v113;
  id v114;
  id v115;
  uint64_t v116;
  void *v117;
  void *v118;
  id v119;
  uint64_t v120;
  id v121;
  id v122;
  id v123;
  uint64_t v124;
  id v125;
  id v126;
  uint64_t v127;
  id v128;
  id v129;
  id v130;
  id v131;
  uint64_t v132;
  id v133;
  id v134;
  uint64_t v135;
  id v136;
  id v137;
  id v138;
  id v139;
  uint64_t v140;
  id v141;
  id v142;
  id v143;
  id v144;
  uint64_t v145;
  id v146;
  id v147;
  uint64_t v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  id v163;
  id v164;
  id v165;
  id v166;
  void *v167;
  void *v168;
  id v169;
  id v170;
  void *v171;
  id v172;
  void *v173;
  id v174;
  id v175;
  void *v176;
  id v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  void *v183;
  void *v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  id v189;
  id v190;
  void *v191;
  void *v192;
  id v193;
  id v194;
  id *v195;
  id v196;
  BMAppActivity *v197;
  id v198;
  id v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  id v203;
  uint64_t v204;
  id v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  id v209;
  uint64_t v210;
  id v211;
  uint64_t v212;
  id v213;
  uint64_t v214;
  id v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  id v219;
  uint64_t v220;
  id v221;
  uint64_t v222;
  id v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  uint64_t v230;
  void *v231;
  uint64_t v232;
  id v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  id v237;
  uint64_t v238;
  id v239;
  uint64_t v240;
  id v241;
  uint64_t v242;
  id *v243;
  uint64_t v244;
  _QWORD v245[3];

  v245[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v199 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v199 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v198 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v198 = v8;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("beginningOfActivity"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v197 = self;
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v195 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v195 = v9;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentDescription"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v196 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v196 = v10;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("expirationDate"));
          v11 = objc_claimAutoreleasedReturnValue();
          v192 = (void *)v11;
          if (!v11 || (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v193 = 0;
            goto LABEL_38;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            v14 = objc_alloc(MEMORY[0x1E0C99D68]);
            objc_msgSend(v13, "doubleValue");
            v193 = (id)objc_msgSend(v14, "initWithTimeIntervalSince1970:");
LABEL_37:

            goto LABEL_38;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
            v31 = v12;
            objc_msgSend(v13, "dateFromString:", v31);
            v193 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_37;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v193 = v12;
LABEL_38:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isEligibleForPrediction"));
            v32 = objc_claimAutoreleasedReturnValue();
            v191 = (void *)v32;
            if (!v32 || (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v190 = 0;
              goto LABEL_41;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v190 = v33;
LABEL_41:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPubliclyIndexable"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v187 = v7;
              v188 = v34;
              if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v35 = v8;
                v36 = v9;
                v37 = v10;
                v189 = 0;
LABEL_44:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
                v38 = objc_claimAutoreleasedReturnValue();
                v186 = (void *)v38;
                if (v38 && (v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (!a4)
                    {
                      v185 = 0;
                      v20 = 0;
                      v17 = v198;
                      v19 = v199;
                      a4 = v195;
                      v10 = v37;
                      v9 = v36;
                      v8 = v35;
                      v7 = v187;
                      goto LABEL_146;
                    }
                    v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v71 = *MEMORY[0x1E0D025B8];
                    v230 = *MEMORY[0x1E0CB2D50];
                    v184 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemIdentifier"));
                    v231 = v184;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v231, &v230, 1);
                    v72 = objc_claimAutoreleasedReturnValue();
                    v73 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v71, 2, v72);
                    v185 = 0;
                    v20 = 0;
                    *a4 = v73;
                    v74 = (void *)v72;
                    v17 = v198;
                    v19 = v199;
                    a4 = v195;
                    v10 = v37;
                    v9 = v36;
                    v8 = v35;
                    v7 = v187;
                    v34 = v188;
                    goto LABEL_144;
                  }
                  v185 = v39;
                }
                else
                {
                  v185 = 0;
                }
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemRelatedContentURL"));
                v40 = objc_claimAutoreleasedReturnValue();
                v183 = v37;
                v184 = (void *)v40;
                if (v40)
                {
                  v41 = (void *)v40;
                  objc_opt_class();
                  v9 = v36;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    v8 = v35;
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v7 = v187;
                      v20 = (BMAppActivity *)a4;
                      if (!a4)
                      {
                        v17 = v198;
                        v19 = v199;
                        a4 = v195;
                        v10 = v183;
                        goto LABEL_145;
                      }
                      v182 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v75 = *MEMORY[0x1E0D025B8];
                      v226 = *MEMORY[0x1E0CB2D50];
                      v76 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemRelatedContentURL"));
                      v227 = v76;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v227, &v226, 1);
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      v20->super.super.isa = (Class)(id)objc_msgSend(v182, "initWithDomain:code:userInfo:", v75, 2, v77);

                      v74 = (void *)v76;
                      v20 = 0;
                      v17 = v198;
                      v19 = v199;
                      a4 = v195;
                      goto LABEL_143;
                    }
                    v181 = v9;
                    v59 = v41;
                    v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v59);
                    v7 = v187;
                    if (!v60)
                    {
                      v20 = (BMAppActivity *)a4;
                      if (a4)
                      {
                        v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v116 = *MEMORY[0x1E0D025B8];
                        v228 = *MEMORY[0x1E0CB2D50];
                        v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithString: for %@ returned nil"), CFSTR("itemRelatedContentURL"));
                        v229 = v117;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v229, &v228, 1);
                        v118 = (void *)objc_claimAutoreleasedReturnValue();
                        v20->super.super.isa = (Class)(id)objc_msgSend(v115, "initWithDomain:code:userInfo:", v116, 2, v118);

                        v20 = 0;
                      }
                      v74 = v59;
                      v184 = v59;
                      v17 = v198;
                      v19 = v199;
                      a4 = v195;
                      v34 = v188;
                      v9 = v181;
                      v10 = v183;
                      goto LABEL_144;
                    }
                    v61 = v60;

                    v180 = (void *)v61;
LABEL_56:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemRelatedUniqueIdentifier"));
                    v42 = objc_claimAutoreleasedReturnValue();
                    v179 = (void *)v42;
                    if (v42 && (v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          v44 = 0;
                          v20 = 0;
                          v17 = v198;
                          v19 = v199;
                          a4 = v195;
                          goto LABEL_142;
                        }
                        v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v79 = *MEMORY[0x1E0D025B8];
                        v224 = *MEMORY[0x1E0CB2D50];
                        v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemRelatedUniqueIdentifier"));
                        v225 = v80;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v225, &v224, 1);
                        v178 = (void *)objc_claimAutoreleasedReturnValue();
                        v81 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2);
                        v44 = 0;
                        v20 = 0;
                        *a4 = v81;
                        v17 = v198;
                        v19 = v199;
                        a4 = v195;
LABEL_141:

LABEL_142:
                        v74 = v180;
                        v9 = v181;
LABEL_143:
                        v10 = v183;
LABEL_144:

LABEL_145:
                        goto LABEL_146;
                      }
                      v44 = v43;
                    }
                    else
                    {
                      v44 = 0;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shortcutAvailability"));
                    v45 = objc_claimAutoreleasedReturnValue();
                    v178 = (void *)v45;
                    if (v45 && (v46 = (void *)v45, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          v80 = 0;
                          v20 = 0;
                          v17 = v198;
                          v19 = v199;
                          a4 = v195;
                          goto LABEL_141;
                        }
                        v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v99 = *MEMORY[0x1E0D025B8];
                        v222 = *MEMORY[0x1E0CB2D50];
                        v100 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v153 = objc_opt_class();
                        v101 = v100;
                        v34 = v188;
                        v177 = (id)objc_msgSend(v101, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v153, CFSTR("shortcutAvailability"));
                        v223 = v177;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v223, &v222, 1);
                        v176 = (void *)objc_claimAutoreleasedReturnValue();
                        v102 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v99, 2);
                        v80 = 0;
                        v20 = 0;
                        *a4 = v102;
                        v17 = v198;
                        v19 = v199;
                        a4 = v195;
                        goto LABEL_140;
                      }
                      v47 = v8;
                      v48 = v46;
                    }
                    else
                    {
                      v47 = v8;
                      v48 = 0;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestedInvocationPhrase"));
                    v49 = objc_claimAutoreleasedReturnValue();
                    v176 = (void *)v49;
                    if (v49 && (v50 = (void *)v49, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          v177 = 0;
                          v20 = 0;
                          v17 = v198;
                          v19 = v199;
                          a4 = v195;
                          v80 = v48;
                          v8 = v47;
                          v7 = v187;
                          goto LABEL_140;
                        }
                        v103 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v104 = *MEMORY[0x1E0D025B8];
                        v220 = *MEMORY[0x1E0CB2D50];
                        v174 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("suggestedInvocationPhrase"));
                        v221 = v174;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1);
                        v173 = (void *)objc_claimAutoreleasedReturnValue();
                        v105 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v104, 2);
                        v177 = 0;
                        v20 = 0;
                        *a4 = v105;
                        v17 = v198;
                        v19 = v199;
                        a4 = v195;
                        v80 = v48;
                        v8 = v47;
                        v7 = v187;
LABEL_139:

LABEL_140:
                        goto LABEL_141;
                      }
                      v177 = v50;
                    }
                    else
                    {
                      v177 = 0;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
                    v51 = objc_claimAutoreleasedReturnValue();
                    v173 = (void *)v51;
                    v175 = v44;
                    if (v51 && (v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      v53 = v187;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          v174 = 0;
                          v20 = 0;
                          v17 = v198;
                          v19 = v199;
                          a4 = v195;
                          v80 = v48;
                          v8 = v47;
                          v7 = v187;
                          v34 = v188;
                          goto LABEL_139;
                        }
                        v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v108 = *MEMORY[0x1E0D025B8];
                        v218 = *MEMORY[0x1E0CB2D50];
                        v172 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("title"));
                        v219 = v172;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1);
                        v171 = (void *)objc_claimAutoreleasedReturnValue();
                        v109 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v108, 2);
                        v174 = 0;
                        v20 = 0;
                        *a4 = v109;
                        v17 = v198;
                        v19 = v199;
                        a4 = v195;
                        v80 = v48;
                        v8 = v47;
                        v7 = v187;
                        v34 = v188;
                        goto LABEL_138;
                      }
                      v174 = v52;
                    }
                    else
                    {
                      v174 = 0;
                      v53 = v187;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userActivityRequiredString"));
                    v54 = objc_claimAutoreleasedReturnValue();
                    v170 = v48;
                    v171 = (void *)v54;
                    v168 = v47;
                    if (v54 && (v55 = (void *)v54, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      v7 = v53;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          v172 = 0;
                          v20 = 0;
                          v17 = v198;
                          v19 = v199;
                          a4 = v195;
                          v34 = v188;
                          v80 = v48;
                          v8 = v168;
                          goto LABEL_138;
                        }
                        v112 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v113 = *MEMORY[0x1E0D025B8];
                        v216 = *MEMORY[0x1E0CB2D50];
                        v169 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userActivityRequiredString"));
                        v217 = v169;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v217, &v216, 1);
                        v167 = (void *)objc_claimAutoreleasedReturnValue();
                        v114 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 2);
                        v172 = 0;
                        v20 = 0;
                        *a4 = v114;
                        v17 = v198;
                        v19 = v199;
                        a4 = v195;
                        v34 = v188;
                        v80 = v48;
                        v8 = v168;
LABEL_137:

LABEL_138:
                        goto LABEL_139;
                      }
                      v172 = v55;
                      v56 = v48;
                    }
                    else
                    {
                      v172 = 0;
                      v7 = v53;
                      v56 = v48;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userActivityUUID"));
                    v57 = objc_claimAutoreleasedReturnValue();
                    v167 = (void *)v57;
                    if (v57)
                    {
                      v58 = (void *)v57;
                      objc_opt_class();
                      v8 = v168;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v169 = 0;
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!a4)
                          {
                            v169 = 0;
                            v20 = 0;
                            v17 = v198;
                            v19 = v199;
                            a4 = v195;
                            v80 = v56;
                            v34 = v188;
                            goto LABEL_137;
                          }
                          v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v120 = *MEMORY[0x1E0D025B8];
                          v214 = *MEMORY[0x1E0CB2D50];
                          v165 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userActivityUUID"));
                          v215 = v165;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
                          v82 = (void *)objc_claimAutoreleasedReturnValue();
                          v121 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v120, 2, v82);
                          v169 = 0;
                          v20 = 0;
                          *a4 = v121;
                          v17 = v198;
                          v19 = v199;
                          a4 = v195;
                          v80 = v56;
                          goto LABEL_136;
                        }
                        v169 = v58;
                      }
                    }
                    else
                    {
                      v169 = 0;
                      v8 = v168;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceID"));
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    v80 = v56;
                    if (v82 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          v165 = 0;
                          v20 = 0;
                          v17 = v198;
                          v19 = v199;
                          a4 = v195;
                          v80 = v170;
                          goto LABEL_136;
                        }
                        v166 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v124 = *MEMORY[0x1E0D025B8];
                        v212 = *MEMORY[0x1E0CB2D50];
                        v164 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceID"));
                        v213 = v164;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v213, &v212, 1);
                        v162 = (void *)objc_claimAutoreleasedReturnValue();
                        v125 = (id)objc_msgSend(v166, "initWithDomain:code:userInfo:", v124, 2);
                        v165 = 0;
                        v20 = 0;
                        *a4 = v125;
                        v17 = v198;
                        v19 = v199;
                        a4 = v195;
                        goto LABEL_213;
                      }
                      v165 = v82;
                      v80 = v170;
                    }
                    else
                    {
                      v165 = 0;
                    }
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceBundleID"));
                    v83 = objc_claimAutoreleasedReturnValue();
                    v162 = (void *)v83;
                    if (!v83 || (v84 = (void *)v83, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v164 = 0;
                      goto LABEL_114;
                    }
                    v106 = v82;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v164 = v84;
                      v80 = v170;
LABEL_114:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceItemID"));
                      v85 = objc_claimAutoreleasedReturnValue();
                      v160 = (void *)v85;
                      if (!v85 || (v86 = (void *)v85, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v163 = 0;
                        goto LABEL_117;
                      }
                      v106 = v82;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v163 = v86;
                        v80 = v170;
LABEL_117:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceGroupID"));
                        v87 = objc_claimAutoreleasedReturnValue();
                        v159 = (void *)v87;
                        if (!v87 || (v88 = (void *)v87, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v161 = 0;
                          goto LABEL_120;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v161 = v88;
                          v80 = v170;
LABEL_120:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("calendarUserActivityDate"));
                          v89 = objc_claimAutoreleasedReturnValue();
                          v157 = (void *)v89;
                          if (!v89 || (v90 = (void *)v89, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v155 = 0;
LABEL_123:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("calendarUserActivityExternalID"));
                            v91 = objc_claimAutoreleasedReturnValue();
                            v156 = (void *)v91;
                            if (v91 && (v92 = (void *)v91, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                if (!a4)
                                {
                                  v158 = 0;
                                  v20 = 0;
                                  v19 = v199;
                                  a4 = v195;
                                  v80 = v170;
                                  v96 = v155;
                                  goto LABEL_131;
                                }
                                v139 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v140 = *MEMORY[0x1E0D025B8];
                                v202 = *MEMORY[0x1E0CB2D50];
                                v95 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("calendarUserActivityExternalID"));
                                v203 = v95;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1);
                                v154 = (void *)objc_claimAutoreleasedReturnValue();
                                v141 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v140, 2);
                                v158 = 0;
                                v20 = 0;
                                *a4 = v141;
                                v19 = v199;
                                a4 = v195;
                                goto LABEL_230;
                              }
                              v158 = v92;
                              v80 = v170;
                            }
                            else
                            {
                              v158 = 0;
                            }
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("calendarUserActivityEndDate"));
                            v93 = objc_claimAutoreleasedReturnValue();
                            v154 = (void *)v93;
                            if (!v93 || (v94 = (void *)v93, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v95 = 0;
                              v19 = v199;
LABEL_129:
                              v96 = v155;
                              a4 = v195;
                              v20 = objc_retain(-[BMAppActivity initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:](v197, "initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:", v19, v198, v195, v196, v193, v190, v189, v185, v180, v175, v80,
                                        v177,
                                        v174,
                                        v172,
                                        v169,
                                        v165,
                                        v164,
                                        v163,
                                        v161,
                                        v155,
                                        v158,
                                        v95));
                              v197 = v20;
LABEL_130:

LABEL_131:
                              v17 = v198;
LABEL_132:

LABEL_133:
LABEL_134:

LABEL_135:
LABEL_136:

                              v34 = v188;
                              v44 = v175;
                              goto LABEL_137;
                            }
                            objc_opt_class();
                            v19 = v199;
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v129 = v94;
                              v130 = objc_alloc(MEMORY[0x1E0C99D68]);
                              objc_msgSend(v129, "doubleValue");
                              v95 = (id)objc_msgSend(v130, "initWithTimeIntervalSinceReferenceDate:");

                              goto LABEL_129;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v142 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                              v143 = v94;
                              objc_msgSend(v142, "dateFromString:", v143);
                              v95 = (id)objc_claimAutoreleasedReturnValue();

LABEL_223:
                              v80 = v170;
                              goto LABEL_129;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v95 = v94;
                              goto LABEL_223;
                            }
                            if (a4)
                            {
                              v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v148 = *MEMORY[0x1E0D025B8];
                              v200 = *MEMORY[0x1E0CB2D50];
                              v149 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("calendarUserActivityEndDate"));
                              v201 = v149;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1);
                              v150 = (void *)objc_claimAutoreleasedReturnValue();
                              v151 = v148;
                              v19 = v199;
                              *a4 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v151, 2, v150);

                            }
                            v95 = 0;
                            v20 = 0;
                            a4 = v195;
LABEL_230:
                            v80 = v170;
                            v96 = v155;
                            goto LABEL_130;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v122 = v90;
                            v123 = objc_alloc(MEMORY[0x1E0C99D68]);
                            objc_msgSend(v122, "doubleValue");
                            v155 = (id)objc_msgSend(v123, "initWithTimeIntervalSinceReferenceDate:");

                            goto LABEL_123;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v137 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                            v138 = v90;
                            objc_msgSend(v137, "dateFromString:", v138);
                            v155 = (id)objc_claimAutoreleasedReturnValue();

LABEL_218:
                            v80 = v170;
                            goto LABEL_123;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v155 = v90;
                            goto LABEL_218;
                          }
                          if (a4)
                          {
                            v144 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v145 = *MEMORY[0x1E0D025B8];
                            v204 = *MEMORY[0x1E0CB2D50];
                            v158 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("calendarUserActivityDate"));
                            v205 = v158;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1);
                            v156 = (void *)objc_claimAutoreleasedReturnValue();
                            v146 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v145, 2);
                            v96 = 0;
                            v20 = 0;
                            *a4 = v146;
                            v19 = v199;
                            a4 = v195;
                            v80 = v170;
                            goto LABEL_131;
                          }
                          v96 = 0;
                          v20 = 0;
LABEL_201:
                          v17 = v198;
                          v19 = v199;
                          a4 = v195;
                          v80 = v170;
                          goto LABEL_132;
                        }
                        if (a4)
                        {
                          v134 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v135 = *MEMORY[0x1E0D025B8];
                          v206 = *MEMORY[0x1E0CB2D50];
                          v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceGroupID"));
                          v207 = v96;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1);
                          v157 = (void *)objc_claimAutoreleasedReturnValue();
                          v136 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v135, 2);
                          v161 = 0;
                          v20 = 0;
                          *a4 = v136;
                          goto LABEL_201;
                        }
                        v161 = 0;
                        v20 = 0;
                        v17 = v198;
                        v19 = v199;
                        a4 = v195;
LABEL_220:
                        v80 = v170;
                        goto LABEL_133;
                      }
                      if (a4)
                      {
                        v131 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v132 = *MEMORY[0x1E0D025B8];
                        v208 = *MEMORY[0x1E0CB2D50];
                        v161 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceItemID"));
                        v209 = v161;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1);
                        v159 = (void *)objc_claimAutoreleasedReturnValue();
                        v133 = (id)objc_msgSend(v131, "initWithDomain:code:userInfo:", v132, 2);
                        v163 = 0;
                        v20 = 0;
                        *a4 = v133;
                        v17 = v198;
                        v19 = v199;
                        a4 = v195;
                        goto LABEL_220;
                      }
                      v163 = 0;
                      v20 = 0;
LABEL_215:
                      v17 = v198;
                      v19 = v199;
                      a4 = v195;
                      v82 = v106;
                      v80 = v170;
                      goto LABEL_134;
                    }
                    if (a4)
                    {
                      v126 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v127 = *MEMORY[0x1E0D025B8];
                      v210 = *MEMORY[0x1E0CB2D50];
                      v163 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceBundleID"));
                      v211 = v163;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v211, &v210, 1);
                      v160 = (void *)objc_claimAutoreleasedReturnValue();
                      v128 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v127, 2);
                      v164 = 0;
                      v20 = 0;
                      *a4 = v128;
                      goto LABEL_215;
                    }
                    v164 = 0;
                    v20 = 0;
                    v17 = v198;
                    v19 = v199;
                    a4 = v195;
LABEL_213:
                    v80 = v170;
                    goto LABEL_135;
                  }
                  v180 = 0;
                  v181 = v36;
                }
                else
                {
                  v180 = 0;
                  v181 = v36;
                }
                v8 = v35;
                v7 = v187;
                goto LABEL_56;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v35 = v8;
                v36 = v9;
                v37 = v10;
                v189 = v34;
                goto LABEL_44;
              }
              if (a4)
              {
                v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v66 = *MEMORY[0x1E0D025B8];
                v232 = *MEMORY[0x1E0CB2D50];
                v67 = objc_alloc(MEMORY[0x1E0CB3940]);
                v152 = objc_opt_class();
                v68 = v67;
                v34 = v188;
                v185 = (id)objc_msgSend(v68, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v152, CFSTR("isPubliclyIndexable"));
                v233 = v185;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v233, &v232, 1);
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2);
                v189 = 0;
                v20 = 0;
                *a4 = v69;
                v17 = v198;
                v19 = v199;
                a4 = v195;
LABEL_146:

LABEL_147:
LABEL_148:

                goto LABEL_149;
              }
              v189 = 0;
              v20 = 0;
LABEL_162:
              v17 = v198;
              v19 = v199;
              a4 = v195;
              goto LABEL_147;
            }
            if (a4)
            {
              v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v63 = *MEMORY[0x1E0D025B8];
              v234 = *MEMORY[0x1E0CB2D50];
              v189 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isEligibleForPrediction"));
              v235 = v189;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v235, &v234, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 2, v34);
              v190 = 0;
              v20 = 0;
              *a4 = v64;
              goto LABEL_162;
            }
            v190 = 0;
            v20 = 0;
LABEL_170:
            v17 = v198;
            v19 = v199;
            a4 = v195;
            goto LABEL_148;
          }
          if (a4)
          {
            v194 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v110 = *MEMORY[0x1E0D025B8];
            v236 = *MEMORY[0x1E0CB2D50];
            v190 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("expirationDate"));
            v237 = v190;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v237, &v236, 1);
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v110, 2);
            v193 = 0;
            v20 = 0;
            *a4 = v111;
            goto LABEL_170;
          }
          v193 = 0;
          v20 = 0;
LABEL_34:
          v17 = v198;
          v19 = v199;
          a4 = v195;
LABEL_149:

          goto LABEL_150;
        }
        if (a4)
        {
          v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v29 = *MEMORY[0x1E0D025B8];
          v238 = *MEMORY[0x1E0CB2D50];
          v193 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentDescription"));
          v239 = v193;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v239, &v238, 1);
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2);
          v196 = 0;
          v20 = 0;
          *a4 = v30;
          goto LABEL_34;
        }
        v196 = 0;
        v20 = 0;
        v17 = v198;
        v19 = v199;
        a4 = v195;
LABEL_150:

        self = v197;
        goto LABEL_151;
      }
      if (a4)
      {
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v240 = *MEMORY[0x1E0CB2D50];
        v196 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("beginningOfActivity"));
        v241 = v196;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v241, &v240, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v10);
        v20 = 0;
        *a4 = v27;
        a4 = 0;
        v17 = v198;
        v19 = v199;
        goto LABEL_150;
      }
      v20 = 0;
      v17 = v198;
      v19 = v199;
LABEL_151:

      goto LABEL_152;
    }
    if (a4)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0D025B8];
      v242 = *MEMORY[0x1E0CB2D50];
      v23 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("activityType"));
      v243 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v243, &v242, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v9);
      v17 = 0;
      v20 = 0;
      *a4 = v24;
      a4 = v23;
      v19 = v199;
      goto LABEL_151;
    }
    v17 = 0;
    v20 = 0;
    v19 = v199;
LABEL_152:

    goto LABEL_153;
  }
  if (a4)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0D025B8];
    v244 = *MEMORY[0x1E0CB2D50];
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
    v245[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v245, &v244, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v8);
    v19 = 0;
    v20 = 0;
    *a4 = v18;
    goto LABEL_152;
  }
  v19 = 0;
  v20 = 0;
LABEL_153:

  return v20;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
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
  uint64_t v45;
  void *v46;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  _QWORD v81[22];
  _QWORD v82[24];

  v82[22] = *MEMORY[0x1E0C80C00];
  -[BMAppActivity bundleID](self, "bundleID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMAppActivity activityType](self, "activityType");
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[BMAppActivity hasBeginningOfActivity](self, "hasBeginningOfActivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppActivity beginningOfActivity](self, "beginningOfActivity"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[BMAppActivity contentDescription](self, "contentDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMAppActivity expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppActivity expirationDate](self, "expirationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  if (-[BMAppActivity hasIsEligibleForPrediction](self, "hasIsEligibleForPrediction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppActivity isEligibleForPrediction](self, "isEligibleForPrediction"));
    v80 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v80 = 0;
  }
  if (-[BMAppActivity hasIsPubliclyIndexable](self, "hasIsPubliclyIndexable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppActivity isPubliclyIndexable](self, "isPubliclyIndexable"));
    v79 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v79 = 0;
  }
  -[BMAppActivity itemIdentifier](self, "itemIdentifier");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity itemRelatedContentURL](self, "itemRelatedContentURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppActivity itemRelatedUniqueIdentifier](self, "itemRelatedUniqueIdentifier");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMAppActivity hasShortcutAvailability](self, "hasShortcutAvailability"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppActivity shortcutAvailability](self, "shortcutAvailability"));
    v75 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v75 = 0;
  }
  -[BMAppActivity suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity title](self, "title");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity userActivityRequiredString](self, "userActivityRequiredString");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity userActivityUUID](self, "userActivityUUID");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity sourceID](self, "sourceID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity sourceBundleID](self, "sourceBundleID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity sourceItemID](self, "sourceItemID");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity sourceGroupID](self, "sourceGroupID");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity calendarUserActivityDate](self, "calendarUserActivityDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppActivity calendarUserActivityDate](self, "calendarUserActivityDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "numberWithDouble:");
    v66 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v66 = 0;
  }

  -[BMAppActivity calendarUserActivityExternalID](self, "calendarUserActivityExternalID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppActivity calendarUserActivityEndDate](self, "calendarUserActivityEndDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppActivity calendarUserActivityEndDate](self, "calendarUserActivityEndDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    objc_msgSend(v16, "numberWithDouble:");
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  v81[0] = CFSTR("bundleID");
  v19 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v19;
  v82[0] = v19;
  v81[1] = CFSTR("activityType");
  v20 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v20;
  v82[1] = v20;
  v81[2] = CFSTR("beginningOfActivity");
  v21 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v54 = (void *)v21;
  v82[2] = v21;
  v81[3] = CFSTR("contentDescription");
  v22 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v22;
  v82[3] = v22;
  v81[4] = CFSTR("expirationDate");
  v23 = (uint64_t)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v23;
  v82[4] = v23;
  v81[5] = CFSTR("isEligibleForPrediction");
  v24 = (uint64_t)v80;
  if (!v80)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v82[5] = v24;
  v81[6] = CFSTR("isPubliclyIndexable");
  v25 = (uint64_t)v79;
  if (!v79)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v82[6] = v25;
  v81[7] = CFSTR("itemIdentifier");
  v26 = (uint64_t)v78;
  if (!v78)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v82[7] = v26;
  v81[8] = CFSTR("itemRelatedContentURL");
  v27 = (uint64_t)v77;
  if (!v77)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v82[8] = v27;
  v81[9] = CFSTR("itemRelatedUniqueIdentifier");
  v28 = (uint64_t)v76;
  if (!v76)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v28;
  v82[9] = v28;
  v81[10] = CFSTR("shortcutAvailability");
  v29 = (uint64_t)v75;
  if (!v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v29;
  v82[10] = v29;
  v81[11] = CFSTR("suggestedInvocationPhrase");
  v30 = (uint64_t)v74;
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v64 = (void *)v3;
  v82[11] = v30;
  v81[12] = CFSTR("title");
  v31 = (uint64_t)v73;
  v32 = (void *)v30;
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v31;
  v82[12] = v31;
  v81[13] = CFSTR("userActivityRequiredString");
  v33 = (uint64_t)v72;
  if (!v72)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v25;
  v58 = (void *)v33;
  v82[13] = v33;
  v81[14] = CFSTR("userActivityUUID");
  v34 = (uint64_t)v71;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v63 = v5;
  v45 = v34;
  v82[14] = v34;
  v81[15] = CFSTR("sourceID");
  v35 = v70;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v27;
  v49 = (void *)v26;
  v82[15] = v35;
  v81[16] = CFSTR("sourceBundleID");
  v36 = v69;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v24;
  v62 = v10;
  v82[16] = v36;
  v81[17] = CFSTR("sourceItemID");
  v37 = v68;
  if (!v68)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47 = v32;
  v38 = (void *)v4;
  v82[17] = v37;
  v81[18] = CFSTR("sourceGroupID");
  v39 = v67;
  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v6;
  v82[18] = v39;
  v81[19] = CFSTR("calendarUserActivityDate");
  v41 = v66;
  if (!v66)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v82[19] = v41;
  v81[20] = CFSTR("calendarUserActivityExternalID");
  v42 = v65;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v82[20] = v42;
  v81[21] = CFSTR("calendarUserActivityEndDate");
  v43 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v82[21] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 22, v45);
  v57 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18)

  if (!v65)
  if (!v66)

  if (!v67)
  if (!v68)

  if (!v69)
  if (!v70)

  if (!v71)
  if (!v72)

  if (!v73)
  if (!v74)

  if (!v75)
  if (!v76)

  if (!v77)
  if (!v78)

  if (!v79)
  if (v80)
  {
    if (v62)
      goto LABEL_100;
  }
  else
  {

    if (v62)
    {
LABEL_100:
      if (v40)
        goto LABEL_101;
      goto LABEL_107;
    }
  }

  if (v40)
  {
LABEL_101:
    if (v63)
      goto LABEL_102;
    goto LABEL_108;
  }
LABEL_107:

  if (v63)
  {
LABEL_102:
    if (v38)
      goto LABEL_103;
LABEL_109:

    if (v64)
      goto LABEL_104;
LABEL_110:

    goto LABEL_104;
  }
LABEL_108:

  if (!v38)
    goto LABEL_109;
LABEL_103:
  if (!v64)
    goto LABEL_110;
LABEL_104:

  return v57;
}

- (NSDate)expirationDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_expirationDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_expirationDate);
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

- (NSURL)itemRelatedContentURL
{
  NSString *raw_itemRelatedContentURL;
  void *v3;

  raw_itemRelatedContentURL = self->_raw_itemRelatedContentURL;
  if (raw_itemRelatedContentURL)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_itemRelatedContentURL, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSURL *)v3;
}

- (NSDate)calendarUserActivityDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_calendarUserActivityDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_calendarUserActivityDate);
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

- (NSDate)calendarUserActivityEndDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_calendarUserActivityEndDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_calendarUserActivityEndDate);
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
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
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
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v114;
  void *v115;
  void *v116;
  void *v117;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppActivity bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppActivity bundleID](self, "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_89;
    }
    -[BMAppActivity activityType](self, "activityType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityType");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAppActivity activityType](self, "activityType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_89;
    }
    if (-[BMAppActivity hasBeginningOfActivity](self, "hasBeginningOfActivity")
      || objc_msgSend(v5, "hasBeginningOfActivity"))
    {
      if (!-[BMAppActivity hasBeginningOfActivity](self, "hasBeginningOfActivity"))
        goto LABEL_89;
      if (!objc_msgSend(v5, "hasBeginningOfActivity"))
        goto LABEL_89;
      v19 = -[BMAppActivity beginningOfActivity](self, "beginningOfActivity");
      if (v19 != objc_msgSend(v5, "beginningOfActivity"))
        goto LABEL_89;
    }
    -[BMAppActivity contentDescription](self, "contentDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentDescription");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMAppActivity contentDescription](self, "contentDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_89;
    }
    -[BMAppActivity expirationDate](self, "expirationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expirationDate");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMAppActivity expirationDate](self, "expirationDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expirationDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_89;
    }
    if (-[BMAppActivity hasIsEligibleForPrediction](self, "hasIsEligibleForPrediction")
      || objc_msgSend(v5, "hasIsEligibleForPrediction"))
    {
      if (!-[BMAppActivity hasIsEligibleForPrediction](self, "hasIsEligibleForPrediction"))
        goto LABEL_89;
      if (!objc_msgSend(v5, "hasIsEligibleForPrediction"))
        goto LABEL_89;
      v32 = -[BMAppActivity isEligibleForPrediction](self, "isEligibleForPrediction");
      if (v32 != objc_msgSend(v5, "isEligibleForPrediction"))
        goto LABEL_89;
    }
    if (-[BMAppActivity hasIsPubliclyIndexable](self, "hasIsPubliclyIndexable")
      || objc_msgSend(v5, "hasIsPubliclyIndexable"))
    {
      if (!-[BMAppActivity hasIsPubliclyIndexable](self, "hasIsPubliclyIndexable"))
        goto LABEL_89;
      if (!objc_msgSend(v5, "hasIsPubliclyIndexable"))
        goto LABEL_89;
      v33 = -[BMAppActivity isPubliclyIndexable](self, "isPubliclyIndexable");
      if (v33 != objc_msgSend(v5, "isPubliclyIndexable"))
        goto LABEL_89;
    }
    -[BMAppActivity itemIdentifier](self, "itemIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v34 == (void *)v35)
    {

    }
    else
    {
      v36 = (void *)v35;
      -[BMAppActivity itemIdentifier](self, "itemIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
        goto LABEL_89;
    }
    -[BMAppActivity itemRelatedContentURL](self, "itemRelatedContentURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemRelatedContentURL");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v40 == (void *)v41)
    {

    }
    else
    {
      v42 = (void *)v41;
      -[BMAppActivity itemRelatedContentURL](self, "itemRelatedContentURL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemRelatedContentURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (!v45)
        goto LABEL_89;
    }
    -[BMAppActivity itemRelatedUniqueIdentifier](self, "itemRelatedUniqueIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemRelatedUniqueIdentifier");
    v47 = objc_claimAutoreleasedReturnValue();
    if (v46 == (void *)v47)
    {

    }
    else
    {
      v48 = (void *)v47;
      -[BMAppActivity itemRelatedUniqueIdentifier](self, "itemRelatedUniqueIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemRelatedUniqueIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqual:", v50);

      if (!v51)
        goto LABEL_89;
    }
    if (-[BMAppActivity hasShortcutAvailability](self, "hasShortcutAvailability")
      || objc_msgSend(v5, "hasShortcutAvailability"))
    {
      if (!-[BMAppActivity hasShortcutAvailability](self, "hasShortcutAvailability"))
        goto LABEL_89;
      if (!objc_msgSend(v5, "hasShortcutAvailability"))
        goto LABEL_89;
      v52 = -[BMAppActivity shortcutAvailability](self, "shortcutAvailability");
      if (v52 != objc_msgSend(v5, "shortcutAvailability"))
        goto LABEL_89;
    }
    -[BMAppActivity suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestedInvocationPhrase");
    v54 = objc_claimAutoreleasedReturnValue();
    if (v53 == (void *)v54)
    {

    }
    else
    {
      v55 = (void *)v54;
      -[BMAppActivity suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestedInvocationPhrase");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v56, "isEqual:", v57);

      if (!v58)
        goto LABEL_89;
    }
    -[BMAppActivity title](self, "title");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v60 = objc_claimAutoreleasedReturnValue();
    if (v59 == (void *)v60)
    {

    }
    else
    {
      v61 = (void *)v60;
      -[BMAppActivity title](self, "title");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v62, "isEqual:", v63);

      if (!v64)
        goto LABEL_89;
    }
    -[BMAppActivity userActivityRequiredString](self, "userActivityRequiredString");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userActivityRequiredString");
    v66 = objc_claimAutoreleasedReturnValue();
    if (v65 == (void *)v66)
    {

    }
    else
    {
      v67 = (void *)v66;
      -[BMAppActivity userActivityRequiredString](self, "userActivityRequiredString");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userActivityRequiredString");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v68, "isEqual:", v69);

      if (!v70)
        goto LABEL_89;
    }
    -[BMAppActivity userActivityUUID](self, "userActivityUUID");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userActivityUUID");
    v72 = objc_claimAutoreleasedReturnValue();
    if (v71 == (void *)v72)
    {

    }
    else
    {
      v73 = (void *)v72;
      -[BMAppActivity userActivityUUID](self, "userActivityUUID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userActivityUUID");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v74, "isEqual:", v75);

      if (!v76)
        goto LABEL_89;
    }
    -[BMAppActivity sourceID](self, "sourceID");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceID");
    v78 = objc_claimAutoreleasedReturnValue();
    if (v77 == (void *)v78)
    {

    }
    else
    {
      v79 = (void *)v78;
      -[BMAppActivity sourceID](self, "sourceID");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceID");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v80, "isEqual:", v81);

      if (!v82)
        goto LABEL_89;
    }
    -[BMAppActivity sourceBundleID](self, "sourceBundleID");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleID");
    v84 = objc_claimAutoreleasedReturnValue();
    if (v83 == (void *)v84)
    {

    }
    else
    {
      v85 = (void *)v84;
      -[BMAppActivity sourceBundleID](self, "sourceBundleID");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceBundleID");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v86, "isEqual:", v87);

      if (!v88)
        goto LABEL_89;
    }
    -[BMAppActivity sourceItemID](self, "sourceItemID");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceItemID");
    v90 = objc_claimAutoreleasedReturnValue();
    if (v89 == (void *)v90)
    {

    }
    else
    {
      v91 = (void *)v90;
      -[BMAppActivity sourceItemID](self, "sourceItemID");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceItemID");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v92, "isEqual:", v93);

      if (!v94)
        goto LABEL_89;
    }
    -[BMAppActivity sourceGroupID](self, "sourceGroupID");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceGroupID");
    v96 = objc_claimAutoreleasedReturnValue();
    if (v95 == (void *)v96)
    {

    }
    else
    {
      v97 = (void *)v96;
      -[BMAppActivity sourceGroupID](self, "sourceGroupID");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceGroupID");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v98, "isEqual:", v99);

      if (!v100)
        goto LABEL_89;
    }
    -[BMAppActivity calendarUserActivityDate](self, "calendarUserActivityDate");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarUserActivityDate");
    v102 = objc_claimAutoreleasedReturnValue();
    if (v101 == (void *)v102)
    {

    }
    else
    {
      v103 = (void *)v102;
      -[BMAppActivity calendarUserActivityDate](self, "calendarUserActivityDate");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "calendarUserActivityDate");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v104, "isEqual:", v105);

      if (!v106)
        goto LABEL_89;
    }
    -[BMAppActivity calendarUserActivityExternalID](self, "calendarUserActivityExternalID");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarUserActivityExternalID");
    v108 = objc_claimAutoreleasedReturnValue();
    if (v107 == (void *)v108)
    {

    }
    else
    {
      v109 = (void *)v108;
      -[BMAppActivity calendarUserActivityExternalID](self, "calendarUserActivityExternalID");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "calendarUserActivityExternalID");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v110, "isEqual:", v111);

      if (!v112)
      {
LABEL_89:
        v12 = 0;
LABEL_90:

        goto LABEL_91;
      }
    }
    -[BMAppActivity calendarUserActivityEndDate](self, "calendarUserActivityEndDate");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarUserActivityEndDate");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (v114 == v115)
    {
      v12 = 1;
    }
    else
    {
      -[BMAppActivity calendarUserActivityEndDate](self, "calendarUserActivityEndDate");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "calendarUserActivityEndDate");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v116, "isEqual:", v117);

    }
    goto LABEL_90;
  }
  v12 = 0;
LABEL_91:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (BOOL)beginningOfActivity
{
  return self->_beginningOfActivity;
}

- (BOOL)hasBeginningOfActivity
{
  return self->_hasBeginningOfActivity;
}

- (void)setHasBeginningOfActivity:(BOOL)a3
{
  self->_hasBeginningOfActivity = a3;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (BOOL)isEligibleForPrediction
{
  return self->_isEligibleForPrediction;
}

- (BOOL)hasIsEligibleForPrediction
{
  return self->_hasIsEligibleForPrediction;
}

- (void)setHasIsEligibleForPrediction:(BOOL)a3
{
  self->_hasIsEligibleForPrediction = a3;
}

- (BOOL)isPubliclyIndexable
{
  return self->_isPubliclyIndexable;
}

- (BOOL)hasIsPubliclyIndexable
{
  return self->_hasIsPubliclyIndexable;
}

- (void)setHasIsPubliclyIndexable:(BOOL)a3
{
  self->_hasIsPubliclyIndexable = a3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)itemRelatedUniqueIdentifier
{
  return self->_itemRelatedUniqueIdentifier;
}

- (int)shortcutAvailability
{
  return self->_shortcutAvailability;
}

- (BOOL)hasShortcutAvailability
{
  return self->_hasShortcutAvailability;
}

- (void)setHasShortcutAvailability:(BOOL)a3
{
  self->_hasShortcutAvailability = a3;
}

- (NSString)suggestedInvocationPhrase
{
  return self->_suggestedInvocationPhrase;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)userActivityRequiredString
{
  return self->_userActivityRequiredString;
}

- (NSString)userActivityUUID
{
  return self->_userActivityUUID;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)sourceItemID
{
  return self->_sourceItemID;
}

- (NSString)sourceGroupID
{
  return self->_sourceGroupID;
}

- (NSString)calendarUserActivityExternalID
{
  return self->_calendarUserActivityExternalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarUserActivityExternalID, 0);
  objc_storeStrong((id *)&self->_sourceGroupID, 0);
  objc_storeStrong((id *)&self->_sourceItemID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_userActivityUUID, 0);
  objc_storeStrong((id *)&self->_userActivityRequiredString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_suggestedInvocationPhrase, 0);
  objc_storeStrong((id *)&self->_itemRelatedUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_raw_itemRelatedContentURL, 0);
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

    v4 = -[BMAppActivity initByReadFrom:]([BMAppActivity alloc], "initByReadFrom:", v7);
    v4[20] = 0;

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
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[24];

  v26[22] = *MEMORY[0x1E0C80C00];
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 1, 13, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityType"), 2, 0, 2, 13, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("beginningOfActivity"), 0, 0, 3, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentDescription"), 2, 0, 4, 13, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("expirationDate"), 3, 0, 5, 0, 2);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isEligibleForPrediction"), 0, 0, 6, 12, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPubliclyIndexable"), 0, 0, 7, 12, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemIdentifier"), 2, 0, 8, 13, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemRelatedContentURL"), 2, 0, 9, 13, 4);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemRelatedUniqueIdentifier"), 2, 0, 10, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shortcutAvailability"), 0, 0, 11, 2, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestedInvocationPhrase"), 2, 0, 12, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 13, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userActivityRequiredString"), 2, 0, 14, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userActivityUUID"), 2, 0, 15, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceID"), 2, 0, 16, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceBundleID"), 2, 0, 17, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceItemID"), 2, 0, 18, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceGroupID"), 2, 0, 19, 13, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("calendarUserActivityDate"), 3, 0, 20, 0, 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("calendarUserActivityExternalID"), 2, 0, 21, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("calendarUserActivityEndDate"), 3, 0, 22, 0, 1);
  v26[0] = v25;
  v26[1] = v24;
  v26[2] = v23;
  v26[3] = v13;
  v26[4] = v22;
  v26[5] = v21;
  v26[6] = v20;
  v26[7] = v19;
  v26[8] = v18;
  v26[9] = v17;
  v26[10] = v16;
  v26[11] = v15;
  v26[12] = v2;
  v26[13] = v3;
  v26[14] = v14;
  v26[15] = v4;
  v26[16] = v5;
  v26[17] = v12;
  v26[18] = v6;
  v26[19] = v11;
  v26[20] = v7;
  v26[21] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 22);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A908;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[24];

  v26[22] = *MEMORY[0x1E0C80C00];
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 1, 13, 0);
  v26[0] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityType"), 2, 13, 0);
  v26[1] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("beginningOfActivity"), 3, 12, 0);
  v26[2] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentDescription"), 4, 13, 0);
  v26[3] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("expirationDate"), 5, 0, 0);
  v26[4] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isEligibleForPrediction"), 6, 12, 0);
  v26[5] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPubliclyIndexable"), 7, 12, 0);
  v26[6] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemIdentifier"), 8, 13, 0);
  v26[7] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemRelatedContentURL"), 9, 13, 0);
  v26[8] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemRelatedUniqueIdentifier"), 10, 13, 0);
  v26[9] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shortcutAvailability"), 11, 2, 0);
  v26[10] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestedInvocationPhrase"), 12, 13, 0);
  v26[11] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 13, 13, 0);
  v26[12] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userActivityRequiredString"), 14, 13, 0);
  v26[13] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userActivityUUID"), 15, 13, 0);
  v26[14] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceID"), 16, 13, 0);
  v26[15] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceBundleID"), 17, 13, 0);
  v26[16] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceItemID"), 18, 13, 0);
  v26[17] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceGroupID"), 19, 13, 0);
  v26[18] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("calendarUserActivityDate"), 20, 0, 0);
  v26[19] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("calendarUserActivityExternalID"), 21, 13, 0);
  v26[20] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("calendarUserActivityEndDate"), 22, 0, 0);
  v26[21] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
