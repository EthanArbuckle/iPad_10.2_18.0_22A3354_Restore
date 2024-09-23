@implementation CameraMainViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  CameraMainViewController *v2;

  v2 = self;
  sub_100003054();
}

- (void).cxx_destruct
{

}

- (void)loadView
{
  CameraMainViewController *v2;

  v2 = self;
  sub_1000030F8();

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)_layerdump
{
  CameraMainViewController *v2;

  v2 = self;
  sub_100003610();

}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsFor:(id)a4
{
  id v6;
  id v7;
  CameraMainViewController *v8;
  unint64_t v9;
  unint64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100003880();
  v10 = v9;

  return v10;
}

- (void)sidecarServiceVolumeUpButtonPressed:(BOOL)a3
{
  CameraMainViewController *v4;

  v4 = self;
  sub_100003930(a3);

}

- (void)sidecarServiceVolumeDownButtonPressed:(BOOL)a3
{
  CameraMainViewController *v4;

  v4 = self;
  sub_100003BA4(a3);

}

- (void)sidecarServiceActive
{
  CameraMainViewController *v2;

  v2 = self;
  sub_100003BF8();

}

- (CameraMainViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (CameraMainViewController *)sub_100003C54(v5, v7, a4);
}

- (CameraMainViewController)initWithCoder:(id)a3
{
  return (CameraMainViewController *)sub_100003D38((uint64_t)a3);
}

- (void)requestDidStart:(id)a3
{
  id v4;
  CameraMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100003DD0(v4);

}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6;
  id v7;
  CameraMainViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100004E08((uint64_t)v8, v7);

}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v4;
  CameraMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100005548();

}

- (int64_t)requestCompleted
{
  return 2;
}

@end
