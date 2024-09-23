@implementation MentionGenerationInput

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_1AE823828();
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
  id v6;

  v3 = sub_1AE925E3C();
  v5 = v4;
  swift_retain();
  v6 = sub_1AE823834(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end
