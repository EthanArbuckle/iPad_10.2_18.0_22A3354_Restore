@implementation AmbientCompactSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI27AmbientCompactSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000CAE8(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC13MediaRemoteUI27AmbientCompactSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000CD0C();

}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_10000C920(self, (uint64_t)a2, a3, (uint64_t)"AmbientCompactScene will enter foreground", 41);
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_10000C920(self, (uint64_t)a2, a3, (uint64_t)"AmbientCompactScene did enter background", 40);
}

- (_TtC13MediaRemoteUI27AmbientCompactSceneDelegate)init
{
  uint64_t v2;
  uint64_t v3;
  _TtC13MediaRemoteUI27AmbientCompactSceneDelegate *v4;
  uint64_t v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window) = 0;
  v2 = OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_dependency;
  v3 = qword_1000589A8;
  v4 = self;
  if (v3 != -1)
    swift_once(&qword_1000589A8, sub_1000146BC);
  v5 = qword_10005B198;
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_10005B198;
  swift_retain(v5);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AmbientCompactSceneDelegate();
  return -[AmbientCompactSceneDelegate init](&v7, "init");
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_dependency));
}

@end
