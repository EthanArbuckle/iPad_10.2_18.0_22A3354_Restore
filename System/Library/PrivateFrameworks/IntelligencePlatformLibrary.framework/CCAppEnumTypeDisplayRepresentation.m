@implementation CCAppEnumTypeDisplayRepresentation

- (CCAppEnumTypeDisplayRepresentation)initWithName:(id)a3 synonyms:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int IsInstanceOfExpectedClass;
  id v12;
  int v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CCAppEnumTypeDisplayRepresentation *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  if (!v8)
  {
    v12 = 0;
    if (!v9)
      goto LABEL_15;
LABEL_6:
    objc_opt_class();
    v27 = v12;
    v13 = CCValidateArrayValues();
    v14 = v12;

    if (!v13)
    {
      CCSetError();
      v21 = 0;
      v12 = v14;
      goto LABEL_18;
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          CCPBDataWriterWriteStringField();
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v17);
    }

    v12 = v14;
    goto LABEL_15;
  }
  objc_opt_class();
  v28 = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v12 = 0;
  if (!IsInstanceOfExpectedClass)
  {
    CCSetError();
    v21 = 0;
    goto LABEL_18;
  }
  CCPBDataWriterWriteStringField();
  if (v9)
    goto LABEL_6;
LABEL_15:
  objc_msgSend(v10, "immutableData", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v20, a5);

  v21 = self;
LABEL_18:

  return v21;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  char *v5;
  int *v6;
  int *v7;
  void *v8;
  void *v9;
  int *v10;
  int *v11;
  BOOL v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  NSString *v20;
  void *name;
  uint64_t v22;
  objc_class *v23;
  NSArray *v24;
  NSArray *synonyms;
  objc_class *v26;
  void *v27;
  void *v28;
  BOOL v29;
  id *v31;
  id v32;

  v31 = a4;
  v32 = a3;
  v5 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v32);
  v6 = (int *)MEMORY[0x24BE15728];
  v7 = (int *)MEMORY[0x24BE15720];
  if (*(_QWORD *)&v5[*MEMORY[0x24BE15728]] < *(_QWORD *)&v5[*MEMORY[0x24BE15720]])
  {
    v8 = 0;
    v9 = 0;
    v10 = (int *)MEMORY[0x24BE15718];
    v11 = (int *)MEMORY[0x24BE15710];
    while (1)
    {
      if (*(_QWORD *)&v5[*v10])
        v12 = 0;
      else
        v12 = v9 == 0;
      if (!v12)
        goto LABEL_35;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v6;
        v17 = *(_QWORD *)&v5[v16];
        if (v17 == -1 || v17 >= *(_QWORD *)&v5[*v7])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v5[*v11] + v17);
        *(_QWORD *)&v5[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0)
          goto LABEL_17;
        v13 += 7;
        if (v14++ >= 9)
        {
          v15 = 0;
          if (*(_QWORD *)&v5[*v10])
            goto LABEL_34;
          goto LABEL_18;
        }
      }
      *(_QWORD *)&v5[*v10] = 1;
LABEL_17:
      if (*(_QWORD *)&v5[*v10])
        goto LABEL_34;
LABEL_18:
      if ((v15 >> 3) == 2)
        break;
      if ((v15 >> 3) == 1)
      {
        CCPBReaderReadStringNoCopy();
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        name = self->_name;
        self->_name = v20;
LABEL_28:

        goto LABEL_29;
      }
      if ((CCPBReaderSkipValueWithTag() & 1) == 0)
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        name = (void *)objc_claimAutoreleasedReturnValue();
        CCSkipFieldErrorForMessage();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      v9 = 0;
LABEL_29:
      if (*(_QWORD *)&v5[*v6] >= *(_QWORD *)&v5[*v7])
        goto LABEL_35;
    }
    CCPBReaderReadStringNoCopy();
    v22 = objc_claimAutoreleasedReturnValue();
    name = (void *)v22;
    if (v8)
    {
      if (!v22)
      {
LABEL_24:
        v9 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      v8 = (void *)objc_opt_new();
      if (!name)
        goto LABEL_24;
    }
    objc_msgSend(v8, "addObject:", name, v31);
    goto LABEL_24;
  }
  v8 = 0;
LABEL_34:
  v9 = 0;
LABEL_35:
  v24 = (NSArray *)objc_msgSend(v8, "copy", v31);
  synonyms = self->_synonyms;
  self->_synonyms = v24;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v5[*MEMORY[0x24BE15718]])
    {
      v29 = 1;
      goto LABEL_40;
    }
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v29 = 0;
LABEL_40:

  return v29;
}

- (NSString)name
{
  return (NSString *)(id)-[NSString copy](self->_name, "copy");
}

- (NSArray)synonyms
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_synonyms, 1);
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (self->_name)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 42621, self->_name);
    v7[2](v7, v5);

  }
  if (self->_synonyms)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedStringValue:", 42622, self->_synonyms);
    v7[2](v7, v6);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  if (self->_name)
  {
    -[CCAppEnumTypeDisplayRepresentation name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  }
  if (self->_synonyms)
  {
    -[CCAppEnumTypeDisplayRepresentation synonyms](self, "synonyms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("synonyms"));

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (CCAppEnumTypeDisplayRepresentation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  CCAppEnumTypeDisplayRepresentation *v11;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("synonyms"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CCAppEnumTypeDisplayRepresentation initWithName:synonyms:error:]([CCAppEnumTypeDisplayRepresentation alloc], "initWithName:synonyms:error:", v9, v10, a4);

  }
  else
  {
    CCSetError();
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (unsigned)itemType
{
  return -22925;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end
