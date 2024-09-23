@implementation SwitchTableViewCell

- (_TtC18HealthExperienceUI19SwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)_sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC18HealthExperienceUI19SwitchTableViewCell *)sub_1A9A0B040(a3, (uint64_t)a4, v6);
}

- (_TtC18HealthExperienceUI19SwitchTableViewCell)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI19SwitchTableViewCell *result;

  result = (_TtC18HealthExperienceUI19SwitchTableViewCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19SwitchTableViewCell_toggleSwitch));
}

@end
