@implementation MCKeyValue

- (MCKeyValue)initWithData:(id)a3 localizedKey:(id)a4
{
  id v6;
  id v7;
  MCKeyValue *v8;
  MCKeyValue *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCKeyValue;
  v8 = -[MCKeyValue init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[MCKeyValue setData:localizedKey:](v8, "setData:localizedKey:", v6, v7);

  return v9;
}

- (MCKeyValue)initWithDate:(id)a3 localizedKey:(id)a4
{
  id v6;
  id v7;
  MCKeyValue *v8;
  MCKeyValue *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCKeyValue;
  v8 = -[MCKeyValue init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[MCKeyValue setDate:localizedKey:](v8, "setDate:localizedKey:", v6, v7);

  return v9;
}

- (MCKeyValue)initWithLocalizedArray:(id)a3 localizedKey:(id)a4
{
  id v6;
  id v7;
  MCKeyValue *v8;
  MCKeyValue *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCKeyValue;
  v8 = -[MCKeyValue init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[MCKeyValue setLocalizedArray:localizedKey:](v8, "setLocalizedArray:localizedKey:", v6, v7);

  return v9;
}

- (MCKeyValue)initWithLocalizedString:(id)a3 localizedKey:(id)a4
{
  id v6;
  id v7;
  MCKeyValue *v8;
  MCKeyValue *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCKeyValue;
  v8 = -[MCKeyValue init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[MCKeyValue setLocalizedString:localizedKey:](v8, "setLocalizedString:localizedKey:", v6, v7);

  return v9;
}

- (MCKeyValue)initWithValue:(id)a3 localizedKey:(id)a4
{
  id v6;
  id v7;
  MCKeyValue *v8;
  void *v9;
  char isKindOfClass;
  MCKeyValue *v11;
  id v12;
  NSObject *v13;
  MCKeyValue *v14;
  objc_super v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[MCKeyValue initWithData:localizedKey:](self, "initWithData:localizedKey:", v6, v7);
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[MCKeyValue initWithDate:localizedKey:](self, "initWithDate:localizedKey:", v6, v7);
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = -[MCKeyValue initWithLocalizedArray:localizedKey:](self, "initWithLocalizedArray:localizedKey:", v6, v7);
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = self;
    v12 = v6;
LABEL_15:
    v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v11, "initWithLocalizedString:localizedKey:", v12, v7);
    goto LABEL_16;
  }
  if (!v6)
  {
    v11 = self;
    v12 = 0;
    goto LABEL_15;
  }
  v13 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_ERROR, "Failed to set key & value of MCKeyValue as value was unrecognized type", buf, 2u);
  }
  v16.receiver = self;
  v16.super_class = (Class)MCKeyValue;
  v8 = -[MCKeyValue init](&v16, sel_init);
LABEL_16:
  v14 = v8;

  return v14;
}

- (void)setData:(id)a3 localizedKey:(id)a4
{
  NSString *v7;
  id v8;

  v8 = a3;
  v7 = (NSString *)a4;
  if (self->_key != v7)
    objc_storeStrong((id *)&self->_key, a4);
  if (self->_value != v8)
  {
    objc_storeStrong(&self->_value, a3);
    self->_valueType = 1;
  }

}

- (void)setDate:(id)a3 localizedKey:(id)a4
{
  NSString *v7;
  id v8;

  v8 = a3;
  v7 = (NSString *)a4;
  if (self->_key != v7)
    objc_storeStrong((id *)&self->_key, a4);
  if (self->_value != v8)
  {
    objc_storeStrong(&self->_value, a3);
    self->_valueType = 2;
  }

}

- (void)setLocalizedArray:(id)a3 localizedKey:(id)a4
{
  NSString *v7;
  void *v8;
  char isKindOfClass;
  id v10;

  v10 = a3;
  v7 = (NSString *)a4;
  objc_msgSend(v10, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (self->_key != v7)
      objc_storeStrong((id *)&self->_key, a4);
    if (self->_value != v10)
    {
      objc_storeStrong(&self->_value, a3);
      self->_valueType = 0;
    }
  }

}

- (void)setLocalizedString:(id)a3 localizedKey:(id)a4
{
  NSString *v7;
  id v8;

  v8 = a3;
  v7 = (NSString *)a4;
  if (self->_key != v7)
    objc_storeStrong((id *)&self->_key, a4);
  if (self->_value != v8)
  {
    objc_storeStrong(&self->_value, a3);
    self->_valueType = 3;
  }

}

- (void)setValue:(id)a3 localizedKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  MCKeyValue *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[MCKeyValue setDate:localizedKey:](self, "setDate:localizedKey:", v6, v7);
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[MCKeyValue setLocalizedArray:localizedKey:](self, "setLocalizedArray:localizedKey:", v6, v7);
      goto LABEL_4;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = self;
    v11 = v6;
LABEL_14:
    -[MCKeyValue setLocalizedString:localizedKey:](v10, "setLocalizedString:localizedKey:", v11, v7);
    goto LABEL_4;
  }
  if (!v6)
  {
    v10 = self;
    v11 = 0;
    goto LABEL_14;
  }
  v12 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_ERROR, "Failed to set key & value of MCKeyValue as value was unrecognized type", v13, 2u);
  }
LABEL_4:

}

- (BOOL)isStringValue
{
  return self->_valueType == 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MCKeyValue key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("key"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MCKeyValue valueType](self, "valueType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("valueType"));

  -[MCKeyValue value](self, "value");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("value"));

}

- (MCKeyValue)initWithCoder:(id)a3
{
  id v4;
  MCKeyValue *v5;
  void *v6;
  uint64_t v7;
  NSString *key;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id value;
  uint64_t v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MCKeyValue;
  v5 = -[MCKeyValue init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("key"));
    v7 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_valueType = objc_msgSend(v9, "unsignedIntegerValue");

    switch(v5->_valueType)
    {
      case 0uLL:
        v10 = (void *)MEMORY[0x1E0C99E60];
        v11 = objc_opt_class();
        objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
        goto LABEL_8;
      case 1uLL:
        v12 = (void *)MEMORY[0x1E0C99E60];
        goto LABEL_7;
      case 2uLL:
        v12 = (void *)MEMORY[0x1E0C99E60];
        goto LABEL_7;
      case 3uLL:
        v12 = (void *)MEMORY[0x1E0C99E60];
LABEL_7:
        objc_msgSend(v12, "setWithObjects:", objc_opt_class(), 0, v17);
LABEL_8:
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("value"));
        v14 = objc_claimAutoreleasedReturnValue();
        value = v5->_value;
        v5->_value = (id)v14;

        break;
      default:
        break;
    }
  }

  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (id)value
{
  return self->_value;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
