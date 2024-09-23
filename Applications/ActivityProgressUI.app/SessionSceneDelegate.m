@implementation SessionSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC18ActivityProgressUI20SessionSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000075E0(v8, v9);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC18ActivityProgressUI20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000085B0(v4, "SessionSceneDelegate: sceneDidDisconnect with role: %s, activity identifier: %s");

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC18ActivityProgressUI20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100008244(v4);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC18ActivityProgressUI20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000085B0(v4, "SessionSceneDelegate: sceneWillResignActive with role: %s, activity identifier: %s");

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC18ActivityProgressUI20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000085B0(v4, "SessionSceneDelegate: sceneWillEnterForeground with role: %s, activity identifier: %s");

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC18ActivityProgressUI20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000085B0(v4, "SessionSceneDelegate: sceneDidEnterBackground with role: %s, activity identifier: %s");

}

- (_TtC18ActivityProgressUI20SessionSceneDelegate)init
{
  uint64_t v3;
  _TtC18ActivityProgressUI20SessionSceneDelegate *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window) = 0;
  v3 = OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_systemApertureElementProvidersByID;
  v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_1000049A8((uint64_t)&_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SessionSceneDelegate();
  return -[SessionSceneDelegate init](&v6, "init");
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_systemApertureElementProvidersByID));
}

@end
