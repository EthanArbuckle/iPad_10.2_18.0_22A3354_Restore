@implementation CCAppShortcutEntityContent

- (CCAppShortcutEntityContent)initWithEntityTitle:(id)a3 entityInstanceIdentifier:(id)a4 entityTypeIdentifier:(id)a5 providerClass:(id)a6 error:(id *)a7
{
  return -[CCAppShortcutEntityContent initWithEntityTitle:entityInstanceIdentifier:entityTypeIdentifier:providerClass:entitySynonyms:error:](self, "initWithEntityTitle:entityInstanceIdentifier:entityTypeIdentifier:providerClass:entitySynonyms:error:", a3, a4, a5, a6, 0, a7);
}

- (CCAppShortcutEntityContent)initWithEntityTitle:(id)a3 entityInstanceIdentifier:(id)a4 entityTypeIdentifier:(id)a5 providerClass:(id)a6 entitySynonyms:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  int IsInstanceOfExpectedClass;
  id v22;
  int v23;
  CCAppShortcutEntityContent *v24;
  int v25;
  int v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v34;
  CCAppShortcutEntityContent *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void *)objc_opt_new();
  if (!v13)
  {
    v20 = 0;
LABEL_5:
    v35 = self;
    if (v14)
    {
      objc_opt_class();
      v44 = v20;
      IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
      v22 = v20;

      if (!IsInstanceOfExpectedClass)
        goto LABEL_12;
      CCPBDataWriterWriteStringField();
      if (!v15)
      {
LABEL_8:
        v20 = v22;
        if (v16)
          goto LABEL_9;
        goto LABEL_17;
      }
    }
    else
    {
      v22 = v20;
      if (!v15)
        goto LABEL_8;
    }
    objc_opt_class();
    v43 = v22;
    v25 = CCValidateIsInstanceOfExpectedClass();
    v20 = v22;

    if (!v25)
    {
LABEL_28:
      CCSetError();
      v24 = 0;
      goto LABEL_29;
    }
    CCPBDataWriterWriteStringField();
    if (v16)
    {
LABEL_9:
      objc_opt_class();
      v42 = v20;
      v23 = CCValidateIsInstanceOfExpectedClass();
      v22 = v20;

      if (v23)
      {
        CCPBDataWriterWriteStringField();
        if (!v17)
        {
LABEL_11:
          v20 = v22;
LABEL_27:
          objc_msgSend(v18, "immutableData");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[CCItemMessage initWithData:error:](v35, "initWithData:error:", v32, a8);

          v24 = self;
          goto LABEL_30;
        }
        goto LABEL_18;
      }
LABEL_12:
      CCSetError();
      v24 = 0;
      v20 = v22;
LABEL_29:
      self = v35;
      goto LABEL_30;
    }
LABEL_17:
    v22 = v20;
    if (!v17)
      goto LABEL_11;
LABEL_18:
    objc_opt_class();
    v41 = v22;
    v26 = CCValidateArrayValues();
    v20 = v22;

    if (v26)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v34 = v17;
      v27 = v17;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v38;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v38 != v30)
              objc_enumerationMutation(v27);
            CCPBDataWriterWriteStringField();
            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        }
        while (v29);
      }

      v17 = v34;
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  objc_opt_class();
  v45 = 0;
  v19 = CCValidateIsInstanceOfExpectedClass();
  v20 = 0;
  if (v19)
  {
    CCPBDataWriterWriteStringField();
    goto LABEL_5;
  }
  CCSetError();
  v24 = 0;
LABEL_30:

  return v24;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  void *v9;
  void *v10;
  int *v11;
  int *v12;
  BOOL v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  NSArray *v25;
  NSArray *entitySynonyms;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  BOOL v31;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
  {
    v9 = 0;
    goto LABEL_36;
  }
  v9 = 0;
  v10 = 0;
  v11 = (int *)MEMORY[0x24BE15718];
  v12 = (int *)MEMORY[0x24BE15710];
LABEL_3:
  if (*(_QWORD *)&v6[*v11])
    v13 = 0;
  else
    v13 = v10 == 0;
  if (v13)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = *v7;
      v18 = *(_QWORD *)&v6[v17];
      if (v18 == -1 || v18 >= *(_QWORD *)&v6[*v8])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v6[*v12] + v18);
      *(_QWORD *)&v6[v17] = v18 + 1;
      v16 |= (unint64_t)(v19 & 0x7F) << v14;
      if ((v19 & 0x80) == 0)
        goto LABEL_17;
      v14 += 7;
      if (v15++ >= 9)
      {
        v16 = 0;
        if (*(_QWORD *)&v6[*v11])
          goto LABEL_36;
LABEL_18:
        switch((v16 >> 3))
        {
          case 1u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 16;
            goto LABEL_25;
          case 2u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 24;
            goto LABEL_25;
          case 3u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 32;
            goto LABEL_25;
          case 4u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 40;
LABEL_25:
            v23 = *(Class *)((char *)&self->super.super.isa + v22);
            *(Class *)((char *)&self->super.super.isa + v22) = v21;
            goto LABEL_26;
          case 5u:
            CCPBReaderReadStringNoCopy();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v9)
              v9 = (void *)objc_opt_new();
            if (v23)
              objc_msgSend(v9, "addObject:", v23);
            v10 = 0;
            goto LABEL_26;
          default:
            if ((CCPBReaderSkipValueWithTag() & 1) != 0)
            {
              v10 = 0;
            }
            else
            {
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              CCSkipFieldErrorForMessage();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

              v11 = (int *)MEMORY[0x24BE15718];
            }
            if (*(_QWORD *)&v6[*v7] >= *(_QWORD *)&v6[*v8])
              goto LABEL_37;
            goto LABEL_3;
        }
      }
    }
    *(_QWORD *)&v6[*v11] = 1;
LABEL_17:
    if (!*(_QWORD *)&v6[*v11])
      goto LABEL_18;
LABEL_36:
    v10 = 0;
  }
LABEL_37:
  v25 = (NSArray *)objc_msgSend(v9, "copy");
  entitySynonyms = self->_entitySynonyms;
  self->_entitySynonyms = v25;

  v27 = v9;
  if (v10)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v6[*MEMORY[0x24BE15718]])
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

- (NSString)entityTitle
{
  return (NSString *)(id)-[NSString copy](self->_entityTitle, "copy");
}

- (NSString)entityInstanceIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_entityInstanceIdentifier, "copy");
}

- (NSString)entityTypeIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_entityTypeIdentifier, "copy");
}

- (NSString)providerClass
{
  return (NSString *)(id)-[NSString copy](self->_providerClass, "copy");
}

- (NSArray)entitySynonyms
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_entitySynonyms, 1);
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  if (self->_entityTitle)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 7825, self->_entityTitle);
    v10[2](v10, v5);

  }
  if (self->_entityInstanceIdentifier)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 7826, self->_entityInstanceIdentifier);
    v10[2](v10, v6);

  }
  if (self->_entityTypeIdentifier)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 7827, self->_entityTypeIdentifier);
    v10[2](v10, v7);

  }
  if (self->_providerClass)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 7828, self->_providerClass);
    v10[2](v10, v8);

  }
  if (self->_entitySynonyms)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedStringValue:", 7830, self->_entitySynonyms);
    v10[2](v10, v9);

  }
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

  v3 = (void *)objc_opt_new();
  if (self->_entityTitle)
  {
    -[CCAppShortcutEntityContent entityTitle](self, "entityTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("entityTitle"));

  }
  if (self->_entityInstanceIdentifier)
  {
    -[CCAppShortcutEntityContent entityInstanceIdentifier](self, "entityInstanceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityInstanceIdentifier"));

  }
  if (self->_entityTypeIdentifier)
  {
    -[CCAppShortcutEntityContent entityTypeIdentifier](self, "entityTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("entityTypeIdentifier"));

  }
  if (self->_providerClass)
  {
    -[CCAppShortcutEntityContent providerClass](self, "providerClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("providerClass"));

  }
  if (self->_entitySynonyms)
  {
    -[CCAppShortcutEntityContent entitySynonyms](self, "entitySynonyms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("entitySynonyms"));

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (CCAppShortcutEntityContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CCAppShortcutEntityContent *v14;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entityTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entityInstanceIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entityTypeIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("providerClass"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entitySynonyms"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CCAppShortcutEntityContent initWithEntityTitle:entityInstanceIdentifier:entityTypeIdentifier:providerClass:entitySynonyms:error:]([CCAppShortcutEntityContent alloc], "initWithEntityTitle:entityInstanceIdentifier:entityTypeIdentifier:providerClass:entitySynonyms:error:", v9, v10, v11, v12, v13, a4);

  }
  else
  {
    CCSetError();
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitySynonyms, 0);
  objc_storeStrong((id *)&self->_providerClass, 0);
  objc_storeStrong((id *)&self->_entityTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_entityInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_entityTitle, 0);
}

+ (unsigned)itemType
{
  return 7822;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 7822) > 8)
    return 0;
  else
    return *(&off_25102FB78 + (unsigned __int16)(a3 - 7822));
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
