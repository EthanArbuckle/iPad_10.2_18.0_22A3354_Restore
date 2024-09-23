@implementation AFUISiriEyesFreeView

- (AFUISiriEyesFreeView)initWithFrame:(CGRect)a3 eyesFreeMode:(int64_t)a4
{
  AFUISiriEyesFreeView *v5;
  AFUISiriEyesFreeView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFUISiriEyesFreeView;
  v5 = -[AFUISiriEyesFreeView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    -[AFUISiriEyesFreeView _configureEyesFreePresentation:](v5, "_configureEyesFreePresentation:", a4);
  return v6;
}

- (void)_configureEyesFreePresentation:(int64_t)a3
{
  SiriUIBackgroundBlurView *v4;
  SiriUIBackgroundBlurView *backdropView;
  SiriUIBackgroundBlurView *v6;
  id v7;
  void *v8;
  SiriUIVisualEffectView *v9;
  SiriUIVisualEffectView *eyesFreeEffectView;
  void *v11;
  UIImageView *v12;
  UIImageView *eyesFreeLogoView;
  double Width;
  double Height;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v31 = *MEMORY[0x24BDAC8D0];
  self->_eyesFreeMode = a3;
  if (a3 == 1)
  {
    -[AFUISiriEyesFreeView backdropView](self, "backdropView");
    v4 = (SiriUIBackgroundBlurView *)objc_claimAutoreleasedReturnValue();
    backdropView = self->_backdropView;
    self->_backdropView = v4;

    v6 = self->_backdropView;
    -[AFUISiriEyesFreeView bounds](self, "bounds");
    -[SiriUIBackgroundBlurView setFrame:](v6, "setFrame:");
    -[AFUISiriEyesFreeView addSubview:](self, "addSubview:", self->_backdropView);
    v7 = objc_alloc(MEMORY[0x24BEA8530]);
    objc_msgSend(MEMORY[0x24BEBDAF0], "siriui_platterVibrancyEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (SiriUIVisualEffectView *)objc_msgSend(v7, "initWithEffect:", v8);
    eyesFreeEffectView = self->_eyesFreeEffectView;
    self->_eyesFreeEffectView = v9;

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("car.fill"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v11);
    eyesFreeLogoView = self->_eyesFreeLogoView;
    self->_eyesFreeLogoView = v12;

    -[UIImageView setContentMode:](self->_eyesFreeLogoView, "setContentMode:", 1);
    -[SiriUIVisualEffectView setCustomView:](self->_eyesFreeEffectView, "setCustomView:", self->_eyesFreeLogoView);
    -[AFUISiriEyesFreeView bounds](self, "bounds");
    Width = CGRectGetWidth(v32);
    -[AFUISiriEyesFreeView bounds](self, "bounds");
    Height = CGRectGetHeight(v33);
    if (Width <= Height)
      v16 = Height;
    else
      v16 = Width;
    if (Width <= Height)
      v17 = Width;
    else
      v17 = Height;
    -[UIImageView setFrame:](self->_eyesFreeLogoView, "setFrame:", 0.0, 0.0, 160.0, 160.0);
    -[SiriUIVisualEffectView setFrame:](self->_eyesFreeEffectView, "setFrame:", v17 * 0.5 + -80.0, v16 * 0.44 + -160.0, 160.0, 160.0);
    -[AFUISiriEyesFreeView checkForAndReportEyesFreeLogoBug](self, "checkForAndReportEyesFreeLogoBug");
    v18 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[AFUISiriEyesFreeView bounds](self, "bounds");
      NSStringFromCGRect(v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUIVisualEffectView frame](self->_eyesFreeEffectView, "frame");
      NSStringFromCGRect(v35);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView frame](self->_eyesFreeLogoView, "frame");
      NSStringFromCGRect(v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 136315906;
      v24 = "-[AFUISiriEyesFreeView _configureEyesFreePresentation:]";
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      v29 = 2112;
      v30 = v22;
      _os_log_impl(&dword_217514000, v19, OS_LOG_TYPE_DEFAULT, "%s 🚗📱 Logging for rdar://108858965 AFUISiriEyesFreeView bounds: %@. _eyesFreeEffectView frame: %@. _eyesFreeLogoView—frame: %@", (uint8_t *)&v23, 0x2Au);

    }
    -[AFUISiriEyesFreeView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_eyesFreeEffectView, self->_backdropView);

  }
}

- (void)checkForAndReportEyesFreeLogoBug
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[AFUISiriEyesFreeView checkForAndReportEyesFreeLogoBug]";
  _os_log_error_impl(&dword_217514000, log, OS_LOG_TYPE_ERROR, "%s 🚗📱 Error: Logging for rdar://108858965 — AFUISiriEyesFreeView width > height in EyesFree mode", (uint8_t *)&v1, 0xCu);
}

- (id)backdropView
{
  SiriUIBackgroundBlurView *backdropView;
  id v4;
  SiriUIBackgroundBlurView *v5;
  SiriUIBackgroundBlurView *v6;

  backdropView = self->_backdropView;
  if (!backdropView)
  {
    v4 = objc_alloc(MEMORY[0x24BEA84E0]);
    -[AFUISiriEyesFreeView bounds](self, "bounds");
    v5 = (SiriUIBackgroundBlurView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_backdropView;
    self->_backdropView = v5;

    -[SiriUIBackgroundBlurView setVisible:](self->_backdropView, "setVisible:", 1);
    backdropView = self->_backdropView;
  }
  return backdropView;
}

- (int64_t)eyesFreeMode
{
  return self->_eyesFreeMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eyesFreeLogoView, 0);
  objc_storeStrong((id *)&self->_eyesFreeEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
