@implementation AppDistributionRemoteAlertSceneDelegate

- (UIWindow)window
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = type metadata accessor for MainActor(0, a2);
  v4 = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 29, v5, v7);
  v8 = self;
  v9 = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 29, v10, v12);
  v13 = objc_retain(*(id *)((char *)&v8->super.isa
                          + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window));
  swift_release(v4);

  swift_release(v9);
  return (UIWindow *)v13;
}

- (void)setWindow:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  _TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 29, v7, v9);
  v10 = (objc_class *)a3;
  v11 = self;
  v12 = static MainActor.shared.getter();
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v15 = v14;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 29, v13, v15);
  v16 = *(Class *)((char *)&v11->super.isa
                 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
  *(Class *)((char *)&v11->super.isa
           + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window) = v10;
  swift_release(v6);

  swift_release(v12);
}

- (_TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate)init
{
  return (_TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate *)sub_10000A920();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate *v17;

  v9 = type metadata accessor for MainActor(0, a2);
  v10 = static MainActor.shared.getter(v9);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  v13 = v12;
  if ((swift_task_isCurrentExecutor(v11) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 40, v11, v13);
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = self;
  sub_10000E79C(v14, (uint64_t)v17);
  swift_release(v10);

}

- (void)sceneDidBecomeActive:(id)a3
{
  sub_10000D680((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 64, "Remote alert scene sceneDidBecomeActive");
}

- (void)sceneWillResignActive:(id)a3
{
  sub_10000D680((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 68, "Remote alert scene sceneWillResignActive");
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_10000D680((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 72, "Remote alert scene sceneWillEnterForeground");
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_10000D680((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 76, "Remote alert scene sceneDidEnterBackground");
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate *v12;

  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 80, v7, v9);
  v10 = a3;
  v12 = self;
  sub_10000F2F0((uint64_t)v12, v11);
  swift_release(v6);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_bag));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_localizer));
}

@end
