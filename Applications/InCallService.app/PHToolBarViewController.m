@implementation PHToolBarViewController

- (_TtC13InCallService23PHToolBarViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC13InCallService23PHToolBarViewController *)sub_10019A43C(v5, v7, a4);
}

- (_TtC13InCallService23PHToolBarViewController)initWithCoder:(id)a3
{
  return (_TtC13InCallService23PHToolBarViewController *)sub_10019A514(a3);
}

@end
