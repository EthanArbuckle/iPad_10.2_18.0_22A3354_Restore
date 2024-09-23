@implementation HMAccessoryNetworkProtectionGroup

- (void)setHome:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMAccessoryNetworkProtectionGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMAccessoryNetworkProtectionGroup *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryNetworkProtectionGroupUUIDCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryNetworkProtectionGroupManufacturerCodingKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryNetworkProtectionGroupCategoryCodingKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMAccessoryNetworkProtectionGroupProtectionModeCodingKey"));

  v9 = -[HMAccessoryNetworkProtectionGroup initWithUUID:manufacturer:category:protectionMode:](self, "initWithUUID:manufacturer:category:protectionMode:", v5, v6, v7, v8);
  return v9;
}

- (HMAccessoryNetworkProtectionGroup)initWithUUID:(id)a3 manufacturer:(id)a4 category:(id)a5 protectionMode:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  HMAccessoryNetworkProtectionGroup *v14;
  HMAccessoryNetworkProtectionGroup *v15;
  uint64_t v16;
  NSUUID *uniqueIdentifier;
  uint64_t v18;
  HMAccessoryCategory *category;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMAccessoryNetworkProtectionGroup;
  v14 = -[HMAccessoryNetworkProtectionGroup init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_uuid, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v15->_uniqueIdentifier;
    v15->_uniqueIdentifier = (NSUUID *)v16;

    objc_storeStrong((id *)&v15->_manufacturer, a4);
    +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:](HMFObjectCacheHMAccessoryCategory, "cachedInstanceForHMAccessoryCategory:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
    category = v15->_category;
    v15->_category = (HMAccessoryCategory *)v18;

    v15->_targetProtectionMode = a6;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
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
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  int64_t v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMAccessoryNetworkProtectionGroup manufacturer](self, "manufacturer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "manufacturer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "manufacturer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryNetworkProtectionGroup setManufacturer:](self, "setManufacturer:", v10);

    }
    -[HMAccessoryNetworkProtectionGroup category](self, "category");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "category");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if ((v13 & 1) != 0)
    {
      v14 = v9 ^ 1;
    }
    else
    {
      objc_msgSend(v6, "category");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryNetworkProtectionGroup setCategory:](self, "setCategory:", v15);

      v14 = 1;
    }
    v16 = -[HMAccessoryNetworkProtectionGroup targetProtectionMode](self, "targetProtectionMode");
    if (v16 != objc_msgSend(v6, "targetProtectionMode"))
    {
      -[HMAccessoryNetworkProtectionGroup setTargetProtectionMode:](self, "setTargetProtectionMode:", objc_msgSend(v6, "targetProtectionMode"));
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (HMHome)home
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMHome *)WeakRetained;
}

- (NSString)manufacturer
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_manufacturer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setManufacturer:(id)a3
{
  NSString *v4;
  NSString *manufacturer;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  manufacturer = self->_manufacturer;
  self->_manufacturer = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMAccessoryCategory)category
{
  os_unfair_lock_s *p_lock;
  HMAccessoryCategory *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_category;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCategory:(id)a3
{
  HMAccessoryCategory *v4;
  HMAccessoryCategory *category;

  v4 = (HMAccessoryCategory *)a3;
  os_unfair_lock_lock_with_options();
  category = self->_category;
  self->_category = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)targetProtectionMode
{
  os_unfair_lock_s *p_lock;
  int64_t targetProtectionMode;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  targetProtectionMode = self->_targetProtectionMode;
  os_unfair_lock_unlock(p_lock);
  return targetProtectionMode;
}

- (void)setTargetProtectionMode:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_targetProtectionMode = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)accessories
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMAccessoryNetworkProtectionGroup home](self, "home", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "networkProtectionGroupUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAccessoryNetworkProtectionGroup uuid](self, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v14;
}

- (void)updateProtectionMode:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HMAccessoryNetworkProtectionGroup home](self, "home");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateAccessoryNetworkProtectionGroup:protectionMode:completion:", self, a3, v6);

}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryNetworkProtectionGroup uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("uniqueIdentifier"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryNetworkProtectionGroup manufacturer](self, "manufacturer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("manufacturer"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryNetworkProtectionGroup category](self, "category");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("category"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMAccessoryNetworkProtectionGroup targetProtectionMode](self, "targetProtectionMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("targetProtectionMode"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_home);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
