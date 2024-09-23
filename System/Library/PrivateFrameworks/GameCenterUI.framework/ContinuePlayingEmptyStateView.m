@implementation ContinuePlayingEmptyStateView

- (_TtC12GameCenterUI29ContinuePlayingEmptyStateView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI29ContinuePlayingEmptyStateView *)sub_1AB7952E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI29ContinuePlayingEmptyStateView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB795690();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI29ContinuePlayingEmptyStateView *v2;

  v2 = self;
  sub_1AB7957E0();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI29ContinuePlayingEmptyStateView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  JUMeasurements result;

  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1AB796388(a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease();

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)didTapButton:(id)a3
{
  _TtC12GameCenterUI29ContinuePlayingEmptyStateView *v4;
  _TtC12GameCenterUI29ContinuePlayingEmptyStateView *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB7DB758();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1AB7964B0();

  sub_1AB473FBC((uint64_t)v6, (uint64_t *)&unk_1EEBFBCA0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29ContinuePlayingEmptyStateView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29ContinuePlayingEmptyStateView_button));
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI29ContinuePlayingEmptyStateView_buttonHandler));
}

@end
