@implementation ApplicationActiveStateSource

- (_TtC8SOSBuddy28ApplicationActiveStateSource)init
{
  return (_TtC8SOSBuddy28ApplicationActiveStateSource *)sub_1001FC344();
}

- (void)dealloc
{
  _TtC8SOSBuddy28ApplicationActiveStateSource *v2;

  v2 = self;
  sub_1001FC5AC();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8SOSBuddy28ApplicationActiveStateSource_appForegroundDidChange));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8SOSBuddy28ApplicationActiveStateSource_observers));
}

@end
