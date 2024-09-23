@implementation CNContactListStyleDefaultProvider

- (UIColor)cellBackgroundColor
{
  return 0;
}

- (UIColor)cellBackgroundSelectedColor
{
  return +[CNUIColorRepository contactStyleDefaultSelectedCellBackgroundColor](CNUIColorRepository, "contactStyleDefaultSelectedCellBackgroundColor");
}

- (UIColor)cellNameTextColor
{
  return +[CNUIColorRepository contactStyleDefaultTextColor](CNUIColorRepository, "contactStyleDefaultTextColor");
}

- (UIColor)cellNameTextHighlightedColor
{
  return +[CNUIColorRepository contactStyleDefaultHighlightedTextColor](CNUIColorRepository, "contactStyleDefaultHighlightedTextColor");
}

- (UIColor)cellNameTextHighlightedLightColor
{
  return +[CNUIColorRepository contactStyleLightStyleHighlightedTextColor](CNUIColorRepository, "contactStyleLightStyleHighlightedTextColor");
}

- (UIColor)cellSearchBackgroundColor
{
  return +[CNUIColorRepository contactStyleDefaultSearchCellBackgroundColor](CNUIColorRepository, "contactStyleDefaultSearchCellBackgroundColor");
}

- (UIColor)cellSearchResultTextColor
{
  return +[CNUIColorRepository contactStyleDefaultTextColor](CNUIColorRepository, "contactStyleDefaultTextColor");
}

- (UIColor)cellSearchResultTextDisabledColor
{
  return +[CNUIColorRepository contactStyleDefaultDisabledTextColor](CNUIColorRepository, "contactStyleDefaultDisabledTextColor");
}

- (UIColor)cellBlueSelectionSecondaryTextColor
{
  return +[CNUIColorRepository contactStyleDefaultBlueSelectionSecondaryTextColor](CNUIColorRepository, "contactStyleDefaultBlueSelectionSecondaryTextColor");
}

- (UIFont)cellNameTextFont
{
  return +[CNUIFontRepository contactStyleDefaultTextFont](CNUIFontRepository, "contactStyleDefaultTextFont");
}

- (UIFont)cellNameTextEmphasisedFont
{
  return +[CNUIFontRepository contactStyleDefaultBoldTextFont](CNUIFontRepository, "contactStyleDefaultBoldTextFont");
}

- (BOOL)cellIsOpaque
{
  return 1;
}

- (BOOL)cellIsVibrant
{
  return 0;
}

- (UIColor)headerBackgroundColor
{
  return 0;
}

- (UIColor)headerIndexTextColor
{
  return +[CNUIColorRepository contactStyleDefaultTextColor](CNUIColorRepository, "contactStyleDefaultTextColor");
}

- (UIColor)bannerTitleTextColor
{
  return +[CNUIColorRepository contactStyleDefaultTextColor](CNUIColorRepository, "contactStyleDefaultTextColor");
}

- (UIColor)tableBackgroundColor
{
  return 0;
}

- (UIColor)tableBackgroundFilteredColor
{
  return 0;
}

- (UIColor)tableSectionIndexBackgroundColor
{
  return 0;
}

- (UIColor)tableSeparatorColor
{
  return +[CNUIColorRepository contactStyleDefaultSeparatorColor](CNUIColorRepository, "contactStyleDefaultSeparatorColor");
}

- (unint64_t)tableNoContactsAvailableStyle
{
  return 0;
}

- (int64_t)tableSeparatorStyle
{
  return 0;
}

- (int64_t)tableSeparatorOverlayBlendMode
{
  return 0;
}

- (BOOL)tableIsOpaque
{
  return 1;
}

- (BOOL)usesInsetPlatterStyle
{
  return 0;
}

- (UIColor)searchBarBackgroundColor
{
  return 0;
}

- (UIColor)searchBarTextColor
{
  return +[CNUIColorRepository contactStyleDefaultTextColor](CNUIColorRepository, "contactStyleDefaultTextColor");
}

- (UIColor)searchBarTextDisabledColor
{
  return +[CNUIColorRepository contactStyleDefaultReadOnlyTextColor](CNUIColorRepository, "contactStyleDefaultReadOnlyTextColor");
}

- (UIColor)searchBarPlaceholderTextColor
{
  return +[CNUIColorRepository contactStyleDefaultPlaceholderTextColor](CNUIColorRepository, "contactStyleDefaultPlaceholderTextColor");
}

- (UIColor)searchBarPlaceholderTextDisabledColor
{
  return +[CNUIColorRepository contactStyleDefaultPlaceholderTextColor](CNUIColorRepository, "contactStyleDefaultPlaceholderTextColor");
}

- (int64_t)searchBarStyle
{
  return 0;
}

- (int64_t)searchBarKeyboardAppearance
{
  return 0;
}

- (BOOL)searchBarIsTranslucent
{
  return 0;
}

- (int64_t)navigationBarStyle
{
  return 0;
}

- (BOOL)navigationBarIsTranslucent
{
  return 0;
}

@end
