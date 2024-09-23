@implementation BMIntelligencePlatformFeatureStoreFeature

- (BMIntelligencePlatformFeatureStoreFeature)initWithIdentifier:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  BMIntelligencePlatformFeatureStoreFeature *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMIntelligencePlatformFeatureStoreFeature;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_identifier, a3);
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
  -[BMIntelligencePlatformFeatureStoreFeature identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeature value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligencePlatformFeatureStoreFeature with identifier: %@, value: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligencePlatformFeatureStoreFeature *v5;
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
  objc_class *v20;
  uint64_t v21;
  void *v22;
  BMIntelligencePlatformFeatureStoreFeature *v23;
  objc_super v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMIntelligencePlatformFeatureStoreFeature;
  v5 = -[BMEventBase init](&v25, sel_init);
  if (!v5)
    goto LABEL_32;
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
        v26 = 0;
        v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_31;
        v20 = -[BMIntelligencePlatformFeatureStoreFeatureValue initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureValue alloc], "initByReadFrom:", v4);
        if (!v20)
          goto LABEL_31;
        v21 = 32;
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
          if (!PBReaderSkipValueWithTag())
            goto LABEL_31;
          continue;
        }
        v26 = 0;
        v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_31;
        v20 = -[BMIntelligencePlatformFeatureStoreFeatureIdentifier initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureIdentifier alloc], "initByReadFrom:", v4);
        if (!v20)
          goto LABEL_31;
        v21 = 24;
      }
      v22 = *(Class *)((char *)&v5->super.super.isa + v21);
      *(Class *)((char *)&v5->super.super.isa + v21) = v20;

      PBReaderRecallMark();
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_31:
    v23 = 0;
  else
LABEL_32:
    v23 = v5;

  return v23;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_identifier)
  {
    PBDataWriterPlaceMark();
    -[BMIntelligencePlatformFeatureStoreFeatureIdentifier writeTo:](self->_identifier, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_value)
  {
    PBDataWriterPlaceMark();
    -[BMIntelligencePlatformFeatureStoreFeatureValue writeTo:](self->_value, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligencePlatformFeatureStoreFeature writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligencePlatformFeatureStoreFeature)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMIntelligencePlatformFeatureStoreFeatureIdentifier *v8;
  id v9;
  BMIntelligencePlatformFeatureStoreFeatureValue *v10;
  BMIntelligencePlatformFeatureStoreFeature *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  BMIntelligencePlatformFeatureStoreFeatureValue *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v25 = 0;
    v8 = -[BMIntelligencePlatformFeatureStoreFeatureIdentifier initWithJSONDictionary:error:]([BMIntelligencePlatformFeatureStoreFeatureIdentifier alloc], "initWithJSONDictionary:error:", v9, &v25);
    v12 = v25;
    if (v12)
    {
      v13 = v12;
      if (a4)
        *a4 = objc_retainAutorelease(v12);

      goto LABEL_26;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
LABEL_7:
      self = -[BMIntelligencePlatformFeatureStoreFeature initWithIdentifier:value:](self, "initWithIdentifier:value:", v8, v10);
      v11 = self;
LABEL_23:

      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v9;
      v24 = 0;
      v10 = -[BMIntelligencePlatformFeatureStoreFeatureValue initWithJSONDictionary:error:]([BMIntelligencePlatformFeatureStoreFeatureValue alloc], "initWithJSONDictionary:error:", v14, &v24);
      v15 = v24;
      if (!v15)
      {

        goto LABEL_7;
      }
      v16 = v15;
      if (a4)
        *a4 = objc_retainAutorelease(v15);

LABEL_22:
      v11 = 0;
      goto LABEL_23;
    }
    if (a4)
    {
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0D025B8];
      v26 = *MEMORY[0x1E0CB2D50];
      v10 = (BMIntelligencePlatformFeatureStoreFeatureValue *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("value"));
      v27 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v20, 2, v21);

      goto LABEL_22;
    }
LABEL_26:
    v11 = 0;
    goto LABEL_24;
  }
  if (!a4)
  {
    v11 = 0;
    goto LABEL_25;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = *MEMORY[0x1E0D025B8];
  v28 = *MEMORY[0x1E0CB2D50];
  v8 = (BMIntelligencePlatformFeatureStoreFeatureIdentifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("identifier"));
  v29[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v9);
  v11 = 0;
  *a4 = v19;
LABEL_24:

LABEL_25:
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
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[BMIntelligencePlatformFeatureStoreFeature identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMIntelligencePlatformFeatureStoreFeature value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = CFSTR("identifier");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = CFSTR("value");
  v12[0] = v7;
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    if (v4)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v4)
    goto LABEL_9;
LABEL_7:

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
    -[BMIntelligencePlatformFeatureStoreFeature identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligencePlatformFeatureStoreFeature identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMIntelligencePlatformFeatureStoreFeature value](self, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMIntelligencePlatformFeatureStoreFeature value](self, "value");
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

- (BMIntelligencePlatformFeatureStoreFeatureIdentifier)identifier
{
  return self->_identifier;
}

- (BMIntelligencePlatformFeatureStoreFeatureValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMIntelligencePlatformFeatureStoreFeature initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeature alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("identifier_json"), 5, 1, &__block_literal_global_257);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("value_json"), 5, 1, &__block_literal_global_258);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AFE0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 14, objc_opt_class());
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value"), 2, 14, objc_opt_class());
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __52__BMIntelligencePlatformFeatureStoreFeature_columns__block_invoke_2(uint64_t a1, void *a2)
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

id __52__BMIntelligencePlatformFeatureStoreFeature_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
