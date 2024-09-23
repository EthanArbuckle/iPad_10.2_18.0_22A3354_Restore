@implementation MedicalRecordTimelineChartItemCell

- (_TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell_item;
  v9 = (objc_class *)type metadata accessor for MedicalRecordTimelineChartItemCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[MedicalRecordTimelineChartItemCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1BC55BC3C();

  return v10;
}

- (_TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell *v6;
  _TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell *v7;
  _TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell *v8;
  objc_super v10;

  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MedicalRecordTimelineChartItemCell();
  v5 = a3;
  v6 = -[MedicalRecordTimelineChartItemCell initWithCoder:](&v10, sel_initWithCoder_, v5);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    sub_1BC55BC3C();

  }
  return v7;
}

- (void)didMoveToSuperview
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[24];
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MedicalRecordTimelineChartItemCell();
  v2 = v7.receiver;
  -[MedicalRecordTimelineChartItemCell didMoveToSuperview](&v7, sel_didMoveToSuperview);
  v3 = (uint64_t)v2 + OBJC_IVAR____TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell_item;
  swift_beginAccess();
  sub_1BC37ADB0(v3, (uint64_t)v5);
  v4 = v6;
  sub_1BC37AE60((uint64_t)v5);
  if (v4)
    sub_1BC6141F8();

}

- (void).cxx_destruct
{
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell_item);
}

@end
