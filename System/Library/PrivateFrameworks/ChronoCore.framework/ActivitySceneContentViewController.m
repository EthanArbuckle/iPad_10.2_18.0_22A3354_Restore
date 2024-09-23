@implementation ActivitySceneContentViewController

- (_TtC10ChronoCore34ActivitySceneContentViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC10ChronoCore34ActivitySceneContentViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore34ActivitySceneContentViewController__cancellables) = (Class)MEMORY[0x1E0DEE9E8];
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC10ChronoCore34ActivitySceneContentViewController *)sub_1D29C6474();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  _TtC10ChronoCore34ActivitySceneContentViewController *v2;

  v2 = self;
  sub_1D28B607C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC10ChronoCore34ActivitySceneContentViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D28B6380((uint8_t *)a3);

}

- (id)_timelinesForDateInterval:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10ChronoCore34ActivitySceneContentViewController *v8;
  void *v9;
  uint64_t v11;

  v4 = sub_1D29C13E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D29C13C8();
  v8 = self;
  sub_1D28B6BB0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1D2728FEC(0, &qword_1EFC8F0F0);
  v9 = (void *)sub_1D29C5B74();
  swift_bridgeObjectRelease();
  return v9;
}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC10ChronoCore34ActivitySceneContentViewController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1D28B6FDC(a3, (uint64_t)sub_1D28B796C, v7);

  swift_release();
}

- (_TtC10ChronoCore34ActivitySceneContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10ChronoCore34ActivitySceneContentViewController *result;

  v4 = a4;
  result = (_TtC10ChronoCore34ActivitySceneContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore34ActivitySceneContentViewController__logger;
  v4 = sub_1D29C29A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore34ActivitySceneContentViewController__hostingController));
  swift_unknownObjectWeakDestroy();
}

@end
