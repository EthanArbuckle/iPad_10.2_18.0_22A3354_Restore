@implementation HMSiriEndpointProfileAssistant

- (HMSiriEndpointProfileAssistant)initWithIdentifier:(id)a3 name:(id)a4 active:(int64_t)a5
{
  id v8;
  id v9;
  HMSiriEndpointProfileAssistant *v10;
  uint64_t v11;
  NSNumber *identifier;
  uint64_t v13;
  NSString *name;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMSiriEndpointProfileAssistant;
  v10 = -[HMSiriEndpointProfileAssistant init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSNumber *)v11;

    v13 = objc_msgSend(v9, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v13;

    v10->_active = a5;
  }

  return v10;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isSiriAssistant
{
  void *v2;
  char v3;

  -[HMSiriEndpointProfileAssistant identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

- (HMSiriEndpointProfileAssistant)initWithCoder:(id)a3
{
  id v4;
  HMSiriEndpointProfileAssistant *v5;
  uint64_t v6;
  NSNumber *identifier;
  NSNumber *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSUUID *uniqueIdentifier;
  uint64_t v15;
  NSString *name;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMSiriEndpointProfileAssistant init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sepa-identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSNumber *)v6;

    v8 = v5->_identifier;
    if (v8)
    {
      -[NSNumber stringValue](v8, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0CB3A28];
      objc_msgSend((id)objc_opt_class(), "uniqueIdentifierNamespace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v12, 0, v10);
      v13 = objc_claimAutoreleasedReturnValue();
      uniqueIdentifier = v5->_uniqueIdentifier;
      v5->_uniqueIdentifier = (NSUUID *)v13;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sepa-name"));
    v15 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sepa-active"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v19 = objc_msgSend(v17, "integerValue");
    else
      v19 = -1;
    v5->_active = v19;

  }
  return v5;
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
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSiriEndpointProfileAssistant name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HMFEqualObjects();

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v7, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSiriEndpointProfileAssistant setName:](self, "setName:", v11);

    }
    v12 = objc_msgSend(v7, "active");
    if (v12 == -[HMSiriEndpointProfileAssistant active](self, "active"))
    {
      v13 = v10 ^ 1;
    }
    else
    {
      -[HMSiriEndpointProfileAssistant setActive:](self, "setActive:", objc_msgSend(v7, "active"));
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)active
{
  return self->_active;
}

- (void)setActive:(int64_t)a3
{
  self->_active = a3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)uniqueIdentifierNamespace
{
  if (uniqueIdentifierNamespace_onceToken != -1)
    dispatch_once(&uniqueIdentifierNamespace_onceToken, &__block_literal_global_56208);
  return (id)uniqueIdentifierNamespace_namespace;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_56203 != -1)
    dispatch_once(&logCategory__hmf_once_t3_56203, &__block_literal_global_24_56204);
  return (id)logCategory__hmf_once_v4_56205;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __45__HMSiriEndpointProfileAssistant_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_56205;
  logCategory__hmf_once_v4_56205 = v0;

}

void __59__HMSiriEndpointProfileAssistant_uniqueIdentifierNamespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C9A7AF26-1C3D-43A8-894B-E130BF03C2F1"));
  v1 = (void *)uniqueIdentifierNamespace_namespace;
  uniqueIdentifierNamespace_namespace = v0;

}

@end
