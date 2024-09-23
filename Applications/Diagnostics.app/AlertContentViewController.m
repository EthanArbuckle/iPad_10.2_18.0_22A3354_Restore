@implementation AlertContentViewController

- (void)viewDidLayoutSubviews
{
  id v2;
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize v12;
  CGSize v13;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AlertContentViewController();
  v2 = v11.receiver;
  -[AlertContentViewController viewDidLayoutSubviews](&v11, "viewDidLayoutSubviews");
  v3 = objc_msgSend(v2, "view", v11.receiver, v11.super_class);
  if (v3)
  {
    v6 = v3;
    LODWORD(v4) = 1112014848;
    LODWORD(v5) = 1112014848;
    objc_msgSend(v3, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 1.79769313e308, 1.79769313e308, v4, v5);
    v8 = v7;
    v10 = v9;

    objc_msgSend(v2, "preferredContentSize");
    v13.width = v8;
    v13.height = v10;
    if (!CGSizeEqualToSize(v12, v13))
      objc_msgSend(v2, "setPreferredContentSize:", v8, v10);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC11Diagnostics26AlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  _TtC11Diagnostics26AlertContentViewController *v18;
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
  v20.super_class = (Class)type metadata accessor for AlertContentViewController();
  v18 = -[AlertContentViewController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", v9, a4);

  return v18;
}

- (_TtC11Diagnostics26AlertContentViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AlertContentViewController();
  return -[AlertContentViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
