@implementation HMFPreference

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMFPreference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5 parent:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMFPreference *v13;
  uint64_t v14;
  NSString *key;
  uint64_t v16;
  NSObject *value;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMFPreference;
  v13 = -[HMFPreference init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    key = v13->_key;
    v13->_key = (NSString *)v14;

    v13->_options = a4;
    v16 = objc_msgSend(v11, "copy");
    value = v13->_value;
    v13->_value = v16;

    objc_storeWeak((id *)&v13->_parent, v12);
  }

  return v13;
}

- (HMFPreference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5
{
  return -[HMFPreference initWithKey:options:defaultValue:parent:](self, "initWithKey:options:defaultValue:parent:", a3, a4, a5, 0);
}

- (HMFPreference)parent
{
  return (HMFPreference *)objc_loadWeakRetained((id *)&self->_parent);
}

- (BOOL)BOOLValue
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if ((__disabledDueToParent(self) & 1) != 0)
    return 0;
  -[HMFPreference value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMFPreference numberValue](self, "numberValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v3 = !v5 || objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSNumber)numberValue
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  id v8;
  char isKindOfClass;
  void *v10;
  id v11;
  id v12;

  if ((__disabledDueToParent(self) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[HMFPreference value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      v5 = objc_opt_isKindOfClass() & 1;
      if (v5)
        v6 = v4;
      else
        v6 = 0;
      v7 = v6;
      v3 = v4;
      if (!v5)
      {
        v8 = v4;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v10 = v8;
        else
          v10 = 0;
        v11 = v10;

        v3 = 0;
        if ((isKindOfClass & 1) != 0)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
          objc_msgSend(v12, "setNumberStyle:", 1);
          objc_msgSend(v12, "numberFromString:", v8);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
    else
    {
      v3 = 0;
    }

  }
  return (NSNumber *)v3;
}

- (NSObject)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (HMFPreference)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  return CFSTR("Preference");
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFPreference key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  if ((__disabledDueToParent(self) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[HMFPreference value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v6 = v4;
      else
        v6 = 0;
      v7 = v6;
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v4, "stringValue");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = v4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v8 = v10;
      }
      v3 = v8;

    }
    else
    {
      v3 = 0;
    }

  }
  return (NSString *)v3;
}

- (NSData)dataValue
{
  id v3;
  void *v4;
  void *v5;

  if ((__disabledDueToParent(self) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[HMFPreference value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
      v3 = v5;
    }
    else
    {
      v3 = 0;
    }

  }
  return (NSData *)v3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
