@implementation ProxCardKitTestScannerViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ProxCardKitTestScannerViewController;
  -[ProxCardKitTestScannerViewController viewDidLoad](&v3, "viewDidLoad");
  -[ProxCardKitTestScannerViewController setTitle:](self, "setTitle:", CFSTR("Wait a Few Seconds"));
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ProxCardKitTestScannerViewController;
  -[ProxCardKitTestScannerViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestScannerViewController scannerEngine](self, "scannerEngine"));
  objc_msgSend(v4, "start");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ProxCardKitTestScannerViewController;
  -[ProxCardKitTestScannerViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestScannerViewController scannerEngine](self, "scannerEngine"));
  objc_msgSend(v4, "stop");

}

- (void)viewDidAppear:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ProxCardKitTestScannerViewController;
  -[ProxCardKitTestScannerViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A5F0;
  block[3] = &unk_10017E1F0;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end
