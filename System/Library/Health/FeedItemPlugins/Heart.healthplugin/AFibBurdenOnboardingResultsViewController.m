@implementation AFibBurdenOnboardingResultsViewController

- (void)dealloc
{
  void *v2;
  _TtC5Heart41AFibBurdenOnboardingResultsViewController *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_scrollViewObserver);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_scrollViewObserver) = 0;
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AFibBurdenOnboardingResultsViewController();
  -[AFibBurdenOnboardingResultsViewController dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_2312D2854((uint64_t)self + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_scrollViewObserver));
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  _TtC5Heart41AFibBurdenOnboardingResultsViewController *v2;

  v2 = self;
  sub_2313B36B8();

}

- (void)hxui_primaryFooterButtonTapped
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC5Heart41AFibBurdenOnboardingResultsViewController *v6;

  v3 = (char *)self + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_delegate;
  if (MEMORY[0x2348DE3BC]((char *)self + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_delegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    sub_2314130CC();
  }
}

- (void)hxui_cancelButtonTapped
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC5Heart41AFibBurdenOnboardingResultsViewController *v6;

  v3 = (char *)self + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_delegate;
  if (MEMORY[0x2348DE3BC]((char *)self + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_delegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 16);
    v6 = self;
    v5();

    sub_2314130CC();
  }
}

- (_TtC5Heart41AFibBurdenOnboardingResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Heart41AFibBurdenOnboardingResultsViewController *result;

  result = (_TtC5Heart41AFibBurdenOnboardingResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart41AFibBurdenOnboardingResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Heart41AFibBurdenOnboardingResultsViewController *result;

  v6 = a5;
  result = (_TtC5Heart41AFibBurdenOnboardingResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  _TtC5Heart41AFibBurdenOnboardingResultsViewController *v2;

  v2 = self;
  sub_2313B4E3C();

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  _TtC5Heart41AFibBurdenOnboardingResultsViewController *v2;
  id v3;

  v2 = self;
  v3 = -[OBBaseWelcomeController navigationItem](v2, sel_navigationItem);
  objc_msgSend(v3, sel_setRightBarButtonItem_, 0);

}

@end
