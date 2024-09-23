@implementation HMAccessorySettingsPartialFetchFailureInformation

- (HMAccessorySettingsPartialFetchFailureInformation)init
{
  return -[HMAccessorySettingsPartialFetchFailureInformation initWithFailureTypes:](self, "initWithFailureTypes:", MEMORY[0x1E0C9AA70]);
}

- (HMAccessorySettingsPartialFetchFailureInformation)initWithFailureTypes:(id)a3
{
  id v4;
  HMAccessorySettingsPartialFetchFailureInformation *v5;
  uint64_t v6;
  NSMutableDictionary *mutableFailureTypes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessorySettingsPartialFetchFailureInformation;
  v5 = -[HMAccessorySettingsPartialFetchFailureInformation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    mutableFailureTypes = v5->_mutableFailureTypes;
    v5->_mutableFailureTypes = (NSMutableDictionary *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (id)failedKeyPaths
{
  void *v2;
  void *v3;

  -[HMAccessorySettingsPartialFetchFailureInformation failureTypes](self, "failureTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)fetchFailureTypeForKeyPath:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t result;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_mutableFailureTypes, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "integerValue");

    os_unfair_lock_unlock(p_lock);
    return v8;
  }
  else
  {
    result = _HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

- (void)setFetchFailureType:(int64_t)a3 forKeyPath:(id)a4
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *mutableFailureTypes;
  void *v8;
  id v9;

  v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  mutableFailureTypes = self->_mutableFailureTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mutableFailureTypes, "setObject:forKey:", v8, v9);

  os_unfair_lock_unlock(p_lock);
}

- (NSDictionary)failureTypes
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_mutableFailureTypes, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
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
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessorySettingsPartialFetchFailureInformation failureTypes](self, "failureTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("failureTypes"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)payloadCopy
{
  void *v2;
  void *v3;

  -[HMAccessorySettingsPartialFetchFailureInformation failureTypes](self, "failureTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMAccessorySettingsPartialFetchFailureInformation *v4;
  void *v5;
  HMAccessorySettingsPartialFetchFailureInformation *v6;

  v4 = [HMAccessorySettingsPartialFetchFailureInformation alloc];
  -[HMAccessorySettingsPartialFetchFailureInformation failureTypes](self, "failureTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMAccessorySettingsPartialFetchFailureInformation initWithFailureTypes:](v4, "initWithFailureTypes:", v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableAccessorySettingsPartialFetchFailureInformation *v4;
  void *v5;
  HMMutableAccessorySettingsPartialFetchFailureInformation *v6;

  v4 = [HMMutableAccessorySettingsPartialFetchFailureInformation alloc];
  -[HMAccessorySettingsPartialFetchFailureInformation failureTypes](self, "failureTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMAccessorySettingsPartialFetchFailureInformation initWithFailureTypes:](v4, "initWithFailureTypes:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessorySettingsPartialFetchFailureInformation *v4;
  HMAccessorySettingsPartialFetchFailureInformation *v5;
  HMAccessorySettingsPartialFetchFailureInformation *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = (HMAccessorySettingsPartialFetchFailureInformation *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMAccessorySettingsPartialFetchFailureInformation failureTypes](self, "failureTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsPartialFetchFailureInformation failureTypes](v6, "failureTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "count");
      if (v9 == objc_msgSend(v8, "count"))
      {
        objc_msgSend(v7, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __61__HMAccessorySettingsPartialFetchFailureInformation_isEqual___block_invoke;
        v13[3] = &unk_1E3AB2FF8;
        v14 = v8;
        v15 = v7;
        v11 = objc_msgSend(v10, "na_allObjectsPassTest:", v13);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMAccessorySettingsPartialFetchFailureInformation failureTypes](self, "failureTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableFailureTypes, 0);
}

uint64_t __61__HMAccessorySettingsPartialFetchFailureInformation_isEqual___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToNumber:", v6);
  return v7;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
