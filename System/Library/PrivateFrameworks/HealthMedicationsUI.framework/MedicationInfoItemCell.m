@implementation MedicationInfoItemCell

- (_TtC19HealthMedicationsUI22MedicationInfoItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI22MedicationInfoItemCell *)sub_1BC238BA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI22MedicationInfoItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC2395F0();
}

- (void).cxx_destruct
{
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell____lazy_storage___medmojiView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell____lazy_storage___nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell____lazy_storage___strengthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell____lazy_storage___ingredientsLabel));
}

@end
