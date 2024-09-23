@implementation TripSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC4Trip17TripSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100020BA8(v8, v9);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC4Trip17TripSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000206DC(v4);

}

- (_TtC4Trip17TripSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Trip17TripSceneDelegate_consoleWindowManager) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TripSceneDelegate();
  return -[TripSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

- (void)selectButtonPressedWithType:(unint64_t)a3
{
  sub_100020F8C(a3);
}

@end
