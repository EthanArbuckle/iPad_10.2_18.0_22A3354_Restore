@implementation CBMutableDescriptor

- (CBMutableDescriptor)initWithType:(CBUUID *)UUID value:(id)value
{
  CBUUID *v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  SEL v14;
  CBMutableDescriptor *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  CBMutableDescriptor *v23;
  CBMutableDescriptor *v24;
  objc_super v26;

  v7 = UUID;
  v8 = value;
  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("2901"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CBUUID isEqual:](v7, "isEqual:", v9);

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("Expecting NSString value type for User Description descriptor");
    v14 = a2;
    v15 = self;
    v16 = 78;
    goto LABEL_17;
  }
  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("2904"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CBUUID isEqual:](v7, "isEqual:", v17);

  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("Expecting NSData value type for Format descriptor");
    v14 = a2;
    v15 = self;
    v16 = 80;
    goto LABEL_17;
  }
  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("2906"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CBUUID isEqual:](v7, "isEqual:", v19);

  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v8, "length") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("Valid range must be an even number of bytes");
      v14 = a2;
      v15 = self;
      v16 = 82;
LABEL_17:
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v14, v15, CFSTR("CBDescriptor.m"), v16, v13);

    }
  }
  else
  {
    -[CBUUID data](v7, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (v22 == 16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("Expecting NSData value type for 128-bit descriptor");
        v14 = a2;
        v15 = self;
        v16 = 84;
        goto LABEL_17;
      }
    }
  }
LABEL_13:
  v26.receiver = self;
  v26.super_class = (Class)CBMutableDescriptor;
  v23 = -[CBAttribute initWithUUID:](&v26, sel_initWithUUID_, v7);
  v24 = v23;
  if (v23)
    -[CBDescriptor setValue:](v23, "setValue:", v8);

  return v24;
}

- (CBMutableDescriptor)initWithCharacteristic:(id)a3 dictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CBMutableDescriptor *v9;
  uint64_t v10;
  NSNumber *ID;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CBMutableDescriptor initWithType:value:](self, "initWithType:value:", v7, v8);
  if (v9)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributeID"));
    v10 = objc_claimAutoreleasedReturnValue();
    ID = v9->_ID;
    v9->_ID = (NSNumber *)v10;

  }
  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CBAttribute UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBDescriptor value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p UUID = %@, Value = %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
