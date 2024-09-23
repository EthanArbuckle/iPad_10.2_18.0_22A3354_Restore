@implementation TVLatencySetupTryAgainViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupTryAgainViewController viewWillAppear:]", 30, "TryAgain ViewWillAppear\n");
  v8.receiver = self;
  v8.super_class = (Class)TVLatencySetupTryAgainViewController;
  -[TVLatencySetupBaseViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v5, "setSwipeDismissible:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circle.fill")));
  objc_msgSend(*(id *)((char *)&self->_error + 1), "setImage:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.circle")));
  objc_msgSend(*(id *)((char *)&self->_statusImageViewFill + 1), "setImage:", v7);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupTryAgainViewController viewDidDisappear:]", 30, "TryAgain ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)TVLatencySetupTryAgainViewController;
  -[TVLatencySetupTryAgainViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleTryAgainButton:(id)a3
{
  id v4;
  id mainController;
  void *v6;
  id v7;

  v7 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupTryAgainViewController handleTryAgainButton:]", 30, "TryAgain button\n");
  v4 = objc_msgSend(self->super.super._mainController, "testFlags");
  mainController = self->super.super._mainController;
  if (!v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(mainController, "latencySetupSession"));
    objc_msgSend(v6, "tryAgain");

    mainController = self->super.super._mainController;
  }
  objc_msgSend(mainController, "showProgressUI");

}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupTryAgainViewController handleDismissButton:]", 30, "TryAgain button\n");
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

- (UIImageView)statusImageViewFill
{
  return *(UIImageView **)((char *)&self->_error + 1);
}

- (void)setStatusImageViewFill:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_error + 1), a3);
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
  objc_storeStrong((id *)((char *)&self->_error + 1), 0);
  objc_storeStrong((id *)((char *)&self->super._animationContainerView + 1), 0);
}

@end
