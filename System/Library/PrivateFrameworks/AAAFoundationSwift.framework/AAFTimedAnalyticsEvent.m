@implementation AAFTimedAnalyticsEvent

- (_TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent)init
{
  _TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent *result;

  result = (_TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_startTime;
  v4 = sub_1B408FCFC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1B40670F4((uint64_t)self + OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_endTime);
}

@end
