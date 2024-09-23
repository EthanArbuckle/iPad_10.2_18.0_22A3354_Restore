@implementation _PKColorPickerView

- (_PKColorPickerView)initWithFrame:(CGRect)a3
{
  _PKColorPickerView *v3;
  uint64_t v4;
  UIColor *selectedColor;
  PKColorMatrixView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  PKColorMatrixView *gridColorPicker;
  void *v13;
  void *v14;
  PKColorPickerCrosshairView *v15;
  PKColorPickerCrosshairView *crosshairView;
  uint64_t v17;
  UIPanGestureRecognizer *crosshairPanGR;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_PKColorPickerView;
  v3 = -[_PKColorPickerView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_PKColorPickerView setClipsToBounds:](v3, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v4 = objc_claimAutoreleasedReturnValue();
  selectedColor = v3->_selectedColor;
  v3->_selectedColor = (UIColor *)v4;

  v6 = [PKColorMatrixView alloc];
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[PKColorMatrixView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
  gridColorPicker = v3->_gridColorPicker;
  v3->_gridColorPicker = (PKColorMatrixView *)v11;

  -[PKColorMatrixView setColorPickerDelegate:](v3->_gridColorPicker, "setColorPickerDelegate:", v3);
  -[_PKColorPickerView selectedColor](v3, "selectedColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixView setSelectedColor:](v3->_gridColorPicker, "setSelectedColor:", v13);

  -[PKColorMatrixView layer](v3->_gridColorPicker, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", 9.0);

  -[PKColorMatrixView setClipsToBounds:](v3->_gridColorPicker, "setClipsToBounds:", 1);
  v15 = -[PKColorPickerCrosshairView initWithFrame:]([PKColorPickerCrosshairView alloc], "initWithFrame:", v7, v8, v9, v10);
  crosshairView = v3->_crosshairView;
  v3->_crosshairView = v15;

  -[PKColorPickerCrosshairView setDelegate:](v3->_crosshairView, "setDelegate:", v3->_gridColorPicker);
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v3, sel_didPanCrosshair_);
  crosshairPanGR = v3->_crosshairPanGR;
  v3->_crosshairPanGR = (UIPanGestureRecognizer *)v17;

  -[_PKColorPickerView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_crosshairPanGR);
  -[_PKColorPickerView addSubview:](v3, "addSubview:", v3->_gridColorPicker);
  -[_PKColorPickerView addSubview:](v3, "addSubview:", v3->_crosshairView);
  -[_PKColorPickerView crosshairView](v3, "crosshairView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "update");

  -[_PKColorPickerView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("gridColorPicker"));
  -[PKColorMatrixView setHidden:](v3->_gridColorPicker, "setHidden:", 0);
  return v3;
}

- (void)setSelectedColor:(id)a3
{
  id v4;
  void *v5;
  UIColor *v6;
  UIColor *selectedColor;
  UIColor *v8;
  void *v9;

  v4 = a3;
  -[_PKColorPickerView gridColorPicker](self, "gridColorPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "representableColorForColor:", v4);
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();

  selectedColor = self->_selectedColor;
  self->_selectedColor = v6;
  v8 = v6;

  -[_PKColorPickerView gridColorPicker](self, "gridColorPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectedColor:", v8);

  -[_PKColorPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_PKColorPickerView;
  -[_PKColorPickerView layoutSubviews](&v13, sel_layoutSubviews);
  -[_PKColorPickerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_PKColorPickerView gridColorPicker](self, "gridColorPicker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[_PKColorPickerView crosshairView](self, "crosshairView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "update");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 352.0;
  v4 = 296.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didPanCrosshair:(id)a3
{
  UIColor *v4;
  UIColor *initialColor;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "state") == 1)
  {
    -[_PKColorPickerView selectedColor](self, "selectedColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    initialColor = self->_initialColor;
    self->_initialColor = v4;

  }
  else if (objc_msgSend(v7, "state") == 2)
  {
    objc_msgSend(v7, "locationInView:", self);
    -[_PKColorPickerView _setSelectedColorForPoint:](self, "_setSelectedColorForPoint:");
  }
  else if (objc_msgSend(v7, "state") == 3)
  {
    -[_PKColorPickerView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_colorPickerViewUserDidTouchUpInside:", self);

  }
}

- (void)_setSelectedColorForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  if (fabs(a3.x) != INFINITY && fabs(a3.y) != INFINITY)
  {
    -[_PKColorPickerView crosshairView](self, "crosshairView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCenter:", x, y);

    if (-[_PKColorPickerView pointIsSignificantlyOutside:](self, "pointIsSignificantlyOutside:", x, y)
      && self->_initialColor)
    {
      -[_PKColorPickerView crosshairView](self, "crosshairView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "colorPickerCrosshairViewShouldUpdateWithColor:", self->_initialColor);
    }
    else
    {
      -[_PKColorPickerView crosshairView](self, "crosshairView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PKColorPickerView crosshairView](self, "crosshairView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "colorPickerCrosshairViewShouldUpdateColor:point:", v9, x, y);

    }
    -[_PKColorPickerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)pointIsSignificantlyOutside:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  -[_PKColorPickerView bounds](self, "bounds");
  DKDDistanceToRect(x, y, v6, v7, v8, v9);
  v11 = v10;
  -[_PKColorPickerView frame](self, "frame");
  v13 = v12;
  +[PKColorMatrixView defaultColorMatrix](PKColorMatrixView, "defaultColorMatrix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 / (double)(unint64_t)objc_msgSend(v14, "count") * 5.0;

  if (v11 <= v15)
    return 0;
  -[_PKColorPickerView bounds](self, "bounds");
  v17.x = x;
  v17.y = y;
  return !CGRectContainsPoint(v18, v17);
}

- (void)colorPickerImplementationDidChangeSelectedColor:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "selectedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorPickerView setSelectedColor:](self, "setSelectedColor:", v4);

  -[_PKColorPickerView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_colorPickerViewDidChangeSelectedColor:", self);

}

- (void)colorPickerImplementationUserDidTouchUpInside:(id)a3
{
  id v4;

  -[_PKColorPickerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_colorPickerViewUserDidTouchUpInside:", self);

}

- (_PKColorPickerViewDelegate)delegate
{
  return (_PKColorPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (UIColor)initialColor
{
  return self->_initialColor;
}

- (void)setInitialColor:(id)a3
{
  objc_storeStrong((id *)&self->_initialColor, a3);
}

- (UIPanGestureRecognizer)crosshairPanGR
{
  return self->_crosshairPanGR;
}

- (void)setCrosshairPanGR:(id)a3
{
  objc_storeStrong((id *)&self->_crosshairPanGR, a3);
}

- (PKColorPickerCrosshairView)crosshairView
{
  return self->_crosshairView;
}

- (void)setCrosshairView:(id)a3
{
  objc_storeStrong((id *)&self->_crosshairView, a3);
}

- (PKColorMatrixView)gridColorPicker
{
  return self->_gridColorPicker;
}

- (void)setGridColorPicker:(id)a3
{
  objc_storeStrong((id *)&self->_gridColorPicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridColorPicker, 0);
  objc_storeStrong((id *)&self->_crosshairView, 0);
  objc_storeStrong((id *)&self->_crosshairPanGR, 0);
  objc_storeStrong((id *)&self->_initialColor, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
