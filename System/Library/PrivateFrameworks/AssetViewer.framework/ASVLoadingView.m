@implementation ASVLoadingView

- (ASVLoadingView)initWithFrame:(CGRect)a3
{
  ASVLoadingView *v3;
  ASVLoadingView *v4;
  ASVLoadingView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASVLoadingView;
  v3 = -[ASVLoadingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ASVLoadingView _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (ASVLoadingView)initWithCoder:(id)a3
{
  ASVLoadingView *v3;
  ASVLoadingView *v4;
  ASVLoadingView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASVLoadingView;
  v3 = -[ASVLoadingView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[ASVLoadingView _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  void *v3;
  id v4;
  UILabel *v5;
  UILabel *assetLoadingStatusLabel;
  void *v7;
  void *v8;
  void *v9;
  UIActivityIndicatorView *v10;
  UIActivityIndicatorView *spinner;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *spinnerLeadingConstraint;
  double v20;
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
  _QWORD v42[9];

  v42[7] = *MEMORY[0x1E0C80C00];
  -[ASVLoadingView setOpaque:](self, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVLoadingView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  assetLoadingStatusLabel = self->_assetLoadingStatusLabel;
  self->_assetLoadingStatusLabel = v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_assetLoadingStatusLabel, "setBackgroundColor:", v7);

  -[UILabel setNumberOfLines:](self->_assetLoadingStatusLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_assetLoadingStatusLabel, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHexValue:error:", CFSTR("8E8E93"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_assetLoadingStatusLabel, "setTextColor:", v9);

  v10 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 2);
  spinner = self->_spinner;
  self->_spinner = v10;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_assetLoadingStatusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ASVLoadingView addSubview:](self, "addSubview:", self->_assetLoadingStatusLabel);
  -[ASVLoadingView addSubview:](self, "addSubview:", self->_spinner);
  -[UILabel trailingAnchor](self->_assetLoadingStatusLabel, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVLoadingView trailingAnchor](self, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v15) = 1132068864;
  v41 = v14;
  objc_msgSend(v14, "setPriority:", v15);
  -[UIActivityIndicatorView leadingAnchor](self->_spinner, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_assetLoadingStatusLabel, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 6.0);
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  spinnerLeadingConstraint = self->_spinnerLeadingConstraint;
  self->_spinnerLeadingConstraint = v18;

  LODWORD(v20) = 1132134400;
  -[NSLayoutConstraint setPriority:](self->_spinnerLeadingConstraint, "setPriority:", v20);
  v33 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel leadingAnchor](self->_assetLoadingStatusLabel, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVLoadingView leadingAnchor](self, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v38;
  v42[1] = v14;
  -[UILabel centerYAnchor](self->_assetLoadingStatusLabel, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVLoadingView centerYAnchor](self, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v35;
  -[UILabel heightAnchor](self->_assetLoadingStatusLabel, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVLoadingView heightAnchor](self, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v31;
  -[UIActivityIndicatorView trailingAnchor](self->_spinner, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVLoadingView trailingAnchor](self, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v22;
  -[UIActivityIndicatorView centerYAnchor](self->_spinner, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVLoadingView centerYAnchor](self, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v25;
  -[UIActivityIndicatorView heightAnchor](self->_spinner, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVLoadingView heightAnchor](self, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v29);

  -[ASVLoadingView _updateLoadingText](self, "_updateLoadingText");
  -[ASVLoadingView _updateLoadingSpinner](self, "_updateLoadingSpinner");

}

- (void)setLoadingError:(id)a3
{
  NSError *v5;
  NSError *v6;

  v5 = (NSError *)a3;
  if (self->_loadingError != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_loadingError, a3);
    -[ASVLoadingView _updateLoadingText](self, "_updateLoadingText");
    -[ASVLoadingView _updateLoadingSpinner](self, "_updateLoadingSpinner");
    v5 = v6;
  }

}

- (void)setSpinnerColor:(unint64_t)a3
{
  uint64_t v3;

  if (self->_spinnerColor != a3)
    self->_spinnerColor = a3;
  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_spinner, "setActivityIndicatorViewStyle:", v3);
}

- (void)_updateLoadingText
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  -[ASVLoadingView loadingError](self, "loadingError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASVLoadingView loadingError](self, "loadingError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domain");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5 == CFSTR("com.apple.ASVError"))
    {
      -[ASVLoadingView loadingError](self, "loadingError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "code");

      switch(v10)
      {
        case -5:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AssetViewer"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v6;
          v7 = CFSTR("VARIANTS_ERROR");
          break;
        case -4:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AssetViewer"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v6;
          v7 = CFSTR("LOAD_FAILURE_UNSUPPORTED_FUTURE_FILE_VERSION");
          break;
        case -2:
        case -1:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AssetViewer"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v6;
          v7 = CFSTR("LOAD_FAILURE_FILE_TOO_BIG");
          break;
        default:
          goto LABEL_3;
      }
    }
    else
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AssetViewer"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v6;
      v7 = CFSTR("LOAD_FAILURE");
    }
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, v7, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_assetLoadingStatusLabel, "setText:", v8);

  }
  else
  {
    -[UILabel setText:](self->_assetLoadingStatusLabel, "setText:", &stru_1E9F16B58);
  }
}

- (void)_updateLoadingSpinner
{
  void *v3;
  double v4;
  void *v5;
  NSLayoutConstraint *spinnerLeadingConstraint;

  -[ASVLoadingView loadingError](self, "loadingError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (!v3)
    v4 = 1.0;
  -[UIActivityIndicatorView setAlpha:](self->_spinner, "setAlpha:", v4);

  -[ASVLoadingView loadingError](self, "loadingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  spinnerLeadingConstraint = self->_spinnerLeadingConstraint;
  if (v5)
  {
    -[NSLayoutConstraint setActive:](spinnerLeadingConstraint, "setActive:", 0);
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  }
  else
  {
    -[NSLayoutConstraint setConstant:](spinnerLeadingConstraint, "setConstant:", 0.0);
    -[NSLayoutConstraint setActive:](self->_spinnerLeadingConstraint, "setActive:", 1);
    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  }
}

- (NSError)loadingError
{
  return self->_loadingError;
}

- (unint64_t)spinnerColor
{
  return self->_spinnerColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_spinnerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_assetLoadingStatusLabel, 0);
}

@end
