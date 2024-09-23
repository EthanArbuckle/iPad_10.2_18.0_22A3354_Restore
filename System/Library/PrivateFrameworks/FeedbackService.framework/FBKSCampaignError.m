@implementation FBKSCampaignError

- (FBKSCampaignError)initWithSwiftObject:(id)a3
{
  id v5;
  FBKSCampaignError *v6;
  FBKSCampaignError *v7;
  FBKSCampaignError *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)FBKSCampaignError;
    v6 = -[FBKSCampaignError init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_swiftObject, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSDate)date
{
  void *v2;
  void *v3;

  -[FBKSCampaignError swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (int64_t)code
{
  void *v2;
  int64_t v3;

  -[FBKSCampaignError swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "code");

  return v3;
}

- (NSString)domain
{
  void *v2;
  void *v3;

  -[FBKSCampaignError swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)errorDescription
{
  void *v2;
  void *v3;

  -[FBKSCampaignError swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[FBKSCampaignError swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FBKSCampaignError_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
  objc_storeStrong((id *)&self->_swiftObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftObject, 0);
}

@end
