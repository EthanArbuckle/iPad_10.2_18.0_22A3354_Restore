@implementation MUInfoCardStyle

+ (id)preferredVerticalCardConfiguration
{
  if (objc_msgSend((id)objc_opt_class(), "containerStyle") == 1)
    +[MUPlaceVerticalCardConfiguration plainConfiguration](MUPlaceVerticalCardConfiguration, "plainConfiguration");
  else
    +[MUPlaceVerticalCardConfiguration separatorConfiguration](MUPlaceVerticalCardConfiguration, "separatorConfiguration");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)resolvedPrimaryColorForProposedColor:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (+[MUInfoCardStyle hasExternallyProvidedTintColor](MUInfoCardStyle, "hasExternallyProvidedTintColor"))
  {
    +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (void)setTintColorProvider:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)tintColorBlock != a3)
  {
    v3 = objc_msgSend(a3, "copy");
    v4 = (void *)tintColorBlock;
    tintColorBlock = v3;

    objc_msgSend(MEMORY[0x1E0CC17E8], "setTintColorProvider:", tintColorBlock);
  }
}

+ (void)setInfoCardContainerStyle:(int64_t)a3
{
  _containerStyle = a3;
}

+ (id)cardBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "_mapsui_colorNamed:", CFSTR("PlatterBackgroundColor"));
}

+ (id)textColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (id)secondaryTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (id)tokenBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
}

+ (id)buttonCellTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (id)tintColor
{
  void *v2;

  if (tintColorBlock)
  {
    (*(void (**)(void))(tintColorBlock + 16))();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((MapKitIdiomIsMacCatalyst() & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "_mapsui_accentColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (id)attributionTintColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CC17E8], "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isDarkTheme"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)punchoutButtonPlatterColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "_mapsui_colorNamed:", CFSTR("PunchoutPlatterBackgroundColor"));
}

+ (id)rowUnselectedColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (id)rowSelectedColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.119999997);
}

+ (id)actionRowTintColor
{
  void *v2;

  if (!tintColorBlock
    || ((*(void (**)(void))(tintColorBlock + 16))(), (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_mapsui_colorNamed:", CFSTR("ActionRowBackgroundColor"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (id)imageTileBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "_mapsui_colorNamed:", CFSTR("ImageTileBackgroundColor"));
}

+ (id)verifiedLogoBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "_mapsui_colorNamed:", CFSTR("VerifiedLogoBackgroundColor"));
}

+ (id)directionsButtonTintColor
{
  void *v2;

  if (!tintColorBlock
    || ((*(void (**)(void))(tintColorBlock + 16))(), (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (int64_t)containerStyle
{
  return _containerStyle;
}

+ (int64_t)platterStyle
{
  return _containerStyle == 1;
}

+ (id)labelForProminence:(int64_t)a3
{
  void *v4;
  id v5;
  id v6;

  if (+[MUInfoCardStyle platterStyle](MUInfoCardStyle, "platterStyle") == 1)
  {
    if (a3 != 2)
      a3 = a3 == 1;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC19E0]), "initWithStyle:", a3);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v4 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v6 = v4;

  return v6;
}

+ (BOOL)hasExternallyProvidedTintColor
{
  void *v2;
  BOOL result;

  result = 0;
  if (tintColorBlock)
  {
    (*(void (**)(void))(tintColorBlock + 16))();
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      return 1;
  }
  return result;
}

@end
