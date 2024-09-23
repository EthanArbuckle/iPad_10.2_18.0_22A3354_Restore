@implementation ComingSoonViewController

- (void)loadView
{
  _TtC8AppStore24ComingSoonViewController *v2;

  v2 = self;
  sub_1002A30E4();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore24ComingSoonViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[ComingSoonViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (_TtC8AppStore24ComingSoonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC8AppStore24ComingSoonViewController *v11;
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
  v13.super_class = (Class)type metadata accessor for ComingSoonViewController();
  v11 = -[ComingSoonViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC8AppStore24ComingSoonViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ComingSoonViewController();
  return -[ComingSoonViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
