@implementation ActivityPushTokenClient

- (void)pushTokensChanged:(id)a3
{
  uint64_t v4;
  _TtC11ActivityKit23ActivityPushTokenClient *v5;

  v4 = sub_232E6F168();
  v5 = self;
  sub_232DE6A54(v4);

  swift_bridgeObjectRelease();
}

- (_TtC11ActivityKit23ActivityPushTokenClient)init
{
  return (_TtC11ActivityKit23ActivityPushTokenClient *)sub_232DE5E70();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end
