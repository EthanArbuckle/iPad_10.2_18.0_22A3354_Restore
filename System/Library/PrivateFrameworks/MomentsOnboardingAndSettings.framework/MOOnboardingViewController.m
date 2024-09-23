@implementation MOOnboardingViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for MOOnboardingViewController();
  -[OBBaseWelcomeController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *v4;

  v4 = self;
  MOOnboardingViewController.viewDidAppear(_:)(a3);

}

- (void)privacyAboutTapped
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *v5;
  _TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *v6;
  _TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *v7;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier);
  v3 = *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier);
  v7 = self;
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x2426A69DC](v2, v3);
  swift_bridgeObjectRelease();
  v5 = (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *)objc_msgSend((id)objc_opt_self(), sel_presenterForPrivacySplashWithIdentifier_, v4);

  if (v5)
  {
    -[MOOnboardingViewController setPresentingViewController:](v5, sel_setPresentingViewController_, v7);
    -[MOOnboardingViewController present](v5, sel_present);

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }

}

- (void)notNowCloseSheet
{
  _TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *v2;

  v2 = self;
  MOOnboardingViewController.notNowCloseSheet()();

}

- (void)turnOnSuggestionsButtonTapped
{
  _TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *v2;

  v2 = self;
  MOOnboardingViewController.turnOnSuggestionsButtonTapped()();

}

- (void)customizeButtonTapped
{
  _TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *v2;

  v2 = self;
  MOOnboardingViewController.customizeButtonTapped()();

}

- (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *result;

  result = (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *result;

  v6 = a5;
  result = (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton));
}

@end
