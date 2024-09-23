@implementation ActivityFeedHeaderView

- (_TtC12GameCenterUI22ActivityFeedHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI22ActivityFeedHeaderView *)sub_1AB5C3290(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI22ActivityFeedHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5C36A8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI22ActivityFeedHeaderView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB5C3748();
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
  _TtC12GameCenterUI22ActivityFeedHeaderView *v2;

  v2 = self;
  sub_1AB5C37B0();

}

- (void)tapToRadarButton
{
  _TtC12GameCenterUI22ActivityFeedHeaderView *v2;

  v2 = self;
  sub_1AB5C3BDC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22ActivityFeedHeaderView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22ActivityFeedHeaderView_radarButton));
}

@end
