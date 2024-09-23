@implementation MedicalRecordTimelineChartValueItemCell

- (_TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell *)sub_1BC4A3AE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell *)sub_1BC4A3C48(a3);
}

- (void)awakeFromNib
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MedicalRecordTimelineChartValueItemCell();
  v2 = v3.receiver;
  -[MedicalRecordTimelineChartValueItemCell awakeFromNib](&v3, sel_awakeFromNib);
  sub_1BC4A3DD4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_valueTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_valueLabel));
  sub_1BC377E3C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_item, (unint64_t *)&qword_1EF43AE70, (uint64_t (*)(uint64_t))sub_1BC37AE0C);
  sub_1BC377E3C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_sectionContext, &qword_1EF42BC08, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2AAA0]);
}

@end
