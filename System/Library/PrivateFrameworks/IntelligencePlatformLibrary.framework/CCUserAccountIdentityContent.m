@implementation CCUserAccountIdentityContent

- (CCUserAccountIdentityContent)initWithUserName:(id)a3 givenName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  int IsInstanceOfExpectedClass;
  id v14;
  void *v15;
  CCUserAccountIdentityContent *v16;
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
    CCPBDataWriterWriteStringField();
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
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  objc_class *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  objc_class *v24;
  void *v25;
  BOOL v26;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  v9 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
    goto LABEL_30;
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
          goto LABEL_31;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
    if (*(_QWORD *)&v6[*v9])
      goto LABEL_31;
LABEL_18:
    if ((v15 >> 3) == 2)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v21 = 24;
LABEL_22:
      v22 = *(Class *)((char *)&self->super.super.isa + v21);
      *(Class *)((char *)&self->super.super.isa + v21) = v20;
LABEL_26:

      continue;
    }
    if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v21 = 16;
      goto LABEL_22;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CCSkipFieldErrorForMessage();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    v10 = 0;
  }
  while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_32;
  }
LABEL_30:
  if (*(_QWORD *)&v6[*v9])
  {
LABEL_31:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

LABEL_32:
    v26 = 0;
  }
  else
  {
    v26 = 1;
  }

  return v26;
}

- (NSString)userName
{
  return (NSString *)(id)-[NSString copy](self->_userName, "copy");
}

- (NSString)givenName
{
  return (NSString *)(id)-[NSString copy](self->_givenName, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (self->_userName)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 61512, self->_userName);
    v7[2](v7, v5);

  }
  if (self->_givenName)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 61513, self->_givenName);
    v7[2](v7, v6);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  if (self->_userName)
  {
    -[CCUserAccountIdentityContent userName](self, "userName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("userName"));

  }
  if (self->_givenName)
  {
    -[CCUserAccountIdentityContent givenName](self, "givenName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("givenName"));

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (CCUserAccountIdentityContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  CCUserAccountIdentityContent *v11;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("givenName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CCUserAccountIdentityContent initWithUserName:givenName:error:]([CCUserAccountIdentityContent alloc], "initWithUserName:givenName:error:", v9, v10, a4);

  }
  else
  {
    CCSetError();
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_userName, 0);
}

+ (unsigned)itemType
{
  return -4027;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 4027) > 4u)
    return 0;
  else
    return *(&off_251030980 + (unsigned __int16)(a3 + 4027));
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
