@implementation _SFURLLabelAccessoryItem

- (UIView)viewForLayout
{
  void *effectView;

  effectView = self->_effectView;
  if (!effectView)
    effectView = self->_view;
  return (UIView *)effectView;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIImageView *v8;
  UIImageView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_SFURLLabelAccessoryItem viewForLayout](self, "viewForLayout");
  v9 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setFrame:](v9, "setFrame:", x, y, width, height);
  v8 = v9;
  if (self->_view != v9)
  {
    -[UIImageView bounds](v9, "bounds");
    -[UIImageView setFrame:](self->_view, "setFrame:");
    v8 = v9;
  }

}

- (CGRect)frame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[_SFURLLabelAccessoryItem viewForLayout](self, "viewForLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIImageView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (UIImageView)squishedView
{
  return self->_squishedView;
}

- (void)setSquishedView:(id)a3
{
  objc_storeStrong((id *)&self->_squishedView, a3);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (UIVisualEffectView)squishedEffectView
{
  return self->_squishedEffectView;
}

- (void)setSquishedEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_squishedEffectView, a3);
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
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

- (BOOL)centerAligned
{
  return self->_centerAligned;
}

- (void)setCenterAligned:(BOOL)a3
{
  self->_centerAligned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_squishedEffectView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_squishedView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
