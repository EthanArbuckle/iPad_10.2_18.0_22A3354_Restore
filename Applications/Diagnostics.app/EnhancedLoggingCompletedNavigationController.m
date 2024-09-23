@implementation EnhancedLoggingCompletedNavigationController

- (void)viewDidLoad
{
  _TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *v2;

  v2 = self;
  sub_10006D754();

}

- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  uint64_t ObjCClassMetadata;
  uint64_t v6;

  if (!a3)
  {
    ObjCClassMetadata = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *)sub_10006D938(ObjCClassMetadata, v6);
  }
  ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_getObjCClassMetadata(a4);
  return (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *)sub_10006D938(ObjCClassMetadata, v6);
}

- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithRootViewController:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *v8;
  _TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC11Diagnostics44EnhancedLoggingCompletedNavigationController_enhancedLoggingCompletedViewController;
  v6 = objc_allocWithZone((Class)type metadata accessor for EnhancedLoggingCompletedViewController());
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_10004E71C();

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for EnhancedLoggingCompletedNavigationController();
  v9 = -[EnhancedLoggingCompletedNavigationController initWithRootViewController:](&v11, "initWithRootViewController:", v7);

  return v9;
}

- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  DARootViewController *v6;
  DARootViewController *v7;
  uint64_t v8;
  id v9;
  _TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *v10;
  id v11;
  NSString v12;
  SEL v13;
  id v14;
  int v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *v20;
  objc_super v22;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = OBJC_IVAR____TtC11Diagnostics44EnhancedLoggingCompletedNavigationController_enhancedLoggingCompletedViewController;
  v9 = objc_allocWithZone((Class)type metadata accessor for EnhancedLoggingCompletedViewController());
  v10 = self;
  v11 = a4;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)sub_10004E71C();

  if (v7)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7, v13, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    v12 = 0;
  }
  v22.receiver = v10;
  v22.super_class = (Class)type metadata accessor for EnhancedLoggingCompletedNavigationController();
  v20 = -[EnhancedLoggingCompletedNavigationController initWithNibName:bundle:](&v22, "initWithNibName:bundle:", v12, v11);

  return v20;
}

- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *v8;
  _TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC11Diagnostics44EnhancedLoggingCompletedNavigationController_enhancedLoggingCompletedViewController;
  v6 = objc_allocWithZone((Class)type metadata accessor for EnhancedLoggingCompletedViewController());
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_10004E71C();

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for EnhancedLoggingCompletedNavigationController();
  v9 = -[EnhancedLoggingCompletedNavigationController initWithCoder:](&v11, "initWithCoder:", v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics44EnhancedLoggingCompletedNavigationController_enhancedLoggingCompletedViewController));
}

@end
