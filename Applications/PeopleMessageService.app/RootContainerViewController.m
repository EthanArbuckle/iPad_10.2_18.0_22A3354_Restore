@implementation RootContainerViewController

- (void)loadView
{
  void *v3;
  _TtC20PeopleMessageService27RootContainerViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self(UIBlurEffect);
  v4 = self;
  v5 = objc_msgSend(v3, "effectWithStyle:", 8);
  v6 = objc_msgSend(objc_allocWithZone((Class)UIVisualEffectView), "initWithEffect:", v5);

  -[RootContainerViewController setView:](v4, "setView:", v6);
}

- (_TtC20PeopleMessageService27RootContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC20PeopleMessageService27RootContainerViewController *v11;
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
  v13.super_class = (Class)type metadata accessor for RootContainerViewController();
  v11 = -[RootContainerViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC20PeopleMessageService27RootContainerViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootContainerViewController();
  return -[RootContainerViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
