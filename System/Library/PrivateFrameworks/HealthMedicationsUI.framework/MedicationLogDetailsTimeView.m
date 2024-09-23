@implementation MedicationLogDetailsTimeView

- (_TtC19HealthMedicationsUI28MedicationLogDetailsTimeView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  _TtC19HealthMedicationsUI28MedicationLogDetailsTimeView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___timeFormatter) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView_logDate;
  v9 = sub_1BC2B23F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView_viewModel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___logTimeLabel) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MedicationLogDetailsTimeView(0);
  v10 = -[MedicationLogDetailsTimeView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1BC1B0FD8();

  return v10;
}

- (_TtC19HealthMedicationsUI28MedicationLogDetailsTimeView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC19HealthMedicationsUI28MedicationLogDetailsTimeView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___timeFormatter) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView_logDate;
  v6 = sub_1BC2B23F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView_viewModel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___logTimeLabel) = 0;
  v7 = a3;

  result = (_TtC19HealthMedicationsUI28MedicationLogDetailsTimeView *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___timeFormatter));
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView_logDate, (unint64_t *)&qword_1EDA0E710, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___logTimeLabel));
}

@end
