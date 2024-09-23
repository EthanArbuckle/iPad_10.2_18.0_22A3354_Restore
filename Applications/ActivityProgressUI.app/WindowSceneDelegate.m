@implementation WindowSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC18ActivityProgressUI19WindowSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10002CC44(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  sub_10002CA90(self, (uint64_t)a2, a3, "WindowSceneDelegate: sceneDidDisconnect");
}

- (void)sceneDidBecomeActive:(id)a3
{
  sub_10002CA90(self, (uint64_t)a2, a3, "WindowSceneDelegate: sceneDidBecomeActive");
}

- (void)sceneWillResignActive:(id)a3
{
  sub_10002CA90(self, (uint64_t)a2, a3, "WindowSceneDelegate: sceneWillResignActive");
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_10002CA90(self, (uint64_t)a2, a3, "WindowSceneDelegate: sceneWillEnterForeground");
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_10002CA90(self, (uint64_t)a2, a3, "WindowSceneDelegate: sceneDidEnterBackground");
}

- (_TtC18ActivityProgressUI19WindowSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window) = 0;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_testAppView) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WindowSceneDelegate();
  return -[WindowSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
