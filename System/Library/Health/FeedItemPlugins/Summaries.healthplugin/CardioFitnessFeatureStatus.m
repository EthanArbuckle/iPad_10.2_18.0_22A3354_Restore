@implementation CardioFitnessFeatureStatus

- (_TtC9Summaries26CardioFitnessFeatureStatus)init
{
  _TtC9Summaries26CardioFitnessFeatureStatus *result;

  result = (_TtC9Summaries26CardioFitnessFeatureStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9Summaries26CardioFitnessFeatureStatus__status;
  sub_2320057B8(0, &qword_2541AF360, (uint64_t (*)(uint64_t))sub_2320700D4, MEMORY[0x24BDB9EF0]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (void)featureStatusManager:(id)a3 didUpdateOnboardingStatus:(id)a4
{
  id v6;
  _TtC9Summaries26CardioFitnessFeatureStatus *v7;

  swift_getKeyPath();
  swift_getKeyPath();
  v6 = a4;
  v7 = self;
  sub_232200714();
}

@end
