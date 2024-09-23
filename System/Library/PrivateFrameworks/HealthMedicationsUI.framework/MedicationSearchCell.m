@implementation MedicationSearchCell

- (_TtC19HealthMedicationsUI20MedicationSearchCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI20MedicationSearchCell *)sub_1BC1C37D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI20MedicationSearchCell)initWithCoder:(id)a3
{
  uint64_t *v5;
  uint64_t v6;
  id v7;
  char *v8;
  _TtC19HealthMedicationsUI20MedicationSearchCell *result;
  uint64_t v10;
  uint64_t v11;

  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationSearchCell_baseIdentifier);
  v10 = sub_1BC2B4460();
  v11 = v6;
  swift_bridgeObjectRetain();
  sub_1BC2B44FC();
  v7 = a3;
  swift_bridgeObjectRelease();
  *v5 = v10;
  v5[1] = v11;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationSearchCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;

  result = (_TtC19HealthMedicationsUI20MedicationSearchCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BC1C61FC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationSearchCell_item, (uint64_t)&qword_1EDA0F7D0, (uint64_t)&qword_1EDA0F7C0, MEMORY[0x1E0D2A060], (uint64_t (*)(_QWORD))sub_1BC0E7A84);
}

@end
