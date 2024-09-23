@implementation _SFNavigationBarTheme

- (_SFNavigationBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  id v8;
  _SFNavigationBarTheme *v9;
  _SFNavigationBarTheme *v10;
  void *v11;
  int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  UIColor *v16;
  UIColor *v17;
  id v18;
  UIColor *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  uint64_t v26;
  UIColor *textColor;
  UIColor *v28;
  UIColor *v29;
  uint64_t v30;
  UIColor *annotationTextColor;
  id v32;
  void *v33;
  UIColor *v34;
  UIColor *v35;
  UIColor *progressBarTintColor;
  uint64_t v37;
  UIColor *platterTextColor;
  _BOOL4 backdropIsRed;
  void *v40;
  _BOOL4 backdropIsGreen;
  void *v42;
  uint64_t v43;
  UIColor *platterAnnotationTextColor;
  uint64_t v45;
  UIColor *platterSelectionColor;
  double v47;
  double v48;
  uint64_t v49;
  UIColor *platterPlaceholderTextColor;
  _SFNavigationBarTheme *v51;
  objc_super v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;

  v8 = a4;
  v53.receiver = self;
  v53.super_class = (Class)_SFNavigationBarTheme;
  v9 = -[_SFBarTheme initWithBarTintStyle:preferredBarTintColor:controlsTintColor:](&v53, sel_initWithBarTintStyle_preferredBarTintColor_controlsTintColor_, a3, v8, a5);
  v10 = v9;
  if (v9)
  {
    -[_SFBarTheme preferredBarTintColor](v9, "preferredBarTintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[_SFBarTheme backdropIsDark](v10, "backdropIsDark");
    v13 = _SFIsPrivateTintStyle();
    v14 = v12 | v13;
    v10->_platterOverrideUserInterfaceStyle = v13;
    v15 = 2;
    if (!v13)
      v15 = 0;
    v10->_platterTextFieldOverrideUserInterfaceStyle = v15;
    v10->_platterKeyboardOverrideAppearance = 2 * (a3 == 3);
    v10->_platterBackdropIsDark = v14;
    redTextColorForDarkBackground(v12);
    v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
    greenTextColorForDarkBackground(v12);
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v10->_backdropIsRed = colorIsSimilarToColor(v11, v16);
      v10->_backdropIsGreen = colorIsSimilarToColor(v11, v17);
      v18 = v11;
      v57 = 0.0;
      v58 = 0.0;
      v55 = 0.0;
      v56 = 0.0;
      v54 = 0.0;
      if (objc_msgSend(v18, "getRed:green:blue:alpha:", &v58, &v57, &v56, 0)
        && objc_msgSend(v18, "getHue:saturation:brightness:alpha:", 0, &v55, &v54, 0))
      {
        v19 = v16;
        if (v54 < 0.17)
          goto LABEL_19;
        v21 = v57;
        v20 = v58;
        if (v57 >= v56)
          v22 = v56;
        else
          v22 = v57;
        if (v57 <= v56)
          v21 = v56;
        if (v58 >= v22)
          v23 = v22;
        else
          v23 = v58;
        if (v58 <= v21)
          v20 = v21;
        v24 = (v23 + v20) * 0.5;
        if (v24 <= 0.95)
          v25 = v55 < 0.15 && v24 > 0.9;
        else
LABEL_19:
          v25 = 1;
      }
      else
      {
        v19 = v16;
        v25 = 0;
      }

      v10->_backdropIsExtreme = v25;
      v16 = v19;
    }
    textColorForDarkBackground(v12);
    v26 = objc_claimAutoreleasedReturnValue();
    textColor = v10->_textColor;
    v10->_textColor = (UIColor *)v26;

    v28 = v16;
    if (v10->_backdropIsRed)
      v28 = v10->_textColor;
    objc_storeStrong((id *)&v10->_warningTextColor, v28);
    v29 = v17;
    if (v10->_backdropIsGreen)
      v29 = v10->_textColor;
    objc_storeStrong((id *)&v10->_secureTextColor, v29);
    annotationTextColorForDarkBackground(v12);
    v30 = objc_claimAutoreleasedReturnValue();
    annotationTextColor = v10->_annotationTextColor;
    v10->_annotationTextColor = (UIColor *)v30;

    -[_SFBarTheme controlsTintColor](v10, "controlsTintColor");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a3 == 4)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v34 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = (UIColor *)v32;
    }
    v35 = v34;

    progressBarTintColor = v10->_progressBarTintColor;
    v10->_progressBarTintColor = v35;

    textColorForDarkBackground(v14);
    v37 = objc_claimAutoreleasedReturnValue();
    platterTextColor = v10->_platterTextColor;
    v10->_platterTextColor = (UIColor *)v37;

    backdropIsRed = v10->_backdropIsRed;
    if (v10->_backdropIsRed)
    {
      v40 = v10->_platterTextColor;
    }
    else
    {
      redTextColorForDarkBackground(v14);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v10->_platterWarningTextColor, v40);
    if (!backdropIsRed)

    backdropIsGreen = v10->_backdropIsGreen;
    if (v10->_backdropIsGreen)
    {
      v42 = v10->_platterTextColor;
    }
    else
    {
      greenTextColorForDarkBackground(v14);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v10->_platterSecureTextColor, v42);
    if (!backdropIsGreen)

    annotationTextColorForDarkBackground(v14);
    v43 = objc_claimAutoreleasedReturnValue();
    platterAnnotationTextColor = v10->_platterAnnotationTextColor;
    v10->_platterAnnotationTextColor = (UIColor *)v43;

    if ((v14 & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.501960784, 0.988235294, 1.0);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v45 = objc_claimAutoreleasedReturnValue();
    platterSelectionColor = v10->_platterSelectionColor;
    v10->_platterSelectionColor = (UIColor *)v45;

    if ((v14 & 1) != 0)
    {
      v47 = 0.7;
      v48 = 1.0;
    }
    else
    {
      v47 = 0.38;
      v48 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v48, v47);
    v49 = objc_claimAutoreleasedReturnValue();
    platterPlaceholderTextColor = v10->_platterPlaceholderTextColor;
    v10->_platterPlaceholderTextColor = (UIColor *)v49;

    v51 = v10;
  }
  else
  {
    v11 = v8;
  }

  return v10;
}

- (id)URLAccessoryButtonTintColorForInputMode:(unint64_t)a3
{
  UIColor *v3;

  if (!a3)
  {
    v3 = self->_platterTextColor;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    -[_SFBarTheme controlsTintColor](self, "controlsTintColor");
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = (SEL)v3;
  }
  return (id)(id)a2;
}

- (id)platterTextColorForPlatterAlpha:(double)a3
{
  return -[_SFNavigationBarTheme _colorForPlatterTextColor:regularColor:withPlatterAlpha:](self, "_colorForPlatterTextColor:regularColor:withPlatterAlpha:", self->_platterTextColor, self->_textColor, a3);
}

- (id)platterSecureTextColorForPlatterAlpha:(double)a3
{
  return -[_SFNavigationBarTheme _colorForPlatterTextColor:regularColor:withPlatterAlpha:](self, "_colorForPlatterTextColor:regularColor:withPlatterAlpha:", self->_platterSecureTextColor, self->_secureTextColor, a3);
}

- (id)platterWarningTextColorForPlatterAlpha:(double)a3
{
  return -[_SFNavigationBarTheme _colorForPlatterTextColor:regularColor:withPlatterAlpha:](self, "_colorForPlatterTextColor:regularColor:withPlatterAlpha:", self->_platterWarningTextColor, self->_warningTextColor, a3);
}

- (id)annotationTextColorForPlatterAlpha:(double)a3
{
  return -[_SFNavigationBarTheme _colorForPlatterTextColor:regularColor:withPlatterAlpha:](self, "_colorForPlatterTextColor:regularColor:withPlatterAlpha:", self->_platterAnnotationTextColor, self->_annotationTextColor, a3);
}

- (id)_colorForPlatterTextColor:(id)a3 regularColor:(id)a4 withPlatterAlpha:(double)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (a5 == 1.0 || objc_msgSend(v7, "isEqual:", v8))
  {
    v9 = v7;
  }
  else
  {
    if (a5 != 0.0)
    {
      objc_msgSend(v7, "colorWithAlphaComponent:", a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_colorBlendedWithColor:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
    v9 = v8;
  }
  v10 = v9;
LABEL_5:

  return v10;
}

- (int64_t)platterOverrideUserInterfaceStyle
{
  return self->_platterOverrideUserInterfaceStyle;
}

- (int64_t)platterTextFieldOverrideUserInterfaceStyle
{
  return self->_platterTextFieldOverrideUserInterfaceStyle;
}

- (int64_t)platterKeyboardOverrideAppearance
{
  return self->_platterKeyboardOverrideAppearance;
}

- (BOOL)backdropIsExtreme
{
  return self->_backdropIsExtreme;
}

- (BOOL)backdropIsRed
{
  return self->_backdropIsRed;
}

- (BOOL)backdropIsGreen
{
  return self->_backdropIsGreen;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)secureTextColor
{
  return self->_secureTextColor;
}

- (UIColor)warningTextColor
{
  return self->_warningTextColor;
}

- (UIColor)annotationTextColor
{
  return self->_annotationTextColor;
}

- (UIColor)progressBarTintColor
{
  return self->_progressBarTintColor;
}

- (BOOL)platterBackdropIsDark
{
  return self->_platterBackdropIsDark;
}

- (UIColor)platterTextColor
{
  return self->_platterTextColor;
}

- (UIColor)platterSecureTextColor
{
  return self->_platterSecureTextColor;
}

- (UIColor)platterWarningTextColor
{
  return self->_platterWarningTextColor;
}

- (UIColor)platterAnnotationTextColor
{
  return self->_platterAnnotationTextColor;
}

- (UIColor)platterPlaceholderTextColor
{
  return self->_platterPlaceholderTextColor;
}

- (UIColor)platterSelectionColor
{
  return self->_platterSelectionColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterSelectionColor, 0);
  objc_storeStrong((id *)&self->_platterPlaceholderTextColor, 0);
  objc_storeStrong((id *)&self->_platterAnnotationTextColor, 0);
  objc_storeStrong((id *)&self->_platterWarningTextColor, 0);
  objc_storeStrong((id *)&self->_platterSecureTextColor, 0);
  objc_storeStrong((id *)&self->_platterTextColor, 0);
  objc_storeStrong((id *)&self->_progressBarTintColor, 0);
  objc_storeStrong((id *)&self->_annotationTextColor, 0);
  objc_storeStrong((id *)&self->_warningTextColor, 0);
  objc_storeStrong((id *)&self->_secureTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
