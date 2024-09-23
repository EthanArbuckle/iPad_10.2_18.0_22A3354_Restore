@implementation CRSUIApplicationSceneSettings

- (double)bannerHeight
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3152422720);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (NSNumber)frameRateLimit
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3152422722);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
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

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:](+[CRSUIMutableApplicationSceneSettings allocWithZone:](CRSUIMutableApplicationSceneSettings, "allocWithZone:", a3), "initWithSettings:", self);
}

@end
