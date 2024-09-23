@implementation MedicalRecordTimelineHeaderItemCell

- (_TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell *)MedicalRecordTimelineHeaderItemCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC59628C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell *v6;

  v5 = a3;
  v6 = self;
  sub_1BC594E10(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell____lazy_storage___separatorView));
  swift_bridgeObjectRelease();
  sub_1BC384EB4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell_item, (unint64_t *)&qword_1EF43AE70, (void (*)(uint64_t))sub_1BC37AE0C);
  sub_1BC384EB4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell_sectionContext, &qword_1EF42BC08, (void (*)(uint64_t))MEMORY[0x1E0D2AAA0]);
}

@end
