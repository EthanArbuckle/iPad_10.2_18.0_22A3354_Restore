@implementation PKPeerPaymentMessagesContentNavigationController

- (PKPeerPaymentMessagesContentNavigationController)initWithMessagesAppController:(id)a3
{
  id v4;
  PKPeerPaymentMessagesContentNavigationController *v5;
  uint64_t Object;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  PKPeerPaymentMessagesContentNavigationController *v16;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentMessagesContentNavigationController;
  v5 = -[PKPeerPaymentMessagesContentNavigationController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    Object = PKLogFacilityTypeGetObject(11);
    v7 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class(v5);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2048;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p>: Initialized.", buf, 0x16u);

    }
    objc_storeWeak((id *)&v5->_appController, v4);
    -[PKPeerPaymentMessagesContentNavigationController setDelegate:](v5, "setDelegate:", v5);
  }

  return v5;
}

- (void)reloadContent
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentNavigationController viewControllers](self, "viewControllers"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  objc_msgSend(v3, "reloadContent");
}

- (PKPeerPaymentMessagesContentView)contentView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentNavigationController viewControllers](self, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentView"));
  return (PKPeerPaymentMessagesContentView *)v4;
}

- (PKPeerPaymentMessagesAppViewController)appController
{
  return (PKPeerPaymentMessagesAppViewController *)objc_loadWeakRetained((id *)&self->_appController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appController);
}

@end
