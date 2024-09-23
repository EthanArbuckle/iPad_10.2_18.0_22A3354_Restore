@implementation AVTUIColorRepository

+ (id)appBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dynamicColorWithLightColor:darkColor:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)modalBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
}

+ (id)trapOverlayBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dynamicColorWithLightColor:darkColor:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dynamicColorWithLightColor:(id)a3 darkColor:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEAB40];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "traitCollectionWithUserInterfaceStyle:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  v15[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "_dynamicColorWithColorsByTraitCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)editorBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
}

+ (id)groupListBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
}

+ (id)groupDialCellTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.635, 1.0);
}

+ (id)groupDialCellSelectedTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
}

+ (id)groupDialCellShimmeringTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
}

+ (id)groupSidePickerCellSelectedBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dynamicColorWithLightColor:darkColor:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)userInfoLabelColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
}

+ (id)attributeValueCellSelectedStrokeColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
}

+ (id)attributeTitleTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDisplayP3Red:green:blue:alpha:", 0.22, 0.22, 0.22, 1.0);
}

+ (id)actionButtonBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
}

+ (id)actionButtonTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "tableCellBlueTextColor");
}

+ (id)actionButtonDestructiveTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
}

+ (id)separatorColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "opaqueSeparatorColor");
}

+ (id)splashScreenButtonBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
}

+ (id)splashScreenButtonNormalTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
}

+ (id)splashScreenButtonHighlightedTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.25);
}

+ (id)simplePickerSelectedBackground
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
}

+ (id)stickerPlaceholderBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
}

+ (id)placeholderBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
}

+ (id)paddleViewBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dynamicColorWithLightColor:darkColor:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
