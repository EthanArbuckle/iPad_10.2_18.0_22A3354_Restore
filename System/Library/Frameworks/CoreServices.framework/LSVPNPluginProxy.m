@implementation LSVPNPluginProxy

- (id)_initWithBundleIdentifier:(id)a3 withContext:(LSContext *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v6 = a3;
  v7 = _LSFindBundleWithInfo(a4, 5uLL, v6, 0, 0, 0, 0);
  v10.receiver = self;
  v10.super_class = (Class)LSVPNPluginProxy;
  v8 = -[LSBundleProxy _initWithBundleUnit:context:bundleType:bundleID:localizedName:bundleContainerURL:dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:](&v10, sel__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version_, v7, a4, 5, v6, 0, 0, 0, 0, 0, 0, 0);

  return v8;
}

+ (id)VPNPluginProxyForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v7;

  v4 = a3;
  v7 = 0;
  if (_LSContextInit(&v7))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "VPNPluginProxyForIdentifier:withContext:", v4, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LSContextDestroy(&v7);
  }

  return v5;
}

+ (id)VPNPluginProxyForIdentifier:(id)a3 withContext:(LSContext *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithBundleIdentifier:withContext:", v6, a4);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSVPNPluginProxy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LSVPNPluginProxy;
  return -[LSBundleProxy initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LSVPNPluginProxy;
  -[LSBundleProxy encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

@end
