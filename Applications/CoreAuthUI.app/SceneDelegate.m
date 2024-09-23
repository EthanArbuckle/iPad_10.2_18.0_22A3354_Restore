@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10CoreAuthUI13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10004D218(v8, v9);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC10CoreAuthUI13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10004D4E8(v4);

}

- (_TtC10CoreAuthUI13SceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10CoreAuthUI13SceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
