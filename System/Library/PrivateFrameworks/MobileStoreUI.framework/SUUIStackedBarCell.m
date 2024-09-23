@implementation SUUIStackedBarCell

- (SUUIStackedBarCell)initWithFrame:(CGRect)a3
{
  SUUIStackedBarCell *v3;
  UIView *v4;
  UIView *separator;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIButton *backButton;
  UILabel *v13;
  UILabel *expandedLabel;
  UILabel *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SUUIStackedBarCell;
  v3 = -[SUUIStackedBarCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separator = v3->_separator;
    v3->_separator = v4;

    v6 = v3->_separator;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SUUIStackedBarCell addSubview:](v3, "addSubview:", v3->_separator);
    v8 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:", CFSTR("AppStoreBrowseCategoryBackChevron"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v11 = objc_claimAutoreleasedReturnValue();
    backButton = v3->_backButton;
    v3->_backButton = (UIButton *)v11;

    -[UIButton setImage:forState:](v3->_backButton, "setImage:forState:", v10, 0);
    -[UIButton setTag:](v3->_backButton, "setTag:", 1398030659);
    -[SUUIStackedBarCell addSubview:](v3, "addSubview:", v3->_backButton);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    expandedLabel = v3->_expandedLabel;
    v3->_expandedLabel = v13;

    v15 = v3->_expandedLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    -[SUUIStackedBarCell addSubview:](v3, "addSubview:", v3->_expandedLabel);
    -[SUUIStackedBarCell tintColor](v3, "tintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStackedBarCell setTitleColor:forState:](v3, "setTitleColor:forState:", v17, 0);

    -[SUUIStackedBarCell titleLabel](v3, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v19);

    -[SUUIStackedBarCell titleLabel](v3, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextAlignment:", 1);

  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (!self->_expanded)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8824, 0.82);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0.25;
    if (!a3)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = 0.47;
      v5 = (void *)v7;
    }
    v8 = (void *)MEMORY[0x24BEBDB00];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __37__SUUIStackedBarCell_setHighlighted___block_invoke;
    v10[3] = &unk_2511F46D0;
    v10[4] = self;
    v11 = v5;
    v9 = v5;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v10, 0, v6);

  }
}

uint64_t __37__SUUIStackedBarCell_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)setExpanded:(BOOL)a3
{
  UILabel *expandedLabel;
  double v5;
  void *v6;
  void *v7;
  double v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  self->_expanded = a3;
  expandedLabel = self->_expandedLabel;
  if (a3)
  {
    v5 = 1.0;
    CGAffineTransformMakeScale(&v10, 1.0, 1.0);
    -[UILabel setTransform:](expandedLabel, "setTransform:", &v10);
    -[UILabel setAlpha:](self->_expandedLabel, "setAlpha:", 1.0);
    -[SUUIStackedBarCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.705882353, 0.705882353);
    -[UILabel setTransform:](expandedLabel, "setTransform:", &v9);
    v5 = 0.0;
    -[UILabel setAlpha:](self->_expandedLabel, "setAlpha:", 0.0);
    -[SUUIStackedBarCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1.0;
  }
  objc_msgSend(v6, "setAlpha:", v8);

  -[UIButton setAlpha:](self->_backButton, "setAlpha:", v5);
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIStackedBarCell;
  v6 = a3;
  -[SUUIStackedBarCell setTitle:forState:](&v7, sel_setTitle_forState_, v6, a4);
  -[UILabel setText:](self->_expandedLabel, "setText:", v6, v7.receiver, v7.super_class);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 44.0;
  if (!self->_expanded)
    v3 = 25.0;
  result.height = v3;
  return result;
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
  CGFloat v11;
  CGFloat Width;
  void *v13;
  double v14;
  CGFloat v15;
  double Height;
  CGFloat v17;
  UILabel *expandedLabel;
  void *v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20.receiver = self;
  v20.super_class = (Class)SUUIStackedBarCell;
  -[SUUIStackedBarCell layoutSubviews](&v20, sel_layoutSubviews);
  -[SUUIStackedBarCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[SUUIStackedBarCell bounds](self, "bounds");
  Width = CGRectGetWidth(v21);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = 1.0 / v14;

  -[SUUIStackedBarCell bounds](self, "bounds");
  Height = CGRectGetHeight(v22);
  v23.origin.x = 0.0;
  v23.origin.y = v11;
  v23.size.width = Width;
  v23.size.height = v15;
  v17 = CGRectGetHeight(v23);
  -[UIView setFrame:](self->_separator, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(0.0, Height - v17, Width, v15, v4, v6, v8, v10));
  -[UIButton setFrame:](self->_backButton, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(0.0, 0.0, 47.0, 42.0, v4, v6, v8, v10));
  -[UILabel sizeToFit](self->_expandedLabel, "sizeToFit");
  expandedLabel = self->_expandedLabel;
  -[SUUIStackedBarCell titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "center");
  -[UILabel setCenter:](expandedLabel, "setCenter:");

}

- (BOOL)expanded
{
  return self->_expanded;
}

- (UIButton)backButton
{
  return self->_backButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_expandedLabel, 0);
}

@end
