@implementation HMAccessoryCollectionSettingItem

- (HMAccessoryCollectionSettingItem)init
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

- (HMAccessoryCollectionSettingItem)initWithValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMAccessoryCollectionSettingItem *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMAccessoryCollectionSettingItem initWithIdentifier:value:](self, "initWithIdentifier:value:", v6, v5);

  return v7;
}

- (HMAccessoryCollectionSettingItem)initWithIdentifier:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessoryCollectionSettingItem *v9;
  uint64_t v10;
  NSUUID *identifier;
  HMAccessoryCollectionSettingItem *v13;
  SEL v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = v7;
    v15.receiver = self;
    v15.super_class = (Class)HMAccessoryCollectionSettingItem;
    v9 = -[HMAccessoryCollectionSettingItem init](&v15, sel_init);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
      identifier = v9->_identifier;
      v9->_identifier = (NSUUID *)v10;

      objc_storeStrong((id *)&v9->_value, a4);
    }

    return v9;
  }
  else
  {
    v13 = (HMAccessoryCollectionSettingItem *)_HMFPreconditionFailure();
    return (HMAccessoryCollectionSettingItem *)-[HMAccessoryCollectionSettingItem hash](v13, v14);
  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMAccessoryCollectionSettingItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryCollectionSettingItem *v4;
  HMAccessoryCollectionSettingItem *v5;
  HMAccessoryCollectionSettingItem *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMAccessoryCollectionSettingItem *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (-[HMAccessoryCollectionSettingItem identifier](self, "identifier"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMAccessoryCollectionSettingItem identifier](v6, "identifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqual:", v8),
          v8,
          v7,
          v9))
    {
      -[HMAccessoryCollectionSettingItem value](self, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryCollectionSettingItem value](v6, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = HMFEqualObjects();

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
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
  -[HMAccessoryCollectionSettingItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E3AB7688;
  }
  -[HMAccessoryCollectionSettingItem identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryCollectionSettingItem value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Identifier = %@, Value = %@>"), v6, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v11;
}

- (id)debugDescription
{
  return -[HMAccessoryCollectionSettingItem descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HMAccessoryCollectionSettingItem descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (NSData)serializedValue
{
  NSData *serializedValue;
  NSData *v3;
  void *v4;

  serializedValue = self->_serializedValue;
  if (serializedValue)
  {
    v3 = serializedValue;
  }
  else
  {
    -[HMAccessoryCollectionSettingItem value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject(v4);
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSObject)value
{
  os_unfair_lock_s *p_lock;
  NSObject *value;
  void *v6;
  HMAccessoryCollectionSettingItem *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMAccessoryCollectionSettingItem *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject **p_value;
  NSObject *v20;
  NSObject *v21;
  void *context;
  HMAccessoryCollectionSettingItem *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[HMAccessoryCollectionSettingItem shouldBlockValueDecode](self, "shouldBlockValueDecode"))
    return 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  value = self->_value;
  if (!value)
  {
    -[HMAccessoryCollectionSettingItem serializedValue](self, "serializedValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self;
    v8 = v6;
    context = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = v7;
    -[HMAccessoryCollectionSettingItem setting](v7, "setting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "itemValueClasses");
    else
      +[_HMAccessoryCollectionSettingItemClassManager defaultItemValueClasses](_HMAccessoryCollectionSettingItemClassManager, "defaultItemValueClasses");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, 0);
    objc_msgSend(v11, "setDecodingFailurePolicy:", 1);
    objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v24, *MEMORY[0x1E0CB2CD0]);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1A1AC1AAC]();
      v15 = v23;
      HMFGetOSLogHandle();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "error");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v17;
        v27 = 2112;
        v28 = v18;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize accessory collection setting item value with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    objc_msgSend(v11, "finishDecoding");

    objc_autoreleasePoolPop(context);
    v20 = self->_value;
    p_value = &self->_value;
    *p_value = v12;

    value = *p_value;
  }
  v21 = value;
  os_unfair_lock_unlock(p_lock);
  return v21;
}

- (BOOL)shouldBlockValueDecode
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  HMAccessoryCollectionSettingItem *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMAccessoryCollectionSettingItem setting](self, "setting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to block decode value due to no keypath for setting: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_7;
  }
  if (!+[HMAccessoryCollectionSettingItem requiresCustomItemValueClassesToDecodeForKeyPath:](HMAccessoryCollectionSettingItem, "requiresCustomItemValueClassesToDecodeForKeyPath:", v4))
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  +[_HMAccessoryCollectionSettingItemClassManager sharedManager](_HMAccessoryCollectionSettingItemClassManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCustomItemValueClassesForKeyPath:", v4);

  v7 = v6 ^ 1;
LABEL_8:

  return v7;
}

- (HMAccessoryCollectionSettingItem)initWithCoder:(id)a3
{
  id v4;
  HMAccessoryCollectionSettingItem *v5;
  void *v6;
  uint64_t v7;
  NSUUID *identifier;
  uint64_t v9;
  NSData *serializedValue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMAccessoryCollectionSettingItem;
  v5 = -[HMAccessoryCollectionSettingItem init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.value"));
    v9 = objc_claimAutoreleasedReturnValue();
    serializedValue = v5->_serializedValue;
    v5->_serializedValue = (NSData *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMAccessoryCollectionSettingItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

  -[HMAccessoryCollectionSettingItem serializedValue](self, "serializedValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.value"));

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (HMAccessoryCollectionSetting)setting
{
  return (HMAccessoryCollectionSetting *)objc_loadWeakRetained((id *)&self->_setting);
}

- (void)setSetting:(id)a3
{
  objc_storeWeak((id *)&self->_setting, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setting);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_serializedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)requiresCustomItemValueClassesToDecodeForKeyPath:(id)a3
{
  return objc_msgSend(&unk_1E3B30940, "containsObject:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
