@implementation HMUserCloudShareClientInfo

- (HMUserCloudShareClientInfo)initWithAccountAuthToken:(id)a3
{
  id v5;
  HMUserCloudShareClientInfo *v6;
  HMUserCloudShareClientInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMUserCloudShareClientInfo;
  v6 = -[HMUserCloudShareClientInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountAuthToken, a3);

  return v7;
}

- (HMUserCloudShareClientInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMUserCloudShareClientInfo *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMUserCloudShareClientInfo initWithAccountAuthToken:](self, "initWithAccountAuthToken:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMUserCloudShareClientInfo accountAuthToken](self, "accountAuthToken");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("authToken"));

}

- (NSData)accountAuthToken
{
  return self->_accountAuthToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAuthToken, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
