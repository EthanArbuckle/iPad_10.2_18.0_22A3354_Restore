@implementation PickerTableViewCell

- (_TtC16HealthMobilityUI19PickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_1D77F4AE8();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC16HealthMobilityUI19PickerTableViewCell *)sub_1D77CB5D4(v4, v5);
}

- (_TtC16HealthMobilityUI19PickerTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC16HealthMobilityUI19PickerTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC16HealthMobilityUI19PickerTableViewCell *)sub_1D77F4DA0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D77CB794((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView));
}

@end
