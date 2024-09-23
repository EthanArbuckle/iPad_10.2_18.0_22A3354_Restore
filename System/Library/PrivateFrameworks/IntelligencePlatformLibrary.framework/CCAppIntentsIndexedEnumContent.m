@implementation CCAppIntentsIndexedEnumContent

- (CCAppIntentsIndexedEnumContent)initWithTypeIdentifier:(id)a3 typeDisplayRepresentation:(id)a4 cases:(id)a5 error:(id *)a6
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
  void *v23;
  CCAppIntentsIndexedEnumContent *v24;
  int v25;
  void *v26;
  void *v27;
  id *v29;
  CCAppIntentsIndexedEnumContent *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    v37 = 0;
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
      objc_msgSend(v13, "immutableData", v29, v30);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v27, a6);

      v24 = self;
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
  v36 = v15;
  v25 = CCValidateIsInstanceOfExpectedClass();
  v16 = v15;

  if (!v25)
  {
    CCSetError();
    v24 = 0;
    v15 = v16;
    goto LABEL_21;
  }
  objc_msgSend(v11, "data");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField();

  if (!v12)
    goto LABEL_18;
LABEL_5:
  objc_opt_class();
  v35 = v16;
  v17 = CCValidateArrayValues();
  v15 = v16;

  if (v17)
  {
    v29 = a6;
    v30 = self;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v22), "data", v29, v30, (_QWORD)v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          CCPBDataWriterWriteDataField();

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v20);
    }

    a6 = v29;
    self = v30;
    goto LABEL_19;
  }
LABEL_14:
  CCSetError();
  v24 = 0;
LABEL_21:

  return v24;
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
  unint64_t v20;
  NSString *v21;
  void *typeIdentifier;
  CCAppEnumCase *v23;
  CCAppEnumCase *v24;
  CCAppEnumTypeDisplayRepresentation *v25;
  CCAppEnumTypeDisplayRepresentation *v26;
  CCAppEnumTypeDisplayRepresentation *typeDisplayRepresentation;
  objc_class *v28;
  NSArray *v29;
  NSArray *cases;
  objc_class *v31;
  void *v32;
  void *v33;
  BOOL v34;
  id v37;
  id v38;
  id v39;

  v37 = a3;
  v5 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v37);
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
            goto LABEL_36;
          goto LABEL_18;
        }
      }
      *(_QWORD *)&v5[*v10] = 1;
LABEL_17:
      if (*(_QWORD *)&v5[*v10])
        goto LABEL_36;
LABEL_18:
      v20 = v15 >> 3;
      if ((v15 >> 3) == 3)
      {
        CCPBReaderReadDataNoCopy();
        typeIdentifier = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          v8 = (void *)objc_opt_new();
        v23 = [CCAppEnumCase alloc];
        v38 = 0;
        v24 = -[CCItemMessage initWithData:error:](v23, "initWithData:error:", typeIdentifier, &v38);
        v9 = v38;
        if (!v9 && v24)
          objc_msgSend(v8, "addObject:", v24);

        goto LABEL_32;
      }
      if ((_DWORD)v20 == 2)
        break;
      if ((_DWORD)v20 == 1)
      {
        CCPBReaderReadStringNoCopy();
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        typeIdentifier = self->_typeIdentifier;
        self->_typeIdentifier = v21;
LABEL_32:

        goto LABEL_33;
      }
      if ((CCPBReaderSkipValueWithTag() & 1) == 0)
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        typeIdentifier = (void *)objc_claimAutoreleasedReturnValue();
        CCSkipFieldErrorForMessage();
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      v9 = 0;
LABEL_33:
      if (*(_QWORD *)&v5[*v6] >= *(_QWORD *)&v5[*v7])
        goto LABEL_37;
    }
    v25 = [CCAppEnumTypeDisplayRepresentation alloc];
    CCPBReaderReadDataNoCopy();
    typeIdentifier = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v26 = -[CCItemMessage initWithData:error:](v25, "initWithData:error:", typeIdentifier, &v39);
    v9 = v39;
    typeDisplayRepresentation = self->_typeDisplayRepresentation;
    self->_typeDisplayRepresentation = v26;

    goto LABEL_32;
  }
  v8 = 0;
LABEL_36:
  v9 = 0;
LABEL_37:
  v29 = (NSArray *)objc_msgSend(v8, "copy", a4);
  cases = self->_cases;
  self->_cases = v29;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v5[*MEMORY[0x24BE15718]])
    {
      v34 = 1;
      goto LABEL_42;
    }
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v34 = 0;
LABEL_42:

  return v34;
}

- (NSString)typeIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_typeIdentifier, "copy");
}

- (CCAppEnumTypeDisplayRepresentation)typeDisplayRepresentation
{
  return (CCAppEnumTypeDisplayRepresentation *)(id)-[CCAppEnumTypeDisplayRepresentation copy](self->_typeDisplayRepresentation, "copy");
}

- (NSArray)cases
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_cases, 1);
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  if (self->_typeIdentifier)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 42612, self->_typeIdentifier);
    v8[2](v8, v5);

  }
  if (self->_typeDisplayRepresentation)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 42613, self->_typeDisplayRepresentation);
    v8[2](v8, v6);

  }
  if (self->_cases)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 42614, self->_cases);
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
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (self->_typeIdentifier)
  {
    -[CCAppIntentsIndexedEnumContent typeIdentifier](self, "typeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("typeIdentifier"));

  }
  if (self->_typeDisplayRepresentation)
  {
    -[CCAppIntentsIndexedEnumContent typeDisplayRepresentation](self, "typeDisplayRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jsonDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("typeDisplayRepresentation"));

  }
  v7 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CCAppIntentsIndexedEnumContent cases](self, "cases", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "jsonDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("cases"));
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (CCAppIntentsIndexedEnumContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  CCAppEnumTypeDisplayRepresentation *v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  CCAppEnumCase *v23;
  CCAppEnumCase *v24;
  id v25;
  BOOL v26;
  void *v27;
  CCAppIntentsIndexedEnumContent *v28;
  id v30;
  id *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  v39[1] = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("typeIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("typeDisplayRepresentation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v39[0] = 0;
      v11 = -[CCAppEnumTypeDisplayRepresentation initWithJSONDictionary:error:]([CCAppEnumTypeDisplayRepresentation alloc], "initWithJSONDictionary:error:", v10, v39);
      v12 = v39[0];
      v13 = v12;
      if (!v11 || v12)
      {
        CCSetError();

        v28 = 0;
        goto LABEL_26;
      }

      v10 = v11;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cases"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v13 = (id)v14;
      objc_opt_class();
      v38 = v8;
      v15 = CCValidateIsInstanceOfExpectedClass();
      v16 = v8;

      if ((v15 & 1) == 0)
      {
        CCSetError();
        v28 = 0;
        v8 = v16;
        goto LABEL_26;
      }
      v30 = v16;
      v31 = a4;
      v32 = v9;
      v17 = (void *)objc_opt_new();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v13 = v13;
      v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(v13);
            v22 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            v23 = [CCAppEnumCase alloc];
            v33 = 0;
            v24 = -[CCAppEnumCase initWithJSONDictionary:error:](v23, "initWithJSONDictionary:error:", v22, &v33);
            v25 = v33;
            if (v24)
              v26 = v25 == 0;
            else
              v26 = 0;
            if (!v26)
            {
              v27 = v25;
              CCSetError();

              v28 = 0;
              v8 = v30;
              v9 = v32;
              goto LABEL_26;
            }
            objc_msgSend(v17, "addObject:", v24);

          }
          v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v19);
      }

      v8 = v30;
      a4 = v31;
      v9 = v32;
    }
    else
    {
      v17 = 0;
    }
    v28 = -[CCAppIntentsIndexedEnumContent initWithTypeIdentifier:typeDisplayRepresentation:cases:error:]([CCAppIntentsIndexedEnumContent alloc], "initWithTypeIdentifier:typeDisplayRepresentation:cases:error:", v9, v10, v17, a4);
    v13 = v17;
LABEL_26:

    goto LABEL_27;
  }
  CCSetError();
  v28 = 0;
LABEL_27:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cases, 0);
  objc_storeStrong((id *)&self->_typeDisplayRepresentation, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

+ (unsigned)itemType
{
  return -22925;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 22925) > 0xBu)
    return 0;
  else
    return off_25102FB18[(unsigned __int16)(a3 + 22925)];
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
