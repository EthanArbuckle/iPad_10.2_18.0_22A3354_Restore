@implementation ConnectivityIssueCell

- (_TtC19HealthMedicationsUI21ConnectivityIssueCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI21ConnectivityIssueCell *)sub_1BC1F7260(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI21ConnectivityIssueCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC1F84F0();
}

- (void).cxx_destruct
{
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI21ConnectivityIssueCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21ConnectivityIssueCell____lazy_storage___boltIconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21ConnectivityIssueCell____lazy_storage___labelView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21ConnectivityIssueCell____lazy_storage___secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21ConnectivityIssueCell____lazy_storage___settingsButton));
}

@end
