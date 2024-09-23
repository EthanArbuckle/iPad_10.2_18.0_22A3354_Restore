@implementation ASDLaunchableAppsResponse

- (ASDLaunchableAppsResponse)init
{
  void *v3;
  ASDLaunchableAppsResponse *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ASDLaunchableAppsResponse initWithBundleIDs:](self, "initWithBundleIDs:", v3);

  return v4;
}

- (ASDLaunchableAppsResponse)initWithBundleIDs:(id)a3
{
  id v4;
  ASDLaunchableAppsResponse *v5;
  uint64_t v6;
  NSArray *bundleIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDLaunchableAppsResponse;
  v5 = -[ASDLaunchableAppsResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 1);
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDLaunchableAppsResponse *v4;

  v4 = -[ASDLaunchableAppsResponse initWithBundleIDs:](+[ASDLaunchableAppsResponse allocWithZone:](ASDLaunchableAppsResponse, "allocWithZone:", a3), "initWithBundleIDs:", self->_bundleIDs);
  -[ASDRequestResponse setSuccess:](v4, "setSuccess:", -[ASDRequestResponse success](self, "success"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDLaunchableAppsResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ASDLaunchableAppsResponse *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("bundleIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ASDLaunchableAppsResponse initWithBundleIDs:](self, "initWithBundleIDs:", v8);
  if (v9)
    -[ASDRequestResponse setSuccess:](v9, "setSuccess:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success")));

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *bundleIDs;
  id v5;

  bundleIDs = self->_bundleIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIDs, CFSTR("bundleIDs"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ASDRequestResponse success](self, "success"), CFSTR("success"));

}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end
