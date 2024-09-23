@implementation ButtonCell

- (_TtC15HealthRecordsUI10ButtonCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI10ButtonCell *)sub_1BC60EE68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI10ButtonCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC60FA14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10ButtonCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10ButtonCell____lazy_storage___spinnerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10ButtonCell_titleLabelLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10ButtonCell_nonBusyTitleLabelColor));
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI10ButtonCell_item);
}

@end
