@implementation GKEntitledContextProvider

+ (BOOL)hasAnyGameCenterEntitlement
{
  return static EntitledContextProvider.hasAnyGameCenterEntitlement()() & 1;
}

+ (id)getCurrentDeviceName
{
  uint64_t v2;
  void *v3;

  static EntitledContextProvider.getCurrentDeviceName()();
  if (v2)
  {
    v3 = (void *)sub_1BCF15604();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (BOOL)hasBooleanPublicGameCenterEntitlement
{
  return static EntitledContextProvider.hasBooleanPublicGameCenterEntitlement()(a1, a2) & 1;
}

+ (BOOL)hasPublicGroupActivitiesEntitlement
{
  return static EntitledContextProvider.hasPublicGroupActivitiesEntitlement()(a1, a2) & 1;
}

- (GKEntitledContextProvider)init
{
  return (GKEntitledContextProvider *)sub_1BCEE8E20();
}

@end
