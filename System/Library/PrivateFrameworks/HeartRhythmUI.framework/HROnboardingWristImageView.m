@implementation HROnboardingWristImageView

- (HROnboardingWristImageView)initWithImageStyle:(int64_t)a3
{
  HROnboardingWristImageView *v4;
  HROnboardingWristImageView *v5;
  id v6;
  void *v7;
  uint64_t v8;
  UIImageView *wristWatchImageView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIView *wristWatchContentView;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HROnboardingWristImageView;
  v4 = -[HROnboardingWristImageView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_watchImageStyle = a3;
    v6 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(MEMORY[0x24BDF6AC8], "hrui_ECGOnboardingWristImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithImage:", v7);
    wristWatchImageView = v5->_wristWatchImageView;
    v5->_wristWatchImageView = (UIImageView *)v8;

    -[HROnboardingWristImageView wristWatchImageView](v5, "wristWatchImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingWristImageView addSubview:](v5, "addSubview:", v10);

    -[HROnboardingWristImageView wristWatchImageView](v5, "wristWatchImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_alignConstraintsWithView:", v5);

    -[HROnboardingWristImageView wristWatchImageView](v5, "wristWatchImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    -[UIView hrui_constraintAspectRatioFromSize:](v5, "hrui_constraintAspectRatioFromSize:");

    -[HROnboardingWristImageView _wristWatchContentViewForStyle:](v5, "_wristWatchContentViewForStyle:", a3);
    v14 = objc_claimAutoreleasedReturnValue();
    wristWatchContentView = v5->_wristWatchContentView;
    v5->_wristWatchContentView = (UIView *)v14;

    -[HROnboardingWristImageView addSubview:](v5, "addSubview:", v5->_wristWatchContentView);
  }
  return v5;
}

- (id)_wristWatchContentViewForStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  HRElectrocardiogramSessionSimulationView *v6;
  HRElectrocardiogramSessionSimulationView *v7;

  if (a3 == 1)
  {
    v7 = [HRElectrocardiogramSessionSimulationView alloc];
    v6 = -[HRElectrocardiogramSessionSimulationView initWithFrame:isLargeDevice:](v7, "initWithFrame:isLargeDevice:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRElectrocardiogramSessionSimulationView setBackgroundColor:](v6, "setBackgroundColor:", v5);
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)MEMORY[0x24BDF6AC8];
    HRHeartRhythmUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ECG-Setup"), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (HRElectrocardiogramSessionSimulationView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v5);
  }

  return v6;
}

- (void)layoutSubviews
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HROnboardingWristImageView;
  -[HROnboardingWristImageView layoutSubviews](&v15, sel_layoutSubviews);
  v3 = objc_msgSend(MEMORY[0x24BDF6D38], "hrui_currentDeviceHasLargePhoneScreen");
  if (v3)
    v4 = 0.473;
  else
    v4 = 0.475;
  if (v3)
    v5 = 0.294;
  else
    v5 = 0.324;
  if (v3)
    v6 = 0.233;
  else
    v6 = 0.232;
  if (v3)
    v7 = 0.353;
  else
    v7 = 0.338;
  -[HROnboardingWristImageView bounds](self, "bounds");
  v9 = v8 * v7;
  v11 = v10 * v6;
  v12 = v8 * v5;
  v13 = v10 * v4;
  -[HROnboardingWristImageView wristWatchContentView](self, "wristWatchContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v9, v11, v12, v13);

}

- (void)setContentMode:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HROnboardingWristImageView;
  -[HROnboardingWristImageView setContentMode:](&v6, sel_setContentMode_);
  -[HROnboardingWristImageView wristWatchImageView](self, "wristWatchImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", a3);

}

- (void)setTimeRemaining:(double)a3
{
  void *v5;
  char isKindOfClass;
  id v7;

  -[HROnboardingWristImageView wristWatchContentView](self, "wristWatchContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HROnboardingWristImageView wristWatchContentView](self, "wristWatchContentView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeRemaining:", a3);

  }
}

- (int64_t)watchImageStyle
{
  return self->_watchImageStyle;
}

- (UIImageView)wristWatchImageView
{
  return self->_wristWatchImageView;
}

- (UIView)wristWatchContentView
{
  return self->_wristWatchContentView;
}

- (void)setWristWatchContentView:(id)a3
{
  objc_storeStrong((id *)&self->_wristWatchContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristWatchContentView, 0);
  objc_storeStrong((id *)&self->_wristWatchImageView, 0);
}

@end
