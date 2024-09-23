@implementation SUUISuggestedHandlesSettingsHeaderFooterDescriptionView

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
  unint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v7 = a4;
  objc_msgSend(v7, "suggestedHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = *MEMORY[0x24BEBE230];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE230]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_scaledValueForValue:", 30.0);
  v13 = v12;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_scaledValueForValue:", 22.0);
  v16 = v15;
  objc_msgSend(a1, "_helpLabelWithDescription:forWidth:", v7, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "_firstLineBaselineFrameOriginY");
  v19 = v16 - v18;
  objc_msgSend(v17, "_lastLineBaselineFrameOriginY");
  v21 = v19 + v20 + v13 * (double)v9;

  v22 = a3;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  SUUISuggestedHandlesSettingsHeaderFooterDescription **p_description;
  id v9;
  UILabel *v10;
  UILabel *label;
  NSMutableArray *v12;
  NSMutableArray *buttons;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  SUUISuggestedHandlesSettingsHeaderFooterDescriptionView *v19;

  p_description = &self->_description;
  objc_storeStrong((id *)&self->_description, a3);
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_helpLabelWithDescription:forWidth:", *p_description, a4);
  v10 = (UILabel *)objc_claimAutoreleasedReturnValue();
  label = self->_label;
  self->_label = v10;

  -[SUUISuggestedHandlesSettingsHeaderFooterDescriptionView addSubview:](self, "addSubview:", self->_label);
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  buttons = self->_buttons;
  self->_buttons = v12;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE230]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISuggestedHandlesSettingsHeaderFooterDescription suggestedHandles](*p_description, "suggestedHandles");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __115__SUUISuggestedHandlesSettingsHeaderFooterDescriptionView_reloadWithSettingsHeaderFooterDescription_width_context___block_invoke;
  v17[3] = &unk_2511FA950;
  v18 = v14;
  v19 = self;
  v15 = v14;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);

}

void __115__SUUISuggestedHandlesSettingsHeaderFooterDescriptionView_reloadWithSettingsHeaderFooterDescription_width_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x24BEBD430];
  v6 = a2;
  objc_msgSend(v5, "buttonWithType:", 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setTitle:forState:", v7, 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitleColor:forState:", v8, 0);

  objc_msgSend(v11, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v11, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 0);

  objc_msgSend(v11, "setTag:", a3);
  objc_msgSend(v11, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel__buttonAction_, 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "addObject:", v11);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v11);

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
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  NSMutableArray *buttons;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[14];
  _QWORD v32[3];
  uint64_t v33;
  objc_super v34;
  CGRect v35;

  v34.receiver = self;
  v34.super_class = (Class)SUUISuggestedHandlesSettingsHeaderFooterDescriptionView;
  -[SUUISuggestedHandlesSettingsHeaderFooterDescriptionView layoutSubviews](&v34, sel_layoutSubviews);
  -[SUUISuggestedHandlesSettingsHeaderFooterDescriptionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUISuggestedHandlesSettingsHeaderFooterDescriptionView layoutMargins](self, "layoutMargins");
  v29 = v12;
  v30 = v11;
  v14 = v13;
  v16 = v15;
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  v17 = CGRectGetWidth(v35) - v14 - v16;
  v18 = *MEMORY[0x24BEBE230];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE230]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_scaledValueForValue:", 22.0);
  v21 = v20;
  -[UILabel _firstBaselineOffsetFromTop](self->_label, "_firstBaselineOffsetFromTop");
  v23 = v21 - v22;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v17, 1.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v14, v23, v17, v24);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  -[UILabel _lastLineBaselineFrameOriginY](self->_label, "_lastLineBaselineFrameOriginY");
  v33 = v26;
  objc_msgSend(v25, "_scaledValueForValue:", 30.0);
  buttons = self->_buttons;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __73__SUUISuggestedHandlesSettingsHeaderFooterDescriptionView_layoutSubviews__block_invoke;
  v31[3] = &unk_2511FB5F0;
  v31[4] = v32;
  v31[5] = v28;
  *(CGFloat *)&v31[6] = v4;
  *(CGFloat *)&v31[7] = v6;
  *(CGFloat *)&v31[8] = v8;
  *(CGFloat *)&v31[9] = v10;
  v31[10] = v30;
  *(double *)&v31[11] = v14;
  v31[12] = v29;
  *(double *)&v31[13] = v16;
  -[NSMutableArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v31);
  _Block_object_dispose(v32, 8);

}

void __73__SUUISuggestedHandlesSettingsHeaderFooterDescriptionView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(a1 + 40)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  v3 = a2;
  objc_msgSend(v3, "titleLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_firstBaselineOffsetFromTop");
  v5 = v4;
  objc_msgSend(v3, "sizeThatFits:", CGRectGetWidth(*(CGRect *)(a1 + 48)), 1.0);
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 88), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) - v5, v6, v7);

}

- (void)_buttonAction:(id)a3
{
  -[SUUISuggestedHandlesSettingsHeaderFooterDescription selectedHandleAtIndex:](self->_description, "selectedHandleAtIndex:", objc_msgSend(a3, "tag"));
}

+ (id)_helpLabelWithDescription:(id)a3 forWidth:(double)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  v5 = (objc_class *)MEMORY[0x24BEBD708];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "helpText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setText:", v8);
  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE230]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v9);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v10);

  objc_msgSend(v7, "sizeThatFits:", a4, 1.0);
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, a4, v11);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
