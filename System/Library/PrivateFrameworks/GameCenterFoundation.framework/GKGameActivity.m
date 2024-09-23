@implementation GKGameActivity

- (GKGameActivity)initWithInternalRepresentation:(id)a3
{
  id v5;
  GKGameActivity *v6;
  GKGameActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKGameActivity;
  v6 = -[GKGameActivity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internal, a3);

  return v7;
}

- (NSString)activityType
{
  void *v2;
  void *v3;

  -[GKGameActivity internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)userInfo
{
  void *v2;
  void *v3;

  -[GKGameActivity internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)activityID
{
  void *v2;
  void *v3;

  -[GKGameActivity internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleID
{
  void *v2;
  void *v3;

  -[GKGameActivity internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)createdAt
{
  void *v2;
  void *v3;

  -[GKGameActivity internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createdAt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[GKGameActivity internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GKGameActivityInternal)internal
{
  return (GKGameActivityInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
