@implementation BTShareAudioConfirmViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[6];
  objc_super v10;

  v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10.receiver = self;
  v10.super_class = (Class)BTShareAudioConfirmViewController;
  -[BTShareAudioBaseViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  if (self->_deviceName)
  {
    -[UILabel setText:](self->super._titleLabel, "setText:");
  }
  else
  {
    if (self->_colorCode)
    {
      SFLocalizedNameForBluetoothProductID();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->super._titleLabel, "setText:", v5);
    }
    else
    {
      -[BTShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CULocalizedStringEx();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->super._titleLabel, "setText:", v6);

    }
  }
  -[UILabel setNumberOfLines:](self->super._titleLabel, "setNumberOfLines:", 2);
  if (self->_colorCode)
  {
    if (gLogCategory_BTShareAudioViewController <= 30
      && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = objc_alloc_init(MEMORY[0x24BE900F0]);
    objc_msgSend(v7, "setBluetoothProductID:", LOWORD(self->_colorCode));
    objc_msgSend(v7, "setColorCode:", *((unsigned int *)&self->super._viewActive + 1));
    objc_msgSend(v7, "setTimeoutSeconds:", 5.0);
    v8 = objc_alloc_init(MEMORY[0x24BE900E8]);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__BTShareAudioConfirmViewController_viewWillAppear___block_invoke;
    v9[3] = &unk_24FD30F40;
    v9[4] = v8;
    v9[5] = self;
    objc_msgSend(v8, "getDeviceAssets:completion:", v7, v9);

  }
  else
  {
    -[BTShareAudioConfirmViewController _updateDeviceVisual:](self, "_updateDeviceVisual:", 0);
  }
}

void __52__BTShareAudioConfirmViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
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
      v8 = *(unsigned int *)(v7 + 1000);
      v9 = *(unsigned int *)(v7 + 996);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 40), "_updateDeviceVisual:", v6, v8, v9, v10, v11);

  }
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
  v5.super_class = (Class)BTShareAudioConfirmViewController;
  -[BTShareAudioBaseViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  -[BTMediaPlayerView stop](self->_productMovieView, "stop");
}

- (void)eventTemporarilyShareButton:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[BTShareAudioViewController shareAudioSession](self->super._mainController, "shareAudioSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userConfirmed:", 0);

}

- (void)eventPermanentButton:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[BTShareAudioViewController shareAudioSession](self->super._mainController, "shareAudioSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userConfirmed:", 1);

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

- (void)_updateDeviceVisual:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImageView **p_productImageView;
  void *v9;
  void *v10;
  void *v11;
  void *colorCode;
  uint64_t v13;
  id v14;

  -[BTShareAudioViewController _moviePathForPID:colorCode:](self->super._mainController, "_moviePathForPID:colorCode:", self->_colorCode, *((unsigned int *)&self->super._viewActive + 1));
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
    -[BTMediaPlayerView startMovieLoopWithPath:](self->_productMovieView, "startMovieLoopWithPath:", v6, colorCode);
    -[BTMediaPlayerView setHidden:](self->_productMovieView, "setHidden:", 0);
  }
  else
  {
    -[BTShareAudioViewController _imageForPID:colorCode:](self->super._mainController, "_imageForPID:colorCode:", self->_colorCode, *((unsigned int *)&self->super._viewActive + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (gLogCategory_BTShareAudioViewController <= 30
        && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        colorCode = (void *)self->_colorCode;
        v13 = *((unsigned int *)&self->super._viewActive + 1);
        LogPrintF();
      }
      p_productImageView = &self->_productImageView;
      -[UIImageView setImage:](*p_productImageView, "setImage:", v7, colorCode, v13);
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
      p_productImageView = &self->_shareImageView;
      -[UIImageView setImage:](*p_productImageView, "setImage:", v11);

    }
    -[UIImageView setHidden:](*p_productImageView, "setHidden:", 0);

  }
}

- (UIImageView)productImageView
{
  return self->_productImageView;
}

- (void)setProductImageView:(id)a3
{
  objc_storeStrong((id *)&self->_productImageView, a3);
}

- (BTMediaPlayerView)productMovieView
{
  return self->_productMovieView;
}

- (void)setProductMovieView:(id)a3
{
  objc_storeStrong((id *)&self->_productMovieView, a3);
}

- (UIButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shareImageView, a3);
}

- (unsigned)colorCode
{
  return *((_DWORD *)&self->super._viewActive + 1);
}

- (void)setColorCode:(unsigned int)a3
{
  *((_DWORD *)&self->super._viewActive + 1) = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
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
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
}

@end
