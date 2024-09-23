@implementation CSFocusActivityIndicator

- (CSFocusActivityIndicator)init
{
  CSFocusActivityIndicator *v2;
  CSFocusActivityIndicator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSFocusActivityIndicator;
  v2 = -[CSFocusActivityIndicator init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSFocusActivityIndicator _setSelected:](v2, "_setSelected:", 1);
    -[UICoverSheetButton setPronounced:](v3, "setPronounced:", 1);
    -[UICoverSheetButton setShouldUseContinuousCorners:](v3, "setShouldUseContinuousCorners:", 1);
    -[UICoverSheetButton setImageContentMode:](v3, "setImageContentMode:", 1);
    -[UICoverSheetButton setStatisticsIdentifier:](v3, "setStatisticsIdentifier:", CFSTR("focusActivityIndicator"));
    -[CSFocusActivityIndicator setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("focus-activity-orb-button"));
  }
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSFocusActivityIndicator;
  -[CSFocusActivityIndicator setEnabled:](&v4, sel_setEnabled_, a3);
  -[CSFocusActivityIndicator _updateStyle](self, "_updateStyle");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "activityIndicatorSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "sb_isEqualToLegibilitySettings:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[CSFocusActivityIndicator _updateStyle](self, "_updateStyle");
  }

}

- (void)setActivity:(id)a3
{
  FCActivityDescribing *v5;
  FCActivityDescribing **p_activity;
  FCActivityDescribing *v7;

  v5 = (FCActivityDescribing *)a3;
  p_activity = &self->_activity;
  if (self->_activity != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_activity, a3);
    if (*p_activity)
      objc_storeStrong((id *)&self->_previousActivity, *p_activity);
    -[CSFocusActivityIndicator _updateForActivity](self, "_updateForActivity");
    -[CSFocusActivityIndicator setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", -[CSFocusActivityIndicator _userInterfaceStyleForCurrentActivity](self, "_userInterfaceStyleForCurrentActivity"));
    v5 = v7;
  }

}

+ (CGSize)activityIndicatorSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 60.0;
  v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)activityIndicatorExpandedSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "activityIndicatorSize");
  v3 = v2 + 29.0;
  v5 = v4 + 20.0;
  result.height = v3;
  result.width = v5;
  return result;
}

- (void)_setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSFocusActivityIndicator;
  if (-[CSFocusActivityIndicator respondsToSelector:](&v7, sel_respondsToSelector_, sel_setSelected_animated_))
  {
    v6.receiver = self;
    v6.super_class = (Class)CSFocusActivityIndicator;
    -[CSFocusActivityIndicator setSelected:animated:](&v6, sel_setSelected_animated_, v3, 1);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSFocusActivityIndicator;
    -[UICoverSheetButton setSelected:](&v5, sel_setSelected_, v3);
  }
}

- (void)_updateStyle
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;

  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[CSFocusActivityIndicator isEnabled](self, "isEnabled") & 1) != 0)
  {
    v3 = v5;
  }
  else
  {
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.25);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  v6 = v3;
  -[CSFocusActivityIndicator setTintColor:](self, "setTintColor:", v3);

}

- (void)_updateForActivity
{
  FCActivityDescribing *activity;
  FCActivityDescribing *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  activity = self->_activity;
  if (!activity)
    activity = self->_previousActivity;
  v4 = activity;
  -[FCActivityDescribing activitySymbolImageName](v4, "activitySymbolImageName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICoverSheetButton setSelectedImage:](self, "setSelectedImage:", v6);
  -[UICoverSheetButton setImage:](self, "setImage:", v6);
  objc_msgSend(MEMORY[0x1E0CEA478], "fcui_colorForActivity:", self->_activity);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICoverSheetButton setSelectedTintColor:](self, "setSelectedTintColor:", v7);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSFocusActivityIndicator setTintColor:](self, "setTintColor:", v8);

  -[FCActivityDescribing activityDisplayName](self->_activity, "activityDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICoverSheetButton setLocalizedAccessoryTitle:](self, "setLocalizedAccessoryTitle:", v9);
  -[CSFocusActivityIndicator _setSelected:](self, "_setSelected:", self->_activity != 0);
  -[CSFocusActivityIndicator setNeedsLayout](self, "setNeedsLayout");

}

- (int64_t)_userInterfaceStyleForCurrentActivity
{
  if (self->_activity)
    return 1;
  else
    return 2;
}

- (double)strength
{
  return self->_strength;
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (FCActivityDescribing)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_previousActivity, 0);
}

@end
