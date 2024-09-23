@implementation CRSUIProxyApplicationSceneSettings

- (NSString)proxiedApplicationBundleIdentifier
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1885817706);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)mapStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3152422721);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (id)frameRateLimit
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3152422722);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:](+[CRSUIMutableProxyApplicationSceneSettings allocWithZone:](CRSUIMutableProxyApplicationSceneSettings, "allocWithZone:", a3), "initWithSettings:", self);
}

@end
