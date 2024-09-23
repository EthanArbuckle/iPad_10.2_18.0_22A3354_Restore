@implementation MKCalloutSelectionAccessoryView

- (MKCalloutSelectionAccessoryView)initWithSelectionAccessoryView:(id)a3 style:(int64_t)a4 pointerEdge:(int64_t)a5 pointerUnitLocation:(double)a6
{
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  MKCalloutSelectionAccessoryView *v16;
  MKCalloutSelectionAccessoryView *v17;
  uint64_t v18;
  UIColor *borderColor;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  UIColor *fillColor;
  UIColor *v24;
  void *v25;
  CAShapeLayer *v26;
  double v27;
  id v28;
  void *v29;
  CAShapeLayer *shadowLayer;
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
  CAShapeLayer *v61;
  id v62;
  objc_super v63;
  _QWORD v64[10];

  v64[8] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v63.receiver = self;
  v63.super_class = (Class)MKCalloutSelectionAccessoryView;
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16 = -[MKSelectionAccessoryView initWithFrame:](&v63, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v13, v14, v15);
  v17 = v16;
  if (v16)
  {
    v16->_pointerEdge = a5;
    v16->_pointerUnitLocation = a6;
    objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("DeveloperPlaceCardBorderColor"));
    v18 = objc_claimAutoreleasedReturnValue();
    borderColor = v17->_borderColor;
    v17->_borderColor = (UIColor *)v18;

    v62 = v11;
    if (a4 == 2)
    {
      v20 = (void *)MEMORY[0x1E0CEA478];
      v21 = CFSTR("DeveloperPlaceCardCompactBackgroundColor");
    }
    else
    {
      if (a4 != 1)
      {
        v24 = v17->_borderColor;
        fillColor = v17->_fillColor;
        v17->_fillColor = v24;
        goto LABEL_8;
      }
      v20 = (void *)MEMORY[0x1E0CEA478];
      v21 = CFSTR("DeveloperPlaceCardFullBackgroundColor");
    }
    objc_msgSend(v20, "_mapkit_colorNamed:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    fillColor = v17->_fillColor;
    v17->_fillColor = (UIColor *)v22;
LABEL_8:

    -[MKCalloutSelectionAccessoryView layer](v17, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLineWidth:", 1.0);

    v26 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    -[CAShapeLayer setShadowRadius:](v26, "setShadowRadius:", 15.0);
    LODWORD(v27) = 1047904911;
    -[CAShapeLayer setShadowOpacity:](v26, "setShadowOpacity:", v27);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setShadowColor:](v26, "setShadowColor:", objc_msgSend(v28, "CGColor"));

    -[CAShapeLayer setShadowOffset:](v26, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[CAShapeLayer setCornerRadius:](v26, "setCornerRadius:", 14.0);
    -[MKCalloutSelectionAccessoryView layer](v17, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "insertSublayer:atIndex:", v26, 0);

    shadowLayer = v17->_shadowLayer;
    v17->_shadowLayer = v26;
    v61 = v26;

    -[MKCalloutSelectionAccessoryView _updateLayerColors](v17, "_updateLayerColors");
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v12, v13, v14, v15);
    objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCornerRadius:", 14.0);

    objc_msgSend(v31, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMasksToBounds:", 1);

    -[MKCalloutSelectionAccessoryView addSubview:](v17, "addSubview:", v31);
    objc_storeStrong((id *)&v17->_wrappedView, a3);
    -[MKSelectionAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](v17->_wrappedView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKSelectionAccessoryView setPlaceCardContentSizeDelegate:](v17->_wrappedView, "setPlaceCardContentSizeDelegate:", v17);
    objc_msgSend(v31, "addSubview:", v17->_wrappedView);
    v50 = (void *)MEMORY[0x1E0CB3718];
    -[MKSelectionAccessoryView topAnchor](v17->_wrappedView, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v58;
    -[MKSelectionAccessoryView leadingAnchor](v17->_wrappedView, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v55;
    objc_msgSend(v31, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSelectionAccessoryView trailingAnchor](v17->_wrappedView, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v52;
    objc_msgSend(v31, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSelectionAccessoryView bottomAnchor](v17->_wrappedView, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v48;
    objc_msgSend(v31, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCalloutSelectionAccessoryView topAnchor](v17, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 0.5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v64[4] = v45;
    objc_msgSend(v31, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCalloutSelectionAccessoryView leadingAnchor](v17, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 0.5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v64[5] = v34;
    -[MKCalloutSelectionAccessoryView trailingAnchor](v17, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, 0.5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v64[6] = v37;
    -[MKCalloutSelectionAccessoryView bottomAnchor](v17, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 0.5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v64[7] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 8);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "activateConstraints:", v41);

    v11 = v62;
  }

  return v17;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[MKCalloutSelectionAccessoryView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[MKCalloutSelectionAccessoryView _updateLayerColors](self, "_updateLayerColors");
}

- (void)_updateLayerColors
{
  CGColor *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = -[UIColor CGColor](self->_fillColor, "CGColor");
  -[MKCalloutSelectionAccessoryView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFillColor:", v3);

  -[UIColor colorWithAlphaComponent:](self->_borderColor, "colorWithAlphaComponent:", 0.5);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  -[MKCalloutSelectionAccessoryView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStrokeColor:", v6);

  -[CAShapeLayer setFillColor:](self->_shadowLayer, "setFillColor:", -[UIColor CGColor](self->_fillColor, "CGColor"));
}

- (void)placeCardPreferredContentSizeDidChange:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *wrappedViewWidthConstraint;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *wrappedViewHeightConstraint;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *v18;
  double v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  height = a3.height;
  width = a3.width;
  v22 = *MEMORY[0x1E0C80C00];
  if (qword_1EDFB7AF8 != -1)
    dispatch_once(&qword_1EDFB7AF8, &__block_literal_global_37);
  v6 = (void *)_MergedGlobals_1_5;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1_5, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = v6;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&width, *(_QWORD *)&height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_DEBUG, "CalloutSelectionAccessoryView placeCardPreferredContentSizeDidChange: %{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  wrappedViewWidthConstraint = self->_wrappedViewWidthConstraint;
  if (wrappedViewWidthConstraint)
  {
    -[NSLayoutConstraint setConstant:](wrappedViewWidthConstraint, "setConstant:", width);
  }
  else
  {
    -[MKSelectionAccessoryView widthAnchor](self->_wrappedView, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", width);
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v14 = self->_wrappedViewWidthConstraint;
    self->_wrappedViewWidthConstraint = v13;

    objc_msgSend(v10, "addObject:", self->_wrappedViewWidthConstraint);
  }
  wrappedViewHeightConstraint = self->_wrappedViewHeightConstraint;
  if (wrappedViewHeightConstraint)
  {
    -[NSLayoutConstraint setConstant:](wrappedViewHeightConstraint, "setConstant:", height);
  }
  else
  {
    -[MKSelectionAccessoryView heightAnchor](self->_wrappedView, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", height);
    v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v18 = self->_wrappedViewHeightConstraint;
    self->_wrappedViewHeightConstraint = v17;

    LODWORD(v19) = 1144750080;
    -[NSLayoutConstraint setPriority:](self->_wrappedViewHeightConstraint, "setPriority:", v19);
    objc_msgSend(v10, "addObject:", self->_wrappedViewHeightConstraint);
  }
  if (objc_msgSend(v10, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKCalloutSelectionAccessoryView;
  -[MKCalloutSelectionAccessoryView layoutSubviews](&v3, sel_layoutSubviews);
  -[MKCalloutSelectionAccessoryView _updateShape](self, "_updateShape");
}

- (void)_updateShape
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CEA390];
  -[MKCalloutSelectionAccessoryView bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithCalloutRect:unitLocation:edge:", self->_pointerEdge);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGPath");
  -[MKCalloutSelectionAccessoryView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", v5);

  v7 = objc_retainAutorelease(v4);
  -[CAShapeLayer setPath:](self->_shadowLayer, "setPath:", objc_msgSend(v7, "CGPath"));
  v8 = objc_retainAutorelease(v7);
  -[CAShapeLayer setShadowPath:](self->_shadowLayer, "setShadowPath:", objc_msgSend(v8, "CGPath"));

}

- (id)delegate
{
  return 0;
}

- (void)displayLoading
{
  -[MKSelectionAccessoryView displayLoading](self->_wrappedView, "displayLoading");
}

- (void)displayMapItem:(id)a3
{
  -[MKSelectionAccessoryView displayMapItem:](self->_wrappedView, "displayMapItem:", a3);
}

- (void)displayError
{
  -[MKSelectionAccessoryView displayError](self->_wrappedView, "displayError");
}

+ (double)pointerMargin
{
  double result;

  objc_msgSend(MEMORY[0x1E0CEA390], "pointerMargin");
  return result;
}

+ (double)pointerHeight
{
  return 14.0;
}

- (int64_t)pointerEdge
{
  return self->_pointerEdge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_wrappedViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_wrappedViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_wrappedView, 0);
}

@end
