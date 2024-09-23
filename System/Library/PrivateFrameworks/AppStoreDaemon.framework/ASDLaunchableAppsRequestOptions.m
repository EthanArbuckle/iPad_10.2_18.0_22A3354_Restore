@implementation ASDLaunchableAppsRequestOptions

- (ASDLaunchableAppsRequestOptions)initWithBundleIDs:(id)a3
{
  id v4;
  ASDLaunchableAppsRequestOptions *v5;
  uint64_t v6;
  NSArray *bundleIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDLaunchableAppsRequestOptions;
  v5 = -[ASDLaunchableAppsRequestOptions init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASDLaunchableAppsRequestOptions initWithBundleIDs:](+[ASDLaunchableAppsRequestOptions allocWithZone:](ASDLaunchableAppsRequestOptions, "allocWithZone:", a3), "initWithBundleIDs:", self->_bundleIDs);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleIDs, CFSTR("bundleIDs"));
}

- (ASDLaunchableAppsRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDLaunchableAppsRequestOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *bundleIDs;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDLaunchableAppsRequestOptions;
  v5 = -[ASDLaunchableAppsRequestOptions init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("bundleIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v9;

  }
  return v5;
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
