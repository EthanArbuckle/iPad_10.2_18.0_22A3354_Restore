@implementation ListItemSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10ChronoCore21ListItemSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1D28E7634(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC10ChronoCore21ListItemSceneDelegate *v5;

  if (*((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase__validated) == 1)
  {
    v4 = a3;
    v5 = self;
    sub_1D29384E8(v4);

  }
}

- (_TtC10ChronoCore21ListItemSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore21ListItemSceneDelegate__cancellables) = (Class)MEMORY[0x1E0DEE9D8];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ListItemSceneDelegate();
  return -[SingleActivitySceneDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
