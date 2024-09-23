@implementation IMBActionTableViewCell

- (_TtC8Business22IMBActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8Business22IMBActionTableViewCell *)sub_100053AA0(a3, (uint64_t)a4, v6);
}

- (_TtC8Business22IMBActionTableViewCell)initWithCoder:(id)a3
{
  return (_TtC8Business22IMBActionTableViewCell *)sub_100053BF8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business22IMBActionTableViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business22IMBActionTableViewCell_titleLabel));
}

@end
