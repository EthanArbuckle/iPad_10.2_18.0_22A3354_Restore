@implementation DataFrameRowFeatureProvider

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_22AA5BB88();
  swift_release();
  v2 = (void *)sub_22ABDF260();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  void *v3;

  sub_22ABDED50();
  swift_retain();
  v3 = (void *)sub_22AA5BC50();
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

@end
