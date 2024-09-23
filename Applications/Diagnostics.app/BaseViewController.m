@implementation BaseViewController

- (void)viewDidLoad
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BaseViewController();
  v2 = v6.receiver;
  v3 = -[BaseViewController viewDidLoad](&v6, "viewDidLoad");
  v4 = (*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x50))(v3);
  v5 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v2) + 0x58))(v4);
  (*(void (**)(uint64_t))((swift_isaMask & *v2) + 0x60))(v5);

}

- (_TtC11Diagnostics18BaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC11Diagnostics18BaseViewController *v11;
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
  v13.super_class = (Class)type metadata accessor for BaseViewController();
  v11 = -[BaseViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC11Diagnostics18BaseViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BaseViewController();
  return -[BaseViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
