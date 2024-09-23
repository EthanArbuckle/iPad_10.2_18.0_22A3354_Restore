@implementation HomePodInfoTableCell

- (_TtC14HDSViewService20HomePodInfoTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC14HDSViewService20HomePodInfoTableCell *)sub_100080358(a3, (uint64_t)a4, v6);
}

- (_TtC14HDSViewService20HomePodInfoTableCell)initWithCoder:(id)a3
{
  return (_TtC14HDSViewService20HomePodInfoTableCell *)sub_1000804A0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService20HomePodInfoTableCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService20HomePodInfoTableCell_valueLabel));
}

@end
