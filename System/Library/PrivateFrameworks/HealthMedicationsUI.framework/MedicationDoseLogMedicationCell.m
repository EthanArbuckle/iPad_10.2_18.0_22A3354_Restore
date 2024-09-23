@implementation MedicationDoseLogMedicationCell

- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell *)sub_1BC12E3B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  -[MedicationDoseLogMedicationCell layoutIfNeeded](v9, sel_layoutIfNeeded);
  v18.receiver = v9;
  v18.super_class = (Class)type metadata accessor for MedicationDoseLogMedicationCell();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  -[MedicationDoseLogMedicationCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v18, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell____lazy_storage___logView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell____lazy_storage___logView));
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell_item);
}

@end
