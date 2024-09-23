@implementation MPAVRoutingTableViewHeaderView

- (MPAVRoutingTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  MPAVRoutingTableViewHeaderView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPAVRoutingTableViewHeaderView;
  v3 = -[MPAVRoutingTableViewHeaderView initWithReuseIdentifier:](&v8, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingTableViewHeaderView textLabel](v3, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingTableViewHeaderView setTintColor:](v3, "setTintColor:", v6);

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingTableViewHeaderView;
  -[MPAVRoutingTableViewHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[MPAVRoutingTableViewHeaderView _updateFont](self, "_updateFont");
}

- (void)_updateFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC37E8], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC48F8]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableViewHeaderView textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

}

- (UIEdgeInsets)titleInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_titleInsets.top;
  left = self->_titleInsets.left;
  bottom = self->_titleInsets.bottom;
  right = self->_titleInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTitleInsets:(UIEdgeInsets)a3
{
  self->_titleInsets = a3;
}

@end
