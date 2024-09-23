@implementation ActivitySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10ChronoCore21ActivitySceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1D293D06C(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC10ChronoCore21ActivitySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1D29384E8(v4);

}

- (id)scene:(id)a3 handleActions:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC10ChronoCore21ActivitySceneDelegate *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  sub_1D2728FEC(0, (unint64_t *)&unk_1ED94E7C0);
  sub_1D274C764((unint64_t *)&unk_1ED94E7D0, (unint64_t *)&unk_1ED94E7C0, 0x1E0D01698, MEMORY[0x1E0DEFCF8]);
  v6 = sub_1D29C5CAC();
  v7 = a3;
  v8 = self;
  sub_1D293D25C(v6);
  v10 = v9;

  swift_bridgeObjectRelease();
  if (v10)
  {
    v11 = (void *)sub_1D29C5CA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (_TtC10ChronoCore21ActivitySceneDelegate)init
{
  objc_class *v2;
  objc_super v4;

  v2 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10ChronoCore21ActivitySceneDelegate__cancellables) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10ChronoCore21ActivitySceneDelegate_viewController) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10ChronoCore21ActivitySceneDelegate_viewModels) = v2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return -[ActivitySceneDelegateBase init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore21ActivitySceneDelegate_viewController));
  swift_bridgeObjectRelease();
}

@end
