@implementation LPButtonStyle

- (LPButtonStyle)initWithPlatform:(int64_t)a3
{
  LPButtonStyle *v4;
  LPPadding *v5;
  LPPadding *padding;
  LPPadding *v7;
  LPPadding *margin;
  LPCircularProgressIndicatorStyle *v9;
  LPCircularProgressIndicatorStyle *progressIndicatorStyle;
  LPButtonStyle *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)LPButtonStyle;
  v4 = -[LPButtonStyle init](&v13, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(LPPadding);
    padding = v4->_padding;
    v4->_padding = v5;

    v7 = objc_alloc_init(LPPadding);
    margin = v4->_margin;
    v4->_margin = v7;

    v4->_enableUserInteractionForDecorativeButton = 1;
    v9 = -[LPCircularProgressIndicatorStyle initWithPlatform:]([LPCircularProgressIndicatorStyle alloc], "initWithPlatform:", a3);
    progressIndicatorStyle = v4->_progressIndicatorStyle;
    v4->_progressIndicatorStyle = v9;

    v11 = v4;
  }

  return v4;
}

+ (id)systemPillButtonStyleForPlatform:(int64_t)a3 sizeClass:(unint64_t)a4
{
  LPButtonStyle *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void *v13;
  LPPointUnit *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  LPPointUnit *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  LPPointUnit *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  LPPointUnit *v35;
  LPPointUnit *v36;
  LPPointUnit *v37;
  double v38;
  uint64_t v39;
  LPPointUnit *v40;
  double v41;
  uint64_t v42;

  v6 = -[LPButtonStyle initWithPlatform:]([LPButtonStyle alloc], "initWithPlatform:", a3);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle setForegroundColor:](v6, "setForegroundColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle setBackgroundColor:](v6, "setBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle setMenuBackgroundColor:](v6, "setMenuBackgroundColor:", v9);

  if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC4B88]);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 5)
      v11 = 0x8000;
    else
      v11 = 32770;
    v12 = (void **)MEMORY[0x1E0DC4AD0];
    if (a3 != 5)
      v12 = (void **)MEMORY[0x1E0DC4B10];
    fontWithTraits(*v12, v11, a4);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;
  -[LPButtonStyle setFont:](v6, "setFont:", v10);

  if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
    objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC4B88]);
  else
    fontWithTraits((void *)*MEMORY[0x1E0DC4B10], 0x8000, a4);
  v14 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle setMenuFont:](v6, "setMenuFont:", v14);

  if ((unint64_t)a3 < 5 || a3 == 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "_lp_configurationWithTextStyle:weight:scale:", *MEMORY[0x1E0DC4A88], 7, 1);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 5)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B60], 2);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (LPPointUnit *)v15;
LABEL_15:
  -[LPButtonStyle setSymbolConfiguration:](v6, "setSymbolConfiguration:", v14);

  if ((unint64_t)a3 <= 6)
    v14 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", dbl_1A0D65E50[a3]);
  -[LPButtonStyle padding](v6, "padding");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLeading:", v14);

  -[LPButtonStyle padding](v6, "padding");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leading");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle padding](v6, "padding");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTrailing:", v18);

  if ((unint64_t)a3 <= 6)
  {
    if (((1 << a3) & 0x65) != 0)
    {
      +[LPPointUnit zero](LPPointUnit, "zero");
      v20 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 3.0);
    }
    v17 = v20;
  }
  -[LPButtonStyle padding](v6, "padding");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTop:", v17);

  -[LPButtonStyle padding](v6, "padding");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "top");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle padding](v6, "padding");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBottom:", v23);

  outerHorizontalIconMargin((id)a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle margin](v6, "margin");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLeading:", v25);

  if ((unint64_t)a3 < 5)
    goto LABEL_26;
  if (a3 == 5)
  {
    v27 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 20.0);
    goto LABEL_27;
  }
  if (a3 == 6)
  {
LABEL_26:
    outerHorizontalIconMargin((id)a3);
    v27 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
LABEL_27:
    v25 = v27;
  }
  -[LPButtonStyle margin](v6, "margin");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTrailing:", v25);

  -[LPButtonStyle margin](v6, "margin");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailing");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle margin](v6, "margin");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTop:", v30);

  -[LPButtonStyle margin](v6, "margin");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailing");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle margin](v6, "margin");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBottom:", v33);

  v35 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 24.0);
  -[LPButtonStyle setIndicatorSpacing:](v6, "setIndicatorSpacing:", v35);

  if ((unint64_t)a3 <= 6)
  {
    if (((1 << a3) & 0x65) != 0)
    {
      v36 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 72.0);
    }
    else
    {
      +[LPPointUnit zero](LPPointUnit, "zero");
      v36 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
    }
    v35 = v36;
  }
  -[LPButtonStyle setMinimumWidth:](v6, "setMinimumWidth:", v35);

  if ((unint64_t)a3 <= 6)
  {
    if (((1 << a3) & 0x1A) != 0)
    {
      +[LPPointUnit zero](LPPointUnit, "zero");
      v39 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = [LPPointUnit alloc];
      if (((1 << a3) & 0x45) != 0)
        v38 = 36.0;
      else
        v38 = 44.0;
      v39 = -[LPPointUnit initWithValue:](v37, "initWithValue:", v38);
    }
    v35 = (LPPointUnit *)v39;
  }
  -[LPButtonStyle setMinimumHeight:](v6, "setMinimumHeight:", v35);

  if ((unint64_t)a3 <= 6)
  {
    if (((1 << a3) & 0x1A) != 0)
    {
      +[LPPointUnit zero](LPPointUnit, "zero");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = [LPPointUnit alloc];
      if (((1 << a3) & 0x45) != 0)
        v41 = 36.0;
      else
        v41 = 44.0;
      v42 = -[LPPointUnit initWithValue:](v40, "initWithValue:", v41);
    }
    v35 = (LPPointUnit *)v42;
  }
  -[LPButtonStyle setHeight:](v6, "setHeight:", v35);

  -[LPButtonStyle setIgnoresInvertColors:](v6, "setIgnoresInvertColors:", 0);
  if (a3 == 5)
    -[LPButtonStyle setUseSystemButtonAppearance:](v6, "setUseSystemButtonAppearance:", 1);
  return v6;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)menuBackgroundColor
{
  return self->_menuBackgroundColor;
}

- (void)setMenuBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_menuBackgroundColor, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIFont)menuFont
{
  return self->_menuFont;
}

- (void)setMenuFont:(id)a3
{
  objc_storeStrong((id *)&self->_menuFont, a3);
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  return self->_symbolConfiguration;
}

- (void)setSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_symbolConfiguration, a3);
}

- (LPPadding)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
  objc_storeStrong((id *)&self->_padding, a3);
}

- (LPPadding)margin
{
  return self->_margin;
}

- (void)setMargin:(id)a3
{
  objc_storeStrong((id *)&self->_margin, a3);
}

- (LPPointUnit)imagePadding
{
  return self->_imagePadding;
}

- (void)setImagePadding:(id)a3
{
  objc_storeStrong((id *)&self->_imagePadding, a3);
}

- (LPPointUnit)menuMinimumWidth
{
  return self->_menuMinimumWidth;
}

- (void)setMenuMinimumWidth:(id)a3
{
  objc_storeStrong((id *)&self->_menuMinimumWidth, a3);
}

- (LPPointUnit)minimumWidth
{
  return self->_minimumWidth;
}

- (void)setMinimumWidth:(id)a3
{
  objc_storeStrong((id *)&self->_minimumWidth, a3);
}

- (LPPointUnit)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(id)a3
{
  objc_storeStrong((id *)&self->_minimumHeight, a3);
}

- (LPPointUnit)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
  objc_storeStrong((id *)&self->_height, a3);
}

- (LPPointUnit)additionalVerticalPadding
{
  return self->_additionalVerticalPadding;
}

- (void)setAdditionalVerticalPadding:(id)a3
{
  objc_storeStrong((id *)&self->_additionalVerticalPadding, a3);
}

- (LPPointUnit)indicatorSpacing
{
  return self->_indicatorSpacing;
}

- (void)setIndicatorSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorSpacing, a3);
}

- (LPCircularProgressIndicatorStyle)progressIndicatorStyle
{
  return self->_progressIndicatorStyle;
}

- (void)setProgressIndicatorStyle:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorStyle, a3);
}

- (BOOL)ignoresInvertColors
{
  return self->_ignoresInvertColors;
}

- (void)setIgnoresInvertColors:(BOOL)a3
{
  self->_ignoresInvertColors = a3;
}

- (BOOL)enableUserInteractionForDecorativeButton
{
  return self->_enableUserInteractionForDecorativeButton;
}

- (void)setEnableUserInteractionForDecorativeButton:(BOOL)a3
{
  self->_enableUserInteractionForDecorativeButton = a3;
}

- (BOOL)showsChevronForSingleAction
{
  return self->_showsChevronForSingleAction;
}

- (void)setShowsChevronForSingleAction:(BOOL)a3
{
  self->_showsChevronForSingleAction = a3;
}

- (BOOL)useSystemButtonAppearance
{
  return self->_useSystemButtonAppearance;
}

- (void)setUseSystemButtonAppearance:(BOOL)a3
{
  self->_useSystemButtonAppearance = a3;
}

- (BOOL)useSegmentedControl
{
  return self->_useSegmentedControl;
}

- (void)setUseSegmentedControl:(BOOL)a3
{
  self->_useSegmentedControl = a3;
}

- (BOOL)prefersBehavioralStylePad
{
  return self->_prefersBehavioralStylePad;
}

- (void)setPrefersBehavioralStylePad:(BOOL)a3
{
  self->_prefersBehavioralStylePad = a3;
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicatorStyle, 0);
  objc_storeStrong((id *)&self->_indicatorSpacing, 0);
  objc_storeStrong((id *)&self->_additionalVerticalPadding, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_minimumHeight, 0);
  objc_storeStrong((id *)&self->_minimumWidth, 0);
  objc_storeStrong((id *)&self->_menuMinimumWidth, 0);
  objc_storeStrong((id *)&self->_imagePadding, 0);
  objc_storeStrong((id *)&self->_margin, 0);
  objc_storeStrong((id *)&self->_padding, 0);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
  objc_storeStrong((id *)&self->_menuFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_menuBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

@end
