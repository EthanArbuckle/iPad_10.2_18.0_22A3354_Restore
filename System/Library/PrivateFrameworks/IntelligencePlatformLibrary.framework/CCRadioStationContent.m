@implementation CCRadioStationContent

- (CCRadioStationContent)initWithName:(id)a3 callSign:(id)a4 frequency:(id)a5 channel:(id)a6 signalType:(unsigned int)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  int IsInstanceOfExpectedClass;
  id v21;
  int v22;
  CCRadioStationContent *v23;
  int v24;
  int v25;
  void *v26;
  CCRadioStationContent *v27;
  CCRadioStationContent *v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void *)objc_opt_new();
  if (!v13)
  {
    v19 = 0;
LABEL_5:
    v30 = self;
    if (v14)
    {
      objc_opt_class();
      IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
      v21 = v19;

      if (!IsInstanceOfExpectedClass)
        goto LABEL_11;
      CCPBDataWriterWriteStringField();
      if (!v15)
      {
LABEL_8:
        v19 = v21;
        if (v16)
          goto LABEL_9;
        goto LABEL_16;
      }
    }
    else
    {
      v21 = v19;
      if (!v15)
        goto LABEL_8;
    }
    objc_opt_class();
    v24 = CCValidateIsInstanceOfExpectedClass();
    v19 = v21;

    if (!v24)
    {
LABEL_20:
      CCSetError();
      v23 = 0;
      goto LABEL_21;
    }
    CCPBDataWriterWriteStringField();
    if (v16)
    {
LABEL_9:
      objc_opt_class();
      v22 = CCValidateIsInstanceOfExpectedClass();
      v21 = v19;

      if (v22)
      {
        CCPBDataWriterWriteStringField();
LABEL_17:
        if (!a7)
        {
          v19 = v21;
          goto LABEL_23;
        }
        v25 = CCValidateEnumField();
        v19 = v21;

        if (v25)
        {
          CCPBDataWriterWriteUint32Field();
LABEL_23:
          objc_msgSend(v17, "immutableData");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[CCItemMessage initWithData:error:](v30, "initWithData:error:", v26, a8);

          self = v27;
          v23 = v27;
          goto LABEL_24;
        }
        goto LABEL_20;
      }
LABEL_11:
      CCSetError();
      v23 = 0;
      v19 = v21;
LABEL_21:
      self = v30;
      goto LABEL_24;
    }
LABEL_16:
    v21 = v19;
    goto LABEL_17;
  }
  objc_opt_class();
  v18 = CCValidateIsInstanceOfExpectedClass();
  v19 = 0;
  if (v18)
  {
    CCPBDataWriterWriteStringField();
    goto LABEL_5;
  }
  CCSetError();
  v23 = 0;
LABEL_24:

  return v23;
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
  objc_class *v21;
  uint64_t v22;
  void *v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  objc_class *v30;
  id v31;
  void *v32;
  objc_class *v33;
  void *v34;
  BOOL v35;
  id *v37;

  v6 = a3;
  v7 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v6);
  v8 = (int *)MEMORY[0x24BE15728];
  v9 = (int *)MEMORY[0x24BE15720];
  v10 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v7[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v7[*MEMORY[0x24BE15720]])
    goto LABEL_41;
  v11 = 0;
  v12 = (int *)MEMORY[0x24BE15710];
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
          goto LABEL_42;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v7[*v10] = 1;
LABEL_17:
    if (*(_QWORD *)&v7[*v10])
      goto LABEL_42;
LABEL_18:
    switch((v16 >> 3))
    {
      case 1u:
        CCPBReaderReadStringNoCopy();
        v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v22 = 24;
        goto LABEL_25;
      case 2u:
        CCPBReaderReadStringNoCopy();
        v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v22 = 32;
        goto LABEL_25;
      case 3u:
        CCPBReaderReadStringNoCopy();
        v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v22 = 40;
        goto LABEL_25;
      case 4u:
        CCPBReaderReadStringNoCopy();
        v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v22 = 48;
LABEL_25:
        v23 = *(Class *)((char *)&self->super.super.isa + v22);
        *(Class *)((char *)&self->super.super.isa + v22) = v21;

        v11 = 0;
        continue;
      case 5u:
        v24 = 0;
        v25 = 0;
        v26 = 0;
        break;
      default:
        if ((CCPBReaderSkipValueWithTag() & 1) != 0)
        {
          v11 = 0;
        }
        else
        {
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v37 = a4;
          v31 = v6;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          CCSkipFieldErrorForMessage();
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v31;
          a4 = v37;
        }
        continue;
    }
    while (1)
    {
      v27 = *v8;
      v28 = *(_QWORD *)&v7[v27];
      if (v28 == -1 || v28 >= *(_QWORD *)&v7[*v9])
        break;
      v29 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v28);
      *(_QWORD *)&v7[v27] = v28 + 1;
      v26 |= (unint64_t)(v29 & 0x7F) << v24;
      if ((v29 & 0x80) == 0)
        goto LABEL_34;
      v24 += 7;
      v20 = v25++ >= 9;
      if (v20)
      {
        LODWORD(v26) = 0;
        goto LABEL_36;
      }
    }
    *(_QWORD *)&v7[*v10] = 1;
LABEL_34:
    if (*(_QWORD *)&v7[*v10])
      LODWORD(v26) = 0;
LABEL_36:
    v11 = 0;
    self->_signalType = v26;
  }
  while (*(_QWORD *)&v7[*v8] < *(_QWORD *)&v7[*v9]);
  if (v11)
  {
    CCSetError();
  }
  else
  {
LABEL_41:
    if (!*(_QWORD *)&v7[*v10])
    {
      v35 = 1;
      goto LABEL_45;
    }
LABEL_42:
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v35 = 0;
LABEL_45:

  return v35;
}

- (NSString)name
{
  return (NSString *)(id)-[NSString copy](self->_name, "copy");
}

- (NSString)callSign
{
  return (NSString *)(id)-[NSString copy](self->_callSign, "copy");
}

- (NSString)frequency
{
  return (NSString *)(id)-[NSString copy](self->_frequency, "copy");
}

- (NSString)channel
{
  return (NSString *)(id)-[NSString copy](self->_channel, "copy");
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
  if (self->_name)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 49069, self->_name);
    v10[2](v10, v5);

  }
  if (self->_callSign)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 49070, self->_callSign);
    v10[2](v10, v6);

  }
  if (self->_frequency)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 49071, self->_frequency);
    v10[2](v10, v7);

  }
  if (self->_channel)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 49072, self->_channel);
    v10[2](v10, v8);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:enumValue:", 49073, self->_signalType);
  v10[2](v10, v9);

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
  if (self->_name)
  {
    -[CCRadioStationContent name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  }
  if (self->_callSign)
  {
    -[CCRadioStationContent callSign](self, "callSign");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("callSign"));

  }
  if (self->_frequency)
  {
    -[CCRadioStationContent frequency](self, "frequency");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("frequency"));

  }
  if (self->_channel)
  {
    -[CCRadioStationContent channel](self, "channel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("channel"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCRadioStationContent signalType](self, "signalType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("signalType"));

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

- (CCRadioStationContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CCRadioStationContent *v16;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("callSign"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("frequency"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("channel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("signalType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = objc_msgSend(v13, "unsignedIntegerValue");
    else
      v15 = 0;
    v16 = -[CCRadioStationContent initWithName:callSign:frequency:channel:signalType:error:]([CCRadioStationContent alloc], "initWithName:callSign:frequency:channel:signalType:error:", v9, v10, v11, v12, v15, a4);

  }
  else
  {
    CCSetError();
    v16 = 0;
  }

  return v16;
}

- (unsigned)signalType
{
  return self->_signalType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_callSign, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (unsigned)itemType
{
  return -16470;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 16470) > 7u)
    return 0;
  else
    return *(&off_251030758 + (unsigned __int16)(a3 + 16470));
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
