@implementation IMBListResponse

- (NSDictionary)dictionaryValue
{
  uint64_t v3;
  void *v4;
  Class isa;

  swift_retain(self);
  v3 = sub_1000624C4();
  v4 = sub_100087D54();
  swift_release(self);
  swift_release(v3);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSDictionary *)isa;
}

@end
