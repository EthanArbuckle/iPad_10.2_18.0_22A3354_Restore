@implementation AMSUIPopoverShapeLayerView

- (double)arrowHeight
{
  return 13.0;
}

+ (double)arrowBase
{
  return 26.0;
}

+ (double)cornerRadius
{
  return 13.0;
}

- (AMSUIPopoverShapeLayerView)initWithFrame:(CGRect)a3
{
  AMSUIPopoverShapeLayerView *v3;
  AMSUIPopoverShapeLayerView *v4;
  AMSUIPopoverShapeLayerMaskView *v5;
  AMSUIPopoverShapeLayerMaskView *shapeLayerMaskView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSUIPopoverShapeLayerView;
  v3 = -[AMSUIPopoverShapeLayerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_arrowDirection = -1;
    v3->_shapeLayerPathNeedsUpdate = 1;
    v5 = objc_alloc_init(AMSUIPopoverShapeLayerMaskView);
    shapeLayerMaskView = v4->_shapeLayerMaskView;
    v4->_shapeLayerMaskView = v5;

  }
  return v4;
}

- (double)minNonPinnedOffset
{
  unint64_t v3;
  double result;
  double v5;
  double v6;
  double v7;

  v3 = -[AMSUIPopoverShapeLayerView arrowDirection](self, "arrowDirection");
  if (v3 - 1 < 2)
  {
    -[AMSUIPopoverShapeLayerView bounds](self, "bounds");
    v6 = v7 * 0.5;
    return -(floor(v6) + -13.0 + -15.0);
  }
  if (v3 == 4 || (result = 0.0, v3 == 8))
  {
    -[AMSUIPopoverShapeLayerView bounds](self, "bounds");
    v6 = v5 * 0.5;
    return -(floor(v6) + -13.0 + -15.0);
  }
  return result;
}

- (double)maxNonPinnedOffset
{
  unint64_t v3;
  double result;
  double v5;
  double v6;
  double v7;

  v3 = -[AMSUIPopoverShapeLayerView arrowDirection](self, "arrowDirection");
  if (v3 - 1 < 2)
  {
    -[AMSUIPopoverShapeLayerView bounds](self, "bounds");
    v6 = v7 * 0.5;
    return floor(v6) + -13.0 + -15.0;
  }
  if (v3 == 4 || (result = 0.0, v3 == 8))
  {
    -[AMSUIPopoverShapeLayerView bounds](self, "bounds");
    v6 = v5 * 0.5;
    return floor(v6) + -13.0 + -15.0;
  }
  return result;
}

- (UIEdgeInsets)_shadowInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BEBE158];
  v3 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v4 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v5 = *(double *)(MEMORY[0x24BEBE158] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.0;
}

- (double)_shadowRadius
{
  return 0.0;
}

- (CGSize)_shadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_shadowPath
{
  return 0;
}

- (void)_updateShapeLayerPathIfNeeded
{
  if (self->_shapeLayerPathNeedsUpdate)
  {
    -[AMSUIPopoverShapeLayerView _updateShapeLayerPath](self, "_updateShapeLayerPath");
    self->_shapeLayerPathNeedsUpdate = 0;
  }
}

- (BOOL)wouldPinForOffset:(double)a3
{
  double v4;
  double v6;

  if (a3 >= 0.0)
  {
    -[AMSUIPopoverShapeLayerView maxNonPinnedOffset](self, "maxNonPinnedOffset");
    return v6 < a3;
  }
  else
  {
    -[AMSUIPopoverShapeLayerView minNonPinnedOffset](self, "minNonPinnedOffset");
    return v4 > a3;
  }
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIPopoverShapeLayerView;
  -[AMSUIPopoverShapeLayerView layoutSubviews](&v6, sel_layoutSubviews);
  -[AMSUIPopoverShapeLayerView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  -[AMSUIPopoverShapeLayerView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", 10.0);

  -[AMSUIPopoverShapeLayerView _updateShapeLayerPathIfNeeded](self, "_updateShapeLayerPathIfNeeded");
}

- (void)_updatePathAnimationState
{
  _BOOL8 v2;

  v2 = self->_arrowOffsetWasFlipped || self->_arrowDirectionWasFlipped;
  -[AMSUIPopoverShapeLayerMaskView setDisablePathAnimation:](self->_shapeLayerMaskView, "setDisablePathAnimation:", v2);
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowDirection:(unint64_t)a3
{
  self->_arrowDirectionWasFlipped = -[AMSUIPopoverShapeLayerView arrowDirection](self, "arrowDirection") != a3;
  self->_arrowDirection = a3;
  -[AMSUIPopoverShapeLayerView _updatePathAnimationState](self, "_updatePathAnimationState");
  -[AMSUIPopoverShapeLayerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setNeedsLayout
{
  objc_super v2;

  self->_shapeLayerPathNeedsUpdate = 1;
  v2.receiver = self;
  v2.super_class = (Class)AMSUIPopoverShapeLayerView;
  -[AMSUIPopoverShapeLayerView setNeedsLayout](&v2, sel_setNeedsLayout);
}

- (double)arrowOffset
{
  return self->_arrowOffset;
}

- (void)setArrowOffset:(double)a3
{
  double v5;

  -[AMSUIPopoverShapeLayerView arrowOffset](self, "arrowOffset");
  self->_arrowOffsetWasFlipped = v5 * a3 <= 0.0;
  self->_arrowOffset = a3;
  -[AMSUIPopoverShapeLayerView _updatePathAnimationState](self, "_updatePathAnimationState");
  self->_shapeLayerPathNeedsUpdate = 1;
  -[AMSUIPopoverShapeLayerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_addRoundedRectExcludingTopLeftCornerForPath:(id)a3 bounds:(CGRect)a4
{
  double height;
  double v5;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double width;
  double y;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  v5 = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  v8 = v7;
  v9 = v5 + v7;
  objc_msgSend(v15, "moveToPoint:", x, v5 + v7 + 6.0);
  v10 = v5 + height;
  objc_msgSend(v15, "addLineToPoint:", x, v10 - v8);
  v11 = x + v8;
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + v8, v10 - v8, v8, 3.14159265, 1.57079633);
  v12 = x + width;
  objc_msgSend(v15, "addLineToPoint:", v12 - v8, v10);
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v12 - v8, v10 - v8, v8, 1.57079633, 0.0);
  objc_msgSend(v15, "addLineToPoint:", v12, v9);
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v12 - v8, v9, v8, 0.0, 4.71238898);
  objc_msgSend(v15, "addLineToPoint:", v11 + 26.0 + 6.0, y);

}

- (void)_addLeftRightRoundedRectWithGapForPath:(id)a3 bounds:(CGRect)a4
{
  double height;
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
  double v16;
  double v17;
  double v18;
  double width;
  double v20;
  id v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = a3;
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  v9 = v8;
  v18 = y;
  -[AMSUIPopoverShapeLayerView arrowOffset](self, "arrowOffset");
  v11 = y + height * 0.5 + v10;
  objc_msgSend((id)objc_opt_class(), "arrowBase");
  v13 = v11 - v12 * 0.5;
  v20 = v13;
  objc_msgSend((id)objc_opt_class(), "arrowBase");
  objc_msgSend(v21, "moveToPoint:", x, v13 + v14);
  v15 = y + height;
  v16 = y + height - v9;
  objc_msgSend(v21, "addLineToPoint:", x, v16);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + v9, v16, v9);
  v17 = x + width - v9;
  objc_msgSend(v21, "addLineToPoint:", v17, v15);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v17, v16, v9, 1.57079633, 0.0);
  objc_msgSend(v21, "addLineToPoint:", x + width, v18 + v9);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v17, v18 + v9, v9, 0.0, 4.71238898);
  objc_msgSend(v21, "addLineToPoint:", x + v9 + 26.0 + 6.0, v18);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + v9, v18 + v9, v9, 4.71238898, 3.14159265);
  objc_msgSend(v21, "addLineToPoint:", x, v20);

}

- (void)_addTopBottomRoundedRectWithGapForPath:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
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
  id v21;

  height = a4.size.height;
  width = a4.size.width;
  v19 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = a3;
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  v10 = v9;
  -[AMSUIPopoverShapeLayerView arrowOffset](self, "arrowOffset");
  v12 = x + width * 0.5 + v11;
  objc_msgSend((id)objc_opt_class(), "arrowBase");
  v14 = v12 - v13 * 0.5;
  objc_msgSend((id)objc_opt_class(), "arrowBase");
  v20 = v14 + v15;
  objc_msgSend(v21, "moveToPoint:", v14, y);
  objc_msgSend(v21, "addLineToPoint:", x + v10, y);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + v10, y + v10, v10);
  v16 = y + height;
  v17 = y + height - v10;
  objc_msgSend(v21, "addLineToPoint:", x, v17);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + v10, v17, v10, 3.14159265, 1.57079633);
  v18 = x + v19;
  objc_msgSend(v21, "addLineToPoint:", v18 - v10, v16);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v18 - v10, v17, v10, 1.57079633, 0.0);
  objc_msgSend(v21, "addLineToPoint:", v18, y + v10);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v18 - v10, y + v10, v10, 0.0, 4.71238898);
  objc_msgSend(v21, "addLineToPoint:", v20, y);

}

- (void)_addLeadingPinnedCurveToPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  y = a5.y;
  x = a5.x;
  v7 = a4.origin.y;
  v8 = a4.origin.x;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  v10 = v7 + v9 + 6.0;
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  v12 = fmin(v8 + v11, x);
  objc_msgSend(v13, "moveToPoint:", x, y);
  objc_msgSend(v13, "addLineToPoint:", v12, v7);
  objc_msgSend(v13, "addCurveToPoint:controlPoint1:controlPoint2:", v8, v10, v8, v7, v8, v10);

}

- (void)_addLeadingPinnedCurveToPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  y = a5.y;
  x = a5.x;
  v8 = a4.origin.y;
  v9 = a4.origin.x;
  v14 = a3;
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  v11 = v9 + v10 + 6.0;
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  v13 = fmin(v8 + v12, y);
  objc_msgSend(v14, "addLineToPoint:", v11, v8);
  objc_msgSend(v14, "addCurveToPoint:controlPoint1:controlPoint2:", v9, v13, v9, v8, v9, v13);
  objc_msgSend(v14, "addLineToPoint:", x, y);

}

- (void)_addTopBottomArrowCurveForPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 isPinned:(BOOL)a8
{
  int x_low;
  double y;
  double x;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat width;
  double v23;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;

  x_low = LODWORD(a7.x);
  y = a6.y;
  x = a6.x;
  v11 = a5.y;
  v12 = a5.x;
  width = a4.size.width;
  height = a4.size.height;
  v27 = a4.origin.y;
  v28 = a4.origin.x;
  v29 = a3;
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  v26 = v14;
  if ((x_low & 1) == 0)
    objc_msgSend(v29, "moveToPoint:", x + 6.0, y);
  objc_msgSend(v29, "addCurveToPoint:controlPoint1:controlPoint2:", x + -2.5, y + -2.0, x + -0.5, y, x + -0.5, y, *(_QWORD *)&width, *(_QWORD *)&height);
  objc_msgSend(v29, "addLineToPoint:", v30 + 2.0, v31 + 1.0);
  objc_msgSend(v29, "addCurveToPoint:controlPoint1:controlPoint2:", v30 + -2.0, v31 + 1.0, v30, v31 + -0.5, v30, v31 + -0.5);
  if (!x_low)
  {
    objc_msgSend(v29, "addLineToPoint:", v12 + 2.0, v11 + -2.0);
    v15 = v12 + -0.5;
    v16 = v12 + -6.0;
    v17 = v29;
    v18 = v11;
    v19 = v11;
    v20 = v12 + -0.5;
    v21 = v11;
LABEL_8:
    objc_msgSend(v17, "addCurveToPoint:controlPoint1:controlPoint2:", v16, v18, v15, v19, v20, v21);
    goto LABEL_9;
  }
  if (v12 <= v28 + 1.0)
  {
    objc_msgSend(v29, "addLineToPoint:", v12 + 2.0, v11 + -2.0);
    v19 = v11 + 1.0;
    v18 = v27 + v26 + 6.0;
    v17 = v29;
    v16 = v28;
    v15 = v12;
    v20 = v12;
    v21 = v11 + 1.0;
    goto LABEL_8;
  }
  objc_msgSend(v29, "addLineToPoint:", v12, v11);
  -[AMSUIPopoverShapeLayerView _addLeadingPinnedCurveToPath:bounds:startPoint:](self, "_addLeadingPinnedCurveToPath:bounds:startPoint:", v29, v28, v27, v23, v25, v12, v11);
  objc_msgSend(v29, "addLineToPoint:", v28, v27 + v26 + 6.0);
LABEL_9:

}

- (void)_addLeftRightArrowCurveForPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 isPinned:(BOOL)a8
{
  int x_low;
  double x;
  double v10;
  double v11;
  double height;
  CGFloat width;
  double v14;
  CGFloat v15;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double y;
  id v23;
  double v24;
  double v25;

  x_low = LODWORD(a7.x);
  y = a6.y;
  x = a6.x;
  v10 = a5.y;
  v11 = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v14 = a4.origin.y;
  v15 = a4.origin.x;
  v17 = a3;
  v23 = v17;
  if (x_low)
  {
    v18 = v15;
    v19 = width;
    v21 = v24;
    v20 = y;
    if (v10 <= v14 + 1.0)
    {
      objc_msgSend(v17, "addLineToPoint:", v11 + 2.0, v10, v19);
      objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", v11 + -2.0, v10 + 2.0, v11, v10 + 1.0, v11, v10 + 1.0);
    }
    else
    {
      -[AMSUIPopoverShapeLayerView _addLeadingPinnedCurveToPath:bounds:startPoint:endPoint:](self, "_addLeadingPinnedCurveToPath:bounds:startPoint:endPoint:", v17, v18, v14, v19, height, v11, v10, x, y);
    }
  }
  else
  {
    objc_msgSend(v17, "moveToPoint:", v11, fmax(v10 + -6.0, 0.0));
    objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", v11 + -1.5, v10 + 3.0, v11, v10 + 0.5, v11, v10 + 0.5);
    v21 = v24;
    v20 = y;
  }
  objc_msgSend(v23, "addLineToPoint:", v21 + 1.0, v25 + -2.0);
  objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", v21 + 1.0, v25 + 2.0, v21 + -0.5, v25, v21 + -0.5, v25);
  objc_msgSend(v23, "addLineToPoint:", x + -1.5, v20 + -3.0);
  objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", x, v20 + 6.0, x, v20 + 0.5, x, v20 + 0.5);

}

- (double)_upAndDownStartingXLocationForBounds:(CGRect)a3
{
  double width;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  width = a3.size.width;
  x = a3.origin.x;
  objc_msgSend((id)objc_opt_class(), "arrowBase");
  v7 = v6 * 0.5;
  objc_msgSend((id)objc_opt_class(), "arrowBase");
  v9 = x + width - v8;
  -[AMSUIPopoverShapeLayerView arrowOffset](self, "arrowOffset");
  return fmin(fmax(x, x + width * 0.5 - fabs(v10) - v7), v9);
}

- (double)_leftAndRightStartYLocationForBounds:(CGRect)a3
{
  double height;
  double y;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a3.size.height;
  y = a3.origin.y;
  v6 = a3.origin.y + a3.size.height;
  objc_msgSend((id)objc_opt_class(), "arrowBase");
  v8 = v6 - v7;
  -[AMSUIPopoverShapeLayerView arrowOffset](self, "arrowOffset");
  v10 = y + height * 0.5 - fabs(v9);
  objc_msgSend((id)objc_opt_class(), "arrowBase");
  return fmin(fmax(y, v10 - v11 * 0.5), v8);
}

- (void)_updateShapeLayerPath
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _BOOL8 v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;

  -[AMSUIPopoverShapeLayerView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUsesEvenOddFillRule:", 1);
  -[AMSUIPopoverShapeLayerView arrowOffset](self, "arrowOffset");
  v13 = -[AMSUIPopoverShapeLayerView wouldPinForOffset:](self, "wouldPinForOffset:");
  v14 = -[AMSUIPopoverShapeLayerView arrowDirection](self, "arrowDirection");
  if (v14 - 1 < 2)
  {
    -[AMSUIPopoverShapeLayerView arrowHeight](self, "arrowHeight");
    v21 = v7 + v20;
    -[AMSUIPopoverShapeLayerView arrowHeight](self, "arrowHeight");
    v23 = v11 - v22;
    if (v13)
      -[AMSUIPopoverShapeLayerView _addRoundedRectExcludingTopLeftCornerForPath:bounds:](self, "_addRoundedRectExcludingTopLeftCornerForPath:bounds:", v12, v5, v21, v9, v23);
    else
      -[AMSUIPopoverShapeLayerView _addTopBottomRoundedRectWithGapForPath:bounds:](self, "_addTopBottomRoundedRectWithGapForPath:bounds:", v12, v5, v21, v9, v23);
    -[AMSUIPopoverShapeLayerView _upAndDownStartingXLocationForBounds:](self, "_upAndDownStartingXLocationForBounds:", v5, v21, v9, v23);
    v39 = v38;
    objc_msgSend((id)objc_opt_class(), "arrowBase");
    v41 = v39 + v40;
    objc_msgSend((id)objc_opt_class(), "arrowBase");
    v43 = v39 + v42 * 0.5;
    -[AMSUIPopoverShapeLayerView arrowHeight](self, "arrowHeight");
    -[AMSUIPopoverShapeLayerView _addTopBottomArrowCurveForPath:bounds:startPoint:endPoint:peakPoint:isPinned:](self, "_addTopBottomArrowCurveForPath:bounds:startPoint:endPoint:peakPoint:isPinned:", v12, v13, v5, v21, v9, v23, v39, v21, v41, v21, *(_QWORD *)&v43, v21 - v44);
    v52 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v54 = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v60.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v60.c = v52;
    v50 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)&v60.tx = v50;
    -[AMSUIPopoverShapeLayerView arrowOffset](self, "arrowOffset");
    if (v45 >= 0.0)
    {
      *(_OWORD *)&v58.a = v54;
      *(_OWORD *)&v58.c = v52;
      *(_OWORD *)&v58.tx = v50;
      CGAffineTransformScale(&v59, &v58, -1.0, 1.0);
      CGAffineTransformTranslate(&v60, &v59, -v9, 0.0);
    }
    if (-[AMSUIPopoverShapeLayerView arrowDirection](self, "arrowDirection") == 2)
    {
      v58 = v60;
      CGAffineTransformScale(&v57, &v58, 1.0, -1.0);
      -[AMSUIPopoverShapeLayerView arrowHeight](self, "arrowHeight");
      CGAffineTransformTranslate(&v58, &v57, 0.0, -v23 - v46);
      v60 = v58;
    }
    v58 = v60;
    objc_msgSend(v12, "applyTransform:", &v58);
  }
  else if (v14 == 4 || v14 == 8)
  {
    -[AMSUIPopoverShapeLayerView arrowHeight](self, "arrowHeight");
    v16 = v5 + v15;
    -[AMSUIPopoverShapeLayerView arrowHeight](self, "arrowHeight");
    v18 = v9 - v17;
    objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[AMSUIPopoverShapeLayerView _addRoundedRectExcludingTopLeftCornerForPath:bounds:](self, "_addRoundedRectExcludingTopLeftCornerForPath:bounds:", v19, v16, v7, v18, v11);
    else
      -[AMSUIPopoverShapeLayerView _addLeftRightRoundedRectWithGapForPath:bounds:](self, "_addLeftRightRoundedRectWithGapForPath:bounds:", v19, v16, v7, v18, v11);
    -[AMSUIPopoverShapeLayerView _leftAndRightStartYLocationForBounds:](self, "_leftAndRightStartYLocationForBounds:", v16, v7, v18, v11);
    v30 = v29;
    objc_msgSend((id)objc_opt_class(), "arrowBase");
    v32 = v30 + v31;
    objc_msgSend((id)objc_opt_class(), "arrowBase");
    v34 = v30 + v33 * 0.5;
    -[AMSUIPopoverShapeLayerView arrowHeight](self, "arrowHeight");
    -[AMSUIPopoverShapeLayerView _addLeftRightArrowCurveForPath:bounds:startPoint:endPoint:peakPoint:isPinned:](self, "_addLeftRightArrowCurveForPath:bounds:startPoint:endPoint:peakPoint:isPinned:", v19, v13, v16, v7, v18, v11, v16, v30, v16, v32, v16 - v35, *(_QWORD *)&v34);
    v51 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v53 = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v60.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v60.c = v51;
    v49 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)&v60.tx = v49;
    -[AMSUIPopoverShapeLayerView arrowOffset](self, "arrowOffset");
    if (v36 >= 0.0)
    {
      *(_OWORD *)&v58.a = v53;
      *(_OWORD *)&v58.c = v51;
      *(_OWORD *)&v58.tx = v49;
      CGAffineTransformScale(&v56, &v58, 1.0, -1.0);
      CGAffineTransformTranslate(&v60, &v56, 0.0, -v11);
    }
    if (-[AMSUIPopoverShapeLayerView arrowDirection](self, "arrowDirection") == 8)
    {
      -[AMSUIPopoverShapeLayerView arrowHeight](self, "arrowHeight");
      v58 = v60;
      CGAffineTransformTranslate(&v55, &v58, v18 + v37, 0.0);
      CGAffineTransformScale(&v58, &v55, -1.0, 1.0);
      v60 = v58;
    }
    v58 = v60;
    objc_msgSend(v19, "applyTransform:", &v58);
    v12 = v19;
  }
  else
  {
    -[AMSUIPopoverShapeLayerView arrowHeight](self, "arrowHeight");
    v25 = v11 - v24;
    v26 = (void *)MEMORY[0x24BEBD420];
    objc_msgSend((id)objc_opt_class(), "cornerRadius");
    objc_msgSend(v26, "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v25, v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v28;
  }
  -[AMSUIPopoverShapeLayerMaskView layer](self->_shapeLayerMaskView, "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_retainAutorelease(v12);
  objc_msgSend(v47, "setPath:", objc_msgSend(v48, "CGPath"));

}

- (void)_loadNecessaryViews
{
  void *v3;
  AMSUIPopoverShapeLayerMaskView *shapeLayerMaskView;
  void *v5;

  -[AMSUIPopoverShapeLayerView viewToMaskWhenContentExtendsOverArrow](self, "viewToMaskWhenContentExtendsOverArrow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  shapeLayerMaskView = self->_shapeLayerMaskView;
  if (v3)
  {
    -[AMSUIPopoverShapeLayerView viewToMaskWhenContentExtendsOverArrow](self, "viewToMaskWhenContentExtendsOverArrow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaskView:", shapeLayerMaskView);

  }
  else
  {
    -[AMSUIPopoverShapeLayerView setMaskView:](self, "setMaskView:", self->_shapeLayerMaskView);
  }
  -[AMSUIPopoverShapeLayerView _updateShapeLayerPathIfNeeded](self, "_updateShapeLayerPathIfNeeded");
}

- (void)didMoveToWindow
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUIPopoverShapeLayerView;
  -[AMSUIPopoverShapeLayerView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[AMSUIPopoverShapeLayerView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __45__AMSUIPopoverShapeLayerView_didMoveToWindow__block_invoke;
    v4[3] = &unk_24CB4F0E8;
    v4[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v4);
  }
}

uint64_t __45__AMSUIPopoverShapeLayerView_didMoveToWindow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadNecessaryViews");
}

- (UIView)viewToMaskWhenContentExtendsOverArrow
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_viewToMaskWhenContentExtendsOverArrow);
}

- (void)setViewToMaskWhenContentExtendsOverArrow:(id)a3
{
  objc_storeWeak((id *)&self->_viewToMaskWhenContentExtendsOverArrow, a3);
}

- (BOOL)shapeLayerPathNeedsUpdate
{
  return self->_shapeLayerPathNeedsUpdate;
}

- (void)setShapeLayerPathNeedsUpdate:(BOOL)a3
{
  self->_shapeLayerPathNeedsUpdate = a3;
}

- (BOOL)popoverBackgroundColorIsOpaque
{
  return self->_popoverBackgroundColorIsOpaque;
}

- (void)setPopoverBackgroundColorIsOpaque:(BOOL)a3
{
  self->_popoverBackgroundColorIsOpaque = a3;
}

- (BOOL)arrowVisible
{
  return self->_arrowVisible;
}

- (void)setArrowVisible:(BOOL)a3
{
  self->_arrowVisible = a3;
}

- (BOOL)arrowOffsetWasFlipped
{
  return self->_arrowOffsetWasFlipped;
}

- (void)setArrowOffsetWasFlipped:(BOOL)a3
{
  self->_arrowOffsetWasFlipped = a3;
}

- (BOOL)arrowDirectionWasFlipped
{
  return self->_arrowDirectionWasFlipped;
}

- (void)setArrowDirectionWasFlipped:(BOOL)a3
{
  self->_arrowDirectionWasFlipped = a3;
}

- (AMSUIPopoverShapeLayerMaskView)shapeLayerMaskView
{
  return (AMSUIPopoverShapeLayerMaskView *)objc_getProperty(self, a2, 448, 1);
}

- (void)setShapeLayerMaskView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayerMaskView, 0);
  objc_destroyWeak((id *)&self->_viewToMaskWhenContentExtendsOverArrow);
}

@end
