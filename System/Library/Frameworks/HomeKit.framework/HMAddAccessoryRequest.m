@implementation HMAddAccessoryRequest

- (HMAddAccessoryRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMAddAccessoryRequest;
  return -[HMAddAccessoryRequest init](&v3, sel_init);
}

- (HMAccessorySetupPayload)payloadWithOwnershipToken:(HMAccessoryOwnershipToken *)ownershipToken
{
  HMAccessoryOwnershipToken *v4;
  void *v5;
  HMAddAccessoryRequest *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = ownershipToken;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2080;
    v13 = "-[HMAddAccessoryRequest payloadWithOwnershipToken:]";
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@%s is not supported", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

  return 0;
}

- (HMAccessorySetupPayload)payloadWithURL:(NSURL *)setupPayloadURL ownershipToken:(HMAccessoryOwnershipToken *)ownershipToken
{
  NSURL *v6;
  HMAccessoryOwnershipToken *v7;
  void *v8;
  HMAddAccessoryRequest *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = setupPayloadURL;
  v7 = ownershipToken;
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
    v15 = 2080;
    v16 = "-[HMAddAccessoryRequest payloadWithURL:ownershipToken:]";
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is not supported", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

  return 0;
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

- (HMAddAccessoryRequest)initWithCoder:(id)a3
{
  id v4;
  HMAddAccessoryRequest *v5;
  uint64_t v6;
  NSString *accessoryName;
  uint64_t v8;
  NSUUID *requestIdentifier;
  uint64_t v10;
  HMAccessoryCategory *accessoryCategory;
  uint64_t v12;
  HMSetupAccessoryDescription *accessoryDescription;
  HMAddAccessoryRequest *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMAddAccessoryRequest;
  v5 = -[HMAddAccessoryRequest init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("HMAAR.accessoryName"));
    v6 = objc_claimAutoreleasedReturnValue();
    accessoryName = v5->_accessoryName;
    v5->_accessoryName = (NSString *)v6;

    objc_msgSend(v4, "hm_decodeAndCacheUUIDForKey:", CFSTR("HMAAR.identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v8;

    objc_msgSend(v4, "hm_decodeHMAccessoryCategoryAndCacheForKey:", CFSTR("HMAAR.category"));
    v10 = objc_claimAutoreleasedReturnValue();
    accessoryCategory = v5->_accessoryCategory;
    v5->_accessoryCategory = (HMAccessoryCategory *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAAR.accessoryDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    accessoryDescription = v5->_accessoryDescription;
    v5->_accessoryDescription = (HMSetupAccessoryDescription *)v12;

    *(_WORD *)&v5->_requiresSetupPayloadURL = 256;
    v14 = v5;
  }

  return v5;
}

- (HMAddAccessoryRequest)initWithIdentifier:(id)a3 accessoryName:(id)a4 accessoryCategory:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMAddAccessoryRequest *v11;
  uint64_t v12;
  NSUUID *requestIdentifier;
  uint64_t v14;
  NSString *accessoryName;
  uint64_t v16;
  HMAccessoryCategory *accessoryCategory;
  HMAddAccessoryRequest *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMAddAccessoryRequest;
  v11 = -[HMAddAccessoryRequest init](&v20, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v11->_requestIdentifier;
    v11->_requestIdentifier = (NSUUID *)v12;

    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    accessoryName = v11->_accessoryName;
    v11->_accessoryName = (NSString *)v14;

    +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:](HMFObjectCacheHMAccessoryCategory, "cachedInstanceForHMAccessoryCategory:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    accessoryCategory = v11->_accessoryCategory;
    v11->_accessoryCategory = (HMAccessoryCategory *)v16;

    v18 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HMAddAccessoryRequest *v4;
  HMAddAccessoryRequest *v5;
  HMAddAccessoryRequest *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMAddAccessoryRequest *)a3;
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
    if (v6)
    {
      -[HMAddAccessoryRequest requestIdentifier](self, "requestIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAddAccessoryRequest requestIdentifier](v6, "requestIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMAddAccessoryRequest requestIdentifier](self, "requestIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAddAccessoryRequest requestIdentifier](self, "requestIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("ID"), v20);
  v21[0] = v19;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAddAccessoryRequest home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Home Name"), v6);
  v21[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAddAccessoryRequest accessoryName](self, "accessoryName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Accessory Name"), v9);
  v21[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAddAccessoryRequest accessoryCategory](self, "accessoryCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Accessory Category"), v12);
  v21[3] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAddAccessoryRequest requiresSetupPayloadURL](self, "requiresSetupPayloadURL");
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Requires Setup Payload URL"), v15);
  v21[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v17;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (HMAccessoryCategory)accessoryCategory
{
  return self->_accessoryCategory;
}

- (BOOL)requiresSetupPayloadURL
{
  return self->_requiresSetupPayloadURL;
}

- (BOOL)requiresOwnershipToken
{
  return self->_requiresOwnershipToken;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (HMSetupAccessoryDescription)accessoryDescription
{
  return self->_accessoryDescription;
}

- (void)setAccessoryDescription:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryDescription, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
