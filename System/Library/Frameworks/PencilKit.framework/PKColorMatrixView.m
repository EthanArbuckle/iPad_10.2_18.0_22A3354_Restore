@implementation PKColorMatrixView

- (PKColorMatrixView)initWithFrame:(CGRect)a3
{
  PKColorMatrixView *v3;
  uint64_t v4;
  NSArray *colorMatrix;
  uint64_t v6;
  NSArray *darkColorMatrix;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PKColorMatrixView;
  v3 = -[PKColorMatrixView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend((id)objc_opt_class(), "defaultColorMatrix");
  v4 = objc_claimAutoreleasedReturnValue();
  colorMatrix = v3->_colorMatrix;
  v3->_colorMatrix = (NSArray *)v4;

  +[PKColorMatrixView flippedColorMatrix:](PKColorMatrixView, "flippedColorMatrix:", v3->_colorMatrix);
  v6 = objc_claimAutoreleasedReturnValue();
  darkColorMatrix = v3->_darkColorMatrix;
  v3->_darkColorMatrix = (NSArray *)v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixView colorMatrix](v3, "colorMatrix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKColorMatrixView colorMatrix](v3, "colorMatrix");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        v16 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addTarget:action:forControlEvents:", v3, sel_didTapColorButton_, 64);
          objc_msgSend(v12, "addObject:", v17);
          -[PKColorMatrixView addSubview:](v3, "addSubview:", v17);

          ++v16;
          -[PKColorMatrixView colorMatrix](v3, "colorMatrix");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

        }
        while (v16 < v20);
      }
      v21 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v8, "addObject:", v21);

      ++v11;
      -[PKColorMatrixView colorMatrix](v3, "colorMatrix");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

    }
    while (v11 < v23);
  }
  v24 = (void *)objc_msgSend(v8, "copy");
  -[PKColorMatrixView setColorButtons:](v3, "setColorButtons:", v24);

  return v3;
}

+ (id)flippedColorMatrix:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "reverseObjectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v11);

  return v5;
}

- (void)didTapColorButton:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  -[PKColorMatrixView _pointFromButton:](self, "_pointFromButton:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixView _colorForPoint:](self, "_colorForPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixView setSelectedColor:](self, "setSelectedColor:", v4);
  -[PKColorMatrixView colorPickerDelegate](self, "colorPickerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorPickerImplementationDidChangeSelectedColor:", self);

  -[PKColorMatrixView colorPickerDelegate](self, "colorPickerDelegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[PKColorMatrixView colorPickerDelegate](self, "colorPickerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[PKColorMatrixView colorPickerDelegate](self, "colorPickerDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "colorPickerImplementationUserDidTouchUpInside:", self);

    }
  }

}

- (id)_pointFromButton:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;

  v4 = a3;
  -[PKColorMatrixView colorButtons](self, "colorButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      -[PKColorMatrixView colorButtons](self, "colorButtons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
        break;
LABEL_7:
      ++v7;
      -[PKColorMatrixView colorButtons](self, "colorButtons");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v7 >= v19)
        goto LABEL_8;
    }
    v11 = 0;
    while (1)
    {
      -[PKColorMatrixView colorButtons](self, "colorButtons");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v11);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v4)
        break;

      ++v11;
      -[PKColorMatrixView colorButtons](self, "colorButtons");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v11 >= v17)
        goto LABEL_7;
    }
    +[PKColorMatrixViewPoint pointWithRow:col:](PKColorMatrixViewPoint, "pointWithRow:col:", v7, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    v20 = 0;
  }

  return v20;
}

- (CGRect)_frameForViewWithPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (a3)
  {
    v4 = a3;
    -[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "count");
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "count");

    -[PKColorMatrixView bounds](self, "bounds");
    objc_msgSend(v4, "col");
    objc_msgSend(v4, "row");

    -[PKColorMatrixView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayScale");
    UIRectIntegralWithScale();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_pointForCGPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  -[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)(unint64_t)objc_msgSend(v6, "count");
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (double)(unint64_t)objc_msgSend(v8, "count");

  -[PKColorMatrixView bounds](self, "bounds");
  +[PKColorMatrixViewPoint pointWithRow:col:](PKColorMatrixViewPoint, "pointWithRow:col:", vcvtmd_s64_f64(y / (v10 / v7)), vcvtmd_s64_f64(x / (v11 / v9)));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_colorForPoint:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (v6 = objc_msgSend(v4, "row"), v6 < objc_msgSend(v5, "count")))
  {
    v7 = objc_msgSend(v4, "col");
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v10 = 0;
    if (v7 < v9)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v4, "col"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    -[PKColorMatrixView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)_uiColorUserInterfaceStyle
{
  void *v4;
  int64_t v5;

  if (-[PKColorMatrixView colorUserInterfaceStyle](self, "colorUserInterfaceStyle"))
    return -[PKColorMatrixView colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
  -[PKColorMatrixView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  return v5;
}

- (id)uiColorMatrix
{
  if (-[PKColorMatrixView _uiColorUserInterfaceStyle](self, "_uiColorUserInterfaceStyle") == 2)
    -[PKColorMatrixView darkColorMatrix](self, "darkColorMatrix");
  else
    -[PKColorMatrixView colorMatrix](self, "colorMatrix");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pointForColor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;

  v4 = a3;
  if (v4
    && (-[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    v7 = 0;
    v8 = 0;
    v9 = 1.79769313e308;
    do
    {
      -[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v13 = 0;
        do
        {
          -[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "_colorDifferenceFromColor:", v4);
          if (v17 < v9)
          {
            v18 = v17;
            +[PKColorMatrixViewPoint pointWithRow:col:](PKColorMatrixViewPoint, "pointWithRow:col:", v7, v13);
            v19 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v19;
            v9 = v18;
          }

          ++v13;
          -[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

        }
        while (v13 < v22);
      }
      ++v7;
      -[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

    }
    while (v7 < v24);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_boundedPointForPoint:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;

  if (a3)
  {
    v4 = a3;
    -[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (double)objc_msgSend(v4, "row");
    v7 = (double)(unint64_t)(objc_msgSend(v5, "count") - 1);
    if (v6 < v7)
      v7 = v6;
    if (v7 < 0.0)
      v7 = 0.0;
    v8 = (uint64_t)v7;
    v9 = objc_msgSend(v4, "col");

    v10 = (double)v9;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") - 1;

    v13 = (double)(unint64_t)v12;
    if (v10 < (double)(unint64_t)v12)
      v13 = v10;
    if (v13 < 0.0)
      v13 = 0.0;
    +[PKColorMatrixViewPoint pointWithRow:col:](PKColorMatrixViewPoint, "pointWithRow:col:", v8, (uint64_t)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  _UNKNOWN **v5;
  void **v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _UNKNOWN **v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKColorMatrixView;
  -[PKColorMatrixView layoutSubviews](&v24, sel_layoutSubviews);
  v22 = -[PKColorMatrixView _uiColorUserInterfaceStyle](self, "_uiColorUserInterfaceStyle");
  -[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v3, "count");
  if (v21 >= 1)
  {
    v4 = 0;
    v5 = &off_1E776F000;
    v6 = (void **)&off_1E776F000;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8 >= 1)
      {
        v9 = 0;
        v23 = v8;
        do
        {
          -[PKColorMatrixView colorButtons](self, "colorButtons");
          v10 = v6;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", v4);
          v12 = v4;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v5[163];
          objc_msgSend(v3, "objectAtIndexedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v9);
          v17 = v5;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "convertColor:fromUserInterfaceStyle:to:", v18, 1, v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBackgroundColor:", v19);

          v6 = v10;
          v4 = v12;
          objc_msgSend(v10[92], "pointWithRow:col:", v12, v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKColorMatrixView _frameForViewWithPoint:](self, "_frameForViewWithPoint:", v20);
          objc_msgSend(v14, "setFrame:");

          v5 = v17;
          ++v9;
        }
        while (v23 != v9);
      }
      ++v4;
    }
    while (v4 != v21);
  }

}

- (id)representableColorForColor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_representableColorForColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_representableColorForColor:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  unint64_t v18;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "defaultColorMatrix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = 0;
      v7 = 0;
      v8 = 1.79769313e308;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          v11 = 0;
          do
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(a1, "_rgbDistanceFromColor:toColor:", v13, v4);
            if (v14 < v8)
            {
              v15 = v14;
              v16 = v13;

              v7 = v16;
              v8 = v15;
            }

            ++v11;
            objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

          }
          while (v11 < v18);
        }
        ++v6;
      }
      while (v6 < objc_msgSend(v5, "count"));
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (double)_rgbDistanceFromColor:(id)a3 toColor:(id)a4
{
  id v5;
  uint64_t v6;
  double v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v11, (char *)&v11 + 8, &v12, (char *)&v12 + 8);
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v9, (char *)&v9 + 8, &v10, (char *)&v10 + 8);
  v6 = 0;
  v7 = 0.0;
  do
  {
    v7 = v7
       + (*(double *)((char *)&v11 + v6) - *(double *)((char *)&v9 + v6))
       * (*(double *)((char *)&v11 + v6) - *(double *)((char *)&v9 + v6));
    v6 += 8;
  }
  while (v6 != 24);

  return sqrt(v7);
}

- (CGRect)frameForColorPickerCrosshairView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  v4 = a3;
  -[PKColorMatrixView selectedColor](self, "selectedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixView _pointForColor:](self, "_pointForColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixView _boundedPointForPoint:](self, "_boundedPointForPoint:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixView _frameForViewWithPoint:](self, "_frameForViewWithPoint:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v4, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "convertRect:fromView:", self, v9, v11, v13, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (unint64_t)cornerPositionForColorPickerCrosshairView:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double MidX;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  -[PKColorMatrixView convertRect:fromView:](self, "convertRect:fromView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[PKColorMatrixView uiColorMatrix](self, "uiColorMatrix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  -[PKColorMatrixView _pointForCGPoint:](self, "_pointForCGPoint:", MidX, CGRectGetMidY(v26));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "row"))
  {
    if (!objc_msgSend(v15, "col"))
    {
      v20 = 1;
      goto LABEL_12;
    }
    v21 = objc_msgSend(v15, "col");
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count") - 1;

    if (v21 == v23)
    {
      v20 = 2;
      goto LABEL_12;
    }
LABEL_9:
    v20 = 0;
    goto LABEL_12;
  }
  v16 = objc_msgSend(v15, "row");
  if (v16 != objc_msgSend(v13, "count") - 1)
    goto LABEL_9;
  if (!objc_msgSend(v15, "col"))
  {
    v20 = 3;
    goto LABEL_12;
  }
  v17 = objc_msgSend(v15, "col");
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count") - 1;

  if (v17 != v19)
    goto LABEL_9;
  v20 = 4;
LABEL_12:

  return v20;
}

- (void)colorPickerCrosshairViewShouldUpdateColor:(id)a3 point:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  y = a4.y;
  x = a4.x;
  objc_msgSend(a3, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixView convertPoint:fromView:](self, "convertPoint:fromView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[PKColorMatrixView _pointForCGPoint:](self, "_pointForCGPoint:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixView _boundedPointForPoint:](self, "_boundedPointForPoint:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixView _colorForPoint:](self, "_colorForPoint:", v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[PKColorMatrixView selectedColor](self, "selectedColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v14, "isEqual:", v16);

  if ((v13 & 1) == 0)
  {
    -[PKColorMatrixView setSelectedColor:](self, "setSelectedColor:", v16);
    -[PKColorMatrixView colorPickerDelegate](self, "colorPickerDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorPickerImplementationDidChangeSelectedColor:", self);

  }
}

- (void)colorPickerCrosshairViewShouldUpdateWithColor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PKColorMatrixView selectedColor](self, "selectedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v7);

  if ((v5 & 1) == 0)
  {
    -[PKColorMatrixView setSelectedColor:](self, "setSelectedColor:", v7);
    -[PKColorMatrixView colorPickerDelegate](self, "colorPickerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorPickerImplementationDidChangeSelectedColor:", self);

  }
}

+ (id)defaultColorMatrix
{
  if (qword_1EF560490 != -1)
    dispatch_once(&qword_1EF560490, &__block_literal_global_26);
  return (id)_MergedGlobals_1;
}

void __39__PKColorMatrixView_defaultColorMatrix__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  _QWORD v132[12];
  _QWORD v133[12];
  _QWORD v134[12];
  _QWORD v135[12];
  _QWORD v136[12];
  _QWORD v137[12];
  _QWORD v138[12];
  _QWORD v139[12];
  _QWORD v140[12];
  _QWORD v141[12];
  _QWORD v142[12];

  v142[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v141[0] = v128;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.921568627, 1.0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v141[1] = v127;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.839215686, 0.839215686, 0.839215686, 1.0);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v141[2] = v126;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.760784314, 0.760784314, 0.760784314, 1.0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v141[3] = v125;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.678431373, 0.678431373, 0.678431373, 1.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v141[4] = v124;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6, 0.6, 0.6, 1.0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v141[5] = v123;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.521568627, 0.521568627, 0.521568627, 1.0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v141[6] = v122;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.439215686, 0.439215686, 0.439215686, 1.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v141[7] = v121;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.360784314, 0.360784314, 0.360784314, 1.0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v141[8] = v120;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.278431373, 0.278431373, 0.278431373, 1.0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v141[9] = v119;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.2, 0.2, 0.2, 1.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v141[10] = v118;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v141[11] = v117;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 12);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v116;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v140[0] = v115;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.00392156863, 0.11372549);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v140[1] = v114;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0666666667, 0.0196078431);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v140[2] = v113;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.180392157, 0.0235294118, 0.239215686, 1.0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v140[3] = v112;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.235294118, 0.0274509804, 0.105882353, 1.0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v140[4] = v111;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.360784314, 0.0274509804, 0.00392156863, 1.0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v140[5] = v110;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.352941176, 0.109803922, 0.0, 1.0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v140[6] = v109;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.345098039, 0.2, 0.0, 1.0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v140[7] = v108;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v140[8] = v107;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v140[9] = v106;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v140[10] = v105;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.149019608);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v140[11] = v104;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 12);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v103;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = v102;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.00392156863, 0.184313725, 0.482352941, 1.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v139[1] = v101;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.101960784, 0.0392156863);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v139[2] = v100;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.270588235, 0.0509803922, 0.349019608, 1.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v139[3] = v99;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.333333333, 0.062745098, 0.160784314, 1.0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v139[4] = v98;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v139[5] = v97;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.482352941, 0.160784314, 0.0, 1.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v139[6] = v96;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v139[7] = v95;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.470588235, 0.345098039, 0.0, 1.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v139[8] = v94;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.552941176);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v139[9] = v93;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.435294118);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v139[10] = v92;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v139[11] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 12);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v142[2] = v90;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.00392156863, 0.431372549);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v89;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.258823529, 0.662745098, 1.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v138[1] = v88;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.17254902, 0.0352941176);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v138[2] = v87;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.380392157, 0.0941176471, 0.48627451, 1.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v138[3] = v86;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.474509804, 0.101960784, 0.239215686, 1.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v138[4] = v85;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v138[5] = v84;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.678431373, 0.243137255, 0.0, 1.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v138[6] = v83;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.662745098, 0.407843137, 0.0, 1.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v138[7] = v82;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.650980392, 0.482352941, 0.00392156863, 1.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v138[8] = v81;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.768627451, 0.737254902, 0.0, 1.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v138[9] = v80;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.607843137);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v138[10] = v79;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.305882353, 0.478431373, 0.152941176, 1.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v138[11] = v78;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 12);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v142[3] = v77;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v76;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.337254902, 0.839215686, 1.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v75;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.215686275, 0.101960784);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v137[2] = v74;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.478431373, 0.129411765);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v137[3] = v73;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6, 0.141176471, 0.309803922, 1.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v137[4] = v72;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v137[5] = v71;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.854901961, 0.317647059, 0.0, 1.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v137[6] = v70;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v137[7] = v69;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.819607843, 0.615686275, 0.00392156863, 1.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v137[8] = v68;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.960784314, 0.925490196, 0.0, 1.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v137[9] = v67;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.764705882, 0.819607843, 0.0901960784, 1.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v137[10] = v66;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.4, 0.615686275, 0.203921569, 1.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v137[11] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 12);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v142[4] = v64;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.631372549);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = v63;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.380392157, 0.996078431, 1.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v136[1] = v61;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.301960784, 0.133333333, 0.698039216, 1.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v136[2] = v60;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.596078431, 0.164705882, 0.737254902, 1.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v136[3] = v59;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v136[4] = v58;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.250980392, 0.0823529412, 1.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v136[5] = v57;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.415686275, 0.0, 1.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v136[6] = v56;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v136[7] = v55;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v136[8] = v54;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v136[9] = v53;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v136[10] = v51;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.462745098, 0.733333333, 0.250980392, 1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v136[11] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 12);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v142[5] = v49;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.00392156863, 0.780392157, 0.988235294, 1.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v48;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.22745098, 0.529411765, 0.996078431, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v135[1] = v45;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.368627451, 0.188235294, 0.921568627, 1.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v135[2] = v62;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.745098039, 0.219607843, 0.952941176, 1.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v135[3] = v42;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.901960784, 0.231372549, 0.478431373, 1.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v135[4] = v52;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.384313725, 0.31372549, 1.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v135[5] = v41;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.525490196, 0.282352941, 1.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v135[6] = v40;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431, 0.705882353, 0.247058824, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v135[7] = v38;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v135[8] = v129;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v135[9] = v37;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.894117647);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v135[10] = v44;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.588235294, 0.82745098, 0.37254902, 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v135[11] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v142[6] = v34;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.321568627, 0.839215686, 0.988235294, 1.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v46;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.454901961, 0.654901961, 1.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v32;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.525490196, 0.309803922, 0.996078431, 1.0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v134[2] = v130;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.82745098, 0.341176471, 0.996078431, 1.0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v134[3] = v131;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v134[4] = v35;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.549019608, 0.509803922, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v134[5] = v28;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.647058824, 0.490196078, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v134[6] = v33;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.780392157, 0.466666667, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v134[7] = v27;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.850980392, 0.466666667, 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v134[8] = v39;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.976470588, 0.580392157, 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v134[9] = v31;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.917647059, 0.949019608, 0.560784314, 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v134[10] = v43;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.694117647);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v134[11] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v142[7] = v23;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.576470588, 0.890196078, 0.992156863, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = v22;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.654901961, 0.776470588, 1.0, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v133[1] = v21;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.694117647, 0.549019608, 0.996078431, 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v133[2] = v30;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.88627451, 0.57254902, 0.996078431, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v133[3] = v18;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.956862745, 0.643137255, 0.752941176, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v133[4] = v17;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.709803922, 0.68627451, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v133[5] = v16;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.77254902, 0.670588235, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v133[6] = v25;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.850980392, 0.658823529, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v133[7] = v14;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431, 0.894117647, 0.658823529, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v133[8] = v13;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.984313725, 0.725490196, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v133[9] = v29;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.949019608, 0.968627451, 0.717647059, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v133[10] = v26;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.803921569, 0.909803922, 0.709803922, 1.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v133[11] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v142[8] = v12;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.796078431, 0.941176471, 1.0, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = v19;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.82745098, 0.88627451, 1.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v132[1] = v11;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.850980392, 0.788235294, 0.996078431, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v132[2] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.937254902, 0.792156863, 1.0, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v132[3] = v20;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.976470588, 0.82745098, 0.878431373, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v132[4] = v0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.858823529, 0.847058824, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v132[5] = v1;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.88627451, 0.839215686, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v132[6] = v2;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.925490196, 0.831372549, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v132[7] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.949019608, 0.835294118, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v132[8] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431, 0.988235294, 0.866666667, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v132[9] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.968627451, 0.980392157, 0.858823529, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v132[10] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.874509804, 0.933333333, 0.831372549, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v132[11] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v142[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 10);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v9;

}

- (UIColor)selectedColor
{
  return self->selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->selectedColor, a3);
}

- (_PKColorPickerImplementationDelegate)colorPickerDelegate
{
  return (_PKColorPickerImplementationDelegate *)objc_loadWeakRetained((id *)&self->_colorPickerDelegate);
}

- (void)setColorPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_colorPickerDelegate, a3);
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (NSArray)colorMatrix
{
  return self->_colorMatrix;
}

- (void)setColorMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_colorMatrix, a3);
}

- (NSArray)darkColorMatrix
{
  return self->_darkColorMatrix;
}

- (void)setDarkColorMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_darkColorMatrix, a3);
}

- (NSArray)colorButtons
{
  return self->_colorButtons;
}

- (void)setColorButtons:(id)a3
{
  objc_storeStrong((id *)&self->_colorButtons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorButtons, 0);
  objc_storeStrong((id *)&self->_darkColorMatrix, 0);
  objc_storeStrong((id *)&self->_colorMatrix, 0);
  objc_destroyWeak((id *)&self->_colorPickerDelegate);
  objc_storeStrong((id *)&self->selectedColor, 0);
}

@end
