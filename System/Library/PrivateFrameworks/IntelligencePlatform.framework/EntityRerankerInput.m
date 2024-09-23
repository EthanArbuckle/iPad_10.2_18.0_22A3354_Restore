@implementation EntityRerankerInput

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_1AE5D9580();
  swift_release();
  v2 = (void *)sub_1AE9263DC();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = sub_1AE925E3C();
  v5 = v4;
  swift_retain();
  sub_1AE5D958C(v3, v5);
  v7 = v6;
  swift_release();
  swift_bridgeObjectRelease();
  return v7;
}

@end
