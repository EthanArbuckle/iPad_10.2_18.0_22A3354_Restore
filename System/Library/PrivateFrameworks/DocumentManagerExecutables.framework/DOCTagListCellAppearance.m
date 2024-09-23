@implementation DOCTagListCellAppearance

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCTagListCellAppearance;
  return -[DOCTagListCellAppearance init](&v3, sel_init);
}

- (DOCTagContainerAppearanceProviding)container
{
  return (DOCTagContainerAppearanceProviding *)-[DOCTagPickerPanelAppearance initWithTopMargin:bottomMargin:maxHeight:]([DOCTagPickerPanelAppearance alloc], "initWithTopMargin:bottomMargin:maxHeight:", 18.0, 10.0, 428.0);
}

- (BOOL)addTagCellShowsDashedBorder
{
  return 1;
}

- (id)checkmarkImageColorForTag:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "tagColorIfNotClear");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2DF20], "nonClearNoneTagColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (UIImageSymbolConfiguration)checkmarkImageConfiguration
{
  return (UIImageSymbolConfiguration *)objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 6);
}

- (id)backgroundColorForTag:(id)a3 selected:(BOOL)a4
{
  void *v4;
  void *v5;

  if (a3 && a4)
  {
    objc_msgSend(a3, "tagBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.04);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSString)titleTextStyle
{
  return (NSString *)(id)*MEMORY[0x24BEBE1D0];
}

- (NSDirectionalEdgeInsets)cellExternalMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 15.0;
  v4 = 7.0;
  v5 = 15.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)cellInteriorLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 13.0;
  v4 = 0.0;
  v5 = 14.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (UIHoverStyle)cellContentHoverStyle
{
  return 0;
}

- (double)dotSize
{
  return 12.0;
}

- (double)cellCornerRadius
{
  return 3.0;
}

- (double)spacing_leadingEdgeToDot
{
  return 13.0;
}

- (double)spacing_dotToTitle
{
  return 14.0;
}

- (double)spacing_trailingEdgeToCheckmark
{
  return 12.0;
}

- (double)spacing_titleToCheckmark
{
  return 12.0;
}

@end
