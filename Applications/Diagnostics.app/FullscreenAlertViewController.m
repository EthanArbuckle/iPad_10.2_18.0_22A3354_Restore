@implementation FullscreenAlertViewController

- (_TtC11Diagnostics29FullscreenAlertViewController)initWithCoder:(id)a3
{
  id v5;
  id v6;
  objc_class *v7;
  _TtC11Diagnostics29FullscreenAlertViewController *result;

  v5 = objc_allocWithZone((Class)_UIContentUnavailableView);
  v6 = a3;
  v7 = (objc_class *)objc_msgSend(v5, "initWithFrame:title:style:", 0, 0, 0.0, 0.0, 0.0, 0.0);
  if (!v7)
    __break(1u);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_contentUnavailableView) = v7;

  result = (_TtC11Diagnostics29FullscreenAlertViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100112360, "Diagnostics/FullscreenAlertViewController.swift", 47, 2, 28, 0);
  __break(1u);
  return result;
}

- (_TtC11Diagnostics29FullscreenAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11Diagnostics29FullscreenAlertViewController *result;

  v4 = a4;
  result = (_TtC11Diagnostics29FullscreenAlertViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.FullscreenAlertViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;

  sub_10005BEFC(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert), *(void **)&self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert], *(_QWORD *)&self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert + 8], *(_QWORD *)&self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert + 16], *(_QWORD *)&self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert + 24], *(_QWORD *)&self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert + 32], self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert + 40]);
  swift_bridgeObjectRelease(*(DARootViewController **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_privateAlertAction), v3, v4, v5, v6, v7, v8, v9);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_contentUnavailableView));
}

@end
