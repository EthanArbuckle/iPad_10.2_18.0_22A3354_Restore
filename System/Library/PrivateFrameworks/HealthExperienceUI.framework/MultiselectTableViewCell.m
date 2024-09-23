@implementation MultiselectTableViewCell

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI24MultiselectTableViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1A9816BC4(a3);

}

- (void)tintColorDidChange
{
  _TtC18HealthExperienceUI24MultiselectTableViewCell *v2;

  v2 = self;
  sub_1A9816D78();

}

- (_TtC18HealthExperienceUI24MultiselectTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  _TtC18HealthExperienceUI24MultiselectTableViewCell *result;

  if (a4)
  {
    v4 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  sub_1A9817148(v4, v5);
  return result;
}

- (_TtC18HealthExperienceUI24MultiselectTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A981743C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24MultiselectTableViewCell_accessoryImage));
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24MultiselectTableViewCell_item);
}

@end
