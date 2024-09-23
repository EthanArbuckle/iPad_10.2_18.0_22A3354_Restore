@implementation SFUnifiedBarTheme

- (SFUnifiedBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  SFUnifiedBarTheme *v6;
  void *v7;
  void **p_selectedMenuButtonTintColor;
  uint64_t v9;
  uint64_t v10;
  UIColor *overridePlatterColor;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIColor *separatorColor;
  UIColor *v17;
  void *v18;
  UIColor *v19;
  UIColor *v20;
  uint64_t v21;
  SFUnifiedTabBarItemTitleContainerViewTheme *titleTheme;
  _BOOL4 isPrivate;
  id *p_tabTitleTheme;
  void *v25;
  uint64_t v26;
  SFUnifiedTabBarItemTitleContainerViewTheme *activeTabTitleTheme;
  UIColor *v28;
  UIColor *inputFieldSecondaryAccessoryButtonTintColor;
  UIColor *v30;
  uint64_t v31;
  void *activeTabFieldTintColor;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  SFUnifiedTabBarItemTitleContainerViewTheme *v36;
  uint64_t v37;
  UIColor *v38;
  uint64_t v39;
  uint64_t v40;
  UIColor *tabAccessoryButtonTintColor;
  SFUnifiedTabBarItemTitleContainerViewTheme *v42;
  void *v43;
  uint64_t v44;
  UIColor *inputFieldAccessoryButtonTintColor;
  SFUnifiedBarTheme *v46;
  UIColor **p_progressBarTintColor;
  id *v49;
  void *v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)SFUnifiedBarTheme;
  v6 = -[SFThemeColorBarTheme initWithBarTintStyle:preferredBarTintColor:controlsTintColor:](&v51, sel_initWithBarTintStyle_preferredBarTintColor_controlsTintColor_, a3, a4, a5);
  if (!v6)
    goto LABEL_23;
  v6->_isPrivate = _SFIsPrivateTintStyle(a3);
  -[_SFBarTheme controlsTintColor](v6, "controlsTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_progressBarTintColor = &v6->_progressBarTintColor;
  objc_storeStrong((id *)&v6->_progressBarTintColor, v7);
  p_selectedMenuButtonTintColor = (void **)&v6->_selectedMenuButtonTintColor;
  objc_storeStrong((id *)&v6->_selectedMenuButtonTintColor, v7);
  -[SFThemeColorBarTheme themeColor](v6, "themeColor");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8AD30], "overrideTabColorForThemeColor:");
  v10 = objc_claimAutoreleasedReturnValue();
  overridePlatterColor = v6->_overridePlatterColor;
  v6->_overridePlatterColor = (UIColor *)v10;

  v12 = -[SFThemeColorBarTheme userInterfaceStyle](v6, "userInterfaceStyle");
  objc_msgSend(MEMORY[0x1E0DC3658], "sf_transparentBarHairlineColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resolvedColorWithTraitCollection:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  separatorColor = v6->_separatorColor;
  v6->_separatorColor = (UIColor *)v15;

  if (_SFIsDarkTintStyle(a3))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.3, 1.0, p_progressBarTintColor);
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  -[SFThemeColorBarTheme overrideTintColor](v6, "overrideTintColor", p_progressBarTintColor);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v19 = (UIColor *)v9;
  else
    v19 = v17;
  if (v6->_overridePlatterColor)
    v20 = v6->_overridePlatterColor;
  else
    v20 = v19;
  makeTitleTheme(v12, v18, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  titleTheme = v6->_titleTheme;
  v6->_titleTheme = (SFUnifiedTabBarItemTitleContainerViewTheme *)v21;

  isPrivate = v6->_isPrivate;
  p_tabTitleTheme = (id *)&v6->_tabTitleTheme;
  objc_storeStrong((id *)&v6->_tabTitleTheme, v6->_titleTheme);
  v50 = (void *)v9;
  if (isPrivate)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    makeTitleTheme(2, 0, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    activeTabTitleTheme = v6->_activeTabTitleTheme;
    v6->_activeTabTitleTheme = (SFUnifiedTabBarItemTitleContainerViewTheme *)v26;

    -[SFUnifiedTabBarItemTitleContainerViewTheme secondaryTextColor](v6->_activeTabTitleTheme, "secondaryTextColor");
    v28 = (UIColor *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_tabProgressBarTintColor, v28);
    objc_storeStrong((id *)&v6->_tabControlsTintColor, v28);
    objc_storeStrong((id *)&v6->_activeTabProgressBarTintColor, v28);
    objc_storeStrong((id *)&v6->_activeTabControlsTintColor, v28);
    inputFieldSecondaryAccessoryButtonTintColor = v6->_inputFieldSecondaryAccessoryButtonTintColor;
    v6->_inputFieldSecondaryAccessoryButtonTintColor = v28;
    v30 = v28;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v31 = objc_claimAutoreleasedReturnValue();
    activeTabFieldTintColor = *p_selectedMenuButtonTintColor;
    *p_selectedMenuButtonTintColor = (void *)v31;
    v33 = v7;
  }
  else
  {
    if (_SFIsDarkTintStyle(a3))
      v34 = 2;
    else
      v34 = 1;
    makeTitleTheme(v34, 0, 0);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v6->_activeTabTitleTheme;
    v6->_activeTabTitleTheme = (SFUnifiedTabBarItemTitleContainerViewTheme *)v35;

    objc_storeStrong((id *)&v6->_tabProgressBarTintColor, *v49);
    v33 = v7;
    objc_storeStrong((id *)&v6->_tabControlsTintColor, v7);
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v30 = (UIColor *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_activeTabProgressBarTintColor, v30);
    objc_storeStrong((id *)&v6->_activeTabControlsTintColor, v30);
    objc_msgSend(*p_tabTitleTheme, "secondaryTextColor");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v6->_inputFieldSecondaryAccessoryButtonTintColor;
    v6->_inputFieldSecondaryAccessoryButtonTintColor = (UIColor *)v37;

    if (v12 != 2)
      goto LABEL_19;
    objc_msgSend(*p_tabTitleTheme, "primaryTextColor");
    v39 = objc_claimAutoreleasedReturnValue();
    activeTabFieldTintColor = v6->_activeTabFieldTintColor;
    v6->_activeTabFieldTintColor = (UIColor *)v39;
  }

LABEL_19:
  objc_msgSend(*p_tabTitleTheme, "secondaryTextColor");
  v40 = objc_claimAutoreleasedReturnValue();
  tabAccessoryButtonTintColor = v6->_tabAccessoryButtonTintColor;
  v6->_tabAccessoryButtonTintColor = (UIColor *)v40;

  v42 = v6->_activeTabTitleTheme;
  if (a3 == 2)
    -[SFUnifiedTabBarItemTitleContainerViewTheme primaryTextColor](v42, "primaryTextColor");
  else
    -[SFUnifiedTabBarItemTitleContainerViewTheme secondaryTextColor](v42, "secondaryTextColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v6->_activeTabAccessoryButtonTintColor, v43);

  -[SFUnifiedTabBarItemTitleContainerViewTheme primaryTextColor](v6->_activeTabTitleTheme, "primaryTextColor");
  v44 = objc_claimAutoreleasedReturnValue();
  inputFieldAccessoryButtonTintColor = v6->_inputFieldAccessoryButtonTintColor;
  v6->_inputFieldAccessoryButtonTintColor = (UIColor *)v44;

  v46 = v6;
LABEL_23:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTabFieldTintColor, 0);
  objc_storeStrong((id *)&self->_overridePlatterColor, 0);
  objc_storeStrong((id *)&self->_activeTabControlsTintColor, 0);
  objc_storeStrong((id *)&self->_tabControlsTintColor, 0);
  objc_storeStrong((id *)&self->_activeTabProgressBarTintColor, 0);
  objc_storeStrong((id *)&self->_tabProgressBarTintColor, 0);
  objc_storeStrong((id *)&self->_progressBarTintColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_selectedMenuButtonTintColor, 0);
  objc_storeStrong((id *)&self->_inputFieldSecondaryAccessoryButtonTintColor, 0);
  objc_storeStrong((id *)&self->_inputFieldAccessoryButtonTintColor, 0);
  objc_storeStrong((id *)&self->_activeTabAccessoryButtonTintColor, 0);
  objc_storeStrong((id *)&self->_tabAccessoryButtonTintColor, 0);
  objc_storeStrong((id *)&self->_activeTabTitleTheme, 0);
  objc_storeStrong((id *)&self->_tabTitleTheme, 0);
  objc_storeStrong((id *)&self->_titleTheme, 0);
}

+ (SFUnifiedBarTheme)defaultTheme
{
  if (defaultTheme_onceToken != -1)
    dispatch_once(&defaultTheme_onceToken, &__block_literal_global_39);
  return (SFUnifiedBarTheme *)(id)defaultTheme_defaultTheme;
}

void __33__SFUnifiedBarTheme_defaultTheme__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_SFBarTheme themeWithBarTintStyle:](SFUnifiedBarTheme, "themeWithBarTintStyle:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultTheme_defaultTheme;
  defaultTheme_defaultTheme = v0;

}

- (SFUnifiedTabBarItemTitleContainerViewTheme)titleTheme
{
  return self->_titleTheme;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)tabTitleTheme
{
  return self->_tabTitleTheme;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)activeTabTitleTheme
{
  return self->_activeTabTitleTheme;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (UIColor)tabAccessoryButtonTintColor
{
  return self->_tabAccessoryButtonTintColor;
}

- (UIColor)activeTabAccessoryButtonTintColor
{
  return self->_activeTabAccessoryButtonTintColor;
}

- (UIColor)inputFieldAccessoryButtonTintColor
{
  return self->_inputFieldAccessoryButtonTintColor;
}

- (UIColor)inputFieldSecondaryAccessoryButtonTintColor
{
  return self->_inputFieldSecondaryAccessoryButtonTintColor;
}

- (UIColor)selectedMenuButtonTintColor
{
  return self->_selectedMenuButtonTintColor;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (UIColor)progressBarTintColor
{
  return self->_progressBarTintColor;
}

- (UIColor)tabProgressBarTintColor
{
  return self->_tabProgressBarTintColor;
}

- (UIColor)activeTabProgressBarTintColor
{
  return self->_activeTabProgressBarTintColor;
}

- (UIColor)tabControlsTintColor
{
  return self->_tabControlsTintColor;
}

- (UIColor)activeTabControlsTintColor
{
  return self->_activeTabControlsTintColor;
}

- (UIColor)overridePlatterColor
{
  return self->_overridePlatterColor;
}

- (UIColor)activeTabFieldTintColor
{
  return self->_activeTabFieldTintColor;
}

@end
