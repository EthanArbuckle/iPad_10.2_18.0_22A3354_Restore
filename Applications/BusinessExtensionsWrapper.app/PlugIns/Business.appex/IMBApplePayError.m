@implementation IMBApplePayError

- (NSDictionary)dictionaryValue
{
  uint64_t v3;
  uint64_t v4;
  Class isa;

  swift_retain(self);
  sub_100022724();
  v4 = v3;
  swift_release(self);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSDictionary *)isa;
}

@end
