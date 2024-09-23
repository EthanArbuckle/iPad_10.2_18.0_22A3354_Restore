@implementation PHUserFeedbackViewController

- (PHUserFeedbackViewController)initWithScoreController:(id)a3
{
  return (PHUserFeedbackViewController *)UserFeedbackViewController.init(scoreController:)((uint64_t)a3);
}

- (PHUserFeedbackViewController)init
{
  sub_10016676C();
}

- (PHUserFeedbackViewController)initWithCoder:(id)a3
{
  sub_1001667C4();
}

- (void)viewDidLoad
{
  PHUserFeedbackViewController *v2;

  v2 = self;
  UserFeedbackViewController.viewDidLoad()();

}

- (PHUserFeedbackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  UserFeedbackViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{

}

@end
