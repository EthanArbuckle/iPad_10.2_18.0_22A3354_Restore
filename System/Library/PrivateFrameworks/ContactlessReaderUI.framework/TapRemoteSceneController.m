@implementation TapRemoteSceneController

- (BOOL)prefersStatusBarHidden
{
  return (*((_BYTE *)&self->super.super.super.isa
          + OBJC_IVAR____TtC19ContactlessReaderUI24TapRemoteSceneController_showStatusBar) & 1) == 0;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 2;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  return 4;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dealloc
{
  _TtC19ContactlessReaderUI24TapRemoteSceneController *v2;

  v2 = self;
  TapRemoteSceneController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUI24TapRemoteSceneController_walletSuppressor);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI24TapRemoteSceneController_hideMenuIndicatorTimer));
  swift_bridgeObjectRelease();
  sub_22F8D535C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC19ContactlessReaderUI24TapRemoteSceneController_context));
  swift_unknownObjectWeakDestroy();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC19ContactlessReaderUI24TapRemoteSceneController *v4;

  v4 = self;
  sub_22F8D0864(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC19ContactlessReaderUI24TapRemoteSceneController *v4;

  v4 = self;
  sub_22F8D0A20(a3);

}

- (void)viewDidLoad
{
  _TtC19ContactlessReaderUI24TapRemoteSceneController *v2;

  v2 = self;
  sub_22F8D0D28();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _TtC19ContactlessReaderUI24TapRemoteSceneController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  objc_super v14;

  v3 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255E206E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = qword_255E1DB20;
  v9 = self;
  if (v8 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v5, (uint64_t)qword_255E29610);
  sub_22F87BC08(v10, (uint64_t)v7);
  v11 = sub_22F98DAA4();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    sub_22F87AC20((uint64_t)v7, (uint64_t *)&unk_255E206E0);
  }
  else
  {
    sub_22F863858((uint64_t)v9, 0xD000000000000014, 0x800000022F9A00A0, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
  }
  v13 = (objc_class *)type metadata accessor for TapRemoteSceneController();
  v14.receiver = v9;
  v14.super_class = v13;
  -[TapRemoteSceneController viewDidDisappear:](&v14, sel_viewDidDisappear_, v3);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  uint64_t (*v6)();
  _TtC19ContactlessReaderUI24TapRemoteSceneController *v7;

  v5 = _Block_copy(a4);
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v6 = sub_22F8CFEDC;
  }
  else
  {
    v6 = 0;
  }
  v7 = self;
  sub_22F8D5404();
  sub_22F87A9B8((uint64_t)v6);

}

- (void)handlePanWithSender:(id)a3
{
  id v4;
  _TtC19ContactlessReaderUI24TapRemoteSceneController *v5;

  v4 = a3;
  v5 = self;
  sub_22F8D4480(v4);

}

- (_TtC19ContactlessReaderUI24TapRemoteSceneController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22F98EDB8();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC19ContactlessReaderUI24TapRemoteSceneController *)TapRemoteSceneController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC19ContactlessReaderUI24TapRemoteSceneController)initWithCoder:(id)a3
{
  return (_TtC19ContactlessReaderUI24TapRemoteSceneController *)TapRemoteSceneController.init(coder:)(a3);
}

@end
