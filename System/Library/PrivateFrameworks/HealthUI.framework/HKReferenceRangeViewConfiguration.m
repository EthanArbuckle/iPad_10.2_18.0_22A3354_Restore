@implementation HKReferenceRangeViewConfiguration

+ (id)defaultConfiguration
{
  HKReferenceRangeViewConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(HKReferenceRangeViewConfiguration);
  -[HKReferenceRangeViewConfiguration setCurrentValueToReferenceValuePadding:](v2, "setCurrentValueToReferenceValuePadding:", 3.0);
  -[HKReferenceRangeViewConfiguration setHorizontalPadding:](v2, "setHorizontalPadding:", 16.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setReferenceRangeViewColor:](v2, "setReferenceRangeViewColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setReferenceRangeViewBorderColor:](v2, "setReferenceRangeViewBorderColor:", v4);

  -[HKReferenceRangeViewConfiguration setReferenceRangeViewHeight:](v2, "setReferenceRangeViewHeight:", 16.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setCurrentValueTextColor:](v2, "setCurrentValueTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setCurrentValueUnitTextColor:](v2, "setCurrentValueUnitTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setReferenceValueTextColor:](v2, "setReferenceValueTextColor:", v7);

  -[HKReferenceRangeViewConfiguration setCurrentValueTextSize:](v2, "setCurrentValueTextSize:", 27.0);
  -[HKReferenceRangeViewConfiguration setCurrentValueUnitTextStyle:](v2, "setCurrentValueUnitTextStyle:", *MEMORY[0x1E0DC4B10]);
  -[HKReferenceRangeViewConfiguration setCurrentValueNumLinesIfNoRange:](v2, "setCurrentValueNumLinesIfNoRange:", 3);
  -[HKReferenceRangeViewConfiguration setReferenceRangeTextStyle:](v2, "setReferenceRangeTextStyle:", *MEMORY[0x1E0DC4AB8]);
  -[HKReferenceRangeViewConfiguration setReferenceValueYOffset:](v2, "setReferenceValueYOffset:", 5.0);
  -[HKReferenceRangeViewConfiguration setLabelClass:](v2, "setLabelClass:", objc_opt_class());
  return v2;
}

+ (id)annotationEmbeddedConfiguration
{
  HKReferenceRangeViewConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(HKReferenceRangeViewConfiguration);
  -[HKReferenceRangeViewConfiguration setCurrentValueToReferenceValuePadding:](v2, "setCurrentValueToReferenceValuePadding:", 2.0);
  -[HKReferenceRangeViewConfiguration setHorizontalPadding:](v2, "setHorizontalPadding:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setReferenceRangeViewColor:](v2, "setReferenceRangeViewColor:", v3);

  -[HKReferenceRangeViewConfiguration setReferenceRangeViewBorderColor:](v2, "setReferenceRangeViewBorderColor:", 0);
  -[HKReferenceRangeViewConfiguration setReferenceRangeViewHeight:](v2, "setReferenceRangeViewHeight:", 12.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopValueFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setCurrentValueValueFontWithoutRange:](v2, "setCurrentValueValueFontWithoutRange:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopValueFontSmaller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setCurrentValueValueFontWithRange:](v2, "setCurrentValueValueFontWithRange:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopKeyFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setCurrentValueUnitFont:](v2, "setCurrentValueUnitFont:", v6);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontIgnoringAccessibilitySizeForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setDynamicTypeAnchorFont:](v2, "setDynamicTypeAnchorFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setCurrentValueTextColor:](v2, "setCurrentValueTextColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setCurrentValueUnitTextColor:](v2, "setCurrentValueUnitTextColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration setReferenceValueTextColor:](v2, "setReferenceValueTextColor:", v10);

  -[HKReferenceRangeViewConfiguration setCurrentValueTextSize:](v2, "setCurrentValueTextSize:", 22.0);
  -[HKReferenceRangeViewConfiguration setCurrentValueUnitTextStyle:](v2, "setCurrentValueUnitTextStyle:", *MEMORY[0x1E0DC4B10]);
  -[HKReferenceRangeViewConfiguration setCurrentValueNumLinesIfNoRange:](v2, "setCurrentValueNumLinesIfNoRange:", 1);
  -[HKReferenceRangeViewConfiguration setHideReferenceRangeValues:](v2, "setHideReferenceRangeValues:", 1);
  -[HKReferenceRangeViewConfiguration setReferenceValueYOffset:](v2, "setReferenceValueYOffset:", 2.0);
  -[HKReferenceRangeViewConfiguration setLabelClass:](v2, "setLabelClass:", objc_opt_class());
  return v2;
}

- (double)currentValueToReferenceValuePadding
{
  return self->_currentValueToReferenceValuePadding;
}

- (void)setCurrentValueToReferenceValuePadding:(double)a3
{
  self->_currentValueToReferenceValuePadding = a3;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
}

- (double)referenceRangeViewHeight
{
  return self->_referenceRangeViewHeight;
}

- (void)setReferenceRangeViewHeight:(double)a3
{
  self->_referenceRangeViewHeight = a3;
}

- (UIColor)referenceRangeViewColor
{
  return self->_referenceRangeViewColor;
}

- (void)setReferenceRangeViewColor:(id)a3
{
  objc_storeStrong((id *)&self->_referenceRangeViewColor, a3);
}

- (UIColor)referenceRangeViewBorderColor
{
  return self->_referenceRangeViewBorderColor;
}

- (void)setReferenceRangeViewBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_referenceRangeViewBorderColor, a3);
}

- (UIFont)currentValueValueFontWithRange
{
  return self->_currentValueValueFontWithRange;
}

- (void)setCurrentValueValueFontWithRange:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueValueFontWithRange, a3);
}

- (UIFont)currentValueValueFontWithoutRange
{
  return self->_currentValueValueFontWithoutRange;
}

- (void)setCurrentValueValueFontWithoutRange:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueValueFontWithoutRange, a3);
}

- (UIFont)currentValueUnitFont
{
  return self->_currentValueUnitFont;
}

- (void)setCurrentValueUnitFont:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueUnitFont, a3);
}

- (UIFont)dynamicTypeAnchorFont
{
  return self->_dynamicTypeAnchorFont;
}

- (void)setDynamicTypeAnchorFont:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicTypeAnchorFont, a3);
}

- (UIColor)currentValueTextColor
{
  return self->_currentValueTextColor;
}

- (void)setCurrentValueTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueTextColor, a3);
}

- (UIColor)currentValueUnitTextColor
{
  return self->_currentValueUnitTextColor;
}

- (void)setCurrentValueUnitTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueUnitTextColor, a3);
}

- (UIColor)referenceValueTextColor
{
  return self->_referenceValueTextColor;
}

- (void)setReferenceValueTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_referenceValueTextColor, a3);
}

- (double)referenceValueYOffset
{
  return self->_referenceValueYOffset;
}

- (void)setReferenceValueYOffset:(double)a3
{
  self->_referenceValueYOffset = a3;
}

- (double)currentValueTextSize
{
  return self->_currentValueTextSize;
}

- (void)setCurrentValueTextSize:(double)a3
{
  self->_currentValueTextSize = a3;
}

- (NSString)currentValueUnitTextStyle
{
  return self->_currentValueUnitTextStyle;
}

- (void)setCurrentValueUnitTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)currentValueNumLinesIfNoRange
{
  return self->_currentValueNumLinesIfNoRange;
}

- (void)setCurrentValueNumLinesIfNoRange:(int64_t)a3
{
  self->_currentValueNumLinesIfNoRange = a3;
}

- (NSString)referenceRangeTextStyle
{
  return self->_referenceRangeTextStyle;
}

- (void)setReferenceRangeTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)hideReferenceRangeValues
{
  return self->_hideReferenceRangeValues;
}

- (void)setHideReferenceRangeValues:(BOOL)a3
{
  self->_hideReferenceRangeValues = a3;
}

- (Class)labelClass
{
  return self->_labelClass;
}

- (void)setLabelClass:(Class)a3
{
  self->_labelClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceRangeTextStyle, 0);
  objc_storeStrong((id *)&self->_currentValueUnitTextStyle, 0);
  objc_storeStrong((id *)&self->_referenceValueTextColor, 0);
  objc_storeStrong((id *)&self->_currentValueUnitTextColor, 0);
  objc_storeStrong((id *)&self->_currentValueTextColor, 0);
  objc_storeStrong((id *)&self->_dynamicTypeAnchorFont, 0);
  objc_storeStrong((id *)&self->_currentValueUnitFont, 0);
  objc_storeStrong((id *)&self->_currentValueValueFontWithoutRange, 0);
  objc_storeStrong((id *)&self->_currentValueValueFontWithRange, 0);
  objc_storeStrong((id *)&self->_referenceRangeViewBorderColor, 0);
  objc_storeStrong((id *)&self->_referenceRangeViewColor, 0);
}

@end
