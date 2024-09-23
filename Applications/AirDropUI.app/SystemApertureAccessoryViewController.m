@implementation SystemApertureAccessoryViewController

- (_TtC9AirDropUI37SystemApertureAccessoryViewController)initWithCoder:(id)a3
{
  _TtC9AirDropUI37SystemApertureAccessoryViewController *result;

  result = (_TtC9AirDropUI37SystemApertureAccessoryViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000F05A0, "AirDropUI/SystemApertureElementHostingController.swift", 54, 2, 312, 0);
  __break(1u);
  return result;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  -[SystemApertureAccessoryViewController setView:](self, "setView:", *(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9AirDropUI37SystemApertureAccessoryViewController__view));
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  _TtC9AirDropUI37SystemApertureAccessoryViewController *v5;
  id v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = -[SystemApertureAccessoryViewController parentViewController](v5, "parentViewController");
  objc_msgSend(v6, "preferredContentSizeDidChangeForChildContentContainer:", a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC9AirDropUI37SystemApertureAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9AirDropUI37SystemApertureAccessoryViewController *result;

  v4 = a4;
  result = (_TtC9AirDropUI37SystemApertureAccessoryViewController *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.SystemApertureAccessoryViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI37SystemApertureAccessoryViewController__view));
}

@end
