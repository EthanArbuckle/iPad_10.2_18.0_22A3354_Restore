@implementation locationEncoderOutput

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_1AE8DEE54();
  swift_release();
  v2 = (void *)sub_1AE9263DC();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1AE8DE88C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1AE8DEEA8);
}

@end
