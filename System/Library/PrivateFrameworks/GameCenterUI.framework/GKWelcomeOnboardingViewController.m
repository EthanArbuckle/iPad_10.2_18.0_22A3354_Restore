@implementation GKWelcomeOnboardingViewController

- (void)viewDidLoad
{
  GKWelcomeOnboardingViewController *v2;

  v2 = self;
  WelcomeOnboardingViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  GKWelcomeOnboardingViewController *v4;

  v4 = self;
  WelcomeOnboardingViewController.viewDidAppear(_:)(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  GKWelcomeOnboardingViewController *v4;

  v4 = self;
  WelcomeOnboardingViewController.viewIsAppearing(_:)(a3);

}

- (GKWelcomeOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1AB7DAF90();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (GKWelcomeOnboardingViewController *)WelcomeOnboardingViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (GKWelcomeOnboardingViewController)initWithCoder:(id)a3
{
  return (GKWelcomeOnboardingViewController *)WelcomeOnboardingViewController.init(coder:)((uint64_t)a3);
}

- (void).cxx_destruct
{
  sub_1AB62B7C8(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___GKWelcomeOnboardingViewController____lazy_storage___privacyLinkController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKWelcomeOnboardingViewController____lazy_storage___welcomeOnboardingView));
}

@end
