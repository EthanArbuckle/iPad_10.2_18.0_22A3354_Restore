@implementation QueryLogEvent

- (double)startTime
{
  double result;
  objc_super v3;

  if ((*((_BYTE *)&self->super._lock._os_unfair_lock_opaque
        + OBJC_IVAR____TtC13HomeKitEvents13QueryLogEvent_queryStartTime) & 1) == 0)
    return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13HomeKitEvents13QueryLogEvent_queryStartTime);
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QueryLogEvent();
  -[HMMLogEvent startTime](&v3, sel_startTime);
  return result;
}

- (NSString)coreAnalyticsEventName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_23E945B0C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  _TtC13HomeKitEvents13QueryLogEvent *v2;
  void *v3;

  v2 = self;
  sub_23E93BFA8();

  sub_23E93D6C0();
  v3 = (void *)sub_23E945AB8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (_TtC13HomeKitEvents13QueryLogEvent)init
{
  _TtC13HomeKitEvents13QueryLogEvent *result;

  result = (_TtC13HomeKitEvents13QueryLogEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HomeKitEvents13QueryLogEvent)initWithStartTime:(double)a3
{
  _TtC13HomeKitEvents13QueryLogEvent *result;

  result = (_TtC13HomeKitEvents13QueryLogEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC13HomeKitEvents13QueryLogEvent_queryStartDate;
  v4 = sub_23E9459A4();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC13HomeKitEvents13QueryLogEvent_queryEndDate, v4);
  swift_bridgeObjectRelease();
}

@end
