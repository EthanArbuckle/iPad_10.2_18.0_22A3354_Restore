@implementation DayPickerCollectionViewCell

- (void)selectedDaysDidChange:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI27DayPickerCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1BC276818((uint64_t)v4);

}

- (_TtC19HealthMedicationsUI27DayPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_dayPicker) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DayPickerCollectionViewCell();
  return -[DayPickerCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI27DayPickerCollectionViewCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_dayPicker) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DayPickerCollectionViewCell();
  return -[DayPickerCollectionViewCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_dayPicker));
}

@end
