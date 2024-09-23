@implementation MedicalRecordChartabilityResult

- (_TtP15HealthRecordsUI31MedicalRecordChartConfiguration_)configuration
{
  return (_TtP15HealthRecordsUI31MedicalRecordChartConfiguration_ *)(id)swift_unknownObjectRetain();
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)masterDataSource
{
  return (_TtC15HealthRecordsUI28MedicalRecordChartDataSource *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_masterDataSource);
}

- (NSArray)seriesDataSources
{
  void *v2;

  type metadata accessor for MedicalRecordChartDataSource();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BC62C86C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)outOfRangeDataSource
{
  return (_TtC15HealthRecordsUI28MedicalRecordChartDataSource *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_outOfRangeDataSource);
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)noRangeDataSource
{
  return (_TtC15HealthRecordsUI28MedicalRecordChartDataSource *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_noRangeDataSource);
}

- (NSDate)latestChartableDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  sub_1BC3B3098(0, (unint64_t *)&qword_1ED6A4EA0, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - v4;
  sub_1BC3462D8((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_latestChartableDate, (uint64_t)&v10 - v4);
  v6 = sub_1BC62A760();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1BC62A700();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSDate *)v8;
}

- (BOOL)shouldProduceAtLeastOneOverlay
{
  unint64_t v3;
  uint64_t v4;
  _TtC15HealthRecordsUI31MedicalRecordChartabilityResult *v5;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_outOfRangeDataSource)
    || *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_noRangeDataSource))
  {
    return 1;
  }
  v3 = *(unint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_seriesDataSources);
  if (v3 >> 62)
  {
    v5 = self;
    swift_bridgeObjectRetain();
    v4 = sub_1BC62D3B8();

    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v4 > 1;
}

- (_TtC15HealthRecordsUI31MedicalRecordChartabilityResult)init
{
  _TtC15HealthRecordsUI31MedicalRecordChartabilityResult *result;

  result = (_TtC15HealthRecordsUI31MedicalRecordChartabilityResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_masterDataSource));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_outOfRangeDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_noRangeDataSource));
  sub_1BC36D71C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_latestChartableDate);
}

@end
