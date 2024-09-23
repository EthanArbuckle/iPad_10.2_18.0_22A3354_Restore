@implementation IMBLineItem

- (NSDictionary)dictionaryValue
{
  void *v3;
  Class isa;

  swift_retain(self);
  v3 = sub_10007C4BC();
  swift_release(self);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

@end
