@implementation UIColor(NewsUI)

+ (uint64_t)nu_defaultTitleTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

+ (id)nu_dynamicColor:()NewsUI withDarkStyleVariant:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDF6F30];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "traitCollectionWithUserInterfaceStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "_dynamicColorWithColorsByTraitCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)nu_defaultSystemTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemPinkColor");
}

+ (id)nu_dividerColor
{
  if (nu_dividerColor_onceToken != -1)
    dispatch_once(&nu_dividerColor_onceToken, &__block_literal_global_18);
  return (id)nu_dividerColor_dividerColor;
}

+ (id)nu_lightStyleDividerColor
{
  if (nu_lightStyleDividerColor_onceToken != -1)
    dispatch_once(&nu_lightStyleDividerColor_onceToken, &__block_literal_global_3_0);
  return (id)nu_lightStyleDividerColor_dividerColor;
}

+ (id)nu_darkStyleDividerColor
{
  if (nu_darkStyleDividerColor_onceToken != -1)
    dispatch_once(&nu_darkStyleDividerColor_onceToken, &__block_literal_global_4);
  return (id)nu_darkStyleDividerColor_dividerColor;
}

@end
