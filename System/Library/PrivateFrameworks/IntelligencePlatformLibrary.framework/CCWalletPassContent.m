@implementation CCWalletPassContent

- (CCWalletPassContent)initWithPassUniqueIdentifier:(id)a3 eventContent:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  int IsInstanceOfExpectedClass;
  id v14;
  void *v15;
  void *v16;
  CCWalletPassContent *v17;
  id v19;

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
    v19 = v12;
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v14 = v12;

    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      v17 = 0;
      v12 = v14;
      goto LABEL_11;
    }
    objc_msgSend(v9, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CCPBDataWriterWriteDataField();

    v12 = v14;
    goto LABEL_8;
  }
  objc_opt_class();
  v11 = CCValidateIsInstanceOfExpectedClass();
  v12 = 0;
  if (!v11)
  {
    CCSetError();
    v17 = 0;
    goto LABEL_11;
  }
  CCPBDataWriterWriteStringField();
  if (v9)
    goto LABEL_6;
LABEL_8:
  objc_msgSend(v10, "immutableData", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v16, a5);

  v17 = self;
LABEL_11:

  return v17;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  int *v9;
  id v10;
  int *v11;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  NSString *v20;
  void *passUniqueIdentifier;
  CCWalletPassEventContent *v22;
  CCWalletPassEventContent *v23;
  CCWalletPassEventContent *eventContent;
  objc_class *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v31;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  v9 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
    goto LABEL_29;
  v10 = 0;
  v11 = (int *)MEMORY[0x24BE15710];
  do
  {
    if (*(_QWORD *)&v6[*v9] || v10 != 0)
      break;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v7;
      v17 = *(_QWORD *)&v6[v16];
      if (v17 == -1 || v17 >= *(_QWORD *)&v6[*v8])
        break;
      v18 = *(_BYTE *)(*(_QWORD *)&v6[*v11] + v17);
      *(_QWORD *)&v6[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0)
        goto LABEL_17;
      v13 += 7;
      if (v14++ >= 9)
      {
        v15 = 0;
        if (*(_QWORD *)&v6[*v9])
          goto LABEL_30;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
    if (*(_QWORD *)&v6[*v9])
      goto LABEL_30;
LABEL_18:
    if ((v15 >> 3) == 3)
    {
      v22 = [CCWalletPassEventContent alloc];
      CCPBReaderReadDataNoCopy();
      passUniqueIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v23 = -[CCItemMessage initWithData:error:](v22, "initWithData:error:", passUniqueIdentifier, &v31);
      v10 = v31;
      eventContent = self->_eventContent;
      self->_eventContent = v23;

      goto LABEL_25;
    }
    if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      passUniqueIdentifier = self->_passUniqueIdentifier;
      self->_passUniqueIdentifier = v20;
LABEL_25:

      continue;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      passUniqueIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      CCSkipFieldErrorForMessage();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    v10 = 0;
  }
  while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_31;
  }
LABEL_29:
  if (*(_QWORD *)&v6[*v9])
  {
LABEL_30:
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

    v10 = 0;
LABEL_31:
    v29 = 0;
  }
  else
  {
    v10 = 0;
    v29 = 1;
  }

  return v29;
}

- (NSString)passUniqueIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_passUniqueIdentifier, "copy");
}

- (CCWalletPassEventContent)eventContent
{
  return (CCWalletPassEventContent *)(id)-[CCWalletPassEventContent copy](self->_eventContent, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (self->_passUniqueIdentifier)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 46121, self->_passUniqueIdentifier);
    v7[2](v7, v5);

  }
  if (self->_eventContent)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 46122, self->_eventContent);
    v7[2](v7, v6);

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
  if (self->_passUniqueIdentifier)
  {
    -[CCWalletPassContent passUniqueIdentifier](self, "passUniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("passUniqueIdentifier"));

  }
  if (self->_eventContent)
  {
    -[CCWalletPassContent eventContent](self, "eventContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jsonDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventContent"));

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (CCWalletPassContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CCWalletPassEventContent *v12;
  id v13;
  void *v14;
  CCWalletPassContent *v15;
  id v17[2];

  v6 = a3;
  objc_opt_class();
  v17[1] = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passUniqueIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventContent"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v17[0] = 0;
      v12 = -[CCWalletPassEventContent initWithJSONDictionary:error:]([CCWalletPassEventContent alloc], "initWithJSONDictionary:error:", v10, v17);
      v13 = v17[0];
      v14 = v13;
      if (!v12 || v13)
      {
        CCSetError();

        v15 = 0;
        goto LABEL_10;
      }

    }
    else
    {
      v12 = 0;
    }
    v15 = -[CCWalletPassContent initWithPassUniqueIdentifier:eventContent:error:]([CCWalletPassContent alloc], "initWithPassUniqueIdentifier:eventContent:error:", v9, v12, a4);
    v11 = v12;
LABEL_10:

    goto LABEL_11;
  }
  CCSetError();
  v15 = 0;
LABEL_11:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventContent, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

+ (unsigned)itemType
{
  return -19416;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 19416) > 0xCu)
    return 0;
  else
    return off_2510309A8[(unsigned __int16)(a3 + 19416)];
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
