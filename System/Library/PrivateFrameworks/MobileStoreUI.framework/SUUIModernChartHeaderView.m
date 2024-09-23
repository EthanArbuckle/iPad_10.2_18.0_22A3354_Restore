@implementation SUUIModernChartHeaderView

- (SUUIModernChartHeaderView)initWithFrame:(CGRect)a3
{
  SUUIModernChartHeaderView *v3;
  UIView *v4;
  UIView *contentView;
  UILabel *v6;
  UILabel *label;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIModernChartHeaderView;
  v3 = -[SUUIModernChartHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    contentView = v3->_contentView;
    v3->_contentView = v4;

    -[SUUIModernChartHeaderView addSubview:](v3, "addSubview:", v3->_contentView);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    label = v3->_label;
    v3->_label = v6;

    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_label);
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v4 = (void *)MEMORY[0x24BEBB528];
  v5 = *MEMORY[0x24BEBE1E8];
  v6 = a3;
  objc_msgSend(v4, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v5, 2, 2);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v21, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", 1.3);
  v9 = objc_alloc(MEMORY[0x24BDBCE70]);
  v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v7, *MEMORY[0x24BEBB360], v8, *MEMORY[0x24BEBB378], 0);
  objc_msgSend(v6, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v11, v10);
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", v12);
  objc_msgSend(v7, "_scaledValueForValue:", 16.0);
  v14 = v13;
  -[UILabel _firstBaselineOffsetFromTop](self->_label, "_firstBaselineOffsetFromTop");
  v16 = v14 - v15;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v18 = v17;
  -[UILabel setFrame:](self->_label, "setFrame:", 0.0, v16, v17, v19);
  objc_msgSend(v7, "_scaledValueForValue:", 24.0);
  -[UIView setFrame:](self->_contentView, "setFrame:", 0.0, 0.0, v18, v20);
  -[SUUIModernChartHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  CGFloat v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v10.receiver = self;
  v10.super_class = (Class)SUUIModernChartHeaderView;
  -[SUUIModernChartHeaderView layoutSubviews](&v10, sel_layoutSubviews);
  -[SUUIModernChartHeaderView bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = CGRectGetWidth(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectGetHeight(v12);
  -[UIView frame](self->_contentView, "frame");
  v9 = CGRectGetHeight(v13);
  -[UIView setFrame:](self->_contentView, "setFrame:", 0.0, floor((v8 - v9) * 0.5), v7, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
