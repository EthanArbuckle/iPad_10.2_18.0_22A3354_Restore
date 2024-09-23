@implementation MedicationSummaryCollectionViewHeaderCell

- (_TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _OWORD *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  v8 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummary);
  *v8 = 0u;
  v8[1] = 0u;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummaryView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MedicationSummaryCollectionViewHeaderCell();
  return -[MedicationSummaryCollectionViewHeaderCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell)initWithCoder:(id)a3
{
  char *v4;
  _OWORD *v5;
  id v6;
  _TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummary);
  *v5 = 0u;
  v5[1] = 0u;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummaryView) = 0;
  v6 = a3;

  result = (_TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_item);
  sub_1BC1BAC3C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummary), *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummary));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummaryView));
}

@end
