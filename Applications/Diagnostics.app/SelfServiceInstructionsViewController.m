@implementation SelfServiceInstructionsViewController

- (void)viewDidLoad
{
  _TtC11Diagnostics37SelfServiceInstructionsViewController *v2;

  v2 = self;
  sub_1000D4034();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC11Diagnostics37SelfServiceInstructionsViewController *v4;

  v4 = self;
  sub_1000D4BEC(a3);

}

- (_TtC11Diagnostics37SelfServiceInstructionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC11Diagnostics37SelfServiceInstructionsViewController *result;

  result = (_TtC11Diagnostics37SelfServiceInstructionsViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.SelfServiceInstructionsViewController", 49, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC11Diagnostics37SelfServiceInstructionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC11Diagnostics37SelfServiceInstructionsViewController *result;

  v6 = a5;
  result = (_TtC11Diagnostics37SelfServiceInstructionsViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.SelfServiceInstructionsViewController", 49, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SEL v9;
  id v10;
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;
  SEL v16;
  id v17;
  int v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SEL v23;
  id v24;
  int v25;
  id v26;
  id v27;
  id v28;
  id v29;

  swift_bridgeObjectRelease(*(DARootViewController **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_images], a2, v2, v3, v4, v5, v6, v7);
  swift_bridgeObjectRelease(*(DARootViewController **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_instructions], v9, v10, v11, v12, v13, v14, v15);
  swift_bridgeObjectRelease(*(DARootViewController **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_options], v16, v17, v18, v19, v20, v21, v22);
  swift_bridgeObjectRelease(*(DARootViewController **)&self->defaultTransitionDuration[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_answer], v23, v24, v25, v26, v27, v28, v29);
  sub_100035D74(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_onButtonPress], *(_QWORD *)&self->defaultTransitionDuration[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_onButtonPress]);
  sub_100035D74(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_onDismiss], *(_QWORD *)&self->defaultTransitionDuration[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_onDismiss]);
}

@end
