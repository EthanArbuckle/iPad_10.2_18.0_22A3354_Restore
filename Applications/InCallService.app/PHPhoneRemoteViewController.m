@implementation PHPhoneRemoteViewController

+ (BOOL)isSupported
{
  return 1;
}

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewControllerClassName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceBundleIdentifier"));
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting view controller with class name %@ and bundle identifier %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v5, v6, v4));
  return v9;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhoneRemoteViewController delegate](self, "delegate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhoneRemoteViewController delegate](self, "delegate"));
    objc_msgSend(v5, "viewServiceDidTerminateWithError:", v6);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHPhoneRemoteViewController;
  -[PHPhoneRemoteViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhoneRemoteViewController backgroundStyleDelegate](self, "backgroundStyleDelegate"));
  objc_msgSend(v4, "setBackgroundStyle:animatedWithDuration:", -[PHPhoneRemoteViewController backgroundStyle](self, "backgroundStyle"), 0.5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHPhoneRemoteViewController;
  -[PHPhoneRemoteViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhoneRemoteViewController backgroundStyleDelegate](self, "backgroundStyleDelegate"));
  objc_msgSend(v4, "setBackgroundStyle:animatedWithDuration:", 4, 0.5);

}

+ (NSString)viewControllerClassName
{
  return 0;
}

+ (NSString)serviceBundleIdentifier
{
  return 0;
}

- (int64_t)backgroundStyle
{
  return 0;
}

- (PHPhoneRemoteViewControllerDelegate)delegate
{
  return (PHPhoneRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHInCallBackgroundStyleProtocol)backgroundStyleDelegate
{
  return (PHInCallBackgroundStyleProtocol *)objc_loadWeakRetained((id *)&self->_backgroundStyleDelegate);
}

- (void)setBackgroundStyleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundStyleDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundStyleDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
