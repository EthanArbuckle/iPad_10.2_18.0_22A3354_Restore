@implementation CCAppEntityDisplayRepresentation

- (CCAppEntityDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 synonyms:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int IsInstanceOfExpectedClass;
  id v15;
  id v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CCAppEntityDisplayRepresentation *v23;
  int v24;
  void *v25;
  id *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  id v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    v34 = 0;
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v15 = 0;
    if (!IsInstanceOfExpectedClass)
      goto LABEL_14;
    CCPBDataWriterWriteStringField();
    if (!v11)
    {
LABEL_4:
      v16 = v15;
      if (v12)
        goto LABEL_5;
LABEL_18:
      v15 = v16;
LABEL_19:
      objc_msgSend(v13, "immutableData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v25, a6);

      v23 = self;
      goto LABEL_21;
    }
  }
  else
  {
    v15 = 0;
    if (!v11)
      goto LABEL_4;
  }
  objc_opt_class();
  v33 = v15;
  v24 = CCValidateIsInstanceOfExpectedClass();
  v16 = v15;

  if (!v24)
  {
    CCSetError();
    v23 = 0;
    v15 = v16;
    goto LABEL_21;
  }
  CCPBDataWriterWriteStringField();
  if (!v12)
    goto LABEL_18;
LABEL_5:
  objc_opt_class();
  v32 = v16;
  v17 = CCValidateArrayValues();
  v15 = v16;

  if (v17)
  {
    v27 = a6;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          CCPBDataWriterWriteStringField();
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v20);
    }

    a6 = v27;
    goto LABEL_19;
  }
LABEL_14:
  CCSetError();
  v23 = 0;
LABEL_21:

  return v23;
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
  uint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v21;
  objc_class *v22;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  NSArray *v26;
  NSArray *synonyms;
  objc_class *v28;
  void *v29;
  void *v30;
  BOOL v31;
  id v34;

  v34 = a3;
  v5 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v34);
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
        goto LABEL_37;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v6;
        v17 = *(_QWORD *)&v5[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v5[*v7])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v5[*v11] + v17);
        *(_QWORD *)&v5[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_17;
        v13 += 7;
        if (v14++ >= 9)
        {
          v15 = 0;
          if (*(_QWORD *)&v5[*v10])
            goto LABEL_36;
          goto LABEL_18;
        }
      }
      *(_QWORD *)&v5[*v10] = 1;
LABEL_17:
      if (*(_QWORD *)&v5[*v10])
        goto LABEL_36;
LABEL_18:
      v21 = v15 >> 3;
      if ((v15 >> 3) == 3)
      {
        CCPBReaderReadStringNoCopy();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          v8 = (void *)objc_opt_new();
        if (v24)
          objc_msgSend(v8, "addObject:", v24);
        v9 = 0;
        goto LABEL_29;
      }
      if ((_DWORD)v21 == 2)
        break;
      if ((_DWORD)v21 == 1)
      {
        CCPBReaderReadStringNoCopy();
        v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        v23 = 16;
LABEL_28:
        v24 = *(Class *)((char *)&self->super.super.isa + v23);
        *(Class *)((char *)&self->super.super.isa + v23) = v22;
        goto LABEL_29;
      }
      if ((CCPBReaderSkipValueWithTag() & 1) != 0)
      {
        v9 = 0;
        goto LABEL_30;
      }
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      CCSkipFieldErrorForMessage();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

LABEL_30:
      if (*(_QWORD *)&v5[*v6] >= *(_QWORD *)&v5[*v7])
        goto LABEL_37;
    }
    CCPBReaderReadStringNoCopy();
    v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v23 = 24;
    goto LABEL_28;
  }
  v8 = 0;
LABEL_36:
  v9 = 0;
LABEL_37:
  v26 = (NSArray *)objc_msgSend(v8, "copy", a4);
  synonyms = self->_synonyms;
  self->_synonyms = v26;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v5[*MEMORY[0x24BE15718]])
    {
      v31 = 1;
      goto LABEL_42;
    }
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v31 = 0;
LABEL_42:

  return v31;
}

- (NSString)title
{
  return (NSString *)(id)-[NSString copy](self->_title, "copy");
}

- (NSString)subtitle
{
  return (NSString *)(id)-[NSString copy](self->_subtitle, "copy");
}

- (NSArray)synonyms
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_synonyms, 1);
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  if (self->_title)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 47347, self->_title);
    v8[2](v8, v5);

  }
  if (self->_subtitle)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 47348, self->_subtitle);
    v8[2](v8, v6);

  }
  if (self->_synonyms)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedStringValue:", 47349, self->_synonyms);
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
  if (self->_title)
  {
    -[CCAppEntityDisplayRepresentation title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("title"));

  }
  if (self->_subtitle)
  {
    -[CCAppEntityDisplayRepresentation subtitle](self, "subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("subtitle"));

  }
  if (self->_synonyms)
  {
    -[CCAppEntityDisplayRepresentation synonyms](self, "synonyms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("synonyms"));

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (CCAppEntityDisplayRepresentation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CCAppEntityDisplayRepresentation *v12;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("synonyms"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CCAppEntityDisplayRepresentation initWithTitle:subtitle:synonyms:error:]([CCAppEntityDisplayRepresentation alloc], "initWithTitle:subtitle:synonyms:error:", v9, v10, v11, a4);

  }
  else
  {
    CCSetError();
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (unsigned)itemType
{
  return -18195;
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
