@implementation MedicationComponentsItemCell

- (_TtC19HealthMedicationsUI28MedicationComponentsItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI28MedicationComponentsItemCell *)sub_1BC17D1D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI28MedicationComponentsItemCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI28MedicationComponentsItemCell *)sub_1BC17D2C4(a3);
}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationComponentsItemCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationComponentsItemCell____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationComponentsItemCell____lazy_storage___componentsLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
