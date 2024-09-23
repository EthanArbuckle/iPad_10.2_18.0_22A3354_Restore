@implementation DataScannerViewController.Impl

- (void)frameProvider:(id)a3 didChangeSceneStabilityState:(unint64_t)a4
{
  id v6;
  _TtCC9VisionKit25DataScannerViewController4Impl *v7;

  v6 = a3;
  v7 = self;
  sub_20CF6A328(v6, a4);

}

- (void)frameProvider:(id)a3 didChangeSceneLuminosity:(double)a4
{
  id v6;
  _TtCC9VisionKit25DataScannerViewController4Impl *v7;

  v6 = a3;
  v7 = self;
  sub_20CF6A654(v6, a4);

}

- (void)avCaptureFrameProvider:(id)a3 didChangeIsRunning:(BOOL)a4
{
  id v6;
  _TtCC9VisionKit25DataScannerViewController4Impl *v7;

  v6 = a3;
  v7 = self;
  sub_20CF6A9F0(v6, a4);

}

- (void)avCaptureFrameProvider:(id)a3 didCapturePhoto:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtCC9VisionKit25DataScannerViewController4Impl *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_20CF6AB28(v8, v9, a5);

}

- (void)avCaptureFrameProviderDidZoom:(id)a3
{
  id v4;
  _TtCC9VisionKit25DataScannerViewController4Impl *v5;

  v4 = a3;
  v5 = self;
  sub_20CF6B15C(v4);

}

- (void)avCaptureFrameProviderDidFinishPreparation:(id)a3
{
  id v4;
  _TtCC9VisionKit25DataScannerViewController4Impl *v5;

  v4 = a3;
  v5 = self;
  sub_20CF6B1CC(v4);

}

- (void)avCaptureFrameProvider:(id)a3 cameraAccessGranted:(BOOL)a4
{
  id v6;
  _TtCC9VisionKit25DataScannerViewController4Impl *v7;

  v6 = a3;
  v7 = self;
  sub_20CF6B54C(v6, a4);

}

- (void)cameraRestrictedDidChange:(id)a3
{
  id v4;
  _TtCC9VisionKit25DataScannerViewController4Impl *v5;

  v4 = a3;
  v5 = self;
  sub_20CF76880();

}

- (_TtCC9VisionKit25DataScannerViewController4Impl)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DataScannerViewController.Impl();
  return -[DataScannerViewController.Impl init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
