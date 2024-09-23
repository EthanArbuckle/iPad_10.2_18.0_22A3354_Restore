@implementation PKPeerPaymentMessagesContentBaseViewController

- (PKPeerPaymentMessagesContentBaseViewController)initWithMessagesAppController:(id)a3
{
  id v4;
  PKPeerPaymentMessagesContentBaseViewController *v5;
  uint64_t Object;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  PKPeerPaymentMessagesContentBaseViewController *v16;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentMessagesContentBaseViewController;
  v5 = -[PKPeerPaymentMessagesContentBaseViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
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
  }

  return v5;
}

- (void)loadView
{
  PKPeerPaymentMessagesContentView *v3;
  PKPeerPaymentMessagesContentView *contentView;

  v3 = objc_alloc_init(PKPeerPaymentMessagesContentView);
  contentView = self->_contentView;
  self->_contentView = v3;

  -[PKPeerPaymentMessagesContentBaseViewController setView:](self, "setView:", self->_contentView);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesContentBaseViewController;
  -[PKPeerPaymentMessagesContentBaseViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[PKPeerPaymentMessagesContentBaseViewController reloadContent](self, "reloadContent");
}

- (PKPeerPaymentMessagesAppViewController)appController
{
  return (PKPeerPaymentMessagesAppViewController *)objc_loadWeakRetained((id *)&self->_appController);
}

- (PKPeerPaymentMessagesContentView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_appController);
}

@end
