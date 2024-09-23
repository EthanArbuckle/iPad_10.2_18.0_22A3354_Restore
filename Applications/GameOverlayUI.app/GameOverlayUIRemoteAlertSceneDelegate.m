@implementation GameOverlayUIRemoteAlertSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000B1840(v8);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000B34E0();

}

- (void)sceneWillResignActive:(id)a3
{
  sub_1000AD510(self, (uint64_t)a2, a3, "Remote alert scene sceneWillResignActive");
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_1000AD510(self, (uint64_t)a2, a3, "Remote alert scene sceneWillEnterForeground");
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_1000AD510(self, (uint64_t)a2, a3, "Remote alert scene sceneDidEnterBackground");
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000B367C();

}

- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3
{
  sub_1000AD510(self, (uint64_t)a2, a3, "Remote alert scene sceneDidDisconnect");
}

- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  _TtC13GameOverlayUI20GameOverlayUIService *v9;
  id v10;
  _TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate *v11;
  SEL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = sub_1000509C8(0, &qword_100111618, SBUIRemoteAlertButtonAction_ptr);
  v8 = sub_1000AFC44();
  v9 = (_TtC13GameOverlayUI20GameOverlayUIService *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_1000B375C(v9);

  swift_bridgeObjectRelease(v9, v12, v13, v14, v15, v16, v17, v18);
}

- (_TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate)init
{
  return (_TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate *)sub_1000AD698((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window));
}

@end
