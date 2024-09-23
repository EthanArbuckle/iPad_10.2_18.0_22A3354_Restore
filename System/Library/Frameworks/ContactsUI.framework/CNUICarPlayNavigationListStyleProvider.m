@implementation CNUICarPlayNavigationListStyleProvider

- (id)cellBackgroundColor
{
  return +[CNUIColorRepository carPlayTableViewCellBackgroundColor](CNUIColorRepository, "carPlayTableViewCellBackgroundColor");
}

- (id)cellBackgroundExpandedColor
{
  return +[CNUIColorRepository carPlayTableViewCellBackgroundColor](CNUIColorRepository, "carPlayTableViewCellBackgroundColor");
}

- (id)cellBackgroundHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewCellBackgroundHighlightedColor](CNUIColorRepository, "carPlayTableViewCellBackgroundHighlightedColor");
}

- (id)cellTitleTextColor
{
  return +[CNUIColorRepository carPlayTableViewCellTitleTextColor](CNUIColorRepository, "carPlayTableViewCellTitleTextColor");
}

- (id)cellTitleTextHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewCellTitleTextHighlightedColor](CNUIColorRepository, "carPlayTableViewCellTitleTextHighlightedColor");
}

- (id)cellSubtitleTextColor
{
  return +[CNUIColorRepository carPlayTableViewCellSubtitleTextColor](CNUIColorRepository, "carPlayTableViewCellSubtitleTextColor");
}

- (id)cellSubtitleTextHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewCellSubtitleTextHighlightedColor](CNUIColorRepository, "carPlayTableViewCellSubtitleTextHighlightedColor");
}

- (id)detailCellTitleTextColor
{
  return +[CNUIColorRepository carPlayTableViewCellTitleTextColor](CNUIColorRepository, "carPlayTableViewCellTitleTextColor");
}

- (id)detailCellTitleTextHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewCellTitleTextHighlightedColor](CNUIColorRepository, "carPlayTableViewCellTitleTextHighlightedColor");
}

- (id)detailCellSubtitleTextColor
{
  return +[CNUIColorRepository carPlayTableViewCellSubtitleTextColor](CNUIColorRepository, "carPlayTableViewCellSubtitleTextColor");
}

- (id)detailCellSubtitleTextHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewCellSubtitleTextHighlightedColor](CNUIColorRepository, "carPlayTableViewCellSubtitleTextHighlightedColor");
}

- (id)actionIconFillColor
{
  return +[CNUIColorRepository carPlayTableViewGlyphColor](CNUIColorRepository, "carPlayTableViewGlyphColor");
}

- (id)actionIconFillHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewGlyphHighlightedColor](CNUIColorRepository, "carPlayTableViewGlyphHighlightedColor");
}

- (id)cellTitleFont
{
  return +[CNUIFontRepository carPlayTableViewCellTitleFont](CNUIFontRepository, "carPlayTableViewCellTitleFont");
}

- (id)detailCellTitleFont
{
  return +[CNUIFontRepository carPlayTableViewCellTitleFont](CNUIFontRepository, "carPlayTableViewCellTitleFont");
}

- (id)detailCellSubtitleFont
{
  return +[CNUIFontRepository carPlayTableViewCellSubtitleFont](CNUIFontRepository, "carPlayTableViewCellSubtitleFont");
}

- (double)cellUserActionLeftMargin
{
  return 48.0;
}

- (double)cellTitleLabelFirstBaselineAnchorConstraintConstant
{
  return 28.0;
}

- (double)cellContentViewBottomAnchorConstraintConstant
{
  return 16.0;
}

- (double)detailCellTitleLabelFirstBaselineAnchorConstraintConstant
{
  return 18.0;
}

- (double)detailCellSubtitleLabelFirstBaselineAnchorConstraintConstant
{
  return 18.0;
}

- (double)detailCellContentViewBottomAnchorConstraintConstant
{
  return 8.0;
}

- (BOOL)showCellSeparator
{
  return 0;
}

@end
