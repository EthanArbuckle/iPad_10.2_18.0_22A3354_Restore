@implementation AppStoreLockupView

- (_TtC12GameCenterUI18AppStoreLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI18AppStoreLockupView *)sub_1AB475E14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI18AppStoreLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB47612C();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI18AppStoreLockupView *v2;

  v2 = self;
  sub_1AB476208();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC12GameCenterUI18AppStoreLockupView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1AB4763A0((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18AppStoreLockupView_appStoreLockup));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18AppStoreLockupView_appStoreLockupSize));
}

@end
