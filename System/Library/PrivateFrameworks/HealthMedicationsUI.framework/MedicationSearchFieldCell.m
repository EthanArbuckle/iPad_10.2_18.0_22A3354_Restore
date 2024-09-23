@implementation MedicationSearchFieldCell

- (_TtC19HealthMedicationsUI25MedicationSearchFieldCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC19HealthMedicationsUI25MedicationSearchFieldCell *v8;
  id v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell____lazy_storage___searchBar) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MedicationSearchFieldCell();
  v8 = -[MedicationSearchFieldCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  sub_1BC2B263C();
  v9 = (id)*MEMORY[0x1E0CD2A68];
  sub_1BC2B4C88();

  sub_1BC144168();
  return v8;
}

- (_TtC19HealthMedicationsUI25MedicationSearchFieldCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI25MedicationSearchFieldCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell____lazy_storage___searchBar) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI25MedicationSearchFieldCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell____lazy_storage___searchBar));
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI25MedicationSearchFieldCell *v5;

  v4 = a3;
  v5 = self;
  sub_1BC1445A4(v4);

}

@end
