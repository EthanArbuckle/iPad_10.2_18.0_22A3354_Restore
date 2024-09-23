@implementation FirstAlertViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for FirstAlertViewController();
  -[FirstAlertViewController viewDidLoad](&v2, "viewDidLoad");
}

- (_TtC23NewDeviceSetupUIService24FirstAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC23NewDeviceSetupUIService24FirstAlertViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
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
  v13.super_class = (Class)type metadata accessor for FirstAlertViewController();
  v11 = -[FirstAlertViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC23NewDeviceSetupUIService24FirstAlertViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FirstAlertViewController();
  return -[FirstAlertViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
