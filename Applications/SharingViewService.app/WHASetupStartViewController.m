@implementation WHASetupStartViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t Int64;
  void *v17;
  objc_super v18;

  v3 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupStartViewController viewWillAppear:]", 30, "Start ViewWillAppear\n");
  v18.receiver = self;
  v18.super_class = (Class)WHASetupStartViewController;
  -[SVSBaseViewController viewWillAppear:](&v18, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);

  v6 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTapOutsideView:");
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v6, "setCancelsTouchesInView:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WHASetupStartViewController view](self, "view"));
  objc_msgSend(v7, "addGestureRecognizer:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_progressView + 1), "titleLabel"));
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

  v9 = MKBGetDeviceLockState(0) - 1;
  v10 = *(UIView **)((char *)&self->_progressView + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = v11;
  if (v9 >= 2)
    v13 = CFSTR("CONNECT");
  else
    v13 = CFSTR("UNLOCK_TO_CONNECT");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(v10, "setTitle:forState:", v14, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "userInfo"));
  Int64 = CFDictionaryGetInt64(v15, CFSTR("autoStart"), 0);

  if (Int64)
    -[WHASetupStartViewController handleStartButton:](self, "handleStartButton:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v17, "setSwipeDismissible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupStartViewController viewDidDisappear:]", 30, "Start ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)WHASetupStartViewController;
  -[WHASetupStartViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BOOL v4;
  id v6;
  void *v7;
  void *v8;

  if (BYTE1(self->_startButton))
    return 0;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v4 = v7 == v8;
  return v4;
}

- (void)handleStartButton:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id mainController;
  uint64_t v8;
  _QWORD v9[4];
  dispatch_source_t v10;
  WHASetupStartViewController *v11;

  v4 = a3;
  if (!BYTE1(self->_startButton))
  {
    BYTE1(self->_startButton) = 1;
    if (dword_1001A9008 <= 30
      && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    {
      LogPrintF(&dword_1001A9008, "-[WHASetupStartViewController handleStartButton:]", 30, "Start button\n");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
    objc_msgSend(v5, "setSwipeDismissible:", 0);

    objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "setHidden:", 0);
    objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "startAnimating");
    objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setHidden:", 0);
    objc_msgSend(*(id *)((char *)&self->_progressView + 1), "setHidden:", 1);
    switch(objc_msgSend(self->super._mainController, "testMode"))
    {
      case 0u:
        objc_msgSend(self->super._mainController, "_sessionStart");
        break;
      case 4u:
        mainController = self->super._mainController;
        v8 = 301000;
        goto LABEL_17;
      case 5u:
        mainController = self->super._mainController;
        v8 = 301004;
        goto LABEL_17;
      case 6u:
        mainController = self->super._mainController;
        v8 = 301005;
        goto LABEL_17;
      case 7u:
        mainController = self->super._mainController;
        v8 = 301006;
        goto LABEL_17;
      case 8u:
        mainController = self->super._mainController;
        v8 = 301007;
        goto LABEL_17;
      case 9u:
        mainController = self->super._mainController;
        v8 = 301010;
        goto LABEL_17;
      case 0xAu:
        mainController = self->super._mainController;
        v8 = 301015;
        goto LABEL_17;
      case 0xBu:
        mainController = self->super._mainController;
        v8 = 301011;
LABEL_17:
        objc_msgSend(mainController, "showDoneUI:", v8);
        break;
      default:
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_10011F764;
        v9[3] = &unk_10017E1A0;
        v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
        v11 = self;
        v6 = v10;
        dispatch_source_set_event_handler(v6, v9);
        SFDispatchTimerSet(v6, 1.0, -1.0, -4.0);
        dispatch_resume(v6);

        break;
    }
  }

}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupStartViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (void)handleTapOutsideView:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupStartViewController handleTapOutsideView:]", 30, "Dismissing on tap outside view\n");
  objc_msgSend(self->super._mainController, "dismiss:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_started + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
