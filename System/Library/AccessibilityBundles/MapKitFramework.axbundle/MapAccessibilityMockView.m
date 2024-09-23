@implementation MapAccessibilityMockView

- (id)accessibilityLabel
{
  return (id)-[UIView accessibilityLabel](self->_view, "accessibilityLabel");
}

- (id)accessibilityValue
{
  return (id)-[UIView accessibilityValue](self->_view, "accessibilityValue");
}

- (CGRect)accessibilityFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  -[UIView accessibilityFrame](self->_view, "accessibilityFrame");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (CGRectIsEmpty(v16))
  {
    -[MapAccessibilityMockView accessibilityContainer](self, "accessibilityContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityFrame");
    x = v8;
    y = v9;
    width = v10;
    height = v11;

  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return -[UIView accessibilityTraits](self->_view, "accessibilityTraits");
}

- (id)accessibilityHint
{
  return (id)-[UIView accessibilityHint](self->_view, "accessibilityHint");
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
