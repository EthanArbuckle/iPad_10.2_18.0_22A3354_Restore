@implementation BMShareSheetFeedback

- (BMShareSheetFeedback)initWithDerivedIntentIdentifier:(id)a3 targetBundleID:(id)a4 extensionContextUUID:(id)a5 attachments:(id)a6 locationUUIDs:(id)a7 photoSuggestedContacts:(id)a8 modelSuggestionProxies:(id)a9 adaptedModelRecipeID:(id)a10 isAdaptedModelUsed:(id)a11 isAdaptedModelCreated:(id)a12 supportedBundleIDs:(id)a13 peopleSuggestionsDisabled:(id)a14 reasonType:(id)a15 reason:(id)a16 sourceBundleID:(id)a17 transportBundleID:(id)a18 numberOfVisibleSuggestions:(id)a19 trackingID:(id)a20 iCloudFamilyInvocation:(id)a21 engagementType:(int)a22 indexSelected:(id)a23
{
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  BMShareSheetFeedback *v35;
  int v36;
  double v37;
  int v38;
  id v41;
  id v42;
  id v43;
  id v44;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  objc_super v59;

  v58 = a3;
  v41 = a4;
  v57 = a4;
  v42 = a5;
  v56 = a5;
  v43 = a6;
  v55 = a6;
  v44 = a7;
  v54 = a7;
  v53 = a8;
  v52 = a9;
  v51 = a10;
  v28 = a11;
  v29 = a12;
  v50 = a13;
  v30 = a14;
  v49 = a15;
  v48 = a16;
  v47 = a17;
  v46 = a18;
  v31 = a19;
  v32 = a20;
  v33 = a21;
  v34 = a23;
  v59.receiver = self;
  v59.super_class = (Class)BMShareSheetFeedback;
  v35 = -[BMEventBase init](&v59, sel_init);
  if (v35)
  {
    v35->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v35->_derivedIntentIdentifier, a3);
    objc_storeStrong((id *)&v35->_targetBundleID, v41);
    objc_storeStrong((id *)&v35->_extensionContextUUID, v42);
    objc_storeStrong((id *)&v35->_attachments, v43);
    objc_storeStrong((id *)&v35->_locationUUIDs, v44);
    objc_storeStrong((id *)&v35->_photoSuggestedContacts, a8);
    objc_storeStrong((id *)&v35->_modelSuggestionProxies, a9);
    objc_storeStrong((id *)&v35->_adaptedModelRecipeID, a10);
    if (v28)
    {
      v35->_hasIsAdaptedModelUsed = 1;
      v35->_isAdaptedModelUsed = objc_msgSend(v28, "BOOLValue");
    }
    else
    {
      v35->_hasIsAdaptedModelUsed = 0;
      v35->_isAdaptedModelUsed = 0;
    }
    if (v29)
    {
      v35->_hasIsAdaptedModelCreated = 1;
      v35->_isAdaptedModelCreated = objc_msgSend(v29, "BOOLValue");
    }
    else
    {
      v35->_hasIsAdaptedModelCreated = 0;
      v35->_isAdaptedModelCreated = 0;
    }
    objc_storeStrong((id *)&v35->_supportedBundleIDs, a13);
    if (v30)
    {
      v35->_hasPeopleSuggestionsDisabled = 1;
      v36 = objc_msgSend(v30, "intValue");
    }
    else
    {
      v35->_hasPeopleSuggestionsDisabled = 0;
      v36 = -1;
    }
    v35->_peopleSuggestionsDisabled = v36;
    objc_storeStrong((id *)&v35->_reasonType, a15);
    objc_storeStrong((id *)&v35->_reason, a16);
    objc_storeStrong((id *)&v35->_sourceBundleID, a17);
    objc_storeStrong((id *)&v35->_transportBundleID, a18);
    if (v31)
    {
      v35->_hasNumberOfVisibleSuggestions = 1;
      objc_msgSend(v31, "doubleValue");
    }
    else
    {
      v35->_hasNumberOfVisibleSuggestions = 0;
      v37 = -1.0;
    }
    v35->_numberOfVisibleSuggestions = v37;
    objc_storeStrong((id *)&v35->_trackingID, a20);
    if (v33)
    {
      v35->_hasICloudFamilyInvocation = 1;
      v35->_iCloudFamilyInvocation = objc_msgSend(v33, "BOOLValue");
    }
    else
    {
      v35->_hasICloudFamilyInvocation = 0;
      v35->_iCloudFamilyInvocation = 0;
    }
    v35->_engagementType = a22;
    if (v34)
    {
      v35->_hasIndexSelected = 1;
      v38 = objc_msgSend(v34, "intValue");
    }
    else
    {
      v35->_hasIndexSelected = 0;
      v38 = -1;
    }
    v35->_indexSelected = v38;
  }

  return v35;
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

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMShareSheetFeedback derivedIntentIdentifier](self, "derivedIntentIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback targetBundleID](self, "targetBundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback extensionContextUUID](self, "extensionContextUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback attachments](self, "attachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback locationUUIDs](self, "locationUUIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback photoSuggestedContacts](self, "photoSuggestedContacts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback modelSuggestionProxies](self, "modelSuggestionProxies");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback adaptedModelRecipeID](self, "adaptedModelRecipeID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMShareSheetFeedback isAdaptedModelUsed](self, "isAdaptedModelUsed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMShareSheetFeedback isAdaptedModelCreated](self, "isAdaptedModelCreated"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback supportedBundleIDs](self, "supportedBundleIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMShareSheetFeedback peopleSuggestionsDisabled](self, "peopleSuggestionsDisabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback reasonType](self, "reasonType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback reason](self, "reason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback sourceBundleID](self, "sourceBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback transportBundleID](self, "transportBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMShareSheetFeedback numberOfVisibleSuggestions](self, "numberOfVisibleSuggestions");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback trackingID](self, "trackingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMShareSheetFeedback iCloudFamilyInvocation](self, "iCloudFamilyInvocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMShareSheetFeedbackEngagementTypeAsString(-[BMShareSheetFeedback engagementType](self, "engagementType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMShareSheetFeedback indexSelected](self, "indexSelected"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("BMShareSheetFeedback with derivedIntentIdentifier: %@, targetBundleID: %@, extensionContextUUID: %@, attachments: %@, locationUUIDs: %@, photoSuggestedContacts: %@, modelSuggestionProxies: %@, adaptedModelRecipeID: %@, isAdaptedModelUsed: %@, isAdaptedModelCreated: %@, supportedBundleIDs: %@, peopleSuggestionsDisabled: %@, reasonType: %@, reason: %@, sourceBundleID: %@, transportBundleID: %@, numberOfVisibleSuggestions: %@, trackingID: %@, iCloudFamilyInvocation: %@, engagementType: %@, indexSelected: %@"), v27, v26, v25, v24, v23, v22, v17, v21, v16, v15, v20, v12, v14, v11, v13, v10,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMShareSheetFeedback *v5;
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
  void *v25;
  void *v26;
  uint64_t v27;
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
  uint64_t v49;
  unint64_t v50;
  double v51;
  void *v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSArray *locationUUIDs;
  uint64_t v78;
  NSArray *photoSuggestedContacts;
  int v80;
  BMShareSheetFeedback *v81;
  objc_super v83;

  v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)BMShareSheetFeedback;
  v5 = -[BMEventBase init](&v83, sel_init);
  if (!v5)
    goto LABEL_119;
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
          v23 = 48;
          goto LABEL_63;
        case 2u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 56;
          goto LABEL_63;
        case 3u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 64;
          goto LABEL_63;
        case 4u:
          PBReaderReadData();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 72;
          goto LABEL_63;
        case 5u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24)
            goto LABEL_121;
          v25 = (void *)v24;
          v26 = v6;
          goto LABEL_30;
        case 6u:
          PBReaderReadData();
          v27 = objc_claimAutoreleasedReturnValue();
          if (!v27)
            goto LABEL_121;
          v25 = (void *)v27;
          v26 = v7;
LABEL_30:
          objc_msgSend(v26, "addObject:", v25);

          continue;
        case 7u:
          PBReaderReadData();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 96;
          goto LABEL_63;
        case 8u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 104;
          goto LABEL_63;
        case 9u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasIsAdaptedModelUsed = 1;
          while (2)
          {
            v31 = *v8;
            v32 = *(_QWORD *)&v4[v31];
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v32);
              *(_QWORD *)&v4[v31] = v33;
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                v19 = v29++ >= 9;
                if (v19)
                {
                  v30 = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v30 = 0;
LABEL_90:
          v73 = v30 != 0;
          v74 = 16;
          goto LABEL_103;
        case 0xAu:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v5->_hasIsAdaptedModelCreated = 1;
          while (2)
          {
            v38 = *v8;
            v39 = *(_QWORD *)&v4[v38];
            v40 = v39 + 1;
            if (v39 == -1 || v40 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v39);
              *(_QWORD *)&v4[v38] = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                v19 = v36++ >= 9;
                if (v19)
                {
                  v37 = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v37 = 0;
LABEL_94:
          v73 = v37 != 0;
          v74 = 18;
          goto LABEL_103;
        case 0xBu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 112;
          goto LABEL_63;
        case 0xCu:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          v5->_hasPeopleSuggestionsDisabled = 1;
          while (2)
          {
            v45 = *v8;
            v46 = *(_QWORD *)&v4[v45];
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v46);
              *(_QWORD *)&v4[v45] = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                v19 = v43++ >= 9;
                if (v19)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v44) = 0;
LABEL_98:
          v75 = 32;
          goto LABEL_114;
        case 0xDu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 120;
          goto LABEL_63;
        case 0xEu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 128;
          goto LABEL_63;
        case 0xFu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 136;
          goto LABEL_63;
        case 0x10u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 144;
          goto LABEL_63;
        case 0x11u:
          v5->_hasNumberOfVisibleSuggestions = 1;
          v49 = *v8;
          v50 = *(_QWORD *)&v4[v49];
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v51 = *(double *)(*(_QWORD *)&v4[*v11] + v50);
            *(_QWORD *)&v4[v49] = v50 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v51 = 0.0;
          }
          v5->_numberOfVisibleSuggestions = v51;
          continue;
        case 0x12u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 160;
LABEL_63:
          v52 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 0x13u:
          v53 = 0;
          v54 = 0;
          v55 = 0;
          v5->_hasICloudFamilyInvocation = 1;
          while (2)
          {
            v56 = *v8;
            v57 = *(_QWORD *)&v4[v56];
            v58 = v57 + 1;
            if (v57 == -1 || v58 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v59 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v57);
              *(_QWORD *)&v4[v56] = v58;
              v55 |= (unint64_t)(v59 & 0x7F) << v53;
              if (v59 < 0)
              {
                v53 += 7;
                v19 = v54++ >= 9;
                if (v19)
                {
                  v55 = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v55 = 0;
LABEL_102:
          v73 = v55 != 0;
          v74 = 22;
LABEL_103:
          *((_BYTE *)&v5->super.super.isa + v74) = v73;
          continue;
        case 0x14u:
          v60 = 0;
          v61 = 0;
          v62 = 0;
          while (2)
          {
            v63 = *v8;
            v64 = *(_QWORD *)&v4[v63];
            v65 = v64 + 1;
            if (v64 == -1 || v65 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v64);
              *(_QWORD *)&v4[v63] = v65;
              v62 |= (unint64_t)(v66 & 0x7F) << v60;
              if (v66 < 0)
              {
                v60 += 7;
                v19 = v61++ >= 9;
                if (v19)
                {
                  LODWORD(v62) = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v62) = 0;
LABEL_107:
          if (v62 >= 5)
            LODWORD(v62) = 0;
          v5->_engagementType = v62;
          continue;
        case 0x15u:
          v67 = 0;
          v68 = 0;
          v44 = 0;
          v5->_hasIndexSelected = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_121:

          goto LABEL_118;
      }
      while (1)
      {
        v69 = *v8;
        v70 = *(_QWORD *)&v4[v69];
        v71 = v70 + 1;
        if (v70 == -1 || v71 > *(_QWORD *)&v4[*v9])
          break;
        v72 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v70);
        *(_QWORD *)&v4[v69] = v71;
        v44 |= (unint64_t)(v72 & 0x7F) << v67;
        if ((v72 & 0x80) == 0)
          goto LABEL_111;
        v67 += 7;
        v19 = v68++ >= 9;
        if (v19)
        {
          LODWORD(v44) = 0;
          goto LABEL_113;
        }
      }
      v4[*v10] = 1;
LABEL_111:
      if (v4[*v10])
        LODWORD(v44) = 0;
LABEL_113:
      v75 = 40;
LABEL_114:
      *(_DWORD *)((char *)&v5->super.super.isa + v75) = v44;
    }
    while (*(_QWORD *)&v4[*v8] < *(_QWORD *)&v4[*v9]);
  }
  v76 = objc_msgSend(v6, "copy");
  locationUUIDs = v5->_locationUUIDs;
  v5->_locationUUIDs = (NSArray *)v76;

  v78 = objc_msgSend(v7, "copy");
  photoSuggestedContacts = v5->_photoSuggestedContacts;
  v5->_photoSuggestedContacts = (NSArray *)v78;

  v80 = v4[*v10];
  if (v80)
LABEL_118:
    v81 = 0;
  else
LABEL_119:
    v81 = v5;

  return v81;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_derivedIntentIdentifier)
    PBDataWriterWriteStringField();
  if (self->_targetBundleID)
    PBDataWriterWriteStringField();
  if (self->_extensionContextUUID)
    PBDataWriterWriteStringField();
  if (self->_attachments)
    PBDataWriterWriteDataField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_locationUUIDs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_photoSuggestedContacts;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteDataField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_modelSuggestionProxies)
    PBDataWriterWriteDataField();
  if (self->_adaptedModelRecipeID)
    PBDataWriterWriteStringField();
  if (self->_hasIsAdaptedModelUsed)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsAdaptedModelCreated)
    PBDataWriterWriteBOOLField();
  if (self->_supportedBundleIDs)
    PBDataWriterWriteStringField();
  if (self->_hasPeopleSuggestionsDisabled)
    PBDataWriterWriteInt32Field();
  if (self->_reasonType)
    PBDataWriterWriteStringField();
  if (self->_reason)
    PBDataWriterWriteStringField();
  if (self->_sourceBundleID)
    PBDataWriterWriteStringField();
  if (self->_transportBundleID)
    PBDataWriterWriteStringField();
  if (self->_hasNumberOfVisibleSuggestions)
    PBDataWriterWriteDoubleField();
  if (self->_trackingID)
    PBDataWriterWriteStringField();
  if (self->_hasICloudFamilyInvocation)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_hasIndexSelected)
    PBDataWriterWriteInt32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMShareSheetFeedback writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMShareSheetFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  BMShareSheetFeedback *v19;
  id *v20;
  id v21;
  id *v22;
  uint64_t v23;
  id v24;
  BMShareSheetFeedback *v25;
  id v26;
  uint64_t v27;
  id *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  int v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id *v81;
  id v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  id *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  id v120;
  uint64_t v121;
  id v122;
  void *v123;
  id v124;
  id v125;
  uint64_t v126;
  void *v127;
  id v128;
  id v129;
  void *v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  id v135;
  id v136;
  void *v137;
  uint64_t v138;
  void *v139;
  id v140;
  uint64_t v141;
  void *v142;
  id v143;
  id v144;
  void *v145;
  uint64_t v146;
  void *v147;
  id v148;
  id v149;
  void *v150;
  id v151;
  id v152;
  void *v153;
  uint64_t v154;
  void *v155;
  id v156;
  id v157;
  uint64_t v158;
  void *v159;
  id v160;
  id v161;
  void *v162;
  uint64_t v163;
  void *v164;
  id v165;
  void *v166;
  id v167;
  id v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  id v173;
  void *v174;
  id v175;
  id v176;
  void *v177;
  uint64_t v178;
  void *v179;
  id v180;
  id v181;
  void *v182;
  id v183;
  id v184;
  void *v185;
  uint64_t v186;
  void *v187;
  id v188;
  id v189;
  void *v190;
  id v191;
  id v192;
  void *v193;
  uint64_t v194;
  void *v195;
  id v196;
  id v197;
  uint64_t v198;
  void *v199;
  id v200;
  id v201;
  void *v202;
  uint64_t v203;
  void *v204;
  id v205;
  id v206;
  void *v207;
  id v208;
  id v209;
  void *v210;
  uint64_t v211;
  void *v212;
  id v213;
  id v214;
  uint64_t v215;
  void *v216;
  id v217;
  id v218;
  void *v219;
  id v220;
  id v221;
  id v222;
  void *v223;
  _BYTE *v224;
  void *v225;
  id v226;
  id v228;
  uint64_t v229;
  void *v230;
  void *v231;
  void *v232;
  uint64_t v233;
  id v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  id v257;
  void *v258;
  id v259;
  void *v260;
  id v261;
  uint64_t v262;
  id v263;
  void *v264;
  id v265;
  uint64_t v266;
  void *v267;
  id v268;
  uint64_t v269;
  void *v270;
  uint64_t v271;
  id v272;
  uint64_t v273;
  void *v274;
  id v275;
  id v276;
  id v277;
  id v278;
  id v279;
  id v280;
  id v281;
  id v282;
  id v283;
  id v284;
  id v285;
  id v286;
  id v287;
  id v288;
  id v289;
  void *v290;
  id v291;
  void *v292;
  id v293;
  uint64_t v294;
  void *v295;
  void *v296;
  id v297;
  void *v298;
  void *v299;
  void *v300;
  id v301;
  id v302;
  void *v303;
  id v304;
  id v305;
  id *v306;
  uint64_t v307;
  id v308;
  void *v309;
  id *v310;
  id v311;
  BMShareSheetFeedback *v312;
  void *v313;
  id obj;
  id obja;
  void *v316;
  void *v317;
  id *v318;
  id v319;
  void *v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  uint64_t v329;
  void *v330;
  uint64_t v331;
  void *v332;
  uint64_t v333;
  id v334;
  uint64_t v335;
  id v336;
  uint64_t v337;
  id v338;
  uint64_t v339;
  id v340;
  uint64_t v341;
  id v342;
  uint64_t v343;
  id v344;
  uint64_t v345;
  id v346;
  uint64_t v347;
  id v348;
  uint64_t v349;
  id v350;
  uint64_t v351;
  id v352;
  uint64_t v353;
  id *v354;
  uint64_t v355;
  id v356;
  uint64_t v357;
  id v358;
  uint64_t v359;
  void *v360;
  uint64_t v361;
  void *v362;
  _BYTE v363[128];
  uint64_t v364;
  void *v365;
  uint64_t v366;
  void *v367;
  uint64_t v368;
  void *v369;
  _BYTE v370[128];
  uint64_t v371;
  void *v372;
  uint64_t v373;
  id v374;
  uint64_t v375;
  id v376;
  uint64_t v377;
  void *v378;
  uint64_t v379;
  _QWORD v380[3];

  v380[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("derivedIntentIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  v317 = (void *)v7;
  if (!v7 || (v8 = (void *)v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("targetBundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v318 = 0;
      goto LABEL_7;
    }
    v18 = v10;
    v19 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v318 = v18;
      v10 = v18;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extensionContextUUID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v312 = self;
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v311 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v311 = v11;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attachments"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v309 = v11;
        v313 = v6;
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v13 = v12;
          v14 = 0;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locationUUIDs"));
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (v17)
          {
            v304 = v9;

            v15 = 0;
LABEL_33:
            v20 = v318;
            v12 = v13;
LABEL_34:
            v35 = a4;
            v320 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
            v325 = 0u;
            v326 = 0u;
            v327 = 0u;
            v328 = 0u;
            v15 = v15;
            v36 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v325, v370, 16);
            v318 = v20;
            v310 = a4;
            v37 = v14;
            if (!v36)
            {
LABEL_43:

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("photoSuggestedContacts"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v44, "isEqual:", v45);

              if (v46)
              {

                v44 = 0;
              }
              else if (v44)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  obj = v44;
                  if (v35)
                  {
                    v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v89 = *MEMORY[0x1E0D025B8];
                    v364 = *MEMORY[0x1E0CB2D50];
                    v316 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("photoSuggestedContacts"));
                    v365 = v316;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v365, &v364, 1);
                    v90 = objc_claimAutoreleasedReturnValue();
                    v91 = v88;
                    v49 = (id)v90;
                    v92 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v89, 2, v90);
                    v25 = 0;
                    *v35 = v92;
                    v9 = v304;
                    v30 = v311;
                    goto LABEL_211;
                  }
                  v25 = 0;
                  v9 = v304;
                  v30 = v311;
                  v14 = v37;
                  goto LABEL_213;
                }
              }
              v316 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v44, "count"));
              v321 = 0u;
              v322 = 0u;
              v323 = 0u;
              v324 = 0u;
              obj = v44;
              v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v321, v363, 16);
              if (!v66)
                goto LABEL_64;
              v67 = v66;
              v68 = *(_QWORD *)v322;
              v302 = v15;
LABEL_57:
              v69 = v37;
              v70 = v10;
              v71 = 0;
              while (1)
              {
                if (*(_QWORD *)v322 != v68)
                  objc_enumerationMutation(obj);
                v72 = *(void **)(*((_QWORD *)&v321 + 1) + 8 * v71);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  break;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v310)
                  {
                    v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v87 = *MEMORY[0x1E0D025B8];
                    v359 = *MEMORY[0x1E0CB2D50];
                    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("photoSuggestedContacts"));
                    v360 = v74;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v360, &v359, 1);
                    v301 = (id)objc_claimAutoreleasedReturnValue();
                    v84 = (void *)objc_msgSend(v86, "initWithDomain:code:userInfo:", v87, 2);
                    v85 = v304;
                    v10 = v70;
                    v81 = v310;
                    v30 = v311;
                    goto LABEL_75;
                  }
                  goto LABEL_79;
                }
                v73 = v72;
                objc_msgSend(v316, "addObject:", v73);

                if (v67 == ++v71)
                {
                  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v321, v363, 16);
                  v10 = v70;
                  v37 = v69;
                  v15 = v302;
                  v35 = v310;
                  if (v67)
                    goto LABEL_57;
LABEL_64:

                  objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("modelSuggestionProxies"));
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  v300 = v74;
                  if (!v74)
                  {
                    v49 = 0;
                    v9 = v304;
                    goto LABEL_86;
                  }
                  objc_opt_class();
                  v9 = v304;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v49 = 0;
LABEL_86:
                    objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("adaptedModelRecipeID"));
                    v93 = objc_claimAutoreleasedReturnValue();
                    v298 = (void *)v93;
                    if (v93)
                    {
                      v94 = (void *)v93;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v301 = v94;
                          goto LABEL_89;
                        }
                        if (v310)
                        {
                          v277 = v49;
                          v125 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v126 = *MEMORY[0x1E0D025B8];
                          v355 = *MEMORY[0x1E0CB2D50];
                          v127 = v10;
                          v128 = v9;
                          v129 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v240 = objc_opt_class();
                          v130 = v129;
                          v9 = v128;
                          v10 = v127;
                          v297 = (id)objc_msgSend(v130, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v240, CFSTR("adaptedModelRecipeID"));
                          v356 = v297;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v356, &v355, 1);
                          v96 = (void *)objc_claimAutoreleasedReturnValue();
                          v131 = v125;
                          v49 = v277;
                          v132 = (id)objc_msgSend(v131, "initWithDomain:code:userInfo:", v126, 2, v96);
                          v301 = 0;
                          v25 = 0;
                          v30 = v311;
                          *v310 = v132;
                          v74 = v300;
                          goto LABEL_207;
                        }
                        v301 = 0;
                        v25 = 0;
                        v30 = v311;
                        goto LABEL_208;
                      }
                    }
                    v301 = 0;
LABEL_89:
                    objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("isAdaptedModelUsed"));
                    v95 = objc_claimAutoreleasedReturnValue();
                    v295 = (void *)v95;
                    if (v95 && (v96 = (void *)v95, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v297 = v96;
                        goto LABEL_92;
                      }
                      if (!v310)
                      {
                        v297 = 0;
                        v25 = 0;
                        v30 = v311;
                        goto LABEL_207;
                      }
                      v278 = v49;
                      v133 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v307 = *MEMORY[0x1E0D025B8];
                      v353 = *MEMORY[0x1E0CB2D50];
                      v134 = v10;
                      v135 = v9;
                      v136 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v241 = objc_opt_class();
                      v137 = v136;
                      v9 = v135;
                      v10 = v134;
                      v74 = v300;
                      v116 = (id *)objc_msgSend(v137, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v241, CFSTR("isAdaptedModelUsed"));
                      v354 = v116;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v354, &v353, 1);
                      v138 = objc_claimAutoreleasedReturnValue();
                      v139 = v133;
                      v49 = v278;
                      v296 = (void *)v138;
                      v297 = 0;
                      v25 = 0;
                      *v310 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v307, 2);
                    }
                    else
                    {
                      v297 = 0;
LABEL_92:
                      objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("isAdaptedModelCreated"));
                      v97 = objc_claimAutoreleasedReturnValue();
                      v296 = (void *)v97;
                      if (!v97 || (v98 = (void *)v97, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v306 = 0;
LABEL_95:
                        objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("supportedBundleIDs"));
                        v99 = objc_claimAutoreleasedReturnValue();
                        v292 = (void *)v99;
                        if (v99 && (v100 = (void *)v99, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v293 = v100;
                            goto LABEL_98;
                          }
                          if (v310)
                          {
                            v280 = v49;
                            v149 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v294 = *MEMORY[0x1E0D025B8];
                            v349 = *MEMORY[0x1E0CB2D50];
                            v150 = v10;
                            v151 = v9;
                            v152 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v243 = objc_opt_class();
                            v153 = v152;
                            v116 = v306;
                            v9 = v151;
                            v10 = v150;
                            v291 = (id)objc_msgSend(v153, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v243, CFSTR("supportedBundleIDs"));
                            v350 = v291;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v350, &v349, 1);
                            v154 = objc_claimAutoreleasedReturnValue();
                            v155 = v149;
                            v49 = v280;
                            v290 = (void *)v154;
                            v156 = (id)objc_msgSend(v155, "initWithDomain:code:userInfo:", v294, 2);
                            v293 = 0;
                            v25 = 0;
                            *v310 = v156;
                            v30 = v311;
                            v74 = v300;
                            goto LABEL_204;
                          }
                          v293 = 0;
                          v25 = 0;
                          v30 = v311;
                          v116 = v306;
                        }
                        else
                        {
                          v293 = 0;
LABEL_98:
                          objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("peopleSuggestionsDisabled"));
                          v101 = objc_claimAutoreleasedReturnValue();
                          v290 = (void *)v101;
                          if (v101 && (v102 = (void *)v101, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v291 = v102;
                              goto LABEL_101;
                            }
                            if (v310)
                            {
                              v281 = v49;
                              v157 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v158 = *MEMORY[0x1E0D025B8];
                              v347 = *MEMORY[0x1E0CB2D50];
                              v159 = v10;
                              v160 = v9;
                              v161 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v244 = objc_opt_class();
                              v162 = v161;
                              v116 = v306;
                              v9 = v160;
                              v10 = v159;
                              v74 = v300;
                              v275 = (id)objc_msgSend(v162, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v244, CFSTR("peopleSuggestionsDisabled"));
                              v348 = v275;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v348, &v347, 1);
                              v163 = objc_claimAutoreleasedReturnValue();
                              v164 = v157;
                              v49 = v281;
                              v274 = (void *)v163;
                              v165 = (id)objc_msgSend(v164, "initWithDomain:code:userInfo:", v158, 2);
                              v291 = 0;
                              v25 = 0;
                              v30 = v311;
                              *v310 = v165;
                              goto LABEL_203;
                            }
                            v291 = 0;
                            v25 = 0;
                            v30 = v311;
                            v116 = v306;
                          }
                          else
                          {
                            v291 = 0;
LABEL_101:
                            objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("reasonType"));
                            v103 = objc_claimAutoreleasedReturnValue();
                            v274 = (void *)v103;
                            if (v103 && (v104 = (void *)v103, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v275 = v104;
                                goto LABEL_104;
                              }
                              if (v310)
                              {
                                v276 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v282 = v49;
                                v271 = *MEMORY[0x1E0D025B8];
                                v345 = *MEMORY[0x1E0CB2D50];
                                v166 = v10;
                                v167 = v9;
                                v168 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v245 = objc_opt_class();
                                v169 = v168;
                                v116 = v306;
                                v9 = v167;
                                v10 = v166;
                                v272 = (id)objc_msgSend(v169, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v245, CFSTR("reasonType"));
                                v346 = v272;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v346, &v345, 1);
                                v170 = objc_claimAutoreleasedReturnValue();
                                v49 = v282;
                                v171 = v271;
                                v270 = (void *)v170;
                                v172 = (id)objc_msgSend(v276, "initWithDomain:code:userInfo:", v171, 2);
                                v275 = 0;
                                v25 = 0;
                                *v310 = v172;
                                v30 = v311;
                                goto LABEL_202;
                              }
                              v275 = 0;
                              v25 = 0;
                              v30 = v311;
                              v116 = v306;
                            }
                            else
                            {
                              v275 = 0;
LABEL_104:
                              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("reason"));
                              v105 = objc_claimAutoreleasedReturnValue();
                              v270 = (void *)v105;
                              if (v105 && (v106 = (void *)v105, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v272 = v106;
                                  goto LABEL_107;
                                }
                                if (v310)
                                {
                                  v283 = v49;
                                  v173 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v273 = *MEMORY[0x1E0D025B8];
                                  v343 = *MEMORY[0x1E0CB2D50];
                                  v174 = v10;
                                  v175 = v9;
                                  v176 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v246 = objc_opt_class();
                                  v177 = v176;
                                  v116 = v306;
                                  v9 = v175;
                                  v10 = v174;
                                  v268 = (id)objc_msgSend(v177, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v246, CFSTR("reason"));
                                  v344 = v268;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v344, &v343, 1);
                                  v178 = objc_claimAutoreleasedReturnValue();
                                  v179 = v173;
                                  v49 = v283;
                                  v267 = (void *)v178;
                                  v180 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v273, 2);
                                  v272 = 0;
                                  v25 = 0;
                                  *v310 = v180;
                                  v30 = v311;
                                  v74 = v300;
                                  goto LABEL_201;
                                }
                                v272 = 0;
                                v25 = 0;
                                v30 = v311;
                                v116 = v306;
                              }
                              else
                              {
                                v272 = 0;
LABEL_107:
                                objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("sourceBundleID"));
                                v107 = objc_claimAutoreleasedReturnValue();
                                v267 = (void *)v107;
                                if (v107
                                  && (v108 = (void *)v107, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v268 = v108;
                                    goto LABEL_110;
                                  }
                                  if (v310)
                                  {
                                    v284 = v49;
                                    v181 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v269 = *MEMORY[0x1E0D025B8];
                                    v341 = *MEMORY[0x1E0CB2D50];
                                    v182 = v10;
                                    v183 = v9;
                                    v184 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v247 = objc_opt_class();
                                    v185 = v184;
                                    v116 = v306;
                                    v9 = v183;
                                    v10 = v182;
                                    v265 = (id)objc_msgSend(v185, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v247, CFSTR("sourceBundleID"));
                                    v342 = v265;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v342, &v341, 1);
                                    v186 = objc_claimAutoreleasedReturnValue();
                                    v187 = v181;
                                    v49 = v284;
                                    v264 = (void *)v186;
                                    v188 = (id)objc_msgSend(v187, "initWithDomain:code:userInfo:", v269, 2);
                                    v268 = 0;
                                    v25 = 0;
                                    *v310 = v188;
                                    v30 = v311;
                                    v74 = v300;
                                    goto LABEL_200;
                                  }
                                  v268 = 0;
                                  v25 = 0;
                                  v30 = v311;
                                  v116 = v306;
                                }
                                else
                                {
                                  v268 = 0;
LABEL_110:
                                  objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("transportBundleID"));
                                  v109 = objc_claimAutoreleasedReturnValue();
                                  v264 = (void *)v109;
                                  if (v109
                                    && (v110 = (void *)v109, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v265 = v110;
                                      goto LABEL_113;
                                    }
                                    if (v310)
                                    {
                                      v285 = v49;
                                      v189 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v266 = *MEMORY[0x1E0D025B8];
                                      v339 = *MEMORY[0x1E0CB2D50];
                                      v190 = v10;
                                      v191 = v9;
                                      v192 = objc_alloc(MEMORY[0x1E0CB3940]);
                                      v248 = objc_opt_class();
                                      v193 = v192;
                                      v116 = v306;
                                      v9 = v191;
                                      v10 = v190;
                                      v263 = (id)objc_msgSend(v193, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v248, CFSTR("transportBundleID"));
                                      v340 = v263;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v340, &v339, 1);
                                      v194 = objc_claimAutoreleasedReturnValue();
                                      v195 = v189;
                                      v49 = v285;
                                      v260 = (void *)v194;
                                      v196 = (id)objc_msgSend(v195, "initWithDomain:code:userInfo:", v266, 2);
                                      v265 = 0;
                                      v25 = 0;
                                      *v310 = v196;
                                      v30 = v311;
                                      v74 = v300;
                                      goto LABEL_199;
                                    }
                                    v265 = 0;
                                    v25 = 0;
                                    v30 = v311;
                                    v116 = v306;
                                  }
                                  else
                                  {
                                    v265 = 0;
LABEL_113:
                                    objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("numberOfVisibleSuggestions"));
                                    v111 = objc_claimAutoreleasedReturnValue();
                                    v260 = (void *)v111;
                                    if (v111
                                      && (v112 = (void *)v111, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v263 = v112;
                                        goto LABEL_116;
                                      }
                                      if (v310)
                                      {
                                        v286 = v49;
                                        v197 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v198 = *MEMORY[0x1E0D025B8];
                                        v337 = *MEMORY[0x1E0CB2D50];
                                        v199 = v10;
                                        v200 = v9;
                                        v201 = objc_alloc(MEMORY[0x1E0CB3940]);
                                        v249 = objc_opt_class();
                                        v202 = v201;
                                        v116 = v306;
                                        v9 = v200;
                                        v10 = v199;
                                        v74 = v300;
                                        v261 = (id)objc_msgSend(v202, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v249, CFSTR("numberOfVisibleSuggestions"));
                                        v338 = v261;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v338, &v337, 1);
                                        v203 = objc_claimAutoreleasedReturnValue();
                                        v204 = v197;
                                        v49 = v286;
                                        v258 = (void *)v203;
                                        v205 = (id)objc_msgSend(v204, "initWithDomain:code:userInfo:", v198, 2);
                                        v263 = 0;
                                        v25 = 0;
                                        v30 = v311;
                                        *v310 = v205;
                                        goto LABEL_198;
                                      }
                                      v263 = 0;
                                      v25 = 0;
                                      v30 = v311;
                                      v116 = v306;
                                    }
                                    else
                                    {
                                      v263 = 0;
LABEL_116:
                                      objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("trackingID"));
                                      v113 = objc_claimAutoreleasedReturnValue();
                                      v258 = (void *)v113;
                                      if (v113
                                        && (v114 = (void *)v113, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v261 = v114;
                                          goto LABEL_119;
                                        }
                                        if (v310)
                                        {
                                          v287 = v49;
                                          v206 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v262 = *MEMORY[0x1E0D025B8];
                                          v335 = *MEMORY[0x1E0CB2D50];
                                          v207 = v10;
                                          v208 = v9;
                                          v209 = objc_alloc(MEMORY[0x1E0CB3940]);
                                          v250 = objc_opt_class();
                                          v210 = v209;
                                          v116 = v306;
                                          v9 = v208;
                                          v10 = v207;
                                          v259 = (id)objc_msgSend(v210, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v250, CFSTR("trackingID"));
                                          v336 = v259;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v336, &v335, 1);
                                          v211 = objc_claimAutoreleasedReturnValue();
                                          v212 = v206;
                                          v49 = v287;
                                          v256 = (void *)v211;
                                          v213 = (id)objc_msgSend(v212, "initWithDomain:code:userInfo:", v262, 2);
                                          v261 = 0;
                                          v25 = 0;
                                          *v310 = v213;
                                          v30 = v311;
                                          v74 = v300;
                                          goto LABEL_197;
                                        }
                                        v261 = 0;
                                        v25 = 0;
                                        v30 = v311;
                                        v116 = v306;
                                      }
                                      else
                                      {
                                        v261 = 0;
LABEL_119:
                                        objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("iCloudFamilyInvocation"));
                                        v115 = objc_claimAutoreleasedReturnValue();
                                        v116 = v306;
                                        v256 = (void *)v115;
                                        if (v115
                                          && (v117 = (void *)v115, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v259 = v117;
                                            goto LABEL_122;
                                          }
                                          if (v310)
                                          {
                                            v214 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v215 = *MEMORY[0x1E0D025B8];
                                            v333 = *MEMORY[0x1E0CB2D50];
                                            v216 = v10;
                                            v217 = v9;
                                            v218 = objc_alloc(MEMORY[0x1E0CB3940]);
                                            v251 = objc_opt_class();
                                            v219 = v218;
                                            v9 = v217;
                                            v10 = v216;
                                            v74 = v300;
                                            v257 = (id)objc_msgSend(v219, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v251, CFSTR("iCloudFamilyInvocation"));
                                            v334 = v257;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v334, &v333, 1);
                                            v255 = (void *)objc_claimAutoreleasedReturnValue();
                                            v220 = (id)objc_msgSend(v214, "initWithDomain:code:userInfo:", v215, 2);
                                            v259 = 0;
                                            v25 = 0;
                                            v30 = v311;
                                            *v310 = v220;
                                            goto LABEL_196;
                                          }
                                          v259 = 0;
                                          v25 = 0;
                                          v30 = v311;
                                        }
                                        else
                                        {
                                          v259 = 0;
LABEL_122:
                                          objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("engagementType"));
                                          v118 = objc_claimAutoreleasedReturnValue();
                                          v255 = (void *)v118;
                                          if (!v118
                                            || (v119 = (void *)v118,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v257 = 0;
                                            goto LABEL_190;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v257 = v119;
LABEL_189:

LABEL_190:
                                            objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("indexSelected"));
                                            v226 = (id)objc_claimAutoreleasedReturnValue();
                                            v254 = v226;
                                            if (!v226)
                                            {
LABEL_193:
                                              v30 = v311;
                                              goto LABEL_194;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v226 = 0;
                                              goto LABEL_193;
                                            }
                                            objc_opt_class();
                                            v30 = v311;
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v226 = v226;
LABEL_194:
                                              v253 = v226;
                                              LODWORD(v252) = objc_msgSend(v257, "intValue");
                                              v25 = objc_retain(-[BMShareSheetFeedback initWithDerivedIntentIdentifier:targetBundleID:extensionContextUUID:attachments:locationUUIDs:photoSuggestedContacts:modelSuggestionProxies:adaptedModelRecipeID:isAdaptedModelUsed:isAdaptedModelCreated:supportedBundleIDs:peopleSuggestionsDisabled:reasonType:reason:sourceBundleID:transportBundleID:numberOfVisibleSuggestions:trackingID:iCloudFamilyInvocation:engagementType:indexSelected:](v312, "initWithDerivedIntentIdentifier:targetBundleID:extensionContextUUID:attachments:locationUUIDs:photoSuggestedContacts:modelSuggestionProxies:adaptedModelRecipeID:isAdaptedModelUsed:isAdaptedModelCreated:supportedBundleIDs:peopleSuggestionsDisabled:reasonType:reason:sourceBundleID:transportBundleID:numberOfVisibleSuggestions:trackingID:iCloudFamilyInvocation:engagementType:indexSelected:", v9, v318, v30, v37, v320, v316, v49, v301, v297, v116, v293,
                                                        v291,
                                                        v275,
                                                        v272,
                                                        v268,
                                                        v265,
                                                        v263,
                                                        v261,
                                                        v259,
                                                        v252,
                                                        v226));
                                              v312 = v25;
                                            }
                                            else
                                            {
                                              v25 = (BMShareSheetFeedback *)v310;
                                              if (v310)
                                              {
                                                v288 = v49;
                                                v228 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v229 = *MEMORY[0x1E0D025B8];
                                                v329 = *MEMORY[0x1E0CB2D50];
                                                v308 = v9;
                                                v230 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("indexSelected"));
                                                v330 = v230;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v330, &v329, 1);
                                                v231 = (void *)objc_claimAutoreleasedReturnValue();
                                                v232 = v228;
                                                v49 = v288;
                                                v233 = v229;
                                                v30 = v311;
                                                *v310 = (id)objc_msgSend(v232, "initWithDomain:code:userInfo:", v233, 2, v231);

                                                v9 = v308;
                                                v253 = 0;
                                                v25 = 0;
                                              }
                                              else
                                              {
                                                v253 = 0;
                                              }
                                            }
LABEL_195:

                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v221 = v119;
                                              v222 = v49;
                                              v223 = (void *)MEMORY[0x1E0CB37E8];
                                              v224 = BMShareSheetFeedbackEngagementTypeFromString(v221);
                                              v225 = v223;
                                              v49 = v222;
                                              objc_msgSend(v225, "numberWithInt:", v224);
                                              v257 = (id)objc_claimAutoreleasedReturnValue();

                                              v116 = v306;
                                              goto LABEL_189;
                                            }
                                            if (v310)
                                            {
                                              v289 = v49;
                                              v234 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v235 = *MEMORY[0x1E0D025B8];
                                              v331 = *MEMORY[0x1E0CB2D50];
                                              v253 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("engagementType"));
                                              v332 = v253;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v332, &v331, 1);
                                              v236 = objc_claimAutoreleasedReturnValue();
                                              v237 = v234;
                                              v49 = v289;
                                              v254 = (void *)v236;
                                              v257 = 0;
                                              v25 = 0;
                                              *v310 = (id)objc_msgSend(v237, "initWithDomain:code:userInfo:", v235, 2);
                                              v30 = v311;
                                              v116 = v306;
                                              goto LABEL_195;
                                            }
                                            v257 = 0;
                                            v25 = 0;
                                            v30 = v311;
                                            v116 = v306;
                                          }
LABEL_196:

                                        }
LABEL_197:

                                      }
LABEL_198:

                                    }
LABEL_199:

                                  }
LABEL_200:

                                }
LABEL_201:

                              }
LABEL_202:

                            }
LABEL_203:

                          }
LABEL_204:

                        }
LABEL_205:

LABEL_206:
                        v96 = v295;
LABEL_207:

LABEL_208:
LABEL_209:

                        goto LABEL_210;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v306 = v98;
                        goto LABEL_95;
                      }
                      v116 = v310;
                      if (v310)
                      {
                        v279 = v49;
                        v140 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v141 = *MEMORY[0x1E0D025B8];
                        v351 = *MEMORY[0x1E0CB2D50];
                        v142 = v10;
                        v143 = v9;
                        v144 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v242 = objc_opt_class();
                        v145 = v144;
                        v9 = v143;
                        v10 = v142;
                        v74 = v300;
                        v293 = (id)objc_msgSend(v145, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v242, CFSTR("isAdaptedModelCreated"));
                        v352 = v293;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v352, &v351, 1);
                        v146 = objc_claimAutoreleasedReturnValue();
                        v147 = v140;
                        v49 = v279;
                        v292 = (void *)v146;
                        v148 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v141, 2);
                        v116 = 0;
                        v25 = 0;
                        v30 = v311;
                        *v310 = v148;
                        goto LABEL_205;
                      }
                      v25 = 0;
                    }
                    v30 = v311;
                    goto LABEL_206;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v49 = v74;
                    goto LABEL_86;
                  }
                  if (v35)
                  {
                    v120 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v121 = *MEMORY[0x1E0D025B8];
                    v357 = *MEMORY[0x1E0CB2D50];
                    v122 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v239 = objc_opt_class();
                    v123 = v122;
                    v9 = v304;
                    v301 = (id)objc_msgSend(v123, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), v239, CFSTR("modelSuggestionProxies"));
                    v358 = v301;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v358, &v357, 1);
                    v299 = (void *)objc_claimAutoreleasedReturnValue();
                    v124 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v121, 2);
                    v49 = 0;
                    v25 = 0;
                    v30 = v311;
                    *v310 = v124;

                    goto LABEL_209;
                  }
                  v49 = 0;
                  v25 = 0;
                  v30 = v311;
LABEL_210:

LABEL_211:
                  v14 = v37;
LABEL_212:

LABEL_213:
LABEL_214:

                  v11 = v309;
                  goto LABEL_215;
                }
              }
              v81 = v310;
              if (v310)
              {
                v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v83 = *MEMORY[0x1E0D025B8];
                v361 = *MEMORY[0x1E0CB2D50];
                v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("photoSuggestedContacts"));
                v362 = v74;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v362, &v361, 1);
                v301 = (id)objc_claimAutoreleasedReturnValue();
                v84 = (void *)objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, 2);
                v85 = v304;
                v10 = v70;
                v30 = v311;
LABEL_75:
                v25 = 0;
                *v81 = v84;
                v37 = v69;
                v15 = v302;
                v9 = v85;
                v49 = obj;
                goto LABEL_209;
              }
LABEL_79:
              v25 = 0;
              v49 = obj;
              v9 = v304;
              v10 = v70;
              v30 = v311;
              v14 = v69;
              v15 = v302;
              goto LABEL_212;
            }
            v38 = v36;
            v39 = *(_QWORD *)v326;
            v303 = v37;
LABEL_36:
            v40 = v12;
            v41 = 0;
            while (1)
            {
              if (*(_QWORD *)v326 != v39)
                objc_enumerationMutation(v15);
              v42 = *(void **)(*((_QWORD *)&v325 + 1) + 8 * v41);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                break;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v54 = *MEMORY[0x1E0D025B8];
                  v366 = *MEMORY[0x1E0CB2D50];
                  v316 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("locationUUIDs"));
                  v367 = v316;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v367, &v366, 1);
                  v55 = objc_claimAutoreleasedReturnValue();
                  v50 = v53;
                  v51 = v54;
                  v49 = (id)v55;
                  v52 = (id)v55;
                  goto LABEL_49;
                }
                goto LABEL_50;
              }
              v43 = v42;
              objc_msgSend(v320, "addObject:", v43);

              if (v38 == ++v41)
              {
                v38 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v325, v370, 16);
                v12 = v40;
                v37 = v303;
                v35 = a4;
                if (!v38)
                  goto LABEL_43;
                goto LABEL_36;
              }
            }
            if (a4)
            {
              v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v48 = *MEMORY[0x1E0D025B8];
              v368 = *MEMORY[0x1E0CB2D50];
              v316 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("locationUUIDs"));
              v369 = v316;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v369, &v368, 1);
              v49 = (id)objc_claimAutoreleasedReturnValue();
              v50 = v47;
              v51 = v48;
              v52 = v49;
LABEL_49:
              v9 = v304;
              v30 = v311;
              v25 = 0;
              *a4 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v52);
              obj = v15;
              v12 = v40;
              v14 = v303;
              goto LABEL_212;
            }
LABEL_50:
            v25 = 0;
            v14 = v303;
            v9 = v304;
            v30 = v311;
            v12 = v40;

            goto LABEL_214;
          }
          if (!v15)
          {
            v304 = v9;
            goto LABEL_33;
          }
          objc_opt_class();
          v12 = v13;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v304 = v9;
            v20 = v318;
            goto LABEL_34;
          }
          if (a4)
          {
            v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v76 = v9;
            v77 = *MEMORY[0x1E0D025B8];
            v371 = *MEMORY[0x1E0CB2D50];
            v320 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("locationUUIDs"));
            v372 = v320;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v372, &v371, 1);
            v78 = objc_claimAutoreleasedReturnValue();
            v79 = v77;
            v9 = v76;
            obja = (id)v78;
            v80 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v79, 2);
            v25 = 0;
            *a4 = v80;
            v30 = v311;

            goto LABEL_214;
          }
          v25 = 0;
          v30 = v311;
LABEL_215:
          a4 = v318;

          v6 = v313;
          goto LABEL_216;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          v14 = v12;
          goto LABEL_13;
        }
        if (a4)
        {
          v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v57 = v10;
          v58 = v9;
          v59 = *MEMORY[0x1E0D025B8];
          v373 = *MEMORY[0x1E0CB2D50];
          v60 = v12;
          v61 = objc_alloc(MEMORY[0x1E0CB3940]);
          v238 = objc_opt_class();
          v62 = v61;
          v12 = v60;
          v15 = (id)objc_msgSend(v62, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), v238, CFSTR("attachments"));
          v374 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v374, &v373, 1);
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = v59;
          v9 = v58;
          v10 = v57;
          v320 = (void *)v63;
          v65 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v64, 2);
          v14 = 0;
          v25 = 0;
          *a4 = v65;
          v30 = v311;
          goto LABEL_214;
        }
        v14 = 0;
        v25 = 0;
        v30 = v311;
LABEL_78:
        a4 = v318;
LABEL_216:

        self = v312;
        goto LABEL_217;
      }
      if (a4)
      {
        v319 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = *MEMORY[0x1E0D025B8];
        v375 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("extensionContextUUID"));
        v376 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v376, &v375, 1);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (id)objc_msgSend(v319, "initWithDomain:code:userInfo:", v32, 2, v33);
        v30 = 0;
        v25 = 0;
        *a4 = v34;
        v12 = (void *)v33;
        goto LABEL_78;
      }
      v30 = 0;
      v25 = 0;
      a4 = v318;
LABEL_217:

      goto LABEL_218;
    }
    if (a4)
    {
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v27 = *MEMORY[0x1E0D025B8];
      v377 = *MEMORY[0x1E0CB2D50];
      v28 = a4;
      v305 = v9;
      v29 = v18;
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("targetBundleID"));
      v378 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v378, &v377, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v11);
      a4 = 0;
      v25 = 0;
      *v28 = v31;
      self = v19;
      v10 = v29;
      v9 = v305;
      goto LABEL_217;
    }
    v25 = 0;
    v10 = v18;
LABEL_218:

    goto LABEL_219;
  }
  if (a4)
  {
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = a4;
    v23 = *MEMORY[0x1E0D025B8];
    v379 = *MEMORY[0x1E0CB2D50];
    a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("derivedIntentIdentifier"));
    v380[0] = a4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v380, &v379, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v23, 2, v10);
    v9 = 0;
    v25 = 0;
    *v22 = v24;
    goto LABEL_218;
  }
  v9 = 0;
  v25 = 0;
LABEL_219:

  return v25;
}

- (id)_locationUUIDsJSONArray
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
  -[BMShareSheetFeedback locationUUIDs](self, "locationUUIDs", 0);
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

- (id)_photoSuggestedContactsJSONArray
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
  -[BMShareSheetFeedback photoSuggestedContacts](self, "photoSuggestedContacts", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "base64EncodedStringWithOptions:", 0);
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
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
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
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  _QWORD v74[21];
  _QWORD v75[23];

  v75[21] = *MEMORY[0x1E0C80C00];
  -[BMShareSheetFeedback derivedIntentIdentifier](self, "derivedIntentIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback targetBundleID](self, "targetBundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback extensionContextUUID](self, "extensionContextUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback attachments](self, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = objc_claimAutoreleasedReturnValue();

  -[BMShareSheetFeedback _locationUUIDsJSONArray](self, "_locationUUIDsJSONArray");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback _photoSuggestedContactsJSONArray](self, "_photoSuggestedContactsJSONArray");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback modelSuggestionProxies](self, "modelSuggestionProxies");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
  v11 = objc_claimAutoreleasedReturnValue();

  -[BMShareSheetFeedback adaptedModelRecipeID](self, "adaptedModelRecipeID");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  if (-[BMShareSheetFeedback hasIsAdaptedModelUsed](self, "hasIsAdaptedModelUsed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMShareSheetFeedback isAdaptedModelUsed](self, "isAdaptedModelUsed"));
    v73 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMShareSheetFeedback hasIsAdaptedModelCreated](self, "hasIsAdaptedModelCreated"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMShareSheetFeedback isAdaptedModelCreated](self, "isAdaptedModelCreated"));
    v71 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v71 = 0;
  }
  -[BMShareSheetFeedback supportedBundleIDs](self, "supportedBundleIDs");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMShareSheetFeedback hasPeopleSuggestionsDisabled](self, "hasPeopleSuggestionsDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMShareSheetFeedback peopleSuggestionsDisabled](self, "peopleSuggestionsDisabled"));
    v69 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v69 = 0;
  }
  -[BMShareSheetFeedback reasonType](self, "reasonType");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback reason](self, "reason");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback sourceBundleID](self, "sourceBundleID");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMShareSheetFeedback transportBundleID](self, "transportBundleID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMShareSheetFeedback hasNumberOfVisibleSuggestions](self, "hasNumberOfVisibleSuggestions")
    || (-[BMShareSheetFeedback numberOfVisibleSuggestions](self, "numberOfVisibleSuggestions"), fabs(v12) == INFINITY))
  {
    v64 = 0;
  }
  else
  {
    -[BMShareSheetFeedback numberOfVisibleSuggestions](self, "numberOfVisibleSuggestions");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMShareSheetFeedback numberOfVisibleSuggestions](self, "numberOfVisibleSuggestions");
    objc_msgSend(v13, "numberWithDouble:");
    v64 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMShareSheetFeedback trackingID](self, "trackingID");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMShareSheetFeedback hasICloudFamilyInvocation](self, "hasICloudFamilyInvocation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMShareSheetFeedback iCloudFamilyInvocation](self, "iCloudFamilyInvocation"));
    v62 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v62 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMShareSheetFeedback engagementType](self, "engagementType"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMShareSheetFeedback hasIndexSelected](self, "hasIndexSelected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMShareSheetFeedback indexSelected](self, "indexSelected"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v74[0] = CFSTR("derivedIntentIdentifier");
  v15 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v15;
  v75[0] = v15;
  v74[1] = CFSTR("targetBundleID");
  v16 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v16;
  v75[1] = v16;
  v74[2] = CFSTR("extensionContextUUID");
  v17 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v17;
  v75[2] = v17;
  v74[3] = CFSTR("attachments");
  v18 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v18;
  v75[3] = v18;
  v74[4] = CFSTR("locationUUIDs");
  v19 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v19;
  v75[4] = v19;
  v74[5] = CFSTR("photoSuggestedContacts");
  v20 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v20;
  v75[5] = v20;
  v74[6] = CFSTR("modelSuggestionProxies");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v21;
  v75[6] = v21;
  v74[7] = CFSTR("adaptedModelRecipeID");
  v22 = (uint64_t)v72;
  if (!v72)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v75[7] = v22;
  v74[8] = CFSTR("isAdaptedModelUsed");
  v23 = (uint64_t)v73;
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v75[8] = v23;
  v74[9] = CFSTR("isAdaptedModelCreated");
  v24 = (uint64_t)v71;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v24;
  v75[9] = v24;
  v74[10] = CFSTR("supportedBundleIDs");
  v25 = (uint64_t)v70;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v4;
  v75[10] = v25;
  v74[11] = CFSTR("peopleSuggestionsDisabled");
  v26 = (uint64_t)v69;
  v27 = (void *)v25;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v9;
  v54 = (void *)v26;
  v75[11] = v26;
  v74[12] = CFSTR("reasonType");
  v28 = (uint64_t)v68;
  if (!v68)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v7;
  v75[12] = v28;
  v74[13] = CFSTR("reason");
  v29 = (uint64_t)v67;
  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v8;
  v40 = v29;
  v75[13] = v29;
  v74[14] = CFSTR("sourceBundleID");
  v30 = v66;
  if (!v66)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v23;
  v59 = (void *)v3;
  v75[14] = v30;
  v74[15] = CFSTR("transportBundleID");
  v31 = v65;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v5;
  v75[15] = v31;
  v74[16] = CFSTR("numberOfVisibleSuggestions");
  v32 = v64;
  if (!v64)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42 = v27;
  v44 = (void *)v22;
  v75[16] = v32;
  v74[17] = CFSTR("trackingID");
  v33 = v63;
  if (!v63)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v11;
  v75[17] = v33;
  v74[18] = CFSTR("iCloudFamilyInvocation");
  v35 = v62;
  if (!v62)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v28;
  v75[18] = v35;
  v74[19] = CFSTR("engagementType");
  v37 = v61;
  if (!v61)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v75[19] = v37;
  v74[20] = CFSTR("indexSelected");
  v38 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v75[20] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 21, v40);
  v52 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)

  if (!v61)
  if (!v62)

  if (!v63)
  if (!v64)

  if (!v65)
  if (!v66)

  if (!v67)
  if (!v68)

  if (!v69)
  if (!v70)

  if (!v71)
  if (!v73)

  if (v72)
  {
    if (v34)
      goto LABEL_89;
  }
  else
  {

    if (v34)
    {
LABEL_89:
      if (v56)
        goto LABEL_90;
      goto LABEL_98;
    }
  }

  if (v56)
  {
LABEL_90:
    if (v57)
      goto LABEL_91;
    goto LABEL_99;
  }
LABEL_98:

  if (v57)
  {
LABEL_91:
    if (v58)
      goto LABEL_92;
    goto LABEL_100;
  }
LABEL_99:

  if (v58)
  {
LABEL_92:
    if (v53)
      goto LABEL_93;
    goto LABEL_101;
  }
LABEL_100:

  if (v53)
  {
LABEL_93:
    if (v60)
      goto LABEL_94;
LABEL_102:

    if (v59)
      goto LABEL_95;
LABEL_103:

    goto LABEL_95;
  }
LABEL_101:

  if (!v60)
    goto LABEL_102;
LABEL_94:
  if (!v59)
    goto LABEL_103;
LABEL_95:

  return v52;
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
  int v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  int v97;
  int v98;
  int v99;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMShareSheetFeedback derivedIntentIdentifier](self, "derivedIntentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "derivedIntentIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMShareSheetFeedback derivedIntentIdentifier](self, "derivedIntentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "derivedIntentIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback targetBundleID](self, "targetBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetBundleID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMShareSheetFeedback targetBundleID](self, "targetBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "targetBundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback extensionContextUUID](self, "extensionContextUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionContextUUID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMShareSheetFeedback extensionContextUUID](self, "extensionContextUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "extensionContextUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback attachments](self, "attachments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachments");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMShareSheetFeedback attachments](self, "attachments");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachments");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback locationUUIDs](self, "locationUUIDs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationUUIDs");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMShareSheetFeedback locationUUIDs](self, "locationUUIDs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locationUUIDs");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback photoSuggestedContacts](self, "photoSuggestedContacts");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoSuggestedContacts");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMShareSheetFeedback photoSuggestedContacts](self, "photoSuggestedContacts");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "photoSuggestedContacts");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback modelSuggestionProxies](self, "modelSuggestionProxies");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelSuggestionProxies");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMShareSheetFeedback modelSuggestionProxies](self, "modelSuggestionProxies");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modelSuggestionProxies");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback adaptedModelRecipeID](self, "adaptedModelRecipeID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adaptedModelRecipeID");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMShareSheetFeedback adaptedModelRecipeID](self, "adaptedModelRecipeID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "adaptedModelRecipeID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_90;
    }
    if (-[BMShareSheetFeedback hasIsAdaptedModelUsed](self, "hasIsAdaptedModelUsed")
      || objc_msgSend(v5, "hasIsAdaptedModelUsed"))
    {
      if (!-[BMShareSheetFeedback hasIsAdaptedModelUsed](self, "hasIsAdaptedModelUsed"))
        goto LABEL_90;
      if (!objc_msgSend(v5, "hasIsAdaptedModelUsed"))
        goto LABEL_90;
      v55 = -[BMShareSheetFeedback isAdaptedModelUsed](self, "isAdaptedModelUsed");
      if (v55 != objc_msgSend(v5, "isAdaptedModelUsed"))
        goto LABEL_90;
    }
    if (-[BMShareSheetFeedback hasIsAdaptedModelCreated](self, "hasIsAdaptedModelCreated")
      || objc_msgSend(v5, "hasIsAdaptedModelCreated"))
    {
      if (!-[BMShareSheetFeedback hasIsAdaptedModelCreated](self, "hasIsAdaptedModelCreated"))
        goto LABEL_90;
      if (!objc_msgSend(v5, "hasIsAdaptedModelCreated"))
        goto LABEL_90;
      v56 = -[BMShareSheetFeedback isAdaptedModelCreated](self, "isAdaptedModelCreated");
      if (v56 != objc_msgSend(v5, "isAdaptedModelCreated"))
        goto LABEL_90;
    }
    -[BMShareSheetFeedback supportedBundleIDs](self, "supportedBundleIDs");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "supportedBundleIDs");
    v58 = objc_claimAutoreleasedReturnValue();
    if (v57 == (void *)v58)
    {

    }
    else
    {
      v59 = (void *)v58;
      -[BMShareSheetFeedback supportedBundleIDs](self, "supportedBundleIDs");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "supportedBundleIDs");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "isEqual:", v61);

      if (!v62)
        goto LABEL_90;
    }
    if (-[BMShareSheetFeedback hasPeopleSuggestionsDisabled](self, "hasPeopleSuggestionsDisabled")
      || objc_msgSend(v5, "hasPeopleSuggestionsDisabled"))
    {
      if (!-[BMShareSheetFeedback hasPeopleSuggestionsDisabled](self, "hasPeopleSuggestionsDisabled"))
        goto LABEL_90;
      if (!objc_msgSend(v5, "hasPeopleSuggestionsDisabled"))
        goto LABEL_90;
      v63 = -[BMShareSheetFeedback peopleSuggestionsDisabled](self, "peopleSuggestionsDisabled");
      if (v63 != objc_msgSend(v5, "peopleSuggestionsDisabled"))
        goto LABEL_90;
    }
    -[BMShareSheetFeedback reasonType](self, "reasonType");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonType");
    v65 = objc_claimAutoreleasedReturnValue();
    if (v64 == (void *)v65)
    {

    }
    else
    {
      v66 = (void *)v65;
      -[BMShareSheetFeedback reasonType](self, "reasonType");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonType");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v67, "isEqual:", v68);

      if (!v69)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback reason](self, "reason");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reason");
    v71 = objc_claimAutoreleasedReturnValue();
    if (v70 == (void *)v71)
    {

    }
    else
    {
      v72 = (void *)v71;
      -[BMShareSheetFeedback reason](self, "reason");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reason");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v73, "isEqual:", v74);

      if (!v75)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback sourceBundleID](self, "sourceBundleID");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleID");
    v77 = objc_claimAutoreleasedReturnValue();
    if (v76 == (void *)v77)
    {

    }
    else
    {
      v78 = (void *)v77;
      -[BMShareSheetFeedback sourceBundleID](self, "sourceBundleID");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceBundleID");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v79, "isEqual:", v80);

      if (!v81)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback transportBundleID](self, "transportBundleID");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transportBundleID");
    v83 = objc_claimAutoreleasedReturnValue();
    if (v82 == (void *)v83)
    {

    }
    else
    {
      v84 = (void *)v83;
      -[BMShareSheetFeedback transportBundleID](self, "transportBundleID");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transportBundleID");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v85, "isEqual:", v86);

      if (!v87)
        goto LABEL_90;
    }
    if (-[BMShareSheetFeedback hasNumberOfVisibleSuggestions](self, "hasNumberOfVisibleSuggestions")
      || objc_msgSend(v5, "hasNumberOfVisibleSuggestions"))
    {
      if (!-[BMShareSheetFeedback hasNumberOfVisibleSuggestions](self, "hasNumberOfVisibleSuggestions"))
        goto LABEL_90;
      if (!objc_msgSend(v5, "hasNumberOfVisibleSuggestions"))
        goto LABEL_90;
      -[BMShareSheetFeedback numberOfVisibleSuggestions](self, "numberOfVisibleSuggestions");
      v89 = v88;
      objc_msgSend(v5, "numberOfVisibleSuggestions");
      if (v89 != v90)
        goto LABEL_90;
    }
    -[BMShareSheetFeedback trackingID](self, "trackingID");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackingID");
    v92 = objc_claimAutoreleasedReturnValue();
    if (v91 == (void *)v92)
    {

    }
    else
    {
      v93 = (void *)v92;
      -[BMShareSheetFeedback trackingID](self, "trackingID");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trackingID");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v94, "isEqual:", v95);

      if (!v96)
        goto LABEL_90;
    }
    if (!-[BMShareSheetFeedback hasICloudFamilyInvocation](self, "hasICloudFamilyInvocation")
      && !objc_msgSend(v5, "hasICloudFamilyInvocation")
      || -[BMShareSheetFeedback hasICloudFamilyInvocation](self, "hasICloudFamilyInvocation")
      && objc_msgSend(v5, "hasICloudFamilyInvocation")
      && (v97 = -[BMShareSheetFeedback iCloudFamilyInvocation](self, "iCloudFamilyInvocation"),
          v97 == objc_msgSend(v5, "iCloudFamilyInvocation")))
    {
      v98 = -[BMShareSheetFeedback engagementType](self, "engagementType");
      if (v98 == objc_msgSend(v5, "engagementType"))
      {
        if (!-[BMShareSheetFeedback hasIndexSelected](self, "hasIndexSelected")
          && !objc_msgSend(v5, "hasIndexSelected"))
        {
          v12 = 1;
          goto LABEL_91;
        }
        if (-[BMShareSheetFeedback hasIndexSelected](self, "hasIndexSelected")
          && objc_msgSend(v5, "hasIndexSelected"))
        {
          v99 = -[BMShareSheetFeedback indexSelected](self, "indexSelected");
          v12 = v99 == objc_msgSend(v5, "indexSelected");
LABEL_91:

          goto LABEL_92;
        }
      }
    }
LABEL_90:
    v12 = 0;
    goto LABEL_91;
  }
  v12 = 0;
LABEL_92:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (NSString)targetBundleID
{
  return self->_targetBundleID;
}

- (NSString)extensionContextUUID
{
  return self->_extensionContextUUID;
}

- (NSData)attachments
{
  return self->_attachments;
}

- (NSArray)locationUUIDs
{
  return self->_locationUUIDs;
}

- (NSArray)photoSuggestedContacts
{
  return self->_photoSuggestedContacts;
}

- (NSData)modelSuggestionProxies
{
  return self->_modelSuggestionProxies;
}

- (NSString)adaptedModelRecipeID
{
  return self->_adaptedModelRecipeID;
}

- (BOOL)isAdaptedModelUsed
{
  return self->_isAdaptedModelUsed;
}

- (BOOL)hasIsAdaptedModelUsed
{
  return self->_hasIsAdaptedModelUsed;
}

- (void)setHasIsAdaptedModelUsed:(BOOL)a3
{
  self->_hasIsAdaptedModelUsed = a3;
}

- (BOOL)isAdaptedModelCreated
{
  return self->_isAdaptedModelCreated;
}

- (BOOL)hasIsAdaptedModelCreated
{
  return self->_hasIsAdaptedModelCreated;
}

- (void)setHasIsAdaptedModelCreated:(BOOL)a3
{
  self->_hasIsAdaptedModelCreated = a3;
}

- (NSString)supportedBundleIDs
{
  return self->_supportedBundleIDs;
}

- (int)peopleSuggestionsDisabled
{
  return self->_peopleSuggestionsDisabled;
}

- (BOOL)hasPeopleSuggestionsDisabled
{
  return self->_hasPeopleSuggestionsDisabled;
}

- (void)setHasPeopleSuggestionsDisabled:(BOOL)a3
{
  self->_hasPeopleSuggestionsDisabled = a3;
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)transportBundleID
{
  return self->_transportBundleID;
}

- (double)numberOfVisibleSuggestions
{
  return self->_numberOfVisibleSuggestions;
}

- (BOOL)hasNumberOfVisibleSuggestions
{
  return self->_hasNumberOfVisibleSuggestions;
}

- (void)setHasNumberOfVisibleSuggestions:(BOOL)a3
{
  self->_hasNumberOfVisibleSuggestions = a3;
}

- (NSString)trackingID
{
  return self->_trackingID;
}

- (BOOL)iCloudFamilyInvocation
{
  return self->_iCloudFamilyInvocation;
}

- (BOOL)hasICloudFamilyInvocation
{
  return self->_hasICloudFamilyInvocation;
}

- (void)setHasICloudFamilyInvocation:(BOOL)a3
{
  self->_hasICloudFamilyInvocation = a3;
}

- (int)engagementType
{
  return self->_engagementType;
}

- (int)indexSelected
{
  return self->_indexSelected;
}

- (BOOL)hasIndexSelected
{
  return self->_hasIndexSelected;
}

- (void)setHasIndexSelected:(BOOL)a3
{
  self->_hasIndexSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingID, 0);
  objc_storeStrong((id *)&self->_transportBundleID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
  objc_storeStrong((id *)&self->_supportedBundleIDs, 0);
  objc_storeStrong((id *)&self->_adaptedModelRecipeID, 0);
  objc_storeStrong((id *)&self->_modelSuggestionProxies, 0);
  objc_storeStrong((id *)&self->_photoSuggestedContacts, 0);
  objc_storeStrong((id *)&self->_locationUUIDs, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_extensionContextUUID, 0);
  objc_storeStrong((id *)&self->_targetBundleID, 0);
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
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

    v4 = -[BMShareSheetFeedback initByReadFrom:]([BMShareSheetFeedback alloc], "initByReadFrom:", v7);
    v4[7] = 0;

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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[23];

  v25[21] = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("derivedIntentIdentifier"), 2, 0, 1, 13, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("targetBundleID"), 2, 0, 2, 13, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("extensionContextUUID"), 2, 0, 3, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("attachments"), 4, 0, 4, 14, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("locationUUIDs_json"), 5, 1, &__block_literal_global_85_39972);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("photoSuggestedContacts_json"), 5, 1, &__block_literal_global_86);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modelSuggestionProxies"), 4, 0, 7, 14, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("adaptedModelRecipeID"), 2, 0, 8, 13, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isAdaptedModelUsed"), 0, 0, 9, 12, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isAdaptedModelCreated"), 0, 0, 10, 12, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("supportedBundleIDs"), 2, 0, 11, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("peopleSuggestionsDisabled"), 0, 0, 12, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reasonType"), 2, 0, 13, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reason"), 2, 0, 14, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceBundleID"), 2, 0, 15, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("transportBundleID"), 2, 0, 16, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberOfVisibleSuggestions"), 1, 0, 17, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("trackingID"), 2, 0, 18, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("iCloudFamilyInvocation"), 0, 0, 19, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("engagementType"), 0, 0, 20, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("indexSelected"), 0, 0, 21, 2, 0);
  v25[0] = v24;
  v25[1] = v23;
  v25[2] = v22;
  v25[3] = v13;
  v25[4] = v21;
  v25[5] = v20;
  v25[6] = v19;
  v25[7] = v18;
  v25[8] = v17;
  v25[9] = v16;
  v25[10] = v15;
  v25[11] = v2;
  v25[12] = v3;
  v25[13] = v14;
  v25[14] = v4;
  v25[15] = v5;
  v25[16] = v6;
  v25[17] = v7;
  v25[18] = v12;
  v25[19] = v8;
  v25[20] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 21);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D038;
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
  _QWORD v25[23];

  v25[21] = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("derivedIntentIdentifier"), 1, 13, 0);
  v25[0] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("targetBundleID"), 2, 13, 0);
  v25[1] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("extensionContextUUID"), 3, 13, 0);
  v25[2] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("attachments"), 4, 14, 0);
  v25[3] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locationUUIDs"), 5, 13, 0);
  v25[4] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoSuggestedContacts"), 6, 14, 0);
  v25[5] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modelSuggestionProxies"), 7, 14, 0);
  v25[6] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("adaptedModelRecipeID"), 8, 13, 0);
  v25[7] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isAdaptedModelUsed"), 9, 12, 0);
  v25[8] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isAdaptedModelCreated"), 10, 12, 0);
  v25[9] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("supportedBundleIDs"), 11, 13, 0);
  v25[10] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("peopleSuggestionsDisabled"), 12, 2, 0);
  v25[11] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reasonType"), 13, 13, 0);
  v25[12] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reason"), 14, 13, 0);
  v25[13] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceBundleID"), 15, 13, 0);
  v25[14] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("transportBundleID"), 16, 13, 0);
  v25[15] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberOfVisibleSuggestions"), 17, 0, 0);
  v25[16] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trackingID"), 18, 13, 0);
  v25[17] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("iCloudFamilyInvocation"), 19, 12, 0);
  v25[18] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("engagementType"), 20, 4, 0);
  v25[19] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("indexSelected"), 21, 2, 0);
  v25[20] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __31__BMShareSheetFeedback_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_photoSuggestedContactsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __31__BMShareSheetFeedback_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_locationUUIDsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
