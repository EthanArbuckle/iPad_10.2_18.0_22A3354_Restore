@implementation RemoteAlertSceneDelegate

- (UIWindow)window
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window, v4, 0, 0);
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10CoreAuthUI24RemoteAlertSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000296BC(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC10CoreAuthUI24RemoteAlertSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100028D38(v4);

}

- (void)sceneDidBecomeActive:(id)a3
{
  uint64_t (*v4)(void);
  _TtC10CoreAuthUI24RemoteAlertSceneDelegate *v5;
  uint64_t v6;
  _TtC10CoreAuthUI24RemoteAlertSceneDelegate *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC10CoreAuthUI24RemoteAlertSceneDelegate *v12;
  _TtC10CoreAuthUI24RemoteAlertSceneDelegate *v13;

  v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.isa) + 0x70);
  v5 = (_TtC10CoreAuthUI24RemoteAlertSceneDelegate *)a3;
  v13 = self;
  v6 = v4();
  if (v6)
  {
    v7 = (_TtC10CoreAuthUI24RemoteAlertSceneDelegate *)v6;
    v8 = objc_opt_self(SBSUIRemoteAlertScene);
    v9 = swift_dynamicCastObjCClass(v5, v8);
    if (v9)
    {
      v10 = (void *)v9;
      v5 = v5;
      v11 = sub_100028F60(v10);
      v12 = (_TtC10CoreAuthUI24RemoteAlertSceneDelegate *)objc_msgSend(objc_allocWithZone((Class)LACUIScenePresentationRequest), "initWithUserInterfaceRequest:", v11);

      (*(void (**)(_TtC10CoreAuthUI24RemoteAlertSceneDelegate *))((swift_isaMask & (uint64_t)v7->super.super.isa)
                                                                           + 0x50))(v12);

      v13 = v5;
      v7 = v12;
    }

    v5 = v13;
    v13 = v7;
  }

}

- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _TtC10CoreAuthUI24RemoteAlertSceneDelegate *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v7 = sub_1000287F0(0, &qword_100090D08, SBUIRemoteAlertButtonAction_ptr);
  v8 = sub_100029830();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v14 = a3;
  v10 = self;
  sub_100029218(v9);
  if ((v11 & 1) != 0
    && (v12 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v10->super.super.isa) + 0x70))(v11)) != 0)
  {
    v13 = v12;
    objc_msgSend(v12, "handleSceneButton:", 0, v14);

    swift_bridgeObjectRelease(v9);
  }
  else
  {

    swift_bridgeObjectRelease(v9);
  }

}

- (_TtC10CoreAuthUI24RemoteAlertSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return -[RemoteAlertSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
