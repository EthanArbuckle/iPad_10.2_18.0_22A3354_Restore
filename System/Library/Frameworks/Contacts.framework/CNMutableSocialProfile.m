@implementation CNMutableSocialProfile

- (id)copyWithZone:(_NSZone *)a3
{
  CNSocialProfile *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNSocialProfile *v12;

  v4 = [CNSocialProfile alloc];
  -[CNSocialProfile urlString](self, "urlString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile username](self, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile userIdentifier](self, "userIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile displayname](self, "displayname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile teamIdentifier](self, "teamIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile bundleIdentifiers](self, "bundleIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNSocialProfile initWithUrlString:username:userIdentifier:service:displayname:teamIdentifier:bundleIdentifiers:](v4, "initWithUrlString:username:userIdentifier:service:displayname:teamIdentifier:bundleIdentifiers:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

- (id)freeze
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

@end
