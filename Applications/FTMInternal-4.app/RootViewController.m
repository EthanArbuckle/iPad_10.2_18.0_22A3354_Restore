@implementation RootViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  NSString v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RootViewController();
  v2 = v7.receiver;
  -[RootViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = String._bridgeToObjectiveC()();
    v6 = objc_msgSend((id)objc_opt_self(UIColor), "colorNamed:", v5);

    objc_msgSend(v4, "setBackgroundColor:", v6);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC13FTMInternal_418RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC13FTMInternal_418RootViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for RootViewController();
  v11 = -[RootViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC13FTMInternal_418RootViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  return -[RootViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
