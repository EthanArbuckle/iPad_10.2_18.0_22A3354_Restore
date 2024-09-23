@implementation Metric.LogEventAdaptor

- (unint64_t)coreAnalyticsEventOptions
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtCO13HomeKitDaemon6Metric15LogEventAdaptor_coreAnalyticsEventOptions);
}

- (void)setCoreAnalyticsEventOptions:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCO13HomeKitDaemon6Metric15LogEventAdaptor_coreAnalyticsEventOptions) = (Class)a3;
}

- (NSString)coreAnalyticsEventName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_222596CD8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtCO13HomeKitDaemon6Metric15LogEventAdaptor *v7;
  uint64_t v8;
  void *v9;

  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCO13HomeKitDaemon6Metric15LogEventAdaptor_event);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v8 = v6(v4, v5);
  sub_2219E0C5C(v8, (void (*)(uint64_t, uint64_t, _BYTE *))sub_22198E1D8);

  swift_bridgeObjectRelease();
  sub_221917374(0, (unint64_t *)&qword_25573BB60);
  v9 = (void *)sub_222596C54();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v9;
}

- (_TtCO13HomeKitDaemon6Metric15LogEventAdaptor)initWithHomeUUID:(id)a3
{
  uint64_t v3;
  _TtCO13HomeKitDaemon6Metric15LogEventAdaptor *result;

  v3 = sub_222596678();
  MEMORY[0x24BDAC7A8](v3);
  sub_222596648();
  result = (_TtCO13HomeKitDaemon6Metric15LogEventAdaptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCO13HomeKitDaemon6Metric15LogEventAdaptor)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  uint64_t v4;
  _TtCO13HomeKitDaemon6Metric15LogEventAdaptor *result;

  v4 = sub_222596678();
  MEMORY[0x24BDAC7A8](v4);
  sub_222596648();
  result = (_TtCO13HomeKitDaemon6Metric15LogEventAdaptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO13HomeKitDaemon6Metric15LogEventAdaptor_event);
}

@end
