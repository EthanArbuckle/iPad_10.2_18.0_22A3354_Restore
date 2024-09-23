@implementation PKColorPicker

- (PKColorPicker)init
{
  PKColorPicker *v2;
  _PKColorPickerView *v3;
  uint64_t v4;
  _PKColorPickerView *colorPickerView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKColorPicker;
  v2 = -[PKColorPicker init](&v7, sel_init);
  v3 = [_PKColorPickerView alloc];
  v4 = -[_PKColorPickerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  colorPickerView = v2->_colorPickerView;
  v2->_colorPickerView = (_PKColorPickerView *)v4;

  -[_PKColorPickerView setDelegate:](v2->_colorPickerView, "setDelegate:", v2);
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKColorPicker;
  -[PKColorPicker viewDidLoad](&v5, sel_viewDidLoad);
  -[PKColorPicker view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorPicker colorPickerView](self, "colorPickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double x;
  double y;
  double width;
  double height;
  void *v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)PKColorPicker;
  -[PKColorPicker viewWillLayoutSubviews](&v10, sel_viewWillLayoutSubviews);
  -[PKColorPicker view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  v12 = CGRectInset(v11, 5.0, 5.0);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  -[PKColorPicker colorPickerView](self, "colorPickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", x, y, width, height);

}

- (UIColor)selectedColor
{
  void *v2;
  void *v3;

  -[PKColorPicker colorPickerView](self, "colorPickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setSelectedColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKColorPicker colorPickerView](self, "colorPickerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedColor:", v4);

}

- (int64_t)colorUserInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[_PKColorPickerView gridColorPicker](self->_colorPickerView, "gridColorPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "colorUserInterfaceStyle");

  return v3;
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  id v4;

  -[_PKColorPickerView gridColorPicker](self->_colorPickerView, "gridColorPicker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorUserInterfaceStyle:", a3);

}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PKColorPicker colorPickerView](self, "colorPickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_setSelectedColorForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  y = a3.y;
  x = a3.x;
  -[PKColorPicker view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorPicker colorPickerView](self, "colorPickerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[PKColorPicker colorPickerView](self, "colorPickerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setSelectedColorForPoint:", v9, v11);

}

- (void)_setInitialColorForSpringLoading:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKColorPicker colorPickerView](self, "colorPickerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInitialColor:", v4);

}

+ (id)_representableColorForColor:(id)a3
{
  return +[PKColorMatrixView _representableColorForColor:](PKColorMatrixView, "_representableColorForColor:", a3);
}

- (void)_colorPickerViewDidChangeSelectedColor:(id)a3
{
  id v4;

  -[PKColorPicker delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorPickerDidChangeSelectedColor:", self);

}

- (void)_colorPickerViewUserDidTouchUpInside:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[PKColorPicker delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PKColorPicker delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PKColorPicker delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_colorPickerUserDidTouchUpInside:", self);

    }
  }
}

- (PKColorPickerDelegate)delegate
{
  return (PKColorPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_PKColorPickerView)colorPickerView
{
  return self->_colorPickerView;
}

- (void)setColorPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
