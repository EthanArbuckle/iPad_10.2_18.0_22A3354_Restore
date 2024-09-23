@implementation HKDataMetadataWorkoutRouteCell

- (HKDataMetadataWorkoutRouteCell)init
{
  HKDataMetadataWorkoutRouteCell *v2;
  UIImageView *v3;
  UIImageView *routeImageView;
  uint64_t v5;
  UIActivityIndicatorView *activityIndicator;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)HKDataMetadataWorkoutRouteCell;
  v2 = -[HKDataMetadataWorkoutRouteCell init](&v12, sel_init);
  if (v2)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    routeImageView = v2->_routeImageView;
    v2->_routeImageView = v3;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v2->_routeImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v2->_activityIndicator;
    v2->_activityIndicator = (UIActivityIndicatorView *)v5;

    -[UIActivityIndicatorView startAnimating](v2->_activityIndicator, "startAnimating");
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v2->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKDataMetadataWorkoutRouteCell contentView](v2, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v2->_routeImageView);

    -[HKDataMetadataWorkoutRouteCell contentView](v2, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v2->_activityIndicator);

    -[HKDataMetadataWorkoutRouteCell setupConstraints](v2, "setupConstraints");
    v13[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[HKDataMetadataWorkoutRouteCell registerForTraitChanges:withAction:](v2, "registerForTraitChanges:withAction:", v9, sel__handleDidUpdateTraitCollection);

  }
  return v2;
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
  NSLayoutConstraint *v31;
  NSLayoutConstraint *heightConstraint;

  -[UIImageView topAnchor](self->_routeImageView, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataWorkoutRouteCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[UIImageView leftAnchor](self->_routeImageView, "leftAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataWorkoutRouteCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[UIImageView bottomAnchor](self->_routeImageView, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataWorkoutRouteCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[UIImageView rightAnchor](self->_routeImageView, "rightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataWorkoutRouteCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[UIActivityIndicatorView centerXAnchor](self->_activityIndicator, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataWorkoutRouteCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[UIActivityIndicatorView centerYAnchor](self->_activityIndicator, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataWorkoutRouteCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[HKDataMetadataWorkoutRouteCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataWorkoutRouteCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:multiplier:", v30, 0.66);
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v31;

  -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
}

- (void)setRouteImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[HKDataMetadataWorkoutRouteCell activityIndicator](self, "activityIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAnimating");

    -[HKDataMetadataWorkoutRouteCell routeImageView](self, "routeImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v4);

    -[HKDataMetadataWorkoutRouteCell routeImageView](self, "routeImageView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentMode:", 2);

  }
}

- (void)_handleDidUpdateTraitCollection
{
  void *v3;
  id v4;

  -[HKDataMetadataWorkoutRouteCell delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataWorkoutRouteCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workoutRouteCell:didUpdateTraitCollection:", self, v3);

}

- (HKDataMetadataWorkoutRouteCellDelegate)delegate
{
  return (HKDataMetadataWorkoutRouteCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)routeImageView
{
  return self->_routeImageView;
}

- (void)setRouteImageView:(id)a3
{
  objc_storeStrong((id *)&self->_routeImageView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_routeImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
