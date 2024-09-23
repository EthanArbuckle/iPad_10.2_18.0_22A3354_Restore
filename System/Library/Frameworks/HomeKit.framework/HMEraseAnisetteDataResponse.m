@implementation HMEraseAnisetteDataResponse

- (NSString)messageName
{
  return (NSString *)CFSTR("kHMEraseAnisetteDataResponse");
}

- (NSString)xpcMessageName
{
  return (NSString *)CFSTR("xpckHMEraseAnisetteDataResponse");
}

- (NSDictionary)messagePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  encodeRootObject(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEraseAnisetteDataResponse messageName](self, "messageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMEraseAnisetteDataResponse;
  -[HMRemoteLoginMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEraseAnisetteDataResponse didSucceed](self, "didSucceed");
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMEraseAnisetteDataResponse: %@, did-succeed %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMEraseAnisetteDataResponse;
  v4 = a3;
  -[HMRemoteLoginMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[HMEraseAnisetteDataResponse didSucceed](self, "didSucceed", v5.receiver, v5.super_class), CFSTR("TRAnisetteDataMessages_dS"));

}

- (HMEraseAnisetteDataResponse)initWithCoder:(id)a3
{
  id v4;
  HMEraseAnisetteDataResponse *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMEraseAnisetteDataResponse;
  v5 = -[HMRemoteLoginMessage initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_didSucceed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TRAnisetteDataMessages_dS"));

  return v5;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

+ (id)objWithDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("kHMEraseAnisetteDataResponse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (!v6)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with dictionary from archive data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

  return v6;
}

+ (id)objWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_dataForKey:", CFSTR("kHMEraseAnisetteDataResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with message from archive data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)messageName
{
  return (NSString *)CFSTR("kHMEraseAnisetteDataResponse");
}

+ (NSString)xpcMessageName
{
  return (NSString *)CFSTR("xpckHMEraseAnisetteDataResponse");
}

@end
