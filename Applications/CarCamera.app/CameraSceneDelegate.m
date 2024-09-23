@implementation CameraSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC9CarCamera19CameraSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000753C(v8, v9);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC9CarCamera19CameraSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100007270(v4);

}

- (_TtC9CarCamera19CameraSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_consoleWindowManager) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_clusterWindowManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CameraSceneDelegate();
  return -[CameraSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_consoleWindowManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_clusterWindowManager));
}

@end
