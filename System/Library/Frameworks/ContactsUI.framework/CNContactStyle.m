@implementation CNContactStyle

- (UIColor)contactHeaderBackgroundColor
{
  return self->_contactHeaderBackgroundColor;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (UIColor)taglineTextColor
{
  return self->_taglineTextColor;
}

- (UIColor)sectionBackgroundColor
{
  return self->_sectionBackgroundColor;
}

- (UIColor)notesTextColor
{
  return self->_notesTextColor;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (BOOL)usesInsetPlatterStyle
{
  return -[CNContactStyle contactViewPlatterStyle](self, "contactViewPlatterStyle") == 1;
}

- (int64_t)contactViewPlatterStyle
{
  return self->_contactViewPlatterStyle;
}

+ (id)currentStyle
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)sCurrentStyle;
  if (!sCurrentStyle)
  {
    if (CNUIIsFaceTime())
    {
      objc_msgSend(a1, "faceTimeStyle");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (CNUIIsWatchCompanion())
        objc_msgSend(a1, "watchStyle");
      else
        objc_msgSend(a1, "defaultStyle");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)sCurrentStyle;
    sCurrentStyle = v4;

    v3 = (void *)sCurrentStyle;
  }
  return v3;
}

- (double)sectionContentInset
{
  return self->_sectionContentInset;
}

- (double)sectionMaximumPlatterWidth
{
  return self->_sectionMaximumPlatterWidth;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)usesOpaqueBackground
{
  return self->_usesOpaqueBackground;
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIEdgeInsets)separatorInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInset.top;
  left = self->_separatorInset.left;
  bottom = self->_separatorInset.bottom;
  right = self->_separatorInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIFont)textFont
{
  return +[CNUIFontRepository contactStyleDefaultTextFont](CNUIFontRepository, "contactStyleDefaultTextFont");
}

- (UIFont)boldTextFont
{
  return +[CNUIFontRepository contactStyleDefaultBoldTextFont](CNUIFontRepository, "contactStyleDefaultBoldTextFont");
}

- (UIColor)listTextColor
{
  return self->_listTextColor;
}

- (UIColor)tintColorOverride
{
  return self->_tintColorOverride;
}

+ (id)defaultStyle
{
  return objc_alloc_init(CNContactStyle);
}

- (double)sectionCornerRadius
{
  return self->_sectionCornerRadius;
}

- (UIColor)selectedCellBackgroundColor
{
  return self->_selectedCellBackgroundColor;
}

- (BOOL)blurSupported
{
  return self->_blurSupported;
}

- (UIColor)transportBorderColor
{
  return self->_transportBorderColor;
}

- (UIColor)transportBackgroundColor
{
  return self->_transportBackgroundColor;
}

- (BOOL)shouldPresentInCurrentContext
{
  return self->_shouldPresentInCurrentContext;
}

- (CNContactStyle)init
{
  CNContactStyle *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CNContactStyle *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CNContactStyle;
  v2 = -[CNContactStyle init](&v26, sel_init);
  if (v2)
  {
    +[CNUIColorRepository contactStyleDefaultTextColor](CNUIColorRepository, "contactStyleDefaultTextColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setTextColor:](v2, "setTextColor:", v3);

    +[CNUIColorRepository contactStyleDefaultTaglineTextColor](CNUIColorRepository, "contactStyleDefaultTaglineTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setTaglineTextColor:](v2, "setTaglineTextColor:", v4);

    +[CNUIColorRepository contactStyleDefaultDisabledTextColor](CNUIColorRepository, "contactStyleDefaultDisabledTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setDisabledTextColor:](v2, "setDisabledTextColor:", v5);

    +[CNUIColorRepository contactStyleDefaultBlueSelectionSecondaryTextColor](CNUIColorRepository, "contactStyleDefaultBlueSelectionSecondaryTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setBlueSelectionSecondaryTextColor:](v2, "setBlueSelectionSecondaryTextColor:", v6);

    +[CNUIColorRepository contactStyleDefaultHighlightedTextColor](CNUIColorRepository, "contactStyleDefaultHighlightedTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setHighlightedTextColor:](v2, "setHighlightedTextColor:", v7);

    +[CNUIColorRepository contactStyleDefaultPlaceholderTextColor](CNUIColorRepository, "contactStyleDefaultPlaceholderTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setPlaceholderTextColor:](v2, "setPlaceholderTextColor:", v8);

    +[CNUIColorRepository contactStyleDefaultNotesTextColor](CNUIColorRepository, "contactStyleDefaultNotesTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setNotesTextColor:](v2, "setNotesTextColor:", v9);

    +[CNUIColorRepository contactStyleDefaultReadOnlyTextColor](CNUIColorRepository, "contactStyleDefaultReadOnlyTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setReadOnlyTextColor:](v2, "setReadOnlyTextColor:", v10);

    +[CNUIColorRepository contactStyleDefaultSuggestedLabelTextColor](CNUIColorRepository, "contactStyleDefaultSuggestedLabelTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setSuggestedLabelTextColor:](v2, "setSuggestedLabelTextColor:", v11);

    +[CNUIColorRepository contactStyleDefaultSuggestedValueTextColor](CNUIColorRepository, "contactStyleDefaultSuggestedValueTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setSuggestedValueTextColor:](v2, "setSuggestedValueTextColor:", v12);

    -[CNContactStyle setContactViewPlatterStyle:](v2, "setContactViewPlatterStyle:", 1);
    v13 = -[CNContactStyle contactViewPlatterStyle](v2, "contactViewPlatterStyle");
    -[CNContactStyle setUsesOpaqueBackground:](v2, "setUsesOpaqueBackground:", 1);
    +[CNUIColorRepository contactStyleDefaultTransportBackgroundColor](CNUIColorRepository, "contactStyleDefaultTransportBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setTransportBackgroundColor:](v2, "setTransportBackgroundColor:", v14);

    +[CNUIColorRepository contactStyleDefaultTransportBorderColor](CNUIColorRepository, "contactStyleDefaultTransportBorderColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setTransportBorderColor:](v2, "setTransportBorderColor:", v15);

    if (v13 == 1)
    {
      +[CNUIColorRepository contactStyleWithInsetPlattersDefaultContactHeaderBackgroundColor](CNUIColorRepository, "contactStyleWithInsetPlattersDefaultContactHeaderBackgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStyle setContactHeaderBackgroundColor:](v2, "setContactHeaderBackgroundColor:", v16);

      +[CNUIColorRepository contactStyleWithInsetPlattersDefaultContactHeaderDropShadowColor](CNUIColorRepository, "contactStyleWithInsetPlattersDefaultContactHeaderDropShadowColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 7;
    }
    else
    {
      +[CNUIColorRepository contactStyleDefaultContactHeaderBackgroundColor](CNUIColorRepository, "contactStyleDefaultContactHeaderBackgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStyle setContactHeaderBackgroundColor:](v2, "setContactHeaderBackgroundColor:", v19);

      +[CNUIColorRepository contactStyleDefaultContactHeaderDropShadowColor](CNUIColorRepository, "contactStyleDefaultContactHeaderDropShadowColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 4;
    }
    -[CNContactStyle setContactHeaderDropShadowColor:](v2, "setContactHeaderDropShadowColor:", v17);

    -[CNContactStyle setSectionMaximumPlatterWidth:](v2, "setSectionMaximumPlatterWidth:", 454.0);
    -[CNContactStyle setSectionCornerRadius:](v2, "setSectionCornerRadius:", 8.0);
    -[CNContactStyle setSectionContentInset:](v2, "setSectionContentInset:", 16.0);
    +[CNUIColorRepository contactStyleDefaultSeparatorColor](CNUIColorRepository, "contactStyleDefaultSeparatorColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setSeparatorColor:](v2, "setSeparatorColor:", v20);

    -[CNContactStyle setSeparatorStyle:](v2, "setSeparatorStyle:", 1);
    +[CNUIColorRepository contactStyleDefaultSelectedCellBackgroundColor](CNUIColorRepository, "contactStyleDefaultSelectedCellBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setSelectedCellBackgroundColor:](v2, "setSelectedCellBackgroundColor:", v21);

    +[CNUIColorRepository contactStyleDefaultGroupedBackgroundColor](CNUIColorRepository, "contactStyleDefaultGroupedBackgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setGroupedBackgroundColor:](v2, "setGroupedBackgroundColor:", v22);

    +[CNUIColorRepository contactStyleDefaultSearchCellBackgroundColor](CNUIColorRepository, "contactStyleDefaultSearchCellBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setSearchCellBackgroundColor:](v2, "setSearchCellBackgroundColor:", v23);

    -[CNContactStyle setUsesTranslucentBarStyle:](v2, "setUsesTranslucentBarStyle:", 0);
    -[CNContactStyle setTopActionsViewStyle:](v2, "setTopActionsViewStyle:", v18);
    -[CNContactStyle setInlineActionsViewStyle:](v2, "setInlineActionsViewStyle:", 1);
    v24 = v2;
  }

  return v2;
}

- (void)setUsesTranslucentBarStyle:(BOOL)a3
{
  self->_usesTranslucentBarStyle = a3;
}

- (void)setUsesOpaqueBackground:(BOOL)a3
{
  self->_usesOpaqueBackground = a3;
}

- (void)setTransportBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_transportBorderColor, a3);
}

- (void)setTransportBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_transportBackgroundColor, a3);
}

- (void)setTopActionsViewStyle:(int64_t)a3
{
  self->_topActionsViewStyle = a3;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (void)setTaglineTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_taglineTextColor, a3);
}

- (void)setSuggestedValueTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedValueTextColor, a3);
}

- (void)setSuggestedLabelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedLabelTextColor, a3);
}

- (void)setSeparatorStyle:(int64_t)a3
{
  self->_separatorStyle = a3;
}

- (void)setSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorColor, a3);
}

- (void)setSelectedCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCellBackgroundColor, a3);
}

- (void)setSectionMaximumPlatterWidth:(double)a3
{
  self->_sectionMaximumPlatterWidth = a3;
}

- (void)setSectionCornerRadius:(double)a3
{
  self->_sectionCornerRadius = a3;
}

- (void)setSectionContentInset:(double)a3
{
  self->_sectionContentInset = a3;
}

- (void)setSearchCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_searchCellBackgroundColor, a3);
}

- (void)setReadOnlyTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_readOnlyTextColor, a3);
}

- (void)setPlaceholderTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTextColor, a3);
}

- (void)setNotesTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_notesTextColor, a3);
}

- (void)setInlineActionsViewStyle:(int64_t)a3
{
  self->_inlineActionsViewStyle = a3;
}

- (void)setHighlightedTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTextColor, a3);
}

- (void)setGroupedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_groupedBackgroundColor, a3);
}

- (void)setDisabledTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledTextColor, a3);
}

- (void)setContactViewPlatterStyle:(int64_t)a3
{
  self->_contactViewPlatterStyle = a3;
}

- (void)setContactHeaderDropShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_contactHeaderDropShadowColor, a3);
}

- (void)setContactHeaderBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_contactHeaderBackgroundColor, a3);
}

- (void)setBlueSelectionSecondaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_blueSelectionSecondaryTextColor, a3);
}

- (UIColor)contactHeaderDropShadowColor
{
  return self->_contactHeaderDropShadowColor;
}

- (UIColor)groupedBackgroundColor
{
  return self->_groupedBackgroundColor;
}

- (int64_t)separatorBackdropOverlayBlendMode
{
  return self->_separatorBackdropOverlayBlendMode;
}

- (UIColor)sectionIndexBackgroundColor
{
  return self->_sectionIndexBackgroundColor;
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (BOOL)usesTranslucentBarStyle
{
  return self->_usesTranslucentBarStyle;
}

- (UIColor)searchBarBackgroundColor
{
  return self->_searchBarBackgroundColor;
}

- (UIColor)placeholderTextColor
{
  return self->_placeholderTextColor;
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (CNContactStyle)initWithCoder:(id)a3
{
  id v4;
  CNContactStyle *v5;
  void *v6;
  void *v7;
  CNContactStyle *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactStyle;
  v5 = -[CNContactStyle init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setTextColor:](v5, "setTextColor:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStyle setBackgroundColor:](v5, "setBackgroundColor:", v7);

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIColor *textColor;
  id v5;

  textColor = self->_textColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", textColor, CFSTR("textColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));

}

- (UIColor)sectionHeaderTextColor
{
  return self->_sectionHeaderTextColor;
}

- (void)setSectionHeaderTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderTextColor, a3);
}

- (UIColor)disabledTextColor
{
  return self->_disabledTextColor;
}

- (UIColor)blueSelectionSecondaryTextColor
{
  return self->_blueSelectionSecondaryTextColor;
}

- (UIColor)highlightedTextLightColor
{
  return self->_highlightedTextLightColor;
}

- (void)setHighlightedTextLightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTextLightColor, a3);
}

- (UIColor)suggestedLabelTextColor
{
  return self->_suggestedLabelTextColor;
}

- (UIColor)suggestedValueTextColor
{
  return self->_suggestedValueTextColor;
}

- (UIColor)readOnlyTextColor
{
  return self->_readOnlyTextColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setSectionIndexBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIndexBackgroundColor, a3);
}

- (void)setSeparatorBackdropOverlayBlendMode:(int64_t)a3
{
  self->_separatorBackdropOverlayBlendMode = a3;
}

- (void)setSearchBarBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarBackgroundColor, a3);
}

- (UIColor)transportBoldBackgroundColor
{
  return self->_transportBoldBackgroundColor;
}

- (void)setTransportBoldBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_transportBoldBackgroundColor, a3);
}

- (void)setTintColorOverride:(id)a3
{
  objc_storeStrong((id *)&self->_tintColorOverride, a3);
}

- (UIColor)headerBackgroundColor
{
  return self->_headerBackgroundColor;
}

- (void)setHeaderBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_headerBackgroundColor, a3);
}

- (void)setSeparatorInset:(UIEdgeInsets)a3
{
  self->_separatorInset = a3;
}

- (void)setSectionBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_sectionBackgroundColor, a3);
}

- (UIColor)searchCellBackgroundColor
{
  return self->_searchCellBackgroundColor;
}

- (void)setListTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_listTextColor, a3);
}

- (void)setBarStyle:(int64_t)a3
{
  self->_barStyle = a3;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (void)setShouldPresentInCurrentContext:(BOOL)a3
{
  self->_shouldPresentInCurrentContext = a3;
}

- (void)setBlurSupported:(BOOL)a3
{
  self->_blurSupported = a3;
}

- (int64_t)modalTransitionStyle
{
  return self->_modalTransitionStyle;
}

- (void)setModalTransitionStyle:(int64_t)a3
{
  self->_modalTransitionStyle = a3;
}

- (int64_t)topActionsViewStyle
{
  return self->_topActionsViewStyle;
}

- (int64_t)inlineActionsViewStyle
{
  return self->_inlineActionsViewStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listTextColor, 0);
  objc_storeStrong((id *)&self->_searchCellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_groupedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectedCellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_headerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColorOverride, 0);
  objc_storeStrong((id *)&self->_contactHeaderDropShadowColor, 0);
  objc_storeStrong((id *)&self->_contactHeaderBackgroundColor, 0);
  objc_storeStrong((id *)&self->_transportBoldBackgroundColor, 0);
  objc_storeStrong((id *)&self->_transportBorderColor, 0);
  objc_storeStrong((id *)&self->_transportBackgroundColor, 0);
  objc_storeStrong((id *)&self->_searchBarBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sectionIndexBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_notesTextColor, 0);
  objc_storeStrong((id *)&self->_readOnlyTextColor, 0);
  objc_storeStrong((id *)&self->_suggestedValueTextColor, 0);
  objc_storeStrong((id *)&self->_suggestedLabelTextColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextLightColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_placeholderTextColor, 0);
  objc_storeStrong((id *)&self->_blueSelectionSecondaryTextColor, 0);
  objc_storeStrong((id *)&self->_disabledTextColor, 0);
  objc_storeStrong((id *)&self->_taglineTextColor, 0);
  objc_storeStrong((id *)&self->_sectionHeaderTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

+ (id)faceTimeStyle
{
  return (id)objc_msgSend((id)objc_opt_class(), "darkStyleWithOverrideUserInterfaceStyle:", 2);
}

+ (id)spotlightStyle
{
  return (id)objc_msgSend((id)objc_opt_class(), "darkStyleWithOverrideUserInterfaceStyle:", 0);
}

+ (id)darkStyleWithOverrideUserInterfaceStyle:(int64_t)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(a1, "defaultStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (darkStyleWithOverrideUserInterfaceStyle__onceToken != -1)
    dispatch_once(&darkStyleWithOverrideUserInterfaceStyle__onceToken, &__block_literal_global_25018);
  v5 = darkStyleWithOverrideUserInterfaceStyle__blurSupported
    && !UIAccessibilityIsReduceMotionEnabled()
    && !UIAccessibilityIsReduceTransparencyEnabled();
  objc_msgSend(v4, "setBlurSupported:", v5);
  if (a3 == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);
  objc_msgSend(v4, "setSectionHeaderTextColor:", v6);
  objc_msgSend(v4, "setHighlightedTextColor:", v6);
  objc_msgSend(v4, "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTaglineTextColor:", v7);

  objc_msgSend(v4, "setNotesTextColor:", v6);
  objc_msgSend(v4, "setSuggestedLabelTextColor:", v6);
  objc_msgSend(v4, "setSuggestedValueTextColor:", v6);
  objc_msgSend(v4, "textColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setListTextColor:", v8);

  objc_msgSend(v4, "setUsesOpaqueBackground:", 0);
  objc_msgSend(v4, "setBackgroundColor:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchBarBackgroundColor:", v9);

  objc_msgSend(v4, "setContactHeaderBackgroundColor:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransportBackgroundColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransportBorderColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransportBoldBackgroundColor:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.95, 0.95, 0.97, 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactHeaderDropShadowColor:", v13);

  objc_msgSend(v4, "setTintColorOverride:", v6);
  objc_msgSend(v4, "setSectionBackgroundColor:", 0);
  if (objc_msgSend(v4, "blurSupported"))
    v14 = 3;
  else
    v14 = 0;
  objc_msgSend(v4, "setSeparatorBackdropOverlayBlendMode:", v14);
  objc_msgSend(v4, "setSeparatorStyle:", 1);
  if ((objc_msgSend(v4, "blurSupported") & 1) != 0)
    +[CNUIColorRepository faceTimeLightSeparatorColor](CNUIColorRepository, "faceTimeLightSeparatorColor");
  else
    +[CNUIColorRepository faceTimeSeparatorColorWithBlurUnsupported](CNUIColorRepository, "faceTimeSeparatorColorWithBlurUnsupported");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeparatorColor:", v15);

  if (darkStyleWithOverrideUserInterfaceStyle__blurSupported)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.25, 0.25, 0.25, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeaderBackgroundColor:", v16);

  objc_msgSend(v4, "setSelectedCellBackgroundColor:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupedBackgroundColor:", v17);

  objc_msgSend(v4, "setBarStyle:", 1);
  objc_msgSend(v4, "setUsesTranslucentBarStyle:", 1);
  objc_msgSend(v4, "setKeyboardAppearance:", 1);
  objc_msgSend(v4, "setShouldPresentInCurrentContext:", 1);
  objc_msgSend(v4, "setModalTransitionStyle:", 14);
  objc_msgSend(v4, "setTopActionsViewStyle:", 6);
  objc_msgSend(v4, "setInlineActionsViewStyle:", 3);

  return v4;
}

+ (id)watchStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(a1, "defaultStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSectionHeaderTextColor:", v4);

  objc_msgSend(v2, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTaglineTextColor:", v5);

  objc_msgSend(v2, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNotesTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighlightedTextColor:", v7);

  objc_msgSend(v2, "textColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setListTextColor:", v8);

  objc_msgSend(v2, "setUsesOpaqueBackground:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.09, 0.09, 0.09, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.11, 0.11, 0.11, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearchBarBackgroundColor:", v10);

  objc_msgSend(v2, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContactHeaderBackgroundColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.95, 0.95, 0.97, 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContactHeaderDropShadowColor:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.58, 0.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransportBoldBackgroundColor:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.176470588, 0.176470588, 0.176470588, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransportBackgroundColor:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.09, 0.09, 0.09, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSectionBackgroundColor:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.16, 0.16, 0.16, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSeparatorColor:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.09, 0.09, 0.09, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeaderBackgroundColor:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedCellBackgroundColor:", v18);

  objc_msgSend(v2, "setBarStyle:", 1);
  objc_msgSend(v2, "setUsesTranslucentBarStyle:", 0);
  objc_msgSend(v2, "setKeyboardAppearance:", 1);
  return v2;
}

+ (id)siriStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  +[CNContactStyle defaultStyle](CNContactStyle, "defaultStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "siriui_textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "siriui_textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSectionHeaderTextColor:", v4);

  objc_msgSend(v2, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTaglineTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "siriui_textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNotesTextColor:", v6);

  objc_msgSend(v2, "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setListTextColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContactHeaderBackgroundColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "siriui_keylineColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContactHeaderDropShadowColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "siriui_keylineColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSeparatorColor:", v11);

  objc_msgSend(v2, "setSeparatorInset:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "siriui_highlightColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedCellBackgroundColor:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSectionBackgroundColor:", v13);

  objc_msgSend(v2, "setModalTransitionStyle:", 14);
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkBlueColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColorOverride:", v14);

  return v2;
}

+ (id)testStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  +[CNContactStyle defaultStyle](CNContactStyle, "defaultStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSectionHeaderTextColor:", v4);

  objc_msgSend(v2, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTaglineTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "cyanColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisabledTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "brownColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlaceholderTextColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighlightedTextColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeaderBackgroundColor:", v9);

  objc_msgSend(v2, "textColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setListTextColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearchBarBackgroundColor:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransportBackgroundColor:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "brownColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransportBorderColor:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSeparatorColor:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSectionBackgroundColor:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "brownColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedCellBackgroundColor:", v17);

  objc_msgSend(v2, "setBarStyle:", 1);
  objc_msgSend(v2, "setKeyboardAppearance:", 1);
  return v2;
}

+ (void)setCurrentStyle:(id)a3
{
  id v4;
  id v5;

  objc_storeStrong((id *)&sCurrentStyle, a3);
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("CNContactStyleCurrentStyleDidChangeNotification"), 0);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __58__CNContactStyle_darkStyleWithOverrideUserInterfaceStyle___block_invoke()
{
  double v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:", 2030);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "blurRadius");
  darkStyleWithOverrideUserInterfaceStyle__blurSupported = v0 > 0.0;

}

@end
