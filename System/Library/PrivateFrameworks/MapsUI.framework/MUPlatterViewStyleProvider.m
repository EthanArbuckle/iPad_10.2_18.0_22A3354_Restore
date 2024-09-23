@implementation MUPlatterViewStyleProvider

- (int64_t)backgroundStyle
{
  return +[MUInfoCardStyle containerStyle](MUInfoCardStyle, "containerStyle") == 1;
}

- (id)visualEffectForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MUPlatterViewStyleProvider backgroundStyle](self, "backgroundStyle") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", _MKBlurEffectStyleForTraitCollection());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v5, 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIColor)fillColor
{
  if (-[MUPlatterViewStyleProvider backgroundStyle](self, "backgroundStyle") == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.9);
  else
    +[MUInfoCardStyle cardBackgroundColor](MUInfoCardStyle, "cardBackgroundColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

@end
