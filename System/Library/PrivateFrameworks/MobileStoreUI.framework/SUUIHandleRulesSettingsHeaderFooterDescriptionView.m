@implementation SUUIHandleRulesSettingsHeaderFooterDescriptionView

+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

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

+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE230]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scaledValueForValue:", 22.0);
  v10 = v9;
  objc_msgSend(a1, "_labelWithDescription:forWidth:", v7, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_firstLineBaselineFrameOriginY");
  v13 = v10 - v12;
  objc_msgSend(v11, "_lastLineBaselineFrameOriginY");
  v15 = v13 + v14;

  v16 = a3;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  SUUIHandleRulesSettingsHeaderFooterDescription **p_description;
  UILabel *v9;
  UILabel *label;
  id v11;

  p_description = &self->_description;
  objc_storeStrong((id *)&self->_description, a3);
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "_labelWithDescription:forWidth:", *p_description, a4);
  v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
  label = self->_label;
  self->_label = v9;

  -[SUUIHandleRulesSettingsHeaderFooterDescriptionView addSubview:](self, "addSubview:", self->_label);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)SUUIHandleRulesSettingsHeaderFooterDescriptionView;
  -[SUUIHandleRulesSettingsHeaderFooterDescriptionView layoutSubviews](&v23, sel_layoutSubviews);
  -[SUUIHandleRulesSettingsHeaderFooterDescriptionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUIHandleRulesSettingsHeaderFooterDescriptionView layoutMargins](self, "layoutMargins");
  v12 = v11;
  v14 = v13;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v15 = CGRectGetWidth(v24) - v12 - v14;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE230]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_scaledValueForValue:", 22.0);
  v18 = v17;
  -[UILabel _firstBaselineOffsetFromTop](self->_label, "_firstBaselineOffsetFromTop");
  v20 = v18 - v19;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v15, 1.0);
  -[UILabel setFrame:](self->_label, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v12, v20, v15, v21, v4, v6, v8, v10));
  if (storeShouldReverseLayoutDirection())
    v22 = 2;
  else
    v22 = 0;
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", v22);

}

+ (id)_labelWithDescription:(id)a3 forWidth:(double)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  double v12;

  v5 = (objc_class *)MEMORY[0x24BEBD708];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);
  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE230]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v9);
  v10 = objc_msgSend(v6, "showInvalid");

  if ((v10 & 1) != 0)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v11);
  objc_msgSend(v7, "sizeThatFits:", a4, 1.0);
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, a4, v12);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
