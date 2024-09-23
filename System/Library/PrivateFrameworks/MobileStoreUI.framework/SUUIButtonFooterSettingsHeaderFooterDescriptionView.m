@implementation SUUIButtonFooterSettingsHeaderFooterDescriptionView

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
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  objc_msgSend(a4, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstChildForElementType:", 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_buttonWithButtonElement:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);
  objc_msgSend(v10, "sizeThatFits:", a3, 1.0);
  v13 = v12;
  v15 = v14;
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v12, v14);
  objc_msgSend(v11, "_scaledValueForValue:", 20.0);
  v17 = v16;
  objc_msgSend(v10, "_firstLineBaselineFrameOriginY");
  v19 = v15 + v17 - v18;

  v20 = v13;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  SUUIViewElement *v8;
  SUUIViewElement *viewElement;
  SUUIButtonViewElement *v10;
  SUUIButtonViewElement *buttonElement;
  UIButton *button;
  UIButton *v13;
  UIButton *v14;
  UIButton *v15;
  void *v16;
  void *v17;
  void *v18;
  UIButton *v19;
  void *v20;
  id v21;

  v7 = a5;
  objc_msgSend(a3, "viewElement");
  v8 = (SUUIViewElement *)objc_claimAutoreleasedReturnValue();
  viewElement = self->_viewElement;
  self->_viewElement = v8;

  -[SUUIViewElement firstChildForElementType:](self->_viewElement, "firstChildForElementType:", 12);
  v10 = (SUUIButtonViewElement *)objc_claimAutoreleasedReturnValue();
  buttonElement = self->_buttonElement;
  self->_buttonElement = v10;

  button = self->_button;
  if (button)
  {
    -[UIButton removeFromSuperview](button, "removeFromSuperview");
    v13 = self->_button;
    self->_button = 0;

  }
  objc_msgSend((id)objc_opt_class(), "_buttonWithButtonElement:", self->_buttonElement);
  v14 = (UIButton *)objc_claimAutoreleasedReturnValue();
  v15 = self->_button;
  self->_button = v14;

  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
  -[SUUIButtonViewElement style](self->_buttonElement, "style");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ikColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  SUUIViewElementPlainColorWithIKColor(v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", v18, 0);
  v19 = self->_button;
  objc_msgSend(v18, "colorWithAlphaComponent:", 0.2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v19, "setTitleColor:forState:", v20, 1);

  -[SUUIButtonFooterSettingsHeaderFooterDescriptionView addSubview:](self, "addSubview:", self->_button);
  -[SUUIButtonFooterSettingsHeaderFooterDescriptionView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)SUUIButtonFooterSettingsHeaderFooterDescriptionView;
  -[SUUIButtonFooterSettingsHeaderFooterDescriptionView layoutSubviews](&v23, sel_layoutSubviews);
  -[UIButton titleLabel](self->_button, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);
  -[SUUIButtonFooterSettingsHeaderFooterDescriptionView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SUUIButtonFooterSettingsHeaderFooterDescriptionView layoutMargins](self, "layoutMargins");
  v14 = v13;
  v16 = v15;
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  v17 = CGRectGetWidth(v24) - v14 - v16;
  objc_msgSend(v3, "sizeThatFits:", v17, 1.0);
  v19 = v18;
  objc_msgSend(v4, "_scaledValueForValue:", 20.0);
  v21 = v20;
  objc_msgSend(v3, "_firstBaselineOffsetFromTop");
  -[UIButton setFrame:](self->_button, "setFrame:", v14, v21 - v22, v17, v19);

}

- (void)_buttonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("headerFooterButton"), CFSTR("identifier"), 0);
  -[SUUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_buttonElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, v4, 0);

}

+ (id)_buttonWithButtonElement:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BEBD430];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "buttonText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTitle:forState:", v7, 0);
  objc_msgSend(v5, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleColor:forState:", v8, 0);

  return v5;
}

- (void)_reloadWithButtonElement:(id)a3 context:(id)a4
{
  id v7;
  UIButton *button;
  UIButton *v9;
  UIButton *v10;
  UIButton *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIButton *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_storeStrong((id *)&self->_buttonElement, a3);
  v7 = a4;
  button = self->_button;
  if (button)
  {
    -[UIButton removeFromSuperview](button, "removeFromSuperview");
    v9 = self->_button;
    self->_button = 0;

  }
  objc_msgSend((id)objc_opt_class(), "_buttonWithButtonElement:", v18);
  v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
  v11 = self->_button;
  self->_button = v10;

  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
  objc_msgSend(v18, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ikColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  SUUIViewElementPlainColorWithIKColor(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", v15, 0);
  v16 = self->_button;
  objc_msgSend(v15, "colorWithAlphaComponent:", 0.2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v16, "setTitleColor:forState:", v17, 1);

  -[SUUIButtonFooterSettingsHeaderFooterDescriptionView addSubview:](self, "addSubview:", self->_button);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_buttonElement, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
