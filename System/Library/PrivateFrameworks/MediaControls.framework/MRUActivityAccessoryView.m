@implementation MRUActivityAccessoryView

- (MRUActivityAccessoryView)initWithContentView:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  MRUActivityAccessoryView *v9;
  MRUActivityAccessoryView *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRUActivityAccessoryView;
  v9 = -[MRUActivityAccessoryView init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentView, a3);
    v10->_size.width = width;
    v10->_size.height = height;
    -[MRUActivityAccessoryView addSubview:](v10, "addSubview:", v8);
  }

  return v10;
}

- (void)layoutSubviews
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)MRUActivityAccessoryView;
  -[MRUActivityAccessoryView layoutSubviews](&v9, sel_layoutSubviews);
  -[MRUActivityAccessoryView bounds](self, "bounds");
  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  v10.origin.x = v5 + left;
  v10.origin.y = v6 + top;
  v10.size.width = v7 - (left + self->_contentInsets.right);
  v10.size.height = v8 - (top + self->_contentInsets.bottom);
  v11 = CGRectOffset(v10, self->_contentOffset.x, self->_contentOffset.y);
  -[UIView setFrame:](self->_contentView, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
  -[MRUActivityAccessoryView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
  -[MRUActivityAccessoryView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
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

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
