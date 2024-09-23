@implementation SessionSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC9AirDropUI20SessionSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10001F02C(v8, v9);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC9AirDropUI20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000204A4(v4);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC9AirDropUI20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002097C(v4, "SessionSceneDelegate: sceneDidBecomeActive with role: %s");

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC9AirDropUI20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002097C(v4, "SessionSceneDelegate: sceneWillResignActive with role: %s");

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC9AirDropUI20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002097C(v4, "SessionSceneDelegate: sceneWillEnterForeground with role: %s");

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC9AirDropUI20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002097C(v4, "SessionSceneDelegate: sceneDidEnterBackground with role: %s");

}

- (_TtC9AirDropUI20SessionSceneDelegate)init
{
  uint64_t v3;
  _TtC9AirDropUI20SessionSceneDelegate *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_window) = 0;
  v3 = OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_systemApertureElementProvidersByID;
  v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_10007D774((uint64_t)&_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SessionSceneDelegate();
  return -[SessionSceneDelegate init](&v6, "init");
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_systemApertureElementProvidersByID));
}

@end
