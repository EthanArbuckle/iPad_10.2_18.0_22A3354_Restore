@implementation MedicalRecordTimelineSystemStatusItemCell

- (_TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell *)sub_1BC5ECCE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell____lazy_storage___spinner) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell____lazy_storage___titleLabel) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell____lazy_storage___spinner));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell____lazy_storage___titleLabel));
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell_item);
}

@end
