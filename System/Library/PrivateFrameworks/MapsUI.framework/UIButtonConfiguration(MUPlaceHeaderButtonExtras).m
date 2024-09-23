@implementation UIButtonConfiguration(MUPlaceHeaderButtonExtras)

+ (id)_mapsui_primaryHeaderActionConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setupDirectionsButtonConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_mapsui_secondaryHeaderActionConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setupDirectionsButtonConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_setupDirectionsButtonConfiguration:()MUPlaceHeaderButtonExtras
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", &__block_literal_global_29);
  objc_msgSend(v3, "setImagePadding:", 4.0);
  objc_msgSend(v3, "background");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 10.0);

  v5 = *MEMORY[0x1E0DC3298];
  v6 = *(double *)(MEMORY[0x1E0DC3298] + 8);
  v7 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  v8 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  objc_msgSend(v3, "background");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundInsets:", v5, v6, v7, v8);

  objc_msgSend(v3, "setContentInsets:", v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationWithFont:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredSymbolConfigurationForImage:", v12);

  objc_msgSend(v3, "setTitleLineBreakMode:", 4);
  if (+[MUInfoCardStyle platterStyle](MUInfoCardStyle, "platterStyle") == 1)
  {
    objc_msgSend(v3, "setBaseBackgroundColor:", 0);
    objc_msgSend(v3, "background");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", 0);

    +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBaseForegroundColor:", v14);

    v15 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1100);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "effectForBlurEffect:style:", v16, 6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "background");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setVisualEffect:", v17);

  }
  return v3;
}

+ (id)_mapsui_configurationForPrimaryType:()MUPlaceHeaderButtonExtras
{
  uint64_t v3;
  void *v4;
  void *v5;

  switch(a3)
  {
    case 0:
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3520], "_mapsui_secondaryHeaderActionConfiguration");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 1:
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3520], "_mapsui_primaryHeaderActionConfiguration");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_4:
      v4 = (void *)v3;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3520], "_mapsui_primaryHeaderActionConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBaseBackgroundColor:", v5);

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

@end
