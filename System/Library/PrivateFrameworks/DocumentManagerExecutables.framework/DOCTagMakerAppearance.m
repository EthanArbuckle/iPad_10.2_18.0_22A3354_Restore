@implementation DOCTagMakerAppearance

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCTagMakerAppearance;
  return -[DOCTagMakerAppearance init](&v3, sel_init);
}

- (DOCTagContainerAppearanceProviding)container
{
  return (DOCTagContainerAppearanceProviding *)-[DOCTagPickerPanelAppearance initWithTopMargin:bottomMargin:maxHeight:]([DOCTagPickerPanelAppearance alloc], "initWithTopMargin:bottomMargin:maxHeight:", 18.0, 18.0, -12341234.0);
}

- (BOOL)inputFieldShowsLeadingDot
{
  return 1;
}

- (NSDirectionalEdgeInsets)inputFieldRoundedCornerBackgroundMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = *MEMORY[0x24BEBD250];
  v3 = *(double *)(MEMORY[0x24BEBD250] + 8);
  v4 = *(double *)(MEMORY[0x24BEBD250] + 16);
  v5 = *(double *)(MEMORY[0x24BEBD250] + 24);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)rowOfTagsDotSize
{
  return 30.0;
}

- (double)rowOfTagsDotSelectionBorderWidth
{
  return 0.0;
}

- (UIColor)rowOfTagsDotSelectionBorderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
}

- (NSDirectionalEdgeInsets)rowOfTagsContentInsets
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSDirectionalEdgeInsets result;

  +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellExternalMargins");
  v4 = v3 + -8.0;

  +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellExternalMargins");
  v7 = v6 + -8.0;

  v8 = 8.0;
  v9 = 8.0;
  v10 = v4;
  v11 = v7;
  result.trailing = v11;
  result.bottom = v9;
  result.leading = v10;
  result.top = v8;
  return result;
}

@end
