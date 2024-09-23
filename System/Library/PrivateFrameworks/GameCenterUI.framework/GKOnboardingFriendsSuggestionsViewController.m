@implementation GKOnboardingFriendsSuggestionsViewController

- (GKOnboardingFriendsSuggestionsViewController)initWithGameBundleId:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = sub_1AB7DAF90();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (GKOnboardingFriendsSuggestionsViewController *)OnboardingFriendsSuggestionsViewController.init(gameBundleId:)(v3, v4);
}

- (GKOnboardingFriendsSuggestionsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4A3B54();
}

- (void)loadView
{
  GKOnboardingFriendsSuggestionsViewController *v2;

  v2 = self;
  OnboardingFriendsSuggestionsViewController.loadView()();

}

- (void)viewWillAppear:(BOOL)a3
{
  GKOnboardingFriendsSuggestionsViewController *v4;

  v4 = self;
  OnboardingFriendsSuggestionsViewController.viewWillAppear(_:)(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  GKOnboardingFriendsSuggestionsViewController *v4;

  v4 = self;
  OnboardingFriendsSuggestionsViewController.viewIsAppearing(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  GKOnboardingFriendsSuggestionsViewController *v4;

  v4 = self;
  OnboardingFriendsSuggestionsViewController.viewWillDisappear(_:)(a3);

}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  GKOnboardingFriendsSuggestionsViewController *v4;
  UIScrollView_optional *v5;
  void *v6;
  void *v7;

  v4 = self;
  OnboardingFriendsSuggestionsViewController.contentScrollView(for:)(v5, a3);
  v7 = v6;

  return v7;
}

- (GKOnboardingFriendsSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  OnboardingFriendsSuggestionsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR___GKOnboardingFriendsSuggestionsViewController_hostingController);
  swift_release();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR___GKOnboardingFriendsSuggestionsViewController_game);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR___GKOnboardingFriendsSuggestionsViewController_dataUpdateDelegate);
  sub_1AB473FBC((uint64_t)self + OBJC_IVAR___GKOnboardingFriendsSuggestionsViewController____lazy_storage___metricsContext, (uint64_t *)&unk_1EEBFDA00);
  OUTLINED_FUNCTION_0_10();
}

@end
