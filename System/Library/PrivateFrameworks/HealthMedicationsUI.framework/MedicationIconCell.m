@implementation MedicationIconCell

- (_TtC19HealthMedicationsUI18MedicationIconCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC19HealthMedicationsUI18MedicationIconCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI18MedicationIconCell____lazy_storage___imageView) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI18MedicationIconCell_item;
  v9 = (objc_class *)type metadata accessor for MedicationIconCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[MedicationIconCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  -[MedicationIconCell setUserInteractionEnabled:](v10, sel_setUserInteractionEnabled_, 0);
  sub_1BC1E21E8();

  return v10;
}

- (_TtC19HealthMedicationsUI18MedicationIconCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI18MedicationIconCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI18MedicationIconCell____lazy_storage___imageView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI18MedicationIconCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI18MedicationIconCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI18MedicationIconCell____lazy_storage___imageView));
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI18MedicationIconCell_item);
}

@end
