@implementation CCAppIntentsIndexedEntityContent

- (CCAppIntentsIndexedEntityContent)initWithTypeIdentifier:(id)a3 displayRepresentation:(id)a4 typeDisplayRepresentation:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int IsInstanceOfExpectedClass;
  id v15;
  id v16;
  int v17;
  void *v18;
  CCAppIntentsIndexedEntityContent *v19;
  int v20;
  void *v21;
  void *v22;

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
  v20 = CCValidateIsInstanceOfExpectedClass();
  v16 = v15;

  if (!v20)
  {
    CCSetError();
    v19 = 0;
    v15 = v16;
    goto LABEL_14;
  }
  objc_msgSend(v11, "data");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField();

  if (!v12)
    goto LABEL_11;
LABEL_5:
  objc_opt_class();
  v17 = CCValidateIsInstanceOfExpectedClass();
  v15 = v16;

  if (v17)
  {
    objc_msgSend(v12, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CCPBDataWriterWriteDataField();

LABEL_12:
    objc_msgSend(v13, "immutableData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v22, a6);

    v19 = self;
    goto LABEL_14;
  }
LABEL_7:
  CCSetError();
  v19 = 0;
LABEL_14:

  return v19;
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
  uint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v21;
  NSString *v22;
  void *typeIdentifier;
  CCAppEntityTypeDisplayRepresentation *v24;
  objc_class *v25;
  uint64_t v26;
  CCAppEntityDisplayRepresentation *v27;
  void *v28;
  objc_class *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  BOOL v33;
  id v35;
  id v36;

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
    if (*(_QWORD *)&v6[*v9] || v10 != 0)
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
        if (*(_QWORD *)&v6[*v9])
          goto LABEL_33;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
    if (*(_QWORD *)&v6[*v9])
      goto LABEL_33;
LABEL_18:
    v21 = v15 >> 3;
    if ((v15 >> 3) == 3)
    {
      v24 = [CCAppEntityTypeDisplayRepresentation alloc];
      CCPBReaderReadDataNoCopy();
      typeIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v25 = -[CCItemMessage initWithData:error:](v24, "initWithData:error:", typeIdentifier, &v35);
      v10 = v35;
      v26 = 32;
      goto LABEL_24;
    }
    if ((_DWORD)v21 == 2)
    {
      v27 = [CCAppEntityDisplayRepresentation alloc];
      CCPBReaderReadDataNoCopy();
      typeIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v25 = -[CCItemMessage initWithData:error:](v27, "initWithData:error:", typeIdentifier, &v36);
      v10 = v36;
      v26 = 24;
LABEL_24:
      v28 = *(Class *)((char *)&self->super.super.isa + v26);
      *(Class *)((char *)&self->super.super.isa + v26) = v25;

LABEL_28:
      continue;
    }
    if ((_DWORD)v21 == 1)
    {
      CCPBReaderReadStringNoCopy();
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      typeIdentifier = self->_typeIdentifier;
      self->_typeIdentifier = v22;
      goto LABEL_28;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      typeIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      CCSkipFieldErrorForMessage();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    v10 = 0;
  }
  while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_34;
  }
LABEL_32:
  if (*(_QWORD *)&v6[*v9])
  {
LABEL_33:
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

    v10 = 0;
LABEL_34:
    v33 = 0;
  }
  else
  {
    v10 = 0;
    v33 = 1;
  }

  return v33;
}

- (NSString)typeIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_typeIdentifier, "copy");
}

- (CCAppEntityDisplayRepresentation)displayRepresentation
{
  return (CCAppEntityDisplayRepresentation *)(id)-[CCAppEntityDisplayRepresentation copy](self->_displayRepresentation, "copy");
}

- (CCAppEntityTypeDisplayRepresentation)typeDisplayRepresentation
{
  return (CCAppEntityTypeDisplayRepresentation *)(id)-[CCAppEntityTypeDisplayRepresentation copy](self->_typeDisplayRepresentation, "copy");
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
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 47354, self->_typeIdentifier);
    v8[2](v8, v5);

  }
  if (self->_displayRepresentation)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 47343, self->_displayRepresentation);
    v8[2](v8, v6);

  }
  if (self->_typeDisplayRepresentation)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 47344, self->_typeDisplayRepresentation);
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
  void *v9;

  v3 = (void *)objc_opt_new();
  if (self->_typeIdentifier)
  {
    -[CCAppIntentsIndexedEntityContent typeIdentifier](self, "typeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("typeIdentifier"));

  }
  if (self->_displayRepresentation)
  {
    -[CCAppIntentsIndexedEntityContent displayRepresentation](self, "displayRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jsonDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("displayRepresentation"));

  }
  if (self->_typeDisplayRepresentation)
  {
    -[CCAppIntentsIndexedEntityContent typeDisplayRepresentation](self, "typeDisplayRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "jsonDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("typeDisplayRepresentation"));

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (CCAppIntentsIndexedEntityContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  CCAppEntityDisplayRepresentation *v11;
  id v12;
  void *v13;
  uint64_t v14;
  CCAppEntityTypeDisplayRepresentation *v15;
  id v16;
  void *v17;
  CCAppIntentsIndexedEntityContent *v18;
  id v20;
  id v21[2];

  v6 = a3;
  objc_opt_class();
  v21[1] = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("typeIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayRepresentation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v21[0] = 0;
      v11 = -[CCAppEntityDisplayRepresentation initWithJSONDictionary:error:]([CCAppEntityDisplayRepresentation alloc], "initWithJSONDictionary:error:", v10, v21);
      v12 = v21[0];
      v13 = v12;
      if (!v11 || v12)
      {
        CCSetError();

        goto LABEL_15;
      }

      v10 = v11;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("typeDisplayRepresentation"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v15 = 0;
      goto LABEL_13;
    }
    v13 = (void *)v14;
    v20 = 0;
    v15 = -[CCAppEntityTypeDisplayRepresentation initWithJSONDictionary:error:]([CCAppEntityTypeDisplayRepresentation alloc], "initWithJSONDictionary:error:", v14, &v20);
    v16 = v20;
    v17 = v16;
    if (v15 && !v16)
    {

LABEL_13:
      v18 = -[CCAppIntentsIndexedEntityContent initWithTypeIdentifier:displayRepresentation:typeDisplayRepresentation:error:]([CCAppIntentsIndexedEntityContent alloc], "initWithTypeIdentifier:displayRepresentation:typeDisplayRepresentation:error:", v9, v10, v15, a4);
      v13 = v15;
LABEL_16:

      goto LABEL_17;
    }
    CCSetError();

LABEL_15:
    v18 = 0;
    goto LABEL_16;
  }
  CCSetError();
  v18 = 0;
LABEL_17:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeDisplayRepresentation, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

+ (unsigned)itemType
{
  return -18195;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 18195) > 0xDu)
    return 0;
  else
    return *(&off_25102FAA8 + (unsigned __int16)(a3 + 18195));
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
