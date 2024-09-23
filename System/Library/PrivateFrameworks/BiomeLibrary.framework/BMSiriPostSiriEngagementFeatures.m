@implementation BMSiriPostSiriEngagementFeatures

- (BMSiriPostSiriEngagementFeatures)initWithTaskSuccess:(int)a3 isUserAbandoned:(id)a4 isUserCancelled:(id)a5 isSiriCompleted:(id)a6 isPromptInteraction:(id)a7 isConfirmInteraction:(id)a8 isDisambiguateInteraction:(id)a9 isUnsupportedPromptInteraction:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BMSiriPostSiriEngagementFeatures *v23;
  objc_super v25;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v25.receiver = self;
  v25.super_class = (Class)BMSiriPostSiriEngagementFeatures;
  v23 = -[BMEventBase init](&v25, sel_init);
  if (v23)
  {
    v23->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v23->_taskSuccess = a3;
    if (v16)
    {
      v23->_hasIsUserAbandoned = 1;
      v23->_isUserAbandoned = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v23->_hasIsUserAbandoned = 0;
      v23->_isUserAbandoned = 0;
    }
    if (v17)
    {
      v23->_hasIsUserCancelled = 1;
      v23->_isUserCancelled = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v23->_hasIsUserCancelled = 0;
      v23->_isUserCancelled = 0;
    }
    if (v18)
    {
      v23->_hasIsSiriCompleted = 1;
      v23->_isSiriCompleted = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v23->_hasIsSiriCompleted = 0;
      v23->_isSiriCompleted = 0;
    }
    if (v19)
    {
      v23->_hasIsPromptInteraction = 1;
      v23->_isPromptInteraction = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v23->_hasIsPromptInteraction = 0;
      v23->_isPromptInteraction = 0;
    }
    if (v20)
    {
      v23->_hasIsConfirmInteraction = 1;
      v23->_isConfirmInteraction = objc_msgSend(v20, "BOOLValue");
    }
    else
    {
      v23->_hasIsConfirmInteraction = 0;
      v23->_isConfirmInteraction = 0;
    }
    if (v21)
    {
      v23->_hasIsDisambiguateInteraction = 1;
      v23->_isDisambiguateInteraction = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v23->_hasIsDisambiguateInteraction = 0;
      v23->_isDisambiguateInteraction = 0;
    }
    if (v22)
    {
      v23->_hasIsUnsupportedPromptInteraction = 1;
      v23->_isUnsupportedPromptInteraction = objc_msgSend(v22, "BOOLValue");
    }
    else
    {
      v23->_hasIsUnsupportedPromptInteraction = 0;
      v23->_isUnsupportedPromptInteraction = 0;
    }
  }

  return v23;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMSiriPostSiriEngagementFeaturesTaskSuccessAsString(-[BMSiriPostSiriEngagementFeatures taskSuccess](self, "taskSuccess"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUserAbandoned](self, "isUserAbandoned"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUserCancelled](self, "isUserCancelled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isSiriCompleted](self, "isSiriCompleted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isPromptInteraction](self, "isPromptInteraction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isConfirmInteraction](self, "isConfirmInteraction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isDisambiguateInteraction](self, "isDisambiguateInteraction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUnsupportedPromptInteraction](self, "isUnsupportedPromptInteraction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriPostSiriEngagementFeatures with taskSuccess: %@, isUserAbandoned: %@, isUserCancelled: %@, isSiriCompleted: %@, isPromptInteraction: %@, isConfirmInteraction: %@, isDisambiguateInteraction: %@, isUnsupportedPromptInteraction: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriPostSiriEngagementFeatures *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  BOOL v76;
  uint64_t v77;
  BMSiriPostSiriEngagementFeatures *v78;
  objc_super v80;

  v4 = a3;
  v80.receiver = self;
  v80.super_class = (Class)BMSiriPostSiriEngagementFeatures;
  v5 = -[BMEventBase init](&v80, sel_init);
  if (!v5)
    goto LABEL_116;
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
          v20 = 0;
          v21 = 0;
          v22 = 0;
          while (2)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
              *(_QWORD *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v17 = v21++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_81:
          if (v22 >= 5)
            LODWORD(v22) = 0;
          v5->_taskSuccess = v22;
          continue;
        case 2u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v5->_hasIsUserAbandoned = 1;
          while (1)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)&v4[*v7])
              break;
            v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0)
              goto LABEL_85;
            v27 += 7;
            v17 = v28++ >= 9;
            if (v17)
            {
              v29 = 0;
              goto LABEL_87;
            }
          }
          v4[*v8] = 1;
LABEL_85:
          if (v4[*v8])
            v29 = 0;
LABEL_87:
          v76 = v29 != 0;
          v77 = 16;
          goto LABEL_112;
        case 3u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v5->_hasIsUserCancelled = 1;
          while (2)
          {
            v37 = *v6;
            v38 = *(_QWORD *)&v4[v37];
            v39 = v38 + 1;
            if (v38 == -1 || v39 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
              *(_QWORD *)&v4[v37] = v39;
              v36 |= (unint64_t)(v40 & 0x7F) << v34;
              if (v40 < 0)
              {
                v34 += 7;
                v17 = v35++ >= 9;
                if (v17)
                {
                  v36 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v36 = 0;
LABEL_91:
          v76 = v36 != 0;
          v77 = 18;
          goto LABEL_112;
        case 4u:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v5->_hasIsSiriCompleted = 1;
          while (2)
          {
            v44 = *v6;
            v45 = *(_QWORD *)&v4[v44];
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v45);
              *(_QWORD *)&v4[v44] = v46;
              v43 |= (unint64_t)(v47 & 0x7F) << v41;
              if (v47 < 0)
              {
                v41 += 7;
                v17 = v42++ >= 9;
                if (v17)
                {
                  v43 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v43 = 0;
LABEL_95:
          v76 = v43 != 0;
          v77 = 20;
          goto LABEL_112;
        case 5u:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          v5->_hasIsPromptInteraction = 1;
          while (2)
          {
            v51 = *v6;
            v52 = *(_QWORD *)&v4[v51];
            v53 = v52 + 1;
            if (v52 == -1 || v53 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v52);
              *(_QWORD *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                v17 = v49++ >= 9;
                if (v17)
                {
                  v50 = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v50 = 0;
LABEL_99:
          v76 = v50 != 0;
          v77 = 22;
          goto LABEL_112;
        case 6u:
          v55 = 0;
          v56 = 0;
          v57 = 0;
          v5->_hasIsConfirmInteraction = 1;
          while (2)
          {
            v58 = *v6;
            v59 = *(_QWORD *)&v4[v58];
            v60 = v59 + 1;
            if (v59 == -1 || v60 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v59);
              *(_QWORD *)&v4[v58] = v60;
              v57 |= (unint64_t)(v61 & 0x7F) << v55;
              if (v61 < 0)
              {
                v55 += 7;
                v17 = v56++ >= 9;
                if (v17)
                {
                  v57 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v57 = 0;
LABEL_103:
          v76 = v57 != 0;
          v77 = 24;
          goto LABEL_112;
        case 7u:
          v62 = 0;
          v63 = 0;
          v64 = 0;
          v5->_hasIsDisambiguateInteraction = 1;
          while (2)
          {
            v65 = *v6;
            v66 = *(_QWORD *)&v4[v65];
            v67 = v66 + 1;
            if (v66 == -1 || v67 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v68 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v66);
              *(_QWORD *)&v4[v65] = v67;
              v64 |= (unint64_t)(v68 & 0x7F) << v62;
              if (v68 < 0)
              {
                v62 += 7;
                v17 = v63++ >= 9;
                if (v17)
                {
                  v64 = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v64 = 0;
LABEL_107:
          v76 = v64 != 0;
          v77 = 26;
          goto LABEL_112;
        case 8u:
          v69 = 0;
          v70 = 0;
          v71 = 0;
          v5->_hasIsUnsupportedPromptInteraction = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_115;
          continue;
      }
      while (1)
      {
        v72 = *v6;
        v73 = *(_QWORD *)&v4[v72];
        v74 = v73 + 1;
        if (v73 == -1 || v74 > *(_QWORD *)&v4[*v7])
          break;
        v75 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v73);
        *(_QWORD *)&v4[v72] = v74;
        v71 |= (unint64_t)(v75 & 0x7F) << v69;
        if ((v75 & 0x80) == 0)
          goto LABEL_109;
        v69 += 7;
        v17 = v70++ >= 9;
        if (v17)
        {
          v71 = 0;
          goto LABEL_111;
        }
      }
      v4[*v8] = 1;
LABEL_109:
      if (v4[*v8])
        v71 = 0;
LABEL_111:
      v76 = v71 != 0;
      v77 = 28;
LABEL_112:
      *((_BYTE *)&v5->super.super.isa + v77) = v76;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_115:
    v78 = 0;
  else
LABEL_116:
    v78 = v5;

  return v78;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasIsUserAbandoned)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsUserCancelled)
    PBDataWriterWriteBOOLField();
  v4 = v5;
  if (self->_hasIsSiriCompleted)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsPromptInteraction)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsConfirmInteraction)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsDisambiguateInteraction)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsUnsupportedPromptInteraction)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriPostSiriEngagementFeatures writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriPostSiriEngagementFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  BMSiriPostSiriEngagementFeatures *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BMSiriPostSiriEngagementFeatures *v20;
  id v21;
  void *v22;
  id v23;
  BMSiriPostSiriEngagementFeatures *v24;
  void *v25;
  void *v26;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  id *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id *v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskSuccess"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isUserAbandoned"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = a4;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v24 = 0;
          goto LABEL_43;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v99 = *MEMORY[0x1E0CB2D50];
        v30 = v10;
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v70 = objc_opt_class();
        v32 = v31;
        v10 = v30;
        v26 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v70, CFSTR("isUserAbandoned"));
        v100 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v12);
        v24 = 0;
        v11 = 0;
        *v81 = v33;
        goto LABEL_42;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isUserCancelled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v7;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v26 = 0;
          v24 = 0;
          goto LABEL_42;
        }
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v80 = v11;
        v35 = *MEMORY[0x1E0D025B8];
        v97 = *MEMORY[0x1E0CB2D50];
        v36 = v10;
        v37 = objc_alloc(MEMORY[0x1E0CB3940]);
        v71 = objc_opt_class();
        v38 = v37;
        v10 = v36;
        v85 = (id)objc_msgSend(v38, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v71, CFSTR("isUserCancelled"));
        v98 = v85;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = v34;
        v25 = (void *)v39;
        v41 = v35;
        v11 = v80;
        v24 = 0;
        v26 = 0;
        *v81 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v39);
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      v17 = v12;
      v14 = self;
      v13 = v17;
      v84 = v17;
    }
    else
    {
      v13 = v12;
      v14 = self;
      v84 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSiriCompleted"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v8;
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v85 = 0;
          v24 = 0;
          v26 = v84;
          v25 = v15;
          self = v14;
          v12 = v13;
          v7 = v86;
          goto LABEL_41;
        }
        v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = v11;
        v44 = *MEMORY[0x1E0D025B8];
        v95 = *MEMORY[0x1E0CB2D50];
        v45 = v10;
        v46 = objc_alloc(MEMORY[0x1E0CB3940]);
        v72 = objc_opt_class();
        v47 = v46;
        v10 = v45;
        v82 = (id)objc_msgSend(v47, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v72, CFSTR("isSiriCompleted"));
        v96 = v82;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v42;
        v25 = v15;
        v49 = v44;
        v11 = v43;
        v24 = 0;
        v85 = 0;
        *v81 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v16);
        self = v14;
        v12 = v13;
        v7 = v86;
        goto LABEL_40;
      }
      v77 = v15;
      v85 = v15;
    }
    else
    {
      v77 = v15;
      v85 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPromptInteraction"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = v14;
    v79 = v11;
    if (v16)
    {
      objc_opt_class();
      v12 = v13;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        v7 = v86;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v82 = 0;
            v24 = 0;
            v25 = v77;
            goto LABEL_40;
          }
          v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v51 = *MEMORY[0x1E0D025B8];
          v93 = *MEMORY[0x1E0CB2D50];
          v52 = v10;
          v53 = objc_alloc(MEMORY[0x1E0CB3940]);
          v73 = objc_opt_class();
          v54 = v53;
          v10 = v52;
          v78 = (id)objc_msgSend(v54, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v73, CFSTR("isPromptInteraction"));
          v94 = v78;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v51;
          v11 = v79;
          v24 = 0;
          v82 = 0;
          *v81 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v55, 2, v18);
LABEL_39:
          v25 = v77;

LABEL_40:
          v8 = v83;
          v26 = v84;
          goto LABEL_41;
        }
        v82 = v16;
LABEL_27:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isConfirmInteraction"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v10;
        if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v78 = 0;
              v24 = 0;
              goto LABEL_39;
            }
            v20 = self;
            v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v62 = *MEMORY[0x1E0D025B8];
            v91 = *MEMORY[0x1E0CB2D50];
            v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isConfirmInteraction"));
            v92 = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v61;
            v10 = v76;
            v64 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v62, 2, v19);
            v24 = 0;
            v78 = 0;
            *a4 = v64;
            goto LABEL_38;
          }
          v78 = v18;
        }
        else
        {
          v78 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isDisambiguateInteraction"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          v20 = self;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v21 = 0;
              v24 = 0;
              goto LABEL_38;
            }
            v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v66 = *MEMORY[0x1E0D025B8];
            v89 = *MEMORY[0x1E0CB2D50];
            v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isDisambiguateInteraction"));
            v90 = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v22);
            v24 = 0;
            v21 = 0;
            *v81 = v67;
            goto LABEL_37;
          }
          v21 = v19;
        }
        else
        {
          v20 = self;
          v21 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isUnsupportedPromptInteraction"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v81)
            {
              v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v74 = *MEMORY[0x1E0D025B8];
              v87 = *MEMORY[0x1E0CB2D50];
              v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isUnsupportedPromptInteraction"));
              v88 = v68;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              *v81 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v74, 2, v69);

            }
            v23 = 0;
            v24 = 0;
            goto LABEL_37;
          }
          v23 = v22;
        }
        else
        {
          v23 = 0;
        }
        v24 = -[BMSiriPostSiriEngagementFeatures initWithTaskSuccess:isUserAbandoned:isUserCancelled:isSiriCompleted:isPromptInteraction:isConfirmInteraction:isDisambiguateInteraction:isUnsupportedPromptInteraction:](v20, "initWithTaskSuccess:isUserAbandoned:isUserCancelled:isSiriCompleted:isPromptInteraction:isConfirmInteraction:isDisambiguateInteraction:isUnsupportedPromptInteraction:", objc_msgSend(v83, "intValue"), v79, v84, v85, v82, v78, v21, v23);
        v20 = v24;
LABEL_37:

        v10 = v76;
LABEL_38:

        self = v20;
        v7 = v86;
        v11 = v79;
        goto LABEL_39;
      }
      v82 = 0;
    }
    else
    {
      v82 = 0;
      v12 = v13;
    }
    v7 = v86;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriPostSiriEngagementFeaturesTaskSuccessFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v24 = 0;
    goto LABEL_44;
  }
  v56 = a4;
  v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v58 = *MEMORY[0x1E0D025B8];
  v101 = *MEMORY[0x1E0CB2D50];
  v59 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("taskSuccess"));
  v102[0] = v59;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, &v101, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v58;
  v11 = (id)v59;
  v8 = 0;
  v24 = 0;
  *v56 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v60, 2, v10);
LABEL_43:

LABEL_44:
  return v24;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[8];
  _QWORD v29[10];

  v29[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriPostSiriEngagementFeatures taskSuccess](self, "taskSuccess"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMSiriPostSiriEngagementFeatures hasIsUserAbandoned](self, "hasIsUserAbandoned"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUserAbandoned](self, "isUserAbandoned"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMSiriPostSiriEngagementFeatures hasIsUserCancelled](self, "hasIsUserCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUserCancelled](self, "isUserCancelled"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMSiriPostSiriEngagementFeatures hasIsSiriCompleted](self, "hasIsSiriCompleted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isSiriCompleted](self, "isSiriCompleted"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BMSiriPostSiriEngagementFeatures hasIsPromptInteraction](self, "hasIsPromptInteraction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isPromptInteraction](self, "isPromptInteraction"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  if (-[BMSiriPostSiriEngagementFeatures hasIsConfirmInteraction](self, "hasIsConfirmInteraction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isConfirmInteraction](self, "isConfirmInteraction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMSiriPostSiriEngagementFeatures hasIsDisambiguateInteraction](self, "hasIsDisambiguateInteraction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isDisambiguateInteraction](self, "isDisambiguateInteraction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (-[BMSiriPostSiriEngagementFeatures hasIsUnsupportedPromptInteraction](self, "hasIsUnsupportedPromptInteraction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUnsupportedPromptInteraction](self, "isUnsupportedPromptInteraction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v28[0] = CFSTR("taskSuccess");
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v10;
  v29[0] = v10;
  v28[1] = CFSTR("isUserAbandoned");
  v11 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v3;
  v22 = (void *)v11;
  v29[1] = v11;
  v28[2] = CFSTR("isUserCancelled");
  v12 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v4;
  v21 = (void *)v12;
  v29[2] = v12;
  v28[3] = CFSTR("isSiriCompleted");
  v13 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v5;
  v29[3] = v13;
  v28[4] = CFSTR("isPromptInteraction");
  v14 = v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v6;
  v29[4] = v14;
  v28[5] = CFSTR("isConfirmInteraction");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[5] = v16;
  v28[6] = CFSTR("isDisambiguateInteraction");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[6] = v17;
  v28[7] = CFSTR("isUnsupportedPromptInteraction");
  v18 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_40;
LABEL_51:

    if (v7)
      goto LABEL_41;
    goto LABEL_52;
  }

  if (!v8)
    goto LABEL_51;
LABEL_40:
  if (v7)
    goto LABEL_41;
LABEL_52:

LABEL_41:
  if (!v27)

  if (!v15)
  if (!v24)

  if (!v25)
  {

    if (v26)
      goto LABEL_49;
LABEL_54:

    goto LABEL_49;
  }
  if (!v26)
    goto LABEL_54;
LABEL_49:

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v13;
  int v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMSiriPostSiriEngagementFeatures taskSuccess](self, "taskSuccess");
    if (v6 != objc_msgSend(v5, "taskSuccess"))
      goto LABEL_39;
    if (-[BMSiriPostSiriEngagementFeatures hasIsUserAbandoned](self, "hasIsUserAbandoned")
      || objc_msgSend(v5, "hasIsUserAbandoned"))
    {
      if (!-[BMSiriPostSiriEngagementFeatures hasIsUserAbandoned](self, "hasIsUserAbandoned"))
        goto LABEL_39;
      if (!objc_msgSend(v5, "hasIsUserAbandoned"))
        goto LABEL_39;
      v7 = -[BMSiriPostSiriEngagementFeatures isUserAbandoned](self, "isUserAbandoned");
      if (v7 != objc_msgSend(v5, "isUserAbandoned"))
        goto LABEL_39;
    }
    if (-[BMSiriPostSiriEngagementFeatures hasIsUserCancelled](self, "hasIsUserCancelled")
      || objc_msgSend(v5, "hasIsUserCancelled"))
    {
      if (!-[BMSiriPostSiriEngagementFeatures hasIsUserCancelled](self, "hasIsUserCancelled"))
        goto LABEL_39;
      if (!objc_msgSend(v5, "hasIsUserCancelled"))
        goto LABEL_39;
      v8 = -[BMSiriPostSiriEngagementFeatures isUserCancelled](self, "isUserCancelled");
      if (v8 != objc_msgSend(v5, "isUserCancelled"))
        goto LABEL_39;
    }
    if (-[BMSiriPostSiriEngagementFeatures hasIsSiriCompleted](self, "hasIsSiriCompleted")
      || objc_msgSend(v5, "hasIsSiriCompleted"))
    {
      if (!-[BMSiriPostSiriEngagementFeatures hasIsSiriCompleted](self, "hasIsSiriCompleted"))
        goto LABEL_39;
      if (!objc_msgSend(v5, "hasIsSiriCompleted"))
        goto LABEL_39;
      v9 = -[BMSiriPostSiriEngagementFeatures isSiriCompleted](self, "isSiriCompleted");
      if (v9 != objc_msgSend(v5, "isSiriCompleted"))
        goto LABEL_39;
    }
    if (-[BMSiriPostSiriEngagementFeatures hasIsPromptInteraction](self, "hasIsPromptInteraction")
      || objc_msgSend(v5, "hasIsPromptInteraction"))
    {
      if (!-[BMSiriPostSiriEngagementFeatures hasIsPromptInteraction](self, "hasIsPromptInteraction"))
        goto LABEL_39;
      if (!objc_msgSend(v5, "hasIsPromptInteraction"))
        goto LABEL_39;
      v10 = -[BMSiriPostSiriEngagementFeatures isPromptInteraction](self, "isPromptInteraction");
      if (v10 != objc_msgSend(v5, "isPromptInteraction"))
        goto LABEL_39;
    }
    if (-[BMSiriPostSiriEngagementFeatures hasIsConfirmInteraction](self, "hasIsConfirmInteraction")
      || objc_msgSend(v5, "hasIsConfirmInteraction"))
    {
      if (!-[BMSiriPostSiriEngagementFeatures hasIsConfirmInteraction](self, "hasIsConfirmInteraction"))
        goto LABEL_39;
      if (!objc_msgSend(v5, "hasIsConfirmInteraction"))
        goto LABEL_39;
      v11 = -[BMSiriPostSiriEngagementFeatures isConfirmInteraction](self, "isConfirmInteraction");
      if (v11 != objc_msgSend(v5, "isConfirmInteraction"))
        goto LABEL_39;
    }
    if (-[BMSiriPostSiriEngagementFeatures hasIsDisambiguateInteraction](self, "hasIsDisambiguateInteraction")
      || objc_msgSend(v5, "hasIsDisambiguateInteraction"))
    {
      if (!-[BMSiriPostSiriEngagementFeatures hasIsDisambiguateInteraction](self, "hasIsDisambiguateInteraction"))
        goto LABEL_39;
      if (!objc_msgSend(v5, "hasIsDisambiguateInteraction"))
        goto LABEL_39;
      v12 = -[BMSiriPostSiriEngagementFeatures isDisambiguateInteraction](self, "isDisambiguateInteraction");
      if (v12 != objc_msgSend(v5, "isDisambiguateInteraction"))
        goto LABEL_39;
    }
    if (!-[BMSiriPostSiriEngagementFeatures hasIsUnsupportedPromptInteraction](self, "hasIsUnsupportedPromptInteraction")&& !objc_msgSend(v5, "hasIsUnsupportedPromptInteraction"))
    {
      LOBYTE(v14) = 1;
      goto LABEL_40;
    }
    if (-[BMSiriPostSiriEngagementFeatures hasIsUnsupportedPromptInteraction](self, "hasIsUnsupportedPromptInteraction")&& objc_msgSend(v5, "hasIsUnsupportedPromptInteraction"))
    {
      v13 = -[BMSiriPostSiriEngagementFeatures isUnsupportedPromptInteraction](self, "isUnsupportedPromptInteraction");
      v14 = v13 ^ objc_msgSend(v5, "isUnsupportedPromptInteraction") ^ 1;
    }
    else
    {
LABEL_39:
      LOBYTE(v14) = 0;
    }
LABEL_40:

    goto LABEL_41;
  }
  LOBYTE(v14) = 0;
LABEL_41:

  return v14;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)taskSuccess
{
  return self->_taskSuccess;
}

- (BOOL)isUserAbandoned
{
  return self->_isUserAbandoned;
}

- (BOOL)hasIsUserAbandoned
{
  return self->_hasIsUserAbandoned;
}

- (void)setHasIsUserAbandoned:(BOOL)a3
{
  self->_hasIsUserAbandoned = a3;
}

- (BOOL)isUserCancelled
{
  return self->_isUserCancelled;
}

- (BOOL)hasIsUserCancelled
{
  return self->_hasIsUserCancelled;
}

- (void)setHasIsUserCancelled:(BOOL)a3
{
  self->_hasIsUserCancelled = a3;
}

- (BOOL)isSiriCompleted
{
  return self->_isSiriCompleted;
}

- (BOOL)hasIsSiriCompleted
{
  return self->_hasIsSiriCompleted;
}

- (void)setHasIsSiriCompleted:(BOOL)a3
{
  self->_hasIsSiriCompleted = a3;
}

- (BOOL)isPromptInteraction
{
  return self->_isPromptInteraction;
}

- (BOOL)hasIsPromptInteraction
{
  return self->_hasIsPromptInteraction;
}

- (void)setHasIsPromptInteraction:(BOOL)a3
{
  self->_hasIsPromptInteraction = a3;
}

- (BOOL)isConfirmInteraction
{
  return self->_isConfirmInteraction;
}

- (BOOL)hasIsConfirmInteraction
{
  return self->_hasIsConfirmInteraction;
}

- (void)setHasIsConfirmInteraction:(BOOL)a3
{
  self->_hasIsConfirmInteraction = a3;
}

- (BOOL)isDisambiguateInteraction
{
  return self->_isDisambiguateInteraction;
}

- (BOOL)hasIsDisambiguateInteraction
{
  return self->_hasIsDisambiguateInteraction;
}

- (void)setHasIsDisambiguateInteraction:(BOOL)a3
{
  self->_hasIsDisambiguateInteraction = a3;
}

- (BOOL)isUnsupportedPromptInteraction
{
  return self->_isUnsupportedPromptInteraction;
}

- (BOOL)hasIsUnsupportedPromptInteraction
{
  return self->_hasIsUnsupportedPromptInteraction;
}

- (void)setHasIsUnsupportedPromptInteraction:(BOOL)a3
{
  self->_hasIsUnsupportedPromptInteraction = a3;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMSiriPostSiriEngagementFeatures initByReadFrom:]([BMSiriPostSiriEngagementFeatures alloc], "initByReadFrom:", v6);
    v7[8] = 1;

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
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskSuccess"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isUserAbandoned"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isUserCancelled"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSiriCompleted"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPromptInteraction"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isConfirmInteraction"), 0, 0, 6, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isDisambiguateInteraction"), 0, 0, 7, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isUnsupportedPromptInteraction"), 0, 0, 8, 12, 0);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1EF70;
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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskSuccess"), 1, 4, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isUserAbandoned"), 2, 12, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isUserCancelled"), 3, 12, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSiriCompleted"), 4, 12, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPromptInteraction"), 5, 12, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isConfirmInteraction"), 6, 12, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isDisambiguateInteraction"), 7, 12, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isUnsupportedPromptInteraction"), 8, 12, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
