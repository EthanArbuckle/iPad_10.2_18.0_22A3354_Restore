@implementation ShareCardRemoteAlertViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC13InCallService34ShareCardRemoteAlertViewController *v4;

  v4 = self;
  sub_100136820(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC13InCallService34ShareCardRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC13InCallService34ShareCardRemoteAlertViewController *)sub_100136EA4(v5, v7, a4);
}

- (_TtC13InCallService34ShareCardRemoteAlertViewController)initWithCoder:(id)a3
{
  return (_TtC13InCallService34ShareCardRemoteAlertViewController *)sub_100136FA0(a3);
}

- (void).cxx_destruct
{

}

@end
