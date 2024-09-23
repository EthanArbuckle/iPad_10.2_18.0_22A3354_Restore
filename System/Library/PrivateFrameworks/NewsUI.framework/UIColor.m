@implementation UIColor

void __34__UIColor_NewsUI__nu_dividerColor__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "nu_lightStyleDividerColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "nu_darkStyleDividerColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "nu_dynamicColor:withDarkStyleVariant:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)nu_dividerColor_dividerColor;
  nu_dividerColor_dividerColor = v2;

}

void __44__UIColor_NewsUI__nu_lightStyleDividerColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.901960784, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nu_lightStyleDividerColor_dividerColor;
  nu_lightStyleDividerColor_dividerColor = v0;

}

void __43__UIColor_NewsUI__nu_darkStyleDividerColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0980392157, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nu_darkStyleDividerColor_dividerColor;
  nu_darkStyleDividerColor_dividerColor = v0;

}

@end
