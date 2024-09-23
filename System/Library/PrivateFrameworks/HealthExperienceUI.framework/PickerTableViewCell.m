@implementation PickerTableViewCell

- (_TtC18HealthExperienceUI19PickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC18HealthExperienceUI19PickerTableViewCell *)sub_1A96DD778(v4, v5);
}

- (_TtC18HealthExperienceUI19PickerTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI19PickerTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI19PickerTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI19PickerTableViewCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI19PickerTableViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19PickerTableViewCell_pickerView));
}

@end
