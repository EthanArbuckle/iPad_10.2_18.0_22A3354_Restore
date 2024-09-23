@implementation CCMediaMetaContent

- (CCMediaMetaContent)initWithSourceItemIdentifier:(id)a3 linkedIdentifiers:(id)a4 error:(id *)a5
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
  void *v21;
  CCMediaMetaContent *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
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
    v29 = v12;
    v13 = CCValidateArrayValues();
    v14 = v12;

    if (!v13)
    {
      CCSetError();
      v22 = 0;
      v12 = v14;
      goto LABEL_18;
    }
    v24 = v14;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v19), "data");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          CCPBDataWriterWriteDataField();

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v17);
    }

    v12 = v24;
    goto LABEL_15;
  }
  objc_opt_class();
  v30 = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v12 = 0;
  if (!IsInstanceOfExpectedClass)
  {
    CCSetError();
    v22 = 0;
    goto LABEL_18;
  }
  CCPBDataWriterWriteStringField();
  if (v9)
    goto LABEL_6;
LABEL_15:
  objc_msgSend(v10, "immutableData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v21, a5);

  v22 = self;
LABEL_18:

  return v22;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  char *v5;
  int *v6;
  int *v7;
  void *v8;
  id v9;
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
  void *sourceItemIdentifier;
  CCMediaLinkedIdentifier *v22;
  CCMediaLinkedIdentifier *v23;
  objc_class *v24;
  NSArray *v25;
  NSArray *linkedIdentifiers;
  objc_class *v27;
  void *v28;
  void *v29;
  BOOL v30;
  id v32;
  id v33;

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
      {
        CCPBReaderReadDataNoCopy();
        sourceItemIdentifier = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          v8 = (void *)objc_opt_new();
        v22 = [CCMediaLinkedIdentifier alloc];
        v33 = 0;
        v23 = -[CCItemMessage initWithData:error:](v22, "initWithData:error:", sourceItemIdentifier, &v33);
        v9 = v33;
        if (!v9 && v23)
          objc_msgSend(v8, "addObject:", v23);

        goto LABEL_30;
      }
      if ((v15 >> 3) == 1)
        break;
      if ((CCPBReaderSkipValueWithTag() & 1) == 0)
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        sourceItemIdentifier = (void *)objc_claimAutoreleasedReturnValue();
        CCSkipFieldErrorForMessage();
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      v9 = 0;
LABEL_31:
      if (*(_QWORD *)&v5[*v6] >= *(_QWORD *)&v5[*v7])
        goto LABEL_35;
    }
    CCPBReaderReadStringNoCopy();
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    sourceItemIdentifier = self->_sourceItemIdentifier;
    self->_sourceItemIdentifier = v20;
LABEL_30:

    goto LABEL_31;
  }
  v8 = 0;
LABEL_34:
  v9 = 0;
LABEL_35:
  v25 = (NSArray *)objc_msgSend(v8, "copy");
  linkedIdentifiers = self->_linkedIdentifiers;
  self->_linkedIdentifiers = v25;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v5[*MEMORY[0x24BE15718]])
    {
      v30 = 1;
      goto LABEL_40;
    }
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v30 = 0;
LABEL_40:

  return v30;
}

- (NSString)sourceItemIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_sourceItemIdentifier, "copy");
}

- (NSArray)linkedIdentifiers
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_linkedIdentifiers, 1);
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (self->_sourceItemIdentifier)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 18553, self->_sourceItemIdentifier);
    v7[2](v7, v5);

  }
  if (self->_linkedIdentifiers)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 18554, self->_linkedIdentifiers);
    v7[2](v7, v6);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (self->_sourceItemIdentifier)
  {
    -[CCMediaMetaContent sourceItemIdentifier](self, "sourceItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sourceItemIdentifier"));

  }
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CCMediaMetaContent linkedIdentifiers](self, "linkedIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "jsonDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("linkedIdentifiers"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (CCMediaMetaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  CCMediaLinkedIdentifier *v20;
  CCMediaLinkedIdentifier *v21;
  id v22;
  BOOL v23;
  void *v24;
  CCMediaMetaContent *v25;
  void *v27;
  CCMediaMetaContent *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  v35 = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceItemIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("linkedIdentifiers"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (id)v10;
      objc_opt_class();
      v34 = v8;
      v12 = CCValidateIsInstanceOfExpectedClass();
      v13 = v8;

      if ((v12 & 1) == 0)
      {
        CCSetError();
        v25 = 0;
        goto LABEL_21;
      }
      v27 = v9;
      v28 = self;
      v14 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v11 = v11;
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v31 != v17)
              objc_enumerationMutation(v11);
            v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            v20 = [CCMediaLinkedIdentifier alloc];
            v29 = 0;
            v21 = -[CCMediaLinkedIdentifier initWithJSONDictionary:error:](v20, "initWithJSONDictionary:error:", v19, &v29);
            v22 = v29;
            if (v21)
              v23 = v22 == 0;
            else
              v23 = 0;
            if (!v23)
            {
              v24 = v22;
              CCSetError();

              v25 = 0;
              v9 = v27;
              self = v28;
              goto LABEL_21;
            }
            objc_msgSend(v14, "addObject:", v21);

          }
          v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v16);
      }

      v9 = v27;
      self = v28;
    }
    else
    {
      v14 = 0;
      v13 = v8;
    }
    v25 = -[CCMediaMetaContent initWithSourceItemIdentifier:linkedIdentifiers:error:]([CCMediaMetaContent alloc], "initWithSourceItemIdentifier:linkedIdentifiers:error:", v9, v14, a4);
    v11 = v14;
LABEL_21:

    v8 = v13;
    goto LABEL_22;
  }
  CCSetError();
  v25 = 0;
LABEL_22:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceItemIdentifier, 0);
}

+ (unsigned)itemType
{
  return 18540;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = CFSTR("type");
  if (a3 != 18568)
    v3 = 0;
  if (a3 == 18567)
    v4 = CFSTR("sourceItemIdentifier");
  else
    v4 = v3;
  v5 = CFSTR("linkedIdentifiers");
  if (a3 != 18554)
    v5 = 0;
  if (a3 == 18553)
    v6 = CFSTR("sourceItemIdentifier");
  else
    v6 = v5;
  if ((int)a3 <= 18566)
    return (id)v6;
  else
    return (id)v4;
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
