@implementation DurationDatePickerCollectionViewCell

- (_TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  _TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell *v10;
  _TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell____lazy_storage___titleLabel) = 0;
  v9 = OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_datePicker;
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v9) = (Class)sub_1BC187080();
  *(Class *)((char *)&v10->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_currentLayoutConstraints) = (Class)MEMORY[0x1E0DEE9D8];

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for DurationDatePickerCollectionViewCell();
  v11 = -[DurationDatePickerCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_1BC1873FC();

  return v11;
}

- (_TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell)initWithCoder:(id)a3
{
  char *v4;
  uint64_t v5;
  id v6;
  _TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell____lazy_storage___titleLabel) = 0;
  v5 = OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_datePicker;
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)sub_1BC187080();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_currentLayoutConstraints) = (Class)MEMORY[0x1E0DEE9D8];

  result = (_TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)pickerDateChanged:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1BC187E20(v4);

}

- (void).cxx_destruct
{
  sub_1BC0E8594((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_item, (uint64_t (*)(_QWORD))sub_1BC0E84E8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_datePicker));
  swift_bridgeObjectRelease();
}

@end
