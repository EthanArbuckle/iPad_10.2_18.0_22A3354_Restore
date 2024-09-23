@implementation CNMutableInstantMessageAddress

- (id)copyWithZone:(_NSZone *)a3
{
  CNInstantMessageAddress *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNInstantMessageAddress *v10;

  v4 = [CNInstantMessageAddress alloc];
  -[CNInstantMessageAddress username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNInstantMessageAddress userIdentifier](self, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNInstantMessageAddress service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNInstantMessageAddress teamIdentifier](self, "teamIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNInstantMessageAddress bundleIdentifiers](self, "bundleIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNInstantMessageAddress initWithUsername:userIdentifier:service:teamIdentifier:bundleIdentifiers:](v4, "initWithUsername:userIdentifier:service:teamIdentifier:bundleIdentifiers:", v5, v6, v7, v8, v9);

  return v10;
}

- (id)freeze
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

@end
