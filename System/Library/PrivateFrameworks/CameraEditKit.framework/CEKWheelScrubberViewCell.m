@implementation CEKWheelScrubberViewCell

- (CEKWheelScrubberViewCell)initWithFrame:(CGRect)a3
{
  CEKWheelScrubberViewCell *v3;
  double v4;
  void *v5;
  uint64_t v6;
  UIView *clippingView;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  UIView *itemView;
  id v14;
  uint64_t v15;
  UIView *selectionDotView;
  CEKWheelScrubberViewCell *v17;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)CEKWheelScrubberViewCell;
  v3 = -[CEKWheelScrubberViewCell initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "defaultContentInsetWidth");
    v3->_contentInsetWidth = v4;
    -[CEKWheelScrubberViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    -[CEKWheelScrubberViewCell bounds](v3, "bounds");
    v21 = CGRectInset(v20, v3->_contentInsetWidth, v3->_contentInsetWidth);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    clippingView = v3->__clippingView;
    v3->__clippingView = (UIView *)v6;

    -[UIView setAutoresizingMask:](v3->__clippingView, "setAutoresizingMask:", 18);
    -[UIView setClipsToBounds:](v3->__clippingView, "setClipsToBounds:", 1);
    objc_msgSend(v5, "addSubview:", v3->__clippingView);
    -[UIView bounds](v3->__clippingView, "bounds");
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    itemView = v3->_itemView;
    v3->_itemView = (UIView *)v12;

    -[UIView setAutoresizingMask:](v3->_itemView, "setAutoresizingMask:", 18);
    -[UIView setClipsToBounds:](v3->_itemView, "setClipsToBounds:", 1);
    -[UIView addSubview:](v3->__clippingView, "addSubview:", v3->_itemView);
    v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    selectionDotView = v3->__selectionDotView;
    v3->__selectionDotView = (UIView *)v15;

    objc_msgSend(v5, "addSubview:", v3->__selectionDotView);
    -[CEKWheelScrubberViewCell _updateSelectionDot](v3, "_updateSelectionDot");
    v3->_dotPlacement = 0;
    v17 = v3;

  }
  return v3;
}

- (void)_updateSelectionDot
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[CEKWheelScrubberViewCell isSelected](self, "isSelected"))
    v3 = 1.0;
  else
    v3 = 0.0;
  +[CEKWheelScrubberUtilities dotIndicatorDiameter](CEKWheelScrubberUtilities, "dotIndicatorDiameter");
  v5 = v4;
  +[CEKWheelScrubberUtilities dotIndicatorBackgroundColor](CEKWheelScrubberUtilities, "dotIndicatorBackgroundColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKWheelScrubberViewCell _selectionDotView](self, "_selectionDotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v10);

  -[CEKWheelScrubberViewCell _selectionDotView](self, "_selectionDotView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v5 * 0.5);

  -[CEKWheelScrubberViewCell _selectionDotView](self, "_selectionDotView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v3);

}

- (void)setSelectionDotCenterTopSpacing:(double)a3
{
  if (self->_selectionDotCenterTopSpacing != a3)
  {
    self->_selectionDotCenterTopSpacing = a3;
    -[CEKWheelScrubberViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDotPlacement:(int64_t)a3
{
  if (self->_dotPlacement != a3)
  {
    self->_dotPlacement = a3;
    -[CEKWheelScrubberViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CEKWheelScrubberViewCell isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)CEKWheelScrubberViewCell;
  -[CEKWheelScrubberViewCell setSelected:](&v6, sel_setSelected_, v3);
  if (v5 != v3)
    -[CEKWheelScrubberViewCell _updateSelectionDot](self, "_updateSelectionDot");
}

- (void)setContentInsetWidth:(double)a3
{
  if (self->_contentInsetWidth != a3)
  {
    self->_contentInsetWidth = a3;
    -[CEKWheelScrubberViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOverlayView:(id)a3
{
  UIView *v5;
  UIView *overlayView;
  UIView *v7;

  v5 = (UIView *)a3;
  overlayView = self->_overlayView;
  if (overlayView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](overlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_overlayView, a3);
    -[CEKWheelScrubberViewCell addSubview:](self, "addSubview:", self->_overlayView);
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double x;
  double y;
  double width;
  double height;
  void *v17;
  double v18;
  double v19;
  int64_t v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double MidX;
  double MidY;
  void *v33;
  CGFloat v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v35.receiver = self;
  v35.super_class = (Class)CEKWheelScrubberViewCell;
  -[CEKWheelScrubberViewCell layoutSubviews](&v35, sel_layoutSubviews);
  -[CEKWheelScrubberViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CEKWheelScrubberViewCell contentInsetWidth](self, "contentInsetWidth");
  v12 = v11;
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  v37 = CGRectInset(v36, v12, v12);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  -[CEKWheelScrubberViewCell _clippingView](self, "_clippingView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = x;
  objc_msgSend(v17, "setFrame:", x, y, width, height);

  +[CEKWheelScrubberUtilities dotIndicatorDiameter](CEKWheelScrubberUtilities, "dotIndicatorDiameter");
  v19 = v18;
  -[CEKWheelScrubberViewCell selectionDotCenterTopSpacing](self, "selectionDotCenterTopSpacing");
  v20 = -[CEKWheelScrubberViewCell dotPlacement](self, "dotPlacement");
  if (v20 == 2 || v20 == 1)
  {
    v40.origin.x = v4;
    v40.origin.y = v6;
    v40.size.width = v8;
    v40.size.height = v10;
    CGRectGetMidX(v40);
    UIRoundToViewScale();
    v25 = v26;
    v23 = v34;
    v41.origin.x = v34;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    CGRectGetMinX(v41);
    UIRoundToViewScale();
    v22 = v27;
  }
  else if (v20)
  {
    v22 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v23 = v34;
  }
  else
  {
    v38.origin.x = v4;
    v38.origin.y = v6;
    v38.size.width = v8;
    v38.size.height = v10;
    CGRectGetMidX(v38);
    UIRoundToViewScale();
    v22 = v21;
    v23 = v34;
    v39.origin.x = v34;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    CGRectGetMinY(v39);
    UIRoundToViewScale();
    v25 = v24;
  }
  -[CEKWheelScrubberViewCell _selectionDotView](self, "_selectionDotView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v22, v25, v19, v19);

  -[CEKWheelScrubberViewCell overlayView](self, "overlayView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[CEKWheelScrubberViewCell overlayView](self, "overlayView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBounds:", 0.0, 0.0, width, height);

    v42.origin.x = v23;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    MidX = CGRectGetMidX(v42);
    v43.origin.x = v23;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    MidY = CGRectGetMidY(v43);
    -[CEKWheelScrubberViewCell overlayView](self, "overlayView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCenter:", MidX, MidY);

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CEKWheelScrubberViewCell;
  -[CEKWheelScrubberViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CEKWheelScrubberViewCell setOverlayView:](self, "setOverlayView:", 0);
}

+ (double)defaultContentInsetWidth
{
  return 1.0;
}

+ (CGSize)defaultContentSize
{
  int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = CEKIsSmallPhone();
  v3 = 52.0;
  if (v2)
    v3 = 41.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)defaultSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(a1, "defaultContentInsetWidth");
  v4 = v3;
  objc_msgSend(a1, "defaultContentSize");
  v6 = v5 + v4 * 2.0;
  v8 = v7 + v4 * 2.0;
  result.height = v8;
  result.width = v6;
  return result;
}

+ (CGSize)defaultScreenScaleContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(a1, "defaultContentSize");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)contentInsetWidth
{
  return self->_contentInsetWidth;
}

- (UIView)itemView
{
  return self->_itemView;
}

- (double)selectionDotCenterTopSpacing
{
  return self->_selectionDotCenterTopSpacing;
}

- (int64_t)dotPlacement
{
  return self->_dotPlacement;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIView)_selectionDotView
{
  return self->__selectionDotView;
}

- (UIView)_clippingView
{
  return self->__clippingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clippingView, 0);
  objc_storeStrong((id *)&self->__selectionDotView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end
