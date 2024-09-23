@implementation CBClient

- (CBAdaptationClient)adaptationClient
{
  return self->_adaptationClient;
}

+ (BOOL)supportsBlueLightReduction
{
  return +[CBBlueLightClient supportsBlueLightReduction](CBBlueLightClient, "supportsBlueLightReduction", a2, a1);
}

+ (BOOL)supportsAdaptation
{
  return +[CBAdaptationClient supportsAdaptation](CBAdaptationClient, "supportsAdaptation", a2, a1);
}

- (CBClient)init
{
  BrightnessSystemClient *v2;
  CBBlueLightClient *v3;
  uint64_t v4;
  CBAdaptationClient *v5;
  uint64_t v6;
  objc_super v8;
  SEL v9;
  CBClient *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)CBClient;
  v10 = -[CBClient init](&v8, sel_init);
  if (!v10)
    return v10;
  v2 = objc_alloc_init(BrightnessSystemClient);
  v10->bsc = v2;
  if (v10->bsc)
  {
    v3 = [CBBlueLightClient alloc];
    v4 = -[CBBlueLightClient initWithClientObj:](v3, "initWithClientObj:", v10->bsc);
    v10->_blueLightClient = (CBBlueLightClient *)v4;
    v5 = [CBAdaptationClient alloc];
    v6 = -[CBAdaptationClient initWithClientObj:](v5, "initWithClientObj:", v10->bsc);
    v10->_adaptationClient = (CBAdaptationClient *)v6;
    return v10;
  }
  return 0;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBClient *v4;

  v4 = self;
  v3 = a2;
  if (self->_blueLightClient)

  if (v4->_adaptationClient)
  if (v4->bsc)
  {
    -[BrightnessSystemClient registerNotificationBlock:forProperties:](v4->bsc, "registerNotificationBlock:forProperties:", 0);

  }
  v2.receiver = v4;
  v2.super_class = (Class)CBClient;
  -[CBClient dealloc](&v2, sel_dealloc);
}

- (CBBlueLightClient)blueLightClient
{
  return self->_blueLightClient;
}

@end
