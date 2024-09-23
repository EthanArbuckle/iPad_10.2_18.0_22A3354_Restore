@implementation CCSignificantLocationContent

- (CCSignificantLocationContent)initWithPreferredName:(id)a3 mapItemName:(id)a4 address:(id)a5 error:(id *)a6
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
  CCSignificantLocationContent *v19;
  int v20;
  void *v21;

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
  CCPBDataWriterWriteStringField();
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
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v21, a6);

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
  unint64_t v17;
  char v18;
  unint64_t v20;
  objc_class *v21;
  uint64_t v22;
  CCSignificantLocationAddress *v23;
  void *v24;
  CCSignificantLocationAddress *v25;
  CCSignificantLocationAddress *address;
  objc_class *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  BOOL v31;
  id v33;

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
          goto LABEL_33;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
    if (*(_QWORD *)&v6[*v9])
      goto LABEL_33;
LABEL_18:
    v20 = v15 >> 3;
    if ((v15 >> 3) == 3)
    {
      v23 = [CCSignificantLocationAddress alloc];
      CCPBReaderReadDataNoCopy();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v25 = -[CCItemMessage initWithData:error:](v23, "initWithData:error:", v24, &v33);
      v10 = v33;
      address = self->_address;
      self->_address = v25;

LABEL_28:
      continue;
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
      v24 = *(Class *)((char *)&self->super.super.isa + v22);
      *(Class *)((char *)&self->super.super.isa + v22) = v21;
      goto LABEL_28;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
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
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

    v10 = 0;
LABEL_34:
    v31 = 0;
  }
  else
  {
    v10 = 0;
    v31 = 1;
  }

  return v31;
}

- (NSString)preferredName
{
  return (NSString *)(id)-[NSString copy](self->_preferredName, "copy");
}

- (NSString)mapItemName
{
  return (NSString *)(id)-[NSString copy](self->_mapItemName, "copy");
}

- (CCSignificantLocationAddress)address
{
  return (CCSignificantLocationAddress *)(id)-[CCSignificantLocationAddress copy](self->_address, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  if (self->_preferredName)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15768, self->_preferredName);
    v8[2](v8, v5);

  }
  if (self->_mapItemName)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15769, self->_mapItemName);
    v8[2](v8, v6);

  }
  if (self->_address)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 15763, self->_address);
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

  v3 = (void *)objc_opt_new();
  if (self->_preferredName)
  {
    -[CCSignificantLocationContent preferredName](self, "preferredName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("preferredName"));

  }
  if (self->_mapItemName)
  {
    -[CCSignificantLocationContent mapItemName](self, "mapItemName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mapItemName"));

  }
  if (self->_address)
  {
    -[CCSignificantLocationContent address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jsonDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("address"));

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (CCSignificantLocationContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CCSignificantLocationAddress *v13;
  id v14;
  void *v15;
  CCSignificantLocationContent *v16;
  id v18[2];

  v6 = a3;
  objc_opt_class();
  v18[1] = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("preferredName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mapItemName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("address"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v18[0] = 0;
      v13 = -[CCSignificantLocationAddress initWithJSONDictionary:error:]([CCSignificantLocationAddress alloc], "initWithJSONDictionary:error:", v11, v18);
      v14 = v18[0];
      v15 = v14;
      if (!v13 || v14)
      {
        CCSetError();

        v16 = 0;
        goto LABEL_10;
      }

    }
    else
    {
      v13 = 0;
    }
    v16 = -[CCSignificantLocationContent initWithPreferredName:mapItemName:address:error:]([CCSignificantLocationContent alloc], "initWithPreferredName:mapItemName:address:error:", v9, v10, v13, a4);
    v12 = v13;
LABEL_10:

    goto LABEL_11;
  }
  CCSetError();
  v16 = 0;
LABEL_11:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_mapItemName, 0);
  objc_storeStrong((id *)&self->_preferredName, 0);
}

+ (unsigned)itemType
{
  return 15757;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 15757) > 0x20)
    return 0;
  else
    return *(&off_251030800 + (unsigned __int16)(a3 - 15757));
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
