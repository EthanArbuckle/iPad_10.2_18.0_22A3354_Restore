@implementation MRUActivityRouteView

- (MRUActivityRouteView)initWithFrame:(CGRect)a3
{
  MRUActivityRouteView *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *deviceIconView;
  UIImageView *v7;
  MRUActivityArtworkView *v8;
  MRUActivityArtworkView *artworkView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MRUActivityRouteView;
  v3 = -[MRUActivityRouteView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUActivityRouteView setTintColor:](v3, "setTintColor:", v4);

    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5, "setContentMode:", 1);
    -[MRUActivityRouteView addSubview:](v3, "addSubview:", v5);
    deviceIconView = v3->_deviceIconView;
    v3->_deviceIconView = v5;
    v7 = v5;

    v8 = objc_alloc_init(MRUActivityArtworkView);
    -[MRUActivityArtworkView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MRUArtworkView setStyle:](v8, "setStyle:", 7);
    -[MRUActivityRouteView addSubview:](v3, "addSubview:", v8);
    artworkView = v3->_artworkView;
    v3->_artworkView = v8;

    -[MRUActivityRouteView setupConstraints](v3, "setupConstraints");
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double side;
  double v3;
  objc_super v4;
  CGSize result;

  side = self->_side;
  if (fabs(side) <= 2.22044605e-16)
  {
    v4.receiver = self;
    v4.super_class = (Class)MRUActivityRouteView;
    -[MRUActivityRouteView intrinsicContentSize](&v4, sel_intrinsicContentSize);
  }
  else
  {
    v3 = self->_side;
  }
  result.height = v3;
  result.width = side;
  return result;
}

- (void)setSide:(double)a3
{
  if (vabdd_f64(self->_side, a3) > 2.22044605e-16)
  {
    self->_side = a3;
    -[NSLayoutConstraint setConstant:](self->_deviceIconViewWidthConstraint, "setConstant:");
    -[MRUActivityRouteView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setSideConstraintActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *deviceIconViewWidthConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *deviceIconViewHeightConstraint;

  if (self->_sideConstraintActive != a3)
  {
    v3 = a3;
    self->_sideConstraintActive = a3;
    if (a3 && !self->_deviceIconViewWidthConstraint)
    {
      -[MRUActivityRouteView deviceIconView](self, "deviceIconView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "widthAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToConstant:", self->_side);
      v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      deviceIconViewWidthConstraint = self->_deviceIconViewWidthConstraint;
      self->_deviceIconViewWidthConstraint = v7;

      -[MRUActivityRouteView deviceIconView](self, "deviceIconView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "widthAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUActivityRouteView deviceIconView](self, "deviceIconView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "heightAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v12);
      v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      deviceIconViewHeightConstraint = self->_deviceIconViewHeightConstraint;
      self->_deviceIconViewHeightConstraint = v13;

    }
    -[NSLayoutConstraint setActive:](self->_deviceIconViewWidthConstraint, "setActive:", v3);
    -[NSLayoutConstraint setActive:](self->_deviceIconViewHeightConstraint, "setActive:", v3);
  }
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  _QWORD v38[10];

  v38[8] = *MEMORY[0x1E0C80C00];
  v23 = (void *)MEMORY[0x1E0CB3718];
  -[MRUActivityRouteView deviceIconView](self, "deviceIconView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityRouteView leadingAnchor](self, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v34;
  -[MRUActivityRouteView deviceIconView](self, "deviceIconView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityRouteView trailingAnchor](self, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v30;
  -[MRUActivityRouteView deviceIconView](self, "deviceIconView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityRouteView topAnchor](self, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v26;
  -[MRUActivityRouteView deviceIconView](self, "deviceIconView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityRouteView bottomAnchor](self, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v21;
  -[MRUActivityRouteView artworkView](self, "artworkView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityRouteView trailingAnchor](self, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v17;
  -[MRUActivityRouteView artworkView](self, "artworkView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityRouteView bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v13;
  -[MRUActivityRouteView artworkView](self, "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityRouteView artworkView](self, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v7;
  -[MRUActivityRouteView artworkView](self, "artworkView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityRouteView widthAnchor](self, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:multiplier:", v10, 0.4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v12);

}

- (UIImageView)deviceIconView
{
  return self->_deviceIconView;
}

- (MRUActivityArtworkView)artworkView
{
  return self->_artworkView;
}

- (double)side
{
  return self->_side;
}

- (BOOL)isSideConstraintActive
{
  return self->_sideConstraintActive;
}

- (NSLayoutConstraint)deviceIconViewWidthConstraint
{
  return self->_deviceIconViewWidthConstraint;
}

- (void)setDeviceIconViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIconViewWidthConstraint, a3);
}

- (NSLayoutConstraint)deviceIconViewHeightConstraint
{
  return self->_deviceIconViewHeightConstraint;
}

- (void)setDeviceIconViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIconViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIconViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_deviceIconViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_deviceIconView, 0);
}

@end
