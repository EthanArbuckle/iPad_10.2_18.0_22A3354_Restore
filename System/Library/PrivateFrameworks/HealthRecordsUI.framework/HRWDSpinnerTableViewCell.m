@implementation HRWDSpinnerTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)CFSTR("HRWDSpinnerTableViewCellIdentifier");
}

- (HRWDSpinnerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HRWDSpinnerTableViewCell *v4;
  HRWDSpinnerTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HRWDSpinnerTableViewCell;
  v4 = -[HRWDSpinnerTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HRWDSpinnerTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[HRWDSpinnerTableViewCell setupSubviews](v5, "setupSubviews");
    -[HRWDSpinnerTableViewCell setupConstraints](v5, "setupConstraints");
  }
  return v5;
}

- (void)setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_opt_new();
  -[HRWDSpinnerTableViewCell setContentContainerView:](self, "setContentContainerView:", v3);

  -[HRWDSpinnerTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  -[HRWDSpinnerTableViewCell setSpinner:](self, "setSpinner:", v6);

  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerTableViewCell spinner](self, "spinner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[HRWDSpinnerTableViewCell spinner](self, "spinner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidesWhenStopped:", 0);

  -[HRWDSpinnerTableViewCell spinner](self, "spinner");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startAnimating");

}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  double v5;
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
  id v48;

  -[HRWDSpinnerTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintGreaterThanOrEqualToConstant:", *MEMORY[0x1E0DC53E0]);
  v48 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = 1132068864;
  objc_msgSend(v48, "setPriority:", v5);
  objc_msgSend(v48, "setActive:", 1);
  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerTableViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerTableViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v20, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[HRWDSpinnerTableViewCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v25, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerTableViewCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v30, 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[HRWDSpinnerTableViewCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v35, 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[HRWDSpinnerTableViewCell spinner](self, "spinner");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRWDSpinnerTableViewCell spinner](self, "spinner");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  -[HRWDSpinnerTableViewCell spinner](self, "spinner");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

}

- (void)setWaitingReason:(id)a3
{
  id v4;
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
  id v51;

  v4 = a3;
  -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeConstraints:", v8);

    v9 = (void *)objc_opt_new();
    -[HRWDSpinnerTableViewCell setWaitingReasonLabel:](self, "setWaitingReasonLabel:", v9);

    -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v11);

    -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    -[HRWDSpinnerTableViewCell spinner](self, "spinner");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    -[HRWDSpinnerTableViewCell spinner](self, "spinner");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v44, 1.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setActive:", 1);

    -[HRWDSpinnerTableViewCell spinner](self, "spinner");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDSpinnerTableViewCell contentContainerView](self, "contentContainerView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

  }
  -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setText:", v4);

}

- (NSString)waitingReason
{
  void *v2;
  void *v3;

  -[HRWDSpinnerTableViewCell waitingReasonLabel](self, "waitingReasonLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HRWDSpinnerTableViewCell;
  -[HRWDSpinnerTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HRWDSpinnerTableViewCell spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimating");

}

- (UIView)contentContainerView
{
  return (UIView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setContentContainerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (UILabel)waitingReasonLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setWaitingReasonLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingReasonLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end
