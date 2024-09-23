@implementation HMDRemoteLoginProxyAuthenticationRequest

- (NSString)messageName
{
  return (NSString *)CFSTR("kHMDRemoteLoginProxyAuthenticationRequest");
}

- (NSString)xpcMessageName
{
  return (NSString *)CFSTR("xpckHMDRemoteLoginProxyAuthenticationRequest");
}

- (NSDictionary)messagePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  encodeRootObject();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest messageName](self, "messageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)HMDRemoteLoginProxyAuthenticationRequest;
  -[HMDRemoteLoginAuthenticationRequest description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest rawPassword](self, "rawPassword");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "length");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest passwordToken](self, "passwordToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest altDSID](self, "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HMDRemoteLoginProxyAuthenticationRequest: %@, Username: %@, Password Present: %@, Token: %@, altDSID: %@"), v4, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteLoginProxyAuthenticationRequest;
  v4 = a3;
  -[HMDRemoteLoginAuthenticationRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[HMDRemoteLoginProxyAuthenticationRequest username](self, "username", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("username"));

  -[HMDRemoteLoginProxyAuthenticationRequest passwordToken](self, "passwordToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("passwordToken"));

  -[HMDRemoteLoginProxyAuthenticationRequest altDSID](self, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("altDSID"));

  -[HMDRemoteLoginProxyAuthenticationRequest rawPassword](self, "rawPassword");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("rawPassword"));

}

- (HMDRemoteLoginProxyAuthenticationRequest)initWithCoder:(id)a3
{
  id v4;
  HMDRemoteLoginProxyAuthenticationRequest *v5;
  uint64_t v6;
  NSString *username;
  uint64_t v8;
  NSString *passwordToken;
  uint64_t v10;
  NSString *altDSID;
  uint64_t v12;
  NSString *rawPassword;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDRemoteLoginProxyAuthenticationRequest;
  v5 = -[HMDRemoteLoginAuthenticationRequest initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("username"));
    v6 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passwordToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    passwordToken = v5->_passwordToken;
    v5->_passwordToken = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawPassword"));
    v12 = objc_claimAutoreleasedReturnValue();
    rawPassword = v5->_rawPassword;
    v5->_rawPassword = (NSString *)v12;

  }
  return v5;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
  objc_storeStrong((id *)&self->_rawPassword, a3);
}

- (NSString)passwordToken
{
  return self->_passwordToken;
}

- (void)setPasswordToken:(id)a3
{
  objc_storeStrong((id *)&self->_passwordToken, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_passwordToken, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_username, 0);
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

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("kHMDRemoteLoginProxyAuthenticationRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (!v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with dictionary from archive data: %@", buf, 0x16u);

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

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_dataForKey:", CFSTR("kHMDRemoteLoginProxyAuthenticationRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with message from archive data: %@", buf, 0x16u);

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
  return (NSString *)CFSTR("kHMDRemoteLoginProxyAuthenticationRequest");
}

+ (NSString)xpcMessageName
{
  return (NSString *)CFSTR("xpckHMDRemoteLoginProxyAuthenticationRequest");
}

@end
