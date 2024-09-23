@implementation MRURoutingHeaderView

- (MRURoutingHeaderView)initWithReuseIdentifier:(id)a3
{
  MRURoutingHeaderView *v3;
  void *v4;
  UILabel *v5;
  UILabel *titleLabel;
  void *v7;
  UIView *v8;
  UIView *separatorView;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MRURoutingHeaderView;
  v3 = -[MRURoutingHeaderView initWithReuseIdentifier:](&v14, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURoutingHeaderView setTintColor:](v3, "setTintColor:", v4);

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v5;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 2);
    -[MRURoutingHeaderView contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_titleLabel);

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_separatorView, "setBackgroundColor:", v10);

    -[MRURoutingHeaderView contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v3->_separatorView);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRURoutingHeaderView updateContentSizeCategory](v3, "updateContentSizeCategory");
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double top;
  double left;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v24.receiver = self;
  v24.super_class = (Class)MRURoutingHeaderView;
  -[MRURoutingHeaderView layoutSubviews](&v24, sel_layoutSubviews);
  -[MRURoutingHeaderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  v7 = v6 + left;
  v9 = v8 + top;
  v11 = v10 - (left + self->_contentEdgeInsets.right);
  v13 = v12 - (top + self->_contentEdgeInsets.bottom);

  -[MRURoutingHeaderView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");

  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  CGRectGetMinX(v25);
  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  CGRectGetMaxY(v26);
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  CGRectGetWidth(v27);
  -[MRURoutingHeaderView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_separatorView, "setFrame:");
  UIRectInset();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[UILabel font](self->_titleLabel, "font");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "descender");
  UIRoundToViewScale();

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v20, v22);
  MRUSizeCeilToViewScale(self);
  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  CGRectGetMinX(v28);
  v29.origin.x = v16;
  v29.origin.y = v18;
  v29.size.width = v20;
  v29.size.height = v22;
  CGRectGetMaxY(v29);
  v30.origin.x = v16;
  v30.origin.y = v18;
  v30.size.width = v20;
  v30.size.height = v22;
  CGRectGetWidth(v30);
  -[MRURoutingHeaderView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  v5 = 16.0 * 2.0 + 10.0 + 1.0;
  v6 = a3.width - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right);
  v7 = a3.height - v5;
  -[UILabel font](self->_titleLabel, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descender");
  UIRoundToViewScale();
  v10 = v9;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, v7);
  MRUSizeCeilToViewScale(self);
  v12 = v5 + v10 + v11;
  v13 = width;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[MRURoutingHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets.top = 0.0;
  self->_contentEdgeInsets.left = a3.left;
  self->_contentEdgeInsets.bottom = 0.0;
  self->_contentEdgeInsets.right = a3.right;
  -[MRURoutingHeaderView setNeedsLayout](self, "setNeedsLayout", a3.top);
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRURoutingHeaderView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 1, self->_titleLabel);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 4, self->_separatorView);
}

- (void)updateContentSizeCategory
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_routingHeaderFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

}

- (NSString)title
{
  return self->_title;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
