@implementation MRUControlCenterRouteButton

- (MRUControlCenterRouteButton)init
{
  MRUControlCenterRouteButton *v2;
  MRUControlCenterRouteButton *v3;
  UIView *v4;
  UIView *backgroundView;
  UIImageView *v6;
  UIImageView *imageView;
  UILabel *v8;
  UILabel *label;
  MRURouteTextFormatter *v10;
  MRURouteTextFormatter *routeTextFormatter;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MRUControlCenterRouteButton;
  v2 = -[MRUControlCenterRouteButton init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_showRouteLabel = 0;
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v4;

    -[UIView setUserInteractionEnabled:](v3->_backgroundView, "setUserInteractionEnabled:", 0);
    -[MRUControlCenterRouteButton addSubview:](v3, "addSubview:", v3->_backgroundView);
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v6;

    -[UIImageView setUserInteractionEnabled:](v3->_imageView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[MRUControlCenterRouteButton addSubview:](v3, "addSubview:", v3->_imageView);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v8;

    -[UILabel setUserInteractionEnabled:](v3->_label, "setUserInteractionEnabled:", 0);
    -[MRUControlCenterRouteButton addSubview:](v3, "addSubview:", v3->_label);
    v10 = objc_alloc_init(MRURouteTextFormatter);
    routeTextFormatter = v3->_routeTextFormatter;
    v3->_routeTextFormatter = v10;

    -[MRURouteTextFormatter configuration](v3->_routeTextFormatter, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOmitGroupLeaderName:", 1);
    objc_msgSend(v12, "setAllowsMultitruncation:", 0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    -[MRUControlCenterRouteButton addInteraction:](v3, "addInteraction:", v13);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUControlCenterRouteButton createConstraints](v3, "createConstraints");
    -[MRUControlCenterRouteButton updateLayout](v3, "updateLayout");
    -[MRUControlCenterRouteButton updateVisibility](v3, "updateVisibility");
    -[MRUControlCenterRouteButton updateShouldHighlightBackground](v3, "updateShouldHighlightBackground");
    -[MRUControlCenterRouteButton updateBackgroundView](v3, "updateBackgroundView");
    -[MRUControlCenterRouteButton updateVisualStyling](v3, "updateVisualStyling");
    -[MRUControlCenterRouteButton updateContentSizeCategory](v3, "updateContentSizeCategory");

  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  MRUControlCenterRouteButton *v6;
  UIView *backgroundView;
  id v8;

  y = a3.y;
  x = a3.x;
  v6 = self;
  backgroundView = self->_backgroundView;
  v8 = a4;
  -[MRUControlCenterRouteButton convertPoint:toView:](v6, "convertPoint:toView:", backgroundView, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](v6->_backgroundView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  v4 = MRUControlCenterRouteButtonHeight();
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)createConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *backgroundViewFullWidthConstraint;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *imageViewLeadingConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *labelLeadingConstraint;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *labelWidthConstraint;
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
  _QWORD v49[15];

  v49[13] = *MEMORY[0x1E0C80C00];
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView widthAnchor](self->_backgroundView, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterRouteButton widthAnchor](self, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  backgroundViewFullWidthConstraint = self->_backgroundViewFullWidthConstraint;
  self->_backgroundViewFullWidthConstraint = v5;

  v34 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterRouteButton topAnchor](self, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v46;
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterRouteButton bottomAnchor](self, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v43;
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterRouteButton trailingAnchor](self, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v40;
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterRouteButton leadingAnchor](self, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v37;
  -[UIImageView centerYAnchor](self->_imageView, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_backgroundView, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v33;
  -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -MRUControlCenterRouteButtonImageMargin());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v30;
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", MRUControlCenterRouteButtonImageSize());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v28;
  -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v25;
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, MRUControlCenterRouteButtonImageMargin());
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageViewLeadingConstraint = self->_imageViewLeadingConstraint;
  self->_imageViewLeadingConstraint = v7;

  v49[8] = v7;
  -[UILabel centerYAnchor](self->_label, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_backgroundView, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v10;
  -[UILabel leadingAnchor](self->_label, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:constant:", v12, MRUControlCenterRouteButtonLabelLeadingMargin());
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelLeadingConstraint = self->_labelLeadingConstraint;
  self->_labelLeadingConstraint = v13;

  v49[10] = v13;
  -[UILabel trailingAnchor](self->_label, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -MRUControlCenterRouteButtonImageMargin());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v17;
  -[UILabel widthAnchor](self->_label, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintLessThanOrEqualToConstant:", 0.0);
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelWidthConstraint = self->_labelWidthConstraint;
  self->_labelWidthConstraint = v19;

  v49[12] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v21);

}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)MRUControlCenterRouteButton;
  -[MRUControlCenterRouteButton layoutSubviews](&v3, sel_layoutSubviews);
  -[MRUControlCenterRouteButton updateLayout](self, "updateLayout");
  -[MRUControlCenterRouteButton bounds](self, "bounds");
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", CGRectGetHeight(v4) * 0.5);
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
  void *v13;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MRUControlCenterRouteButton frame](self, "frame");
  v9 = v8;
  v14.receiver = self;
  v14.super_class = (Class)MRUControlCenterRouteButton;
  -[MRUControlCenterRouteButton setFrame:](&v14, sel_setFrame_, x, y, width, height);
  v10 = v9 - width;
  if (v9 - width < 0.0)
    v10 = -(v9 - width);
  if (v10 > 0.00000011920929)
  {
    -[MRUControlCenterRouteButton labelMaxWidth](self, "labelMaxWidth");
    v12 = v11;
    -[MRURouteTextFormatter configuration](self->_routeTextFormatter, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextBoundingWidth:", v12);

    -[MRUControlCenterRouteButton updateRouteLabel](self, "updateRouteLabel");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUControlCenterRouteButton;
  -[MRUControlCenterRouteButton setHighlighted:](&v7, sel_setHighlighted_);
  v5 = MRUControlCenterRouteButtonHighlightAnimationDuration(v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__MRUControlCenterRouteButton_setHighlighted___block_invoke;
  v6[3] = &unk_1E5818C88;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, v5);
}

uint64_t __46__MRUControlCenterRouteButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHighlighted");
}

- (void)setRoute:(id)a3 showRouteLabel:(BOOL)a4
{
  _BOOL4 v4;
  MPAVRoute *v6;
  NSObject *v7;
  uint64_t v8;
  MPAVRoute *route;
  MPAVRoute *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  MPAVRoute *v14;
  __int16 v15;
  MPAVRoute *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = (MPAVRoute *)a3;
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    route = self->_route;
    v11 = 138544386;
    v12 = v8;
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = route;
    v17 = 1024;
    v18 = -[MPAVRoute isAirpodsRoute](v6, "isAirpodsRoute");
    v19 = 1024;
    v20 = v4;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ setRoute:%{public}@ currentRoute:%{public}@ isAirpodsRoute:%d showRouteLabel:%d", (uint8_t *)&v11, 0x2Cu);
  }

  v10 = self->_route;
  self->_route = v6;

  self->_showRouteLabel = v4;
  -[MRUControlCenterRouteButton updateRouteAppearanceAnimated:](self, "updateRouteAppearanceAnimated:", self->_onScreen);
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUControlCenterRouteButton updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  UIImageView *imageView;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    imageView = self->_imageView;
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__MRUControlCenterRouteButton_setImage_animated___block_invoke;
    v10[3] = &unk_1E5818CB0;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v9, "transitionWithView:duration:options:animations:completion:", imageView, 5242880, v10, 0, 0.25);

  }
  else
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v6);
  }

}

uint64_t __49__MRUControlCenterRouteButton_setImage_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setImage:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isExpanded
{
  return self->_showRouteLabel;
}

- (void)setShouldHighlightBackground:(BOOL)a3
{
  if (self->_shouldHighlightBackground != a3)
  {
    self->_shouldHighlightBackground = a3;
    -[MRUControlCenterRouteButton updateBackgroundView](self, "updateBackgroundView");
  }
}

- (double)labelMaxWidth
{
  double v3;
  double v4;
  double Width;
  CGRect v7;

  v3 = MRUControlCenterRouteButtonImageMargin();
  v4 = MRUControlCenterRouteButtonLabelLeadingMargin() + v3 * 2.0;
  -[MRUControlCenterRouteButton bounds](self, "bounds");
  Width = CGRectGetWidth(v7);
  return Width - (v4 + MRUControlCenterRouteButtonImageSize());
}

- (double)estimatedBackgroundViewWidth
{
  double v3;
  double v4;
  double v5;

  v3 = MRUControlCenterRouteButtonImageMargin();
  v4 = MRUControlCenterRouteButtonImageSize() + v3 * 2.0;
  if (-[MRUControlCenterRouteButton isExpanded](self, "isExpanded"))
  {
    -[NSLayoutConstraint constant](self->_labelWidthConstraint, "constant");
    return v4 + v5 + MRUControlCenterRouteButtonLabelLeadingMargin();
  }
  return v4;
}

- (void)updateLayout
{
  _BOOL4 v3;
  double v4;
  float v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;
  double v10;

  v3 = -[MRUControlCenterRouteButton isExpanded](self, "isExpanded");
  if (v3)
    *(float *)&v4 = 250.0;
  else
    *(float *)&v4 = 1000.0;
  if (v3)
    v5 = 1000.0;
  else
    v5 = 250.0;
  -[NSLayoutConstraint setPriority:](self->_imageViewLeadingConstraint, "setPriority:", v4);
  *(float *)&v6 = v5;
  -[NSLayoutConstraint setPriority:](self->_labelLeadingConstraint, "setPriority:", v6);
  -[MRUControlCenterRouteButton bounds](self, "bounds");
  v8 = v7;
  -[MRUControlCenterRouteButton labelMaxWidth](self, "labelMaxWidth");
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:");
  -[NSLayoutConstraint setConstant:](self->_labelWidthConstraint, "setConstant:");
  if (-[MRUControlCenterRouteButton isExpanded](self, "isExpanded"))
  {
    v9 = 0;
  }
  else
  {
    -[MRUControlCenterRouteButton estimatedBackgroundViewWidth](self, "estimatedBackgroundViewWidth");
    v9 = v10 / v8 >= 0.95;
  }
  -[NSLayoutConstraint setActive:](self->_backgroundViewFullWidthConstraint, "setActive:", v9);
}

- (void)updateVisibility
{
  double v2;

  v2 = 1.0;
  if (!self->_showRouteLabel)
    v2 = 0.0;
  -[UILabel setAlpha:](self->_label, "setAlpha:", v2);
}

- (void)updateRouteLabel
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  -[MRURouteTextFormatter textForRoute:](self->_routeTextFormatter, "textForRoute:", self->_route);
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (self->_showRouteLabel)
    v4 = v3;
  else
    v4 = 0;
  -[UILabel setText:](self->_label, "setText:", v4);

}

- (void)updateShouldHighlightBackground
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  MPAVRoute *route;
  int v8;
  uint64_t v9;
  __int16 v10;
  MPAVRoute *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MRUControlCenterRouteButton predictedOutputDeviceFromRoute:](self, "predictedOutputDeviceFromRoute:", self->_route);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_showRouteLabel || (-[MPAVRoute isAirpodsRoute](self->_route, "isAirpodsRoute") & 1) != 0)
  {
    v4 = 1;
  }
  else if (v3)
  {
    v4 = objc_msgSend(v3, "isAirpodsRoute");
  }
  else
  {
    v4 = 0;
  }
  if (self->_shouldHighlightBackground != (_DWORD)v4)
  {
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      route = self->_route;
      v8 = 138544386;
      v9 = v6;
      v10 = 2114;
      v11 = route;
      v12 = 1024;
      v13 = -[MPAVRoute isAirpodsRoute](route, "isAirpodsRoute");
      v14 = 2114;
      v15 = v3;
      v16 = 1024;
      v17 = objc_msgSend(v3, "isAirpodsRoute");
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ updateShouldHighlightBackground currentRoute:%{public}@ isAirpodsRoute:%d predictedOutputDevice:%{public}@ isAirpodsRoute:%d", (uint8_t *)&v8, 0x2Cu);
    }

  }
  -[MRUControlCenterRouteButton setShouldHighlightBackground:](self, "setShouldHighlightBackground:", v4);

}

- (void)updateBackgroundView
{
  id v3;

  MRUControlCenterRouteButtonBackgroundColor(-[MRUControlCenterRouteButton isHighlighted](self, "isHighlighted"), self->_shouldHighlightBackground);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v3);

}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_label);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_imageView);
}

- (void)updateHighlighted
{
  _OWORD v3[3];
  _OWORD v4[3];

  -[MRUControlCenterRouteButton updateBackgroundView](self, "updateBackgroundView");
  MRUControlCenterRouteButtonBackgroundViewTransform(-[MRUControlCenterRouteButton isHighlighted](self, "isHighlighted"), (uint64_t)v4);
  v3[0] = v4[0];
  v3[1] = v4[1];
  v3[2] = v4[2];
  -[MRUControlCenterRouteButton setTransform:](self, "setTransform:", v3);
}

- (void)updateContentSizeCategory
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_routeFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v4);
  -[MRURouteTextFormatter configuration](self->_routeTextFormatter, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  -[MRUControlCenterRouteButton updateRouteLabel](self, "updateRouteLabel");
}

- (void)updateImageAnimated:(BOOL)a3
{
  void (**imageForRoute)(id, MPAVRoute *, _QWORD *);
  MPAVRoute *route;
  _QWORD v6[5];
  BOOL v7;

  imageForRoute = (void (**)(id, MPAVRoute *, _QWORD *))self->_imageForRoute;
  if (imageForRoute)
  {
    route = self->_route;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__MRUControlCenterRouteButton_updateImageAnimated___block_invoke;
    v6[3] = &unk_1E5818CD8;
    v6[4] = self;
    v7 = a3;
    imageForRoute[2](imageForRoute, route, v6);
  }
}

uint64_t __51__MRUControlCenterRouteButton_updateImageAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:animated:", a2, *(unsigned __int8 *)(a1 + 40));
}

- (void)updateRouteAppearanceAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a3;
  -[MRUControlCenterRouteButton updateImageAnimated:](self, "updateImageAnimated:");
  if (v3)
  {
    if (self->_showRouteLabel)
      v5 = 0.25;
    else
      v5 = 0.0;
    if (self->_showRouteLabel)
      v6 = 0.0;
    else
      v6 = 0.125;
    if (self->_showRouteLabel)
      -[MRUControlCenterRouteButton updateRouteLabel](self, "updateRouteLabel");
    v7 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__MRUControlCenterRouteButton_updateRouteAppearanceAnimated___block_invoke;
    v9[3] = &unk_1E5818C88;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v9, 0, 0.25, v5);
    -[MRUControlCenterRouteButton updateLayout](self, "updateLayout");
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __61__MRUControlCenterRouteButton_updateRouteAppearanceAnimated___block_invoke_2;
    v8[3] = &unk_1E5818C88;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 4, v8, 0, 0.5, 0.25, 0.0, v6);
  }
  else
  {
    -[MRUControlCenterRouteButton updateShouldHighlightBackground](self, "updateShouldHighlightBackground");
    -[MRUControlCenterRouteButton updateVisibility](self, "updateVisibility");
    -[MRUControlCenterRouteButton updateRouteLabel](self, "updateRouteLabel");
    -[MRUControlCenterRouteButton updateLayout](self, "updateLayout");
  }
}

uint64_t __61__MRUControlCenterRouteButton_updateRouteAppearanceAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

uint64_t __61__MRUControlCenterRouteButton_updateRouteAppearanceAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "updateShouldHighlightBackground");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;

  v5 = (void *)MEMORY[0x1E0DC3B28];
  -[UIView frame](self->_backgroundView, "frame", a3, a4, a5);
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self->_backgroundView);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)predictedOutputDeviceFromRoute:(id)a3
{
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPAVRoute predictedOutputDevice](self->_route, "predictedOutputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void)setOnScreen:(BOOL)a3
{
  self->_onScreen = a3;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (id)imageForRoute
{
  return self->_imageForRoute;
}

- (void)setImageForRoute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (MPAVRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (BOOL)showRouteLabel
{
  return self->_showRouteLabel;
}

- (void)setShowRouteLabel:(BOOL)a3
{
  self->_showRouteLabel = a3;
}

- (BOOL)shouldHighlightBackground
{
  return self->_shouldHighlightBackground;
}

- (NSLayoutConstraint)imageViewLeadingConstraint
{
  return self->_imageViewLeadingConstraint;
}

- (void)setImageViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)labelLeadingConstraint
{
  return self->_labelLeadingConstraint;
}

- (void)setLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelLeadingConstraint, a3);
}

- (NSLayoutConstraint)labelWidthConstraint
{
  return self->_labelWidthConstraint;
}

- (void)setLabelWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelWidthConstraint, a3);
}

- (NSLayoutConstraint)backgroundViewFullWidthConstraint
{
  return self->_backgroundViewFullWidthConstraint;
}

- (void)setBackgroundViewFullWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundViewFullWidthConstraint, a3);
}

- (MRURouteTextFormatter)routeTextFormatter
{
  return self->_routeTextFormatter;
}

- (void)setRouteTextFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_routeTextFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeTextFormatter, 0);
  objc_storeStrong((id *)&self->_backgroundViewFullWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong(&self->_imageForRoute, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
