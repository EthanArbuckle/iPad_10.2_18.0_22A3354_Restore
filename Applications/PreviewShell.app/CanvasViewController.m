@implementation CanvasViewController

- (_TtC12PreviewShell20CanvasViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC12PreviewShell20CanvasViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation;
  v6 = type metadata accessor for PreviewPreferences.InterfaceOrientation(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay) = 0;
  v7 = a3;

  result = (_TtC12PreviewShell20CanvasViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "PreviewShell/CanvasViewController.swift", 39, 2, 35, 0);
  __break(1u);
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC12PreviewShell20CanvasViewController *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_10002DC54();

  return v3;
}

- (void)viewDidLoad
{
  _TtC12PreviewShell20CanvasViewController *v2;

  v2 = self;
  sub_10002DDE0();

}

- (void)viewWillLayoutSubviews
{
  _TtC12PreviewShell20CanvasViewController *v2;

  v2 = self;
  sub_10002DF50();

}

- (_TtC12PreviewShell20CanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12PreviewShell20CanvasViewController *result;

  v4 = a4;
  result = (_TtC12PreviewShell20CanvasViewController *)_swift_stdlib_reportUnimplementedInitializer("PreviewShell.CanvasViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->sceneIdentifier[OBJC_IVAR____TtC12PreviewShell20CanvasViewController_sceneIdentifier]);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating));
  sub_10002E32C((uint64_t)self + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay));
}

@end
