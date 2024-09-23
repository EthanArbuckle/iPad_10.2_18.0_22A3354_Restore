@implementation ActivityFeedLoadMoreView

- (_TtC12GameCenterUI24ActivityFeedLoadMoreView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI24ActivityFeedLoadMoreView *)sub_1AB57B140(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI24ActivityFeedLoadMoreView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB57B280();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI24ActivityFeedLoadMoreView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB57B31C();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI24ActivityFeedLoadMoreView *v2;

  v2 = self;
  sub_1AB57B39C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24ActivityFeedLoadMoreView_loadingIndicator));
}

@end
