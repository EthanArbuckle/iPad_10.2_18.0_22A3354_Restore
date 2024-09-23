@implementation FMFindingDebugViewController

- (_TtC11FMFindingUI28FMFindingDebugViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23A9F041C();
}

- (void)viewDidLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for FMFindingDebugViewController();
  v2 = (char *)v14.receiver;
  -[FMFindingDebugViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_stackView];
  v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)handleWithButton:(id)a3
{
  id v4;
  _TtC11FMFindingUI28FMFindingDebugViewController *v5;

  v4 = a3;
  v5 = self;
  sub_23A9EEEA8();

}

- (void)handleWithSlider:(id)a3
{
  double v5;
  id v6;
  _TtC11FMFindingUI28FMFindingDebugViewController *v7;
  _BYTE v8[40];

  v5 = sub_23A9EDE24((uint64_t)v8);
  if (MEMORY[0x23B85DBF0]((char *)self + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_delegate, v5))
  {
    v6 = a3;
    v7 = self;
    sub_23AA326BC((uint64_t)v8);

    swift_unknownObjectRelease();
  }
}

- (_TtC11FMFindingUI28FMFindingDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11FMFindingUI28FMFindingDebugViewController *result;

  v4 = a4;
  result = (_TtC11FMFindingUI28FMFindingDebugViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_topStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_middleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_bottomStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_autoplayButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_nextStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_prevStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_disconnectedStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_connectingStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_coldStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_warmStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_warmerStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_hotStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_foundStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_ringFactorSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_ringOpacitySlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_hapticForceSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_dotScaleSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_pulsePeriodSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_saveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_loadButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_hideButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_autoplayTimer));
  swift_unknownObjectWeakDestroy();
  sub_23A972074((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_delegate);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC11FMFindingUI28FMFindingDebugViewController *v8;

  sub_23AA32D44();
  v6 = sub_23AA330B0();
  v7 = a3;
  v8 = self;
  sub_23A9F0894(v6);

  swift_bridgeObjectRelease();
}

@end
