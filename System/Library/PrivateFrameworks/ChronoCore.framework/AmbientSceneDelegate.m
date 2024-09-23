@implementation AmbientSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10ChronoCore20AmbientSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1D28D2CA0(v8);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC10ChronoCore20AmbientSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1D28D2FF0();

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC10ChronoCore20AmbientSceneDelegate *v5;

  if (*((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase__validated) == 1)
  {
    v4 = a3;
    v5 = self;
    sub_1D29384E8(v4);

  }
}

- (_TtC10ChronoCore20AmbientSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore20AmbientSceneDelegate__cancellables) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore20AmbientSceneDelegate__viewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10ChronoCore20AmbientSceneDelegate__viewModel) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AmbientSceneDelegate();
  return -[SingleActivitySceneDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore20AmbientSceneDelegate__viewController));
  swift_release();
}

@end
