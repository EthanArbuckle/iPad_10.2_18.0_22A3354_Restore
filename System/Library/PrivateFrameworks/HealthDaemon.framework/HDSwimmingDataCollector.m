@implementation HDSwimmingDataCollector

- (void)historicalSwimmingDataDidUpdate:(id)a3 reference:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC12HealthDaemon23HDSwimmingDataCollector *v8;

  type metadata accessor for HDCMSwimData();
  v6 = sub_1B7EF9D10();
  v7 = a4;
  v8 = self;
  sub_1B7856BBC(v6, v7);

  swift_bridgeObjectRelease();
}

- (Class)sensorDatumClassForAggregator:(id)a3
{
  sub_1B7858824(0, &qword_1EF192980);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)sourceForDataAggregator:(id)a3
{
  return objc_msgSend((id)objc_opt_self(), sel__localDeviceSource);
}

- (id)identifierForDataAggregator:(id)a3
{
  id v4;
  _TtC12HealthDaemon23HDSwimmingDataCollector *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1B7858594();

  v6 = (void *)sub_1B7EF9CB0();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC12HealthDaemon23HDSwimmingDataCollector)init
{
  _TtC12HealthDaemon23HDSwimmingDataCollector *result;

  result = (_TtC12HealthDaemon23HDSwimmingDataCollector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end
