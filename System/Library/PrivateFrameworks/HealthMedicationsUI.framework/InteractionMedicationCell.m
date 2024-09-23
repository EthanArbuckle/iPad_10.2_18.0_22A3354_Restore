@implementation InteractionMedicationCell

- (_TtC19HealthMedicationsUI25InteractionMedicationCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI25InteractionMedicationCell *)sub_1BC0E5D10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI25InteractionMedicationCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI25InteractionMedicationCell *)sub_1BC0E5E1C(a3);
}

- (void)awakeFromNib
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionMedicationCell();
  v2 = v3.receiver;
  -[InteractionMedicationCell awakeFromNib](&v3, sel_awakeFromNib);
  sub_1BC0E5F54();
  sub_1BC0E6094();

}

- (void).cxx_destruct
{
  sub_1BC0E7B24((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionMedicationCell_item, (unint64_t *)&qword_1EDA0F7D0, (unint64_t *)&qword_1EDA0F7C0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionMedicationCell____lazy_storage___titleButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionMedicationCell____lazy_storage___stackedMedmojiView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionMedicationCell____lazy_storage___firstInteractionNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionMedicationCell____lazy_storage___secondInteractionNameLabel));
}

@end
