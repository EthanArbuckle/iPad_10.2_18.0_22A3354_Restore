@implementation DOCTagInfoCollectionAppearance

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCTagInfoCollectionAppearance;
  return -[DOCTagInfoCollectionAppearance init](&v3, sel_init);
}

- (NSString)labelFontStyle
{
  return (NSString *)(id)*MEMORY[0x24BEBE1F0];
}

- (double)horizontalTagSpacing
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValueForValue:", 3.0);
  v4 = v3;

  return v4;
}

- (double)verticalTagSpacing
{
  return 3.0;
}

- (double)tagToLabelSpacing
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValueForValue:", 4.0);
  v4 = v3;

  return v4;
}

- (double)cellCornerRadius
{
  return 3.0;
}

- (NSDirectionalEdgeInsets)cellContentInsets
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

  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValueForValue:", 4.0);
  v4 = v3;

  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValueForValue:", 4.0);
  v7 = v6;

  v8 = 2.0;
  v9 = 2.0;
  v10 = v4;
  v11 = v7;
  result.trailing = v11;
  result.bottom = v9;
  result.leading = v10;
  result.top = v8;
  return result;
}

- (double)dimmingAlphaDuringMenuPresentation
{
  return 1.0;
}

@end
