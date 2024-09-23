@implementation BMSiriAssistantSuggestionFeaturesiCloudFeatures

- (BMSiriAssistantSuggestionFeaturesiCloudFeatures)initWithDaysSinceAccountCreated:(id)a3 isInFamily:(id)a4 isHeadOfFamily:(id)a5 subscriptionStatus:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMSiriAssistantSuggestionFeaturesiCloudFeatures *v14;
  int v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMSiriAssistantSuggestionFeaturesiCloudFeatures;
  v14 = -[BMEventBase init](&v17, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasDaysSinceAccountCreated = 1;
      v15 = objc_msgSend(v10, "intValue");
    }
    else
    {
      v14->_hasDaysSinceAccountCreated = 0;
      v15 = -1;
    }
    v14->_daysSinceAccountCreated = v15;
    if (v11)
    {
      v14->_hasIsInFamily = 1;
      v14->_isInFamily = objc_msgSend(v11, "BOOLValue");
    }
    else
    {
      v14->_hasIsInFamily = 0;
      v14->_isInFamily = 0;
    }
    if (v12)
    {
      v14->_hasIsHeadOfFamily = 1;
      v14->_isHeadOfFamily = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v14->_hasIsHeadOfFamily = 0;
      v14->_isHeadOfFamily = 0;
    }
    objc_storeStrong((id *)&v14->_subscriptionStatus, a6);
  }

  return v14;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures daysSinceAccountCreated](self, "daysSinceAccountCreated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isInFamily](self, "isInFamily"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isHeadOfFamily](self, "isHeadOfFamily"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesiCloudFeatures subscriptionStatus](self, "subscriptionStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeaturesiCloudFeatures with daysSinceAccountCreated: %@, isInFamily: %@, isHeadOfFamily: %@, subscriptionStatus: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriAssistantSuggestionFeaturesiCloudFeatures *v5;
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
  uint64_t v41;
  NSString *subscriptionStatus;
  BOOL v43;
  uint64_t v44;
  BMSiriAssistantSuggestionFeaturesiCloudFeatures *v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMSiriAssistantSuggestionFeaturesiCloudFeatures;
  v5 = -[BMEventBase init](&v47, sel_init);
  if (!v5)
    goto LABEL_60;
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
          v5->_hasDaysSinceAccountCreated = 1;
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
                  goto LABEL_47;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_47:
          v5->_daysSinceAccountCreated = v22;
          continue;
        case 2u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v5->_hasIsInFamily = 1;
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
              goto LABEL_49;
            v27 += 7;
            v17 = v28++ >= 9;
            if (v17)
            {
              v29 = 0;
              goto LABEL_51;
            }
          }
          v4[*v8] = 1;
LABEL_49:
          if (v4[*v8])
            v29 = 0;
LABEL_51:
          v43 = v29 != 0;
          v44 = 17;
          goto LABEL_56;
        case 3u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v5->_hasIsHeadOfFamily = 1;
          break;
        case 4u:
          PBReaderReadString();
          v41 = objc_claimAutoreleasedReturnValue();
          subscriptionStatus = v5->_subscriptionStatus;
          v5->_subscriptionStatus = (NSString *)v41;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_59;
          continue;
      }
      while (1)
      {
        v37 = *v6;
        v38 = *(_QWORD *)&v4[v37];
        v39 = v38 + 1;
        if (v38 == -1 || v39 > *(_QWORD *)&v4[*v7])
          break;
        v40 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
        *(_QWORD *)&v4[v37] = v39;
        v36 |= (unint64_t)(v40 & 0x7F) << v34;
        if ((v40 & 0x80) == 0)
          goto LABEL_53;
        v34 += 7;
        v17 = v35++ >= 9;
        if (v17)
        {
          v36 = 0;
          goto LABEL_55;
        }
      }
      v4[*v8] = 1;
LABEL_53:
      if (v4[*v8])
        v36 = 0;
LABEL_55:
      v43 = v36 != 0;
      v44 = 19;
LABEL_56:
      *((_BYTE *)&v5->super.super.isa + v44) = v43;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_59:
    v45 = 0;
  else
LABEL_60:
    v45 = v5;

  return v45;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasDaysSinceAccountCreated)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasIsInFamily)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsHeadOfFamily)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_subscriptionStatus)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriAssistantSuggestionFeaturesiCloudFeatures writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeaturesiCloudFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMSiriAssistantSuggestionFeaturesiCloudFeatures *v11;
  id v12;
  void *v13;
  id v14;
  BMSiriAssistantSuggestionFeaturesiCloudFeatures *v15;
  id v16;
  uint64_t v17;
  id *v18;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id v29;
  id v30;
  id *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("daysSinceAccountCreated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isInFamily"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = a4;
        v21 = *MEMORY[0x1E0D025B8];
        v37 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isInFamily"));
        v38 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2, v10);
        v15 = 0;
        a4 = 0;
        *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isHeadOfFamily"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v35 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isHeadOfFamily"));
        v36 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v23, 2, v13);
        v15 = 0;
        v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      v12 = v10;
    }
    else
    {
      v11 = self;
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subscriptionStatus"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = -[BMSiriAssistantSuggestionFeaturesiCloudFeatures initWithDaysSinceAccountCreated:isInFamily:isHeadOfFamily:subscriptionStatus:](v11, "initWithDaysSinceAccountCreated:isInFamily:isHeadOfFamily:subscriptionStatus:", v8, v31, v12, v14);
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D025B8];
      v33 = *MEMORY[0x1E0CB2D50];
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subscriptionStatus"));
      v34 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v26);

    }
    v14 = 0;
    v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v15 = 0;
    v8 = 0;
    goto LABEL_36;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v39 = *MEMORY[0x1E0CB2D50];
  v18 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("daysSinceAccountCreated"));
  v40[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = 0;
  *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v9);
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasDaysSinceAccountCreated](self, "hasDaysSinceAccountCreated"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures daysSinceAccountCreated](self, "daysSinceAccountCreated"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasIsInFamily](self, "hasIsInFamily"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isInFamily](self, "isInFamily"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasIsHeadOfFamily](self, "hasIsHeadOfFamily"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isHeadOfFamily](self, "isHeadOfFamily"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[BMSiriAssistantSuggestionFeaturesiCloudFeatures subscriptionStatus](self, "subscriptionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("daysSinceAccountCreated");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("isInFamily");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("isHeadOfFamily");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("subscriptionStatus");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_20;
  }
  else
  {

    if (v5)
    {
LABEL_20:
      if (v4)
        goto LABEL_21;
LABEL_25:

      if (v3)
        goto LABEL_22;
LABEL_26:

      goto LABEL_22;
    }
  }

  if (!v4)
    goto LABEL_25;
LABEL_21:
  if (!v3)
    goto LABEL_26;
LABEL_22:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  char v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((!-[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasDaysSinceAccountCreated](self, "hasDaysSinceAccountCreated")&& !objc_msgSend(v5, "hasDaysSinceAccountCreated")|| -[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasDaysSinceAccountCreated](self, "hasDaysSinceAccountCreated")&& objc_msgSend(v5, "hasDaysSinceAccountCreated")&& (v6 = -[BMSiriAssistantSuggestionFeaturesiCloudFeatures daysSinceAccountCreated](self, "daysSinceAccountCreated"), v6 == objc_msgSend(v5, "daysSinceAccountCreated")))&& (!-[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasIsInFamily](self, "hasIsInFamily")&& !objc_msgSend(v5, "hasIsInFamily")|| -[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasIsInFamily](self, "hasIsInFamily")&& objc_msgSend(v5, "hasIsInFamily")&& (v7 = -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isInFamily](self, "isInFamily"), v7 == objc_msgSend(v5, "isInFamily")))&& (!-[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasIsHeadOfFamily](self, "hasIsHeadOfFamily")&& !objc_msgSend(v5, "hasIsHeadOfFamily")
       || -[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasIsHeadOfFamily](self, "hasIsHeadOfFamily")
       && objc_msgSend(v5, "hasIsHeadOfFamily")
       && (v8 = -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isHeadOfFamily](self, "isHeadOfFamily"),
           v8 == objc_msgSend(v5, "isHeadOfFamily"))))
    {
      -[BMSiriAssistantSuggestionFeaturesiCloudFeatures subscriptionStatus](self, "subscriptionStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subscriptionStatus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v9 = 1;
      }
      else
      {
        -[BMSiriAssistantSuggestionFeaturesiCloudFeatures subscriptionStatus](self, "subscriptionStatus");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "subscriptionStatus");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v13, "isEqual:", v14);

      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)daysSinceAccountCreated
{
  return self->_daysSinceAccountCreated;
}

- (BOOL)hasDaysSinceAccountCreated
{
  return self->_hasDaysSinceAccountCreated;
}

- (void)setHasDaysSinceAccountCreated:(BOOL)a3
{
  self->_hasDaysSinceAccountCreated = a3;
}

- (BOOL)isInFamily
{
  return self->_isInFamily;
}

- (BOOL)hasIsInFamily
{
  return self->_hasIsInFamily;
}

- (void)setHasIsInFamily:(BOOL)a3
{
  self->_hasIsInFamily = a3;
}

- (BOOL)isHeadOfFamily
{
  return self->_isHeadOfFamily;
}

- (BOOL)hasIsHeadOfFamily
{
  return self->_hasIsHeadOfFamily;
}

- (void)setHasIsHeadOfFamily:(BOOL)a3
{
  self->_hasIsHeadOfFamily = a3;
}

- (NSString)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
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

    v4 = -[BMSiriAssistantSuggestionFeaturesiCloudFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeaturesiCloudFeatures alloc], "initByReadFrom:", v7);
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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("daysSinceAccountCreated"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isInFamily"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isHeadOfFamily"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subscriptionStatus"), 2, 0, 4, 13, 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B2F8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("daysSinceAccountCreated"), 1, 2, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isInFamily"), 2, 12, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isHeadOfFamily"), 3, 12, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subscriptionStatus"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
