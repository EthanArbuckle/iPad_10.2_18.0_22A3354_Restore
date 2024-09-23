@implementation SUUIProductPageTableHeaderView

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[SUUIProductPageTableHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SUUIProductPageTableHeaderView title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != v15 && (objc_msgSend(v4, "isEqualToString:", v15) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v8 = self->_titleLabel;
        self->_titleLabel = v7;

        v9 = self->_titleLabel;
        -[SUUIProductPageTableHeaderView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

        v11 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v12);

        v13 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v13, "setTextColor:", v14);

        -[SUUIProductPageTableHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setHidden:](titleLabel, "setHidden:", 0);
      -[UILabel setText:](self->_titleLabel, "setText:", v15);
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
      -[SUUIProductPageTableHeaderView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UILabel setHidden:](titleLabel, "setHidden:", 1);
    }
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;

  -[SUUIProductPageTableHeaderView bounds](self, "bounds");
  v4 = v3;
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", self->_contentInsets.left, self->_contentInsets.top, v4 - self->_contentInsets.right - self->_contentInsets.left);
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *titleLabel;
  id v5;
  objc_super v6;

  titleLabel = self->_titleLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](titleLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIProductPageTableHeaderView;
  -[SUUIProductPageTableHeaderView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[UILabel frame](self->_titleLabel, "frame", a3.width, a3.height);
  v5 = v4 + self->_contentInsets.bottom + self->_contentInsets.top;
  v7 = v6 + self->_contentInsets.left + self->_contentInsets.right;
  result.height = v5;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
