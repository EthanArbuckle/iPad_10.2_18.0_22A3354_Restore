@implementation SVSItemDestinationAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  SVSItemDestinationAlertViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10017AE10, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_10005B9E4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1000814D8(a3, v6, v7);
  sub_100012F60((uint64_t)v6, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  SVSItemDestinationAlertViewController *v4;

  v4 = self;
  sub_1000822E8(a3, (uint64_t)v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  SVSItemDestinationAlertViewController *v4;

  v4 = self;
  sub_100082558(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (SVSItemDestinationAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (SVSItemDestinationAlertViewController *)sub_10008371C(v5, v7, a4);
}

- (SVSItemDestinationAlertViewController)initWithCoder:(id)a3
{
  return (SVSItemDestinationAlertViewController *)sub_100083860(a3);
}

- (void).cxx_destruct
{

  sub_10000D858((uint64_t)self + OBJC_IVAR___SVSItemDestinationAlertViewController_viewModel, &qword_1001A65A8);
}

@end
