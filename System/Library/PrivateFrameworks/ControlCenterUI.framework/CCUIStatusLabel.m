@implementation CCUIStatusLabel

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    -[CCUIStatusLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CCUIStatusLabel)init
{
  CCUIStatusLabel *v2;
  CCUIStatusLabel *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)CCUIStatusLabel;
  v2 = -[CCUIStatusLabel init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CCUIStatusLabel setTextAlignment:](v2, "setTextAlignment:", 1);
    -[CCUIStatusLabel setNumberOfLines:](v3, "setNumberOfLines:", 2);
    -[CCUIStatusLabel setAdjustsFontSizeToFitWidth:](v3, "setAdjustsFontSizeToFitWidth:", 1);
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[CCUIStatusLabel registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v5, sel__contentSizeCategoryDidChange);

    -[CCUIStatusLabel _contentSizeCategoryDidChange](v3, "_contentSizeCategoryDidChange");
    -[CCUIStatusLabel controlCenterApplyPrimaryContentShadow](v3, "controlCenterApplyPrimaryContentShadow");
    -[CCUIStatusLabel layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShadowPathIsBounds:", 0);

  }
  return v3;
}

- (void)didMoveToWindow
{
  void *v3;
  MTVisualStylingProvider *v4;
  MTVisualStylingProvider *visualStylingProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIStatusLabel;
  -[CCUIStatusLabel didMoveToWindow](&v6, sel_didMoveToWindow);
  -[CCUIStatusLabel window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CCUIStatusLabel visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v4 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    visualStylingProvider = self->_visualStylingProvider;
    if (v4 != visualStylingProvider)
    {
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", self);
      objc_storeStrong((id *)&self->_visualStylingProvider, v4);
      -[CCUIStatusLabel _updateVisualStyling](self, "_updateVisualStyling");
    }

  }
}

- (void)setVerticalAlignment:(unint64_t)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    -[CCUIStatusLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double MinY;
  CGRect rect;
  __objc2_class *v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CCUIEdgeInsetsRTLSwap();
  v9 = x + v8;
  v11 = y + v10;
  v13 = width - (v8 + v12);
  v15 = height - (v10 + v14);
  v16 = -[CCUIStatusLabel verticalAlignment](self, "verticalAlignment");
  if (v16 == 1)
  {
    -[CCUIStatusLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 2, v9, v11, v13, v15);
    v18 = v17;
    rect.origin.x = v17;
    rect.origin.y = v19;
    v21 = v20;
    v23 = v22;
    v29.origin.x = v9;
    v29.origin.y = v11;
    v29.size.width = v13;
    v29.size.height = v15;
    rect.size.width = CGRectGetMinX(v29);
    v30.origin.x = v9;
    v30.origin.y = v11;
    v30.size.width = v13;
    v30.size.height = v15;
    MinY = CGRectGetMinY(v30);
    v31.origin.x = v9;
    v31.origin.y = v11;
    v31.size.width = v13;
    v31.size.height = v15;
    v24 = CGRectGetHeight(v31);
    v32.origin.x = v18;
    v32.origin.y = v21;
    v32.size.width = rect.origin.y;
    v32.size.height = v23;
    v25 = MinY + v24 - CGRectGetHeight(v32);
    v33.origin.x = v9;
    v33.origin.y = v11;
    v33.size.width = v13;
    v33.size.height = v15;
    v13 = CGRectGetWidth(v33);
    v34.origin.x = rect.origin.x;
    v34.origin.y = v21;
    v34.size.width = rect.origin.y;
    v34.size.height = v23;
    v15 = CGRectGetHeight(v34);
    v11 = v25;
    v9 = rect.size.width;
  }
  else if (v16)
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  *(_QWORD *)&rect.size.height = self;
  v28 = CCUIStatusLabel;
  -[CGFloat drawTextInRect:]((objc_super *)&rect.size.height, sel_drawTextInRect_, v9, v11, v13, v15, *(_QWORD *)&MinY);
}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4B08], 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[CCUIStatusLabel setFont:](self, "setFont:", v4);
  -[CCUIStatusLabel setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateVisualStyling
{
  -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self, 0);
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (unint64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end
