@implementation CalibrationViewController

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (_TtC16AssistiveTouchUI25CalibrationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16AssistiveTouchUI25CalibrationViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  _TtC16AssistiveTouchUI25CalibrationViewController *v2;

  v2 = self;
  sub_236B2F0A4();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_236B2F5B4(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_236B2F5B4(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleTapGuesture:(id)a3
{
  id v4;
  _TtC16AssistiveTouchUI25CalibrationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_236B2FFC8();

}

- (_TtC16AssistiveTouchUI25CalibrationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16AssistiveTouchUI25CalibrationViewController *result;

  v4 = a4;
  result = (_TtC16AssistiveTouchUI25CalibrationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_236B300F4((uint64_t)self + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView));
}

@end
