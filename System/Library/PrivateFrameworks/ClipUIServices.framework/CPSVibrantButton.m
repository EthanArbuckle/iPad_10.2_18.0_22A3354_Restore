@implementation CPSVibrantButton

- (CPSVibrantButton)initWithButtonType:(int64_t)a3
{
  CPSVibrantButton *v4;
  id v5;
  void *v6;
  uint64_t v7;
  UIVisualEffectView *effectView;
  uint64_t v9;
  UIButton *button;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CPSVibrantButton *v20;
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
  objc_super v39;
  _QWORD v40[10];

  v40[8] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)CPSVibrantButton;
  v4 = -[CPSVibrantButton initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithEffect:", v6);
    effectView = v4->_effectView;
    v4->_effectView = (UIVisualEffectView *)v7;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4->_effectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    button = v4->_button;
    v4->_button = (UIButton *)v9;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSVibrantButton addSubview:](v4, "addSubview:", v4->_effectView);
    -[CPSVibrantButton addSubview:](v4, "addSubview:", v4->_button);
    v29 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView leadingAnchor](v4->_effectView, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantButton leadingAnchor](v4, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v36;
    -[UIVisualEffectView bottomAnchor](v4->_effectView, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantButton bottomAnchor](v4, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v33;
    -[UIVisualEffectView topAnchor](v4->_effectView, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantButton topAnchor](v4, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v30;
    -[UIVisualEffectView trailingAnchor](v4->_effectView, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantButton trailingAnchor](v4, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v26;
    -[UIButton leadingAnchor](v4->_button, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v4->_effectView, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[4] = v23;
    -[UIButton bottomAnchor](v4->_button, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantButton bottomAnchor](v4, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40[5] = v12;
    -[UIButton topAnchor](v4->_button, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantButton topAnchor](v4, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[6] = v15;
    -[UIButton trailingAnchor](v4->_button, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantButton trailingAnchor](v4, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[7] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v19);

    v20 = v4;
  }

  return v4;
}

- (void)updateCornerRadius
{
  UIButtonType v3;
  double v4;
  CGRect v5;

  -[CPSVibrantButton layoutIfNeeded](self, "layoutIfNeeded");
  v3 = -[UIButton buttonType](self->_button, "buttonType");
  v4 = 10.0;
  if (v3 == UIButtonTypeClose)
  {
    -[CPSVibrantButton bounds](self, "bounds", 10.0);
    v4 = CGRectGetWidth(v5) * 0.5;
  }
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_effectView, "_setContinuousCornerRadius:", v4);
}

- (UIButton)uiButton
{
  return self->_button;
}

- (void)setAdjustFontSizeToFitWidth:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIButton titleLabel](self->_button, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
