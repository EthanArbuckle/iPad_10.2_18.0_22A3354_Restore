@implementation TestRunnerView

- (UIStackView)stackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_stackView));
}

- (_TtC11Diagnostics14TestRunnerView)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics14TestRunnerView *)sub_100040868(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics14TestRunnerView)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics14TestRunnerView *)sub_100040C80(a3);
}

- (void)tintColorDidChange
{
  _TtC11Diagnostics14TestRunnerView *v2;

  v2 = self;
  sub_1000414D8();

}

- (void)skipPressed
{
  _TtC11Diagnostics14TestRunnerView *v2;

  v2 = self;
  sub_100042BB0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_runnerContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_buttonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_progressIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_skipButton));
  sub_1000432B4((uint64_t)self + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_delegate);
  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics14TestRunnerView_containerLayoutUpdateHandler), *(_QWORD *)&self->fontSizeTestRunner[OBJC_IVAR____TtC11Diagnostics14TestRunnerView_containerLayoutUpdateHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_idleTimeoutTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_buttonContainerShowingHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_buttonContainerHidingHeightConstraint));
}

@end
