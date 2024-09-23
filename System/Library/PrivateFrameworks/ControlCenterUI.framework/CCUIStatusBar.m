@implementation CCUIStatusBar

- (CCUIStatusBar)initWithFrame:(CGRect)a3
{
  CCUIStatusBar *v3;
  CCUIStatusBar *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_class *v13;
  uint64_t v14;
  UIStatusBar *compactTrailingStatusBar;
  void *v16;
  void *v17;
  UIStatusBar *v18;
  void *v19;
  uint64_t v20;
  UIStatusBar *expandedStatusBar;
  void *v22;
  void *v23;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)CCUIStatusBar;
  v3 = -[CCUIStatusBar initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CCUIStatusBar bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (objc_class *)objc_msgSend((id)objc_opt_class(), "statusBarClass");
    v14 = objc_msgSend([v13 alloc], "initWithFrame:showForegroundView:", 1, v6, v8, v10, v12);
    compactTrailingStatusBar = v4->_compactTrailingStatusBar;
    v4->_compactTrailingStatusBar = (UIStatusBar *)v14;

    CCUIStatusBarForStatusBar(v4->_compactTrailingStatusBar);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTargetScreen:", v17);

    v18 = v4->_compactTrailingStatusBar;
    v26[0] = *MEMORY[0x1E0DC5A10];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBar setEnabledPartIdentifiers:](v18, "setEnabledPartIdentifiers:", v19);

    -[CCUIStatusBar addSubview:](v4, "addSubview:", v4->_compactTrailingStatusBar);
    v20 = objc_msgSend([v13 alloc], "initWithFrame:showForegroundView:", 1, v6, v8, v10, v12);
    expandedStatusBar = v4->_expandedStatusBar;
    v4->_expandedStatusBar = (UIStatusBar *)v20;

    CCUIStatusBarForStatusBar(v4->_expandedStatusBar);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTargetScreen:", v23);

    -[UIStatusBar requestStyle:animated:](v4->_expandedStatusBar, "requestStyle:animated:", 1, 0);
    -[UIStatusBar setMode:](v4->_expandedStatusBar, "setMode:", 1);
    -[CCUIStatusBar addSubview:](v4, "addSubview:", v4->_expandedStatusBar);
    -[CCUIStatusBar setCompactTrailingAlpha:](v4, "setCompactTrailingAlpha:", 1.0);
  }
  return v4;
}

+ (Class)statusBarClass
{
  CCUIStatusBarIsSpeakeasy();
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)prepareForPresentation
{
  self->_needsUpdatedMetrics = 1;
}

- (void)_updateMetricsIfNeeded
{
  uint64_t v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double MaxX;
  double MaxY;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  double v36;
  double MinX;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat rect;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  if (self->_needsUpdatedMetrics)
  {
    -[UIStatusBar setNeedsLayout](self->_compactTrailingStatusBar, "setNeedsLayout");
    -[UIStatusBar layoutIfNeeded](self->_compactTrailingStatusBar, "layoutIfNeeded");
    -[UIStatusBar setNeedsLayout](self->_expandedStatusBar, "setNeedsLayout");
    -[UIStatusBar layoutIfNeeded](self->_expandedStatusBar, "layoutIfNeeded");
    v3 = *MEMORY[0x1E0DC59F0];
    -[UIStatusBar frameForPartWithIdentifier:](self->_compactTrailingStatusBar, "frameForPartWithIdentifier:", *MEMORY[0x1E0DC59F0]);
    x = v63.origin.x;
    y = v63.origin.y;
    width = v63.size.width;
    height = v63.size.height;
    if (CGRectIsNull(v63))
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    -[UIStatusBar frameForPartWithIdentifier:](self->_expandedStatusBar, "frameForPartWithIdentifier:", v3);
    v60 = v9;
    v61 = v8;
    v58 = v10;
    rect = v11;
    -[UIStatusBar bounds](self->_compactTrailingStatusBar, "bounds");
    v13 = v12;
    v15 = v14;
    v56 = v16;
    v57 = v14;
    v18 = v17;
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v55 = height;
    v19 = width;
    v20 = y;
    MaxX = CGRectGetMaxX(v64);
    v65.origin.x = v13;
    v65.origin.y = v15;
    v65.size.width = v56;
    v65.size.height = v18;
    v59 = MaxX / CGRectGetWidth(v65);
    v66.origin.x = x;
    v66.origin.y = v20;
    v66.size.width = v19;
    v66.size.height = height;
    MaxY = CGRectGetMaxY(v66);
    v67.origin.x = v13;
    v67.origin.y = v57;
    v67.size.width = v56;
    v67.size.height = v18;
    v23 = MaxY / CGRectGetHeight(v67);
    -[UIStatusBar layer](self->_compactTrailingStatusBar, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    v26 = x;
    v27 = v19;
    v28 = v55;
    objc_msgSend(v24, "setAnchorPoint:", v59, v25);

    v29 = rect;
    if (!self->_preparedMarginDelta)
    {
      -[UIStatusBar bounds](self->_expandedStatusBar, "bounds");
      v53 = v31;
      v54 = v30;
      v51 = v33;
      v52 = v32;
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "userInterfaceLayoutDirection");

      if (v35 == 1)
      {
        v68.origin.x = x;
        v68.origin.y = v20;
        v68.size.width = v27;
        v36 = v55;
        v68.size.height = v55;
        MinX = CGRectGetMinX(v68);
        v69.size.width = v60;
        v69.origin.x = v61;
        v69.origin.y = v58;
        v69.size.height = rect;
        v38 = CGRectGetMinX(v69);
      }
      else
      {
        v70.origin.x = v13;
        v70.origin.y = v57;
        v70.size.width = v56;
        v70.size.height = v18;
        v39 = CGRectGetWidth(v70);
        v71.origin.x = v26;
        v71.origin.y = v20;
        v71.size.width = v27;
        v36 = v55;
        v71.size.height = v55;
        MinX = v39 - CGRectGetMaxX(v71);
        v72.origin.y = v53;
        v72.origin.x = v54;
        v72.size.height = v51;
        v72.size.width = v52;
        v40 = CGRectGetWidth(v72);
        v73.size.width = v60;
        v73.origin.x = v61;
        v73.origin.y = v58;
        v73.size.height = rect;
        v38 = v40 - CGRectGetMaxX(v73);
      }
      self->_trailingMarginDelta = v38 - MinX;
      self->_preparedMarginDelta = 1;
      v28 = v36;
      v29 = rect;
    }
    v41 = v61;
    v42 = v58;
    v43 = v60;
    v44 = CGRectGetMaxY(*(CGRect *)(&v29 - 3));
    v74.origin.x = v26;
    v74.origin.y = v20;
    v74.size.width = v27;
    v74.size.height = v28;
    v45 = v44 - CGRectGetMaxY(v74);
    v46 = 0.0;
    if (self->_alignCompactAndExpandedStatusBars)
      v46 = v45;
    self->_verticalBatteryAlignmentDelta = v46;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v47, "userInterfaceIdiom"))
    {

    }
    else
    {
      v48 = SBFEffectiveHomeButtonType();

      if (v48 != 2)
      {
        v49 = CCUIStatusBarBaselineToBaselineOffsetHeight();
LABEL_17:
        self->_verticalSecondaryServiceDelta = v49;
        v75.origin.x = v61;
        v75.origin.y = v58;
        v75.size.width = v60;
        v75.size.height = rect;
        v50 = CGRectGetHeight(v75);
        v76.origin.x = v26;
        v76.origin.y = v20;
        v76.size.width = v27;
        v76.size.height = v28;
        self->_maxCompactScaleFactor = v50 / CGRectGetHeight(v76);
        self->_needsUpdatedMetrics = 0;
        return;
      }
    }
    v49 = 0.0;
    if (v45 < 0.0)
      v49 = -self->_verticalBatteryAlignmentDelta;
    goto LABEL_17;
  }
}

- (UIStatusBarStyleRequest)compactTrailingStyleRequest
{
  void *v3;
  void *v4;
  void *v5;

  -[CCUIStatusBar delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compactTrailingStyleRequestForStatusBar:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "copy");
  return (UIStatusBarStyleRequest *)v5;
}

- (CGRect)compactAvoidanceFrame
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CCUIStatusBar delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compactAvoidanceFrameForStatusBar:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CCUIStatusBar _updateCompactTrailingStatusBarStyleRequestAndAvoidanceFrame](self, "_updateCompactTrailingStatusBarStyleRequestAndAvoidanceFrame");
    v5 = obj;
  }

}

- (void)setLeadingState:(unint64_t)a3
{
  if (self->_leadingState != a3)
  {
    self->_leadingState = a3;
    -[CCUIStatusBar setNeedsLayout](self, "setNeedsLayout");
    -[CCUIStatusBar layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setTrailingState:(unint64_t)a3
{
  if (self->_trailingState != a3)
  {
    self->_trailingState = a3;
    if (!a3)
    {
      -[CCUIStatusBar _updateCompactTrailingStatusBarStyleRequestAndAvoidanceFrame](self, "_updateCompactTrailingStatusBarStyleRequestAndAvoidanceFrame");
      self->_preparedMarginDelta = 0;
    }
    -[CCUIStatusBar setNeedsLayout](self, "setNeedsLayout");
    -[CCUIStatusBar layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setCompactEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_compactEdgeInsets.left != a3.left
    || self->_compactEdgeInsets.top != a3.top
    || self->_compactEdgeInsets.right != a3.right
    || self->_compactEdgeInsets.bottom != a3.bottom)
  {
    self->_compactEdgeInsets = a3;
    -[CCUIStatusBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setExpandedEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_expandedEdgeInsets.left != a3.left
    || self->_expandedEdgeInsets.top != a3.top
    || self->_expandedEdgeInsets.right != a3.right
    || self->_expandedEdgeInsets.bottom != a3.bottom)
  {
    self->_expandedEdgeInsets = a3;
    -[CCUIStatusBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)leadingAlpha
{
  double result;

  -[UIStatusBar alphaForPartWithIdentifier:](self->_expandedStatusBar, "alphaForPartWithIdentifier:", *MEMORY[0x1E0DC5A08]);
  return result;
}

- (void)setLeadingAlpha:(double)a3
{
  -[UIStatusBar setAlpha:forPartWithIdentifier:](self->_expandedStatusBar, "setAlpha:forPartWithIdentifier:", *MEMORY[0x1E0DC5A08], a3);
}

- (double)compactTrailingAlpha
{
  double result;

  -[UIStatusBar alpha](self->_compactTrailingStatusBar, "alpha");
  return result;
}

- (void)setCompactTrailingAlpha:(double)a3
{
  -[UIStatusBar setAlpha:](self->_compactTrailingStatusBar, "setAlpha:", a3);
}

- (double)expandedTrailingAlpha
{
  double result;

  -[UIStatusBar alphaForPartWithIdentifier:](self->_expandedStatusBar, "alphaForPartWithIdentifier:", *MEMORY[0x1E0DC5A10]);
  return result;
}

- (void)setExpandedTrailingAlpha:(double)a3
{
  -[UIStatusBar setAlpha:forPartWithIdentifier:](self->_expandedStatusBar, "setAlpha:forPartWithIdentifier:", *MEMORY[0x1E0DC5A10], a3);
  -[CCUIStatusBar _updateShadow](self, "_updateShadow");
}

- (int64_t)orientation
{
  return -[UIStatusBar orientation](self->_expandedStatusBar, "orientation");
}

- (void)setOrientation:(int64_t)a3
{
  -[UIStatusBar setOrientation:](self->_expandedStatusBar, "setOrientation:", a3);
}

- (CGAffineTransform)compactScaleTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[12].tx;
  return self;
}

- (void)setCompactScaleTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_compactScaleTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_compactScaleTransform = &self->_compactScaleTransform;
  v6 = *(_OWORD *)&self->_compactScaleTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_compactScaleTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_compactScaleTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_compactScaleTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_compactScaleTransform->tx = v9;
    *(_OWORD *)&p_compactScaleTransform->a = v8;
    -[CCUIStatusBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setExpandedStatusBarTranslation:(double)a3
{
  if (vabdd_f64(self->_expandedStatusBarTranslation, a3) >= 2.22044605e-16)
  {
    self->_expandedStatusBarTranslation = a3;
    -[CCUIStatusBar setNeedsLayout](self, "setNeedsLayout");
  }
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
  double v28;
  double v29;
  double verticalSecondaryServiceDelta;
  double v31;
  double v32;
  double v33;
  UIStatusBar *compactTrailingStatusBar;
  __int128 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unint64_t v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double MinX;
  unint64_t v50;
  void *v51;
  uint64_t v52;
  CGFloat v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  void *v63;
  uint64_t v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double MaxX;
  UIStatusBar *v75;
  __int128 v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  CGFloat rect;
  double v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  objc_super v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v87.receiver = self;
  v87.super_class = (Class)CCUIStatusBar;
  -[CCUIStatusBar layoutSubviews](&v87, sel_layoutSubviews);
  -[CCUIStatusBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  CCUIEdgeInsetsRTLSwap();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  CCUIEdgeInsetsRTLSwap();
  v19 = v4 + v14;
  v83 = v6 + v12;
  v20 = v8 - (v14 + v18);
  v21 = v10 - (v12 + v16);
  v23 = v4 + v22;
  v25 = v8 - (v22 + v24);
  v28 = v10 - (v26 + v27);
  v29 = v6 + v26 - self->_verticalBatteryAlignmentDelta + self->_expandedStatusBarTranslation;
  if (self->_alignCompactAndExpandedStatusBars)
    verticalSecondaryServiceDelta = self->_verticalSecondaryServiceDelta;
  else
    verticalSecondaryServiceDelta = 0.0;
  v31 = v19;
  v32 = v83;
  v33 = v29 - verticalSecondaryServiceDelta;
  compactTrailingStatusBar = self->_compactTrailingStatusBar;
  v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v84 = *MEMORY[0x1E0C9BAA8];
  v85 = v35;
  v86 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIStatusBar setTransform:](compactTrailingStatusBar, "setTransform:", &v84);
  -[UIStatusBar setFrame:](self->_compactTrailingStatusBar, "setFrame:", v31, v83, v20, v21);
  -[UIStatusBar setFrame:](self->_expandedStatusBar, "setFrame:", v23, v33, v25, v28);
  -[CCUIStatusBar _updateMetricsIfNeeded](self, "_updateMetricsIfNeeded");
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    v81 = v33;
    rect = v25;
    v36 = v23;
    v37 = v28;
    v38 = v31;
    v39 = v21;
    v40 = *MEMORY[0x1E0DC51A8];
    v41 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
    v42 = -[CCUIStatusBar leadingState](self, "leadingState");
    v77 = v40;
    v43 = v40;
    v44 = v39;
    v45 = v38;
    v46 = v37;
    v47 = v36;
    v48 = v41;
    if (!v42)
    {
      v88.origin.x = v45;
      v88.origin.y = v83;
      v88.size.width = v20;
      v88.size.height = v44;
      MinX = CGRectGetMinX(v88);
      v89.origin.x = v47;
      v89.origin.y = v81;
      v89.size.width = rect;
      v89.size.height = v46;
      v43 = MinX - CGRectGetMinX(v89);
      v32 = v83;
      v48 = 0.0;
    }
    v80 = v43;
    v50 = -[CCUIStatusBar trailingState](self, "trailingState", *(_QWORD *)&v77);
    v79 = v48;
    if (v50 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "userInterfaceLayoutDirection");

      v65 = v81;
      v66 = v47;
      v67 = rect;
      v68 = v46;
      if (v64 == 1)
      {
        v69 = CGRectGetMinX(*(CGRect *)&v66);
        v91.origin.x = v45;
        v60 = v83;
        v91.origin.y = v83;
        v91.size.width = v20;
        v91.size.height = v44;
        v61 = v69 - CGRectGetMinX(v91) + self->_trailingMarginDelta;
      }
      else
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v66);
        v93.origin.x = v45;
        v60 = v83;
        v93.origin.y = v83;
        v93.size.width = v20;
        v93.size.height = v44;
        v61 = MaxX - CGRectGetMaxX(v93) - self->_trailingMarginDelta;
      }
      v70 = 0.0;
      v62 = v78;
    }
    else if (v50)
    {
      v62 = v78;
      v61 = v78;
      v60 = v32;
      v70 = v41;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "userInterfaceLayoutDirection");

      v53 = v45;
      v54 = v32;
      v55 = v20;
      v56 = v44;
      if (v52 == 1)
      {
        v57 = CGRectGetMinX(*(CGRect *)&v53);
        v58 = v32;
        v59 = v57;
        v90.origin.x = v47;
        v90.origin.y = v81;
        v90.size.width = rect;
        v90.size.height = v46;
        v60 = v58;
        v61 = v78;
        v62 = v59 - CGRectGetMinX(v90) - self->_trailingMarginDelta;
      }
      else
      {
        v71 = CGRectGetMaxX(*(CGRect *)&v53);
        v72 = v32;
        v73 = v71;
        v92.origin.x = v47;
        v92.origin.y = v81;
        v92.size.width = rect;
        v92.size.height = v46;
        v60 = v72;
        v61 = v78;
        v62 = v73 - CGRectGetMaxX(v92) + self->_trailingMarginDelta;
      }
      v70 = v41;
      v41 = 0.0;
    }
    -[UIStatusBar setOffset:forPartWithIdentifier:](self->_expandedStatusBar, "setOffset:forPartWithIdentifier:", *MEMORY[0x1E0DC5A08], v80, v79);
    -[UIStatusBar setOffset:forPartWithIdentifier:](self->_expandedStatusBar, "setOffset:forPartWithIdentifier:", *MEMORY[0x1E0DC5A10], v62, v41);
    v94.origin.x = v45;
    v94.origin.y = v60;
    v94.size.width = v20;
    v94.size.height = v44;
    v95 = CGRectOffset(v94, v61, v70 - self->_verticalSecondaryServiceDelta);
    -[UIStatusBar setFrame:](self->_compactTrailingStatusBar, "setFrame:", v95.origin.x, v95.origin.y, v95.size.width, v95.size.height);
    v75 = self->_compactTrailingStatusBar;
    v76 = *(_OWORD *)&self->_compactScaleTransform.c;
    v84 = *(_OWORD *)&self->_compactScaleTransform.a;
    v85 = v76;
    v86 = *(_OWORD *)&self->_compactScaleTransform.tx;
    -[UIStatusBar setTransform:](v75, "setTransform:", &v84);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIStatusBar *v8;
  void *v9;
  UIStatusBar *expandedStatusBar;
  objc_super v12;
  CGPoint v13;
  CGPoint v14;
  CGRect v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[CCUIStatusBar leadingState](self, "leadingState") != 1
    || (-[UIStatusBar frameForPartWithIdentifier:](self->_expandedStatusBar, "frameForPartWithIdentifier:", *MEMORY[0x1E0DC5A08]), v13.x = x, v13.y = y, !CGRectContainsPoint(v15, v13))|| (v8 = self->_expandedStatusBar, -[CCUIStatusBar convertPoint:toView:](self, "convertPoint:toView:", v8, x, y), -[UIStatusBar hitTest:withEvent:](v8, "hitTest:withEvent:", v7), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (-[CCUIStatusBar trailingState](self, "trailingState") != 1
      || (-[UIStatusBar frameForPartWithIdentifier:](self->_expandedStatusBar, "frameForPartWithIdentifier:", *MEMORY[0x1E0DC5A10]), v14.x = x, v14.y = y, !CGRectContainsPoint(v16, v14))|| (expandedStatusBar = self->_expandedStatusBar, -[CCUIStatusBar convertPoint:toView:](self, "convertPoint:toView:", expandedStatusBar, x, y), -[UIStatusBar hitTest:withEvent:](expandedStatusBar, "hitTest:withEvent:", v7), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v12.receiver = self;
      v12.super_class = (Class)CCUIStatusBar;
      -[CCUIStatusBar hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  v4 = CCUIStatusBarHeight();
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CCUIStatusBar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_updateShadow
{
  void *v3;
  float v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[UIStatusBar _controlCenterApplyPrimaryContentShadow](self->_expandedStatusBar, "_controlCenterApplyPrimaryContentShadow");
  -[UIStatusBar layer](self->_expandedStatusBar, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar layer](self->_expandedStatusBar, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shadowOpacity");
  v5 = v4;
  -[CCUIStatusBar expandedTrailingAlpha](self, "expandedTrailingAlpha");
  v7 = v6 * v5;
  *(float *)&v7 = v7;
  objc_msgSend(v8, "setShadowOpacity:", v7);

}

- (void)controlCenterApplyPrimaryContentShadow
{
  CGPath *Mutable;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  Mutable = CGPathCreateMutable();
  -[UIStatusBar frameForPartWithIdentifier:](self->_expandedStatusBar, "frameForPartWithIdentifier:", *MEMORY[0x1E0DC59F8]);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  if (!CGRectIsNull(v13))
  {
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    CGPathAddRect(Mutable, 0, v14);
  }
  -[UIStatusBar frameForPartWithIdentifier:](self->_expandedStatusBar, "frameForPartWithIdentifier:", *MEMORY[0x1E0DC5A00]);
  v8 = v15.origin.x;
  v9 = v15.origin.y;
  v10 = v15.size.width;
  v11 = v15.size.height;
  if (!CGRectIsNull(v15))
  {
    v16.origin.x = v8;
    v16.origin.y = v9;
    v16.size.width = v10;
    v16.size.height = v11;
    CGPathAddRect(Mutable, 0, v16);
  }
  -[UIStatusBar layer](self->_expandedStatusBar, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowPath:", Mutable);

  CGPathRelease(Mutable);
  -[CCUIStatusBar _updateShadow](self, "_updateShadow");
}

- (void)_updateCompactTrailingStatusBarStyleRequestAndAvoidanceFrame
{
  UIStatusBar *compactTrailingStatusBar;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double x;
  double y;
  double width;
  double height;
  UIStatusBar *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;

  compactTrailingStatusBar = self->_compactTrailingStatusBar;
  -[CCUIStatusBar compactTrailingStyleRequest](self, "compactTrailingStyleRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar setStyleRequest:](compactTrailingStatusBar, "setStyleRequest:", v4);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[CCUIStatusBar compactAvoidanceFrame](self, "compactAvoidanceFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceLayoutDirection");
    -[CCUIStatusBar compactEdgeInsets](self, "compactEdgeInsets");
    if (v16 == 1)
      v19 = v18;
    else
      v19 = v17;
    v20 = -v19;
    v30.origin.x = v8;
    v30.origin.y = v10;
    v30.size.width = v12;
    v30.size.height = v14;
    v31 = CGRectOffset(v30, v20, 0.0);
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;

    v25 = self->_compactTrailingStatusBar;
  }
  else
  {
    v25 = self->_compactTrailingStatusBar;
    -[CCUIStatusBar compactAvoidanceFrame](self, "compactAvoidanceFrame");
    x = v26;
    y = v27;
    width = v28;
    height = v29;
  }
  -[UIStatusBar setAvoidanceFrame:](v25, "setAvoidanceFrame:", x, y, width, height);
}

- (CCUIStatusBarDelegate)delegate
{
  return (CCUIStatusBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)leadingState
{
  return self->_leadingState;
}

- (unint64_t)trailingState
{
  return self->_trailingState;
}

- (UIEdgeInsets)compactEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_compactEdgeInsets.top;
  left = self->_compactEdgeInsets.left;
  bottom = self->_compactEdgeInsets.bottom;
  right = self->_compactEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)expandedEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_expandedEdgeInsets.top;
  left = self->_expandedEdgeInsets.left;
  bottom = self->_expandedEdgeInsets.bottom;
  right = self->_expandedEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)maxCompactScaleFactor
{
  return self->_maxCompactScaleFactor;
}

- (double)verticalSecondaryServiceDelta
{
  return self->_verticalSecondaryServiceDelta;
}

- (double)expandedStatusBarTranslation
{
  return self->_expandedStatusBarTranslation;
}

- (BOOL)alignCompactAndExpandedStatusBars
{
  return self->_alignCompactAndExpandedStatusBars;
}

- (void)setAlignCompactAndExpandedStatusBars:(BOOL)a3
{
  self->_alignCompactAndExpandedStatusBars = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expandedStatusBar, 0);
  objc_storeStrong((id *)&self->_compactTrailingStatusBar, 0);
}

@end
