@implementation HUSpinnerButtonCell

- (HUSpinnerButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUSpinnerButtonCell *v4;
  HUSpinnerButtonCell *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUSpinnerButtonCell;
  v4 = -[HUButtonCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUButtonCell setTextAlignment:](v4, "setTextAlignment:", 4);
    -[HUSpinnerButtonCell contentView](v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "heightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUSpinnerButtonCell;
  -[HUButtonCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUButtonCell setTextAlignment:](self, "setTextAlignment:", 4);
  -[HUSpinnerButtonCell setShowSpinner:](self, "setShowSpinner:", 0);
  -[HUSpinnerButtonCell setUseFullWidthSeparator:](self, "setUseFullWidthSeparator:", 0);
}

- (void)setShowSpinner:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    if (a3)
    {
      -[HUSpinnerButtonCell createSpinner](self, "createSpinner");
      -[HUSpinnerButtonCell spinner](self, "spinner");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startAnimating");

    }
    else
    {
      -[HUSpinnerButtonCell spinner](self, "spinner");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      -[HUSpinnerButtonCell setSpinner:](self, "setSpinner:", 0);
      -[HUSpinnerButtonCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
    -[HUButtonCell setHideTitle:](self, "setHideTitle:", self->_showSpinner);
    -[HUSpinnerButtonCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", !self->_showSpinner);
  }
}

- (CGRect)_separatorFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect result;

  v11.receiver = self;
  v11.super_class = (Class)HUSpinnerButtonCell;
  -[HUSpinnerButtonCell _separatorFrame](&v11, sel__separatorFrame);
  v4 = v3;
  v6 = v5;
  -[HUSpinnerButtonCell bounds](self, "bounds");
  v8 = 0.0;
  v9 = v4;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v7;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)createSpinner
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinner;
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
  id v29;

  if (self->_spinner)
    NSLog(CFSTR("Already have spinner: %@"), a2, self);
  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v3;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HUSpinnerButtonCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_spinner);

  -[UIActivityIndicatorView leadingAnchor](self->_spinner, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSpinnerButtonCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[UIActivityIndicatorView trailingAnchor](self->_spinner, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSpinnerButtonCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSpinnerButtonCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[UIActivityIndicatorView topAnchor](self->_spinner, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSpinnerButtonCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[UIActivityIndicatorView bottomAnchor](self->_spinner, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSpinnerButtonCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[UIActivityIndicatorView centerYAnchor](self->_spinner, "centerYAnchor");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSpinnerButtonCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (BOOL)useFullWidthSeparator
{
  return self->_useFullWidthSeparator;
}

- (void)setUseFullWidthSeparator:(BOOL)a3
{
  self->_useFullWidthSeparator = a3;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
