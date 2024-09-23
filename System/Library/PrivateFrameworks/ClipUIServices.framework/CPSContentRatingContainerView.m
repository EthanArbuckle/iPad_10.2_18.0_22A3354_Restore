@implementation CPSContentRatingContainerView

- (CPSContentRatingContainerView)init
{
  CPSContentRatingContainerView *v2;
  uint64_t v3;
  UIVisualEffectView *visualEffectView;
  void *v5;
  CPSScaledImageView *v6;
  CPSScaledImageView *contentRatingImageView;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CPSContentRatingContainerView *v18;
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
  objc_super v38;
  _QWORD v39[10];

  v39[8] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)CPSContentRatingContainerView;
  v2 = -[CPSContentRatingContainerView init](&v38, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    visualEffectView = v2->_visualEffectView;
    v2->_visualEffectView = (UIVisualEffectView *)v3;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v2->_visualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSContentRatingContainerView addSubview:](v2, "addSubview:", v2->_visualEffectView);
    -[UIVisualEffectView contentView](v2->_visualEffectView, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(CPSScaledImageView);
    contentRatingImageView = v2->_contentRatingImageView;
    v2->_contentRatingImageView = v6;

    -[CPSScaledImageView setContentMode:](v2->_contentRatingImageView, "setContentMode:", 0);
    -[CPSScaledImageView setTextStyleForScaling:](v2->_contentRatingImageView, "setTextStyleForScaling:", *MEMORY[0x1E0CEB558]);
    -[CPSScaledImageView setTranslatesAutoresizingMaskIntoConstraints:](v2->_contentRatingImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v8) = 1148846080;
    -[CPSScaledImageView setContentCompressionResistancePriority:forAxis:](v2->_contentRatingImageView, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    objc_msgSend(v5, "addSubview:", v2->_contentRatingImageView);
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView leadingAnchor](v2->_visualEffectView, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSContentRatingContainerView leadingAnchor](v2, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v35;
    -[UIVisualEffectView topAnchor](v2->_visualEffectView, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSContentRatingContainerView topAnchor](v2, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v32;
    -[UIVisualEffectView trailingAnchor](v2->_visualEffectView, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSContentRatingContainerView trailingAnchor](v2, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v29;
    -[UIVisualEffectView bottomAnchor](v2->_visualEffectView, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSContentRatingContainerView bottomAnchor](v2, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v25;
    -[CPSScaledImageView leadingAnchor](v2->_contentRatingImageView, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v21;
    -[CPSScaledImageView topAnchor](v2->_contentRatingImageView, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v10;
    -[CPSScaledImageView trailingAnchor](v2->_contentRatingImageView, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v5;
    objc_msgSend(v5, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[6] = v13;
    -[CPSScaledImageView bottomAnchor](v2->_contentRatingImageView, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[7] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v17);

    v18 = v2;
  }

  return v2;
}

- (void)setImage:(id)a3 usesVibrantAppearance:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[CPSScaledImageView setImage:](self->_contentRatingImageView, "setImage:", a3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_visualEffectView, "setEffect:", v7);

  }
  else
  {
    -[UIVisualEffectView setEffect:](self->_visualEffectView, "setEffect:", 0);
  }
  -[CPSScaledImageView setAccessibilityIgnoresInvertColors:](self->_contentRatingImageView, "setAccessibilityIgnoresInvertColors:", !v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_contentRatingImageView, 0);
}

@end
