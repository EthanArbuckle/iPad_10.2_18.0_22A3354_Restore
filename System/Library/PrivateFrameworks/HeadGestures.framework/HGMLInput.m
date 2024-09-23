@implementation HGMLInput

- (id)featureValueForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = sub_23DA9BAC4();
  v5 = v4;
  swift_retain();
  v6 = sub_23DA72F1C(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

- (NSSet)featureNames
{
  void *v2;

  sub_23DA7329C();
  v2 = (void *)sub_23DA9BC2C();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

@end
