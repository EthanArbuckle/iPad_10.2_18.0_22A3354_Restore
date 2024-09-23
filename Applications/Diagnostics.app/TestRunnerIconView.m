@implementation TestRunnerIconView

- (_TtC11Diagnostics18TestRunnerIconView)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics18TestRunnerIconView *)sub_100063B58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics18TestRunnerIconView)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics18TestRunnerIconView *)sub_100063C6C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics18TestRunnerIconView_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics18TestRunnerIconView_checkmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics18TestRunnerIconView_imageView));
}

@end
