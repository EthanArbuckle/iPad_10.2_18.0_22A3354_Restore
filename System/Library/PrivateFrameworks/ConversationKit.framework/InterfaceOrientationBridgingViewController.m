@implementation InterfaceOrientationBridgingViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC15ConversationKit42InterfaceOrientationBridgingViewController *v2;

  v2 = self;
  InterfaceOrientationBridgingViewController.viewDidLoad()();

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v5;

  v5 = a3;
  InterfaceOrientationBridgingViewController.viewDidMove(to:shouldAppearOrDisappear:)((UIWindow_optional *)self, 0);
}

- (_TtC15ConversationKit42InterfaceOrientationBridgingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC15ConversationKit42InterfaceOrientationBridgingViewController *result;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  InterfaceOrientationBridgingViewController.init(nibName:bundle:)(v5, v7, a4);
  return result;
}

- (_TtC15ConversationKit42InterfaceOrientationBridgingViewController)initWithCoder:(id)a3
{
  _TtC15ConversationKit42InterfaceOrientationBridgingViewController *result;

  InterfaceOrientationBridgingViewController.init(coder:)(a3);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
