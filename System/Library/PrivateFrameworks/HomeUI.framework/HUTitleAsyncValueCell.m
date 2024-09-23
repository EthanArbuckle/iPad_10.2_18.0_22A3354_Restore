@implementation HUTitleAsyncValueCell

- (void)setShowSpinner:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_showSpinner != a3)
  {
    v3 = a3;
    self->_showSpinner = a3;
    v5 = !a3;
    -[HUTitleAsyncValueCell spinnerView](self, "spinnerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5);

    -[HUTitleValueCell valueLabel](self, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v3);

    -[HUTitleAsyncValueCell spinnerView](self, "spinnerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
      objc_msgSend(v8, "stopAnimating");
    else
      objc_msgSend(v8, "startAnimating");

  }
}

- (HUTitleAsyncValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTitleAsyncValueCell *v4;
  HUTitleAsyncValueCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTitleAsyncValueCell;
  v4 = -[HUTitleValueCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[HUTitleAsyncValueCell createSpinner](v4, "createSpinner");
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUTitleAsyncValueCell;
  -[HUTitleValueCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUTitleAsyncValueCell setShowSpinner:](self, "setShowSpinner:", 1);
}

- (void)createSpinner
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
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  -[HUTitleAsyncValueCell spinnerView](self, "spinnerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Already have spinner: %@"), self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  -[HUTitleAsyncValueCell setSpinnerView:](self, "setSpinnerView:", v4);

  -[HUTitleAsyncValueCell spinnerView](self, "spinnerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUTitleAsyncValueCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleAsyncValueCell spinnerView](self, "spinnerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[HUTitleAsyncValueCell spinnerView](self, "spinnerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleAsyncValueCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  -[HUTitleAsyncValueCell spinnerView](self, "spinnerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueCell labelsStackView](self, "labelsStackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v17);

}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (UIActivityIndicatorView)spinnerView
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setSpinnerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
}

@end
