@implementation SUUITextHeaderSettingsHeaderFooterDescriptionView

+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  objc_msgSend(a4, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_labelElementsFromViewElement:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_labelWithLabelElements:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);
  objc_msgSend(v9, "sizeThatFits:", a3, 1.0);
  v12 = v11;
  v14 = v13;
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v11, v13);
  objc_msgSend(v10, "_scaledValueForValue:", 8.0);
  v16 = v15;
  objc_msgSend(v9, "_lastLineBaselineFrameOriginY");
  v18 = v14 + v16 - (v14 - v17);

  v19 = v12;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  SUUIViewElement *v6;
  SUUIViewElement *viewElement;
  UILabel *label;
  UILabel *v9;
  UILabel *v10;
  UILabel *v11;
  id v12;

  objc_msgSend(a3, "viewElement", a4);
  v6 = (SUUIViewElement *)objc_claimAutoreleasedReturnValue();
  viewElement = self->_viewElement;
  self->_viewElement = v6;

  objc_msgSend((id)objc_opt_class(), "_labelElementsFromViewElement:", self->_viewElement);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  label = self->_label;
  if (label)
  {
    -[UILabel removeFromSuperview](label, "removeFromSuperview");
    v9 = self->_label;
    self->_label = 0;

  }
  objc_msgSend((id)objc_opt_class(), "_labelWithLabelElements:", v12);
  v10 = (UILabel *)objc_claimAutoreleasedReturnValue();
  v11 = self->_label;
  self->_label = v10;

  -[SUUITextHeaderSettingsHeaderFooterDescriptionView addSubview:](self, "addSubview:", self->_label);
  -[SUUITextHeaderSettingsHeaderFooterDescriptionView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat Height;
  uint64_t v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v25.receiver = self;
  v25.super_class = (Class)SUUITextHeaderSettingsHeaderFooterDescriptionView;
  -[SUUITextHeaderSettingsHeaderFooterDescriptionView layoutSubviews](&v25, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v3);
  -[SUUITextHeaderSettingsHeaderFooterDescriptionView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SUUITextHeaderSettingsHeaderFooterDescriptionView layoutMargins](self, "layoutMargins");
  v13 = v12;
  v15 = v14;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v16 = CGRectGetWidth(v26) - v13 - v15;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v16, 1.0);
  v18 = v17;
  objc_msgSend(v3, "_scaledValueForValue:", 8.0);
  v20 = v19;
  -[UILabel _baselineOffsetFromBottom](self->_label, "_baselineOffsetFromBottom");
  v22 = v20 - v21;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  Height = CGRectGetHeight(v27);
  -[UILabel setFrame:](self->_label, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v13, Height - v22 - v18, v16, v18, v5, v7, v9, v11));
  if (storeShouldReverseLayoutDirection())
    v24 = 2;
  else
    v24 = 0;
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", v24);

}

+ (id)_concatenateTextFromLabelElements:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "text", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_labelElementsFromViewElement:(id)a3
{
  return (id)objc_msgSend(a3, "titleLabels");
}

+ (id)_labelWithLabelElements:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BEBD708];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

  objc_msgSend(a1, "_concatenateTextFromLabelElements:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setText:", v8);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
