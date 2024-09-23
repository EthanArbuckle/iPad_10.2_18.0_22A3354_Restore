@implementation FCUIAddActivityFooterView

- (FCUIAddActivityFooterView)initWithAction:(id)a3
{
  id v4;
  FCUIAddActivityFooterView *v5;
  FCUIAddActivityFooterView *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCUIAddActivityFooterView;
  v5 = -[FCUIAddActivityFooterView init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_adjustsFontForContentSizeCategory = 1;
    -[FCUIAddActivityFooterView _configureAddActivityControlIfNecessaryWithAction:](v5, "_configureAddActivityControlIfNecessaryWithAction:", v4);
    objc_msgSend(v4, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIAddActivityFooterView _configureActivityTitleLabelIfNecessaryWithTitle:](v6, "_configureActivityTitleLabelIfNecessaryWithTitle:", v7);

  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  __int128 v6;
  CGSize result;

  -[FCUIAddActivityFooterView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  v6 = *MEMORY[0x24BDBF148];
  BSRectWithSize();
  -[FCUIAddActivityFooterView _layoutSubviewsInBounds:measuringOnly:](self, "_layoutSubviewsInBounds:measuringOnly:", &v6);
  v5 = *((double *)&v6 + 1);
  v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCUIAddActivityFooterView;
  -[FCUIAddActivityFooterView layoutSubviews](&v3, sel_layoutSubviews);
  -[FCUIAddActivityFooterView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[FCUIAddActivityFooterView bounds](self, "bounds");
  -[FCUIAddActivityFooterView _layoutSubviewsInBounds:measuringOnly:](self, "_layoutSubviewsInBounds:measuringOnly:", 0);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[FCUIAddActivityFooterView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
    -[_FCUIAddActivityControl setAdjustsFontForContentSizeCategory:](self->_addActivityControl, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[FCUIAddActivityFooterView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
  {
    -[FCUIAddActivityFooterView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
    -[_FCUIAddActivityControl adjustForContentSizeCategoryChange](self->_addActivityControl, "adjustForContentSizeCategoryChange");
  }
  return v3;
}

- (void)_layoutSubviewsInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  -[_FCUIAddActivityControl sizeThatFits:](self->_addActivityControl, "sizeThatFits:", a3.size.width, a3.size.height);
  BSRectWithSize();
  v24 = 0;
  UIRectCenteredXInRectScale();
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  if (!a4)
    -[_FCUIAddActivityControl setFrame:](self->_addActivityControl, "setFrame:", v8, v9, v10, v11, 0);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height, v24);
  v25.origin.x = v12;
  v25.origin.y = v13;
  v25.size.width = v14;
  v25.size.height = v15;
  CGRectGetMaxY(v25);
  UIRectCenteredXInRectScale();
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  if (a4)
  {
    v26.origin.x = v12;
    v26.origin.y = v13;
    v26.size.width = v14;
    v26.size.height = v15;
    v27 = CGRectUnion(v26, *(CGRect *)&v20);
    a4->width = v27.size.width;
    a4->height = v27.size.height;
  }
  else
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v16, v17, v18, v19);
  }
}

- (void)_configureAddActivityControlIfNecessaryWithAction:(id)a3
{
  id v4;
  _FCUIAddActivityControl *v5;
  _FCUIAddActivityControl *addActivityControl;

  if (!self->_addActivityControl)
  {
    v4 = a3;
    v5 = -[_FCUIAddActivityControl initWithAction:]([_FCUIAddActivityControl alloc], "initWithAction:", v4);

    addActivityControl = self->_addActivityControl;
    self->_addActivityControl = v5;

    -[FCUIAddActivityFooterView addSubview:](self, "addSubview:", self->_addActivityControl);
  }
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", a4);
  else
    objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BEBB590];
  v13 = *MEMORY[0x24BEBB620];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_updateTextAttributesForTitleLabel
{
  UILabel *titleLabel;
  void *v4;

  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:", 1, *MEMORY[0x24BEBE1E0], *MEMORY[0x24BEBB608]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](titleLabel, "setFont:", v4);

    -[FCUIAddActivityFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  NSString *preferredContentSizeCategory;

  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = 0;

  -[FCUIAddActivityFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextAttributes
{
  void *v3;
  NSString *v4;
  NSString *preferredContentSizeCategory;

  -[FCUIAddActivityFooterView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  -[FCUIAddActivityFooterView _updateTextAttributesForTitleLabel](self, "_updateTextAttributesForTitleLabel");
}

- (void)_updateTextAttributesIfNecessary
{
  if (-[FCUIAddActivityFooterView _needsTextAttributesUpdate](self, "_needsTextAttributesUpdate"))
    -[FCUIAddActivityFooterView _updateTextAttributes](self, "_updateTextAttributes");
}

- (void)_configureActivityTitleLabelIfNecessaryWithTitle:(id)a3
{
  objc_class *v4;
  id v5;
  UILabel *v6;
  UILabel *titleLabel;
  id v8;
  double v9;
  void *v10;
  id v11;

  if (!self->_titleLabel)
  {
    v4 = (objc_class *)MEMORY[0x24BEBD708];
    v5 = a3;
    v6 = (UILabel *)objc_alloc_init(v4);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v6;

    -[UILabel setText:](self->_titleLabel, "setText:", v5);
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel layer](self->_titleLabel, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "setShadowColor:", objc_msgSend(v8, "CGColor"));

    LODWORD(v9) = 1045220557;
    objc_msgSend(v11, "setShadowOpacity:", v9);
    objc_msgSend(v11, "setShadowRadius:", 20.0);
    objc_msgSend(v11, "setShadowOffset:", 0.0, 2.0);
    objc_msgSend(v11, "setShadowPathIsBounds:", 1);
    -[FCUIAddActivityFooterView addSubview:](self, "addSubview:", self->_titleLabel);
    -[FCUIAddActivityFooterView _updateTextAttributesForTitleLabel](self, "_updateTextAttributesForTitleLabel");
    -[_FCUIAddActivityControl visualStylingProviderForCategory:](self->_addActivityControl, "visualStylingProviderForCategory:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "automaticallyUpdateView:withStyle:", self->_titleLabel, 0);

  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_addActivityControl, 0);
}

@end
