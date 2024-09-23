@implementation BMAppIntentInvocationStaticDeferredLocalizedString

- (BMAppIntentInvocationStaticDeferredLocalizedString)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 bundleURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMAppIntentInvocationStaticDeferredLocalizedString *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMAppIntentInvocationStaticDeferredLocalizedString;
  v15 = -[BMEventBase init](&v17, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_key, a3);
    objc_storeStrong((id *)&v15->_defaultValue, a4);
    objc_storeStrong((id *)&v15->_table, a5);
    objc_storeStrong((id *)&v15->_bundleURL, a6);
  }

  return v15;
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
  -[BMAppIntentInvocationStaticDeferredLocalizedString key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationStaticDeferredLocalizedString defaultValue](self, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationStaticDeferredLocalizedString table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationStaticDeferredLocalizedString bundleURL](self, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppIntentInvocationStaticDeferredLocalizedString with key: %@, defaultValue: %@, table: %@, bundleURL: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppIntentInvocationStaticDeferredLocalizedString *v5;
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
  uint64_t v21;
  void *v22;
  BMAppIntentInvocationStaticDeferredLocalizedString *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMAppIntentInvocationStaticDeferredLocalizedString;
  v5 = -[BMEventBase init](&v25, sel_init);
  if (!v5)
    goto LABEL_30;
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
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 24;
          goto LABEL_26;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_26;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_26;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
LABEL_26:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_29;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_29:
    v23 = 0;
  else
LABEL_30:
    v23 = v5;

  return v23;
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
  if (self->_defaultValue)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_table)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bundleURL)
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
  -[BMAppIntentInvocationStaticDeferredLocalizedString writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppIntentInvocationStaticDeferredLocalizedString)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMAppIntentInvocationStaticDeferredLocalizedString *v11;
  id v12;
  void *v13;
  id v14;
  BMAppIntentInvocationStaticDeferredLocalizedString *v15;
  id v17;
  uint64_t v18;
  id *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id *v28;
  id v29;
  id *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_16;
        }
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0D025B8];
        v36 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("defaultValue"));
        v37 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        *a4 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v10);
        a4 = 0;
        goto LABEL_15;
      }
      v30 = v9;
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("table"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v15 = 0;
          a4 = v30;
          goto LABEL_15;
        }
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = a4;
        v23 = *MEMORY[0x1E0D025B8];
        v34 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("table"));
        v35 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v13);
        v15 = 0;
        v12 = 0;
        a4 = v30;
        *v28 = v24;
        goto LABEL_14;
      }
      v12 = v10;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleURL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v27 = *MEMORY[0x1E0D025B8];
          v32 = *MEMORY[0x1E0CB2D50];
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleURL"));
          v33 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v27, 2, v26);

        }
        v14 = 0;
        v15 = 0;
        a4 = v30;
        goto LABEL_14;
      }
      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    a4 = v30;
    v15 = -[BMAppIntentInvocationStaticDeferredLocalizedString initWithKey:defaultValue:table:bundleURL:](v11, "initWithKey:defaultValue:table:bundleURL:", v8, v30, v12, v14);
    v11 = v15;
LABEL_14:

    self = v11;
LABEL_15:

    v7 = v31;
    goto LABEL_16;
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
    goto LABEL_17;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = *MEMORY[0x1E0D025B8];
  v38 = *MEMORY[0x1E0CB2D50];
  v19 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("key"));
  v39[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = 0;
  *a4 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v9);
  a4 = v19;
LABEL_16:

LABEL_17:
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
  -[BMAppIntentInvocationStaticDeferredLocalizedString key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationStaticDeferredLocalizedString defaultValue](self, "defaultValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationStaticDeferredLocalizedString table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationStaticDeferredLocalizedString bundleURL](self, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("key");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("defaultValue");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("table");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("bundleURL");
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
      goto LABEL_11;
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4)
        goto LABEL_12;
LABEL_16:

      if (v3)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v4)
    goto LABEL_16;
LABEL_12:
  if (!v3)
    goto LABEL_17;
LABEL_13:

  return v11;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppIntentInvocationStaticDeferredLocalizedString key](self, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "key");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppIntentInvocationStaticDeferredLocalizedString key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    -[BMAppIntentInvocationStaticDeferredLocalizedString defaultValue](self, "defaultValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultValue");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAppIntentInvocationStaticDeferredLocalizedString defaultValue](self, "defaultValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "defaultValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_13;
    }
    -[BMAppIntentInvocationStaticDeferredLocalizedString table](self, "table");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "table");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMAppIntentInvocationStaticDeferredLocalizedString table](self, "table");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "table");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
LABEL_13:
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    -[BMAppIntentInvocationStaticDeferredLocalizedString bundleURL](self, "bundleURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {
      v12 = 1;
    }
    else
    {
      -[BMAppIntentInvocationStaticDeferredLocalizedString bundleURL](self, "bundleURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v27, "isEqual:", v28);

    }
    goto LABEL_19;
  }
  v12 = 0;
LABEL_20:

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

- (NSString)defaultValue
{
  return self->_defaultValue;
}

- (NSString)table
{
  return self->_table;
}

- (NSString)bundleURL
{
  return self->_bundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
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

    v4 = -[BMAppIntentInvocationStaticDeferredLocalizedString initByReadFrom:]([BMAppIntentInvocationStaticDeferredLocalizedString alloc], "initByReadFrom:", v7);
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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("key"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("defaultValue"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("table"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleURL"), 2, 0, 4, 13, 0);
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
  return &unk_1E5F1CB28;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("key"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("defaultValue"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("table"), 3, 13, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleURL"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
