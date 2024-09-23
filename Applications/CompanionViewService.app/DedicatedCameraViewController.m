@implementation DedicatedCameraViewController

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DedicatedCameraViewController;
  -[DedicatedCameraViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  sub_100005B54((__CFString *)self);
}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 0);
}

- (void)cancel
{
  self->_cancelled = 1;
  -[DedicatedCameraViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)proxCardFlowWillPresent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BaseViewController viewServiceHost](self, "viewServiceHost"));
  objc_msgSend(v2, "setStatusBarHidden:withDuration:", 1, 0.3);

}

- (void)proxCardFlowDidDismiss
{
  _BOOL4 confirmed;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;
  uint8_t buf[4];
  _BOOL4 v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    confirmed = self->_confirmed;
    *(_DWORD *)buf = 67109120;
    v12 = confirmed;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dedicated Camera prox card flow dismissed: %{BOOL}d", buf, 8u);
  }
  if (!self->_confirmed && !self->_cancelled)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseViewController viewServicePresenter](self, "viewServicePresenter"));
    v5 = CPSErrorDomain;
    v9 = NSDebugDescriptionErrorKey;
    v10 = CFSTR("User dismissed prox card without authenticating.");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, 104, v6));
    objc_msgSend(v4, "deactivateWithError:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BaseViewController viewServiceHost](self, "viewServiceHost"));
  objc_msgSend(v8, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxCardNavController, 0);
}

@end
