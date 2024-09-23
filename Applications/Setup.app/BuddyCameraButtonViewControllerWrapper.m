@implementation BuddyCameraButtonViewControllerWrapper

- (void)createViewController:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id from;
  id v13;
  id location[2];
  BuddyCameraButtonViewControllerWrapper *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = objc_alloc_init((Class)sub_1000AE0F0());
  objc_msgSend(v13, "setDelegate:", v15);
  objc_initWeak(&from, v15);
  v3 = v13;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000AE1DC;
  v8 = &unk_100282100;
  objc_copyWeak(&v11, &from);
  v10 = location[0];
  v9 = v13;
  objc_msgSend(v3, "loadAssetsWithCompletion:", &v4);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)cameraButtonBuddyViewControllerDidFinish:(id)a3
{
  BuddyCameraButtonViewControllerDelegate *v3;
  id v4;
  id location[2];
  BuddyCameraButtonViewControllerWrapper *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyCameraButtonViewControllerWrapper delegate](v6, "delegate");
  -[BuddyCameraButtonViewControllerDelegate cameraButtonViewControllerDidFinish:](v3, "cameraButtonViewControllerDidFinish:", location[0], v3);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (BuddyCameraButtonViewControllerDelegate)delegate
{
  return (BuddyCameraButtonViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
