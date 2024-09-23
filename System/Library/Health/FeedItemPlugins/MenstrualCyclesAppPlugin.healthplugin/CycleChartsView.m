@implementation CycleChartsView

- (_TtC24MenstrualCyclesAppPlugin15CycleChartsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231C9A7DC();
}

- (void)layoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin15CycleChartsView *v2;

  v2 = self;
  sub_231C9A0B8();

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC24MenstrualCyclesAppPlugin15CycleChartsView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_231C9A220(x, y, width, height);

}

- (_TtC24MenstrualCyclesAppPlugin15CycleChartsView)initWithFrame:(CGRect)a3
{
  _TtC24MenstrualCyclesAppPlugin15CycleChartsView *result;

  result = (_TtC24MenstrualCyclesAppPlugin15CycleChartsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_impactFeedbackGenerator));
  swift_bridgeObjectRelease();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CycleChartsView_impactFeedbackGenerator), sel_prepare, a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin15CycleChartsView *v5;

  v4 = a3;
  v5 = self;
  sub_231C9A8EC();

}

@end
