@implementation CSFGMFeatureFlags

+ (BOOL)anyFeatureEnabled
{
  return sub_1A5B75BE4() & 1;
}

- (_TtC25CloudSubscriptionFeatures17CSFGMFeatureFlags)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CSFGMFeatureFlags();
  return -[CSFGMFeatureFlags init](&v3, sel_init);
}

@end
