@implementation CPUITemplateApplicationSceneSettings

- (OS_xpc_object)endpoint
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1893182282);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v3;
}

- (int64_t)mapStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1893182283);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (NSNumber)frameRateLimit
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1893182284);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:](+[CPUIMutableTemplateApplicationSceneSettings allocWithZone:](CPUIMutableTemplateApplicationSceneSettings, "allocWithZone:", a3), "initWithSettings:", self);
}

@end
