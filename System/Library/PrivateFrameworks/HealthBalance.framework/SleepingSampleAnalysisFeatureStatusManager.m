@implementation SleepingSampleAnalysisFeatureStatusManager

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v7;
  _TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager *v8;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  SleepingSampleAnalysisFeatureStatusManager.featureStatusProviding(_:didUpdate:)(a3);
  swift_unknownObjectRelease();

}

- (_TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager)init
{
  _TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager *result;

  result = (_TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager_observationQueue));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager___observationRegistrar;
  v4 = sub_23DC29FD4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
