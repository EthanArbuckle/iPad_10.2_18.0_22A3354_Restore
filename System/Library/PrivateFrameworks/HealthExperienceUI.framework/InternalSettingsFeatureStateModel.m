@implementation InternalSettingsFeatureStateModel

- (_TtC18HealthExperienceUI33InternalSettingsFeatureStateModel)init
{
  _TtC18HealthExperienceUI33InternalSettingsFeatureStateModel *result;

  result = (_TtC18HealthExperienceUI33InternalSettingsFeatureStateModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel_featureAvailabilityStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel_featureStatusManager));
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel__featureState;
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198];
  sub_1A961D988(0, &qword_1EEB21F70, (uint64_t (*)(uint64_t))type metadata accessor for InternalSettingsFeatureState, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel__featureStatus;
  sub_1A961D988(0, &qword_1EEB21F78, (uint64_t (*)(uint64_t))sub_1A999A770, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel__errorMessage;
  sub_1A961D988(0, &qword_1EEB21F88, (uint64_t (*)(uint64_t))sub_1A999A78C, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel____lazy_storage___dateFormatter));
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(void *)a1
{
  id v2;

  swift_unknownObjectRetain();
  v2 = a1;
  sub_1A999876C();
  swift_unknownObjectRelease();

}

@end
