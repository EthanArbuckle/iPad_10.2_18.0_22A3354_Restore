@implementation BTShareAudioHoldButtonViewController

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
  v10.super_class = (Class)BTShareAudioHoldButtonViewController;
  -[BTShareAudioBaseViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  -[BTShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CULocalizedStringEx();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_infoLabel, "setText:", v6);

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
    v9[2] = __55__BTShareAudioHoldButtonViewController_viewWillAppear___block_invoke;
    v9[3] = &unk_24FD30F40;
    v9[4] = v8;
    v9[5] = self;
    objc_msgSend(v8, "getDeviceAssets:completion:", v7, v9);

  }
  else
  {
    -[BTShareAudioHoldButtonViewController _updateDeviceVisual:](self, "_updateDeviceVisual:", 0);
  }

}

void __55__BTShareAudioHoldButtonViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v5.super_class = (Class)BTShareAudioHoldButtonViewController;
  -[BTShareAudioBaseViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  -[BTMediaPlayerView stop](self->_productMovieView, "stop");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int colorCode;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)BTShareAudioHoldButtonViewController;
  -[BTShareAudioHoldButtonViewController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  -[UIView layer](self->_productMovieContainerView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mask");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    colorCode = self->_colorCode;

    if (colorCode != 8202)
      return;
    objc_msgSend(MEMORY[0x24BDE56B8], "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self->_productMovieContainerView, "bounds");
    objc_msgSend(v3, "setFrame:");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13[0] = objc_msgSend(v7, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13[1] = objc_msgSend(v8, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13[2] = objc_msgSend(v9, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.0);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13[3] = objc_msgSend(v10, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setColors:", v11);

    objc_msgSend(v3, "setLocations:", &unk_24FD32B88);
    objc_msgSend(v3, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v3, "setEndPoint:", 0.5, 1.0);
    -[UIView layer](self->_productMovieContainerView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMask:", v3);
  }

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

- (id)_holdImageForPID:(unsigned int)a3 colorCode:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3 - 8194;
  if (v5 > 0x22)
    goto LABEL_8;
  if (((1 << (a3 - 2)) & 0x472863101) == 0)
  {
    if (v5 == 9)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("ShareAudioDetail-PID-%u-CL_1-Hold"), 8203);
      goto LABEL_4;
    }
LABEL_8:
    -[BTShareAudioViewController _imageForPID:colorCode:](self->super._mainController, "_imageForPID:colorCode:", *(_QWORD *)&a3, *(_QWORD *)&a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("ShareAudioDetail-PID-%u-CL_0-Hold"), *(_QWORD *)&a3);
LABEL_4:
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x24BDF6AC8];
  -[BTShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@-Hold"), v14);
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
      -[UIImageView setHidden:](self->_productImageView, "setHidden:", 1);
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

- (UIView)productMovieContainerView
{
  return self->_productMovieContainerView;
}

- (void)setProductMovieContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_productMovieContainerView, a3);
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shareImageView, a3);
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (unsigned)colorCode
{
  return *((_DWORD *)&self->super._viewActive + 1);
}

- (void)setColorCode:(unsigned int)a3
{
  *((_DWORD *)&self->super._viewActive + 1) = a3;
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
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_productMovieContainerView, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
}

@end
