@implementation FeatureRegulatoryInfoProvider

- (_TtC8HealthUI29FeatureRegulatoryInfoProvider)init
{
  _TtC8HealthUI29FeatureRegulatoryInfoProvider *result;

  result = (_TtC8HealthUI29FeatureRegulatoryInfoProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI29FeatureRegulatoryInfoProvider_featureAvailabilityStore));
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI29FeatureRegulatoryInfoProvider_logger;
  v4 = sub_1D7B4969C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8HealthUI29FeatureRegulatoryInfoProvider__featureRegulatoryInfo;
  sub_1D7B280A8(0, &qword_1F014FF00, MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
}

@end
