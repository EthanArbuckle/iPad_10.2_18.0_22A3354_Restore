@implementation UIAccessibilityElementMockSlider

- (void)setView:(id *)a1
{
  id v2;
  id v3;
  id location;
  id *v5;

  v5 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    objc_msgSend(location, "setAccessibilityContainer:", 0);
    objc_storeStrong(v5 + 7, location);
    v2 = v5[7];
    v3 = (id)objc_msgSend(v5, "accessibilityContainer");
    objc_msgSend(v2, "setAccessibilityContainer:");

  }
  objc_storeStrong(&location, 0);
}

- (CGRect)accessibilityFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v14;
  __int128 v15;
  CGRect v16;
  CGRect result;

  -[UIView accessibilityFrame](self->_view, "accessibilityFrame");
  *(CGFloat *)&v14 = v16.origin.x;
  *((_QWORD *)&v14 + 1) = *(_QWORD *)&v16.origin.y;
  *(CGFloat *)&v15 = v16.size.width;
  *((_QWORD *)&v15 + 1) = *(_QWORD *)&v16.size.height;
  if (CGRectIsEmpty(v16))
  {
    v10 = (id)-[UIAccessibilityElementMockSlider accessibilityContainer](self, "accessibilityContainer");
    objc_msgSend(v10, "accessibilityFrame");
    *(_QWORD *)&v11 = v2;
    *((_QWORD *)&v11 + 1) = v3;
    *(_QWORD *)&v12 = v4;
    *((_QWORD *)&v12 + 1) = v5;
    v14 = v11;
    v15 = v12;

  }
  v7 = *((double *)&v14 + 1);
  v6 = *(double *)&v14;
  v9 = *((double *)&v15 + 1);
  v8 = *(double *)&v15;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  objc_super v4;
  unint64_t v5;
  uint64_t v6;
  SEL v7;
  UIAccessibilityElementMockSlider *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  v6 = *MEMORY[0x24BDF73E0];
  v5 = 0;
  v3 = -[UIView accessibilityTraits](self->_view, "accessibilityTraits");
  v4.receiver = v8;
  v4.super_class = (Class)UIAccessibilityElementMockSlider;
  v5 = v3 | -[UIAccessibilityElementMockSlider accessibilityTraits](&v4, sel_accessibilityTraits);
  if ((v5 & *MEMORY[0x24BDF73E8]) == *MEMORY[0x24BDF73E8])
    v6 |= *MEMORY[0x24BDF73E8];
  return v6 | *MEMORY[0x24BDF73A0];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  id WeakRetained;
  char v9;

  if (a3 == 3)
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v7 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v7, "_accessibilityDecrementMockSlider:largeStep:", self, 1);

    }
    return 1;
  }
  else if (a3 == 4)
  {
    v5 = objc_loadWeakRetained(&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v4 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "_accessibilityIncrementMockSlider:largeStep:", self, 1);

    }
    return 1;
  }
  else
  {
    return 0;
  }
}

- (void)accessibilityIncrement
{
  id v2;
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v2 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v2, "_accessibilityIncrementMockSlider:largeStep:", self, 0);

  }
}

- (void)accessibilityDecrement
{
  id v2;
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v2 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v2, "_accessibilityDecrementMockSlider:largeStep:", self, 0);

  }
}

- (CGPoint)_accessibilityMinScrubberPosition
{
  double v2;
  double v3;
  double v4;
  double v5;
  id WeakRetained;
  double v7;
  double v8;
  CGPoint result;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "_accessibilityMinScrubberPosition");
  v7 = v2;
  v8 = v3;

  v4 = v7;
  v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_accessibilityMaxScrubberPosition
{
  double v2;
  double v3;
  double v4;
  double v5;
  id WeakRetained;
  double v7;
  double v8;
  CGPoint result;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "_accessibilityMaxScrubberPosition");
  v7 = v2;
  v8 = v3;

  v4 = v7;
  v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 8, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
