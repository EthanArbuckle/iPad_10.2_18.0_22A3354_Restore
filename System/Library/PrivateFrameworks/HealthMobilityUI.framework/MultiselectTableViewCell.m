@implementation MultiselectTableViewCell

- (_TtC16HealthMobilityUI24MultiselectTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  _TtC16HealthMobilityUI24MultiselectTableViewCell *result;

  if (a4)
  {
    v4 = sub_1D77F4AE8();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  sub_1D77F3124(v4, v5);
  return result;
}

- (_TtC16HealthMobilityUI24MultiselectTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D77F33C4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor));
  sub_1D77E2C2C((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item);
}

@end
