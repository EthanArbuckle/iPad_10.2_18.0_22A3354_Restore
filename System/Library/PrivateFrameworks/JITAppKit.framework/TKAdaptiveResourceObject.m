@implementation TKAdaptiveResourceObject

- (TKAdaptiveResourceObject)init
{
  TKAdaptiveResourceObject *v3;
  objc_super v4;
  SEL v5;
  TKAdaptiveResourceObject *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)TKAdaptiveResourceObject;
  v6 = -[TKAdaptiveResourceObject init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    +[TKAdaptiveResourceManager addObject:](TKAdaptiveResourceManager, "addObject:", v6);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  TKAdaptiveResourceObject *v4;

  v4 = self;
  v3 = a2;
  +[TKAdaptiveResourceManager removeObject:](TKAdaptiveResourceManager, "removeObject:", self);
  v2.receiver = v4;
  v2.super_class = (Class)TKAdaptiveResourceObject;
  -[TKAdaptiveResourceObject dealloc](&v2, sel_dealloc);
}

- (void)tmlDispose
{
  objc_super v2;
  SEL v3;
  TKAdaptiveResourceObject *v4;

  v4 = self;
  v3 = a2;
  +[TKAdaptiveResourceManager removeObject:](TKAdaptiveResourceManager, "removeObject:", self);
  v2.receiver = v4;
  v2.super_class = (Class)TKAdaptiveResourceObject;
  -[TKAdaptiveResourceObject tmlDispose](&v2, sel_tmlDispose);
}

@end
