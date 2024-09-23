@implementation MedicationDoseLogHeaderView

- (_TtC19HealthMedicationsUI27MedicationDoseLogHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI27MedicationDoseLogHeaderView *)sub_1BC10C5F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI27MedicationDoseLogHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC10E224();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView____lazy_storage___dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView____lazy_storage___countLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView____lazy_storage___dateFormatter));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView____lazy_storage___titleLabelToBottomAnchor));
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView_item);
}

@end
