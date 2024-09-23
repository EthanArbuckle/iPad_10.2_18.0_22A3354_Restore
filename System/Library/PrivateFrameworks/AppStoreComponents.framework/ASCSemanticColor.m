@implementation ASCSemanticColor

+ (uint64_t)tint
{
  objc_opt_self();
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (uint64_t)primaryLabel
{
  objc_opt_self();
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)secondaryLabel
{
  objc_opt_self();
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (id)artworkPlaceholder
{
  objc_opt_self();
  if (artworkPlaceholder_onceToken != -1)
    dispatch_once(&artworkPlaceholder_onceToken, &__block_literal_global_25);
  return (id)artworkPlaceholder_defaultPlaceholderColor;
}

void __38__ASCSemanticColor_artworkPlaceholder__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "asc_colorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)artworkPlaceholder_defaultPlaceholderColor;
  artworkPlaceholder_defaultPlaceholderColor = v2;

}

+ (id)artworkBorder
{
  objc_opt_self();
  if (artworkBorder_onceToken != -1)
    dispatch_once(&artworkBorder_onceToken, &__block_literal_global_1);
  return (id)artworkBorder_borderColor;
}

void __33__ASCSemanticColor_artworkBorder__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.08);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.08);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "asc_colorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)artworkBorder_borderColor;
  artworkBorder_borderColor = v2;

}

+ (id)artworkSymbolTint
{
  objc_opt_self();
  if (artworkSymbolTint_onceToken != -1)
    dispatch_once(&artworkSymbolTint_onceToken, &__block_literal_global_2_0);
  return (id)artworkSymbolTint_symbolTintColor;
}

void __37__ASCSemanticColor_artworkSymbolTint__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.32);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.32);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "asc_colorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)artworkSymbolTint_symbolTintColor;
  artworkSymbolTint_symbolTintColor = v2;

}

+ (id)loading
{
  objc_opt_self();
  return +[ASCSemanticColor artworkPlaceholder]();
}

@end
