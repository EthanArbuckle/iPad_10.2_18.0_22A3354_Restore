@implementation HUActivityIndicatorCell

- (HUActivityIndicatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUActivityIndicatorCell *v4;
  HUTitleDescriptionContentView *v5;
  HUTitleDescriptionContentView *titleDescriptionView;
  void *v7;
  UIImageView *v8;
  UIImageView *iconImageView;
  void *v10;
  uint64_t v11;
  UIActivityIndicatorView *activityIndicatorView;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUActivityIndicatorCell;
  v4 = -[HUActivityIndicatorCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(HUTitleDescriptionContentView);
    titleDescriptionView = v4->_titleDescriptionView;
    v4->_titleDescriptionView = v5;

    -[HUTitleDescriptionContentView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleDescriptionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUActivityIndicatorCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_titleDescriptionView);

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_iconImageView, "setContentMode:", 1);
    -[HUActivityIndicatorCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v4->_iconImageView);

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    activityIndicatorView = v4->_activityIndicatorView;
    v4->_activityIndicatorView = (UIActivityIndicatorView *)v11;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v4->_activityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setHidesWhenStopped:](v4->_activityIndicatorView, "setHidesWhenStopped:", 1);
    -[HUActivityIndicatorCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_activityIndicatorView);

    -[HUActivityIndicatorCell _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUActivityIndicatorCell;
  -[HUActivityIndicatorCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUActivityIndicatorCell setTitleText:](self, "setTitleText:", 0);
  -[HUActivityIndicatorCell setDescriptionText:](self, "setDescriptionText:", 0);
  -[HUActivityIndicatorCell setIcon:](self, "setIcon:", 0);
  -[HUActivityIndicatorCell setAnimating:](self, "setAnimating:", 0);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  -[HUActivityIndicatorCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;

  -[HUActivityIndicatorCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v5 + 35.0, 0.0, 0.0);
  v6.receiver = self;
  v6.super_class = (Class)HUActivityIndicatorCell;
  -[HUActivityIndicatorCell layoutSubviews](&v6, sel_layoutSubviews);
}

- (HFStringGenerator)titleText
{
  void *v2;
  void *v3;

  -[HUActivityIndicatorCell titleDescriptionView](self, "titleDescriptionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFStringGenerator *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUActivityIndicatorCell titleDescriptionView](self, "titleDescriptionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleText:", v4);

}

- (HFStringGenerator)descriptionText
{
  void *v2;
  void *v3;

  -[HUActivityIndicatorCell titleDescriptionView](self, "titleDescriptionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFStringGenerator *)v3;
}

- (void)setDescriptionText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUActivityIndicatorCell titleDescriptionView](self, "titleDescriptionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDescriptionText:", v4);

}

- (UIImage)icon
{
  void *v2;
  void *v3;

  -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setIcon:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)setAnimating:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a3;
  self->_animating = a3;
  -[HUActivityIndicatorCell activityIndicatorView](self, "activityIndicatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "startAnimating");

    -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "stopAnimating");

    -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 0;
  }
  objc_msgSend(v7, "setHidden:", v8);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityIndicatorCell titleText](self, "titleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p \"%@\" (animating=%d)>"), v5, self, v6, -[HUActivityIndicatorCell isAnimating](self, "isAnimating"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_disabled = a3;
  -[HUActivityIndicatorCell titleDescriptionView](self, "titleDescriptionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabled:", v3);

}

- (void)_setupConstraints
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[12];

  v56[10] = *MEMORY[0x1E0C80C00];
  v33 = (void *)MEMORY[0x1E0CB3718];
  -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityIndicatorCell contentView](self, "contentView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "layoutMarginsGuide");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v50;
  -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityIndicatorCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layoutMarginsGuide");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "centerYAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v44;
  -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", 20.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v41;
  -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToConstant:", 20.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v38;
  -[HUActivityIndicatorCell titleDescriptionView](self, "titleDescriptionView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityIndicatorCell contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layoutMarginsGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v31;
  -[HUActivityIndicatorCell titleDescriptionView](self, "titleDescriptionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityIndicatorCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layoutMarginsGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v25;
  -[HUActivityIndicatorCell titleDescriptionView](self, "titleDescriptionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 15.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v20;
  -[HUActivityIndicatorCell titleDescriptionView](self, "titleDescriptionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityIndicatorCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutMarginsGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v14;
  -[HUActivityIndicatorCell activityIndicatorView](self, "activityIndicatorView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerXAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v6;
  -[HUActivityIndicatorCell activityIndicatorView](self, "activityIndicatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityIndicatorCell iconImageView](self, "iconImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v56[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v12);

}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (HUTitleDescriptionContentView)titleDescriptionView
{
  return self->_titleDescriptionView;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_titleDescriptionView, 0);
}

@end
