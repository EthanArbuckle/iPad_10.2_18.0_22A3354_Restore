@implementation EntityRelevanceModelOutput

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_1C1062794();
  swift_release();
  v2 = (void *)sub_1C1070210();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1C1062840((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C10627E8);
}

@end
