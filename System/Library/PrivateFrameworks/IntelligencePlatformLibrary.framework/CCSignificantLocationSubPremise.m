@implementation CCSignificantLocationSubPremise

- (CCSignificantLocationSubPremise)initWithType:(unsigned int)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  id v11;
  int IsInstanceOfExpectedClass;
  id v13;
  void *v14;
  CCSignificantLocationSubPremise *v15;
  id v17;

  v8 = a4;
  v9 = (void *)objc_opt_new();
  if (!a3)
  {
    v11 = 0;
    if (!v8)
      goto LABEL_8;
LABEL_6:
    objc_opt_class();
    v17 = v11;
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v13 = v11;

    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      v15 = 0;
      v11 = v13;
      goto LABEL_11;
    }
    CCPBDataWriterWriteStringField();
    v11 = v13;
    goto LABEL_8;
  }
  v10 = CCValidateEnumField();
  v11 = 0;
  if (!v10)
  {
    CCSetError();
    v15 = 0;
    goto LABEL_11;
  }
  CCPBDataWriterWriteUint32Field();
  if (v8)
    goto LABEL_6;
LABEL_8:
  objc_msgSend(v9, "immutableData", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v14, a5);

  v15 = self;
LABEL_11:

  return v15;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  int *v8;
  int *v9;
  int *v10;
  void *v11;
  int *v12;
  BOOL v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  NSString *v27;
  NSString *value;
  objc_class *v29;
  id v30;
  id *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  BOOL v35;
  CCSignificantLocationSubPremise *v37;

  v6 = a3;
  v7 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v6);
  v8 = (int *)MEMORY[0x24BE15728];
  v9 = (int *)MEMORY[0x24BE15720];
  v10 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v7[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v7[*MEMORY[0x24BE15720]])
    goto LABEL_38;
  v11 = 0;
  v12 = (int *)MEMORY[0x24BE15710];
  v37 = self;
  do
  {
    if (*(_QWORD *)&v7[*v10])
      v13 = 0;
    else
      v13 = v11 == 0;
    if (!v13)
      break;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = *v8;
      v18 = *(_QWORD *)&v7[v17];
      if (v18 == -1 || v18 >= *(_QWORD *)&v7[*v9])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v18);
      *(_QWORD *)&v7[v17] = v18 + 1;
      v16 |= (unint64_t)(v19 & 0x7F) << v14;
      if ((v19 & 0x80) == 0)
        goto LABEL_17;
      v14 += 7;
      v20 = v15++ >= 9;
      if (v20)
      {
        v16 = 0;
        if (*(_QWORD *)&v7[*v10])
          goto LABEL_39;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v7[*v10] = 1;
LABEL_17:
    if (*(_QWORD *)&v7[*v10])
      goto LABEL_39;
LABEL_18:
    if ((v16 >> 3) == 2)
    {
      CCPBReaderReadStringNoCopy();
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v27;

      v11 = 0;
    }
    else if ((v16 >> 3) == 1)
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
      while (1)
      {
        v24 = *v8;
        v25 = *(_QWORD *)&v7[v24];
        if (v25 == -1 || v25 >= *(_QWORD *)&v7[*v9])
          break;
        v26 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v25);
        *(_QWORD *)&v7[v24] = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_31;
        v21 += 7;
        v20 = v22++ >= 9;
        if (v20)
        {
          LODWORD(v23) = 0;
          goto LABEL_33;
        }
      }
      *(_QWORD *)&v7[*v10] = 1;
LABEL_31:
      if (*(_QWORD *)&v7[*v10])
        LODWORD(v23) = 0;
LABEL_33:
      v11 = 0;
      self->_type = v23;
    }
    else if ((CCPBReaderSkipValueWithTag() & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = v6;
      v31 = a4;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      CCSkipFieldErrorForMessage();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      a4 = v31;
      v6 = v30;
      self = v37;
    }
  }
  while (*(_QWORD *)&v7[*v8] < *(_QWORD *)&v7[*v9]);
  if (v11)
  {
    CCSetError();
  }
  else
  {
LABEL_38:
    if (!*(_QWORD *)&v7[*v10])
    {
      v35 = 1;
      goto LABEL_42;
    }
LABEL_39:
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v35 = 0;
LABEL_42:

  return v35;
}

- (NSString)value
{
  return (NSString *)(id)-[NSString copy](self->_value, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:enumValue:", 15775, self->_type);
  v7[2](v7, v5);

  if (self->_value)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 15776, self->_value);
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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCSignificantLocationSubPremise type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  if (self->_value)
  {
    -[CCSignificantLocationSubPremise value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("value"));

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (CCSignificantLocationSubPremise)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CCSignificantLocationSubPremise *v12;
  void *v13;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "unsignedIntegerValue");
    else
      v11 = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CCSignificantLocationSubPremise initWithType:value:error:]([CCSignificantLocationSubPremise alloc], "initWithType:value:error:", v11, v13, a4);

  }
  else
  {
    CCSetError();
    v12 = 0;
  }

  return v12;
}

- (unsigned)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (unsigned)itemType
{
  return 15757;
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
