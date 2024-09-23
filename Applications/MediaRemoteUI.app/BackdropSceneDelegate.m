@implementation BackdropSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI21BackdropSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10002E6BC(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC13MediaRemoteUI21BackdropSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002E96C();

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC13MediaRemoteUI21BackdropSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002EAC8((uint64_t)v5);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC13MediaRemoteUI21BackdropSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002EBD4((uint64_t)v5);

}

- (_TtC13MediaRemoteUI21BackdropSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BackdropSceneDelegate();
  return -[BackdropSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
