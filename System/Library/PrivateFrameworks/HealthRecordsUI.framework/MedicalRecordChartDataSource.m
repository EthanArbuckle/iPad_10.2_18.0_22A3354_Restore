@implementation MedicalRecordChartDataSource

- (NSString)displayName
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  _TtC15HealthRecordsUI28MedicalRecordChartDataSource *v6;
  _TtC15HealthRecordsUI28MedicalRecordChartDataSource *v7;
  void *v8;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  sub_1BC4B825C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_chartDefining, (uint64_t)v10);
  v3 = v11;
  if (v11)
  {
    v4 = v12;
    __swift_project_boxed_opaque_existential_1Tm(v10, v11);
    v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v6 = self;
    v5(v3, v4);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);

  }
  else
  {
    v7 = self;
    sub_1BC348D78((uint64_t)v10, (uint64_t (*)(_QWORD))sub_1BC4B82A0);

  }
  v8 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)initWithConcept:(id)a3 dataTransformer:(id)a4 unit:(id)a5 preferredColors:(id)a6 collapseIntoRangePoints:(BOOL)a7 type:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  _TtC15HealthRecordsUI28MedicalRecordChartDataSource *v17;

  v14 = a3;
  swift_unknownObjectRetain();
  v15 = a5;
  v16 = a6;
  v17 = (_TtC15HealthRecordsUI28MedicalRecordChartDataSource *)sub_1BC4B84F8(a3, (uint64_t)a4, v15, a6, a7, a8);

  swift_unknownObjectRelease();
  return v17;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  int64_t index;
  int64_t zoom;
  char *resolution;
  _TtC15HealthRecordsUI28MedicalRecordChartDataSource *v8;
  _TtC15HealthRecordsUI28MedicalRecordChartDataSource *v9;
  id v10;
  _OWORD v12[2];

  index = a3->index;
  zoom = a3->zoom;
  resolution = (char *)a3->resolution;
  if (a4)
  {
    v8 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_1BC4B5868(index, zoom, resolution);

  sub_1BC348D78((uint64_t)v12, (uint64_t (*)(_QWORD))sub_1BC39BD68);
  return v10;
}

- (id)chartDisplayTypeWithVerticalAxis:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI28MedicalRecordChartDataSource *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BC4B5FEC((uint64_t)v4);

  return v6;
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)init
{
  _TtC15HealthRecordsUI28MedicalRecordChartDataSource *result;

  result = (_TtC15HealthRecordsUI28MedicalRecordChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC348D78((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_chartDefining, (uint64_t (*)(_QWORD))sub_1BC4B82A0);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_unit));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_preferredColors));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_chartableXRange));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_chartableYRange));
}

@end
