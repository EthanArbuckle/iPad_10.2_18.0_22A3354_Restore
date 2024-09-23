@implementation D2DSetupBasePasscodeViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService34D2DSetupBasePasscodeViewController *v2;

  v2 = self;
  sub_100013580((uint64_t)v2, type metadata accessor for D2DSetupBasePasscodeViewController, &OBJC_IVAR____TtC18SharingViewService34D2DSetupBasePasscodeViewController_viewModel);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService34D2DSetupBasePasscodeViewController *v4;

  v4 = self;
  sub_100013E8C(a3, (uint64_t)v4, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBasePasscodeViewController, (SEL *)&selRef_viewWillAppear_, "D2D Setup %@ viewWillAppear");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18SharingViewService34D2DSetupBasePasscodeViewController *v4;

  v4 = self;
  sub_100013E8C(a3, (uint64_t)v4, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBasePasscodeViewController, (SEL *)&selRef_viewDidDisappear_, "D2D Setup %@ viewDidDisappear");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC18SharingViewService34D2DSetupBasePasscodeViewController)initWithContentView:(id)a3
{
  return (_TtC18SharingViewService34D2DSetupBasePasscodeViewController *)sub_1000139C0((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC18SharingViewService34D2DSetupBasePasscodeViewController_presenter, &OBJC_IVAR____TtC18SharingViewService34D2DSetupBasePasscodeViewController_viewModel, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBasePasscodeViewController);
}

- (void).cxx_destruct
{
  sub_100013A6C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18SharingViewService34D2DSetupBasePasscodeViewController_presenter, &OBJC_IVAR____TtC18SharingViewService34D2DSetupBasePasscodeViewController_viewModel);
}

@end
