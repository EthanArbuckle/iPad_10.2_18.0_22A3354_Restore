@implementation SingleValueChartConfiguration

- (Class)chartControllerClass
{
  sub_1BC3E244C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)shouldShowOutOfRangeOverlay
{
  return 1;
}

- (_TtP15HealthRecordsUI33MedicalRecordChartDataTransformer_)dataTransformer
{
  type metadata accessor for SingleValueDataTransformer();
  return (_TtP15HealthRecordsUI33MedicalRecordChartDataTransformer_ *)(id)swift_allocObject();
}

- (_TtC15HealthRecordsUI29SingleValueChartConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SingleValueChartConfiguration();
  return -[SingleValueChartConfiguration init](&v3, sel_init);
}

@end
