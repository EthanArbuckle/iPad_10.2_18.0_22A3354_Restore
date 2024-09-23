@implementation MedicationDoseRecordAllCell

- (_TtC19HealthMedicationsUI27MedicationDoseRecordAllCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI27MedicationDoseRecordAllCell *)sub_1BC20003C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI27MedicationDoseRecordAllCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI27MedicationDoseRecordAllCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseRecordAllCell____lazy_storage___recordAllButton) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseRecordAllCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI27MedicationDoseRecordAllCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseRecordAllCell____lazy_storage___recordAllButton));
  sub_1BC0E8594((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseRecordAllCell_item, (uint64_t (*)(_QWORD))sub_1BC0E84E8);
}

@end
