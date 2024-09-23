@implementation RootViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC24AuthenticationServicesUI18RootViewController *v4;

  v4 = self;
  sub_1000049CC(a3);

}

- (_TtC24AuthenticationServicesUI18RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC24AuthenticationServicesUI18RootViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for RootViewController();
  v11 = -[RootViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC24AuthenticationServicesUI18RootViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  return -[RootViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController));
}

@end
