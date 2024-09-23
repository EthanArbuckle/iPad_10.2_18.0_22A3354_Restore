@implementation TapUISceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC22ProximityReaderSceneUI18TapUISceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000CAC4(v8, (uint64_t)v11);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC22ProximityReaderSceneUI18TapUISceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000DB48();

}

- (void)sceneDidBecomeActive:(id)a3
{
  sub_10000C648(self, (uint64_t)a2, a3, 0xD000000000000018, 0x8000000100012DF0);
}

- (void)sceneWillResignActive:(id)a3
{
  sub_10000C648(self, (uint64_t)a2, a3, 0xD000000000000019, 0x8000000100012DD0);
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_10000C648(self, (uint64_t)a2, a3, 0xD00000000000001CLL, 0x8000000100012DB0);
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_10000C648(self, (uint64_t)a2, a3, 0xD00000000000001BLL, 0x8000000100012D90);
}

- (_TtC22ProximityReaderSceneUI18TapUISceneDelegate)init
{
  uint64_t v3;
  id v4;
  _TtC22ProximityReaderSceneUI18TapUISceneDelegate *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window) = 0;
  v3 = OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_actionHandler;
  v4 = objc_allocWithZone((Class)type metadata accessor for TapUISceneActionHandler());
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v4, "init");

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for TapUISceneDelegate();
  return -[TapUISceneDelegate init](&v7, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_actionHandler));
}

@end
