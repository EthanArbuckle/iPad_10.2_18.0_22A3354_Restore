@implementation PBADeviceBlockOverlayViewController

- (PBADeviceBlockOverlayViewController)initWithBlockStatusProvider:(id)a3
{
  id v4;
  PBADeviceBlockOverlayViewController *v5;
  PBADeviceBlockOverlayViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PBADeviceBlockOverlayViewController;
  v5 = -[PBADeviceBlockOverlayViewController init](&v8, "init");
  v6 = v5;
  if (v5)
    -[PBADeviceBlockOverlayViewController setBlockStatusProvider:](v5, "setBlockStatusProvider:", v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFDeviceBlockTimer invalidate](self->_blockTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBADeviceBlockOverlayViewController;
  -[PBADeviceBlockOverlayViewController dealloc](&v3, "dealloc");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)loadView
{
  SBFDeviceBlockTimer *v3;
  SBFDeviceBlockTimer *blockTimer;
  SBFDeviceBlockTimer *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v3 = (SBFDeviceBlockTimer *)objc_msgSend(objc_alloc((Class)SBFDeviceBlockTimer), "initWithDeviceBlockStatusProvider:", self->_blockStatusProvider);
  blockTimer = self->_blockTimer;
  self->_blockTimer = v3;

  objc_initWeak(&location, self);
  v5 = self->_blockTimer;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000091BC;
  v15 = &unk_100018C70;
  objc_copyWeak(&v16, &location);
  -[SBFDeviceBlockTimer setHandler:](v5, "setHandler:", &v12);
  v6 = objc_alloc((Class)SBUILockOverlayView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", v12, v13, v14, v15));
  objc_msgSend(v7, "_referenceBounds");
  v8 = objc_msgSend(v6, "initWithFrame:style:", 4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SBFDeviceBlockTimer titleText](self->_blockTimer, "titleText"));
  objc_msgSend(v9, "setText:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v8, "setBackgroundColor:", v11);

  -[PBADeviceBlockOverlayViewController setView:](self, "setView:", v8);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SBFDeviceBlockTimer start](self->_blockTimer, "start");
  v5.receiver = self;
  v5.super_class = (Class)PBADeviceBlockOverlayViewController;
  -[PBADeviceBlockOverlayViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SBFDeviceBlockTimer invalidate](self->_blockTimer, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)PBADeviceBlockOverlayViewController;
  -[PBADeviceBlockOverlayViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PBADeviceBlockOverlayViewControllerDelegate)delegate
{
  return (PBADeviceBlockOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBFDeviceBlockTimer)blockTimer
{
  return self->_blockTimer;
}

- (void)setBlockTimer:(id)a3
{
  objc_storeStrong((id *)&self->_blockTimer, a3);
}

- (SBFBlockStatusProvider)blockStatusProvider
{
  return self->_blockStatusProvider;
}

- (void)setBlockStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_blockStatusProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockStatusProvider, 0);
  objc_storeStrong((id *)&self->_blockTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
