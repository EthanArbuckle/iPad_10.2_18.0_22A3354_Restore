@implementation RPSessionPlatterSceneDelegate

- (UIWindow)window
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window, v4, 0, 0);
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100021B24(v8);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000223E4(0xD000000000000018, 0x800000010002FC80);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100022180();

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000223E4(0xD00000000000001CLL, 0x800000010002FC40);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000223E4(0xD00000000000001BLL, 0x800000010002FC20);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100022624();

}

- (_TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RPSessionPlatterSceneDelegate();
  return -[RPSessionPlatterSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion));
}

@end
