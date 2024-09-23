@implementation TimeZoneSource

- (_TtC8SOSBuddy14TimeZoneSource)init
{
  return (_TtC8SOSBuddy14TimeZoneSource *)sub_100014C88();
}

- (void)dealloc
{
  _TtC8SOSBuddy14TimeZoneSource *v2;

  v2 = self;
  sub_100014EF0();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy14TimeZoneSource_timeZoneDidChange));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy14TimeZoneSource__observers));
}

@end
