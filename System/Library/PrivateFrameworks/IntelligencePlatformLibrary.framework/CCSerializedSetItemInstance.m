@implementation CCSerializedSetItemInstance

- (CCSerializedSetItemInstance)initWithMetaContent:(id)a3 instanceIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  int IsInstanceOfExpectedClass;
  id v14;
  void *v15;
  CCSerializedSetItemInstance *v16;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  if (!v8)
  {
    v12 = 0;
    if (!v9)
      goto LABEL_8;
LABEL_6:
    objc_opt_class();
    v18 = v12;
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v14 = v12;

    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      v16 = 0;
      v12 = v14;
      goto LABEL_11;
    }
    objc_msgSend(v9, "longLongValue");
    CCPBDataWriterWriteInt64Field();
    v12 = v14;
    goto LABEL_8;
  }
  objc_opt_class();
  v11 = CCValidateIsInstanceOfExpectedClass();
  v12 = 0;
  if (!v11)
  {
    CCSetError();
    v16 = 0;
    goto LABEL_11;
  }
  CCPBDataWriterWriteDataField();
  if (v9)
    goto LABEL_6;
LABEL_8:
  objc_msgSend(v10, "immutableData", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v15, a5);

  v16 = self;
LABEL_11:

  return v16;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  int *v8;
  int *v9;
  int *v10;
  void *v11;
  int *v12;
  BOOL v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  char v21;
  unsigned int v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  NSData *v27;
  NSData *metaContent;
  objc_class *v29;
  id *v30;
  id v31;
  void *v32;
  objc_class *v33;
  void *v34;
  BOOL v35;
  CCSerializedSetItemInstance *v37;

  v6 = a3;
  v7 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v6);
  v8 = (int *)MEMORY[0x24BE15728];
  v9 = (int *)MEMORY[0x24BE15720];
  v10 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v7[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v7[*MEMORY[0x24BE15720]])
    goto LABEL_38;
  v11 = 0;
  v12 = (int *)MEMORY[0x24BE15710];
  v37 = self;
  do
  {
    if (*(_QWORD *)&v7[*v10])
      v13 = 0;
    else
      v13 = v11 == 0;
    if (!v13)
      break;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = *v8;
      v18 = *(_QWORD *)&v7[v17];
      if (v18 == -1 || v18 >= *(_QWORD *)&v7[*v9])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v18);
      *(_QWORD *)&v7[v17] = v18 + 1;
      v16 |= (unint64_t)(v19 & 0x7F) << v14;
      if ((v19 & 0x80) == 0)
        goto LABEL_17;
      v14 += 7;
      v20 = v15++ >= 9;
      if (v20)
      {
        v16 = 0;
        if (*(_QWORD *)&v7[*v10])
          goto LABEL_39;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v7[*v10] = 1;
LABEL_17:
    if (*(_QWORD *)&v7[*v10])
      goto LABEL_39;
LABEL_18:
    if ((v16 >> 3) == 1)
    {
      CCPBReaderReadData();
      v27 = (NSData *)objc_claimAutoreleasedReturnValue();
      metaContent = self->_metaContent;
      self->_metaContent = v27;

      v11 = 0;
    }
    else if ((v16 >> 3) == 2)
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
      while (1)
      {
        v24 = *v8;
        v25 = *(_QWORD *)&v7[v24];
        if (v25 == -1 || v25 >= *(_QWORD *)&v7[*v9])
          break;
        v26 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v25);
        *(_QWORD *)&v7[v24] = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_31;
        v21 += 7;
        v20 = v22++ >= 9;
        if (v20)
        {
          v23 = 0;
          goto LABEL_33;
        }
      }
      *(_QWORD *)&v7[*v10] = 1;
LABEL_31:
      if (*(_QWORD *)&v7[*v10])
        v23 = 0;
LABEL_33:
      v11 = 0;
      self->_instanceIdentifier = v23;
      self->_hasInstanceIdentifier = 1;
    }
    else if ((CCPBReaderSkipValueWithTag() & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = a4;
      v31 = v6;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      CCSkipFieldErrorForMessage();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v31;
      a4 = v30;
      self = v37;
    }
  }
  while (*(_QWORD *)&v7[*v8] < *(_QWORD *)&v7[*v9]);
  if (v11)
  {
    CCSetError();
  }
  else
  {
LABEL_38:
    if (!*(_QWORD *)&v7[*v10])
    {
      v35 = 1;
      goto LABEL_42;
    }
LABEL_39:
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v35 = 0;
LABEL_42:

  return v35;
}

- (NSData)metaContent
{
  return (NSData *)(id)-[NSData copy](self->_metaContent, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  unsigned __int16 *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  v5 = (unsigned __int16 *)MEMORY[0x24BE15620];
  if (self->_metaContent)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:bytesValue:", (unsigned __int16)*MEMORY[0x24BE15620], self->_metaContent);
    v8[2](v8, v6);

  }
  if (self->_hasInstanceIdentifier)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:int64Value:", *v5, self->_instanceIdentifier);
    v8[2](v8, v7);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  if (self->_metaContent)
  {
    -[CCSerializedSetItemInstance metaContent](self, "metaContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("metaContent"));

  }
  if (self->_hasInstanceIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[CCSerializedSetItemInstance instanceIdentifier](self, "instanceIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("instanceIdentifier"));

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (CCSerializedSetItemInstance)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  CCSerializedSetItemInstance *v14;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("metaContent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = CCValidateIsInstanceOfExpectedClass();
    v11 = v8;

    if ((v10 & 1) != 0)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v9, 0);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("instanceIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[CCSerializedSetItemInstance initWithMetaContent:instanceIdentifier:error:]([CCSerializedSetItemInstance alloc], "initWithMetaContent:instanceIdentifier:error:", v12, v13, a4);

      v9 = (void *)v12;
    }
    else
    {
      CCSetError();
      v14 = 0;
    }

  }
  else
  {
    CCSetError();
    v14 = 0;
    v11 = v8;
  }

  return v14;
}

- (int64_t)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (BOOL)hasInstanceIdentifier
{
  return self->_hasInstanceIdentifier;
}

- (void)setHasInstanceIdentifier:(BOOL)a3
{
  self->_hasInstanceIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContent, 0);
}

+ (unsigned)itemType
{
  return *MEMORY[0x24BE15620];
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return 0;
}

+ (Class)contentMessageClass
{
  return 0;
}

@end
