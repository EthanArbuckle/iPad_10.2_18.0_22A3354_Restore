@implementation FBKEnhancedLoggingViewController

- (_TtC12FeedbackCore32FBKEnhancedLoggingViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC12FeedbackCore32FBKEnhancedLoggingViewController *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_matcherPredicatesUsed) = 0;
  v5 = a3;

  result = (_TtC12FeedbackCore32FBKEnhancedLoggingViewController *)sub_21DAC4DA4();
  __break(1u);
  return result;
}

- (_TtC12FeedbackCore32FBKEnhancedLoggingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  _TtC12FeedbackCore32FBKEnhancedLoggingViewController *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_matcherPredicatesUsed) = 0;
  v6 = a4;

  result = (_TtC12FeedbackCore32FBKEnhancedLoggingViewController *)sub_21DAC4DA4();
  __break(1u);
  return result;
}

- (_TtC12FeedbackCore32FBKEnhancedLoggingViewController)init
{
  _TtC12FeedbackCore32FBKEnhancedLoggingViewController *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_matcherPredicatesUsed) = 0;

  result = (_TtC12FeedbackCore32FBKEnhancedLoggingViewController *)sub_21DAC4DA4();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC12FeedbackCore32FBKEnhancedLoggingViewController *v2;

  v2 = self;
  sub_21DA9DEB4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_modalQuestion));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_devicesController));
  sub_21DA5AE8C((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_delegate);
  swift_bridgeObjectRelease();
}

@end
