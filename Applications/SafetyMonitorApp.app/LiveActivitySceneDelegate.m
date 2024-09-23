@implementation LiveActivitySceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16SafetyMonitorApp25LiveActivitySceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000E898(v8);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC16SafetyMonitorApp25LiveActivitySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000F2F8("%@,sceneDidBecomeActive,requesting resize");

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC16SafetyMonitorApp25LiveActivitySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000F2F8("%@,sceneWillEnterForeground,requesting resize");

}

- (_TtC16SafetyMonitorApp25LiveActivitySceneDelegate)init
{
  return (_TtC16SafetyMonitorApp25LiveActivitySceneDelegate *)sub_10000E0BC();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate____lazy_storage___systemApertureElementProvider));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_cancellableSet));
}

@end
