@implementation HUGridStatusCellLayoutOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUGridStatusCellLayoutOptions;
  v4 = -[HUGridCellLayoutOptions copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[HUGridStatusCellLayoutOptions descriptionFont](self, "descriptionFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDescriptionFont:", v5);

  -[HUGridStatusCellLayoutOptions largeDescriptionFont](self, "largeDescriptionFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLargeDescriptionFont:", v6);

  -[HUGridStatusCellLayoutOptions descriptionInnerMargin](self, "descriptionInnerMargin");
  objc_msgSend(v4, "setDescriptionInnerMargin:");
  objc_msgSend(v4, "setNumberOfTitleLines:", -[HUGridStatusCellLayoutOptions numberOfTitleLines](self, "numberOfTitleLines"));
  -[HUGridStatusCellLayoutOptions backgroundSize](self, "backgroundSize");
  objc_msgSend(v4, "setBackgroundSize:");
  -[HUGridStatusCellLayoutOptions badgeSize](self, "badgeSize");
  objc_msgSend(v4, "setBadgeSize:");
  -[HUGridStatusCellLayoutOptions estimatedCellWidth](self, "estimatedCellWidth");
  objc_msgSend(v4, "setEstimatedCellWidth:");
  return v4;
}

- (unint64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (UIFont)largeDescriptionFont
{
  return self->_largeDescriptionFont;
}

- (double)estimatedCellWidth
{
  return self->_estimatedCellWidth;
}

- (double)descriptionInnerMargin
{
  return self->_descriptionInnerMargin;
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

- (double)badgeSize
{
  return self->_badgeSize;
}

- (double)backgroundSize
{
  return self->_backgroundSize;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___HUGridStatusCellLayoutOptions;
  objc_msgSendSuper2(&v10, sel_defaultOptionsForCellSizeSubclass_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB550]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  __67__HUGridStatusCellLayoutOptions_defaultOptionsForCellSizeSubclass___block_invoke(*MEMORY[0x1E0CEB568]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDescriptionFont:", v6);

  __67__HUGridStatusCellLayoutOptions_defaultOptionsForCellSizeSubclass___block_invoke(*MEMORY[0x1E0CEB5B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLargeDescriptionFont:", v7);

  objc_msgSend(v4, "setCellCornerRadius:", 0.0);
  v11[0] = &unk_1E7041A10;
  v11[1] = &unk_1E7041A88;
  v12[0] = &unk_1E70437A8;
  v12[1] = &unk_1E7043818;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundSize:", HUConstantForCellSizeSubclass(a3, v8));

  objc_msgSend(v4, "setIconSize:", 36.0);
  objc_msgSend(v4, "setDescriptionInnerMargin:", 6.0);
  objc_msgSend(v4, "setNumberOfTitleLines:", 2);
  objc_msgSend(v4, "setBadgeSize:", 20.0);
  objc_msgSend(v4, "setEstimatedCellWidth:", 150.0);
  return v4;
}

id __67__HUGridStatusCellLayoutOptions_defaultOptionsForCellSizeSubclass___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CEB510];
  v9 = *MEMORY[0x1E0CEB608];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorByAddingAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithDesign:", *MEMORY[0x1E0CEB4F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setNumberOfTitleLines:(unint64_t)a3
{
  self->_numberOfTitleLines = a3;
}

- (void)setLargeDescriptionFont:(id)a3
{
  objc_storeStrong((id *)&self->_largeDescriptionFont, a3);
}

- (void)setEstimatedCellWidth:(double)a3
{
  self->_estimatedCellWidth = a3;
}

- (void)setDescriptionInnerMargin:(double)a3
{
  self->_descriptionInnerMargin = a3;
}

- (void)setDescriptionFont:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionFont, a3);
}

- (void)setBadgeSize:(double)a3
{
  self->_badgeSize = a3;
}

- (void)setBackgroundSize:(double)a3
{
  self->_backgroundSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeDescriptionFont, 0);
  objc_storeStrong((id *)&self->_descriptionFont, 0);
}

- (double)cellHeight
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double result;

  v3 = (double)-[HUGridStatusCellLayoutOptions numberOfTitleLines](self, "numberOfTitleLines");
  -[HUGridCellLayoutOptions font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5;
  -[HUGridCellLayoutOptions font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leading");
  v9 = v8 + v3 * v6 + 1.0;

  -[HUGridCellLayoutOptions iconSize](self, "iconSize");
  if (result < v9)
    return v9;
  return result;
}

- (double)cellWidthForTitle:(id)a3 shortTitle:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  double v9;
  double v10;

  v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x1E0CB3498];
    v8 = a3;
    a3 = (id)objc_msgSend([v7 alloc], "initWithString:", v8);

  }
  -[HUGridStatusCellLayoutOptions cellWidthForAttributedTitle:shortTitle:](self, "cellWidthForAttributedTitle:shortTitle:", a3, v6);
  v10 = v9;

  return v10;
}

- (double)cellWidthForAttributedTitle:(id)a3 shortTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v17[6];
  _QWORD v18[4];

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v7);
  else
    v8 = 0;
  HUGridStatusCell_legacyParseTextLines(v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__HUGridStatusCellLayoutOptions_cellWidthForAttributedTitle_shortTitle___block_invoke;
  v17[3] = &unk_1E6F5D518;
  v17[4] = self;
  v17[5] = v18;
  objc_msgSend(v9, "na_each:", v17);
  -[HUGridStatusCellLayoutOptions backgroundSize](self, "backgroundSize");
  v11 = v10;
  -[HUGridStatusCellLayoutOptions backgroundToTitleSpacing](self, "backgroundToTitleSpacing");
  v13 = v12;
  UICeilToViewScale();
  v15 = v11 + v13 + v14;
  _Block_object_dispose(v18, 8);

  return v15;
}

void __72__HUGridStatusCellLayoutOptions_cellWidthForAttributedTitle_shortTitle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v19 = *MEMORY[0x1E0CEA098];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_attributedStringWithDefaultAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "boundingRectWithSize:options:context:", 1, 0, *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v9 = v8;
  v10 = (void *)MEMORY[0x1E0D33718];
  objc_msgSend(v4, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageAwareOutsetsForString:withFont:", v11, v12);
  v14 = v13;
  v16 = v15;

  v17 = v9 + v14 + v16;
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v17 > *(double *)(v18 + 24))
    *(double *)(v18 + 24) = v17;

}

- (double)cellSpacing
{
  double v2;

  -[HUGridCellLayoutOptions gutter](self, "gutter");
  return v2 + v2;
}

- (double)cellToBackgroundHorizontalSpacing
{
  return 0.0;
}

- (CGPoint)badgeOffsetForUserInterfaceLayoutDirection:(int64_t)a3
{
  unint64_t v4;
  double v5;
  double v6;
  CGFloat v7;
  double Point;
  double v9;
  CGPoint result;

  if (a3 == 1)
    v4 = 5;
  else
    v4 = 3;
  -[HUGridStatusCellLayoutOptions backgroundSize](self, "backgroundSize");
  v6 = v5;
  -[HUGridStatusCellLayoutOptions backgroundSize](self, "backgroundSize");
  Point = HUCircleGetPoint(v4, 0.0 - v6 * 0.5, 0.0 - v7 * 0.5, v6, v7);
  result.y = v9;
  result.x = Point;
  return result;
}

- (int64_t)titleAlignmentForUserInterfaceLayoutDirection:(int64_t)a3
{
  return 2 * (a3 == 1);
}

@end
