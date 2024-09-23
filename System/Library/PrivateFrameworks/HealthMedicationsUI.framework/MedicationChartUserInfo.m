@implementation MedicationChartUserInfo

- (_TtC19HealthMedicationsUI23MedicationChartUserInfo)init
{
  _TtC19HealthMedicationsUI23MedicationChartUserInfo *result;

  result = (_TtC19HealthMedicationsUI23MedicationChartUserInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI23MedicationChartUserInfo_statisticsInterval;
  v4 = sub_1BC2B20FC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI23MedicationChartUserInfo_medication);
}

@end
