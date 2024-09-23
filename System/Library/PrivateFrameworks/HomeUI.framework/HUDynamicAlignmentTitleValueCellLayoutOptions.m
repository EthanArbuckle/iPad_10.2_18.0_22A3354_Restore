@implementation HUDynamicAlignmentTitleValueCellLayoutOptions

- (HUDynamicAlignmentTitleValueCellLayoutOptions)initWithCellSizeSubclass:(int64_t)a3 longestPossibleValueText:(id)a4 longestPossibleTitleText:(id)a5
{
  id v8;
  id v9;
  HUDynamicAlignmentTitleValueCellLayoutOptions *v10;
  HUDynamicAlignmentTitleValueCellLayoutOptions *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUDynamicAlignmentTitleValueCellLayoutOptions;
  v10 = -[HUGridCellLayoutOptions initWithCellSizeSubclass:](&v13, sel_initWithCellSizeSubclass_, a3);
  v11 = v10;
  if (v10)
  {
    -[HUDynamicAlignmentTitleValueCellLayoutOptions setLongestPossibleValueText:](v10, "setLongestPossibleValueText:", v8);
    -[HUDynamicAlignmentTitleValueCellLayoutOptions setLongestPossibleTitleText:](v11, "setLongestPossibleTitleText:", v9);
  }

  return v11;
}

- (NSString)longestPossibleValueText
{
  return self->_longestPossibleValueText;
}

- (void)setLongestPossibleValueText:(id)a3
{
  objc_storeStrong((id *)&self->_longestPossibleValueText, a3);
}

- (NSString)longestPossibleTitleText
{
  return self->_longestPossibleTitleText;
}

- (void)setLongestPossibleTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_longestPossibleTitleText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longestPossibleTitleText, 0);
  objc_storeStrong((id *)&self->_longestPossibleValueText, 0);
}

@end
