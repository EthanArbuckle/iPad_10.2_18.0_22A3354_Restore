@implementation RepairProgressViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairProgressViewController viewWillAppear:]", 30, "Progress ViewWillAppear\n");
  v6.receiver = self;
  v6.super_class = (Class)RepairProgressViewController;
  -[SVSBaseViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "productImage"));
  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setImage:", v5);

  objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setHidden:", 0);
  objc_msgSend(*(id *)((char *)&self->_progressView + 1), "startAnimating");
  objc_msgSend(*(id *)((char *)&self->_progressSpinner + 1), "setHidden:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairProgressViewController viewDidDisappear:]", 30, "Progress ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)RepairProgressViewController;
  -[RepairProgressViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairProgressViewController handleDismissButton:]", 30, "Dismiss button\n");
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
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
