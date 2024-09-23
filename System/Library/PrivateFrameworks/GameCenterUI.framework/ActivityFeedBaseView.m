@implementation ActivityFeedBaseView

- (_TtC12GameCenterUI20ActivityFeedBaseView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI20ActivityFeedBaseView *)sub_1AB550EE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI20ActivityFeedBaseView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB551048();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI20ActivityFeedBaseView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1AB55110C();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI20ActivityFeedBaseView *v2;

  v2 = self;
  sub_1AB551228();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI20ActivityFeedBaseView_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI20ActivityFeedBaseView_sharedView));
}

@end
