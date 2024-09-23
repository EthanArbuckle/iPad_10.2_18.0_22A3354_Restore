@implementation VSClusterViewController

- (void)viewDidLoad
{
  _TtC12AutoSettings23VSClusterViewController *v2;

  v2 = self;
  sub_1000168A8();

}

- (_TtC12AutoSettings23VSClusterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC12AutoSettings23VSClusterViewController *v11;
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
  v13.super_class = (Class)type metadata accessor for VSClusterViewController();
  v11 = -[VSClusterViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC12AutoSettings23VSClusterViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VSClusterViewController();
  return -[VSClusterViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
