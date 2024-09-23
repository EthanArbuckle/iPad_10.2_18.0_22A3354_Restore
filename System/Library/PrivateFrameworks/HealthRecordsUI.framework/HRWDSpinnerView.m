@implementation HRWDSpinnerView

- (HRWDSpinnerView)init
{
  HRWDSpinnerView *v2;
  HRWDSpinnerView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HRWDSpinnerView;
  v2 = -[HRWDSpinnerView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HRWDSpinnerView _setupSubviews](v2, "_setupSubviews");
  return v3;
}

- (void)_setupSubviews
{
  id v3;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *spinner;
  UILabel *v6;
  UILabel *label;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *spinnerTopConstraint;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
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
  _QWORD v54[15];

  v54[13] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HRWDSpinnerView addSubview:](self, "addSubview:", v3);
  v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
  spinner = self->_spinner;
  self->_spinner = v4;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_spinner);
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  label = self->_label;
  self->_label = v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B58], 1024);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v8);

  HBXLocalizedString(CFSTR("CONNECTING"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_label, "setText:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v10);

  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_label);
  -[UIActivityIndicatorView topAnchor](self->_spinner, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  spinnerTopConstraint = self->_spinnerTopConstraint;
  self->_spinnerTopConstraint = v13;

  v38 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v3, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerView topAnchor](self, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintGreaterThanOrEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v51;
  objc_msgSend(v3, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerView bottomAnchor](self, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintLessThanOrEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v48;
  objc_msgSend(v3, "leftAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerView leftAnchor](self, "leftAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v45;
  objc_msgSend(v3, "rightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerView rightAnchor](self, "rightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v42;
  objc_msgSend(v3, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerView centerXAnchor](self, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v54[4] = v39;
  objc_msgSend(v3, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerView centerYAnchor](self, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v54[5] = v35;
  -[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v54[6] = v32;
  -[UILabel centerXAnchor](self->_label, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v54[7] = v29;
  -[UILabel leadingAnchor](self->_label, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v54[8] = v26;
  -[UILabel trailingAnchor](self->_label, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_spinnerTopConstraint;
  v54[9] = v16;
  v54[10] = v17;
  -[UILabel topAnchor](self->_label, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView bottomAnchor](self->_spinner, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 14.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v54[11] = v20;
  -[UILabel bottomAnchor](self->_label, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v54[12] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v24);

}

- (void)updateConstraints
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)HRWDSpinnerView;
  -[HRWDSpinnerView updateConstraints](&v3, sel_updateConstraints);
  -[HRWDSpinnerView frame](self, "frame");
  -[NSLayoutConstraint setConstant:](self->_spinnerTopConstraint, "setConstant:", CGRectGetHeight(v4) * 0.4);
}

- (BOOL)isAnimating
{
  return -[UIActivityIndicatorView isAnimating](self->_spinner, "isAnimating");
}

- (void)setMessageWhileSpinning:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__HRWDSpinnerView_setMessageWhileSpinning___block_invoke;
  v6[3] = &unk_1E74D1A90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __43__HRWDSpinnerView_setMessageWhileSpinning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setText:", *(_QWORD *)(a1 + 40));
}

- (void)setMessageFont:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HRWDSpinnerView_setMessageFont___block_invoke;
  v6[3] = &unk_1E74D1A90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __34__HRWDSpinnerView_setMessageFont___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFont:", *(_QWORD *)(a1 + 40));
}

- (void)startSpinner
{
  _QWORD v3[4];
  id v4;
  id v5;
  id from;
  id location;

  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_spinner);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__HRWDSpinnerView_startSpinner__block_invoke;
  v3[3] = &unk_1E74D2108;
  objc_copyWeak(&v4, &from);
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __31__HRWDSpinnerView_startSpinner__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "startAnimating");

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "setHidden:", 0);

}

- (void)stopSpinner
{
  _QWORD v3[4];
  id v4;
  id v5;
  id from;
  id location;

  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_spinner);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__HRWDSpinnerView_stopSpinner__block_invoke;
  v3[3] = &unk_1E74D2108;
  objc_copyWeak(&v4, &from);
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __30__HRWDSpinnerView_stopSpinner__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stopAnimating");

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "setHidden:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerTopConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
