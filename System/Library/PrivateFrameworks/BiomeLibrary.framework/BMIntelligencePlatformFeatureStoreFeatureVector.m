@implementation BMIntelligencePlatformFeatureStoreFeatureVector

- (BMIntelligencePlatformFeatureStoreFeatureVector)initWithVersion:(id)a3 feature:(id)a4
{
  id v6;
  id v7;
  BMIntelligencePlatformFeatureStoreFeatureVector *v8;
  int v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureVector;
  v8 = -[BMEventBase init](&v11, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v8->_hasVersion = 1;
      v9 = objc_msgSend(v6, "intValue");
    }
    else
    {
      v8->_hasVersion = 0;
      v9 = -1;
    }
    v8->_version = v9;
    objc_storeStrong((id *)&v8->_feature, a4);
  }

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligencePlatformFeatureStoreFeatureVector version](self, "version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeatureVector feature](self, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligencePlatformFeatureStoreFeatureVector with version: %@, feature: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligencePlatformFeatureStoreFeatureVector *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSArray *feature;
  int v32;
  BMIntelligencePlatformFeatureStoreFeatureVector *v33;
  objc_super v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureVector;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_40;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v18 = v12++ >= 9;
        if (v18)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      if ((v13 >> 3) == 2)
      {
        v36 = 0;
        v37 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v28 = -[BMIntelligencePlatformFeatureStoreFeature initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeature alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_42:

          goto LABEL_39;
        }
        v29 = v28;
        objc_msgSend(v6, "addObject:", v28);
        PBReaderRecallMark();

      }
      else if ((v13 >> 3) == 1)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v5->_hasVersion = 1;
        while (1)
        {
          v24 = *v7;
          v25 = *(_QWORD *)&v4[v24];
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)&v4[*v8])
            break;
          v27 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v25);
          *(_QWORD *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0)
            goto LABEL_34;
          v21 += 7;
          v18 = v22++ >= 9;
          if (v18)
          {
            LODWORD(v23) = 0;
            goto LABEL_36;
          }
        }
        v4[*v9] = 1;
LABEL_34:
        if (v4[*v9])
          LODWORD(v23) = 0;
LABEL_36:
        v5->_version = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_42;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v30 = objc_msgSend(v6, "copy");
  feature = v5->_feature;
  v5->_feature = (NSArray *)v30;

  v32 = v4[*v9];
  if (v32)
LABEL_39:
    v33 = 0;
  else
LABEL_40:
    v33 = v5;

  return v33;
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
  if (self->_hasVersion)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_feature;
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

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligencePlatformFeatureStoreFeatureVector writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligencePlatformFeatureStoreFeatureVector)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  BMIntelligencePlatformFeatureStoreFeature *v19;
  BMIntelligencePlatformFeatureStoreFeature *v20;
  id v21;
  BMIntelligencePlatformFeatureStoreFeatureVector *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v32;
  uint64_t v33;
  void *v34;
  BMIntelligencePlatformFeatureStoreFeatureVector *v35;
  id *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v52 = *MEMORY[0x1E0CB2D50];
        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("version"));
        v53[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v12);
        v22 = 0;
        v8 = 0;
        *a4 = v25;
        goto LABEL_33;
      }
      v22 = 0;
      v8 = 0;
      goto LABEL_35;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("feature"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  v36 = a4;
  if (v11)
  {
    v38 = v6;
    v39 = v8;
    v37 = v7;

    v9 = 0;
LABEL_9:
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v9 = v9;
    v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (!v13)
      goto LABEL_19;
    v14 = v13;
    v15 = *(_QWORD *)v42;
    v35 = self;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v15)
        objc_enumerationMutation(v9);
      v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self = v35;
        v7 = v37;
        v6 = v38;
        if (v36)
        {
          v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v27 = *MEMORY[0x1E0D025B8];
          v47 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("feature"));
          v48 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *v36 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v28);
          goto LABEL_31;
        }
        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      v18 = v17;
      v19 = [BMIntelligencePlatformFeatureStoreFeature alloc];
      v40 = 0;
      v20 = -[BMIntelligencePlatformFeatureStoreFeature initWithJSONDictionary:error:](v19, "initWithJSONDictionary:error:", v18, &v40);
      v21 = v40;
      if (v21)
      {
        v28 = v21;
        if (v36)
          *v36 = objc_retainAutorelease(v21);

        self = v35;
        v7 = v37;
        v6 = v38;
LABEL_31:

        goto LABEL_32;
      }
      objc_msgSend(v12, "addObject:", v20);

      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        self = v35;
        if (v14)
          goto LABEL_11;
LABEL_19:

        v8 = v39;
        self = -[BMIntelligencePlatformFeatureStoreFeatureVector initWithVersion:feature:](self, "initWithVersion:feature:", v39, v12);
        v22 = self;
        v7 = v37;
        v6 = v38;
LABEL_33:

        goto LABEL_34;
      }
    }
    self = v35;
    v7 = v37;
    v6 = v38;
    if (v36)
    {
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = *MEMORY[0x1E0D025B8];
      v45 = *MEMORY[0x1E0CB2D50];
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("feature"));
      v46 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *v36 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v28);
      goto LABEL_31;
    }
LABEL_32:

    v22 = 0;
    v8 = v39;
    goto LABEL_33;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v38 = v6;
    v39 = v8;
    v37 = v7;
    goto LABEL_9;
  }
  if (a4)
  {
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v33 = *MEMORY[0x1E0D025B8];
    v50 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("feature"));
    v51 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v34);

    v22 = 0;
    goto LABEL_33;
  }
  v22 = 0;
LABEL_34:

LABEL_35:
  return v22;
}

- (id)_featureJSONArray
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
  -[BMIntelligencePlatformFeatureStoreFeatureVector feature](self, "feature", 0);
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (-[BMIntelligencePlatformFeatureStoreFeatureVector hasVersion](self, "hasVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligencePlatformFeatureStoreFeatureVector version](self, "version"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMIntelligencePlatformFeatureStoreFeatureVector _featureJSONArray](self, "_featureJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("version");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("feature");
  v10[0] = v5;
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    if (v3)
      goto LABEL_10;
LABEL_12:

    goto LABEL_10;
  }
  if (!v3)
    goto LABEL_12;
LABEL_10:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!-[BMIntelligencePlatformFeatureStoreFeatureVector hasVersion](self, "hasVersion")
      && !objc_msgSend(v5, "hasVersion")
      || -[BMIntelligencePlatformFeatureStoreFeatureVector hasVersion](self, "hasVersion")
      && objc_msgSend(v5, "hasVersion")
      && (v6 = -[BMIntelligencePlatformFeatureStoreFeatureVector version](self, "version"),
          v6 == objc_msgSend(v5, "version")))
    {
      -[BMIntelligencePlatformFeatureStoreFeatureVector feature](self, "feature");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "feature");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {
        v11 = 1;
      }
      else
      {
        -[BMIntelligencePlatformFeatureStoreFeatureVector feature](self, "feature");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "feature");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)version
{
  return self->_version;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (NSArray)feature
{
  return self->_feature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
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

    v4 = -[BMIntelligencePlatformFeatureStoreFeatureVector initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureVector alloc], "initByReadFrom:", v7);
    v4[5] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("version"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("feature_json"), 5, 1, &__block_literal_global_279);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AFF8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("version"), 1, 2, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("feature"), 2, 14, objc_opt_class());
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __58__BMIntelligencePlatformFeatureStoreFeatureVector_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_featureJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
