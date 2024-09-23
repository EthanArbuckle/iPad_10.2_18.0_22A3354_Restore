@implementation SFToolbarContainer

- (_QWORD)initWithToolbar:(_QWORD *)a1
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SFToolbarContainer;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 52, a2);
      objc_msgSend(a1, "addSubview:", a1[52]);
    }
  }

  return a1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SFToolbarContainer *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v14;
  double MinY;
  CGFloat MaxY;
  UIToolbar *toolbar;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SFToolbarContainer;
  -[SFToolbarContainer hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SFToolbarContainer *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    -[UIToolbar frame](self->_toolbar, "frame");
    v9 = v20.origin.x;
    v10 = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;
    MinX = CGRectGetMinX(v20);
    v21.origin.x = v9;
    v21.origin.y = v10;
    v21.size.width = width;
    v21.size.height = height;
    v14 = fmax(MinX, fmin(CGRectGetMaxX(v21) + -1.0, x));
    v22.origin.x = v9;
    v22.origin.y = v10;
    v22.size.width = width;
    v22.size.height = height;
    MinY = CGRectGetMinY(v22);
    v23.origin.x = v9;
    v23.origin.y = v10;
    v23.size.width = width;
    v23.size.height = height;
    MaxY = CGRectGetMaxY(v23);
    toolbar = self->_toolbar;
    -[UIToolbar convertPoint:fromView:](toolbar, "convertPoint:fromView:", self, v14, fmax(MinY, fmin(MaxY + -1.0, y)));
    -[UIToolbar hitTest:withEvent:](toolbar, "hitTest:withEvent:", v7);
    v8 = (SFToolbarContainer *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFToolbarContainer;
  -[SFToolbarContainer layoutSubviews](&v9, sel_layoutSubviews);
  -[UIToolbar items](self->_toolbar, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SFToolbarContainer bounds](self, "bounds");
    -[UIToolbar setFrame:](self->_toolbar, "setFrame:", v5 + self->_toolbarInsets.left, v6 + self->_toolbarInsets.top, v7 - (self->_toolbarInsets.left + self->_toolbarInsets.right), v8 - (self->_toolbarInsets.top + self->_toolbarInsets.bottom));
  }
  -[SFToolbarContainer setHidden:](self, "setHidden:", v4 == 0);
}

- (void)setToolbarInsets:(double)a3
{
  if (a1)
  {
    if (*((double *)a1 + 55) != a4
      || *((double *)a1 + 54) != a3
      || *((double *)a1 + 57) != a6
      || *((double *)a1 + 56) != a5)
    {
      *((double *)a1 + 54) = a3;
      *((double *)a1 + 55) = a4;
      *((double *)a1 + 56) = a5;
      *((double *)a1 + 57) = a6;
      return (void *)objc_msgSend(a1, "setNeedsLayout");
    }
  }
  return a1;
}

- (double)widthRangeUsingNarrowMetrics:(void *)a3 compatibleWithTraitCollection:
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 416), "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      if (a2)
        v8 = 10.0;
      else
        v8 = 18.0;
      v9 = 30.0;
      if ((a2 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "scaledValueForValue:compatibleWithTraitCollection:", v5, 30.0);
        _SFRoundFloatToPixels();
        v9 = v11;

      }
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(*(id *)(a1 + 416), "items", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        v16 = 0.0;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "_width");
            v16 = v16 + fmax(v18, v9);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v14);
      }
      else
      {
        v16 = 0.0;
      }

      v19 = *(double *)(a1 + 440)
          + *(double *)(a1 + 456)
          + fmax(*(double *)(a1 + 424), v16 + (double)(unint64_t)(v7 - 1) * v8);
    }
    else
    {
      v19 = *(double *)(a1 + 424);
    }
  }
  else
  {
    v19 = 0.0;
  }

  return v19;
}

- (uint64_t)setMinimumWidth:(uint64_t)result
{
  if (result)
    *(double *)(result + 424) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end
