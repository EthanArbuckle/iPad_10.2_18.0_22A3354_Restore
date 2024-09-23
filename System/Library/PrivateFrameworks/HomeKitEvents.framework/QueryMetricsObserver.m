@implementation QueryMetricsObserver

- (void)didReceiveEventFromDispatcher:(id)a3
{
  uint64_t v4;
  char *v5;
  id v6;
  _TtC13HomeKitEvents20QueryMetricsObserver *v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC13HomeKitEvents20QueryMetricsObserver *v11;

  type metadata accessor for CloudKitQueryLogEvent();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = (char *)v4;
    v6 = a3;
    v7 = self;
    sub_23E8F0C0C(v5);
  }
  else
  {
    type metadata accessor for EventsAsyncSequenceLogEvent();
    v8 = swift_dynamicCastClass();
    if (!v8)
      return;
    v9 = (char *)v8;
    v10 = a3;
    v11 = self;
    sub_23E8F0EF8(v9);
  }

}

- (_TtC13HomeKitEvents20QueryMetricsObserver)init
{
  _TtC13HomeKitEvents20QueryMetricsObserver *result;

  result = (_TtC13HomeKitEvents20QueryMetricsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13HomeKitEvents20QueryMetricsObserver_features);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
