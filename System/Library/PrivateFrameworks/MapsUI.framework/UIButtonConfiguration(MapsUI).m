@implementation UIButtonConfiguration(MapsUI)

+ (id)_setupButtonConfiguration:()MapsUI
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC1350], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E0DC4B08], *MEMORY[0x1E0DC1448]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__UIButtonConfiguration_MapsUI___setupButtonConfiguration___block_invoke;
  v8[3] = &unk_1E2E02458;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", v8);
  objc_msgSend(v3, "setContentInsets:", 15.0, 10.0, 15.0, 10.0);
  objc_msgSend(v3, "background");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 8.0);

  return v3;
}

+ (id)_mapsui_grayButtonConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setupButtonConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_mapsui_filledButtonConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setupButtonConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_mapsui_textButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapsui_textButtonConfigurationWithFont:textColor:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_mapsui_textButtonConfigurationWithFont:()MapsUI textColor:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(v7, "setTitleAlignment:", 1);
  objc_msgSend(v7, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColorTransformer:", &__block_literal_global_13);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__UIButtonConfiguration_MapsUI___mapsui_textButtonConfigurationWithFont_textColor___block_invoke_2;
  v12[3] = &unk_1E2E024C0;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "setTitleTextAttributesTransformer:", v12);

  return v7;
}

@end
