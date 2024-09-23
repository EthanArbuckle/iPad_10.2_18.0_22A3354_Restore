@implementation SelfServiceSessionHistoryCell

- (_TtC11Diagnostics29SelfServiceSessionHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DARootViewController *v5;
  DARootViewController *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC11Diagnostics29SelfServiceSessionHistoryCell *)sub_10005C740(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics29SelfServiceSessionHistoryCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics29SelfServiceSessionHistoryCell *)sub_10005C974(a3);
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics29SelfServiceSessionHistoryCell_rootStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics29SelfServiceSessionHistoryCell_suiteNameLabel));
  swift_bridgeObjectRelease(*(DARootViewController **)&self->rootStackView[OBJC_IVAR____TtC11Diagnostics29SelfServiceSessionHistoryCell_suiteName], v3, v4, v5, v6, v7, v8, v9);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics29SelfServiceSessionHistoryCell_dateLabel));
  sub_100044F0C((uint64_t)self + OBJC_IVAR____TtC11Diagnostics29SelfServiceSessionHistoryCell_date);
}

@end
