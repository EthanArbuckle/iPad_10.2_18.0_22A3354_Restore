@implementation MUFeatureDiscoveryAnnotationView

- (MUFeatureDiscoveryAnnotationView)initWithFrame:(CGRect)a3
{
  MUFeatureDiscoveryAnnotationView *v3;
  MUFeatureDiscoveryAnnotationView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUFeatureDiscoveryAnnotationView;
  v3 = -[MUFeatureDiscoveryAnnotationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUFeatureDiscoveryAnnotationView _setupSubviews](v3, "_setupSubviews");
    -[MUFeatureDiscoveryAnnotationView _updateUI](v4, "_updateUI");
  }
  return v4;
}

- (double)arrowHeight
{
  return 13.0;
}

- (double)arrowBase
{
  return 26.0;
}

- (double)arrowOffset
{
  UIView *sourceView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  sourceView = self->_sourceView;
  if (!sourceView)
    return 0.0;
  -[UIView frame](sourceView, "frame");
  v5 = v4;
  -[UIView frame](self->_sourceView, "frame");
  v7 = v5 + v6 * 0.5;
  -[MUFeatureDiscoveryAnnotationView frame](self, "frame");
  v9 = v8;
  -[MUFeatureDiscoveryAnnotationView frame](self, "frame");
  return v7 - (v9 + v10 * 0.5);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUFeatureDiscoveryAnnotationView;
  -[MUFeatureDiscoveryAnnotationView layoutSubviews](&v5, sel_layoutSubviews);
  -[MUFeatureDiscoveryAnnotationView tipMaskView](self, "tipMaskView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUFeatureDiscoveryAnnotationView backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskView:", v3);

  -[MUFeatureDiscoveryAnnotationView _updateShapeLayerPath](self, "_updateShapeLayerPath");
}

- (void)_setupSubviews
{
  _TipMaskView *v3;
  _TipMaskView *tipMaskView;
  UIView *v5;
  UIView *backgroundView;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *topLayoutConstraint;
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
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_TipMaskView);
  tipMaskView = self->_tipMaskView;
  self->_tipMaskView = v3;

  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v5;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUFeatureDiscoveryAnnotationView addSubview:](self, "addSubview:", self->_backgroundView);
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUFeatureDiscoveryAnnotationView topAnchor](self, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLayoutConstraint = self->_topLayoutConstraint;
  self->_topLayoutConstraint = v9;

  v21 = (void *)MEMORY[0x1E0CB3718];
  v22[0] = self->_topLayoutConstraint;
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUFeatureDiscoveryAnnotationView bottomAnchor](self, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUFeatureDiscoveryAnnotationView leadingAnchor](self, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v16;
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUFeatureDiscoveryAnnotationView trailingAnchor](self, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v20);

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[MUFeatureDiscoveryAnnotationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowBubbleIndicator:(BOOL)a3
{
  if (self->_showBubbleIndicator != a3)
  {
    self->_showBubbleIndicator = a3;
    -[MUFeatureDiscoveryAnnotationView _updateUI](self, "_updateUI");
  }
}

- (void)setFloatingIndicator:(BOOL)a3
{
  if (self->_floatingIndicator != a3)
  {
    self->_floatingIndicator = a3;
    -[MUFeatureDiscoveryAnnotationView _updateUI](self, "_updateUI");
  }
}

- (void)_updateUI
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[MUFeatureDiscoveryAnnotationView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUFeatureDiscoveryAnnotationView setBackgroundColor:](self, "setBackgroundColor:", v5);

  -[MUFeatureDiscoveryAnnotationView backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = 0.0;
  if (-[MUFeatureDiscoveryAnnotationView showBubbleIndicator](self, "showBubbleIndicator")
    && -[MUFeatureDiscoveryAnnotationView floatingIndicator](self, "floatingIndicator"))
  {
    -[MUFeatureDiscoveryAnnotationView arrowHeight](self, "arrowHeight");
    v8 = -v9;
    -[MUFeatureDiscoveryAnnotationView setClipsToBounds:](self, "setClipsToBounds:", 0);
  }
  -[NSLayoutConstraint setConstant:](self->_topLayoutConstraint, "setConstant:", v8);
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
  void *v26;
  double v27;
  void *v28;
  void *v29;
  id v30;

  -[MUFeatureDiscoveryAnnotationView backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MUFeatureDiscoveryAnnotationView showBubbleIndicator](self, "showBubbleIndicator"))
  {
    -[MUFeatureDiscoveryAnnotationView arrowHeight](self, "arrowHeight");
    v14 = v7 + v13;
    -[MUFeatureDiscoveryAnnotationView arrowHeight](self, "arrowHeight");
    v16 = v11 - v15;
    -[MUFeatureDiscoveryAnnotationView _upAndDownStartingXLocationForBounds:](self, "_upAndDownStartingXLocationForBounds:", v5, v14, v9, v16);
    v18 = v17;
    -[MUFeatureDiscoveryAnnotationView arrowBase](self, "arrowBase");
    v20 = v18 + v19;
    -[MUFeatureDiscoveryAnnotationView arrowBase](self, "arrowBase");
    v22 = v18 + v21 * 0.5;
    -[MUFeatureDiscoveryAnnotationView arrowHeight](self, "arrowHeight");
    v24 = v14 - v23;
    -[MUFeatureDiscoveryAnnotationView cornerRadius](self, "cornerRadius");
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v5, v14, v9, v16, v25, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUFeatureDiscoveryAnnotationView _addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:](self, "_addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:", v26, 1, v18, v14, v20, v14, v22, v24);
  }
  else
  {
    -[MUFeatureDiscoveryAnnotationView cornerRadius](self, "cornerRadius");
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v5, v7, v9, v11, v27, v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MUFeatureDiscoveryAnnotationView tipMaskView](self, "tipMaskView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_retainAutorelease(v26);
  objc_msgSend(v29, "setPath:", objc_msgSend(v30, "CGPath"));

}

- (double)_upAndDownStartingXLocationForBounds:(CGRect)a3
{
  double width;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;

  width = a3.size.width;
  x = a3.origin.x;
  -[MUFeatureDiscoveryAnnotationView arrowBase](self, "arrowBase", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  v8 = x + width - v6;
  -[MUFeatureDiscoveryAnnotationView arrowOffset](self, "arrowOffset");
  return fmin(fmax(x, x + width * 0.5 + v9 - v7 * 0.5), v8);
}

- (void)_addLineWithSlightTrailingAndLeadingCurveToPath:(id)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 leadingEdge:(BOOL)a6 isVertical:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  double y;
  double x;
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
  id v22;

  v7 = a7;
  v8 = a6;
  y = a5.y;
  x = a5.x;
  v11 = a4.y;
  v12 = a4.x;
  v13 = (a5.x - a4.x) * 0.5;
  v14 = (a5.y - a4.y) * 0.5;
  v22 = a3;
  if (v8)
  {
    v15 = 0.0;
    if (v7)
      v16 = 0.0;
    else
      v16 = v13;
    v17 = v12 - v16;
    if (v7)
      v15 = v14;
    objc_msgSend(v22, "moveToPoint:", v17, v11 - v15);
    objc_msgSend(v22, "addCurveToPoint:controlPoint1:controlPoint2:", v12 + v13, v11 + v14, v12, v11, v12, v11);
    objc_msgSend(v22, "addLineToPoint:", x, y);
  }
  else
  {
    v18 = -0.0;
    if (v7)
      v19 = -0.0;
    else
      v19 = v13;
    v20 = x + v19;
    if (v7)
      v18 = v14;
    v21 = y + v18;
    objc_msgSend(v22, "addLineToPoint:", x - v13, y - v14);
    objc_msgSend(v22, "addCurveToPoint:controlPoint1:controlPoint2:", v20, v21, x, y, x, y);
  }

}

- (void)_addArrowCurveToPath:(id)a3 direction:(unint64_t)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7
{
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v14;
  CGFloat v15;
  id v16;

  y = a7.y;
  x = a7.x;
  v9 = a6.y;
  v10 = a6.x;
  v11 = a5.y;
  v12 = a5.x;
  v14 = a7.x + 2.0;
  v15 = a7.y + 1.0;
  v16 = a3;
  -[MUFeatureDiscoveryAnnotationView _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v16, 1, 0, v10, v9, v14, v15);
  objc_msgSend(v16, "addCurveToPoint:controlPoint1:controlPoint2:", x + -2.0, v15, x, y, x, y);
  -[MUFeatureDiscoveryAnnotationView _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v16, 0, 0, x + -2.0, v15, v12, v11);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUFeatureDiscoveryAnnotationView;
  -[MUFeatureDiscoveryAnnotationView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[MUFeatureDiscoveryAnnotationView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  if (v6 == objc_msgSend(v4, "userInterfaceStyle"))
  {
    -[MUFeatureDiscoveryAnnotationView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = UIContentSizeCategoryCompareToCategory(v8, v9);

    if (v10 == NSOrderedSame)
      goto LABEL_6;
  }
  else
  {

  }
  -[MUFeatureDiscoveryAnnotationView _updateUI](self, "_updateUI");
LABEL_6:

}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)showBubbleIndicator
{
  return self->_showBubbleIndicator;
}

- (BOOL)floatingIndicator
{
  return self->_floatingIndicator;
}

- (_TipMaskView)tipMaskView
{
  return self->_tipMaskView;
}

- (void)setTipMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_tipMaskView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_topLayoutConstraint, 0);
}

@end
