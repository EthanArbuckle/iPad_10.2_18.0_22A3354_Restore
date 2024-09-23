@implementation ICSVideoMessageRootViewController

- (ICSVideoMessageRootViewController)initWithViewModel:(id)a3
{
  return (ICSVideoMessageRootViewController *)sub_100149760(a3);
}

- (ICSVideoMessageRootViewController)initWithCoder:(id)a3
{
  sub_100149814();
}

- (void)viewDidLoad
{
  ICSVideoMessageRootViewController *v2;

  v2 = self;
  sub_100149878();

}

- (ICSVideoMessageRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_100149CB4();
}

- (void).cxx_destruct
{

}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  ICSVideoMessageRootViewController *v5;

  v5 = self;
  sub_100149D64((uint64_t)v5, a4);

}

@end
