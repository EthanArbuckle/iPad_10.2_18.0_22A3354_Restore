@implementation FTPreferences

- (NSString)domain
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_1001A403C();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setDomain:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC13InCallService13FTPreferences *v6;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = self;
  sub_100169CE8((uint64_t)v6, v5);

}

- (_TtC13InCallService13FTPreferences)init
{
  return (_TtC13InCallService13FTPreferences *)sub_1001A409C();
}

@end
