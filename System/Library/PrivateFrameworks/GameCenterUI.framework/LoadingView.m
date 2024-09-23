@implementation LoadingView

- (_TtC12GameCenterUI11LoadingView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI11LoadingView *)sub_1AB550618(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI11LoadingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB550774();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI11LoadingView *v2;

  v2 = self;
  sub_1AB55082C();

}

- (void)didMoveToWindow
{
  _TtC12GameCenterUI11LoadingView *v2;

  v2 = self;
  sub_1AB5509B8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI11LoadingView_loadingIndicator));
}

@end
