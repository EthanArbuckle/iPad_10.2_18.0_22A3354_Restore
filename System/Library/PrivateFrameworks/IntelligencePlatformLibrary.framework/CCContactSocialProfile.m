@implementation CCContactSocialProfile

- (CCContactSocialProfile)initWithLabel:(id)a3 urlString:(id)a4 username:(id)a5 userIdentifier:(id)a6 serviceName:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  int IsInstanceOfExpectedClass;
  id v22;
  int v23;
  CCContactSocialProfile *v24;
  int v25;
  int v26;
  void *v27;
  CCContactSocialProfile *v29;
  id v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v30 = a7;
  v18 = (void *)objc_opt_new();
  if (!v14)
  {
    v20 = 0;
LABEL_5:
    v29 = self;
    if (v15)
    {
      objc_opt_class();
      IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
      v22 = v20;

      if (!IsInstanceOfExpectedClass)
        goto LABEL_11;
      CCPBDataWriterWriteStringField();
      if (!v16)
      {
LABEL_8:
        v20 = v22;
        if (v17)
          goto LABEL_9;
        goto LABEL_16;
      }
    }
    else
    {
      v22 = v20;
      if (!v16)
        goto LABEL_8;
    }
    objc_opt_class();
    v25 = CCValidateIsInstanceOfExpectedClass();
    v20 = v22;

    if (!v25)
    {
LABEL_20:
      CCSetError();
      v24 = 0;
      goto LABEL_21;
    }
    CCPBDataWriterWriteStringField();
    if (v17)
    {
LABEL_9:
      objc_opt_class();
      v23 = CCValidateIsInstanceOfExpectedClass();
      v22 = v20;

      if (v23)
      {
        CCPBDataWriterWriteStringField();
LABEL_17:
        if (!v30)
        {
          v20 = v22;
          goto LABEL_23;
        }
        objc_opt_class();
        v26 = CCValidateIsInstanceOfExpectedClass();
        v20 = v22;

        if (v26)
        {
          CCPBDataWriterWriteStringField();
LABEL_23:
          objc_msgSend(v18, "immutableData");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[CCItemMessage initWithData:error:](v29, "initWithData:error:", v27, a8);

          self = v24;
          goto LABEL_24;
        }
        goto LABEL_20;
      }
LABEL_11:
      CCSetError();
      v24 = 0;
      v20 = v22;
LABEL_21:
      self = v29;
      goto LABEL_24;
    }
LABEL_16:
    v22 = v20;
    goto LABEL_17;
  }
  objc_opt_class();
  v19 = CCValidateIsInstanceOfExpectedClass();
  v20 = 0;
  if (v19)
  {
    CCPBDataWriterWriteStringField();
    goto LABEL_5;
  }
  CCSetError();
  v24 = 0;
LABEL_24:

  return v24;
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
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] < *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
  {
    v10 = 0;
    v11 = (int *)MEMORY[0x24BE15710];
LABEL_3:
    if (*(_QWORD *)&v6[*v9])
      v12 = 0;
    else
      v12 = v10 == 0;
    if (v12)
    {
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
LABEL_18:
          switch((v15 >> 3))
          {
            case 1u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 16;
              goto LABEL_26;
            case 2u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 24;
              goto LABEL_26;
            case 3u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 32;
              goto LABEL_26;
            case 4u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 40;
              goto LABEL_26;
            case 5u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 48;
LABEL_26:
              v22 = *(Class *)((char *)&self->super.super.isa + v21);
              *(Class *)((char *)&self->super.super.isa + v21) = v20;
              goto LABEL_27;
            default:
              if ((CCPBReaderSkipValueWithTag() & 1) != 0)
              {
                v10 = 0;
              }
              else
              {
                v23 = (objc_class *)objc_opt_class();
                NSStringFromClass(v23);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                CCSkipFieldErrorForMessage();
                v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

              }
              if (*(_QWORD *)&v6[*v7] >= *(_QWORD *)&v6[*v8])
                goto LABEL_31;
              goto LABEL_3;
          }
        }
      }
      *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
      if (!*(_QWORD *)&v6[*v9])
        goto LABEL_18;
LABEL_34:
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CCInvalidBufferErrorForMessage();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CCSetError();

      goto LABEL_35;
    }
LABEL_31:
    if (v10)
    {
      CCSetError();
LABEL_35:

      v26 = 0;
      goto LABEL_37;
    }
  }
  if (*(_QWORD *)&v6[*v9])
    goto LABEL_34;
  v26 = 1;
LABEL_37:

  return v26;
}

- (NSString)label
{
  return (NSString *)(id)-[NSString copy](self->_label, "copy");
}

- (NSString)urlString
{
  return (NSString *)(id)-[NSString copy](self->_urlString, "copy");
}

- (NSString)username
{
  return (NSString *)(id)-[NSString copy](self->_username, "copy");
}

- (NSString)userIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_userIdentifier, "copy");
}

- (NSString)serviceName
{
  return (NSString *)(id)-[NSString copy](self->_serviceName, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  if (self->_label)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19760, self->_label);
    v10[2](v10, v5);

  }
  if (self->_urlString)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19761, self->_urlString);
    v10[2](v10, v6);

  }
  if (self->_username)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19762, self->_username);
    v10[2](v10, v7);

  }
  if (self->_userIdentifier)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19763, self->_userIdentifier);
    v10[2](v10, v8);

  }
  if (self->_serviceName)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19764, self->_serviceName);
    v10[2](v10, v9);

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
  if (self->_label)
  {
    -[CCContactSocialProfile label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("label"));

  }
  if (self->_urlString)
  {
    -[CCContactSocialProfile urlString](self, "urlString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("urlString"));

  }
  if (self->_username)
  {
    -[CCContactSocialProfile username](self, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("username"));

  }
  if (self->_userIdentifier)
  {
    -[CCContactSocialProfile userIdentifier](self, "userIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("userIdentifier"));

  }
  if (self->_serviceName)
  {
    -[CCContactSocialProfile serviceName](self, "serviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("serviceName"));

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (CCContactSocialProfile)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CCContactSocialProfile *v14;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("urlString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("username"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CCContactSocialProfile initWithLabel:urlString:username:userIdentifier:serviceName:error:]([CCContactSocialProfile alloc], "initWithLabel:urlString:username:userIdentifier:serviceName:error:", v9, v10, v11, v12, v13, a4);

  }
  else
  {
    CCSetError();
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (unsigned)itemType
{
  return 19668;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
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
