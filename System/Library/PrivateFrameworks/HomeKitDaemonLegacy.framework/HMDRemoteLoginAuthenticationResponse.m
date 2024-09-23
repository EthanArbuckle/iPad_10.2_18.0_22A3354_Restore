@implementation HMDRemoteLoginAuthenticationResponse

- (NSString)messageName
{
  return (NSString *)CFSTR("kHMDRemoteLoginAuthenticationResponse");
}

- (NSString)xpcMessageName
{
  return (NSString *)CFSTR("xpckHMDRemoteLoginAuthenticationResponse");
}

- (NSDictionary)messagePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  encodeRootObject();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginAuthenticationResponse messageName](self, "messageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteLoginAuthenticationResponse;
  -[HMRemoteLoginMessage description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HMDRemoteLoginAuthenticationResponse: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteLoginAuthenticationResponse;
  v4 = a3;
  -[HMRemoteLoginMessage encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginAuthenticationResponse loggedInAccount](self, "loggedInAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportableAuthKitAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("account"));
}

- (HMDRemoteLoginAuthenticationResponse)initWithCoder:(id)a3
{
  id v4;
  HMDRemoteLoginAuthenticationResponse *v5;
  uint64_t v6;
  ACAccount *loggedInAccount;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteLoginAuthenticationResponse;
  v5 = -[HMRemoteLoginMessage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v6 = objc_claimAutoreleasedReturnValue();
    loggedInAccount = v5->_loggedInAccount;
    v5->_loggedInAccount = (ACAccount *)v6;

  }
  return v5;
}

- (ACAccount)loggedInAccount
{
  return self->_loggedInAccount;
}

- (void)setLoggedInAccount:(id)a3
{
  objc_storeStrong((id *)&self->_loggedInAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggedInAccount, 0);
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
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("kHMDRemoteLoginAuthenticationResponse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (!v6)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with dictionary from archive data: %@", buf, 0x16u);

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
  objc_msgSend(v5, "hmf_dataForKey:", CFSTR("kHMDRemoteLoginAuthenticationResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with message from archive data: %@", buf, 0x16u);

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
  return (NSString *)CFSTR("kHMDRemoteLoginAuthenticationResponse");
}

+ (NSString)xpcMessageName
{
  return (NSString *)CFSTR("xpckHMDRemoteLoginAuthenticationResponse");
}

@end
