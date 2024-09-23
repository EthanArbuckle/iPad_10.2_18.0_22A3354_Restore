@implementation DockedPlaceholderView

- (DockedPlaceholderView)initWithFrame:(CGRect)a3
{
  DockedPlaceholderView *v3;
  void *v4;
  void *v5;
  void *v6;
  DockedHeaderView *v7;
  DockedHeaderView *headerView;
  void *v9;
  id v10;
  UIView *v11;
  UIView *roundedBackgroundView;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  UIView *v17;
  UIView *overlayView;
  void *v19;
  CALayer *v20;
  CALayer *dimmingLayer;
  double v22;
  id v23;
  void *v24;
  uint64_t v25;
  objc_super v27;
  CGRect v28;

  v27.receiver = self;
  v27.super_class = (Class)DockedPlaceholderView;
  v3 = -[DockedPlaceholderView initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceLevel:](UITraitCollection, "traitCollectionWithUserInterfaceLevel:", 1));
    -[DockedPlaceholderView _setLocalOverrideTraitCollection:](v3, "_setLocalOverrideTraitCollection:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView layer](v3, "layer"));
    objc_msgSend(v5, "setShadowOffset:", CGSizeZero.width, CGSizeZero.height);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView layer](v3, "layer"));
    objc_msgSend(v6, "setAllowsGroupOpacity:", 1);

    v3->_falseShadowEdge = 0;
    -[DockedPlaceholderView bounds](v3, "bounds");
    v7 = -[DockedHeaderView initWithFrame:]([DockedHeaderView alloc], "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v28), 50.0);
    headerView = v3->_headerView;
    v3->_headerView = v7;

    -[DockedHeaderView setAutoresizingMask:](v3->_headerView, "setAutoresizingMask:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView headerView](v3, "headerView"));
    -[DockedPlaceholderView addSubview:](v3, "addSubview:", v9);

    v10 = objc_alloc((Class)UIView);
    -[DockedPlaceholderView bounds](v3, "bounds");
    v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
    roundedBackgroundView = v3->_roundedBackgroundView;
    v3->_roundedBackgroundView = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v3->_roundedBackgroundView, "setBackgroundColor:", v13);

    -[UIView setAutoresizingMask:](v3->_roundedBackgroundView, "setAutoresizingMask:", 18);
    -[UIView setClipsToBounds:](v3->_roundedBackgroundView, "setClipsToBounds:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_roundedBackgroundView, "layer"));
    objc_msgSend(v14, "setMaskedCorners:", 10);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_roundedBackgroundView, "layer"));
    objc_msgSend(v15, "setAllowsGroupOpacity:", 1);

    -[DockedPlaceholderView insertSubview:below:](v3, "insertSubview:below:", v3->_roundedBackgroundView, v3->_headerView);
    v16 = objc_alloc((Class)UIView);
    -[DockedPlaceholderView bounds](v3, "bounds");
    v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
    overlayView = v3->_overlayView;
    v3->_overlayView = v17;

    -[UIView setAutoresizingMask:](v3->_overlayView, "setAutoresizingMask:", 18);
    -[UIView setClipsToBounds:](v3->_overlayView, "setClipsToBounds:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_overlayView, "layer"));
    objc_msgSend(v19, "setAllowsGroupOpacity:", 1);

    v20 = (CALayer *)objc_alloc_init((Class)CALayer);
    dimmingLayer = v3->_dimmingLayer;
    v3->_dimmingLayer = v20;

    LODWORD(v22) = 0;
    -[CALayer setOpacity:](v3->_dimmingLayer, "setOpacity:", v22);
    -[CALayer setAllowsGroupOpacity:](v3->_dimmingLayer, "setAllowsGroupOpacity:", 1);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor _dimmingViewColor](UIColor, "_dimmingViewColor")));
    -[CALayer setBackgroundColor:](v3->_dimmingLayer, "setBackgroundColor:", objc_msgSend(v23, "CGColor"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_overlayView, "layer"));
    objc_msgSend(v24, "addSublayer:", v3->_dimmingLayer);

    -[DockedPlaceholderView insertSubview:above:](v3, "insertSubview:above:", v3->_overlayView, v3->_headerView);
    objc_msgSend((id)objc_opt_class(v3, v25), "defaultCornerRadius");
    -[DockedPlaceholderView setCornerRadius:](v3, "setCornerRadius:");
    v3->_shadowVisible = 1;
    v3->_shadowOpacity = 0.2;
    v3->_shadowRadius = 3.0;
    -[DockedPlaceholderView _updateShadow](v3, "_updateShadow");
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
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
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[DockedPlaceholderView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)DockedPlaceholderView;
  -[DockedPlaceholderView setFrame:](&v20, "setFrame:", x, y, width, height);
  -[DockedPlaceholderView frame](self, "frame");
  -[DockedPlaceholderView _updateShadowPathIfNeededForChangeFromRect:toRect:](self, "_updateShadowPathIfNeededForChangeFromRect:toRect:", v9, v11, v13, v15, v16, v17, v18, v19);
}

- (void)setBounds:(CGRect)a3
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
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[DockedPlaceholderView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)DockedPlaceholderView;
  -[DockedPlaceholderView setBounds:](&v20, "setBounds:", x, y, width, height);
  -[DockedPlaceholderView bounds](self, "bounds");
  -[DockedPlaceholderView _updateShadowPathIfNeededForChangeFromRect:toRect:](self, "_updateShadowPathIfNeededForChangeFromRect:toRect:", v9, v11, v13, v15, v16, v17, v18, v19);
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  DockedPlaceholderView *v6;
  void *v7;
  double v8;
  double v9;
  CGFloat v10;
  double Width;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)DockedPlaceholderView;
  -[DockedPlaceholderView layoutSubviews](&v15, "layoutSubviews");
  v3 = objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
    v6 = (DockedPlaceholderView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (v6 == self)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
      -[DockedPlaceholderView bringSubviewToFront:](self, "bringSubviewToFront:", v7);

    }
  }
  -[DockedPlaceholderView cornerRadius](self, "cornerRadius");
  v9 = v8;
  -[DockedPlaceholderView bounds](self, "bounds");
  v10 = CGRectGetHeight(v16) - v9;
  -[DockedPlaceholderView bounds](self, "bounds");
  Width = CGRectGetWidth(v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView roundedBackgroundView](self, "roundedBackgroundView"));
  objc_msgSend(v12, "setFrame:", 0.0, v9, Width, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView headerView](self, "headerView"));
  -[DockedPlaceholderView bringSubviewToFront:](self, "bringSubviewToFront:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView overlayView](self, "overlayView"));
  -[DockedPlaceholderView bringSubviewToFront:](self, "bringSubviewToFront:", v14);

}

- (id)backgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView roundedBackgroundView](self, "roundedBackgroundView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backgroundColor"));

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView roundedBackgroundView](self, "roundedBackgroundView"));
  objc_msgSend(v4, "setBackgroundColor:", v6);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView headerView](self, "headerView"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  v6 = objc_msgSend(v10, "userInterfaceStyle");

  if (v5 != v6)
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor _dimmingViewColor](UIColor, "_dimmingViewColor")));
    v8 = objc_msgSend(v7, "CGColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView dimmingLayer](self, "dimmingLayer"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

  }
}

- (void)setDimmingAmount:(double)a3
{
  float v3;
  double v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView dimmingLayer](self, "dimmingLayer"));
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setOpacity:", v4);

}

- (id)preferredSpringLoadingEffect
{
  TargetedSpringLoadedBlinkEffect *v3;
  void *v4;
  TargetedSpringLoadedBlinkEffect *v5;

  v3 = [TargetedSpringLoadedBlinkEffect alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView overlayView](self, "overlayView"));
  v5 = -[TargetedSpringLoadedBlinkEffect initWithTargetView:](v3, "initWithTargetView:", v4);

  return v5;
}

- (void)setShadowRadius:(double)a3
{
  if (self->_shadowRadius != a3)
  {
    self->_shadowRadius = a3;
    -[DockedPlaceholderView _updateShadow](self, "_updateShadow");
  }
}

- (void)setShadowOpacity:(double)a3
{
  if (self->_shadowOpacity != a3)
  {
    self->_shadowOpacity = a3;
    -[DockedPlaceholderView _updateShadow](self, "_updateShadow");
  }
}

- (void)setFalseShadowEdge:(unint64_t)a3
{
  if (self->_falseShadowEdge != a3)
  {
    self->_falseShadowEdge = a3;
    -[DockedPlaceholderView _updateShadow](self, "_updateShadow");
  }
}

- (void)_updateShadowPathIfNeededForChangeFromRect:(CGRect)a3 toRect:(CGRect)a4
{
  double v5;

  if (!CGRectEqualToRect(a3, a4))
  {
    -[DockedPlaceholderView shadowOpacity](self, "shadowOpacity");
    if (v5 > 0.00000011920929)
      -[DockedPlaceholderView _updateShadow](self, "_updateShadow");
  }
}

- (void)setShadowVisible:(BOOL)a3
{
  if (self->_shadowVisible != a3)
  {
    self->_shadowVisible = a3;
    -[DockedPlaceholderView _updateShadow](self, "_updateShadow");
  }
}

- (void)_updateShadow
{
  void *v3;
  double v4;
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
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  unint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double MinY;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double y;
  double x;
  double height;
  double width;
  id v66;
  _QWORD v67[3];
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  if (-[DockedPlaceholderView falseShadowEdge](self, "falseShadowEdge"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView layer](self, "layer"));
    LODWORD(v4) = 0;
    objc_msgSend(v3, "setShadowOpacity:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView layer](self, "layer"));
    objc_msgSend(v5, "setShadowRadius:", 0.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView layer](self, "layer"));
    objc_msgSend(v6, "setShadowPath:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
    if (v7)
    {
      y = CGRectZero.origin.y;
      x = CGRectZero.origin.x;
      height = CGRectZero.size.height;
      width = CGRectZero.size.width;
    }
    else
    {
      v27 = objc_alloc((Class)MUIGradientView);
      y = CGRectZero.origin.y;
      x = CGRectZero.origin.x;
      height = CGRectZero.size.height;
      width = CGRectZero.size.width;
      v28 = objc_msgSend(v27, "initWithFrame:");
      -[DockedPlaceholderView setFalseEdgeShadowView:](self, "setFalseEdgeShadowView:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      v67[0] = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
      v67[1] = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0));
      v67[2] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 3));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
      objc_msgSend(v33, "setGradientColors:", v32);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
      objc_msgSend(v34, "setLocations:", &off_100018CB0);

    }
    -[DockedPlaceholderView bounds](self, "bounds");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    -[DockedPlaceholderView shadowRadius](self, "shadowRadius");
    v44 = v43;
    v45 = -[DockedPlaceholderView falseShadowEdge](self, "falseShadowEdge");
    v46 = 0;
    v47 = CGPointZero.x;
    v48 = CGPointZero.y;
    v61 = v44 + v44;
    v49 = CGPointZero.x;
    v50 = v48;
    switch(v45)
    {
      case 1uLL:
        v68.origin.x = v36;
        v68.origin.y = v38;
        v68.size.width = v40;
        v68.size.height = v42;
        MinY = CGRectGetMinY(v68);
        v69.origin.x = v36;
        v69.origin.y = v38;
        v69.size.width = v40;
        v69.size.height = v42;
        width = CGRectGetWidth(v69);
        v52 = v61 + MinY;
        v50 = 1.0;
        v47 = 0.5;
        y = v52;
        x = 0.0;
        v46 = 34;
        height = v61;
        v48 = 0.0;
        v49 = 0.5;
        break;
      case 2uLL:
        v70.origin.x = v36;
        v70.origin.y = v38;
        v70.size.width = v40;
        v70.size.height = v42;
        height = CGRectGetHeight(v70);
        v49 = 1.0;
        v48 = 0.5;
        y = 0.0;
        x = -v61;
        v46 = 20;
        width = v61;
        v47 = 0.0;
        goto LABEL_13;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        v71.origin.x = v36;
        v71.origin.y = v38;
        v71.size.width = v40;
        v71.size.height = v42;
        y = CGRectGetMaxY(v71);
        v72.origin.x = v36;
        v72.origin.y = v38;
        v72.size.width = v40;
        v72.size.height = v42;
        width = CGRectGetWidth(v72);
        v48 = 1.0;
        v47 = 0.5;
        x = 0.0;
        v46 = 10;
        height = v61;
        v49 = 0.5;
        v50 = 0.0;
        break;
      case 8uLL:
        v73.origin.x = v36;
        v73.origin.y = v38;
        v73.size.width = v40;
        v73.size.height = v42;
        x = CGRectGetMaxX(v73);
        v74.origin.x = v36;
        v74.origin.y = v38;
        v74.size.width = v40;
        v74.size.height = v42;
        height = CGRectGetHeight(v74);
        v48 = 0.5;
        v47 = 1.0;
        y = 0.0;
        v46 = 17;
        width = v61;
        v49 = 0.0;
LABEL_13:
        v50 = 0.5;
        break;
      default:
        v49 = CGPointZero.x;
        v50 = CGPointZero.y;
        break;
    }
    -[DockedPlaceholderView shadowOpacity](self, "shadowOpacity");
    v54 = v53;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
    objc_msgSend(v55, "setAlpha:", v54);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
    objc_msgSend(v56, "setStartPoint:", v49, v50);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
    objc_msgSend(v57, "setEndPoint:", v47, v48);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
    objc_msgSend(v58, "setFrame:", x, y, width, height);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
    objc_msgSend(v59, "setAutoresizingMask:", v46);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
    -[DockedPlaceholderView addSubview:](self, "addSubview:", v60);

  }
  else
  {
    -[DockedPlaceholderView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[DockedPlaceholderView cornerRadius](self, "cornerRadius");
    v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v16)));
    v17 = objc_msgSend(v66, "CGPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView layer](self, "layer"));
    objc_msgSend(v18, "setShadowPath:", v17);

    v19 = 0.0;
    if (-[DockedPlaceholderView shadowVisible](self, "shadowVisible"))
    {
      -[DockedPlaceholderView shadowOpacity](self, "shadowOpacity");
      v19 = v20;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView layer](self, "layer"));
    *(float *)&v22 = v19;
    objc_msgSend(v21, "setShadowOpacity:", v22);

    -[DockedPlaceholderView shadowRadius](self, "shadowRadius");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView layer](self, "layer"));
    objc_msgSend(v25, "setShadowRadius:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView falseEdgeShadowView](self, "falseEdgeShadowView"));
    objc_msgSend(v26, "removeFromSuperview");

  }
}

+ (double)defaultCornerRadius
{
  double result;

  +[SheetMetrics cornerRadius](SheetMetrics, "cornerRadius");
  return result;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[DockedPlaceholderView updateCornerRadii](self, "updateCornerRadii");
  }
}

- (void)updateCornerRadii
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;

  -[DockedPlaceholderView cornerRadius](self, "cornerRadius");
  v4 = v3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView headerView](self, "headerView"));
  objc_msgSend(v9, "setCornerRadius:", v4);

  -[DockedPlaceholderView cornerRadius](self, "cornerRadius");
  v6 = v5;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView roundedBackgroundView](self, "roundedBackgroundView"));
  objc_msgSend(v10, "_setContinuousCornerRadius:", v6);

  -[DockedPlaceholderView cornerRadius](self, "cornerRadius");
  v8 = v7;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView overlayView](self, "overlayView"));
  objc_msgSend(v11, "_setContinuousCornerRadius:", v8);

}

- (void)installMaskCutoutView:(id)a3
{
  id v4;

  v4 = a3;
  -[DockedPlaceholderView setClipsToBounds:](self, "setClipsToBounds:", 0);
  -[DockedPlaceholderView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");
  -[DockedPlaceholderView addSubview:](self, "addSubview:", v4);

}

- (DockedHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (unint64_t)falseShadowEdge
{
  return self->_falseShadowEdge;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (MUIGradientView)falseEdgeShadowView
{
  return self->_falseEdgeShadowView;
}

- (void)setFalseEdgeShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_falseEdgeShadowView, a3);
}

- (BOOL)wantsFalseEdgeShadow
{
  return self->_wantsFalseEdgeShadow;
}

- (void)setWantsFalseEdgeShadow:(BOOL)a3
{
  self->_wantsFalseEdgeShadow = a3;
}

- (UIView)roundedBackgroundView
{
  return self->_roundedBackgroundView;
}

- (void)setRoundedBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_roundedBackgroundView, a3);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (CALayer)dimmingLayer
{
  return self->_dimmingLayer;
}

- (void)setDimmingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingLayer, a3);
}

- (BOOL)shadowVisible
{
  return self->_shadowVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingLayer, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_roundedBackgroundView, 0);
  objc_storeStrong((id *)&self->_falseEdgeShadowView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
