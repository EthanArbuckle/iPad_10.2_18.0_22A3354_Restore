@implementation CCAppCustomVoiceCommandNameMetaContent

- (CCAppCustomVoiceCommandNameMetaContent)initWithSourceItemIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int IsInstanceOfExpectedClass;
  id v9;
  void *v10;
  CCAppCustomVoiceCommandNameMetaContent *v11;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  if (v6)
  {
    objc_opt_class();
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v9 = 0;
    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      v11 = 0;
      goto LABEL_7;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "immutableData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v10, a4);

  v11 = self;
LABEL_7:

  return v11;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  int *v9;
  void *v10;
  int *v11;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  NSString *v20;
  void *sourceItemIdentifier;
  objc_class *v22;
  objc_class *v23;
  void *v24;
  BOOL v25;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  v9 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
    goto LABEL_27;
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
          goto LABEL_28;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
    if (*(_QWORD *)&v6[*v9])
      goto LABEL_28;
LABEL_18:
    if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      sourceItemIdentifier = self->_sourceItemIdentifier;
      self->_sourceItemIdentifier = v20;
LABEL_23:

      continue;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      sourceItemIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      CCSkipFieldErrorForMessage();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    v10 = 0;
  }
  while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_29;
  }
LABEL_27:
  if (*(_QWORD *)&v6[*v9])
  {
LABEL_28:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

LABEL_29:
    v25 = 0;
  }
  else
  {
    v25 = 1;
  }

  return v25;
}

- (NSString)sourceItemIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_sourceItemIdentifier, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  objc_class *v6;
  id v7;
  id v8;

  if (self->_sourceItemIdentifier)
  {
    v6 = (objc_class *)MEMORY[0x24BE15670];
    v7 = a3;
    v8 = (id)objc_msgSend([v6 alloc], "initWithFieldType:stringValue:", 30603, self->_sourceItemIdentifier);
    (*((void (**)(id, id))a3 + 2))(v7, v8);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  if (self->_sourceItemIdentifier)
  {
    -[CCAppCustomVoiceCommandNameMetaContent sourceItemIdentifier](self, "sourceItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sourceItemIdentifier"));

  }
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (CCAppCustomVoiceCommandNameMetaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  CCAppCustomVoiceCommandNameMetaContent *v10;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceItemIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CCAppCustomVoiceCommandNameMetaContent initWithSourceItemIdentifier:error:]([CCAppCustomVoiceCommandNameMetaContent alloc], "initWithSourceItemIdentifier:error:", v9, a4);

  }
  else
  {
    CCSetError();
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceItemIdentifier, 0);
}

+ (unsigned)itemType
{
  return 30598;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if (a3 == 30603)
    return CFSTR("sourceItemIdentifier");
  else
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
