@implementation MedicalRecordTimelineAccountHeaderItemCell

- (_TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell *)sub_1BC3B9F94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell *)sub_1BC3BA350(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell_accountView));
  sub_1BC384EB4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell_item, (unint64_t *)&qword_1EF43AE70, (void (*)(uint64_t))sub_1BC37AE0C);
}

@end
