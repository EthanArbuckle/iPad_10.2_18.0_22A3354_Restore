@implementation SUUIProductPagePlaceholderScrollView

- (void)setPlaceholderView:(id)a3
{
  UIView *v5;
  UIView *placeholderView;
  UIView *v7;

  v5 = (UIView *)a3;
  placeholderView = self->_placeholderView;
  if (placeholderView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](placeholderView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_placeholderView, a3);
    if (self->_placeholderView)
      -[SUUIProductPagePlaceholderScrollView addSubview:](self, "addSubview:");
    -[SUUIProductPagePlaceholderScrollView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UIView *placeholderView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double offset;
  float v15;
  objc_super v16;

  -[SUUIProductPagePlaceholderScrollView bounds](self, "bounds");
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    v6 = v3;
    v7 = v4;
    -[UIView sizeToFit](placeholderView, "sizeToFit");
    if (!self->_isPad)
    {
      -[SUUIProductPagePlaceholderScrollView contentInset](self, "contentInset");
      v9 = v7 - v8;
      -[SUUIProductPagePlaceholderScrollView contentInset](self, "contentInset");
      v7 = v9 - v10;
    }
    -[UIView frame](self->_placeholderView, "frame");
    v13 = (v7 - v12) * 0.5;
    offset = roundf(v13);
    if (self->_offset != 0.0)
      offset = self->_offset;
    v15 = (v6 - v11) * 0.5;
    -[UIView setFrame:](self->_placeholderView, "setFrame:", roundf(v15), offset);
  }
  v16.receiver = self;
  v16.super_class = (Class)SUUIProductPagePlaceholderScrollView;
  -[SUUIProductPagePlaceholderScrollView layoutSubviews](&v16, sel_layoutSubviews);
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (void)setIsPad:(BOOL)a3
{
  self->_isPad = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end
