@implementation BMIntelligencePlatformFeatureStore

- (BMIntelligencePlatformFeatureStore)initWithLabelName:(id)a3 labelValue:(id)a4 taskName:(id)a5 category:(int)a6 featureVector:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMIntelligencePlatformFeatureStore *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMIntelligencePlatformFeatureStore;
  v17 = -[BMEventBase init](&v19, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_labelName, a3);
    objc_storeStrong((id *)&v17->_labelValue, a4);
    objc_storeStrong((id *)&v17->_taskName, a5);
    v17->_category = a6;
    objc_storeStrong((id *)&v17->_featureVector, a7);
  }

  return v17;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMIntelligencePlatformFeatureStore labelName](self, "labelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStore labelValue](self, "labelValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStore taskName](self, "taskName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMIntelligencePlatformFeatureStoreCategoryTypeAsString(-[BMIntelligencePlatformFeatureStore category](self, "category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStore featureVector](self, "featureVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligencePlatformFeatureStore with labelName: %@, labelValue: %@, taskName: %@, category: %@, featureVector: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligencePlatformFeatureStore *v5;
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
  void *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  BMIntelligencePlatformFeatureStoreFeatureVector *v30;
  BMIntelligencePlatformFeatureStoreFeatureVector *featureVector;
  BMIntelligencePlatformFeatureStore *v32;
  objc_super v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMIntelligencePlatformFeatureStore;
  v5 = -[BMEventBase init](&v34, sel_init);
  if (!v5)
    goto LABEL_45;
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
          v21 = 24;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
LABEL_25:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 4u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          break;
        case 5u:
          v35 = 0;
          v36 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_44;
          v30 = -[BMIntelligencePlatformFeatureStoreFeatureVector initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureVector alloc], "initByReadFrom:", v4);
          if (!v30)
            goto LABEL_44;
          featureVector = v5->_featureVector;
          v5->_featureVector = v30;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_44;
          continue;
      }
      while (1)
      {
        v26 = *v6;
        v27 = *(_QWORD *)&v4[v26];
        v28 = v27 + 1;
        if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
          break;
        v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
        *(_QWORD *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0)
          goto LABEL_37;
        v23 += 7;
        v17 = v24++ >= 9;
        if (v17)
        {
          LODWORD(v25) = 0;
          goto LABEL_39;
        }
      }
      v4[*v8] = 1;
LABEL_37:
      if (v4[*v8])
        LODWORD(v25) = 0;
LABEL_39:
      if (v25 >= 3)
        LODWORD(v25) = 0;
      v5->_category = v25;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_44:
    v32 = 0;
  else
LABEL_45:
    v32 = v5;

  return v32;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_labelName)
    PBDataWriterWriteStringField();
  if (self->_labelValue)
    PBDataWriterWriteStringField();
  if (self->_taskName)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_featureVector)
  {
    PBDataWriterPlaceMark();
    -[BMIntelligencePlatformFeatureStoreFeatureVector writeTo:](self->_featureVector, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligencePlatformFeatureStore writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligencePlatformFeatureStore)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id *v14;
  id v15;
  uint64_t v16;
  BMIntelligencePlatformFeatureStore *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  BMIntelligencePlatformFeatureStoreFeatureVector *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  id v32;
  id v33;
  BMIntelligencePlatformFeatureStore *v34;
  BMIntelligencePlatformFeatureStore *v35;
  id *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  BMIntelligencePlatformFeatureStoreFeatureVector *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("labelName"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("labelValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = a4;
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v39 = 0;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taskName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v8;
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v38 = 0;
            v17 = 0;
            goto LABEL_49;
          }
          v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v21 = *MEMORY[0x1E0D025B8];
          v45 = *MEMORY[0x1E0CB2D50];
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("taskName"));
          v46 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0;
          v17 = 0;
          *v36 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v11);
          goto LABEL_48;
        }
        v38 = v10;
      }
      else
      {
        v38 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v11;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v12 = 0;
              v17 = 0;
              goto LABEL_48;
            }
            v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v35 = self;
            v28 = *MEMORY[0x1E0D025B8];
            v43 = *MEMORY[0x1E0CB2D50];
            v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("category"));
            v44 = v22;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
            v23 = (BMIntelligencePlatformFeatureStoreFeatureVector *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            self = v35;
            v12 = 0;
            v17 = 0;
            *v36 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v29, 2, v23);
            goto LABEL_46;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMIntelligencePlatformFeatureStoreCategoryTypeFromString(v11));
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v13;
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("featureVector"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v23 = 0;
LABEL_33:
        self = -[BMIntelligencePlatformFeatureStore initWithLabelName:labelValue:taskName:category:featureVector:](self, "initWithLabelName:labelValue:taskName:category:featureVector:", v37, v39, v38, objc_msgSend(v12, "intValue"), v23);
        v17 = self;
LABEL_46:

LABEL_47:
LABEL_48:

        v8 = v37;
        goto LABEL_49;
      }
      v34 = self;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v22;
        v40 = 0;
        v23 = -[BMIntelligencePlatformFeatureStoreFeatureVector initWithJSONDictionary:error:]([BMIntelligencePlatformFeatureStoreFeatureVector alloc], "initWithJSONDictionary:error:", v24, &v40);
        v25 = v40;
        if (!v25)
        {

          self = v34;
          goto LABEL_33;
        }
        v26 = v25;
        if (v36)
          *v36 = objc_retainAutorelease(v25);

        v17 = 0;
        v22 = v24;
      }
      else
      {
        if (!v36)
        {
          v17 = 0;
          goto LABEL_47;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v41 = *MEMORY[0x1E0CB2D50];
        v23 = (BMIntelligencePlatformFeatureStoreFeatureVector *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("featureVector"));
        v42 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *v36 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v31, 2, v27);

        v17 = 0;
      }
      self = v34;
      goto LABEL_46;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = v9;
      goto LABEL_7;
    }
    if (a4)
    {
      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v19 = *MEMORY[0x1E0D025B8];
      v47 = *MEMORY[0x1E0CB2D50];
      v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("labelValue"));
      v48 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v17 = 0;
      *v36 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v10);
LABEL_49:

      goto LABEL_50;
    }
    v39 = 0;
    v17 = 0;
LABEL_50:

    goto LABEL_51;
  }
  if (a4)
  {
    v14 = a4;
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0D025B8];
    v49 = *MEMORY[0x1E0CB2D50];
    v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("labelName"));
    v50[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v17 = 0;
    *v14 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v9);
    goto LABEL_50;
  }
  v8 = 0;
  v17 = 0;
LABEL_51:

  return v17;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
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
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  -[BMIntelligencePlatformFeatureStore labelName](self, "labelName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStore labelValue](self, "labelValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStore taskName](self, "taskName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligencePlatformFeatureStore category](self, "category"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStore featureVector](self, "featureVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = CFSTR("labelName");
  v9 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v16 = v9;
  v23[0] = v9;
  v19 = CFSTR("labelValue");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v9, v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[1] = v10;
  v20 = CFSTR("taskName");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v11;
  v21 = CFSTR("category");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[3] = v12;
  v22 = CFSTR("featureVector");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v18, 5, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
      goto LABEL_13;
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4)
      goto LABEL_15;
LABEL_20:

    if (v3)
      goto LABEL_16;
LABEL_21:

    goto LABEL_16;
  }
LABEL_19:

  if (!v4)
    goto LABEL_20;
LABEL_15:
  if (!v3)
    goto LABEL_21;
LABEL_16:

  return v14;
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
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligencePlatformFeatureStore labelName](self, "labelName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "labelName");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligencePlatformFeatureStore labelName](self, "labelName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "labelName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_18;
    }
    -[BMIntelligencePlatformFeatureStore labelValue](self, "labelValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "labelValue");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMIntelligencePlatformFeatureStore labelValue](self, "labelValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "labelValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_18;
    }
    -[BMIntelligencePlatformFeatureStore taskName](self, "taskName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskName");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMIntelligencePlatformFeatureStore taskName](self, "taskName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_18;
    }
    v25 = -[BMIntelligencePlatformFeatureStore category](self, "category");
    if (v25 == objc_msgSend(v5, "category"))
    {
      -[BMIntelligencePlatformFeatureStore featureVector](self, "featureVector");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "featureVector");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 == v27)
      {
        v12 = 1;
      }
      else
      {
        -[BMIntelligencePlatformFeatureStore featureVector](self, "featureVector");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "featureVector");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v28, "isEqual:", v29);

      }
      goto LABEL_19;
    }
LABEL_18:
    v12 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)labelName
{
  return self->_labelName;
}

- (NSString)labelValue
{
  return self->_labelValue;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (int)category
{
  return self->_category;
}

- (BMIntelligencePlatformFeatureStoreFeatureVector)featureVector
{
  return self->_featureVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVector, 0);
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_labelValue, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
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

    v4 = -[BMIntelligencePlatformFeatureStore initByReadFrom:]([BMIntelligencePlatformFeatureStore alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("labelName"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("labelValue"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("taskName"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("category"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("featureVector_json"), 5, 1, &__block_literal_global_316);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B010;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("labelName"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("labelValue"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("taskName"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("category"), 4, 4, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureVector"), 5, 14, objc_opt_class());
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __45__BMIntelligencePlatformFeatureStore_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureVector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
