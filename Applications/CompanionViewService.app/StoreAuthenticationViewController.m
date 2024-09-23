@implementation StoreAuthenticationViewController

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)StoreAuthenticationViewController;
  -[StoreAuthenticationViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  sub_100001E24(self);
}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 0);
}

- (void)cancel
{
  self->_cancelled = 1;
  -[StoreAuthenticationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)proxCardFlowWillPresent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BaseViewController viewServiceHost](self, "viewServiceHost"));
  objc_msgSend(v2, "setStatusBarHidden:withDuration:", 1, 0.3);

}

- (void)proxCardFlowDidDismiss
{
  id v3;
  NSObject *v4;
  _BOOL4 finished;
  _BOOL4 cancelled;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;

  v3 = sub_100002214();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    finished = self->_finished;
    cancelled = self->_cancelled;
    *(_DWORD *)buf = 67109376;
    v15 = finished;
    v16 = 1024;
    v17 = cancelled;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Store authentication prox card flow dismissed. {finished=%{BOOL}d, cancelled=%{BOOL}d", buf, 0xEu);
  }

  if (!self->_finished && !self->_cancelled)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BaseViewController viewServicePresenter](self, "viewServicePresenter"));
    v8 = CPSErrorDomain;
    v12 = NSDebugDescriptionErrorKey;
    v13 = CFSTR("User dismissed prox card without authenticating.");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, 104, v9));
    objc_msgSend(v7, "deactivateWithError:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BaseViewController viewServiceHost](self, "viewServiceHost"));
  objc_msgSend(v11, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxCardNavController, 0);
}

@end
