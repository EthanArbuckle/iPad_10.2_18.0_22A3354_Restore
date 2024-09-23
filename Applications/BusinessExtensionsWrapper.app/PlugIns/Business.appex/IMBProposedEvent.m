@implementation IMBProposedEvent

- (NSDictionary)dictionaryValue
{
  uint64_t v3;
  Class isa;

  swift_retain(self);
  v3 = sub_100012B64();
  swift_release(self);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

@end
