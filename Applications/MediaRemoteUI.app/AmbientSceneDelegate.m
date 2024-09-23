@implementation AmbientSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI20AmbientSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000114C0(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC13MediaRemoteUI20AmbientSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100011AA4();

}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_10000C920(self, (uint64_t)a2, a3, (uint64_t)"AmbientScene will enter foreground", 34);
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_10000C920(self, (uint64_t)a2, a3, (uint64_t)"AmbientScene did enter background", 33);
}

- (_TtC13MediaRemoteUI20AmbientSceneDelegate)init
{
  return (_TtC13MediaRemoteUI20AmbientSceneDelegate *)sub_100011308();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_dependency));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_lockscreenCoordinator));
  sub_10000FAD4((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_isBackdropActiveCancellable);
}

@end
