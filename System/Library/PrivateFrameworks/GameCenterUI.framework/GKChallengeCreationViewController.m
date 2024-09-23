@implementation GKChallengeCreationViewController

- (GKChallengeCreationViewController)init
{
  return (GKChallengeCreationViewController *)GKChallengeCreationViewController.init()();
}

- (GKChallengeCreationViewController)initWithBaseLeaderboardID:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  GKChallengeCreationViewController *result;

  v3 = sub_1AB7DAF90();
  GKChallengeCreationViewController.init(baseLeaderboardID:)(v3, v4);
  return result;
}

- (GKChallengeCreationViewController)initWithCoder:(id)a3
{
  sub_1AB66BEE8();
}

- (void)viewWillAppear:(BOOL)a3
{
  GKChallengeCreationViewController *v4;

  v4 = self;
  GKChallengeCreationViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  GKChallengeCreationViewController *v4;

  v4 = self;
  GKChallengeCreationViewController.viewWillDisappear(_:)(a3);

}

- (GKChallengeCreationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  GKChallengeCreationViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
