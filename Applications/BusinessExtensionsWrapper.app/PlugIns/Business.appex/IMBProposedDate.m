@implementation IMBProposedDate

- (NSDictionary)dictionaryValue
{
  void *v3;
  Class isa;

  swift_retain(self);
  v3 = sub_10001A85C();
  swift_release(self);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

@end
