@implementation ProgressLockupView

- (_TtC12GameCenterUI18ProgressLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI18ProgressLockupView *)sub_1AB5ED634(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI18ProgressLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5ED798();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI18ProgressLockupView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB5ED870((uint64_t)v3);
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
  _TtC12GameCenterUI18ProgressLockupView *v2;

  v2 = self;
  sub_1AB5ED95C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18ProgressLockupView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18ProgressLockupView_progressBarView));
}

@end
