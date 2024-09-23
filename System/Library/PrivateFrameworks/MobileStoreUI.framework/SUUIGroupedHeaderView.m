@implementation SUUIGroupedHeaderView

- (SUUIGroupedHeaderView)initWithFrame:(CGRect)a3
{
  SUUIGroupedHeaderView *v3;
  void *v4;
  UILabel *v5;
  UILabel *titleLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UIView *v11;
  UIView *topBorder;
  UIView *v13;
  void *v14;
  UIView *v15;
  UIView *botBorder;
  UIView *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SUUIGroupedHeaderView;
  v3 = -[SUUIGroupedHeaderView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.94, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGroupedHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v5;

    v7 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.43, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[SUUIGroupedHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v11 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    topBorder = v3->_topBorder;
    v3->_topBorder = v11;

    v13 = v3->_topBorder;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.85, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[SUUIGroupedHeaderView addSubview:](v3, "addSubview:", v3->_topBorder);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    botBorder = v3->_botBorder;
    v3->_botBorder = v15;

    v17 = v3->_botBorder;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.85, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[SUUIGroupedHeaderView addSubview:](v3, "addSubview:", v3->_botBorder);
  }
  return v3;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (BOOL)hasTopBorder
{
  return -[UIView isHidden](self->_topBorder, "isHidden");
}

- (void)setHasTopBorder:(BOOL)a3
{
  -[UIView setHidden:](self->_topBorder, "setHidden:", !a3);
}

- (BOOL)hasBottomBorder
{
  return -[UIView isHidden](self->_botBorder, "isHidden");
}

- (void)setHasBottomBorder:(BOOL)a3
{
  -[UIView setHidden:](self->_botBorder, "setHidden:", !a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel text](self->_titleLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v7 = 35.0;
  if (v6)
    v7 = width;
  v8 = 56.0;
  if (!v6)
    v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat MaxY;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)SUUIGroupedHeaderView;
  -[SUUIGroupedHeaderView layoutSubviews](&v21, sel_layoutSubviews);
  -[SUUIGroupedHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UILabel frame](self->_titleLabel, "frame");
  v12 = v11;
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  MaxY = CGRectGetMaxY(v22);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v4 + 15.0, MaxY - v12 + -5.0, v8 + 30.0, v12, v4, v6, v8, v10));
  if (storeShouldReverseLayoutDirection())
    v14 = 2;
  else
    v14 = 0;
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v14);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;

  -[UIView setFrame:](self->_topBorder, "setFrame:", v4, v6, v8, v17);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = 1.0 / v19;

  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  -[UIView setFrame:](self->_botBorder, "setFrame:", v4, CGRectGetMaxY(v23) - v20, v8, v20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_botBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
