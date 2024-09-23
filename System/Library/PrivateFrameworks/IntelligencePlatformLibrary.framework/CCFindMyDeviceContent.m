@implementation CCFindMyDeviceContent

- (CCFindMyDeviceContent)initWithName:(id)a3 owner:(id)a4 error:(id *)a5
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
  CCFindMyDeviceContent *v17;
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
  void *name;
  CCFindMyDeviceOwner *v22;
  CCFindMyDeviceOwner *v23;
  CCFindMyDeviceOwner *owner;
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
    if ((v15 >> 3) == 2)
    {
      v22 = [CCFindMyDeviceOwner alloc];
      CCPBReaderReadDataNoCopy();
      name = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v23 = -[CCItemMessage initWithData:error:](v22, "initWithData:error:", name, &v31);
      v10 = v31;
      owner = self->_owner;
      self->_owner = v23;

      goto LABEL_25;
    }
    if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      name = self->_name;
      self->_name = v20;
LABEL_25:

      continue;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      name = (void *)objc_claimAutoreleasedReturnValue();
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

- (NSString)name
{
  return (NSString *)(id)-[NSString copy](self->_name, "copy");
}

- (CCFindMyDeviceOwner)owner
{
  return (CCFindMyDeviceOwner *)(id)-[CCFindMyDeviceOwner copy](self->_owner, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (self->_name)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 27126, self->_name);
    v7[2](v7, v5);

  }
  if (self->_owner)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 27127, self->_owner);
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
  if (self->_name)
  {
    -[CCFindMyDeviceContent name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  }
  if (self->_owner)
  {
    -[CCFindMyDeviceContent owner](self, "owner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jsonDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("owner"));

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (CCFindMyDeviceContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CCFindMyDeviceOwner *v12;
  id v13;
  void *v14;
  CCFindMyDeviceContent *v15;
  id v17[2];

  v6 = a3;
  objc_opt_class();
  v17[1] = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("owner"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v17[0] = 0;
      v12 = -[CCFindMyDeviceOwner initWithJSONDictionary:error:]([CCFindMyDeviceOwner alloc], "initWithJSONDictionary:error:", v10, v17);
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
    v15 = -[CCFindMyDeviceContent initWithName:owner:error:]([CCFindMyDeviceContent alloc], "initWithName:owner:error:", v9, v12, a4);
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
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (unsigned)itemType
{
  return 27122;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 27122) > 0xA)
    return 0;
  else
    return *(&off_25102FF88 + (unsigned __int16)(a3 - 27122));
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
