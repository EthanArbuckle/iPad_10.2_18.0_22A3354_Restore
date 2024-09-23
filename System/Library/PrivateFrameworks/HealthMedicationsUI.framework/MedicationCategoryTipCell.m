@implementation MedicationCategoryTipCell

- (_TtC19HealthMedicationsUI25MedicationCategoryTipCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC19HealthMedicationsUI25MedicationCategoryTipCell *v8;
  id v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationCategoryTipCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationCategoryTipCell_tipView) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MedicationCategoryTipCell();
  v8 = -[MedicationCategoryTipCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  sub_1BC2B263C();
  v9 = (id)*MEMORY[0x1E0CD2A68];
  sub_1BC2B4C88();

  return v8;
}

- (_TtC19HealthMedicationsUI25MedicationCategoryTipCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI25MedicationCategoryTipCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationCategoryTipCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationCategoryTipCell_tipView) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI25MedicationCategoryTipCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC0E8594((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationCategoryTipCell_item, (uint64_t (*)(_QWORD))sub_1BC0E84E8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationCategoryTipCell_tipView));
}

@end
