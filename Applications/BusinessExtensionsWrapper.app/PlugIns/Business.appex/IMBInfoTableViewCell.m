@implementation IMBInfoTableViewCell

- (_TtC8Business20IMBInfoTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8Business20IMBInfoTableViewCell *)sub_100085EC0(a3, (uint64_t)a4, v6);
}

- (_TtC8Business20IMBInfoTableViewCell)initWithCoder:(id)a3
{
  return (_TtC8Business20IMBInfoTableViewCell *)sub_10008600C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBInfoTableViewCell_leftLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBInfoTableViewCell_rightLabel));
}

@end
