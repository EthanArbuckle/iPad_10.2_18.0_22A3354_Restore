@implementation HPSSetting

- (HPSSetting)initWithKeyPath:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  HPSSetting *v9;
  uint64_t v10;
  NSString *keyPath;
  uint64_t v12;
  NSObject *value;
  uint64_t v14;
  NSDate *lastModifiedDate;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
    objc_exception_throw(objc_retainAutorelease((id)*MEMORY[0x24BDBCAB0]));
  v17.receiver = self;
  v17.super_class = (Class)HPSSetting;
  v9 = -[HPSSetting init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    keyPath = v9->_keyPath;
    v9->_keyPath = (NSString *)v10;

    v12 = objc_msgSend(v7, "copyWithZone:", 0);
    value = v9->_value;
    v9->_value = v12;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v14 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v9->_lastModifiedDate;
    v9->_lastModifiedDate = (NSDate *)v14;

  }
  return v9;
}

+ (HPSSetting)settingWithKeyPath:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKeyPath:value:", v7, v6);

  return (HPSSetting *)v8;
}

- (BOOL)isEquivalentToSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[HPSSetting value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HPSSetting keyPath](self, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);
  if (!v5)
  {
    if (v8)
    {
      objc_msgSend(v4, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9 == 0;
      goto LABEL_6;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!v8)
    goto LABEL_7;
  -[HPSSetting value](self, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

LABEL_6:
LABEL_8:

  return v11;
}

- (BOOL)isEqualToSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[HPSSetting value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HPSSetting keyPath](self, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);
  if (v5)
  {
    if (v8)
    {
      -[HPSSetting value](self, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqual:", v10))
      {
        v13 = 0;
LABEL_12:

        goto LABEL_13;
      }
      -[HPSSetting lastModifiedDate](self, "lastModifiedDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastModifiedDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

LABEL_11:
      goto LABEL_12;
    }
  }
  else if (v8)
  {
    objc_msgSend(v4, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v13 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[HPSSetting lastModifiedDate](self, "lastModifiedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastModifiedDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqual:", v11);
    goto LABEL_11;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

+ (Class)valueClass
{
  return 0;
}

+ (id)valueClasses
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  HPSSetting *v4;
  BOOL v5;

  v4 = (HPSSetting *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[HPSSetting isEqualToSetting:](self, "isEqualToSetting:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HPSSetting keyPath](self, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSetting keyPath](self, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSetting value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSetting lastModifiedDescription](self, "lastModifiedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ = %@%@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)lastModifiedDescription
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  -[HPSSetting lastModifiedDate](self, "lastModifiedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToDate:", v4) & 1) != 0)
  {
    v5 = &stru_24F9BAC78;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[HPSSetting lastModifiedDate](self, "lastModifiedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR(" (modified: %@)"), v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HPSSetting keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("setting.keypath"));

  -[HPSSetting value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v6, "setRequiresSecureCoding:", 1);
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("setting.value"));
    objc_msgSend(v6, "encodedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("setting.value"));

  }
  -[HPSSetting lastModifiedDate](self, "lastModifiedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("setting.lastmodifieddate"));

}

- (HPSSetting)initWithCoder:(id)a3
{
  id v4;
  HPSSetting *v5;
  uint64_t v6;
  NSString *keyPath;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *value;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSDate *lastModifiedDate;
  NSDate *v21;
  HPSSetting *v22;
  id v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HPSSetting;
  v5 = -[HPSSetting init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setting.keypath"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyPath = v5->_keyPath;
    v5->_keyPath = (NSString *)v6;

    if (!v5->_keyPath)
      goto LABEL_14;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("setting.value")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setting.value"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v8, &v24);
      v10 = v24;
      objc_msgSend(v9, "setRequiresSecureCoding:", 1);
      objc_msgSend(v9, "_enableStrictSecureDecodingMode");
      objc_msgSend(v9, "setDecodingFailurePolicy:", 1);
      objc_msgSend((id)objc_opt_class(), "valueClass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v9, "decodeObjectOfClass:forKey:", v11, CFSTR("setting.value"));
        v12 = objc_claimAutoreleasedReturnValue();
        value = v5->_value;
        v5->_value = v12;

        if (!v5->_value)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "valueClasses");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
          goto LABEL_13;
        v15 = (void *)v14;
        objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v14, CFSTR("setting.value"));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v5->_value;
        v5->_value = v16;

        v18 = v5->_value;
        if (!v18)
          goto LABEL_13;
      }

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setting.lastmodifieddate"));
    v19 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v19;

    v21 = v5->_lastModifiedDate;
    if (!v21)
    {
LABEL_14:
      v22 = 0;
      goto LABEL_15;
    }
  }
  v22 = v5;
LABEL_15:

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSObject)value
{
  return self->_value;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
