@implementation RPRemoteAlertSceneDelegate

- (UIWindow)window
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window, v4, 0, 0);
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  char *v8;
  id v9;
  id v10;
  _TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate *v11;

  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100023C64(v8);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100024558();

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000223E4(0xD000000000000019, 0x800000010002FC60);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000223E4(0xD00000000000001CLL, 0x800000010002FC40);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000223E4(0xD00000000000001BLL, 0x800000010002FC20);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000248F4();

}

- (_TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RPRemoteAlertSceneDelegate();
  return -[RPRemoteAlertSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
