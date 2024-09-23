@implementation WHASetupProgressViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_source_t v7;
  WHASetupProgressViewController *v8;
  objc_super v9;

  v3 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupProgressViewController viewWillAppear:]", 30, "Done ViewWillAppear\n");
  v9.receiver = self;
  v9.super_class = (Class)WHASetupProgressViewController;
  -[SVSBaseViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setHidden:", 0);
  objc_msgSend(*(id *)((char *)&self->_progressView + 1), "startAnimating");
  objc_msgSend(*(id *)((char *)&self->_progressSpinner + 1), "setHidden:", 0);
  if (objc_msgSend(self->super._mainController, "testMode"))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100120680;
    v6[3] = &unk_10017E1A0;
    v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v8 = self;
    v5 = v7;
    dispatch_source_set_event_handler(v5, v6);
    SFDispatchTimerSet(v5, 1.0, -1.0, -4.0);
    dispatch_resume(v5);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupProgressViewController viewDidDisappear:]", 30, "Done ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)WHASetupProgressViewController;
  -[WHASetupProgressViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupProgressViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (void)handleProgressEvent:(unsigned int)a3
{
  __CFString *v4;
  id v5;
  id v6;

  if ((int)a3 > 219)
  {
    if (a3 == 220)
    {
      v4 = CFSTR("SETTING_UP_ICLOUD");
      goto LABEL_11;
    }
    if (a3 == 230)
    {
      v4 = CFSTR("SETTING_UP_HOMEKIT");
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == 200)
    {
      v4 = CFSTR("SETTING_UP_WIFI");
      goto LABEL_11;
    }
    if (a3 == 210)
    {
      v4 = CFSTR("ACTIVATING");
LABEL_11:
      v5 = sub_1001171A8(CFSTR("Localizable"), v4);
      v6 = (id)objc_claimAutoreleasedReturnValue(v5);
      objc_msgSend(*(id *)((char *)&self->_progressSpinner + 1), "setText:", v6);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_progressSpinner + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
