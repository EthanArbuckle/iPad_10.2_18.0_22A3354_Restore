@implementation HKFeatureSettings

- (HKFeatureSettings)initWithDictionary:(id)a3
{
  id v4;
  HKFeatureSettings *v5;
  uint64_t v6;
  NSDictionary *keyValueStorage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureSettings;
  v5 = -[HKFeatureSettings init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    keyValueStorage = v5->_keyValueStorage;
    v5->_keyValueStorage = (NSDictionary *)v6;

  }
  return v5;
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v6 = a3;
  -[HKFeatureSettings keyValueStorage](self, "keyValueStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to retrieve value for key %@ as NSData."), v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError(v10);
    }

    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v6 = a3;
  -[HKFeatureSettings keyValueStorage](self, "keyValueStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to retrieve value for key %@ as NSString."), v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError(v10);
    }

    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (id)numberForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v6 = a3;
  -[HKFeatureSettings keyValueStorage](self, "keyValueStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to retrieve value for key %@ as NSNumber."), v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError(v10);
    }

    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (id)dataForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  -[HKFeatureSettings dataForKey:error:](self, "dataForKey:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT))
      -[HKFeatureSettings dataForKey:].cold.1(v5, v4);
    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)stringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  -[HKFeatureSettings stringForKey:error:](self, "stringForKey:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT))
      -[HKFeatureSettings dataForKey:].cold.1(v5, v4);
    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)numberForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  -[HKFeatureSettings numberForKey:error:](self, "numberForKey:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT))
      -[HKFeatureSettings dataForKey:].cold.1(v5, v4);
    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSDictionary *keyValueStorage;
  NSDictionary *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureSettings;
  if (-[HKFeatureSettings isEqual:](&v9, sel_isEqual_, v4))
    goto LABEL_2;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  keyValueStorage = self->_keyValueStorage;
  v7 = (NSDictionary *)v4[1];
  if (keyValueStorage != v7)
  {
    if (v7)
    {
      v5 = -[NSDictionary isEqual:](keyValueStorage, "isEqual:");
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_2:
  v5 = 1;
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_keyValueStorage, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_keyValueStorage);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureSettings)initWithCoder:(id)a3
{
  id v4;
  HKFeatureSettings *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *keyValueStorage;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKFeatureSettings;
  v5 = -[HKFeatureSettings init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("keyValueStorage"));
    v11 = objc_claimAutoreleasedReturnValue();
    keyValueStorage = v5->_keyValueStorage;
    v5->_keyValueStorage = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_keyValueStorage, CFSTR("keyValueStorage"));
}

- (NSDictionary)keyValueStorage
{
  return self->_keyValueStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueStorage, 0);
}

- (void)dataForKey:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_19A0E6000, v5, v6, "Reading setting failed with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
