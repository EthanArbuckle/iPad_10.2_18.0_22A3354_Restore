@implementation ICSCarPlayAlertViewController

- (_TtP13InCallService34CarPlayAlertViewControllerDelegate_)delegate
{
  return (_TtP13InCallService34CarPlayAlertViewControllerDelegate_ *)(id)sub_10017D430();
}

- (void)setDelegate:(id)a3
{
  ICSCarPlayAlertViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10017D48C((uint64_t)a3);

}

- (void)loadView
{
  ICSCarPlayAlertViewController *v2;

  v2 = self;
  sub_10017D510();

}

- (void)viewDidLoad
{
  ICSCarPlayAlertViewController *v2;

  v2 = self;
  sub_10017D590();

}

- (void)viewWillDisappear:(BOOL)a3
{
  ICSCarPlayAlertViewController *v4;

  v4 = self;
  sub_10017D6CC(a3);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  ICSCarPlayAlertViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10017D778(v6, (uint64_t)v7);

}

- (void)playSound
{
  ICSCarPlayAlertViewController *v2;

  v2 = self;
  sub_10017E024((SEL *)&selRef_shouldPlaySound);

}

- (void)callAgain
{
  ICSCarPlayAlertViewController *v2;

  v2 = self;
  sub_10017E024((SEL *)&selRef_shouldCallAgain);

}

- (void)closeAlert
{
  ICSCarPlayAlertViewController *v2;

  v2 = self;
  sub_10017E0AC();

}

- (ICSCarPlayAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (ICSCarPlayAlertViewController *)sub_10017E0F8(v5, v7, a4);
}

- (ICSCarPlayAlertViewController)initWithCoder:(id)a3
{
  return (ICSCarPlayAlertViewController *)sub_10017E1F4(a3);
}

- (void).cxx_destruct
{
  sub_100123A08((uint64_t)self + OBJC_IVAR___ICSCarPlayAlertViewController_delegate);
}

@end
