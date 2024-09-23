@implementation FMR1DebugView

- (_TtC11FMFindingUI13FMR1DebugView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23A9EB240();
}

- (NSString)description
{
  _TtC11FMFindingUI13FMR1DebugView *v2;
  void *v3;

  v2 = self;
  sub_23A9A19A0();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  void *v3;
  _TtC11FMFindingUI13FMR1DebugView *v4;
  id v5;
  objc_super v6;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_debugModeObservation);
  v4 = self;
  if (v3)
  {
    v5 = v3;
    sub_23AA32CD8();

  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMR1DebugView();
  -[FMR1DebugView dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_style);
  v4 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_style);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_dotCountSegmentedControl));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_debugModeWithoutBearingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_debugModeWithoutBearingSwitch));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_debugModeObservation));
  sub_23A98C874(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_autoTestsActionHandler));
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC11FMFindingUI13FMR1DebugView *v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  LOBYTE(self) = sub_23A9EB500(x, y);

  return self & 1;
}

- (void)showControlsToggleActionWithSender:(id)a3
{
  id v4;
  _TtC11FMFindingUI13FMR1DebugView *v5;

  v4 = a3;
  v5 = self;
  sub_23A9EB794();

}

- (void)dotCountSegmentedControlActionWithSender:(id)a3
{
  id v4;
  _TtC11FMFindingUI13FMR1DebugView *v5;

  v4 = a3;
  v5 = self;
  sub_23A9EABA8(v4);

}

- (void)ecoModeAction
{
  void *v3;
  _TtC11FMFindingUI13FMR1DebugView *v4;
  id v5;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_standardUserDefaults);
  objc_msgSend(v5, sel_setFmpfEcoMode_, objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_ecoModeSwitch), sel_isOn));

}

- (void)debugModeWithoutBearingAction
{
  void *v3;
  _TtC11FMFindingUI13FMR1DebugView *v4;
  id v5;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_standardUserDefaults);
  objc_msgSend(v5, sel_setFmpfDebugModeWithoutBearing_, objc_msgSend(*(id *)((char *)&v4->super.super.super.isa+ OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_debugModeWithoutBearingSwitch), sel_isOn));

}

- (void)runTestsAction
{
  _TtC11FMFindingUI13FMR1DebugView *v2;

  v2 = self;
  sub_23A9EADD0();

}

- (_TtC11FMFindingUI13FMR1DebugView)initWithFrame:(CGRect)a3
{
  _TtC11FMFindingUI13FMR1DebugView *result;

  result = (_TtC11FMFindingUI13FMR1DebugView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
