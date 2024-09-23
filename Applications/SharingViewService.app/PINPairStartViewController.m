@implementation PINPairStartViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v9;
  UIActivityIndicatorView *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairStartViewController viewWillAppear:]", 30, "Start ViewWillAppear\n");
  v16.receiver = self;
  v16.super_class = (Class)PINPairStartViewController;
  -[SVSBaseViewController viewWillAppear:](&v16, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "userInfo"));
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("deviceIdentifier"), TypeID, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v9)
  {
    v10 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v9);
    v11 = *(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1);
    *(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1) = v10;

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "userInfo"));
  BYTE1(self->_deviceIdentifier) = CFDictionaryGetInt64Ranged(v12, CFSTR("osVersion"), 0, 255, 0);

  v13 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTapOutsideView:");
  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v13, "setCancelsTouchesInView:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PINPairStartViewController view](self, "view"));
  objc_msgSend(v14, "addGestureRecognizer:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v15, "setSwipeDismissible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairStartViewController viewDidDisappear:]", 30, "Start ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)PINPairStartViewController;
  -[PINPairStartViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BOOL v4;
  id v6;
  void *v7;
  void *v8;

  if (BYTE1(self->_progressLabel))
    return 0;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v4 = v7 == v8;
  return v4;
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairStartViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (void)handlePairButton:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  dispatch_source_t v9;
  PINPairStartViewController *v10;

  v4 = a3;
  if (!BYTE1(self->_progressLabel))
  {
    if (dword_1001A86D8 <= 30
      && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    {
      LogPrintF(&dword_1001A86D8, "-[PINPairStartViewController handlePairButton:]", 30, "Pair button\n");
    }
    BYTE1(self->_progressLabel) = 1;
    objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setHidden:", 1);
    objc_msgSend(*(id *)((char *)&self->_pairButton + 1), "setHidden:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
    objc_msgSend(v5, "setSwipeDismissible:", 0);

    objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "startAnimating");
    if (objc_msgSend(self->super._mainController, "testFlags"))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000FAD68;
      v8[3] = &unk_10017E1A0;
      v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      v10 = self;
      v6 = v9;
      dispatch_source_set_event_handler(v6, v8);
      SFDispatchTimerSet(v6, 1.0, -1.0, -4.0);
      dispatch_resume(v6);

    }
    else
    {
      v7 = objc_alloc_init((Class)SFDevice);
      objc_msgSend(v7, "setIdentifier:", *(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1));
      objc_msgSend(v7, "setOsVersion:", BYTE1(self->_deviceIdentifier));
      objc_msgSend(self->super._mainController, "_startPairing:", v7);

    }
  }

}

- (void)handleTapOutsideView:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairStartViewController handleTapOutsideView:]", 30, "Dismissing on tap outside view\n");
  objc_msgSend(self->super._mainController, "dismiss:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_pairButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)(&self->_deviceVersion + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
