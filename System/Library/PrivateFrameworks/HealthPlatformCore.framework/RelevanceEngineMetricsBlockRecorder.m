@implementation RelevanceEngineMetricsBlockRecorder

- (void)recordTrainingMetrics:(id)a3 forInteraction:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC18HealthPlatformCore35RelevanceEngineMetricsBlockRecorder *v9;

  sub_1BC01F540();
  v5 = sub_1BC08A300();
  v6 = sub_1BC08A3C0();
  v8 = v7;
  v9 = self;
  sub_1BC01F190(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)ignoreValidMetricCheck
{
  return 1;
}

- (_TtC18HealthPlatformCore35RelevanceEngineMetricsBlockRecorder)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC18HealthPlatformCore35RelevanceEngineMetricsBlockRecorder_callback);
  v4 = (objc_class *)type metadata accessor for RelevanceEngineMetricsBlockRecorder();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[RelevanceEngineMetricsBlockRecorder init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_1BBFE60FC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18HealthPlatformCore35RelevanceEngineMetricsBlockRecorder_callback));
}

@end
