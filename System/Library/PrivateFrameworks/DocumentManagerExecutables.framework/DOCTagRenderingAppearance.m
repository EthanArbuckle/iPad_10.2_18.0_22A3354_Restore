@implementation DOCTagRenderingAppearance

- (UIColor)underlyingColorForNoneTag
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
}

- (double)defaultBorderWidth
{
  double v2;
  double v3;
  _BOOL4 IsBoldTextEnabled;
  double v5;

  -[DOCTagRenderingAppearance _defaultBorderWidth](self, "_defaultBorderWidth");
  v3 = v2;
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = 1.0;
  if (IsBoldTextEnabled)
    v5 = 2.0;
  return v3 * v5;
}

- (double)_defaultBorderWidth
{
  return 1.0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCTagRenderingAppearance;
  return -[DOCTagRenderingAppearance init](&v3, sel_init);
}

- (BOOL)outlineTagsToIndicateMixedState
{
  return 0;
}

- (int64_t)imageWeightForVariant:(unint64_t)a3
{
  return 4;
}

@end
