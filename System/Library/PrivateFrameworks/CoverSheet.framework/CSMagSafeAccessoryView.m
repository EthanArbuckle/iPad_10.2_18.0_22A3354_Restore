@implementation CSMagSafeAccessoryView

- (CSMagSafeAccessoryView)initWithFrame:(CGRect)a3
{
  CSMagSafeAccessoryView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSMagSafeAccessoryView;
  v3 = -[CSMagSafeAccessoryView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CSMagSafeAccessoryConfiguration defaultConfiguration](CSMagSafeAccessoryConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSMagSafeAccessoryView setConfiguration:](v3, "setConfiguration:", v4);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSMagSafeAccessoryView;
  -[CSMagSafeAccessoryView layoutSubviews](&v12, sel_layoutSubviews);
  -[CSMagSafeAccessoryView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CSMagSafeAccessoryView setFrame:](self, "setFrame:", v5, v7, v9, v11);
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  id v5;

  p_legibilitySettings = &self->_legibilitySettings;
  v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](*p_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)objc_storeStrong((id *)p_legibilitySettings, a3);

}

- (CSMagSafeAccessoryConfiguration)configuration
{
  return self->_configuration;
}

- (double)animationDurationBeforeDismissal
{
  return 0.0;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
