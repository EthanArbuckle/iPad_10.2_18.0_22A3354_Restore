@implementation MFActivityIndicatorLabel

- (MFActivityIndicatorLabel)init
{
  MFActivityIndicatorLabel *v2;
  MFActivityIndicatorLabel *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)MFActivityIndicatorLabel;
  v2 = -[MFActivityIndicatorLabel init](&v38, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MFActivityIndicatorLabel setAutoresizingMask:](v2, "setAutoresizingMask:", 18);
    v4 = objc_alloc(MEMORY[0x1E0DC3438]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[MFActivityIndicatorLabel setActivityIndicator:](v3, "setActivityIndicator:", v9);

    -[MFActivityIndicatorLabel activityIndicator](v3, "activityIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MFActivityIndicatorLabel activityIndicator](v3, "activityIndicator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityIndicatorLabel addSubview:](v3, "addSubview:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    -[MFActivityIndicatorLabel setTextLabel:](v3, "setTextLabel:", v12);

    -[MFActivityIndicatorLabel textLabel](v3, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MFActivityIndicatorLabel textLabel](v3, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityIndicatorLabel addSubview:](v3, "addSubview:", v14);

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MFActivityIndicatorLabel textLabel](v3, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityIndicatorLabel leadingAnchor](v3, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v19);

    -[MFActivityIndicatorLabel textLabel](v3, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityIndicatorLabel trailingAnchor](v3, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v23);

    -[MFActivityIndicatorLabel activityIndicator](v3, "activityIndicator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityIndicatorLabel centerYAnchor](v3, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v27);

    -[MFActivityIndicatorLabel activityIndicator](v3, "activityIndicator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityIndicatorLabel leadingAnchor](v3, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v31);

    -[MFActivityIndicatorLabel activityIndicator](v3, "activityIndicator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityIndicatorLabel activityIndicator](v3, "activityIndicator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v36);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
  }
  return v3;
}

- (void)startAnimating
{
  id v3;
  id v4;

  -[MFActivityIndicatorLabel textLabel](self, "textLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[MFActivityIndicatorLabel activityIndicator](self, "activityIndicator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimating");

}

- (void)stopAnimating
{
  id v3;
  id v4;

  -[MFActivityIndicatorLabel textLabel](self, "textLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[MFActivityIndicatorLabel activityIndicator](self, "activityIndicator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

}

- (void)setActivityIndicator:(id)a3
{
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;

  v5 = (UIActivityIndicatorView *)a3;
  if (self->_activityIndicator != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_activityIndicator, a3);
    v5 = v6;
  }

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MFActivityIndicatorLabel textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
