@implementation CircularProgressBarView

- (_TtC12GameCenterUI23CircularProgressBarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB61F4D4();
}

- (_TtC12GameCenterUI23CircularProgressBarView)initWithFrame:(CGRect)a3
{
  sub_1AB61F5C8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23CircularProgressBarView_circleLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23CircularProgressBarView_progressLayer));
}

@end
