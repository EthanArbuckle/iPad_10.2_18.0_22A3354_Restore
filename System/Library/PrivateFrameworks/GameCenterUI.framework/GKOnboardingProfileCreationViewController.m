@implementation GKOnboardingProfileCreationViewController

- (void)loadView
{
  GKOnboardingProfileCreationViewController *v2;

  v2 = self;
  OnboardingProfileCreationViewController.loadView()();

}

- (void)viewWillAppear:(BOOL)a3
{
  GKOnboardingProfileCreationViewController *v4;

  v4 = self;
  OnboardingProfileCreationViewController.viewWillAppear(_:)(a3);

}

- (GKOnboardingProfileCreationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (GKOnboardingProfileCreationViewController *)OnboardingProfileCreationViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (GKOnboardingProfileCreationViewController)initWithCoder:(id)a3
{
  return (GKOnboardingProfileCreationViewController *)OnboardingProfileCreationViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKOnboardingProfileCreationViewController_hostingController));
}

@end
