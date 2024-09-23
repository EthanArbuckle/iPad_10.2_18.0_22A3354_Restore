@implementation MedicationAvatarCell

- (_TtC19HealthMedicationsUI20MedicationAvatarCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC19HealthMedicationsUI20MedicationAvatarCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___pillImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___editButton) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell_item;
  v9 = (objc_class *)type metadata accessor for MedicationAvatarCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[MedicationAvatarCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1BC1207B0();

  return v10;
}

- (_TtC19HealthMedicationsUI20MedicationAvatarCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI20MedicationAvatarCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___pillImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___editButton) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI20MedicationAvatarCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)editButtonTappedWithSender:(id)a3
{
  _TtC19HealthMedicationsUI20MedicationAvatarCell *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC2B5024();
  swift_unknownObjectRelease();
  sub_1BC121030();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___pillImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___editButton));
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
}

@end
