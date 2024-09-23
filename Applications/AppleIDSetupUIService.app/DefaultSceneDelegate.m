@implementation DefaultSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC21AppleIDSetupUIService20DefaultSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21AppleIDSetupUIService20DefaultSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21AppleIDSetupUIService20DefaultSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC21AppleIDSetupUIService20DefaultSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100008FC4(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  sub_100008E24(self, (uint64_t)a2, a3, "DefaultSceneDelegate: sceneDidDisconnect");
}

- (void)sceneDidBecomeActive:(id)a3
{
  sub_100008E24(self, (uint64_t)a2, a3, "DefaultSceneDelegate: sceneDidBecomeActive");
}

- (void)sceneWillResignActive:(id)a3
{
  sub_100008E24(self, (uint64_t)a2, a3, "DefaultSceneDelegate: sceneWillResignActive");
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_100008E24(self, (uint64_t)a2, a3, "DefaultSceneDelegate: sceneWillEnterForeground");
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_100008E24(self, (uint64_t)a2, a3, "DefaultSceneDelegate: sceneDidEnterBackground");
}

- (_TtC21AppleIDSetupUIService20DefaultSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21AppleIDSetupUIService20DefaultSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DefaultSceneDelegate();
  return -[DefaultSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21AppleIDSetupUIService20DefaultSceneDelegate_window));
}

@end
