@implementation DocumentScannerViewController

- (BOOL)shouldAutorotate
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC16ContinuityCamera29DocumentScannerViewController *v2;

  v2 = self;
  sub_100008F60();

}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6;
  id v7;
  _TtC16ContinuityCamera29DocumentScannerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000090E0((uint64_t)v6, (uint64_t)v7);

}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v4;
  _TtC16ContinuityCamera29DocumentScannerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000091B8();

}

- (_TtC16ContinuityCamera29DocumentScannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16ContinuityCamera29DocumentScannerViewController *)sub_10000926C(v5, v7, a4);
}

- (_TtC16ContinuityCamera29DocumentScannerViewController)initWithCoder:(id)a3
{
  return (_TtC16ContinuityCamera29DocumentScannerViewController *)sub_1000093A4(a3);
}

- (void).cxx_destruct
{
  sub_100008DD4((uint64_t)self + OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_documentCamera));
}

@end
