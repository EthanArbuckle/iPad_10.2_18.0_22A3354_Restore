@implementation D2DSetupBaseScannerViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService33D2DSetupBaseScannerViewController *v2;

  v2 = self;
  sub_100013580(0, (uint64_t (*)(void))type metadata accessor for D2DSetupBaseScannerViewController, &OBJC_IVAR____TtC18SharingViewService33D2DSetupBaseScannerViewController_viewModel);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService33D2DSetupBaseScannerViewController *v4;

  v4 = self;
  sub_100013E8C(a3, 0, type metadata accessor for D2DSetupBaseScannerViewController, (SEL *)&selRef_viewWillAppear_, "D2D Setup %@ viewWillAppear");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18SharingViewService33D2DSetupBaseScannerViewController *v4;

  v4 = self;
  sub_100013E8C(a3, 0, type metadata accessor for D2DSetupBaseScannerViewController, (SEL *)&selRef_viewDidDisappear_, "D2D Setup %@ viewDidDisappear");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  sub_100013A6C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18SharingViewService33D2DSetupBaseScannerViewController_presenter, &OBJC_IVAR____TtC18SharingViewService33D2DSetupBaseScannerViewController_viewModel);
}

@end
