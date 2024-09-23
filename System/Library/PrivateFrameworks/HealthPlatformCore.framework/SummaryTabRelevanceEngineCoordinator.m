@implementation SummaryTabRelevanceEngineCoordinator

- (_TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator)init
{
  _TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator *result;

  result = (_TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator_dispatchQueue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator____lazy_storage___primaryFeatures));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator_modelPath;
  v4 = sub_1BC088F98();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1BC01A8C0((uint64_t)self + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator_pretrainedModelURL);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator____lazy_storage___trainingContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator____lazy_storage___metricsRecorder));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator____lazy_storage___relevanceEngine));
}

@end
