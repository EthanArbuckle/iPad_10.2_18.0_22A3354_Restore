@implementation PLUIAccessibilityMockSlider

- (void)setView:(id)a3
{
  UIView *v4;
  UIView *view;
  UIView *v6;
  UIView *v7;
  id v8;

  v4 = (UIView *)a3;
  -[UIView setAccessibilityContainer:](v4, "setAccessibilityContainer:", 0);
  view = self->_view;
  self->_view = v4;
  v6 = v4;

  v7 = self->_view;
  -[PLUIAccessibilityMockSlider accessibilityContainer](self, "accessibilityContainer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setAccessibilityContainer:](v7, "setAccessibilityContainer:", v8);

}

- (CGRect)accessibilityFrame
{
  double x;
  CGFloat y;
  double width;
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
  double v16;
  CGRect v17;
  CGRect result;

  -[UIView accessibilityFrame](self->_view, "accessibilityFrame");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  if (CGRectIsEmpty(v17))
  {
    -[PLUIAccessibilityMockSlider accessibilityContainer](self, "accessibilityContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityFrame");
    x = v8;
    y = v9;
    width = v10;
    height = v11;

  }
  if (width >= 16.0)
    v12 = width;
  else
    v12 = 16.0;
  v13 = 0.0;
  if (width < 16.0)
    v13 = (16.0 - width) * 0.5;
  v14 = x - v13;
  v15 = y;
  v16 = height;
  result.size.height = v16;
  result.size.width = v12;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v3 = *MEMORY[0x24BDF73E0];
  v4 = -[UIView accessibilityTraits](self->_view, "accessibilityTraits");
  v9.receiver = self;
  v9.super_class = (Class)PLUIAccessibilityMockSlider;
  v5 = -[PLUIAccessibilityMockSlider accessibilityTraits](&v9, sel_accessibilityTraits) | v4;
  v6 = *MEMORY[0x24BDF73E8];
  if ((*MEMORY[0x24BDF73E8] & ~v5) != 0)
    v6 = 0;
  v7 = *MEMORY[0x24BDF7430];
  if ((*MEMORY[0x24BDF7430] & ~v5) != 0)
    v7 = 0;
  return *MEMORY[0x24BDF73A0] | v3 | v6 | v7;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  id v4;
  char v5;
  id v6;
  id WeakRetained;
  char v8;

  if (a3 == 4)
  {
    WeakRetained = objc_loadWeakRetained(&self->_mockSliderDelegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v6 = objc_loadWeakRetained(&self->_mockSliderDelegate);
      objc_msgSend(v6, "_accessibilityIncrementMockSlider:largeStep:", self, 1);
      goto LABEL_7;
    }
    return 1;
  }
  if (a3 == 3)
  {
    v4 = objc_loadWeakRetained(&self->_mockSliderDelegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained(&self->_mockSliderDelegate);
      objc_msgSend(v6, "_accessibilityDecrementMockSlider:largeStep:", self, 1);
LABEL_7:

      return 1;
    }
    return 1;
  }
  return 0;
}

- (void)accessibilityIncrement
{
  id *p_mockSliderDelegate;
  id WeakRetained;
  char v5;
  id v6;

  p_mockSliderDelegate = &self->_mockSliderDelegate;
  WeakRetained = objc_loadWeakRetained(&self->_mockSliderDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(p_mockSliderDelegate);
    objc_msgSend(v6, "_accessibilityIncrementMockSlider:largeStep:", self, 0);

  }
}

- (void)accessibilityDecrement
{
  id *p_mockSliderDelegate;
  id WeakRetained;
  char v5;
  id v6;

  p_mockSliderDelegate = &self->_mockSliderDelegate;
  WeakRetained = objc_loadWeakRetained(&self->_mockSliderDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(p_mockSliderDelegate);
    objc_msgSend(v6, "_accessibilityDecrementMockSlider:largeStep:", self, 0);

  }
}

- (UIView)view
{
  return self->_view;
}

- (id)mockSliderDelegate
{
  return objc_loadWeakRetained(&self->_mockSliderDelegate);
}

- (void)setMockSliderDelegate:(id)a3
{
  objc_storeWeak(&self->_mockSliderDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_mockSliderDelegate);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
