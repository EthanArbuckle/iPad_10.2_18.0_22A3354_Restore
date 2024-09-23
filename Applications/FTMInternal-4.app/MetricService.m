@implementation MetricService

- (_TtC13FTMInternal_413MetricService)init
{
  _TtC13FTMInternal_413MetricService *result;

  result = (_TtC13FTMInternal_413MetricService *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.MetricService", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->metricIDKey[OBJC_IVAR____TtC13FTMInternal_413MetricService_metricIDKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->metricIDKey[OBJC_IVAR____TtC13FTMInternal_413MetricService_payloadKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->metricIDKey[OBJC_IVAR____TtC13FTMInternal_413MetricService_profileIDKey]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_413MetricService_edgeCaseIceMetrics));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_413MetricService_dlbwlookup));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_413MetricService_newMetricHexIds));
}

- (void)metricsDidUpdate:(id)a3
{
  uint64_t v4;
  _TtC13FTMInternal_413MetricService *v5;
  Class isa;

  if (a3)
  {
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v5 = self;
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    sub_1001A5460(isa);

    swift_bridgeObjectRelease(v4);
  }
  else
  {
    __break(1u);
  }
}

@end
