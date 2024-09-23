@implementation D2DSetupBaseViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService26D2DSetupBaseViewController *v2;

  v2 = self;
  sub_100013580((uint64_t)v2, type metadata accessor for D2DSetupBaseViewController, &OBJC_IVAR____TtC18SharingViewService26D2DSetupBaseViewController_viewModel);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService26D2DSetupBaseViewController *v4;

  v4 = self;
  sub_100013E8C(a3, (uint64_t)v4, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBaseViewController, (SEL *)&selRef_viewWillAppear_, "D2D Setup %@ viewWillAppear");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18SharingViewService26D2DSetupBaseViewController *v4;

  v4 = self;
  sub_100013E8C(a3, (uint64_t)v4, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBaseViewController, (SEL *)&selRef_viewDidDisappear_, "D2D Setup %@ viewDidDisappear");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC18SharingViewService26D2DSetupBaseViewController)initWithContentView:(id)a3
{
  return (_TtC18SharingViewService26D2DSetupBaseViewController *)sub_1000139C0((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC18SharingViewService26D2DSetupBaseViewController_presenter, &OBJC_IVAR____TtC18SharingViewService26D2DSetupBaseViewController_viewModel, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBaseViewController);
}

- (void).cxx_destruct
{
  sub_100013A6C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18SharingViewService26D2DSetupBaseViewController_presenter, &OBJC_IVAR____TtC18SharingViewService26D2DSetupBaseViewController_viewModel);
}

@end
