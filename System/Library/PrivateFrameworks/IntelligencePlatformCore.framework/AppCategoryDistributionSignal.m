@implementation AppCategoryDistributionSignal

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_1C07F1770();
  swift_release();
  v2 = (void *)sub_1C1070210();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  void *v3;
  void *v4;

  sub_1C106FB14();
  swift_retain();
  sub_1C07F260C();
  v4 = v3;
  swift_release();
  swift_bridgeObjectRelease();
  return v4;
}

@end
