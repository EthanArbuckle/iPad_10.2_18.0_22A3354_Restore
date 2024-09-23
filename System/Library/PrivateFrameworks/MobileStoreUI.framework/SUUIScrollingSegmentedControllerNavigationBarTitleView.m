@implementation SUUIScrollingSegmentedControllerNavigationBarTitleView

- (SUUIScrollingSegmentedControllerNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  SUUIScrollingSegmentedControllerNavigationBarTitleView *v3;
  SUUIScrollingSegmentedControllerNavigationBarTitleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIScrollingSegmentedControllerNavigationBarTitleView;
  v3 = -[SUUIScrollingSegmentedControllerNavigationBarTitleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_segmentedControlMinimumHeight = 29.0;
    objc_msgSend((id)objc_opt_class(), "defaultLayoutMargins");
    -[SUUIScrollingSegmentedControllerNavigationBarTitleView setLayoutMargins:](v4, "setLayoutMargins:");
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SUUIScrollingSegmentedControllerNavigationBarTitleView;
  -[SUUIScrollingSegmentedControllerNavigationBarTitleView layoutSubviews](&v28, sel_layoutSubviews);
  if (self->_segmentedControl)
  {
    -[SUUIScrollingSegmentedControllerNavigationBarTitleView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayScale");
    v5 = v4;

    if (v5 <= 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      v5 = v7;

    }
    -[SUUIScrollingSegmentedControllerNavigationBarTitleView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[SUUIScrollingSegmentedControllerNavigationBarTitleView layoutMargins](self, "layoutMargins");
    v17 = v16;
    v19 = v9 + v18;
    v21 = v11 + v20;
    v23 = v13 - (v18 + v22);
    v24 = v15 - (v20 + v17);
    if (self->_layoutStyle != 1)
    {
      -[SUUIInteractiveSegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", v23, v24);
      v27 = v5;
      UIRectCenteredXInRectScale();
      v19 = v25;
      v21 = v26;
    }
    -[SUUIInteractiveSegmentedControl setFrame:](self->_segmentedControl, "setFrame:", v19, v21, v23, v24, *(_QWORD *)&v27);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
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
  CGSize result;

  -[SUUIInteractiveSegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", 1.79769313e308, self->_segmentedControlMinimumHeight);
  v5 = v4;
  v7 = v6;
  -[SUUIScrollingSegmentedControllerNavigationBarTitleView layoutMargins](self, "layoutMargins");
  v10 = v5 + v8 + v9;
  v13 = v7 + v11 + v12;
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

+ (UIEdgeInsets)defaultLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 4.0;
  v3 = 8.0;
  v4 = 4.0;
  v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setSegmentedControl:(id)a3
{
  SUUIInteractiveSegmentedControl *v5;
  SUUIInteractiveSegmentedControl **p_segmentedControl;
  SUUIInteractiveSegmentedControl *segmentedControl;
  SUUIScrollingSegmentedControllerNavigationBarTitleView *v8;
  SUUIInteractiveSegmentedControl *v9;

  v5 = (SUUIInteractiveSegmentedControl *)a3;
  p_segmentedControl = &self->_segmentedControl;
  segmentedControl = self->_segmentedControl;
  if (segmentedControl != v5)
  {
    v9 = v5;
    -[SUUIInteractiveSegmentedControl superview](segmentedControl, "superview");
    v8 = (SUUIScrollingSegmentedControllerNavigationBarTitleView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[SUUIInteractiveSegmentedControl removeFromSuperview](*p_segmentedControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_segmentedControl, a3);
    -[SUUIScrollingSegmentedControllerNavigationBarTitleView addSubview:](self, "addSubview:", *p_segmentedControl);
    v5 = v9;
  }

}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[SUUIScrollingSegmentedControllerNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (SUUIInteractiveSegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (double)segmentedControlMinimumHeight
{
  return self->_segmentedControlMinimumHeight;
}

- (void)setSegmentedControlMinimumHeight:(double)a3
{
  self->_segmentedControlMinimumHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
