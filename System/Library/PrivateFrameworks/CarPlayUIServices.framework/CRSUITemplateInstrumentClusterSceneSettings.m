@implementation CRSUITemplateInstrumentClusterSceneSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:](+[CRSUIMutableTemplateInstrumentClusterSceneSettings allocWithZone:](CRSUIMutableTemplateInstrumentClusterSceneSettings, "allocWithZone:", a3), "initWithSettings:", self);
}

- (NSString)proxiedApplicationBundleIdentifier
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4293273413);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (OS_xpc_object)templateEndpoint
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4293273414);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)CRSUITemplateInstrumentClusterSceneSettings;
  -[CRSUIInstrumentClusterSceneSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUITemplateInstrumentClusterSceneSettings proxiedApplicationBundleIdentifier](self, "proxiedApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: proxied bundle identifier: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

@end
