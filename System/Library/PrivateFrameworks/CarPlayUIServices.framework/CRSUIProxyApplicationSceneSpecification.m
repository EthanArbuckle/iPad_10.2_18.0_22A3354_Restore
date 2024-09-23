@implementation CRSUIProxyApplicationSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (id)initialActionHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", v4);

  v8.receiver = self;
  v8.super_class = (Class)CRSUIProxyApplicationSceneSpecification;
  -[UIApplicationSceneSpecification initialActionHandlers](&v8, sel_initialActionHandlers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

@end
