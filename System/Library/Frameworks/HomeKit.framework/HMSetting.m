@implementation HMSetting

- (HMSetting)initWithInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMSetting;
  return -[HMSetting init](&v3, sel_init);
}

- (HMSetting)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6 properties:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  HMSetting *v15;
  uint64_t v16;
  NSUUID *identifier;
  uint64_t v18;
  NSString *name;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMSetting;
  v15 = -[HMSetting init](&v21, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v15->_identifier;
    v15->_identifier = (NSUUID *)v16;

    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
    name = v15->_name;
    v15->_name = (NSString *)v18;

    objc_storeStrong(&v15->_value, a6);
    v15->_type = a5;
    v15->_properties = a7;
    objc_storeStrong((id *)&v15->_keyPath, a4);
  }

  return v15;
}

- (id)_initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6 properties:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  if ((unint64_t)(a5 - 1) > 4)
    v15 = 0;
  else
    v15 = (void *)objc_msgSend(objc_alloc(*off_1E3AB36D0[a5 - 1]), "initWithIdentifier:name:type:value:properties:", v12, v13, a5, v14, a7);

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMSetting localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetting isWritable](self, "isWritable");
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetting value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@, Title = %@, Writeable = %@, Value = %@]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMSetting keyPath](self, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMAccessorySettings localizationKeyForKeyPath:](HMAccessorySettings, "localizationKeyForKeyPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMLocalization sharedManager](HMLocalization, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLocalizedString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isWritable
{
  return (-[HMSetting properties](self, "properties") >> 1) & 1;
}

- (HMSettingValue)internalValue
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)valueForUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)updateValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  HMSetting *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMSetting settingManager](self, "settingManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "updateValueForSetting:value:completionHandler:", self, v6, v7);
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@setting does not have manager", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14);

  }
}

- (BOOL)isEqual:(id)a3
{
  HMSetting *v4;
  HMSetting *v5;
  HMSetting *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMSetting *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    -[HMSetting value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetting value](v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = HMFEqualObjects();
  }

  return v9;
}

- (void)merge:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "value");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v5, "copy");
  -[HMSetting setValue:](self, "setValue:", v4);

}

- (HMSetting)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMSetting *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("HM.value"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.properties"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HMSetting _initWithIdentifier:name:type:value:properties:](self, "_initWithIdentifier:name:type:value:properties:", v7, v15, v6, v12, v14);
  return v16;
}

- (id)value
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (Class)valueClass
{
  return (Class)objc_getProperty(self, a2, 32, 1);
}

- (void)setValueClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (HMSettingManager)settingManager
{
  return (HMSettingManager *)objc_loadWeakRetained((id *)&self->_settingManager);
}

- (void)setSettingManager:(id)a3
{
  objc_storeWeak((id *)&self->_settingManager, a3);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_settingManager);
  objc_storeStrong((id *)&self->_valueClass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
