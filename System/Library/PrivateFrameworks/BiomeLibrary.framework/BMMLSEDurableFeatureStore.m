@implementation BMMLSEDurableFeatureStore

- (BMMLSEDurableFeatureStore)initWithItemIdentifier:(id)a3 featureName:(int)a4 featureValue:(id)a5 featureVersion:(id)a6
{
  id v11;
  id v12;
  id v13;
  BMMLSEDurableFeatureStore *v14;
  unsigned int v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMMLSEDurableFeatureStore;
  v14 = -[BMEventBase init](&v17, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v14->_itemIdentifier, a3);
    v14->_featureName = a4;
    objc_storeStrong((id *)&v14->_featureValue, a5);
    if (v13)
    {
      v14->_hasFeatureVersion = 1;
      v15 = objc_msgSend(v13, "unsignedIntValue");
    }
    else
    {
      v15 = 0;
      v14->_hasFeatureVersion = 0;
    }
    v14->_featureVersion = v15;
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
  -[BMMLSEDurableFeatureStore itemIdentifier](self, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMLSEDurableFeatureStorefeatureNameAsString(-[BMMLSEDurableFeatureStore featureName](self, "featureName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEDurableFeatureStore featureValue](self, "featureValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEDurableFeatureStore featureVersion](self, "featureVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEDurableFeatureStore with itemIdentifier: %@, featureName: %@, featureValue: %@, featureVersion: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEDurableFeatureStore *v5;
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
  NSString *itemIdentifier;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  BMMLSEDurableFeatureStoreFeatureValue *v29;
  BMMLSEDurableFeatureStoreFeatureValue *featureValue;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  BMMLSEDurableFeatureStore *v38;
  objc_super v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMMLSEDurableFeatureStore;
  v5 = -[BMEventBase init](&v40, sel_init);
  if (!v5)
    goto LABEL_53;
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
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          itemIdentifier = v5->_itemIdentifier;
          v5->_itemIdentifier = (NSString *)v20;

          break;
        case 3u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (1)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
              break;
            v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
            *(_QWORD *)&v4[v25] = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if ((v28 & 0x80) == 0)
              goto LABEL_41;
            v22 += 7;
            v17 = v23++ >= 9;
            if (v17)
            {
              LODWORD(v24) = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_43:
          if (v24 >= 0x1FE)
            LODWORD(v24) = 0;
          v5->_featureName = v24;
          break;
        case 4u:
          v41 = 0;
          v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_52;
          v29 = -[BMMLSEDurableFeatureStoreFeatureValue initByReadFrom:]([BMMLSEDurableFeatureStoreFeatureValue alloc], "initByReadFrom:", v4);
          if (!v29)
            goto LABEL_52;
          featureValue = v5->_featureValue;
          v5->_featureValue = v29;

          PBReaderRecallMark();
          break;
        case 5u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasFeatureVersion = 1;
          while (1)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)&v4[*v7])
              break;
            v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v36;
            v33 |= (unint64_t)(v37 & 0x7F) << v31;
            if ((v37 & 0x80) == 0)
              goto LABEL_47;
            v31 += 7;
            v17 = v32++ >= 9;
            if (v17)
            {
              LODWORD(v33) = 0;
              goto LABEL_49;
            }
          }
          v4[*v8] = 1;
LABEL_47:
          if (v4[*v8])
            LODWORD(v33) = 0;
LABEL_49:
          v5->_featureVersion = v33;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_52;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_52:
    v38 = 0;
  else
LABEL_53:
    v38 = v5;

  return v38;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_itemIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_featureValue)
  {
    PBDataWriterPlaceMark();
    -[BMMLSEDurableFeatureStoreFeatureValue writeTo:](self->_featureValue, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasFeatureVersion)
    PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSEDurableFeatureStore writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEDurableFeatureStore)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  BMMLSEDurableFeatureStore *v12;
  void *v13;
  BMMLSEDurableFeatureStoreFeatureValue *v14;
  void *v15;
  id v16;
  BMMLSEDurableFeatureStore *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v29;
  uint64_t v30;
  id v31;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  BMMLSEDurableFeatureStoreFeatureValue *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v33 = 0;
        v12 = 0;
        v17 = self;
        goto LABEL_42;
      }
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = *MEMORY[0x1E0D025B8];
      v41 = *MEMORY[0x1E0CB2D50];
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemIdentifier"));
      v42[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v12 = 0;
      *a4 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 2, v7);
      goto LABEL_47;
    }
    v33 = v6;
  }
  else
  {
    v33 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("featureName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v7;
LABEL_15:
        v8 = v9;
        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSEDurableFeatureStorefeatureNameFromString(v7));
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      if (a4)
      {
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v39 = *MEMORY[0x1E0CB2D50];
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("featureName"));
        v40 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v14 = (BMMLSEDurableFeatureStoreFeatureValue *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v14);
        v8 = 0;
        v12 = 0;
        *a4 = v27;
        goto LABEL_38;
      }
      v8 = 0;
      v12 = 0;
LABEL_47:
      v17 = self;
      goto LABEL_41;
    }
  }
  v8 = 0;
LABEL_16:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("featureValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v13;
        v34 = 0;
        v14 = -[BMMLSEDurableFeatureStoreFeatureValue initWithJSONDictionary:error:]([BMMLSEDurableFeatureStoreFeatureValue alloc], "initWithJSONDictionary:error:", v18, &v34);
        v19 = v34;
        if (!v19)
        {

          goto LABEL_19;
        }
        v20 = v19;
        if (a4)
          *a4 = objc_retainAutorelease(v19);

        v12 = 0;
        v13 = v18;
      }
      else
      {
        if (!a4)
        {
          v12 = 0;
          v17 = self;
          goto LABEL_40;
        }
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0D025B8];
        v37 = *MEMORY[0x1E0CB2D50];
        v14 = (BMMLSEDurableFeatureStoreFeatureValue *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("featureValue"));
        v38 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v21, 2, v22);

        v12 = 0;
      }
LABEL_38:
      v17 = self;
      goto LABEL_39;
    }
  }
  v14 = 0;
LABEL_19:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("featureVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v35 = *MEMORY[0x1E0CB2D50];
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("featureVersion"));
        v36 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v30, 2, v24);

      }
      v12 = 0;
      v16 = 0;
      v17 = self;
      goto LABEL_23;
    }
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  v17 = -[BMMLSEDurableFeatureStore initWithItemIdentifier:featureName:featureValue:featureVersion:](self, "initWithItemIdentifier:featureName:featureValue:featureVersion:", v33, objc_msgSend(v8, "intValue"), v14, v16);
  v12 = v17;
LABEL_23:

LABEL_39:
LABEL_40:

LABEL_41:
LABEL_42:

  return v12;
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
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  -[BMMLSEDurableFeatureStore itemIdentifier](self, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEDurableFeatureStore featureName](self, "featureName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEDurableFeatureStore featureValue](self, "featureValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMMLSEDurableFeatureStore hasFeatureVersion](self, "hasFeatureVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEDurableFeatureStore featureVersion](self, "featureVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v14[0] = CFSTR("itemIdentifier");
  v8 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v8;
  v14[1] = CFSTR("featureName");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v9;
  v14[2] = CFSTR("featureValue");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v10;
  v14[3] = CFSTR("featureVersion");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_14;
  }
  else
  {

    if (v6)
    {
LABEL_14:
      if (v4)
        goto LABEL_15;
LABEL_19:

      if (v3)
        goto LABEL_16;
LABEL_20:

      goto LABEL_16;
    }
  }

  if (!v4)
    goto LABEL_19;
LABEL_15:
  if (!v3)
    goto LABEL_20;
LABEL_16:

  return v12;
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
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  unsigned int v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMLSEDurableFeatureStore itemIdentifier](self, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMLSEDurableFeatureStore itemIdentifier](self, "itemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    v13 = -[BMMLSEDurableFeatureStore featureName](self, "featureName");
    if (v13 == objc_msgSend(v5, "featureName"))
    {
      -[BMMLSEDurableFeatureStore featureValue](self, "featureValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "featureValue");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMMLSEDurableFeatureStore featureValue](self, "featureValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "featureValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_17;
      }
      if (!-[BMMLSEDurableFeatureStore hasFeatureVersion](self, "hasFeatureVersion")
        && !objc_msgSend(v5, "hasFeatureVersion"))
      {
        v12 = 1;
        goto LABEL_18;
      }
      if (-[BMMLSEDurableFeatureStore hasFeatureVersion](self, "hasFeatureVersion")
        && objc_msgSend(v5, "hasFeatureVersion"))
      {
        v20 = -[BMMLSEDurableFeatureStore featureVersion](self, "featureVersion");
        v12 = v20 == objc_msgSend(v5, "featureVersion");
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int)featureName
{
  return self->_featureName;
}

- (BMMLSEDurableFeatureStoreFeatureValue)featureValue
{
  return self->_featureValue;
}

- (unsigned)featureVersion
{
  return self->_featureVersion;
}

- (BOOL)hasFeatureVersion
{
  return self->_hasFeatureVersion;
}

- (void)setHasFeatureVersion:(BOOL)a3
{
  self->_hasFeatureVersion = a3;
}

- (int)featureEntryType
{
  return self->_featureEntryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValue, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
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

    v4 = -[BMMLSEDurableFeatureStore initByReadFrom:]([BMMLSEDurableFeatureStore alloc], "initByReadFrom:", v7);
    v4[5] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("featureEntryType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemIdentifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("featureName"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("featureValue_json"), 5, 1, &__block_literal_global_1306);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("featureVersion"), 0, 0, 5, 4, 0);
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
  return &unk_1E5F1C6A8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureEntryType"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemIdentifier"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureName"), 3, 4, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureValue"), 4, 14, objc_opt_class());
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureVersion"), 5, 4, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __36__BMMLSEDurableFeatureStore_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMMLSEDurableFeatureStore)initWithFeatureEntryType:(int)a3 itemIdentifier:(id)a4 featureName:(int)a5 featureValue:(id)a6 featureVersion:(id)a7
{
  return -[BMMLSEDurableFeatureStore initWithItemIdentifier:featureName:featureValue:featureVersion:](self, "initWithItemIdentifier:featureName:featureValue:featureVersion:", a4, *(_QWORD *)&a5, a6, a7);
}

@end
