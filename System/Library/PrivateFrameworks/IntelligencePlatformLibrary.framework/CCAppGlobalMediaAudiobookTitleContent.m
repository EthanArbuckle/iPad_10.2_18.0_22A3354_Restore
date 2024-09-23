@implementation CCAppGlobalMediaAudiobookTitleContent

- (CCAppGlobalMediaAudiobookTitleContent)initWithVocabularyStrings:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CCAppGlobalMediaAudiobookTitleContent *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  if (v6)
  {
    objc_opt_class();
    v22 = 0;
    v8 = CCValidateArrayValues();
    v9 = 0;
    if (!v8)
    {
      CCSetError();
      v16 = 0;
      goto LABEL_14;
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          CCPBDataWriterWriteStringField();
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "immutableData", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v15, a4);

  v16 = self;
LABEL_14:

  return v16;
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
  uint64_t v20;
  void *v21;
  objc_class *v22;
  NSArray *v23;
  NSArray *vocabularyStrings;
  objc_class *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id *v30;
  id v31;

  v30 = a4;
  v31 = a3;
  v5 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v31);
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
        goto LABEL_33;
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
            goto LABEL_32;
          goto LABEL_18;
        }
      }
      *(_QWORD *)&v5[*v10] = 1;
LABEL_17:
      if (*(_QWORD *)&v5[*v10])
        goto LABEL_32;
LABEL_18:
      if ((v15 >> 3) == 1)
        break;
      if ((CCPBReaderSkipValueWithTag() & 1) == 0)
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        CCSkipFieldErrorForMessage();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      v9 = 0;
LABEL_27:
      if (*(_QWORD *)&v5[*v6] >= *(_QWORD *)&v5[*v7])
        goto LABEL_33;
    }
    CCPBReaderReadStringNoCopy();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v8)
    {
      if (!v20)
      {
LABEL_22:
        v9 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      v8 = (void *)objc_opt_new();
      if (!v21)
        goto LABEL_22;
    }
    objc_msgSend(v8, "addObject:", v21, v30);
    goto LABEL_22;
  }
  v8 = 0;
LABEL_32:
  v9 = 0;
LABEL_33:
  v23 = (NSArray *)objc_msgSend(v8, "copy", v30);
  vocabularyStrings = self->_vocabularyStrings;
  self->_vocabularyStrings = v23;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v5[*MEMORY[0x24BE15718]])
    {
      v28 = 1;
      goto LABEL_38;
    }
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v28 = 0;
LABEL_38:

  return v28;
}

- (NSArray)vocabularyStrings
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_vocabularyStrings, 1);
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  objc_class *v6;
  id v7;
  id v8;

  if (self->_vocabularyStrings)
  {
    v6 = (objc_class *)MEMORY[0x24BE15670];
    v7 = a3;
    v8 = (id)objc_msgSend([v6 alloc], "initWithFieldType:repeatedStringValue:", 8199, self->_vocabularyStrings);
    (*((void (**)(id, id))a3 + 2))(v7, v8);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  if (self->_vocabularyStrings)
  {
    -[CCAppGlobalMediaAudiobookTitleContent vocabularyStrings](self, "vocabularyStrings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("vocabularyStrings"));

  }
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (CCAppGlobalMediaAudiobookTitleContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  CCAppGlobalMediaAudiobookTitleContent *v10;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vocabularyStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CCAppGlobalMediaAudiobookTitleContent initWithVocabularyStrings:error:]([CCAppGlobalMediaAudiobookTitleContent alloc], "initWithVocabularyStrings:error:", v9, a4);

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
  objc_storeStrong((id *)&self->_vocabularyStrings, 0);
}

+ (unsigned)itemType
{
  return 8194;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  const __CFString *v3;

  v3 = CFSTR("vocabularyStrings");
  if (a3 != 8199)
    v3 = 0;
  if (a3 == 8194)
    return CFSTR("AppGlobalMediaAudiobookTitle");
  else
    return (id)v3;
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
