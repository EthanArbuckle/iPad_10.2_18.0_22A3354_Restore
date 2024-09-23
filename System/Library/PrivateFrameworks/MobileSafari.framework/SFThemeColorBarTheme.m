@implementation SFThemeColorBarTheme

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (SFThemeColorBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  SFThemeColorBarTheme *v15;
  SFThemeColorBarTheme *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  UITraitCollection *traitCollection;
  SFThemeColorBarTheme *v22;
  objc_super v24;

  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = v10;
    v12 = 0;
  }
  else
  {
    v13 = v9;
    if (objc_msgSend(MEMORY[0x1E0D8AD30], "shouldOverrideTintColorForThemeColor:", v13))
    {
      if ((objc_msgSend(v13, "safari_meetsThresholdForDarkAppearance") & 1) != 0)
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    v11 = v14;
    v12 = v11;
  }
  v24.receiver = self;
  v24.super_class = (Class)SFThemeColorBarTheme;
  v15 = -[_SFBarTheme initWithBarTintStyle:preferredBarTintColor:controlsTintColor:](&v24, sel_initWithBarTintStyle_preferredBarTintColor_controlsTintColor_, a3, v9, v11);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_themeColor, a4);
    if (v12)
      v17 = v12;
    else
      v17 = v11;
    objc_storeStrong((id *)&v16->_overrideTintColor, v17);
    v18 = -[_SFBarTheme overrideUserInterfaceStyle](v16, "overrideUserInterfaceStyle");
    v16->_userInterfaceStyle = v18;
    if (v9)
    {
      if (objc_msgSend(v9, "safari_meetsThresholdForDarkAppearance"))
        v19 = 2;
      else
        v19 = 1;
      v16->_userInterfaceStyle = v19;
    }
    else
    {
      v19 = v18;
    }
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    traitCollection = v16->_traitCollection;
    v16->_traitCollection = (UITraitCollection *)v20;

    v22 = v16;
  }

  return v16;
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

- (BOOL)isEqual:(id)a3
{
  SFThemeColorBarTheme *v4;
  unsigned __int8 *v5;
  char v6;
  objc_super v8;

  v4 = (SFThemeColorBarTheme *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFThemeColorBarTheme;
    if (-[_SFBarTheme isEqual:](&v8, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      if (self->_appliesDarkeningOverlay == v5[80] && WBSIsEqual())
        v6 = WBSIsEqual();
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)prefersThemeColorEffect
{
  return 1;
}

- (void)setBackdropGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)backdropEffects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFThemeColorBarTheme;
  -[_SFBarTheme backdropEffects](&v10, sel_backdropEffects);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_appliesDarkeningOverlay)
  {
    v5 = (void *)MEMORY[0x1E0DC3F50];
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectCompositingColor:withMode:alpha:", v6, 0, 0.03);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "arrayByAddingObject:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

- (id)backdropEffect
{
  UIBlurEffect *overrideBackdropEffect;
  objc_super v4;

  overrideBackdropEffect = self->_overrideBackdropEffect;
  if (overrideBackdropEffect)
    return overrideBackdropEffect;
  v4.receiver = self;
  v4.super_class = (Class)SFThemeColorBarTheme;
  -[_SFBarTheme backdropEffect](&v4, sel_backdropEffect);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideBackdropEffect, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_overrideTintColor, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
}

- (void)setAppliesDarkeningOverlay:(BOOL)a3
{
  self->_appliesDarkeningOverlay = a3;
}

- (void)setOverrideBackdropEffect:(id)a3
{
  objc_storeStrong((id *)&self->_overrideBackdropEffect, a3);
}

- (void)applyBackdropEffectsToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFThemeColorBarTheme themeColor](self, "themeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SFThemeColorBarTheme backdropEffect](self, "backdropEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundEffects:", v7);

    objc_msgSend(v4, "setContentEffects:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.85);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SFThemeColorBarTheme;
    -[_SFBarTheme applyBackdropEffectsToView:](&v10, sel_applyBackdropEffectsToView_, v4);
  }
  if (self->_backdropGroupName)
    objc_msgSend(v4, "_setGroupName:");

}

+ (BOOL)canTintPrivateStyles
{
  return 1;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)appliesDarkeningOverlay
{
  return self->_appliesDarkeningOverlay;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (UIBlurEffect)overrideBackdropEffect
{
  return self->_overrideBackdropEffect;
}

@end
