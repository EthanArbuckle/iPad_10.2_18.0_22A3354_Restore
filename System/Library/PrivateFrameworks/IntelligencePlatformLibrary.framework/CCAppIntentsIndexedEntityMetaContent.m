@implementation CCAppIntentsIndexedEntityMetaContent

- (CCAppIntentsIndexedEntityMetaContent)initWithSourceItemIdentifier:(id)a3 saliency:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  int IsInstanceOfExpectedClass;
  id v14;
  void *v15;
  CCAppIntentsIndexedEntityMetaContent *v16;
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
    objc_msgSend(v9, "floatValue");
    CCPBDataWriterWriteFloatField();
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
  CCPBDataWriterWriteStringField();
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
  id v5;
  char *v6;
  int *v7;
  int *v8;
  int *v9;
  void *v10;
  int *v11;
  BOOL v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  NSString *v22;
  NSString *sourceItemIdentifier;
  uint64_t v24;
  unint64_t v25;
  float v26;
  objc_class *v27;
  id v28;
  void *v29;
  objc_class *v30;
  void *v31;
  BOOL v32;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  v9 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
    goto LABEL_32;
  v10 = 0;
  v11 = (int *)MEMORY[0x24BE15710];
  do
  {
    if (*(_QWORD *)&v6[*v9])
      v12 = 0;
    else
      v12 = v10 == 0;
    if (!v12)
      break;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v7;
      v17 = *(_QWORD *)&v6[v16];
      v18 = v17 + 1;
      if (v17 == -1 || v18 > *(_QWORD *)&v6[*v8])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v6[*v11] + v17);
      *(_QWORD *)&v6[v16] = v18;
      v15 |= (unint64_t)(v19 & 0x7F) << v13;
      if ((v19 & 0x80) == 0)
        goto LABEL_17;
      v13 += 7;
      if (v14++ >= 9)
      {
        v15 = 0;
        v21 = *v9;
        if (*(_QWORD *)&v6[v21])
          goto LABEL_33;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
    v21 = *v9;
    if (*(_QWORD *)&v6[v21])
      goto LABEL_33;
LABEL_18:
    if ((v15 >> 3) == 3)
    {
      v24 = *v7;
      v25 = *(_QWORD *)&v6[v24];
      if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(_QWORD *)&v6[*v8])
      {
        v26 = *(float *)(*(_QWORD *)&v6[*v11] + v25);
        *(_QWORD *)&v6[v24] = v25 + 4;
      }
      else
      {
        *(_QWORD *)&v6[v21] = 1;
        v26 = 0.0;
      }
      v10 = 0;
      self->_saliency = v26;
      self->_hasSaliency = 1;
    }
    else if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      sourceItemIdentifier = self->_sourceItemIdentifier;
      self->_sourceItemIdentifier = v22;

      v10 = 0;
    }
    else if ((CCPBReaderSkipValueWithTag() & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = v5;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      CCSkipFieldErrorForMessage();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v28;
    }
  }
  while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
  }
  else
  {
LABEL_32:
    if (!*(_QWORD *)&v6[*v9])
    {
      v32 = 1;
      goto LABEL_36;
    }
LABEL_33:
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v32 = 0;
LABEL_36:

  return v32;
}

- (NSString)sourceItemIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_sourceItemIdentifier, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  id v6;
  double v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  if (self->_sourceItemIdentifier)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 47345, self->_sourceItemIdentifier);
    v9[2](v9, v5);

  }
  if (self->_hasSaliency)
  {
    v6 = objc_alloc(MEMORY[0x24BE15670]);
    *(float *)&v7 = self->_saliency;
    v8 = (void *)objc_msgSend(v6, "initWithFieldType:floatValue:", 47355, v7);
    v9[2](v9, v8);

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
  if (self->_sourceItemIdentifier)
  {
    -[CCAppIntentsIndexedEntityMetaContent sourceItemIdentifier](self, "sourceItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sourceItemIdentifier"));

  }
  if (self->_hasSaliency)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[CCAppIntentsIndexedEntityMetaContent saliency](self, "saliency");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("saliency"));

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (CCAppIntentsIndexedEntityMetaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  CCAppIntentsIndexedEntityMetaContent *v11;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceItemIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("saliency"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CCAppIntentsIndexedEntityMetaContent initWithSourceItemIdentifier:saliency:error:]([CCAppIntentsIndexedEntityMetaContent alloc], "initWithSourceItemIdentifier:saliency:error:", v9, v10, a4);

  }
  else
  {
    CCSetError();
    v11 = 0;
  }

  return v11;
}

- (float)saliency
{
  return self->_saliency;
}

- (BOOL)hasSaliency
{
  return self->_hasSaliency;
}

- (void)setHasSaliency:(BOOL)a3
{
  self->_hasSaliency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceItemIdentifier, 0);
}

+ (unsigned)itemType
{
  return -18195;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  const __CFString *v3;

  v3 = CFSTR("saliency");
  if (a3 != 47355)
    v3 = 0;
  if (a3 == 47345)
    return CFSTR("sourceItemIdentifier");
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
