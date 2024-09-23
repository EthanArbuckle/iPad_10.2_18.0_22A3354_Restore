@implementation Metric.LogEventAdaptor

- (unint64_t)coreAnalyticsEventOptions
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor_coreAnalyticsEventOptions);
}

- (void)setCoreAnalyticsEventOptions:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor_coreAnalyticsEventOptions) = (Class)a3;
}

- (NSString)coreAnalyticsEventName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CDAB84A8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor *v7;
  uint64_t v8;
  void *v9;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor_event);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v8 = v6(v4, v5);
  sub_1CD0DBDBC(v8, (void (*)(uint64_t, uint64_t, _BYTE *))sub_1CD0D5764);

  swift_bridgeObjectRelease();
  sub_1CD0C9A74(0, (unint64_t *)&qword_1EFA45CF0);
  v9 = (void *)sub_1CDAB8478();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v9;
}

- (_TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor)initWithHomeUUID:(id)a3
{
  uint64_t v3;
  _TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor *result;

  v3 = sub_1CDAB822C();
  MEMORY[0x1E0C80A78](v3);
  sub_1CDAB8214();
  result = (_TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  uint64_t v4;
  _TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor *result;

  v4 = sub_1CDAB822C();
  MEMORY[0x1E0C80A78](v4);
  sub_1CDAB8214();
  result = (_TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19HomeKitDaemonLegacy6Metric15LogEventAdaptor_event);
}

@end
