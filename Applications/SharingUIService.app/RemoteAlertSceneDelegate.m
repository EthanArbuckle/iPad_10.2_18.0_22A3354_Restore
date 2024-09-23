@implementation RemoteAlertSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16SharingUIService24RemoteAlertSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100015BBC(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  sub_10001506C(self, (uint64_t)a2, a3, "RemoteAlertSceneDelegate: sceneDidDisconnect");
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC16SharingUIService24RemoteAlertSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000165E8();

}

- (void)sceneWillResignActive:(id)a3
{
  sub_10001506C(self, (uint64_t)a2, a3, "RemoteAlertSceneDelegate: sceneWillResignActive");
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_10001506C(self, (uint64_t)a2, a3, "RemoteAlertSceneDelegate: sceneWillEnterForeground");
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_10001506C(self, (uint64_t)a2, a3, "RemoteAlertSceneDelegate: sceneDidEnterBackground");
}

- (_TtC16SharingUIService24RemoteAlertSceneDelegate)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_presentationRequest;
  v4 = type metadata accessor for SFRemoteAlertPresentationRequest(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate(0);
  return -[RemoteAlertSceneDelegate init](&v6, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window));
  sub_100016F80((uint64_t)self + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_presentationRequest);
}

- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  _TtC16SharingUIService24RemoteAlertSceneDelegate *v12;

  v7 = sub_100015B38(0, (uint64_t)a2);
  v9 = sub_100015B74(v7, v8);
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v9);
  v11 = a3;
  v12 = self;
  sub_100016858(v11, v10);

  swift_bridgeObjectRelease(v10);
}

@end
