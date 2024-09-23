@implementation DeviceDisplaySignal

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_1C0909308();
  swift_release();
  v2 = (void *)sub_1C1070210();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  id v3;

  sub_1C106FB14();
  swift_retain();
  v3 = sub_1C090A17C();
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

@end
