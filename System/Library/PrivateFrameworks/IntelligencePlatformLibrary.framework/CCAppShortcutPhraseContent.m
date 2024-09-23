@implementation CCAppShortcutPhraseContent

- (CCAppShortcutPhraseContent)initWithPhrase:(id)a3 baseTemplate:(id)a4 templateParameterValue:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int IsInstanceOfExpectedClass;
  id v15;
  id v16;
  int v17;
  CCAppShortcutPhraseContent *v18;
  int v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v15 = 0;
    if (!IsInstanceOfExpectedClass)
      goto LABEL_7;
    CCPBDataWriterWriteStringField();
    if (!v11)
    {
LABEL_4:
      v16 = v15;
      if (v12)
        goto LABEL_5;
LABEL_11:
      v15 = v16;
      goto LABEL_12;
    }
  }
  else
  {
    v15 = 0;
    if (!v11)
      goto LABEL_4;
  }
  objc_opt_class();
  v19 = CCValidateIsInstanceOfExpectedClass();
  v16 = v15;

  if (!v19)
  {
    CCSetError();
    v18 = 0;
    v15 = v16;
    goto LABEL_14;
  }
  CCPBDataWriterWriteStringField();
  if (!v12)
    goto LABEL_11;
LABEL_5:
  objc_opt_class();
  v17 = CCValidateIsInstanceOfExpectedClass();
  v15 = v16;

  if (v17)
  {
    CCPBDataWriterWriteStringField();
LABEL_12:
    objc_msgSend(v13, "immutableData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v20, a6);

    v18 = self;
    goto LABEL_14;
  }
LABEL_7:
  CCSetError();
  v18 = 0;
LABEL_14:

  return v18;
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
  unint64_t v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  void *v26;
  BOOL v27;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  v9 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
    goto LABEL_33;
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
          goto LABEL_34;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
    if (*(_QWORD *)&v6[*v9])
      goto LABEL_34;
LABEL_18:
    v20 = v15 >> 3;
    if ((v15 >> 3) == 3)
    {
      CCPBReaderReadStringNoCopy();
      v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v22 = 32;
      goto LABEL_24;
    }
    if ((_DWORD)v20 == 2)
    {
      CCPBReaderReadStringNoCopy();
      v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v22 = 24;
      goto LABEL_24;
    }
    if ((_DWORD)v20 == 1)
    {
      CCPBReaderReadStringNoCopy();
      v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v22 = 16;
LABEL_24:
      v23 = *(Class *)((char *)&self->super.super.isa + v22);
      *(Class *)((char *)&self->super.super.isa + v22) = v21;
      goto LABEL_25;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) != 0)
    {
      v10 = 0;
      continue;
    }
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CCSkipFieldErrorForMessage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

  }
  while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_35;
  }
LABEL_33:
  if (*(_QWORD *)&v6[*v9])
  {
LABEL_34:
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

LABEL_35:
    v27 = 0;
  }
  else
  {
    v27 = 1;
  }

  return v27;
}

- (NSString)phrase
{
  return (NSString *)(id)-[NSString copy](self->_phrase, "copy");
}

- (NSString)baseTemplate
{
  return (NSString *)(id)-[NSString copy](self->_baseTemplate, "copy");
}

- (NSString)templateParameterValue
{
  return (NSString *)(id)-[NSString copy](self->_templateParameterValue, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  if (self->_phrase)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 12013, self->_phrase);
    v8[2](v8, v5);

  }
  if (self->_baseTemplate)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 12014, self->_baseTemplate);
    v8[2](v8, v6);

  }
  if (self->_templateParameterValue)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 12015, self->_templateParameterValue);
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
  if (self->_phrase)
  {
    -[CCAppShortcutPhraseContent phrase](self, "phrase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("phrase"));

  }
  if (self->_baseTemplate)
  {
    -[CCAppShortcutPhraseContent baseTemplate](self, "baseTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("baseTemplate"));

  }
  if (self->_templateParameterValue)
  {
    -[CCAppShortcutPhraseContent templateParameterValue](self, "templateParameterValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("templateParameterValue"));

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (CCAppShortcutPhraseContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CCAppShortcutPhraseContent *v12;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phrase"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("baseTemplate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("templateParameterValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CCAppShortcutPhraseContent initWithPhrase:baseTemplate:templateParameterValue:error:]([CCAppShortcutPhraseContent alloc], "initWithPhrase:baseTemplate:templateParameterValue:error:", v9, v10, v11, a4);

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
  objc_storeStrong((id *)&self->_templateParameterValue, 0);
  objc_storeStrong((id *)&self->_baseTemplate, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
}

+ (unsigned)itemType
{
  return 12010;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 12010) > 5)
    return 0;
  else
    return *(&off_25102FBC0 + (unsigned __int16)(a3 - 12010));
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
