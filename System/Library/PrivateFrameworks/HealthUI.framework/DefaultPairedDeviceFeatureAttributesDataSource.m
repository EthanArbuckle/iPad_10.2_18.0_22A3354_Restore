@implementation DefaultPairedDeviceFeatureAttributesDataSource

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  _TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D7B3619C();
  swift_unknownObjectRelease();

}

- (_TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource)init
{
  _TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource *result;

  result = (_TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource_activePairedDeviceProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource_featureAvailabilityStore));
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource_logger;
  v4 = sub_1D7B4969C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
}

@end
