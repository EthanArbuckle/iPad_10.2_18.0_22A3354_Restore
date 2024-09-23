@implementation ProximityAutoFillStartViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ProximityAutoFillStartViewController;
  -[SVSBaseViewController viewWillAppear:](&v16, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "_remoteViewControllerProxy"));
  v5 = 1;
  objc_msgSend(v4, "setStatusBarHidden:withDuration:", 1, 0.0);

  v6 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTapOutsideView:");
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v6, "setCancelsTouchesInView:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ProximityAutoFillStartViewController view](self, "view"));
  objc_msgSend(v7, "addGestureRecognizer:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v8, "setSwipeDismissible:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PROX_AUTOFILL_START_BUTTON"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PROX_AUTOFILL_START_DETAIL"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)((char *)&self->_activityIndicator + 1), "setText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PROX_AUTOFILL_START_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v14);

  if (IsAppleInternalBuild(v15))
    v5 = (uint64_t)objc_msgSend(self->super.super._mainController, "prefHideTTR");
  objc_msgSend(*(id *)((char *)&self->_progressView + 1), "setHidden:", v5);

}

- (void)handleDismissButtonPressed:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillStartViewController handleDismissButtonPressed:]", 30, "Start Dismiss button pressed\n");
  objc_msgSend(self->super.super._mainController, "ensureStoppedWithDismiss:reason:", 1, 5);

}

- (void)handleMainButtonPressed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  dispatch_source_t v8;
  ProximityAutoFillStartViewController *v9;

  v4 = a3;
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillStartViewController handleMainButtonPressed:]", 30, "Start button pressed\n");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v5, "setSwipeDismissible:", 0);

  objc_msgSend(*(id *)((char *)&self->_acceptButton + 1), "startAnimating");
  objc_msgSend(*(id *)((char *)&self->_detailLabel + 1), "setHidden:", 0);
  objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setHidden:", 1);
  if (objc_msgSend(self->super.super._mainController, "testMode"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100103FE8;
    v7[3] = &unk_10017E1A0;
    v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v9 = self;
    v6 = v8;
    dispatch_source_set_event_handler(v6, v7);
    SFDispatchTimerSet(v6, 1.0, -1.0, -4.0);
    dispatch_resume(v6);

  }
  else
  {
    objc_msgSend(self->super.super._mainController, "sessionStart");
  }

}

- (void)handleReportBugButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillStartViewController handleReportBugButton:]", 30, "File radar button tapped in start view controller");
  objc_msgSend(self->super.super._mainController, "fileRadar:", 0);

}

- (void)handleTapOutsideView:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillStartViewController handleTapOutsideView:]", 30, "Dismissing on tap outside view\n");
  objc_msgSend(self->super.super._mainController, "ensureStoppedWithDismiss:reason:", 1, 1);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

  return v6 == v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_detailLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicator + 1), 0);
  objc_storeStrong((id *)((char *)&self->_acceptButton + 1), 0);
  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
