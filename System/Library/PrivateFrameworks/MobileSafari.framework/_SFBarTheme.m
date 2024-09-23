@implementation _SFBarTheme

- (_SFBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  id v8;
  id v9;
  _SFBarTheme *v10;
  _SFBarTheme *v11;
  int v12;
  int v13;
  BOOL v15;
  UIColor *v16;
  UIColor *controlsTintColor;
  UIColor *v18;
  UIColor *v19;
  double v20;
  void *v21;
  UIColor *platterProgressBarTintColor;
  uint64_t v23;
  void *v24;
  UIBlurEffect *v25;
  UIBlurEffect *backdropEffect;
  void *v27;
  uint64_t v28;
  NSArray *backdropAdjustmentEffects;
  _SFBarTheme *v30;
  _OWORD v32[5];
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if ((unint64_t)(a3 - 1) >= 2 && (objc_msgSend((id)objc_opt_class(), "canTintPrivateStyles") & 1) == 0)
  {

    v8 = 0;
    v9 = 0;
  }
  v33.receiver = self;
  v33.super_class = (Class)_SFBarTheme;
  v10 = -[_SFBarTheme init](&v33, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_tintStyle = a3;
    if (v8)
      v12 = objc_msgSend(v8, "sf_isDarkColor");
    else
      v12 = objc_msgSend((id)objc_opt_class(), "backdropIsDarkForStyle:", a3);
    v13 = v12;
    v11->_backdropIsDark = v12;
    v15 = a3 == 5 || v8 != 0;
    v11->_backdropIsTinted = v15;
    objc_storeStrong((id *)&v11->_preferredBarTintColor, v8);
    objc_storeStrong((id *)&v11->_preferredControlsTintColor, v9);
    if (v9)
    {
      v16 = (UIColor *)v9;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "controlsTintColorForStyle:", a3);
      v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    controlsTintColor = v11->_controlsTintColor;
    v11->_controlsTintColor = v16;

    v18 = v11->_controlsTintColor;
    v19 = 0;
    switch(a3)
    {
      case 0:
        goto LABEL_25;
      case 1:
      case 2:
      case 5:
        v20 = 1.0;
        goto LABEL_22;
      case 3:
        v20 = 0.4;
        goto LABEL_22;
      case 4:
        v20 = 0.5;
        goto LABEL_22;
      default:
        v20 = 0.0;
LABEL_22:
        if ((_SFIsPrivateTintStyle(a3) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "colorWithAlphaComponent:", v20);
          v19 = (UIColor *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v19 = v18;
        }
LABEL_25:

        platterProgressBarTintColor = v11->_platterProgressBarTintColor;
        v11->_platterProgressBarTintColor = v19;

        v23 = 1;
        if (v13)
          v23 = 2;
        v11->_overrideUserInterfaceStyle = v23;
        v24 = (void *)objc_opt_class();
        if (v8)
        {
          if (objc_msgSend(v24, "prefersThemeColorEffect"))
          {
            if (plainBlurEffect_onceToken[0] != -1)
              dispatch_once(plainBlurEffect_onceToken, &__block_literal_global_65);
            v25 = (UIBlurEffect *)(id)plainBlurEffect_effect;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC3510], "_effectWithTintColor:", v8);
            v25 = (UIBlurEffect *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          objc_msgSend(v24, "backdropEffectForStyle:", a3);
          v25 = (UIBlurEffect *)objc_claimAutoreleasedReturnValue();
        }
        backdropEffect = v11->_backdropEffect;
        v11->_backdropEffect = v25;

        if (a3 == 4)
        {
          v32[0] = xmmword_18BAD5420;
          v32[1] = xmmword_18BAD5430;
          v32[2] = xmmword_18BAD5440;
          v32[3] = xmmword_18BAD5450;
          v32[4] = xmmword_18BAD5460;
          objc_msgSend(MEMORY[0x1E0DC3F08], "_vibrantEffectWithCAColorMatrix:alpha:", v32, 1.0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
          v28 = objc_claimAutoreleasedReturnValue();
          backdropAdjustmentEffects = v11->_backdropAdjustmentEffects;
          v11->_backdropAdjustmentEffects = (NSArray *)v28;

        }
        else
        {
          v27 = v11->_backdropAdjustmentEffects;
          v11->_backdropAdjustmentEffects = 0;
        }

        v30 = v11;
        break;
    }
  }

  return v11;
}

+ (BOOL)backdropIsDarkForStyle:(int64_t)a3
{
  return _SFIsDarkTintStyle(a3);
}

+ (id)backdropEffectForStyle:(int64_t)a3
{
  return _SFBackdropEffectForBarTintStyle(a3);
}

+ (id)controlsTintColorForStyle:(int64_t)a3
{
  void *v3;

  if (a3 == 5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_SFIsPrivateTintStyle(a3))
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (UIColor)controlsTintColor
{
  return self->_controlsTintColor;
}

- (int64_t)overrideUserInterfaceStyle
{
  return self->_overrideUserInterfaceStyle;
}

- (BOOL)isEqual:(id)a3
{
  _SFBarTheme *v4;
  id *v5;
  int64_t tintStyle;
  UIColor *v7;
  UIColor *preferredBarTintColor;
  UIColor *v9;
  UIColor *preferredControlsTintColor;
  BOOL v11;

  v4 = (_SFBarTheme *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      tintStyle = self->_tintStyle;
      if (tintStyle == objc_msgSend(v5, "tintStyle"))
      {
        objc_msgSend(v5, "preferredBarTintColor");
        v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
        preferredBarTintColor = self->_preferredBarTintColor;
        if (preferredBarTintColor == v7 || -[UIColor isEqual:](preferredBarTintColor, "isEqual:", v7))
        {
          v9 = (UIColor *)v5[1];
          preferredControlsTintColor = self->_preferredControlsTintColor;
          v11 = preferredControlsTintColor == v9
             || -[UIColor isEqual:](preferredControlsTintColor, "isEqual:", v9);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (UIColor)preferredBarTintColor
{
  return self->_preferredBarTintColor;
}

+ (BOOL)prefersThemeColorEffect
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropAdjustmentEffects, 0);
  objc_storeStrong((id *)&self->_backdropEffect, 0);
  objc_storeStrong((id *)&self->_platterProgressBarTintColor, 0);
  objc_storeStrong((id *)&self->_preferredBarTintColor, 0);
  objc_storeStrong((id *)&self->_controlsTintColor, 0);
  objc_storeStrong((id *)&self->_preferredControlsTintColor, 0);
}

- (void)applyBackdropEffectsToView:(id)a3
{
  void *v4;
  NSArray *backdropAdjustmentEffects;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFBarTheme backdropEffects](self, "backdropEffects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundEffects:", v4);

  if (self->_backdropAdjustmentEffects)
    backdropAdjustmentEffects = self->_backdropAdjustmentEffects;
  else
    backdropAdjustmentEffects = (NSArray *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "setContentEffects:", backdropAdjustmentEffects);
  if (self->_backdropAdjustmentEffects)
    objc_msgSend(v8, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (NSArray)backdropEffects
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_SFBarTheme backdropEffect](self, "backdropEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (UIBlurEffect)backdropEffect
{
  return self->_backdropEffect;
}

+ (_SFBarTheme)themeWithBarTintStyle:(int64_t)a3
{
  return (_SFBarTheme *)objc_msgSend(a1, "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", a3, 0, 0);
}

+ (_SFBarTheme)themeWithTheme:(id)a3
{
  _QWORD *v4;
  char isKindOfClass;
  _QWORD *v6;
  void *v7;

  v4 = a3;
  isKindOfClass = objc_opt_isKindOfClass();
  if (!v4 || (isKindOfClass & 1) != 0)
    v6 = v4;
  else
    v6 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithBarTintStyle:preferredBarTintColor:controlsTintColor:", objc_msgSend(v4, "tintStyle"), v4[5], v4[1]);
  v7 = v6;

  return (_SFBarTheme *)v7;
}

+ (_SFBarTheme)themeWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBarTintStyle:preferredBarTintColor:controlsTintColor:", a3, v9, v8);

  return (_SFBarTheme *)v10;
}

- (UIColor)platterProgressBarTintColor
{
  return self->_platterProgressBarTintColor;
}

+ (BOOL)canTintPrivateStyles
{
  return 0;
}

- (_SFBarTheme)fallbackTheme
{
  _SFBarTheme *v2;

  if (self->_preferredBarTintColor || self->_preferredControlsTintColor)
    v2 = (_SFBarTheme *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBarTintStyle:preferredBarTintColor:controlsTintColor:", self->_tintStyle, 0, 0);
  else
    v2 = self;
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SFStringForTintStyle(self->_tintStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_preferredBarTintColor)
  {
    if (self->_backdropIsDark)
      v8 = CFSTR("dark");
    else
      v8 = CFSTR("light");
    objc_msgSend(v7, "appendFormat:", CFSTR(", tint=%@ (%@)"), self->_preferredBarTintColor, v8);
  }
  if (self->_preferredControlsTintColor)
    objc_msgSend(v7, "appendFormat:", CFSTR(", conrolsTint=%@"), self->_preferredControlsTintColor);
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (BOOL)backdropIsDark
{
  return self->_backdropIsDark;
}

- (BOOL)backdropIsTinted
{
  return self->_backdropIsTinted;
}

- (NSArray)backdropAdjustmentEffects
{
  return self->_backdropAdjustmentEffects;
}

@end
