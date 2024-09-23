@implementation BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage

- (BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage)initWithKey:(id)a3 count:(id)a4 total:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage *v12;
  unsigned int v13;
  unsigned int v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage;
  v12 = -[BMEventBase init](&v16, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_key, a3);
    if (v10)
    {
      v12->_hasCount = 1;
      v13 = objc_msgSend(v10, "unsignedIntValue");
    }
    else
    {
      v13 = 0;
      v12->_hasCount = 0;
    }
    v12->_count = v13;
    if (v11)
    {
      v12->_hasTotal = 1;
      v14 = objc_msgSend(v11, "unsignedIntValue");
    }
    else
    {
      v14 = 0;
      v12->_hasTotal = 0;
    }
    v12->_total = v14;
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage count](self, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage total](self, "total"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage with key: %@, count: %@, total: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage *v5;
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
  unint64_t v20;
  uint64_t v21;
  NSString *key;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage *v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage;
  v5 = -[BMEventBase init](&v39, sel_init);
  if (!v5)
    goto LABEL_51;
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
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v5->_hasTotal = 1;
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
            goto LABEL_40;
          v23 += 7;
          v17 = v24++ >= 9;
          if (v17)
          {
            LODWORD(v25) = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8])
          LODWORD(v25) = 0;
LABEL_42:
        v36 = 28;
      }
      else
      {
        if ((_DWORD)v20 != 2)
        {
          if ((_DWORD)v20 == 1)
          {
            PBReaderReadString();
            v21 = objc_claimAutoreleasedReturnValue();
            key = v5->_key;
            v5->_key = (NSString *)v21;

          }
          else if (!PBReaderSkipValueWithTag())
          {
            goto LABEL_50;
          }
          continue;
        }
        v30 = 0;
        v31 = 0;
        v25 = 0;
        v5->_hasCount = 1;
        while (1)
        {
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          v34 = v33 + 1;
          if (v33 == -1 || v34 > *(_QWORD *)&v4[*v7])
            break;
          v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
          *(_QWORD *)&v4[v32] = v34;
          v25 |= (unint64_t)(v35 & 0x7F) << v30;
          if ((v35 & 0x80) == 0)
            goto LABEL_44;
          v30 += 7;
          v17 = v31++ >= 9;
          if (v17)
          {
            LODWORD(v25) = 0;
            goto LABEL_46;
          }
        }
        v4[*v8] = 1;
LABEL_44:
        if (v4[*v8])
          LODWORD(v25) = 0;
LABEL_46:
        v36 = 24;
      }
      *(_DWORD *)((char *)&v5->super.super.isa + v36) = v25;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_50:
    v37 = 0;
  else
LABEL_51:
    v37 = v5;

  return v37;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasCount)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasTotal)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage *v13;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v13 = 0;
          goto LABEL_12;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("count"));
        v28 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v18, 2, v11);
        v13 = 0;
        v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("total"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = *MEMORY[0x1E0D025B8];
          v25 = *MEMORY[0x1E0CB2D50];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("total"));
          v26 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v22, 2, v21);

        }
        v12 = 0;
        v13 = 0;
        goto LABEL_11;
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    self = -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage initWithKey:count:total:](self, "initWithKey:count:total:", v8, v10, v12);
    v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v13 = 0;
    v8 = 0;
    goto LABEL_13;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("key"));
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v9);
  v13 = 0;
  v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
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
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage hasCount](self, "hasCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage count](self, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage hasTotal](self, "hasTotal"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage total](self, "total"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v11[0] = CFSTR("key");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("count");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("total");
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
      goto LABEL_15;
LABEL_18:

    if (v3)
      goto LABEL_16;
LABEL_19:

    goto LABEL_16;
  }

  if (!v4)
    goto LABEL_18;
LABEL_15:
  if (!v3)
    goto LABEL_19;
LABEL_16:

  return v9;
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
  unsigned int v13;
  unsigned int v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage key](self, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "key");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    if (!-[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage hasCount](self, "hasCount")
      && !objc_msgSend(v5, "hasCount")
      || -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage hasCount](self, "hasCount")
      && objc_msgSend(v5, "hasCount")
      && (v13 = -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage count](self, "count"),
          v13 == objc_msgSend(v5, "count")))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage hasTotal](self, "hasTotal")
        && !objc_msgSend(v5, "hasTotal"))
      {
        v12 = 1;
        goto LABEL_18;
      }
      if (-[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage hasTotal](self, "hasTotal")
        && objc_msgSend(v5, "hasTotal"))
      {
        v14 = -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage total](self, "total");
        v12 = v14 == objc_msgSend(v5, "total");
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

- (NSString)key
{
  return self->_key;
}

- (unsigned)count
{
  return self->_count;
}

- (BOOL)hasCount
{
  return self->_hasCount;
}

- (void)setHasCount:(BOOL)a3
{
  self->_hasCount = a3;
}

- (unsigned)total
{
  return self->_total;
}

- (BOOL)hasTotal
{
  return self->_hasTotal;
}

- (void)setHasTotal:(BOOL)a3
{
  self->_hasTotal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
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

    v4 = -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage initByReadFrom:]([BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketAppUsage alloc], "initByReadFrom:", v7);
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
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("key"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("count"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("total"), 0, 0, 3, 4, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B250;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("key"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("count"), 2, 4, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("total"), 3, 4, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
