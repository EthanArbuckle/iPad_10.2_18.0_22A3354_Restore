@implementation PlanResolutionModelInput

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_23F614BF4();
  swift_release();
  v2 = (void *)sub_23F61C52C();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_23F615288((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_23F614C00);
}

@end
