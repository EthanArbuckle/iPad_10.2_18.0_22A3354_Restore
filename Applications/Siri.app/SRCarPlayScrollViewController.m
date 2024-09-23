@implementation SRCarPlayScrollViewController

- (_TtC4Siri29SRCarPlayScrollViewController)initWithCoder:(id)a3
{
  _TtC4Siri29SRCarPlayScrollViewController *result;

  result = (_TtC4Siri29SRCarPlayScrollViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000E1170, "Siri/SRCarPlayScrollViewController.swift", 40, 2, 21, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  char v3;
  id v4;
  _TtC4Siri29SRCarPlayScrollViewController *v5;
  char *v6;

  v3 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri29SRCarPlayScrollViewController_isRightHandDrive);
  v4 = objc_allocWithZone((Class)type metadata accessor for SRCarPlayScrollView());
  v5 = self;
  v6 = sub_10008B52C(v3);
  -[SRCarPlayScrollViewController setView:](v5, "setView:", v6);

}

- (void)viewWillLayoutSubviews
{
  _TtC4Siri29SRCarPlayScrollViewController *v2;

  v2 = self;
  sub_10008B048();

}

- (_TtC4Siri29SRCarPlayScrollViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC4Siri29SRCarPlayScrollViewController *result;

  v4 = a4;
  result = (_TtC4Siri29SRCarPlayScrollViewController *)_swift_stdlib_reportUnimplementedInitializer("Siri.SRCarPlayScrollViewController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
