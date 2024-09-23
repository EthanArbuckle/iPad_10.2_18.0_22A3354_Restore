@implementation MedicationLogDetailsTimePickerView

- (void)logTimeChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView *v10;
  id v11;
  uint64_t v12;

  v5 = sub_1BC2B23F0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x1BCCEF478]((char *)self + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_detailsDelegate))
  {
    v9 = a3;
    v10 = self;
    v11 = objc_msgSend(v9, sel_date);
    sub_1BC2B23A8();

    sub_1BC203E0C((uint64_t)v8);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  }
}

- (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_detailsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_viewModel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView____lazy_storage___logTimePicker) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MedicationLogDetailsTimePickerView();
  v8 = -[MedicationLogDetailsTimePickerView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1BC0F3898();

  return v8;
}

- (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView)initWithCoder:(id)a3
{
  id v5;
  _TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_detailsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_viewModel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView____lazy_storage___logTimePicker) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  sub_1BC0F0430((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_detailsDelegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView____lazy_storage___logTimePicker));
}

@end
