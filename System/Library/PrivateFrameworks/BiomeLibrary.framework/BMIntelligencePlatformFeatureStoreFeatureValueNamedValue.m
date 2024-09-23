@implementation BMIntelligencePlatformFeatureStoreFeatureValueNamedValue

- (BMIntelligencePlatformFeatureStoreFeatureValueNamedValue)initWithName:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  BMIntelligencePlatformFeatureStoreFeatureValueNamedValue *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureValueNamedValue;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v9->_value, a4);
  }

  return v9;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligencePlatformFeatureStoreFeatureValueNamedValue with name: %@, value: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligencePlatformFeatureStoreFeatureValueNamedValue *v5;
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
  int v18;
  uint64_t v20;
  NSString *name;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v22;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *value;
  BMIntelligencePlatformFeatureStoreFeatureValueNamedValue *v24;
  objc_super v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureValueNamedValue;
  v5 = -[BMEventBase init](&v26, sel_init);
  if (!v5)
    goto LABEL_29;
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
        if (v11++ >= 9)
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
      if ((v12 >> 3) == 2)
      {
        v27 = 0;
        v28 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_28;
        v22 = -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc], "initByReadFrom:", v4);
        if (!v22)
          goto LABEL_28;
        value = v5->_value;
        v5->_value = v22;

        PBReaderRecallMark();
      }
      else if ((v12 >> 3) == 1)
      {
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        name = v5->_name;
        v5->_name = (NSString *)v20;

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_28;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_28:
    v24 = 0;
  else
LABEL_29:
    v24 = v5;

  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_value)
  {
    PBDataWriterPlaceMark();
    -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue writeTo:](self->_value, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligencePlatformFeatureStoreFeatureValueNamedValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v10;
  BMIntelligencePlatformFeatureStoreFeatureValueNamedValue *v11;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v11 = 0;
        v8 = 0;
        goto LABEL_10;
      }
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v17 = *MEMORY[0x1E0D025B8];
      v25 = *MEMORY[0x1E0CB2D50];
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
      v26[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v10 = (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v10);
      v11 = 0;
      v8 = 0;
      *a4 = v18;
      goto LABEL_8;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = 0;
LABEL_7:
    self = -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue initWithName:value:](self, "initWithName:value:", v8, v10);
    v11 = self;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
    v22 = 0;
    v10 = -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue initWithJSONDictionary:error:]([BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc], "initWithJSONDictionary:error:", v13, &v22);
    v14 = v22;
    if (v14)
    {
      v15 = v14;
      if (a4)
        *a4 = objc_retainAutorelease(v14);

      v11 = 0;
      v9 = v13;
      goto LABEL_8;
    }

    goto LABEL_7;
  }
  if (!a4)
  {
    v11 = 0;
    goto LABEL_9;
  }
  v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v19 = *MEMORY[0x1E0D025B8];
  v23 = *MEMORY[0x1E0CB2D50];
  v10 = (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("value"));
  v24 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v19, 2, v20);

  v11 = 0;
LABEL_8:

LABEL_9:
LABEL_10:

  return v11;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = CFSTR("name");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("value");
  v11[0] = v6;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    if (v3)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_9;
LABEL_7:

  return v8;
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
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue value](self, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue value](self, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isEqual:", v16);

    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)name
{
  return self->_name;
}

- (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
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

    v4 = -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureValueNamedValue alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("value_json"), 5, 1, &__block_literal_global_159);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AF98;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 1, 13, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value"), 2, 14, objc_opt_class());
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __67__BMIntelligencePlatformFeatureStoreFeatureValueNamedValue_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
