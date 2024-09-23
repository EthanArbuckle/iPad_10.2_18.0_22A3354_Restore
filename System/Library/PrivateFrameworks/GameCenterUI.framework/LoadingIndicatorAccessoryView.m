@implementation LoadingIndicatorAccessoryView

- (_TtC12GameCenterUI29LoadingIndicatorAccessoryView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI29LoadingIndicatorAccessoryView *)sub_1AB5B394C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI29LoadingIndicatorAccessoryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5B3A5C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC12GameCenterUI29LoadingIndicatorAccessoryView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1AB5B3AF8(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI29LoadingIndicatorAccessoryView *v2;

  v2 = self;
  sub_1AB5B3BD4();

}

- (void)didMoveToSuperview
{
  _TtC12GameCenterUI29LoadingIndicatorAccessoryView *v2;

  v2 = self;
  sub_1AB5B3D5C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29LoadingIndicatorAccessoryView_loadingIndicator));
}

@end
