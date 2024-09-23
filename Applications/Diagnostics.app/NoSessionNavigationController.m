@implementation NoSessionNavigationController

- (void)viewDidLoad
{
  _TtC11Diagnostics29NoSessionNavigationController *v2;

  v2 = self;
  sub_1000CE420();

}

- (_TtC11Diagnostics29NoSessionNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NoSessionNavigationController();
  return -[NoSessionNavigationController initWithNavigationBarClass:toolbarClass:](&v7, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (_TtC11Diagnostics29NoSessionNavigationController)initWithRootViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoSessionNavigationController();
  return -[NoSessionNavigationController initWithRootViewController:](&v5, "initWithRootViewController:", a3);
}

- (_TtC11Diagnostics29NoSessionNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  DARootViewController *v6;
  DARootViewController *v7;
  id v8;
  NSString v9;
  SEL v10;
  id v11;
  int v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _TtC11Diagnostics29NoSessionNavigationController *v18;
  objc_super v20;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    v17 = a4;
    v9 = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for NoSessionNavigationController();
  v18 = -[NoSessionNavigationController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", v9, a4);

  return v18;
}

- (_TtC11Diagnostics29NoSessionNavigationController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoSessionNavigationController();
  return -[NoSessionNavigationController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
