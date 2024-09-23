@implementation HRElectrocardiogramSessionSimulationView

- (HRElectrocardiogramSessionSimulationView)initWithFrame:(CGRect)a3 isLargeDevice:(BOOL)a4
{
  _BOOL8 v4;
  HRElectrocardiogramSessionSimulationView *v5;
  HRElectrocardiogramSessionSimulationView *v6;
  HRElectrocardiogramSessionScreenView *v7;
  HRElectrocardiogramSessionScreenView *screenView;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HRElectrocardiogramSessionSimulationView;
  v5 = -[HRElectrocardiogramSessionSimulationView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_isLargeDevice = v4;
    v7 = -[HRElectrocardiogramSessionScreenView initWithLargeDevice:]([HRElectrocardiogramSessionScreenView alloc], "initWithLargeDevice:", v4);
    screenView = v6->_screenView;
    v6->_screenView = v7;

    -[HRElectrocardiogramSessionSimulationView _setUpUI](v6, "_setUpUI");
  }
  return v6;
}

- (HRElectrocardiogramSessionSimulationView)initWithFrame:(CGRect)a3
{
  return -[HRElectrocardiogramSessionSimulationView initWithFrame:isLargeDevice:](self, "initWithFrame:isLargeDevice:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setUpUI
{
  void *v3;
  void *v4;
  id v5;

  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionSimulationView addSubview:](self, "addSubview:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionSimulationView setBackgroundColor:](self, "setBackgroundColor:", v4);

  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

}

- (void)layoutSubviews
{
  double MidX;
  double MidY;
  void *v5;
  void *v6;
  __int128 v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  CGFloat v18;
  void *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  _OWORD v22[3];
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)HRElectrocardiogramSessionSimulationView;
  -[HRElectrocardiogramSessionSimulationView layoutSubviews](&v23, sel_layoutSubviews);
  -[HRElectrocardiogramSessionSimulationView bounds](self, "bounds");
  MidX = CGRectGetMidX(v24);
  -[HRElectrocardiogramSessionSimulationView bounds](self, "bounds");
  MidY = CGRectGetMidY(v25);
  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCenter:", MidX, MidY);

  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v22[0] = *MEMORY[0x24BDBD8B8];
  v22[1] = v7;
  v22[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v6, "setTransform:", v22);

  -[HRElectrocardiogramSessionSimulationView bounds](self, "bounds");
  v9 = v8;
  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v9 / v11;

  -[HRElectrocardiogramSessionSimulationView bounds](self, "bounds");
  v14 = v13;
  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v14 / v16;

  if (v12 >= v17)
    v18 = v17;
  else
    v18 = v12;
  CGAffineTransformMakeScale(&v21, v18, v18);
  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v21;
  objc_msgSend(v19, "setTransform:", &v20);

}

- (double)cornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadius");
  v5 = v4;

  return v5;
}

- (void)setCornerRadius:(double)a3
{
  void *v4;
  id v5;

  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)setTimeRemaining:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countdownValueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v6);

  HRUIECGLocalizedString(CFSTR("SESSION_COUNTDOWN_SECONDS_UNIT"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionSimulationView screenView](self, "screenView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "countdownUnitLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

}

- (BOOL)isLargeDevice
{
  return self->_isLargeDevice;
}

- (HRElectrocardiogramSessionScreenView)screenView
{
  return self->_screenView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenView, 0);
}

@end
