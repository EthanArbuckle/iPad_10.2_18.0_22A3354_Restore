@implementation TVLatencySetupDoneViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupDoneViewController viewWillAppear:]", 30, "Done ViewWillAppear\n");
  v16.receiver = self;
  v16.super_class = (Class)TVLatencySetupDoneViewController;
  -[TVLatencySetupBaseViewController viewWillAppear:](&v16, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v5, "setSwipeDismissible:", 1);

  if (*(UIView **)((char *)&self->super._animationContainerView + 1))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = sub_100117218(v6, CFSTR("Localizable-TVLatency"), CFSTR("TLV_FAILED_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = sub_100117218(v9, CFSTR("Localizable-TVLatency"), CFSTR("TLV_FAILED_SUBTITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(*(id *)((char *)&self->_error + 1), "setText:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v13 = CFSTR("exclamationmark.circle");
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    v13 = CFSTR("checkmark.circle");
  }
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setTintColor:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circle.fill")));
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setImage:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v13));
  objc_msgSend(*(id *)((char *)&self->_statusImageViewFill + 1), "setImage:", v15);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupDoneViewController viewDidDisappear:]", 30, "Done ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencySetupDoneViewController;
  -[TVLatencySetupDoneViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupDoneViewController handleDismissButton:]", 30, "Done button\n");
  objc_msgSend(self->super.super._mainController, "dismiss:", 5);

}

- (NSError)error
{
  return *(NSError **)((char *)&self->super._animationContainerView + 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 49);
}

- (UILabel)infoLabel
{
  return *(UILabel **)((char *)&self->_error + 1);
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_error + 1), a3);
}

- (UIImageView)statusImageViewFill
{
  return *(UIImageView **)((char *)&self->_infoLabel + 1);
}

- (void)setStatusImageViewFill:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), a3);
}

- (UIImageView)statusImageViewIcon
{
  return *(UIImageView **)((char *)&self->_statusImageViewFill + 1);
}

- (void)setStatusImageViewIcon:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_statusImageViewFill + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_statusImageViewFill + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_error + 1), 0);
  objc_storeStrong((id *)((char *)&self->super._animationContainerView + 1), 0);
}

@end
