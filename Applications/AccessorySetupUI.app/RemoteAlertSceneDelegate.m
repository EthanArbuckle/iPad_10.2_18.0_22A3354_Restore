@implementation RemoteAlertSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16AccessorySetupUI24RemoteAlertSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100026974(v8, v9);

}

- (void)sceneDidBecomeActive:(id)a3
{
  void *v3;
  _TtC16AccessorySetupUI24RemoteAlertSceneDelegate *v5;
  _TtC16AccessorySetupUI24RemoteAlertSceneDelegate *v6;
  _TtC16AccessorySetupUI24RemoteAlertSceneDelegate *v7;
  uint64_t v8;
  _TtC16AccessorySetupUI24RemoteAlertSceneDelegate *v9;

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16AccessorySetupUI24RemoteAlertSceneDelegate_window);
  if (v3)
  {
    v5 = (_TtC16AccessorySetupUI24RemoteAlertSceneDelegate *)a3;
    v6 = self;
    v7 = (_TtC16AccessorySetupUI24RemoteAlertSceneDelegate *)objc_msgSend(v3, "rootViewController");
    if (v7)
    {
      v9 = v7;
      v8 = type metadata accessor for ASUIRootViewController();
      if (swift_dynamicCastClass(v9, v8))
        sub_100002F2C();

      v5 = v6;
    }
    else
    {
      v9 = v6;
    }

  }
}

- (_TtC16AccessorySetupUI24RemoteAlertSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16AccessorySetupUI24RemoteAlertSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return -[RemoteAlertSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI24RemoteAlertSceneDelegate_window));
}

@end
