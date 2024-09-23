@implementation CNUINavigationListStyleProviderImpl

- (UIColor)cellBackgroundColor
{
  return +[CNUIColorRepository navigationListCellBackgroundColorRegular](CNUIColorRepository, "navigationListCellBackgroundColorRegular");
}

- (UIColor)cellBackgroundExpandedColor
{
  return +[CNUIColorRepository navigationListCellBackgroundExpandedColorRegular](CNUIColorRepository, "navigationListCellBackgroundExpandedColorRegular");
}

- (UIColor)cellBackgroundHighlightedColor
{
  return +[CNUIColorRepository navigationListCellBackgroundHighlightedColorRegular](CNUIColorRepository, "navigationListCellBackgroundHighlightedColorRegular");
}

- (UIColor)cellTitleTextColor
{
  return +[CNUIColorRepository navigationListCellTitleTextColorRegular](CNUIColorRepository, "navigationListCellTitleTextColorRegular");
}

- (UIColor)cellTitleTextHighlightedColor
{
  return 0;
}

- (UIColor)cellSubtitleTextColor
{
  return +[CNUIColorRepository navigationListCellSubtitleTextColorRegular](CNUIColorRepository, "navigationListCellSubtitleTextColorRegular");
}

- (UIColor)cellSubtitleTextHighlightedColor
{
  return 0;
}

- (UIColor)detailCellTitleTextColor
{
  return +[CNUIColorRepository navigationListDetailCellTitleTextColorRegular](CNUIColorRepository, "navigationListDetailCellTitleTextColorRegular");
}

- (UIColor)detailCellTitleTextHighlightedColor
{
  return 0;
}

- (UIColor)detailCellSubtitleTextColor
{
  return +[CNUIColorRepository navigationListDetailCellSubtitleTextColorRegular](CNUIColorRepository, "navigationListDetailCellSubtitleTextColorRegular");
}

- (UIColor)detailCellSubtitleTextHighlightedColor
{
  return 0;
}

- (UIColor)actionIconFillColor
{
  return +[CNUIColorRepository navigationListActionIconFillColorRegular](CNUIColorRepository, "navigationListActionIconFillColorRegular");
}

- (UIColor)actionIconFillHighlightedColor
{
  return +[CNUIColorRepository navigationListActionIconFillHighlightedColorRegular](CNUIColorRepository, "navigationListActionIconFillHighlightedColorRegular");
}

- (UIFont)cellTitleFont
{
  return +[CNUIFontRepository navigationListCellTitleFontRegular](CNUIFontRepository, "navigationListCellTitleFontRegular");
}

- (UIFont)cellSubtitleFont
{
  return +[CNUIFontRepository navigationListCellSubtitleFontRegular](CNUIFontRepository, "navigationListCellSubtitleFontRegular");
}

- (UIFont)detailCellTitleFont
{
  return +[CNUIFontRepository navigationListDetailCellTitleFontRegular](CNUIFontRepository, "navigationListDetailCellTitleFontRegular");
}

- (UIFont)detailCellSubtitleFont
{
  return +[CNUIFontRepository navigationListDetailCellSubtitleFontRegular](CNUIFontRepository, "navigationListDetailCellSubtitleFontRegular");
}

- (double)cellUserActionLeftMargin
{
  return 79.0;
}

- (double)cellTitleLabelFirstBaselineAnchorConstraintConstant
{
  return 38.0;
}

- (double)cellSubtitleLabelFirstBaselineAnchorConstraintConstant
{
  return 24.0;
}

- (double)cellContentViewBottomAnchorConstraintConstant
{
  return 24.0;
}

- (double)detailCellTitleLabelFirstBaselineAnchorConstraintConstant
{
  return 27.0;
}

- (double)detailCellSubtitleLabelFirstBaselineAnchorConstraintConstant
{
  return 20.0;
}

- (double)detailCellContentViewBottomAnchorConstraintConstant
{
  return 15.0;
}

- (BOOL)showCellSeparator
{
  return 1;
}

@end
