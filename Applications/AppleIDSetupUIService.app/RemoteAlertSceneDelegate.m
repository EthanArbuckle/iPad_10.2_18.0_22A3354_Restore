@implementation RemoteAlertSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000A650(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  sub_100009BEC(self, (uint64_t)a2, a3, "RemoteAlertSceneDelegate: sceneDidDisconnect");
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000AF90();

}

- (void)sceneWillResignActive:(id)a3
{
  sub_100009BEC(self, (uint64_t)a2, a3, "RemoteAlertSceneDelegate: sceneWillResignActive");
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_100009BEC(self, (uint64_t)a2, a3, "RemoteAlertSceneDelegate: sceneWillEnterForeground");
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_100009BEC(self, (uint64_t)a2, a3, "RemoteAlertSceneDelegate: sceneDidEnterBackground");
}

- (_TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_presentationRequest;
  v4 = type metadata accessor for PresentationRequest(0);
  swift_storeEnumTagMultiPayload(v3, v4, 2);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate(0);
  return -[RemoteAlertSceneDelegate init](&v6, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window));
  sub_100005C4C((uint64_t)self + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_presentationRequest);
}

@end
