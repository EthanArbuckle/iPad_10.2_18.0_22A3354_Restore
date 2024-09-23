@implementation VSSetTopBoxProfile

- (VSSetTopBoxProfile)initWithProviderID:(id)a3 userToken:(id)a4 activationTime:(id)a5 isDeveloper:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  VSSetTopBoxProfile *v14;
  VSSetTopBoxProfile *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VSSetTopBoxProfile;
  v14 = -[VSSetTopBoxProfile init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_providerID, a3);
    objc_storeStrong((id *)&v15->_userToken, a4);
    objc_storeStrong((id *)&v15->_activationTime, a5);
    v15->_isDeveloper = a6;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[VSSetTopBoxProfile providerID](self, "providerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSetTopBoxProfile userToken](self, "userToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSetTopBoxProfile activationTime](self, "activationTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<VSSetTopBoxProfile %p; providerID=%@, userToken=%@, activationTime=%@ isDeveloper=%lu>"),
    self,
    v4,
    v5,
    v6,
    -[VSSetTopBoxProfile isDeveloper](self, "isDeveloper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSSetTopBoxProfile *v4;
  void *v5;
  uint64_t v6;
  NSString *providerID;
  void *v8;
  uint64_t v9;
  NSString *userToken;
  void *v11;
  uint64_t v12;
  NSDate *activationTime;

  v4 = objc_alloc_init(VSSetTopBoxProfile);
  -[VSSetTopBoxProfile providerID](self, "providerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  providerID = v4->_providerID;
  v4->_providerID = (NSString *)v6;

  -[VSSetTopBoxProfile userToken](self, "userToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  userToken = v4->_userToken;
  v4->_userToken = (NSString *)v9;

  -[VSSetTopBoxProfile activationTime](self, "activationTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  activationTime = v4->_activationTime;
  v4->_activationTime = (NSDate *)v12;

  v4->_isDeveloper = -[VSSetTopBoxProfile isDeveloper](self, "isDeveloper");
  return v4;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (void)setProviderID:(id)a3
{
  objc_storeStrong((id *)&self->_providerID, a3);
}

- (NSString)userToken
{
  return self->_userToken;
}

- (void)setUserToken:(id)a3
{
  objc_storeStrong((id *)&self->_userToken, a3);
}

- (NSDate)activationTime
{
  return self->_activationTime;
}

- (void)setActivationTime:(id)a3
{
  objc_storeStrong((id *)&self->_activationTime, a3);
}

- (BOOL)isDeveloper
{
  return self->_isDeveloper;
}

- (void)setIsDeveloper:(BOOL)a3
{
  self->_isDeveloper = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationTime, 0);
  objc_storeStrong((id *)&self->_userToken, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
}

@end
