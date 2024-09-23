@implementation IMBContent

- (NSDictionary)dictionaryValue
{
  void *v3;
  Class isa;

  swift_retain(self);
  v3 = sub_100050A84();
  swift_release(self);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

@end
