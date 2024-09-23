@implementation BloodPressureChartConfiguration

- (Class)chartControllerClass
{
  sub_1BC40A620();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)shouldShowOutOfRangeOverlay
{
  return 0;
}

- (_TtP15HealthRecordsUI33MedicalRecordChartDataTransformer_)dataTransformer
{
  _QWORD *v2;

  type metadata accessor for BloodPressureDataTransformer();
  v2 = (_QWORD *)swift_allocObject();
  v2[2] = 0;
  v2[3] = 0;
  return (_TtP15HealthRecordsUI33MedicalRecordChartDataTransformer_ *)v2;
}

- (_TtC15HealthRecordsUI31BloodPressureChartConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BloodPressureChartConfiguration();
  return -[BloodPressureChartConfiguration init](&v3, sel_init);
}

@end
