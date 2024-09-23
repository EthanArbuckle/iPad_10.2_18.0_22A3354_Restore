@implementation QuickReplyResponse

- (NSDictionary)dictionaryValue
{
  _QWORD *v3;
  Class isa;

  swift_retain(self);
  v3 = sub_1000849A8();
  swift_release(self);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

@end
