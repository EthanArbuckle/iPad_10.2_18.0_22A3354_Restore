@implementation BMMailCategorization

- (BMMailCategorization)initWithMessageId:(id)a3 eventType:(id)a4 trialExperimentId:(id)a5 trialExperimentDeploymentId:(id)a6 trialExperimentTreatmentId:(id)a7 trialRolloutId:(id)a8 trialRolloutDeploymentId:(id)a9 trialRolloutFactorPackId:(id)a10 predictedCategory:(int)a11 blackPearlModelVersion:(id)a12 blackPearlSenderModelVersion:(id)a13 blackPearlFinalRuleVersion:(id)a14 blackPearlBreakthroughVersion:(id)a15 reasonCodes:(id)a16 currMailbox:(int)a17 prevMailbox:(int)a18 isBreakthrough:(id)a19 isBlackPearlEnabled:(id)a20 elapsedTimeSinceEmailReceived:(id)a21 recategorizationBy:(int)a22 isThread:(id)a23
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  LODWORD(v26) = 0;
  LODWORD(v25) = a22;
  LODWORD(v24) = a11;
  return -[BMMailCategorization initWithMessageId:eventType:trialExperimentId:trialExperimentDeploymentId:trialExperimentTreatmentId:trialRolloutId:trialRolloutDeploymentId:trialRolloutFactorPackId:predictedCategory:blackPearlModelVersion:blackPearlSenderModelVersion:blackPearlFinalRuleVersion:blackPearlBreakthroughVersion:reasonCodes:currCategoryView:prevCategoryView:isBreakthrough:isBlackPearlEnabled:elapsedTimeSinceEmailReceived:recategorizationBy:isThread:senderId:receivingAccountDomain:hasIcloudAccountEnabled:](self, "initWithMessageId:eventType:trialExperimentId:trialExperimentDeploymentId:trialExperimentTreatmentId:trialRolloutId:trialRolloutDeploymentId:trialRolloutFactorPackId:predictedCategory:blackPearlModelVersion:blackPearlSenderModelVersion:blackPearlFinalRuleVersion:blackPearlBreakthroughVersion:reasonCodes:currCategoryView:prevCategoryView:isBreakthrough:isBlackPearlEnabled:elapsedTimeSinceEmailReceived:recategorizationBy:isThread:senderId:receivingAccountDomain:hasIcloudAccountEnabled:", a3, a4, a5, a6, a7, a8, a9, a10, v24, a12, a13, a14, a15,
           a16,
           __PAIR64__(a18, a17),
           a19,
           a20,
           a21,
           v25,
           a23,
           0,
           v26,
           0);
}

- (BMMailCategorization)initWithMessageId:(id)a3 eventType:(id)a4 trialExperimentId:(id)a5 trialExperimentDeploymentId:(id)a6 trialExperimentTreatmentId:(id)a7 trialRolloutId:(id)a8 trialRolloutDeploymentId:(id)a9 trialRolloutFactorPackId:(id)a10 predictedCategory:(int)a11 blackPearlModelVersion:(id)a12 blackPearlSenderModelVersion:(id)a13 blackPearlFinalRuleVersion:(id)a14 blackPearlBreakthroughVersion:(id)a15 reasonCodes:(id)a16 currCategoryView:(int)a17 prevCategoryView:(int)a18 isBreakthrough:(id)a19 isBlackPearlEnabled:(id)a20 elapsedTimeSinceEmailReceived:(id)a21 recategorizationBy:(int)a22 isThread:(id)a23 senderId:(id)a24 receivingAccountDomain:(int)a25 hasIcloudAccountEnabled:(id)a26
{
  id v31;
  id v32;
  id v33;
  id v34;
  BMMailCategorization *v35;
  id v38;
  id v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
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
  objc_super v56;

  v55 = a3;
  v54 = a4;
  v53 = a5;
  v52 = a6;
  v38 = a7;
  v51 = a7;
  v39 = a8;
  v50 = a8;
  v49 = a9;
  v48 = a10;
  v47 = a12;
  v46 = a13;
  v45 = a14;
  v44 = a15;
  v43 = a16;
  v31 = a19;
  v32 = a20;
  v42 = a21;
  v33 = a23;
  v41 = a24;
  v34 = a26;
  v56.receiver = self;
  v56.super_class = (Class)BMMailCategorization;
  v35 = -[BMEventBase init](&v56, sel_init);
  if (v35)
  {
    v35->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v35->_messageId, a3);
    objc_storeStrong((id *)&v35->_eventType, a4);
    objc_storeStrong((id *)&v35->_trialExperimentId, a5);
    objc_storeStrong((id *)&v35->_trialExperimentDeploymentId, a6);
    objc_storeStrong((id *)&v35->_trialExperimentTreatmentId, v38);
    objc_storeStrong((id *)&v35->_trialRolloutId, v39);
    objc_storeStrong((id *)&v35->_trialRolloutDeploymentId, a9);
    objc_storeStrong((id *)&v35->_trialRolloutFactorPackId, a10);
    v35->_predictedCategory = a11;
    objc_storeStrong((id *)&v35->_blackPearlModelVersion, a12);
    objc_storeStrong((id *)&v35->_blackPearlSenderModelVersion, a13);
    objc_storeStrong((id *)&v35->_blackPearlFinalRuleVersion, a14);
    objc_storeStrong((id *)&v35->_blackPearlBreakthroughVersion, a15);
    objc_storeStrong((id *)&v35->_reasonCodes, a16);
    v35->_currCategoryView = a17;
    v35->_prevCategoryView = a18;
    if (v31)
    {
      v35->_hasIsBreakthrough = 1;
      v35->_isBreakthrough = objc_msgSend(v31, "BOOLValue");
    }
    else
    {
      v35->_hasIsBreakthrough = 0;
      v35->_isBreakthrough = 0;
    }
    if (v32)
    {
      v35->_hasIsBlackPearlEnabled = 1;
      v35->_isBlackPearlEnabled = objc_msgSend(v32, "BOOLValue");
    }
    else
    {
      v35->_hasIsBlackPearlEnabled = 0;
      v35->_isBlackPearlEnabled = 0;
    }
    objc_storeStrong((id *)&v35->_elapsedTimeSinceEmailReceived, a21);
    v35->_recategorizationBy = a22;
    if (v33)
    {
      v35->_hasIsThread = 1;
      v35->_isThread = objc_msgSend(v33, "BOOLValue");
    }
    else
    {
      v35->_hasIsThread = 0;
      v35->_isThread = 0;
    }
    objc_storeStrong((id *)&v35->_senderId, a24);
    v35->_receivingAccountDomain = a25;
    if (v34)
    {
      v35->_hasHasIcloudAccountEnabled = 1;
      v35->_hasIcloudAccountEnabled = objc_msgSend(v34, "BOOLValue");
    }
    else
    {
      v35->_hasHasIcloudAccountEnabled = 0;
      v35->_hasIcloudAccountEnabled = 0;
    }
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMailCategorization messageId](self, "messageId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization eventType](self, "eventType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialExperimentId](self, "trialExperimentId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialExperimentDeploymentId](self, "trialExperimentDeploymentId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialExperimentTreatmentId](self, "trialExperimentTreatmentId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialRolloutId](self, "trialRolloutId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialRolloutDeploymentId](self, "trialRolloutDeploymentId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialRolloutFactorPackId](self, "trialRolloutFactorPackId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BMMailCategorizationCategoryAsString(-[BMMailCategorization predictedCategory](self, "predictedCategory"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization blackPearlModelVersion](self, "blackPearlModelVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization blackPearlSenderModelVersion](self, "blackPearlSenderModelVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization blackPearlFinalRuleVersion](self, "blackPearlFinalRuleVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization blackPearlBreakthroughVersion](self, "blackPearlBreakthroughVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization reasonCodes](self, "reasonCodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BMMailCategorizationMailboxTypeAsString(-[BMMailCategorization currCategoryView](self, "currCategoryView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BMMailCategorizationMailboxTypeAsString(-[BMMailCategorization prevCategoryView](self, "prevCategoryView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMailCategorization isBreakthrough](self, "isBreakthrough"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMailCategorization isBlackPearlEnabled](self, "isBlackPearlEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization elapsedTimeSinceEmailReceived](self, "elapsedTimeSinceEmailReceived");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMMailCategorizationByTypeAsString(-[BMMailCategorization recategorizationBy](self, "recategorizationBy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMailCategorization isThread](self, "isThread"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization senderId](self, "senderId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMMailCategorizationDomainAsString(-[BMMailCategorization receivingAccountDomain](self, "receivingAccountDomain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMailCategorization hasIcloudAccountEnabled](self, "hasIcloudAccountEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("BMMailCategorization with messageId: %@, eventType: %@, trialExperimentId: %@, trialExperimentDeploymentId: %@, trialExperimentTreatmentId: %@, trialRolloutId: %@, trialRolloutDeploymentId: %@, trialRolloutFactorPackId: %@, predictedCategory: %@, blackPearlModelVersion: %@, blackPearlSenderModelVersion: %@, blackPearlFinalRuleVersion: %@, blackPearlBreakthroughVersion: %@, reasonCodes: %@, currCategoryView: %@, prevCategoryView: %@, isBreakthrough: %@, isBlackPearlEnabled: %@, elapsedTimeSinceEmailReceived: %@, recategorizationBy: %@, isThread: %@, senderId: %@, receivingAccountDomain: %@, hasIcloudAccountEnabled: %@"), v29, v26, v28, v25, v27, v23, v24, v17, v22, v16, v21, v15, v20, v14, v12, v13,
                  v11,
                  v10,
                  v3,
                  v9,
                  v4,
                  v5,
                  v6,
                  v7);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMailCategorization *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  void *v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  BMMailCategorization *v75;
  objc_super v77;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)BMMailCategorization;
  v5 = -[BMEventBase init](&v77, sel_init);
  if (!v5)
    goto LABEL_152;
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
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_86;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
          goto LABEL_86;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
          goto LABEL_86;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 72;
          goto LABEL_86;
        case 5u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 80;
          goto LABEL_86;
        case 6u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 88;
          goto LABEL_86;
        case 7u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 96;
          goto LABEL_86;
        case 8u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 104;
          goto LABEL_86;
        case 9u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (2)
          {
            v24 = *v6;
            v25 = *(_QWORD *)&v4[v24];
            if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
              *(_QWORD *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_104;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_104:
          if (v23 >= 7)
            LODWORD(v23) = 0;
          v72 = 28;
          goto LABEL_143;
        case 0xAu:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 112;
          goto LABEL_86;
        case 0xBu:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 120;
          goto LABEL_86;
        case 0xCu:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 128;
          goto LABEL_86;
        case 0xDu:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 136;
          goto LABEL_86;
        case 0xEu:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 144;
          goto LABEL_86;
        case 0xFu:
          v27 = 0;
          v28 = 0;
          v23 = 0;
          while (2)
          {
            v29 = *v6;
            v30 = *(_QWORD *)&v4[v29];
            if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
              *(_QWORD *)&v4[v29] = v30 + 1;
              v23 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_110;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_110:
          if (v23 >= 8)
            LODWORD(v23) = 0;
          v72 = 32;
          goto LABEL_143;
        case 0x10u:
          v32 = 0;
          v33 = 0;
          v23 = 0;
          while (2)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
              *(_QWORD *)&v4[v34] = v35 + 1;
              v23 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v16 = v33++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_116:
          if (v23 >= 8)
            LODWORD(v23) = 0;
          v72 = 36;
          goto LABEL_143;
        case 0x11u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v5->_hasIsBreakthrough = 1;
          while (2)
          {
            v40 = *v6;
            v41 = *(_QWORD *)&v4[v40];
            if (v41 == -1 || v41 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
              *(_QWORD *)&v4[v40] = v41 + 1;
              v39 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                v16 = v38++ >= 9;
                if (v16)
                {
                  v39 = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v39 = 0;
LABEL_122:
          v73 = v39 != 0;
          v74 = 16;
          goto LABEL_148;
        case 0x12u:
          v43 = 0;
          v44 = 0;
          v45 = 0;
          v5->_hasIsBlackPearlEnabled = 1;
          while (2)
          {
            v46 = *v6;
            v47 = *(_QWORD *)&v4[v46];
            if (v47 == -1 || v47 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v47);
              *(_QWORD *)&v4[v46] = v47 + 1;
              v45 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v16 = v44++ >= 9;
                if (v16)
                {
                  v45 = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v45 = 0;
LABEL_126:
          v73 = v45 != 0;
          v74 = 18;
          goto LABEL_148;
        case 0x13u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 152;
          goto LABEL_86;
        case 0x14u:
          v49 = 0;
          v50 = 0;
          v23 = 0;
          while (2)
          {
            v51 = *v6;
            v52 = *(_QWORD *)&v4[v51];
            if (v52 == -1 || v52 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v52);
              *(_QWORD *)&v4[v51] = v52 + 1;
              v23 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                v16 = v50++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_130:
          if (v23 >= 7)
            LODWORD(v23) = 0;
          v72 = 40;
          goto LABEL_143;
        case 0x15u:
          v54 = 0;
          v55 = 0;
          v56 = 0;
          v5->_hasIsThread = 1;
          while (2)
          {
            v57 = *v6;
            v58 = *(_QWORD *)&v4[v57];
            if (v58 == -1 || v58 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v59 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v58);
              *(_QWORD *)&v4[v57] = v58 + 1;
              v56 |= (unint64_t)(v59 & 0x7F) << v54;
              if (v59 < 0)
              {
                v54 += 7;
                v16 = v55++ >= 9;
                if (v16)
                {
                  v56 = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v56 = 0;
LABEL_136:
          v73 = v56 != 0;
          v74 = 20;
          goto LABEL_148;
        case 0x16u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 160;
LABEL_86:
          v60 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 0x17u:
          v61 = 0;
          v62 = 0;
          v23 = 0;
          while (2)
          {
            v63 = *v6;
            v64 = *(_QWORD *)&v4[v63];
            if (v64 == -1 || v64 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v65 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v64);
              *(_QWORD *)&v4[v63] = v64 + 1;
              v23 |= (unint64_t)(v65 & 0x7F) << v61;
              if (v65 < 0)
              {
                v61 += 7;
                v16 = v62++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_140:
          if (v23 >= 9)
            LODWORD(v23) = 0;
          v72 = 44;
LABEL_143:
          *(_DWORD *)((char *)&v5->super.super.isa + v72) = v23;
          continue;
        case 0x18u:
          v66 = 0;
          v67 = 0;
          v68 = 0;
          v5->_hasHasIcloudAccountEnabled = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_151;
          continue;
      }
      while (1)
      {
        v69 = *v6;
        v70 = *(_QWORD *)&v4[v69];
        if (v70 == -1 || v70 >= *(_QWORD *)&v4[*v7])
          break;
        v71 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v70);
        *(_QWORD *)&v4[v69] = v70 + 1;
        v68 |= (unint64_t)(v71 & 0x7F) << v66;
        if ((v71 & 0x80) == 0)
          goto LABEL_145;
        v66 += 7;
        v16 = v67++ >= 9;
        if (v16)
        {
          v68 = 0;
          goto LABEL_147;
        }
      }
      v4[*v8] = 1;
LABEL_145:
      if (v4[*v8])
        v68 = 0;
LABEL_147:
      v73 = v68 != 0;
      v74 = 22;
LABEL_148:
      *((_BYTE *)&v5->super.super.isa + v74) = v73;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_151:
    v75 = 0;
  else
LABEL_152:
    v75 = v5;

  return v75;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_messageId)
    PBDataWriterWriteStringField();
  if (self->_eventType)
    PBDataWriterWriteStringField();
  if (self->_trialExperimentId)
    PBDataWriterWriteStringField();
  if (self->_trialExperimentDeploymentId)
    PBDataWriterWriteStringField();
  if (self->_trialExperimentTreatmentId)
    PBDataWriterWriteStringField();
  if (self->_trialRolloutId)
    PBDataWriterWriteStringField();
  if (self->_trialRolloutDeploymentId)
    PBDataWriterWriteStringField();
  if (self->_trialRolloutFactorPackId)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_blackPearlModelVersion)
    PBDataWriterWriteStringField();
  if (self->_blackPearlSenderModelVersion)
    PBDataWriterWriteStringField();
  if (self->_blackPearlFinalRuleVersion)
    PBDataWriterWriteStringField();
  if (self->_blackPearlBreakthroughVersion)
    PBDataWriterWriteStringField();
  if (self->_reasonCodes)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsBreakthrough)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsBlackPearlEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_elapsedTimeSinceEmailReceived)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsThread)
    PBDataWriterWriteBOOLField();
  if (self->_senderId)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasHasIcloudAccountEnabled)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMailCategorization writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMailCategorization)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  BMMailCategorization *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  id *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  id v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  id v102;
  uint64_t v103;
  id v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  void *v110;
  id v111;
  uint64_t v112;
  id v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  id v122;
  void *v123;
  id v124;
  id v125;
  uint64_t v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  BMMailCategorization *v131;
  id v132;
  int v133;
  unsigned int v134;
  unsigned int v135;
  int v136;
  void *v137;
  id v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  uint64_t v144;
  id v145;
  uint64_t v146;
  id v147;
  id v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  id v163;
  id v164;
  id v165;
  id v166;
  void *v167;
  id v168;
  void *v169;
  void *v170;
  id v171;
  id v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  uint64_t v177;
  void *v178;
  id v179;
  void *v180;
  id v181;
  id *v182;
  void *v183;
  id v184;
  id v185;
  id v186;
  id v187;
  void *v188;
  id v189;
  void *v190;
  id v191;
  id v192;
  void *v193;
  id v194;
  id v195;
  void *v196;
  id v197;
  void *v198;
  id v199;
  id v200;
  id *v201;
  void *v202;
  void *v203;
  void *v204;
  id v205;
  id v206;
  id v207;
  void *v208;
  id v209;
  id v210;
  void *v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  void *v216;
  uint64_t v217;
  id v218;
  uint64_t v219;
  id v220;
  uint64_t v221;
  id v222;
  uint64_t v223;
  id v224;
  uint64_t v225;
  id v226;
  uint64_t v227;
  id v228;
  uint64_t v229;
  id v230;
  uint64_t v231;
  id v232;
  uint64_t v233;
  id v234;
  uint64_t v235;
  id v236;
  uint64_t v237;
  id v238;
  uint64_t v239;
  id *v240;
  uint64_t v241;
  id v242;
  uint64_t v243;
  id v244;
  uint64_t v245;
  id v246;
  uint64_t v247;
  id v248;
  uint64_t v249;
  id v250;
  uint64_t v251;
  id v252;
  uint64_t v253;
  id v254;
  uint64_t v255;
  id v256;
  uint64_t v257;
  id v258;
  uint64_t v259;
  _QWORD v260[3];

  v260[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messageId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
LABEL_7:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trialExperimentId"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v209 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v209 = v10;
LABEL_10:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trialExperimentDeploymentId"));
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = v6;
        if (!v212 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v207 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v207 = v212;
LABEL_13:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trialExperimentTreatmentId"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v208 = v11;
          v201 = a4;
          if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v205 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v205 = v11;
LABEL_16:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trialRolloutId"));
            v12 = objc_claimAutoreleasedReturnValue();
            v203 = (void *)v12;
            if (!v12 || (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v200 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v200 = v13;
LABEL_19:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trialRolloutDeploymentId"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v197 = v7;
              v198 = v10;
              if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v199 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v199 = v14;
LABEL_22:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trialRolloutFactorPackId"));
                v15 = objc_claimAutoreleasedReturnValue();
                v190 = (void *)v15;
                if (!v15 || (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v194 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v194 = v16;
LABEL_25:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("predictedCategory"));
                  v17 = objc_claimAutoreleasedReturnValue();
                  v191 = v9;
                  v188 = (void *)v17;
                  if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v189 = 0;
                    goto LABEL_68;
                  }
                  v38 = v14;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v189 = v18;
LABEL_67:

LABEL_68:
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blackPearlModelVersion"));
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v58 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v187 = 0;
                      goto LABEL_71;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v187 = v58;
LABEL_71:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blackPearlSenderModelVersion"));
                      v193 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v193 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v186 = 0;
                        goto LABEL_74;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v186 = v193;
LABEL_74:
                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blackPearlFinalRuleVersion"));
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v59 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v182 = 0;
                          goto LABEL_77;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v182 = v59;
LABEL_77:
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blackPearlBreakthroughVersion"));
                          v60 = objc_claimAutoreleasedReturnValue();
                          v180 = v58;
                          v183 = (void *)v60;
                          if (!v60 || (v61 = (void *)v60, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v185 = 0;
                            goto LABEL_80;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v185 = v61;
LABEL_80:
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reasonCodes"));
                            v62 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v62 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v181 = 0;
                              goto LABEL_83;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v181 = v62;
LABEL_83:
                              v173 = v62;
                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currCategoryView"));
                              v63 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v63)
                              {
                                v64 = v63;

                              }
                              else
                              {
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currMailbox"));
                                v64 = (id)objc_claimAutoreleasedReturnValue();

                                if (!v64)
                                {
                                  v175 = 0;
                                  goto LABEL_120;
                                }
                              }
                              objc_opt_class();
                              v175 = v64;
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v179 = v64;
                                }
                                else
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v201)
                                    {
                                      v179 = 0;
                                      v22 = 0;
                                      v54 = v190;
                                      v69 = v182;
                                      v76 = v173;
                                      goto LABEL_212;
                                    }
                                    v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v99 = *MEMORY[0x1E0D025B8];
                                    v231 = *MEMORY[0x1E0CB2D50];
                                    v174 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("currCategoryView"));
                                    v232 = v174;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v232, &v231, 1);
                                    v100 = objc_claimAutoreleasedReturnValue();
                                    v179 = 0;
                                    v22 = 0;
                                    *v201 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v99, 2, v100);
                                    v54 = v190;
                                    v69 = v182;
                                    v84 = (id)v100;
                                    goto LABEL_239;
                                  }
                                  v77 = v64;
                                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMailCategorizationMailboxTypeFromString(v77));
                                  v179 = (id)objc_claimAutoreleasedReturnValue();

                                }
LABEL_121:
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("prevCategoryView"));
                                v83 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v83)
                                {
                                  v84 = v83;

                                }
                                else
                                {
                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("prevMailbox"));
                                  v84 = (id)objc_claimAutoreleasedReturnValue();

                                  if (!v84)
                                  {
                                    v176 = 0;
                                    goto LABEL_134;
                                  }
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v176 = v84;
LABEL_134:
                                  v174 = 0;
                                  goto LABEL_135;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v174 = v84;
LABEL_130:
                                  v176 = v84;

LABEL_135:
                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isBreakthrough"));
                                  v86 = objc_claimAutoreleasedReturnValue();
                                  v170 = (void *)v86;
                                  if (v86 && (v87 = (void *)v86, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (!v201)
                                      {
                                        v172 = 0;
                                        v22 = 0;
                                        v54 = v190;
                                        v84 = v176;
                                        v69 = v182;
                                        v76 = v173;
                                        goto LABEL_209;
                                      }
                                      v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v95 = *MEMORY[0x1E0D025B8];
                                      v227 = *MEMORY[0x1E0CB2D50];
                                      v96 = objc_alloc(MEMORY[0x1E0CB3940]);
                                      v151 = objc_opt_class();
                                      v97 = v96;
                                      v11 = v208;
                                      v171 = (id)objc_msgSend(v97, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v151, CFSTR("isBreakthrough"));
                                      v228 = v171;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v228, &v227, 1);
                                      v169 = (void *)objc_claimAutoreleasedReturnValue();
                                      v172 = 0;
                                      v22 = 0;
                                      *v201 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v95, 2);
                                      v54 = v190;
                                      goto LABEL_235;
                                    }
                                    v172 = v87;
                                  }
                                  else
                                  {
                                    v172 = 0;
                                  }
                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isBlackPearlEnabled"));
                                  v88 = objc_claimAutoreleasedReturnValue();
                                  v169 = (void *)v88;
                                  if (!v88
                                    || (v89 = (void *)v88, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v171 = 0;
                                    goto LABEL_141;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v171 = v89;
LABEL_141:
                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("elapsedTimeSinceEmailReceived"));
                                    v90 = objc_claimAutoreleasedReturnValue();
                                    v167 = (void *)v90;
                                    if (!v90
                                      || (v91 = (void *)v90, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v168 = 0;
LABEL_144:
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recategorizationBy"));
                                      v92 = objc_claimAutoreleasedReturnValue();
                                      v178 = v59;
                                      v162 = (void *)v92;
                                      if (v92
                                        && (v93 = (void *)v92, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v166 = v93;
                                        }
                                        else
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            if (!v201)
                                            {
                                              v166 = 0;
                                              v22 = 0;
                                              v54 = v190;
                                              v84 = v176;
                                              goto LABEL_206;
                                            }
                                            v145 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v146 = *MEMORY[0x1E0D025B8];
                                            v221 = *MEMORY[0x1E0CB2D50];
                                            v164 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("recategorizationBy"));
                                            v222 = v164;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v222, &v221, 1);
                                            v115 = (void *)objc_claimAutoreleasedReturnValue();
                                            v147 = (id)objc_msgSend(v145, "initWithDomain:code:userInfo:", v146, 2, v115);
                                            v166 = 0;
                                            v22 = 0;
                                            *v201 = v147;
                                            v54 = v190;
                                            v114 = v176;
                                            goto LABEL_205;
                                          }
                                          v113 = v93;
                                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMailCategorizationByTypeFromString(v113));
                                          v166 = (id)objc_claimAutoreleasedReturnValue();

                                        }
                                      }
                                      else
                                      {
                                        v166 = 0;
                                      }
                                      v114 = v176;
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isThread"));
                                      v115 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (v115 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          if (!v201)
                                          {
                                            v164 = 0;
                                            v22 = 0;
                                            v54 = v190;
                                            v114 = v176;
                                            goto LABEL_205;
                                          }
                                          v165 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v121 = *MEMORY[0x1E0D025B8];
                                          v219 = *MEMORY[0x1E0CB2D50];
                                          v122 = objc_alloc(MEMORY[0x1E0CB3940]);
                                          v153 = objc_opt_class();
                                          v123 = v122;
                                          v11 = v208;
                                          v163 = (id)objc_msgSend(v123, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v153, CFSTR("isThread"));
                                          v220 = v163;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v220, &v219, 1);
                                          v160 = (void *)objc_claimAutoreleasedReturnValue();
                                          v124 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v121, 2);
                                          v164 = 0;
                                          v22 = 0;
                                          *v201 = v124;
                                          v54 = v190;
                                          v114 = v176;
LABEL_204:

LABEL_205:
                                          v84 = v114;
                                          goto LABEL_206;
                                        }
                                        v159 = v115;
                                        v164 = v115;
                                      }
                                      else
                                      {
                                        v159 = v115;
                                        v164 = 0;
                                      }
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("senderId"));
                                      v116 = objc_claimAutoreleasedReturnValue();
                                      v160 = (void *)v116;
                                      if (v116
                                        && (v117 = (void *)v116, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          if (!v201)
                                          {
                                            v163 = 0;
                                            v22 = 0;
                                            v54 = v190;
                                            v114 = v176;
                                            v115 = v159;
                                            goto LABEL_204;
                                          }
                                          v125 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v126 = *MEMORY[0x1E0D025B8];
                                          v217 = *MEMORY[0x1E0CB2D50];
                                          v161 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("senderId"));
                                          v218 = v161;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v218, &v217, 1);
                                          v158 = (void *)objc_claimAutoreleasedReturnValue();
                                          v163 = 0;
                                          v22 = 0;
                                          *v201 = (id)objc_msgSend(v125, "initWithDomain:code:userInfo:", v126, 2);
                                          v54 = v190;
                                          v114 = v176;
                                          goto LABEL_203;
                                        }
                                        v163 = v117;
                                      }
                                      else
                                      {
                                        v163 = 0;
                                      }
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("receivingAccountDomain"));
                                      v118 = objc_claimAutoreleasedReturnValue();
                                      v158 = (void *)v118;
                                      if (v118
                                        && (v119 = (void *)v118, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        v120 = v14;
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v161 = v119;
                                        }
                                        else
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            if (!v201)
                                            {
                                              v161 = 0;
                                              v22 = 0;
                                              goto LABEL_202;
                                            }
                                            v148 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v177 = *MEMORY[0x1E0D025B8];
                                            v215 = *MEMORY[0x1E0CB2D50];
                                            v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("receivingAccountDomain"));
                                            v216 = v137;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v216, &v215, 1);
                                            v149 = objc_claimAutoreleasedReturnValue();
                                            v150 = (id)objc_msgSend(v148, "initWithDomain:code:userInfo:", v177, 2, v149);
                                            v161 = 0;
                                            v22 = 0;
                                            *v201 = v150;
                                            v128 = (void *)v149;
                                            v14 = v120;
                                            goto LABEL_201;
                                          }
                                          v127 = v119;
                                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMailCategorizationDomainFromString(v127));
                                          v161 = (id)objc_claimAutoreleasedReturnValue();

                                        }
                                      }
                                      else
                                      {
                                        v161 = 0;
                                      }
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasIcloudAccountEnabled"));
                                      v128 = (void *)objc_claimAutoreleasedReturnValue();
                                      v196 = v8;
                                      if (v128 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          if (v201)
                                          {
                                            v139 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v140 = v128;
                                            v141 = *MEMORY[0x1E0D025B8];
                                            v213 = *MEMORY[0x1E0CB2D50];
                                            v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasIcloudAccountEnabled"));
                                            v214 = v142;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v214, &v213, 1);
                                            v143 = (void *)objc_claimAutoreleasedReturnValue();
                                            v144 = v141;
                                            v128 = v140;
                                            v8 = v196;
                                            *v201 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v144, 2, v143);

                                            v11 = v208;
                                          }
                                          v137 = 0;
                                          v22 = 0;
                                          goto LABEL_201;
                                        }
                                        v129 = v199;
                                        v202 = v14;
                                        v130 = v191;
                                        v131 = self;
                                        v157 = v128;
                                        v132 = v128;
                                      }
                                      else
                                      {
                                        v157 = v128;
                                        v129 = v199;
                                        v202 = v14;
                                        v130 = v191;
                                        v131 = self;
                                        v132 = 0;
                                      }
                                      v133 = objc_msgSend(v189, "intValue");
                                      v134 = objc_msgSend(v179, "intValue");
                                      v135 = objc_msgSend(v174, "intValue");
                                      v136 = objc_msgSend(v166, "intValue");
                                      v137 = v132;
                                      LODWORD(v156) = objc_msgSend(v161, "intValue");
                                      LODWORD(v155) = v136;
                                      LODWORD(v154) = v133;
                                      v199 = v129;
                                      v22 = objc_retain(-[BMMailCategorization initWithMessageId:eventType:trialExperimentId:trialExperimentDeploymentId:trialExperimentTreatmentId:trialRolloutId:trialRolloutDeploymentId:trialRolloutFactorPackId:predictedCategory:blackPearlModelVersion:blackPearlSenderModelVersion:blackPearlFinalRuleVersion:blackPearlBreakthroughVersion:reasonCodes:currCategoryView:prevCategoryView:isBreakthrough:isBlackPearlEnabled:elapsedTimeSinceEmailReceived:recategorizationBy:isThread:senderId:receivingAccountDomain:hasIcloudAccountEnabled:](v131, "initWithMessageId:eventType:trialExperimentId:trialExperimentDeploymentId:trialExperimentTreatmentId:trialRolloutId:trialRolloutDeploymentId:trialRolloutFactorPackId:predictedCategory:blackPearlModelVersion:blackPearlSenderModelVersion:blackPearlFinalRuleVersion:blackPearlBreakthroughVersion:reasonCodes:currCategoryView:prevCategoryView:isBreakthrough:isBlackPearlEnabled:elapsedTimeSinceEmailReceived:recategorizationBy:isThread:senderId:receivingAccountDomain:hasIcloudAccountEnabled:", v197, v130, v209, v207, v205, v200, v129, v194, v154, v187,
                                                v186,
                                                v182,
                                                v185,
                                                v181,
                                                __PAIR64__(v135, v134),
                                                v172,
                                                v171,
                                                v168,
                                                v155,
                                                v164,
                                                v163,
                                                v156,
                                                v132));
                                      self = v22;
                                      v8 = v196;
                                      v11 = v208;
                                      v14 = v202;
                                      v114 = v176;
                                      v128 = v157;
LABEL_201:

LABEL_202:
                                      v54 = v190;
                                      v59 = v178;
LABEL_203:
                                      v115 = v159;

                                      goto LABEL_204;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v168 = v91;
                                      goto LABEL_144;
                                    }
                                    v101 = v59;
                                    if (v201)
                                    {
                                      v111 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v112 = *MEMORY[0x1E0D025B8];
                                      v223 = *MEMORY[0x1E0CB2D50];
                                      v166 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("elapsedTimeSinceEmailReceived"));
                                      v224 = v166;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v224, &v223, 1);
                                      v162 = (void *)objc_claimAutoreleasedReturnValue();
                                      v168 = 0;
                                      v22 = 0;
                                      *v201 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v112, 2);
                                      v54 = v190;
                                      v84 = v176;
LABEL_206:
                                      v76 = v173;

                                      v69 = v182;
LABEL_207:

LABEL_208:
LABEL_209:
                                      v110 = v170;
                                      goto LABEL_210;
                                    }
                                    v168 = 0;
                                    v22 = 0;
LABEL_241:
                                    v54 = v190;
                                    v59 = v101;
                                    v69 = v182;
                                    v76 = v173;
                                    v84 = v176;
                                    goto LABEL_207;
                                  }
                                  v101 = v59;
                                  if (v201)
                                  {
                                    v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v103 = *MEMORY[0x1E0D025B8];
                                    v225 = *MEMORY[0x1E0CB2D50];
                                    v104 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v152 = objc_opt_class();
                                    v105 = v104;
                                    v11 = v208;
                                    v168 = (id)objc_msgSend(v105, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v152, CFSTR("isBlackPearlEnabled"));
                                    v226 = v168;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v226, &v225, 1);
                                    v167 = (void *)objc_claimAutoreleasedReturnValue();
                                    v171 = 0;
                                    v22 = 0;
                                    *v201 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v103, 2);
                                    goto LABEL_241;
                                  }
                                  v171 = 0;
                                  v22 = 0;
                                  v54 = v190;
LABEL_235:
                                  v69 = v182;
                                  v76 = v173;
                                  v84 = v176;
                                  goto LABEL_208;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v85 = v84;
                                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMailCategorizationMailboxTypeFromString(v85));
                                  v174 = (id)objc_claimAutoreleasedReturnValue();

                                  goto LABEL_130;
                                }
                                if (v201)
                                {
                                  v106 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v107 = *MEMORY[0x1E0D025B8];
                                  v229 = *MEMORY[0x1E0CB2D50];
                                  v172 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("prevCategoryView"));
                                  v230 = v172;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v230, &v229, 1);
                                  v108 = objc_claimAutoreleasedReturnValue();
                                  v109 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v107, 2, v108);
                                  v110 = (void *)v108;
                                  v174 = 0;
                                  v22 = 0;
                                  *v201 = v109;
                                  v54 = v190;
                                  v69 = v182;
                                  v76 = v173;
LABEL_210:

LABEL_211:
                                  goto LABEL_212;
                                }
                                v174 = 0;
                                v22 = 0;
                                v54 = v190;
                                v69 = v182;
LABEL_239:
                                v76 = v173;
                                goto LABEL_211;
                              }
LABEL_120:
                              v179 = 0;
                              goto LABEL_121;
                            }
                            if (v201)
                            {
                              v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v82 = *MEMORY[0x1E0D025B8];
                              v233 = *MEMORY[0x1E0CB2D50];
                              v76 = v62;
                              v179 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("reasonCodes"));
                              v234 = v179;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v234, &v233, 1);
                              v175 = (void *)objc_claimAutoreleasedReturnValue();
                              v181 = 0;
                              v22 = 0;
                              *v201 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v82, 2);
                              v54 = v190;
                              v69 = v182;
LABEL_212:

                              goto LABEL_213;
                            }
                            v181 = 0;
                            v22 = 0;
                            v54 = v190;
                            v76 = v62;
                            v69 = v182;
LABEL_213:

                            v58 = v180;
                            goto LABEL_214;
                          }
                          if (v201)
                          {
                            v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v75 = *MEMORY[0x1E0D025B8];
                            v235 = *MEMORY[0x1E0CB2D50];
                            v181 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("blackPearlBreakthroughVersion"));
                            v236 = v181;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v236, &v235, 1);
                            v76 = (void *)objc_claimAutoreleasedReturnValue();
                            v185 = 0;
                            v22 = 0;
                            *v201 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2, v76);
                            v54 = v190;
                            v69 = v182;
                            goto LABEL_213;
                          }
                          v185 = 0;
                          v22 = 0;
                          v54 = v190;
                          v69 = v182;
LABEL_214:

                          goto LABEL_215;
                        }
                        v69 = v201;
                        if (v201)
                        {
                          v184 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v71 = *MEMORY[0x1E0D025B8];
                          v237 = *MEMORY[0x1E0CB2D50];
                          v185 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("blackPearlFinalRuleVersion"));
                          v238 = v185;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v238, &v237, 1);
                          v72 = objc_claimAutoreleasedReturnValue();
                          v73 = v184;
                          v183 = (void *)v72;
                          v22 = 0;
                          *v201 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v71, 2);
                          v69 = 0;
                          v54 = v190;
                          goto LABEL_214;
                        }
                        v22 = 0;
LABEL_164:
                        v11 = v208;
                        v54 = v190;
LABEL_215:

                        goto LABEL_216;
                      }
                      if (v201)
                      {
                        v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v68 = *MEMORY[0x1E0D025B8];
                        v239 = *MEMORY[0x1E0CB2D50];
                        v69 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("blackPearlSenderModelVersion"));
                        v240 = v69;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v240, &v239, 1);
                        v70 = objc_claimAutoreleasedReturnValue();
                        v186 = 0;
                        v22 = 0;
                        *v201 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2, v70);
                        v59 = (void *)v70;
                        goto LABEL_164;
                      }
                      v186 = 0;
                      v22 = 0;
LABEL_158:
                      v54 = v190;
LABEL_216:

                      v10 = v198;
                      goto LABEL_217;
                    }
                    if (v201)
                    {
                      v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v66 = *MEMORY[0x1E0D025B8];
                      v241 = *MEMORY[0x1E0CB2D50];
                      v186 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("blackPearlModelVersion"));
                      v242 = v186;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v242, &v241, 1);
                      v193 = (void *)objc_claimAutoreleasedReturnValue();
                      v187 = 0;
                      v22 = 0;
                      *v201 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2);
                      goto LABEL_158;
                    }
                    v187 = 0;
                    v22 = 0;
LABEL_132:
                    v54 = v190;
LABEL_217:

                    v9 = v191;
                    goto LABEL_218;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v57 = v18;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMailCategorizationCategoryFromString(v57));
                    v189 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_67;
                  }
                  if (v201)
                  {
                    v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v79 = *MEMORY[0x1E0D025B8];
                    v243 = *MEMORY[0x1E0CB2D50];
                    v187 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("predictedCategory"));
                    v244 = v187;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v244, &v243, 1);
                    v80 = objc_claimAutoreleasedReturnValue();
                    v189 = 0;
                    v22 = 0;
                    *v201 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2, v80);
                    v58 = (void *)v80;
                    v14 = v38;
                    goto LABEL_132;
                  }
                  v189 = 0;
                  v22 = 0;
                  v54 = v190;
LABEL_218:

                  goto LABEL_219;
                }
                if (v201)
                {
                  v195 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v55 = *MEMORY[0x1E0D025B8];
                  v245 = *MEMORY[0x1E0CB2D50];
                  v54 = v190;
                  v189 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("trialRolloutFactorPackId"));
                  v246 = v189;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v246, &v245, 1);
                  v188 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = (id)objc_msgSend(v195, "initWithDomain:code:userInfo:", v55, 2);
                  v194 = 0;
                  v22 = 0;
                  *v201 = v56;
                  goto LABEL_218;
                }
                v194 = 0;
                v22 = 0;
                v54 = v190;
LABEL_219:

                v7 = v197;
                goto LABEL_220;
              }
              if (v201)
              {
                v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v52 = *MEMORY[0x1E0D025B8];
                v247 = *MEMORY[0x1E0CB2D50];
                v194 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("trialRolloutDeploymentId"));
                v248 = v194;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v248, &v247, 1);
                v53 = objc_claimAutoreleasedReturnValue();
                v199 = 0;
                v22 = 0;
                *v201 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 2, v53);
                v54 = (void *)v53;
                v11 = v208;
                goto LABEL_219;
              }
              v199 = 0;
              v22 = 0;
LABEL_220:

              v6 = v204;
              goto LABEL_221;
            }
            if (v201)
            {
              v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v45 = v7;
              v46 = v44;
              v47 = v45;
              v48 = *MEMORY[0x1E0D025B8];
              v249 = *MEMORY[0x1E0CB2D50];
              v199 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("trialRolloutId"));
              v250 = v199;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v250, &v249, 1);
              v49 = objc_claimAutoreleasedReturnValue();
              v50 = v46;
              v7 = v47;
              v14 = (void *)v49;
              v200 = 0;
              v22 = 0;
              *v201 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v48, 2, v49);
              goto LABEL_220;
            }
            v200 = 0;
            v22 = 0;
LABEL_221:

            goto LABEL_222;
          }
          if (a4)
          {
            v206 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v192 = v9;
            v39 = v7;
            v40 = *MEMORY[0x1E0D025B8];
            v251 = *MEMORY[0x1E0CB2D50];
            v200 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("trialExperimentTreatmentId"));
            v252 = v200;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v252, &v251, 1);
            v41 = objc_claimAutoreleasedReturnValue();
            v42 = v40;
            v7 = v39;
            v9 = v192;
            v203 = (void *)v41;
            v43 = (id)objc_msgSend(v206, "initWithDomain:code:userInfo:", v42, 2);
            v205 = 0;
            v22 = 0;
            *a4 = v43;
            goto LABEL_221;
          }
          v205 = 0;
          v22 = 0;
LABEL_222:

          goto LABEL_223;
        }
        if (a4)
        {
          v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v33 = v7;
          v34 = v32;
          v35 = v33;
          v36 = *MEMORY[0x1E0D025B8];
          v253 = *MEMORY[0x1E0CB2D50];
          v205 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("trialExperimentDeploymentId"));
          v254 = v205;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v254, &v253, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v34;
          v7 = v35;
          v6 = v204;
          v207 = 0;
          v22 = 0;
          *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v36, 2, v11);
          goto LABEL_222;
        }
        v207 = 0;
        v22 = 0;
LABEL_223:

        goto LABEL_224;
      }
      if (a4)
      {
        v210 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v255 = *MEMORY[0x1E0CB2D50];
        v207 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("trialExperimentId"));
        v256 = v207;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v256, &v255, 1);
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (id)objc_msgSend(v210, "initWithDomain:code:userInfo:", v30, 2, v212);
        v209 = 0;
        v22 = 0;
        *a4 = v31;
        goto LABEL_223;
      }
      v209 = 0;
      v22 = 0;
LABEL_224:

      goto LABEL_225;
    }
    if (a4)
    {
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v24 = v7;
      v25 = v23;
      v26 = v6;
      v27 = v24;
      v28 = *MEMORY[0x1E0D025B8];
      v257 = *MEMORY[0x1E0CB2D50];
      v209 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("eventType"));
      v258 = v209;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v258, &v257, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v25;
      v7 = v27;
      v6 = v26;
      v9 = 0;
      v22 = 0;
      *a4 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v28, 2, v10);
      goto LABEL_224;
    }
    v9 = 0;
    v22 = 0;
LABEL_225:

    goto LABEL_226;
  }
  if (a4)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0D025B8];
    v259 = *MEMORY[0x1E0CB2D50];
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("messageId"));
    v260[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v260, &v259, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v8);
    v7 = 0;
    v22 = 0;
    *a4 = v21;
    goto LABEL_225;
  }
  v7 = 0;
  v22 = 0;
LABEL_226:

  return v22;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
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
  id v54;
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
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[15];
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  _QWORD v90[14];
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  -[BMMailCategorization messageId](self, "messageId");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization eventType](self, "eventType");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialExperimentId](self, "trialExperimentId");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialExperimentDeploymentId](self, "trialExperimentDeploymentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialExperimentTreatmentId](self, "trialExperimentTreatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialRolloutId](self, "trialRolloutId");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialRolloutDeploymentId](self, "trialRolloutDeploymentId");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization trialRolloutFactorPackId](self, "trialRolloutFactorPackId");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMailCategorization predictedCategory](self, "predictedCategory"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization blackPearlModelVersion](self, "blackPearlModelVersion");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization blackPearlSenderModelVersion](self, "blackPearlSenderModelVersion");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization blackPearlFinalRuleVersion](self, "blackPearlFinalRuleVersion");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization blackPearlBreakthroughVersion](self, "blackPearlBreakthroughVersion");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailCategorization reasonCodes](self, "reasonCodes");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMailCategorization currCategoryView](self, "currCategoryView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMailCategorization prevCategoryView](self, "prevCategoryView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMailCategorization hasIsBreakthrough](self, "hasIsBreakthrough"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMailCategorization isBreakthrough](self, "isBreakthrough"));
    v69 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v69 = 0;
  }
  if (-[BMMailCategorization hasIsBlackPearlEnabled](self, "hasIsBlackPearlEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMailCategorization isBlackPearlEnabled](self, "isBlackPearlEnabled"));
    v68 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v68 = 0;
  }
  -[BMMailCategorization elapsedTimeSinceEmailReceived](self, "elapsedTimeSinceEmailReceived");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMailCategorization recategorizationBy](self, "recategorizationBy"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMailCategorization hasIsThread](self, "hasIsThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMailCategorization isThread](self, "isThread"));
    v65 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v65 = 0;
  }
  -[BMMailCategorization senderId](self, "senderId");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMailCategorization receivingAccountDomain](self, "receivingAccountDomain"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMailCategorization hasHasIcloudAccountEnabled](self, "hasHasIcloudAccountEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMailCategorization hasIcloudAccountEnabled](self, "hasIcloudAccountEnabled"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v78[0] = CFSTR("messageId");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v11;
  v90[0] = v11;
  v78[1] = CFSTR("eventType");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v12;
  v90[1] = v12;
  v78[2] = CFSTR("trialExperimentId");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v13;
  v90[2] = v13;
  v78[3] = CFSTR("trialExperimentDeploymentId");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v14;
  v90[3] = v14;
  v78[4] = CFSTR("trialExperimentTreatmentId");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v15;
  v90[4] = v15;
  v78[5] = CFSTR("trialRolloutId");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v16;
  v90[5] = v16;
  v78[6] = CFSTR("trialRolloutDeploymentId");
  v17 = (uint64_t)v77;
  if (!v77)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v90[6] = v17;
  v78[7] = CFSTR("trialRolloutFactorPackId");
  v18 = (uint64_t)v76;
  if (!v76)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v90[7] = v18;
  v78[8] = CFSTR("predictedCategory");
  v19 = (uint64_t)v75;
  if (!v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v19;
  v90[8] = v19;
  v78[9] = CFSTR("blackPearlModelVersion");
  v20 = (uint64_t)v74;
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v20;
  v90[9] = v20;
  v78[10] = CFSTR("blackPearlSenderModelVersion");
  v21 = (uint64_t)v73;
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v21;
  v90[10] = v21;
  v78[11] = CFSTR("blackPearlFinalRuleVersion");
  v22 = (uint64_t)v72;
  if (!v72)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v22;
  v90[11] = v22;
  v78[12] = CFSTR("blackPearlBreakthroughVersion");
  v23 = (uint64_t)v71;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v23;
  v61 = v10;
  v90[12] = v23;
  v78[13] = CFSTR("reasonCodes");
  v24 = (uint64_t)v70;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v24;
  v90[13] = v24;
  v78[14] = CFSTR("currCategoryView");
  v46 = (void *)v18;
  if (v9)
  {
    v91 = v9;
    v79 = CFSTR("currMailbox");
    v25 = (uint64_t)v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v38;
    v79 = CFSTR("currMailbox");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v25;
  v92 = v25;
  v80 = CFSTR("prevCategoryView");
  if (v62)
  {
    v93 = v62;
    v81 = CFSTR("prevMailbox");
    v26 = (uint64_t)v62;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v37;
    v81 = CFSTR("prevMailbox");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v3;
  v41 = (void *)v26;
  v94 = v26;
  v82 = CFSTR("isBreakthrough");
  v27 = (uint64_t)v69;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v5;
  v95 = v27;
  v83 = CFSTR("isBlackPearlEnabled");
  v28 = (uint64_t)v68;
  if (!v68)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v4;
  v96 = v28;
  v84 = CFSTR("elapsedTimeSinceEmailReceived");
  v29 = v67;
  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v28;
  v40 = (void *)v27;
  v97 = v29;
  v85 = CFSTR("recategorizationBy");
  v30 = v66;
  if (!v66)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v8;
  v98 = v30;
  v86 = CFSTR("isThread");
  v32 = v65;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v17;
  v99 = v32;
  v87 = CFSTR("senderId");
  v33 = v64;
  if (!v64)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v100 = v33;
  v88 = CFSTR("receivingAccountDomain");
  v34 = v63;
  if (!v63)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v101 = v34;
  v89 = CFSTR("hasIcloudAccountEnabled");
  v35 = v61;
  if (!v61)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v102 = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v78, 26);
  v54 = (id)objc_claimAutoreleasedReturnValue();
  if (!v61)

  if (!v63)
  if (!v64)

  if (!v65)
  if (!v66)

  if (!v67)
  if (!v68)

  if (!v69)
  if (!v62)
  {

  }
  if (!v9)
  {

  }
  if (!v70)

  if (!v71)
  if (!v72)

  if (!v73)
  if (!v74)

  if (!v75)
  if (!v76)

  if (v77)
  {
    if (v31)
      goto LABEL_99;
  }
  else
  {

    if (v31)
    {
LABEL_99:
      if (v7)
        goto LABEL_100;
      goto LABEL_107;
    }
  }

  if (v7)
  {
LABEL_100:
    if (v6)
      goto LABEL_101;
    goto LABEL_108;
  }
LABEL_107:

  if (v6)
  {
LABEL_101:
    if (v59)
      goto LABEL_102;
    goto LABEL_109;
  }
LABEL_108:

  if (v59)
  {
LABEL_102:
    if (v58)
      goto LABEL_103;
LABEL_110:

    if (v60)
      goto LABEL_104;
LABEL_111:

    goto LABEL_104;
  }
LABEL_109:

  if (!v58)
    goto LABEL_110;
LABEL_103:
  if (!v60)
    goto LABEL_111;
LABEL_104:

  return v54;
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
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  int v96;
  int v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  int v104;
  _BOOL4 v105;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMailCategorization messageId](self, "messageId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageId");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMailCategorization messageId](self, "messageId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_88;
    }
    -[BMMailCategorization eventType](self, "eventType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventType");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMailCategorization eventType](self, "eventType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_88;
    }
    -[BMMailCategorization trialExperimentId](self, "trialExperimentId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialExperimentId");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMailCategorization trialExperimentId](self, "trialExperimentId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialExperimentId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_88;
    }
    -[BMMailCategorization trialExperimentDeploymentId](self, "trialExperimentDeploymentId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialExperimentDeploymentId");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMMailCategorization trialExperimentDeploymentId](self, "trialExperimentDeploymentId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialExperimentDeploymentId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_88;
    }
    -[BMMailCategorization trialExperimentTreatmentId](self, "trialExperimentTreatmentId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialExperimentTreatmentId");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMMailCategorization trialExperimentTreatmentId](self, "trialExperimentTreatmentId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialExperimentTreatmentId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_88;
    }
    -[BMMailCategorization trialRolloutId](self, "trialRolloutId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialRolloutId");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMMailCategorization trialRolloutId](self, "trialRolloutId");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialRolloutId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_88;
    }
    -[BMMailCategorization trialRolloutDeploymentId](self, "trialRolloutDeploymentId");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialRolloutDeploymentId");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMMailCategorization trialRolloutDeploymentId](self, "trialRolloutDeploymentId");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialRolloutDeploymentId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_88;
    }
    -[BMMailCategorization trialRolloutFactorPackId](self, "trialRolloutFactorPackId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialRolloutFactorPackId");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMMailCategorization trialRolloutFactorPackId](self, "trialRolloutFactorPackId");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialRolloutFactorPackId");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_88;
    }
    v55 = -[BMMailCategorization predictedCategory](self, "predictedCategory");
    if (v55 == objc_msgSend(v5, "predictedCategory"))
    {
      -[BMMailCategorization blackPearlModelVersion](self, "blackPearlModelVersion");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "blackPearlModelVersion");
      v57 = objc_claimAutoreleasedReturnValue();
      if (v56 == (void *)v57)
      {

      }
      else
      {
        v58 = (void *)v57;
        -[BMMailCategorization blackPearlModelVersion](self, "blackPearlModelVersion");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "blackPearlModelVersion");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v59, "isEqual:", v60);

        if (!v61)
          goto LABEL_88;
      }
      -[BMMailCategorization blackPearlSenderModelVersion](self, "blackPearlSenderModelVersion");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "blackPearlSenderModelVersion");
      v63 = objc_claimAutoreleasedReturnValue();
      if (v62 == (void *)v63)
      {

      }
      else
      {
        v64 = (void *)v63;
        -[BMMailCategorization blackPearlSenderModelVersion](self, "blackPearlSenderModelVersion");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "blackPearlSenderModelVersion");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v65, "isEqual:", v66);

        if (!v67)
          goto LABEL_88;
      }
      -[BMMailCategorization blackPearlFinalRuleVersion](self, "blackPearlFinalRuleVersion");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "blackPearlFinalRuleVersion");
      v69 = objc_claimAutoreleasedReturnValue();
      if (v68 == (void *)v69)
      {

      }
      else
      {
        v70 = (void *)v69;
        -[BMMailCategorization blackPearlFinalRuleVersion](self, "blackPearlFinalRuleVersion");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "blackPearlFinalRuleVersion");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v71, "isEqual:", v72);

        if (!v73)
          goto LABEL_88;
      }
      -[BMMailCategorization blackPearlBreakthroughVersion](self, "blackPearlBreakthroughVersion");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "blackPearlBreakthroughVersion");
      v75 = objc_claimAutoreleasedReturnValue();
      if (v74 == (void *)v75)
      {

      }
      else
      {
        v76 = (void *)v75;
        -[BMMailCategorization blackPearlBreakthroughVersion](self, "blackPearlBreakthroughVersion");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "blackPearlBreakthroughVersion");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v77, "isEqual:", v78);

        if (!v79)
          goto LABEL_88;
      }
      -[BMMailCategorization reasonCodes](self, "reasonCodes");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonCodes");
      v81 = objc_claimAutoreleasedReturnValue();
      if (v80 == (void *)v81)
      {

      }
      else
      {
        v82 = (void *)v81;
        -[BMMailCategorization reasonCodes](self, "reasonCodes");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "reasonCodes");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v83, "isEqual:", v84);

        if (!v85)
          goto LABEL_88;
      }
      v86 = -[BMMailCategorization currCategoryView](self, "currCategoryView");
      if (v86 != objc_msgSend(v5, "currCategoryView"))
        goto LABEL_88;
      v87 = -[BMMailCategorization prevCategoryView](self, "prevCategoryView");
      if (v87 != objc_msgSend(v5, "prevCategoryView"))
        goto LABEL_88;
      if (-[BMMailCategorization hasIsBreakthrough](self, "hasIsBreakthrough")
        || objc_msgSend(v5, "hasIsBreakthrough"))
      {
        if (!-[BMMailCategorization hasIsBreakthrough](self, "hasIsBreakthrough"))
          goto LABEL_88;
        if (!objc_msgSend(v5, "hasIsBreakthrough"))
          goto LABEL_88;
        v88 = -[BMMailCategorization isBreakthrough](self, "isBreakthrough");
        if (v88 != objc_msgSend(v5, "isBreakthrough"))
          goto LABEL_88;
      }
      if (-[BMMailCategorization hasIsBlackPearlEnabled](self, "hasIsBlackPearlEnabled")
        || objc_msgSend(v5, "hasIsBlackPearlEnabled"))
      {
        if (!-[BMMailCategorization hasIsBlackPearlEnabled](self, "hasIsBlackPearlEnabled"))
          goto LABEL_88;
        if (!objc_msgSend(v5, "hasIsBlackPearlEnabled"))
          goto LABEL_88;
        v89 = -[BMMailCategorization isBlackPearlEnabled](self, "isBlackPearlEnabled");
        if (v89 != objc_msgSend(v5, "isBlackPearlEnabled"))
          goto LABEL_88;
      }
      -[BMMailCategorization elapsedTimeSinceEmailReceived](self, "elapsedTimeSinceEmailReceived");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "elapsedTimeSinceEmailReceived");
      v91 = objc_claimAutoreleasedReturnValue();
      if (v90 == (void *)v91)
      {

      }
      else
      {
        v92 = (void *)v91;
        -[BMMailCategorization elapsedTimeSinceEmailReceived](self, "elapsedTimeSinceEmailReceived");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "elapsedTimeSinceEmailReceived");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v93, "isEqual:", v94);

        if (!v95)
          goto LABEL_88;
      }
      v96 = -[BMMailCategorization recategorizationBy](self, "recategorizationBy");
      if (v96 != objc_msgSend(v5, "recategorizationBy"))
        goto LABEL_88;
      if (-[BMMailCategorization hasIsThread](self, "hasIsThread") || objc_msgSend(v5, "hasIsThread"))
      {
        if (!-[BMMailCategorization hasIsThread](self, "hasIsThread"))
          goto LABEL_88;
        if (!objc_msgSend(v5, "hasIsThread"))
          goto LABEL_88;
        v97 = -[BMMailCategorization isThread](self, "isThread");
        if (v97 != objc_msgSend(v5, "isThread"))
          goto LABEL_88;
      }
      -[BMMailCategorization senderId](self, "senderId");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "senderId");
      v99 = objc_claimAutoreleasedReturnValue();
      if (v98 == (void *)v99)
      {

      }
      else
      {
        v100 = (void *)v99;
        -[BMMailCategorization senderId](self, "senderId");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "senderId");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend(v101, "isEqual:", v102);

        if (!v103)
          goto LABEL_88;
      }
      v104 = -[BMMailCategorization receivingAccountDomain](self, "receivingAccountDomain");
      if (v104 == objc_msgSend(v5, "receivingAccountDomain"))
      {
        if (!-[BMMailCategorization hasHasIcloudAccountEnabled](self, "hasHasIcloudAccountEnabled")
          && !objc_msgSend(v5, "hasHasIcloudAccountEnabled"))
        {
          LOBYTE(v12) = 1;
          goto LABEL_89;
        }
        if (-[BMMailCategorization hasHasIcloudAccountEnabled](self, "hasHasIcloudAccountEnabled")
          && objc_msgSend(v5, "hasHasIcloudAccountEnabled"))
        {
          v105 = -[BMMailCategorization hasIcloudAccountEnabled](self, "hasIcloudAccountEnabled");
          v12 = v105 ^ objc_msgSend(v5, "hasIcloudAccountEnabled") ^ 1;
LABEL_89:

          goto LABEL_90;
        }
      }
    }
LABEL_88:
    LOBYTE(v12) = 0;
    goto LABEL_89;
  }
  LOBYTE(v12) = 0;
LABEL_90:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (NSString)trialExperimentDeploymentId
{
  return self->_trialExperimentDeploymentId;
}

- (NSString)trialExperimentTreatmentId
{
  return self->_trialExperimentTreatmentId;
}

- (NSString)trialRolloutId
{
  return self->_trialRolloutId;
}

- (NSString)trialRolloutDeploymentId
{
  return self->_trialRolloutDeploymentId;
}

- (NSString)trialRolloutFactorPackId
{
  return self->_trialRolloutFactorPackId;
}

- (int)predictedCategory
{
  return self->_predictedCategory;
}

- (NSString)blackPearlModelVersion
{
  return self->_blackPearlModelVersion;
}

- (NSString)blackPearlSenderModelVersion
{
  return self->_blackPearlSenderModelVersion;
}

- (NSString)blackPearlFinalRuleVersion
{
  return self->_blackPearlFinalRuleVersion;
}

- (NSString)blackPearlBreakthroughVersion
{
  return self->_blackPearlBreakthroughVersion;
}

- (NSString)reasonCodes
{
  return self->_reasonCodes;
}

- (int)currCategoryView
{
  return self->_currCategoryView;
}

- (int)prevCategoryView
{
  return self->_prevCategoryView;
}

- (BOOL)isBreakthrough
{
  return self->_isBreakthrough;
}

- (BOOL)hasIsBreakthrough
{
  return self->_hasIsBreakthrough;
}

- (void)setHasIsBreakthrough:(BOOL)a3
{
  self->_hasIsBreakthrough = a3;
}

- (BOOL)isBlackPearlEnabled
{
  return self->_isBlackPearlEnabled;
}

- (BOOL)hasIsBlackPearlEnabled
{
  return self->_hasIsBlackPearlEnabled;
}

- (void)setHasIsBlackPearlEnabled:(BOOL)a3
{
  self->_hasIsBlackPearlEnabled = a3;
}

- (NSString)elapsedTimeSinceEmailReceived
{
  return self->_elapsedTimeSinceEmailReceived;
}

- (int)recategorizationBy
{
  return self->_recategorizationBy;
}

- (BOOL)isThread
{
  return self->_isThread;
}

- (BOOL)hasIsThread
{
  return self->_hasIsThread;
}

- (void)setHasIsThread:(BOOL)a3
{
  self->_hasIsThread = a3;
}

- (NSString)senderId
{
  return self->_senderId;
}

- (int)receivingAccountDomain
{
  return self->_receivingAccountDomain;
}

- (BOOL)hasIcloudAccountEnabled
{
  return self->_hasIcloudAccountEnabled;
}

- (BOOL)hasHasIcloudAccountEnabled
{
  return self->_hasHasIcloudAccountEnabled;
}

- (void)setHasHasIcloudAccountEnabled:(BOOL)a3
{
  self->_hasHasIcloudAccountEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderId, 0);
  objc_storeStrong((id *)&self->_elapsedTimeSinceEmailReceived, 0);
  objc_storeStrong((id *)&self->_reasonCodes, 0);
  objc_storeStrong((id *)&self->_blackPearlBreakthroughVersion, 0);
  objc_storeStrong((id *)&self->_blackPearlFinalRuleVersion, 0);
  objc_storeStrong((id *)&self->_blackPearlSenderModelVersion, 0);
  objc_storeStrong((id *)&self->_blackPearlModelVersion, 0);
  objc_storeStrong((id *)&self->_trialRolloutFactorPackId, 0);
  objc_storeStrong((id *)&self->_trialRolloutDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialRolloutId, 0);
  objc_storeStrong((id *)&self->_trialExperimentTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
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

    v4 = -[BMMailCategorization initByReadFrom:]([BMMailCategorization alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[28];

  v30[26] = *MEMORY[0x1E0C80C00];
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messageId"), 2, 0, 1, 13, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventType"), 2, 0, 2, 13, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("trialExperimentId"), 2, 0, 3, 13, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("trialExperimentDeploymentId"), 2, 0, 4, 13, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("trialExperimentTreatmentId"), 2, 0, 5, 13, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("trialRolloutId"), 2, 0, 6, 13, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("trialRolloutDeploymentId"), 2, 0, 7, 13, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("trialRolloutFactorPackId"), 2, 0, 8, 13, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("predictedCategory"), 0, 0, 9, 4, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("blackPearlModelVersion"), 2, 0, 10, 13, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("blackPearlSenderModelVersion"), 2, 0, 11, 13, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("blackPearlFinalRuleVersion"), 2, 0, 12, 13, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("blackPearlBreakthroughVersion"), 2, 0, 13, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reasonCodes"), 2, 0, 14, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("currCategoryView"), 0, 0, 15, 4, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("currMailbox"), 0, 0, 15, 4, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("prevCategoryView"), 0, 0, 16, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("prevMailbox"), 0, 0, 16, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBreakthrough"), 0, 0, 17, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBlackPearlEnabled"), 0, 0, 18, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("elapsedTimeSinceEmailReceived"), 2, 0, 19, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("recategorizationBy"), 0, 0, 20, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isThread"), 0, 0, 21, 12, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("senderId"), 2, 0, 22, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("receivingAccountDomain"), 0, 0, 23, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasIcloudAccountEnabled"), 0, 0, 24, 12, 0);
  v30[0] = v29;
  v30[1] = v28;
  v30[2] = v27;
  v30[3] = v26;
  v30[4] = v25;
  v30[5] = v24;
  v30[6] = v23;
  v30[7] = v22;
  v30[8] = v21;
  v30[9] = v20;
  v30[10] = v19;
  v30[11] = v18;
  v30[12] = v17;
  v30[13] = v16;
  v30[14] = v15;
  v30[15] = v14;
  v30[16] = v2;
  v30[17] = v3;
  v30[18] = v4;
  v30[19] = v13;
  v30[20] = v12;
  v30[21] = v5;
  v30[22] = v6;
  v30[23] = v11;
  v30[24] = v7;
  v30[25] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 26);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F5B8;
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
  void *v26;
  void *v27;
  _QWORD v28[26];

  v28[24] = *MEMORY[0x1E0C80C00];
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messageId"), 1, 13, 0);
  v28[0] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventType"), 2, 13, 0);
  v28[1] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialExperimentId"), 3, 13, 0);
  v28[2] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialExperimentDeploymentId"), 4, 13, 0);
  v28[3] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialExperimentTreatmentId"), 5, 13, 0);
  v28[4] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialRolloutId"), 6, 13, 0);
  v28[5] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialRolloutDeploymentId"), 7, 13, 0);
  v28[6] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialRolloutFactorPackId"), 8, 13, 0);
  v28[7] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predictedCategory"), 9, 4, 0);
  v28[8] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("blackPearlModelVersion"), 10, 13, 0);
  v28[9] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("blackPearlSenderModelVersion"), 11, 13, 0);
  v28[10] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("blackPearlFinalRuleVersion"), 12, 13, 0);
  v28[11] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("blackPearlBreakthroughVersion"), 13, 13, 0);
  v28[12] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reasonCodes"), 14, 13, 0);
  v28[13] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("currCategoryView"), 15, 4, 0);
  v28[14] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("prevCategoryView"), 16, 4, 0);
  v28[15] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBreakthrough"), 17, 12, 0);
  v28[16] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBlackPearlEnabled"), 18, 12, 0);
  v28[17] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("elapsedTimeSinceEmailReceived"), 19, 13, 0);
  v28[18] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("recategorizationBy"), 20, 4, 0);
  v28[19] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isThread"), 21, 12, 0);
  v28[20] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("senderId"), 22, 13, 0);
  v28[21] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("receivingAccountDomain"), 23, 4, 0);
  v28[22] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasIcloudAccountEnabled"), 24, 12, 0);
  v28[23] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
