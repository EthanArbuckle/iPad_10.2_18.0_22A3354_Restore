@implementation RemoteAlertSceneDelegate

- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC13MediaRemoteUI24RemoteAlertSceneDelegate *v11;

  v7 = sub_100008314(0, &qword_100059330, SBUIRemoteAlertButtonAction_ptr);
  v8 = sub_100009B04();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_100009FE0(v10, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI24RemoteAlertSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000134D4(v8, (uint64_t)v9, (uint64_t)v10);

}

- (void)sceneDidDisconnect:(id)a3
{
  sub_100013804((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_sceneDidDisconnect_);
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_100013804((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_sceneWillEnterForeground_);
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_100013804((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_sceneDidEnterBackground_);
}

- (void)sceneDidBecomeActive:(id)a3
{
  sub_100013804((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_sceneDidBecomeActive_);
}

- (void)sceneWillResignActive:(id)a3
{
  sub_100013804((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_sceneWillResignActive_);
}

- (_TtC13MediaRemoteUI24RemoteAlertSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI24RemoteAlertSceneDelegate_underlyingSceneDelegate) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return -[RemoteAlertSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13MediaRemoteUI24RemoteAlertSceneDelegate_underlyingSceneDelegate));
}

@end
