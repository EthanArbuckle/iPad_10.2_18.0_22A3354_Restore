@implementation JindoActivitySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10ChronoCore26JindoActivitySceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1D2961C58(v8);

}

- (void)sceneWillEnterForeground:(id)a3
{
  _TtC10ChronoCore26JindoActivitySceneDelegate *v4;
  void *v5;
  _TtC10ChronoCore26JindoActivitySceneDelegate *v6;
  char *v7;
  _TtC10ChronoCore26JindoActivitySceneDelegate *v8;

  v4 = (_TtC10ChronoCore26JindoActivitySceneDelegate *)a3;
  v8 = self;
  sub_1D280BB9C();
  v5 = *(Class *)((char *)&v8->super.super.isa
                + OBJC_IVAR____TtC10ChronoCore26JindoActivitySceneDelegate__systemApertureElementProvider);
  if (v5)
  {
    v6 = v8;
    v7 = v5;
    sub_1D28ADFC8(v7, v6);

    v4 = v6;
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  _TtC10ChronoCore26JindoActivitySceneDelegate *v4;
  void *v5;
  _TtC10ChronoCore26JindoActivitySceneDelegate *v6;
  _TtC10ChronoCore26JindoActivitySceneDelegate *v7;

  v4 = (_TtC10ChronoCore26JindoActivitySceneDelegate *)a3;
  v7 = self;
  sub_1D280BFAC();
  v5 = *(Class *)((char *)&v7->super.super.isa
                + OBJC_IVAR____TtC10ChronoCore26JindoActivitySceneDelegate__systemApertureElementProvider);
  if (v5)
  {
    v6 = v5;
    sub_1D28A8968();

    v4 = v7;
    v7 = v6;
  }

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC10ChronoCore26JindoActivitySceneDelegate *v5;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase__validated) == 1)
  {
    v4 = a3;
    v5 = self;
    sub_1D2808978((uint64_t)v4);

  }
}

- (_TtC10ChronoCore26JindoActivitySceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC10ChronoCore26JindoActivitySceneDelegate__systemApertureElementProvider) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JindoActivitySceneDelegate();
  return -[ActivitySceneDelegateBase init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore26JindoActivitySceneDelegate__systemApertureElementProvider));
}

@end
