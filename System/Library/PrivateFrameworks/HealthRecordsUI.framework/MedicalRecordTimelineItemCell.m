@implementation MedicalRecordTimelineItemCell

- (_TtC15HealthRecordsUI29MedicalRecordTimelineItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI29MedicalRecordTimelineItemCell *)sub_1BC531988(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI29MedicalRecordTimelineItemCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI29MedicalRecordTimelineItemCell *)sub_1BC531CC4(a3);
}

- (void)awakeFromNib
{
  _TtC15HealthRecordsUI29MedicalRecordTimelineItemCell *v2;

  v2 = self;
  sub_1BC531E18();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15HealthRecordsUI29MedicalRecordTimelineItemCell *v8;
  uint64_t v9;

  v4 = sub_1BC62BC18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62BC0C();
  v8 = self;
  sub_1BC43E7FC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI29MedicalRecordTimelineItemCell_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI29MedicalRecordTimelineItemCell_valueView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI29MedicalRecordTimelineItemCell_subtitleLabel));
  sub_1BC3DF8C4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI29MedicalRecordTimelineItemCell_item, (unint64_t *)&qword_1EF43AE70, (unint64_t *)&qword_1EF42ADC0);
  sub_1BC3AA0C8((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI29MedicalRecordTimelineItemCell_sectionContext);
}

@end
