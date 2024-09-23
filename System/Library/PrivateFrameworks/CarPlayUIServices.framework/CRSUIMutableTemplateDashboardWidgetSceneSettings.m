@implementation CRSUIMutableTemplateDashboardWidgetSceneSettings

- (NSString)proxiedApplicationBundleIdentifier
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2883987267);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setProxiedApplicationBundleIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 2883987267);

}

- (OS_xpc_object)templateEndpoint
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2883987266);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v3;
}

- (void)setTemplateEndpoint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 2883987266);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:](+[CRSUITemplateDashboardWidgetSceneSettings allocWithZone:](CRSUITemplateDashboardWidgetSceneSettings, "allocWithZone:", a3), "initWithSettings:", self);
}

@end
