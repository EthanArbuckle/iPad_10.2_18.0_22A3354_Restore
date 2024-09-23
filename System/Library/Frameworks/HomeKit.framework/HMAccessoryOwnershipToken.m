@implementation HMAccessoryOwnershipToken

- (HMAccessoryOwnershipToken)initWithData:(NSData *)data
{
  NSData *v4;
  HMAccessoryOwnershipToken *v5;
  uint64_t v6;
  NSData *internalData;
  objc_super v9;

  v4 = data;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessoryOwnershipToken;
  v5 = -[HMAccessoryOwnershipToken init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NSData copy](v4, "copy");
    internalData = v5->_internalData;
    v5->_internalData = (NSData *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryOwnershipToken *v4;
  HMAccessoryOwnershipToken *v5;
  HMAccessoryOwnershipToken *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMAccessoryOwnershipToken *)a3;
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
      -[HMAccessoryOwnershipToken internalData](self, "internalData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryOwnershipToken internalData](v6, "internalData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToData:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMAccessoryOwnershipToken internalData](self, "internalData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMAOT.internalData"));

}

- (HMAccessoryOwnershipToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMAccessoryOwnershipToken *v6;
  HMAccessoryOwnershipToken *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAOT.internalData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HMAccessoryOwnershipToken initWithData:](self, "initWithData:", v5);
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = 0;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize from internalData: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (NSData)internalData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
