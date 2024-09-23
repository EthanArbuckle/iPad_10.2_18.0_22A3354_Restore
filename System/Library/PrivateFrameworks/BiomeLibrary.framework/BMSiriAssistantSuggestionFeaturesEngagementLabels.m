@implementation BMSiriAssistantSuggestionFeaturesEngagementLabels

- (BMSiriAssistantSuggestionFeaturesEngagementLabels)initWithWasSpoken:(id)a3 wasTapped:(id)a4 dwellTime:(id)a5 otherSuggestionTapped:(id)a6 otherSuggestionSpoken:(id)a7 position:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMSiriAssistantSuggestionFeaturesEngagementLabels *v20;
  uint64_t v21;
  int v22;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMSiriAssistantSuggestionFeaturesEngagementLabels;
  v20 = -[BMEventBase init](&v24, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v20->_hasWasSpoken = 1;
      v20->_wasSpoken = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      v20->_hasWasSpoken = 0;
      v20->_wasSpoken = 0;
    }
    if (v15)
    {
      v20->_hasWasTapped = 1;
      v20->_wasTapped = objc_msgSend(v15, "BOOLValue");
    }
    else
    {
      v20->_hasWasTapped = 0;
      v20->_wasTapped = 0;
    }
    if (v16)
    {
      v20->_hasDwellTime = 1;
      v21 = objc_msgSend(v16, "longLongValue");
    }
    else
    {
      v20->_hasDwellTime = 0;
      v21 = -1;
    }
    v20->_dwellTime = v21;
    if (v17)
    {
      v20->_hasOtherSuggestionTapped = 1;
      v20->_otherSuggestionTapped = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v20->_hasOtherSuggestionTapped = 0;
      v20->_otherSuggestionTapped = 0;
    }
    if (v18)
    {
      v20->_hasOtherSuggestionSpoken = 1;
      v20->_otherSuggestionSpoken = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v20->_hasOtherSuggestionSpoken = 0;
      v20->_otherSuggestionSpoken = 0;
    }
    if (v19)
    {
      v20->_hasPosition = 1;
      v22 = objc_msgSend(v19, "intValue");
    }
    else
    {
      v20->_hasPosition = 0;
      v22 = -1;
    }
    v20->_position = v22;
  }

  return v20;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels wasSpoken](self, "wasSpoken"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels wasTapped](self, "wasTapped"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels dwellTime](self, "dwellTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels otherSuggestionTapped](self, "otherSuggestionTapped"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels otherSuggestionSpoken](self, "otherSuggestionSpoken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels position](self, "position"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeaturesEngagementLabels with wasSpoken: %@, wasTapped: %@, dwellTime: %@, otherSuggestionTapped: %@, otherSuggestionSpoken: %@, position: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriAssistantSuggestionFeaturesEngagementLabels *v5;
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
  int64_t v36;
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
  BOOL v62;
  uint64_t v63;
  BMSiriAssistantSuggestionFeaturesEngagementLabels *v64;
  objc_super v66;

  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)BMSiriAssistantSuggestionFeaturesEngagementLabels;
  v5 = -[BMEventBase init](&v66, sel_init);
  if (!v5)
    goto LABEL_92;
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
          v5->_hasWasSpoken = 1;
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
              break;
            v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0)
              goto LABEL_65;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              v22 = 0;
              goto LABEL_67;
            }
          }
          v4[*v8] = 1;
LABEL_65:
          if (v4[*v8])
            v22 = 0;
LABEL_67:
          v62 = v22 != 0;
          v63 = 16;
          goto LABEL_84;
        case 2u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v5->_hasWasTapped = 1;
          while (2)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
              *(_QWORD *)&v4[v30] = v32;
              v29 |= (unint64_t)(v33 & 0x7F) << v27;
              if (v33 < 0)
              {
                v27 += 7;
                v17 = v28++ >= 9;
                if (v17)
                {
                  v29 = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v29 = 0;
LABEL_71:
          v62 = v29 != 0;
          v63 = 18;
          goto LABEL_84;
        case 3u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v5->_hasDwellTime = 1;
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
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v36 = 0;
LABEL_75:
          v5->_dwellTime = v36;
          continue;
        case 4u:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v5->_hasOtherSuggestionTapped = 1;
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
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v43 = 0;
LABEL_79:
          v62 = v43 != 0;
          v63 = 21;
          goto LABEL_84;
        case 5u:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          v5->_hasOtherSuggestionSpoken = 1;
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
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v50 = 0;
LABEL_83:
          v62 = v50 != 0;
          v63 = 23;
LABEL_84:
          *((_BYTE *)&v5->super.super.isa + v63) = v62;
          continue;
        case 6u:
          v55 = 0;
          v56 = 0;
          v57 = 0;
          v5->_hasPosition = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_91;
          continue;
      }
      while (1)
      {
        v58 = *v6;
        v59 = *(_QWORD *)&v4[v58];
        v60 = v59 + 1;
        if (v59 == -1 || v60 > *(_QWORD *)&v4[*v7])
          break;
        v61 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v59);
        *(_QWORD *)&v4[v58] = v60;
        v57 |= (unint64_t)(v61 & 0x7F) << v55;
        if ((v61 & 0x80) == 0)
          goto LABEL_86;
        v55 += 7;
        v17 = v56++ >= 9;
        if (v17)
        {
          LODWORD(v57) = 0;
          goto LABEL_88;
        }
      }
      v4[*v8] = 1;
LABEL_86:
      if (v4[*v8])
        LODWORD(v57) = 0;
LABEL_88:
      v5->_position = v57;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_91:
    v64 = 0;
  else
LABEL_92:
    v64 = v5;

  return v64;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasWasSpoken)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasWasTapped)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasDwellTime)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasOtherSuggestionTapped)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasOtherSuggestionSpoken)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasPosition)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriAssistantSuggestionFeaturesEngagementLabels writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeaturesEngagementLabels)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  BMSiriAssistantSuggestionFeaturesEngagementLabels *v17;
  id v18;
  id *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id *v28;
  uint64_t v29;
  id v30;
  id *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id *v52;
  id *v53;
  id v54;
  void *v55;
  id *v56;
  void *v57;
  id v58;
  id v59;
  BMSiriAssistantSuggestionFeaturesEngagementLabels *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id *v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wasSpoken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wasTapped"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          v17 = 0;
          goto LABEL_50;
        }
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v52 = a4;
        v23 = *MEMORY[0x1E0D025B8];
        v69 = *MEMORY[0x1E0CB2D50];
        v24 = v7;
        v25 = v8;
        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        v49 = objc_opt_class();
        v27 = v26;
        v8 = v25;
        v7 = v24;
        v28 = (id *)objc_msgSend(v27, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v49, CFSTR("wasTapped"));
        v70 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v23;
        a4 = v28;
        v17 = 0;
        v21 = 0;
        *v52 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v29, 2, v10);
        goto LABEL_49;
      }
      v59 = v9;
    }
    else
    {
      v59 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dwellTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = self;
    v57 = v9;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v17 = 0;
          v21 = v59;
          goto LABEL_49;
        }
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = a4;
        v32 = *MEMORY[0x1E0D025B8];
        v67 = *MEMORY[0x1E0CB2D50];
        v33 = v7;
        v34 = v8;
        v35 = objc_alloc(MEMORY[0x1E0CB3940]);
        v50 = objc_opt_class();
        v36 = v35;
        v8 = v34;
        v7 = v33;
        v58 = (id)objc_msgSend(v36, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v50, CFSTR("dwellTime"));
        v68 = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v32, 2, v11);
        v17 = 0;
        a4 = 0;
        *v31 = v37;
        v9 = v57;
        v21 = v59;
LABEL_48:

        self = v60;
LABEL_49:

        goto LABEL_50;
      }
      v56 = v10;
    }
    else
    {
      v56 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("otherSuggestionTapped"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v58 = 0;
          v17 = 0;
          v21 = v59;
          a4 = v56;
          goto LABEL_48;
        }
        v38 = v8;
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = *MEMORY[0x1E0D025B8];
        v65 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("otherSuggestionTapped"));
        v66 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v39;
        v8 = v38;
        v7 = v55;
        v42 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v40, 2, v12);
        v17 = 0;
        v58 = 0;
        *a4 = v42;
        goto LABEL_57;
      }
      v58 = v11;
    }
    else
    {
      v58 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("otherSuggestionSpoken"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = v8;
      v14 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v8;
      v14 = v12;
LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("position"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v16 = 0;
LABEL_19:
        a4 = v56;
        v17 = -[BMSiriAssistantSuggestionFeaturesEngagementLabels initWithWasSpoken:wasTapped:dwellTime:otherSuggestionTapped:otherSuggestionSpoken:position:](v60, "initWithWasSpoken:wasTapped:dwellTime:otherSuggestionTapped:otherSuggestionSpoken:position:", v13, v59, v56, v58, v14, v16);
        v60 = v17;
LABEL_46:

        v8 = v13;
        v7 = v55;
LABEL_47:

        v21 = v59;
        v9 = v57;
        goto LABEL_48;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        goto LABEL_19;
      }
      if (a4)
      {
        v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = *MEMORY[0x1E0D025B8];
        v61 = *MEMORY[0x1E0CB2D50];
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("position"));
        v62 = v46;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v51, 2, v47);

      }
      v16 = 0;
      v17 = 0;
LABEL_45:
      a4 = v56;
      goto LABEL_46;
    }
    if (a4)
    {
      v13 = v8;
      v53 = a4;
      v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v44 = *MEMORY[0x1E0D025B8];
      v63 = *MEMORY[0x1E0CB2D50];
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("otherSuggestionSpoken"));
      v64 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v15);
      v17 = 0;
      v14 = 0;
      *v53 = v45;
      goto LABEL_45;
    }
    v14 = 0;
    v17 = 0;
LABEL_57:
    a4 = v56;
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v17 = 0;
    v8 = 0;
    goto LABEL_51;
  }
  v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v19 = a4;
  v20 = *MEMORY[0x1E0D025B8];
  v71 = *MEMORY[0x1E0CB2D50];
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("wasSpoken"));
  v72[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = 0;
  *v19 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v20, 2, v9);
LABEL_50:

LABEL_51:
  return v17;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasWasSpoken](self, "hasWasSpoken"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels wasSpoken](self, "wasSpoken"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasWasTapped](self, "hasWasTapped"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels wasTapped](self, "wasTapped"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasDwellTime](self, "hasDwellTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels dwellTime](self, "dwellTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasOtherSuggestionTapped](self, "hasOtherSuggestionTapped"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels otherSuggestionTapped](self, "otherSuggestionTapped"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasOtherSuggestionSpoken](self, "hasOtherSuggestionSpoken"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels otherSuggestionSpoken](self, "otherSuggestionSpoken"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasPosition](self, "hasPosition"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels position](self, "position"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v21[0] = CFSTR("wasSpoken");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v9;
  v19 = (void *)v4;
  v22[0] = v9;
  v21[1] = CFSTR("wasTapped");
  v10 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v10;
  v21[2] = CFSTR("dwellTime");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = CFSTR("otherSuggestionTapped");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("otherSuggestionSpoken");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("position");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_33;
LABEL_40:

    if (v6)
      goto LABEL_34;
    goto LABEL_41;
  }

  if (!v7)
    goto LABEL_40;
LABEL_33:
  if (v6)
    goto LABEL_34;
LABEL_41:

LABEL_34:
  if (!v5)

  if (!v19)
  {

    if (v20)
      goto LABEL_38;
LABEL_43:

    goto LABEL_38;
  }
  if (!v20)
    goto LABEL_43;
LABEL_38:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int64_t v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasWasSpoken](self, "hasWasSpoken")
      || objc_msgSend(v5, "hasWasSpoken"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasWasSpoken](self, "hasWasSpoken"))
        goto LABEL_33;
      if (!objc_msgSend(v5, "hasWasSpoken"))
        goto LABEL_33;
      v6 = -[BMSiriAssistantSuggestionFeaturesEngagementLabels wasSpoken](self, "wasSpoken");
      if (v6 != objc_msgSend(v5, "wasSpoken"))
        goto LABEL_33;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasWasTapped](self, "hasWasTapped")
      || objc_msgSend(v5, "hasWasTapped"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasWasTapped](self, "hasWasTapped"))
        goto LABEL_33;
      if (!objc_msgSend(v5, "hasWasTapped"))
        goto LABEL_33;
      v7 = -[BMSiriAssistantSuggestionFeaturesEngagementLabels wasTapped](self, "wasTapped");
      if (v7 != objc_msgSend(v5, "wasTapped"))
        goto LABEL_33;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasDwellTime](self, "hasDwellTime")
      || objc_msgSend(v5, "hasDwellTime"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasDwellTime](self, "hasDwellTime"))
        goto LABEL_33;
      if (!objc_msgSend(v5, "hasDwellTime"))
        goto LABEL_33;
      v8 = -[BMSiriAssistantSuggestionFeaturesEngagementLabels dwellTime](self, "dwellTime");
      if (v8 != objc_msgSend(v5, "dwellTime"))
        goto LABEL_33;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasOtherSuggestionTapped](self, "hasOtherSuggestionTapped")
      || objc_msgSend(v5, "hasOtherSuggestionTapped"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasOtherSuggestionTapped](self, "hasOtherSuggestionTapped"))goto LABEL_33;
      if (!objc_msgSend(v5, "hasOtherSuggestionTapped"))
        goto LABEL_33;
      v9 = -[BMSiriAssistantSuggestionFeaturesEngagementLabels otherSuggestionTapped](self, "otherSuggestionTapped");
      if (v9 != objc_msgSend(v5, "otherSuggestionTapped"))
        goto LABEL_33;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasOtherSuggestionSpoken](self, "hasOtherSuggestionSpoken")
      || objc_msgSend(v5, "hasOtherSuggestionSpoken"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasOtherSuggestionSpoken](self, "hasOtherSuggestionSpoken"))goto LABEL_33;
      if (!objc_msgSend(v5, "hasOtherSuggestionSpoken"))
        goto LABEL_33;
      v10 = -[BMSiriAssistantSuggestionFeaturesEngagementLabels otherSuggestionSpoken](self, "otherSuggestionSpoken");
      if (v10 != objc_msgSend(v5, "otherSuggestionSpoken"))
        goto LABEL_33;
    }
    if (!-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasPosition](self, "hasPosition")
      && !objc_msgSend(v5, "hasPosition"))
    {
      v12 = 1;
      goto LABEL_34;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEngagementLabels hasPosition](self, "hasPosition")
      && objc_msgSend(v5, "hasPosition"))
    {
      v11 = -[BMSiriAssistantSuggestionFeaturesEngagementLabels position](self, "position");
      v12 = v11 == objc_msgSend(v5, "position");
    }
    else
    {
LABEL_33:
      v12 = 0;
    }
LABEL_34:

    goto LABEL_35;
  }
  v12 = 0;
LABEL_35:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)wasSpoken
{
  return self->_wasSpoken;
}

- (BOOL)hasWasSpoken
{
  return self->_hasWasSpoken;
}

- (void)setHasWasSpoken:(BOOL)a3
{
  self->_hasWasSpoken = a3;
}

- (BOOL)wasTapped
{
  return self->_wasTapped;
}

- (BOOL)hasWasTapped
{
  return self->_hasWasTapped;
}

- (void)setHasWasTapped:(BOOL)a3
{
  self->_hasWasTapped = a3;
}

- (int64_t)dwellTime
{
  return self->_dwellTime;
}

- (BOOL)hasDwellTime
{
  return self->_hasDwellTime;
}

- (void)setHasDwellTime:(BOOL)a3
{
  self->_hasDwellTime = a3;
}

- (BOOL)otherSuggestionTapped
{
  return self->_otherSuggestionTapped;
}

- (BOOL)hasOtherSuggestionTapped
{
  return self->_hasOtherSuggestionTapped;
}

- (void)setHasOtherSuggestionTapped:(BOOL)a3
{
  self->_hasOtherSuggestionTapped = a3;
}

- (BOOL)otherSuggestionSpoken
{
  return self->_otherSuggestionSpoken;
}

- (BOOL)hasOtherSuggestionSpoken
{
  return self->_hasOtherSuggestionSpoken;
}

- (void)setHasOtherSuggestionSpoken:(BOOL)a3
{
  self->_hasOtherSuggestionSpoken = a3;
}

- (int)position
{
  return self->_position;
}

- (BOOL)hasPosition
{
  return self->_hasPosition;
}

- (void)setHasPosition:(BOOL)a3
{
  self->_hasPosition = a3;
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

    v4 = -[BMSiriAssistantSuggestionFeaturesEngagementLabels initByReadFrom:]([BMSiriAssistantSuggestionFeaturesEngagementLabels alloc], "initByReadFrom:", v7);
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("wasSpoken"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("wasTapped"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dwellTime"), 0, 0, 3, 3, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("otherSuggestionTapped"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("otherSuggestionSpoken"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("position"), 0, 0, 6, 2, 0);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B298;
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("wasSpoken"), 1, 12, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("wasTapped"), 2, 12, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dwellTime"), 3, 3, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("otherSuggestionTapped"), 4, 12, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("otherSuggestionSpoken"), 5, 12, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("position"), 6, 2, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BMSiriAssistantSuggestionFeaturesEngagementLabels)initWithWasSpoken:(id)a3 wasTapped:(id)a4 dwellTime:(id)a5
{
  return -[BMSiriAssistantSuggestionFeaturesEngagementLabels initWithWasSpoken:wasTapped:dwellTime:otherSuggestionTapped:otherSuggestionSpoken:position:](self, "initWithWasSpoken:wasTapped:dwellTime:otherSuggestionTapped:otherSuggestionSpoken:position:", a3, a4, a5, 0, 0, 0);
}

@end
