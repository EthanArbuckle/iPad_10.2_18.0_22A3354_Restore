@implementation TVLatencySetupProgressViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD block[5];
  objc_super v15;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupProgressViewController viewWillAppear:]", 30, "Progress ViewWillAppear\n");
  v15.receiver = self;
  v15.super_class = (Class)TVLatencySetupProgressViewController;
  -[TVLatencySetupBaseViewController viewWillAppear:](&v15, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = sub_100117218(v5, CFSTR("Localizable-TVLatency"), CFSTR("TLV_PREPARING_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = sub_100116484(CFSTR("TLV_PREPARING_SUBTITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_100117218(v8, CFSTR("Localizable-TVLatency"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(*(id *)((char *)&self->super._animationContainerView + 1), "setText:", v12);

  if (objc_msgSend(self->super.super._mainController, "testFlags"))
  {
    v13 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011A79C;
    block[3] = &unk_10017E1F0;
    block[4] = self;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupProgressViewController viewDidDisappear:]", 30, "Progress ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencySetupProgressViewController;
  -[TVLatencySetupProgressViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupProgressViewController handleDismissButton:]", 30, "Progress Dismiss button\n");
  objc_msgSend(self->super.super._mainController, "dismiss:", 5);

}

- (void)handleProgressEvent:(unsigned int)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  if (a3 == 277)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = sub_100117218(v11, CFSTR("Localizable-TVLatency"), CFSTR("TLV_LISTENING_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v13);

    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = sub_100117218(v15, CFSTR("Localizable-TVLatency"), CFSTR("TLV_LISTENING_SUBTITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(*(id *)((char *)&self->super._animationContainerView + 1), "setText:", v8);
  }
  else
  {
    if (a3 != 260)
      return;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = sub_100117218(v4, CFSTR("Localizable-TVLatency"), CFSTR("TLV_PREPARING_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v6);

    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = sub_100116484(CFSTR("TLV_PREPARING_SUBTITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = sub_100117218(v15, CFSTR("Localizable-TVLatency"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(*(id *)((char *)&self->super._animationContainerView + 1), "setText:", v10);

  }
}

- (UILabel)infoLabel
{
  return *(UILabel **)((char *)&self->super._animationContainerView + 1);
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)((char *)&self->super._animationContainerView + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->super._animationContainerView + 1), 0);
}

@end
