@implementation BTShareAudioConnectingViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)BTShareAudioConnectingViewController;
  -[BTShareAudioBaseViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  -[BTShareAudioConnectingViewController _updateForDeviceInfo](self, "_updateForDeviceInfo");
  -[BTShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView startAnimating](self->_progressView, "startAnimating");
  CULocalizedStringEx();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setText:](self->_progressActivity, "setText:", v6);

  -[UILabel setHidden:](self->_progressLabel, "setHidden:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)BTShareAudioConnectingViewController;
  -[BTShareAudioBaseViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  -[BTShareAudioViewController setVcConnecting:](self->super._mainController, "setVcConnecting:", 0);
  -[UIImageView stop](self->_productImageView, "stop");
}

- (void)eventCancel:(id)a3
{
  id v4;

  v4 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[BTShareAudioViewController reportUserCancelled](self->super._mainController, "reportUserCancelled");

}

- (void)sessionProgressEvent:(int)a3 info:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  if (a3 == 300 || a3 == 220 || a3 == 200)
  {
    v9 = v6;
    -[BTShareAudioConnectingViewController _updateForDeviceInfo](self, "_updateForDeviceInfo");
    -[BTShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CULocalizedStringEx();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setText:](self->_progressActivity, "setText:", v8);

    v6 = v9;
  }

}

- (void)_updateForDeviceInfo
{
  UIButton *v3;
  void *v4;
  void *v5;
  unsigned int colorCode;
  id v7;
  id v8;
  _QWORD v9[6];

  v3 = self->_cancelButton;
  if (v3)
  {
    -[UILabel setText:](self->super._titleLabel, "setText:", v3);
  }
  else
  {
    -[BTShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_colorCode)
      SFLocalizedNameForBluetoothProductID();
    else
      CULocalizedStringEx();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->super._titleLabel, "setText:", v5);

  }
  -[UILabel setNumberOfLines:](self->super._titleLabel, "setNumberOfLines:", 2);
  colorCode = self->_colorCode;
  if (colorCode)
  {
    if (colorCode != *((_DWORD *)&self->super._viewActive + 1))
    {
      *((_DWORD *)&self->super._viewActive + 1) = colorCode;
      if (gLogCategory_BTShareAudioViewController <= 30
        && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7 = objc_alloc_init(MEMORY[0x24BE900F0]);
      objc_msgSend(v7, "setBluetoothProductID:", LOWORD(self->_colorCode));
      objc_msgSend(v7, "setColorCode:", self->_productIDActive);
      objc_msgSend(v7, "setTimeoutSeconds:", 5.0);
      v8 = objc_alloc_init(MEMORY[0x24BE900E8]);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __60__BTShareAudioConnectingViewController__updateForDeviceInfo__block_invoke;
      v9[3] = &unk_24FD30F40;
      v9[4] = v8;
      v9[5] = self;
      objc_msgSend(v8, "getDeviceAssets:completion:", v7, v9);

    }
  }
  else
  {
    -[BTShareAudioConnectingViewController _updateDeviceVisual:](self, "_updateDeviceVisual:", 0);
  }

}

void __60__BTShareAudioConnectingViewController__updateForDeviceInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 992))
  {
    objc_msgSend(v12, "assetBundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_BTShareAudioViewController <= 30
      && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v10 = v5;
      v11 = v6;
      v8 = *(unsigned int *)(v7 + 1004);
      v9 = *(unsigned int *)(v7 + 1000);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 40), "_updateDeviceVisual:", v6, v8, v9, v10, v11);

  }
}

- (void)_updateDeviceVisual:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *p_productID;
  void *v9;
  void *v10;
  void *v11;
  void *colorCode;
  uint64_t productIDActive;
  id v14;

  -[BTShareAudioViewController _moviePathForPID:colorCode:](self->super._mainController, "_moviePathForPID:colorCode:", self->_colorCode, self->_productIDActive);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@-Loop"), v14);
  -[BTShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("mov"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (gLogCategory_BTShareAudioViewController <= 30
      && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      colorCode = v6;
      LogPrintF();
    }
    -[UIImageView startMovieLoopWithPath:](self->_productImageView, "startMovieLoopWithPath:", v6, colorCode);
    -[UIImageView setHidden:](self->_productImageView, "setHidden:", 0);
  }
  else
  {
    -[BTShareAudioViewController _imageForPID:colorCode:](self->super._mainController, "_imageForPID:colorCode:", self->_colorCode, self->_productIDActive);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (gLogCategory_BTShareAudioViewController <= 30
        && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        colorCode = (void *)self->_colorCode;
        productIDActive = self->_productIDActive;
        LogPrintF();
      }
      p_productID = (id *)&self->_productID;
      objc_msgSend(*p_productID, "setImage:", v7, colorCode, productIDActive);
    }
    else
    {
      if (gLogCategory_BTShareAudioViewController <= 30
        && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v9 = (void *)MEMORY[0x24BDF6AC8];
      -[BTShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ShareAudioAirPods"), v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      p_productID = (id *)&self->_productMovieView;
      objc_msgSend(*p_productID, "setImage:", v11);

    }
    objc_msgSend(*p_productID, "setHidden:", 0);

  }
}

- (UIImageView)productImageView
{
  return *(UIImageView **)&self->_productID;
}

- (void)setProductImageView:(id)a3
{
  objc_storeStrong((id *)&self->_productID, a3);
}

- (BTMediaPlayerView)productMovieView
{
  return (BTMediaPlayerView *)self->_productImageView;
}

- (void)setProductMovieView:(id)a3
{
  objc_storeStrong((id *)&self->_productImageView, a3);
}

- (UIImageView)shareImageView
{
  return (UIImageView *)self->_productMovieView;
}

- (void)setShareImageView:(id)a3
{
  objc_storeStrong((id *)&self->_productMovieView, a3);
}

- (UIView)progressView
{
  return &self->_shareImageView->super;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_shareImageView, a3);
}

- (UIActivityIndicatorView)progressActivity
{
  return (UIActivityIndicatorView *)self->_progressView;
}

- (void)setProgressActivity:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (UILabel)progressLabel
{
  return (UILabel *)self->_progressActivity;
}

- (void)setProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_progressActivity, a3);
}

- (UIButton)cancelButton
{
  return (UIButton *)self->_progressLabel;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_progressLabel, a3);
}

- (unsigned)colorCode
{
  return self->_productIDActive;
}

- (void)setColorCode:(unsigned int)a3
{
  self->_productIDActive = a3;
}

- (NSString)deviceName
{
  return (NSString *)&self->_cancelButton->super.super.super.super.isa;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (unsigned)productID
{
  return self->_colorCode;
}

- (void)setProductID:(unsigned int)a3
{
  self->_colorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressActivity, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
  objc_storeStrong((id *)&self->_productID, 0);
}

@end
