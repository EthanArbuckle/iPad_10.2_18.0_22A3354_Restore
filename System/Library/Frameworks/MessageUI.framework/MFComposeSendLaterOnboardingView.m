@implementation MFComposeSendLaterOnboardingView

- (MFComposeSendLaterOnboardingView)initWithFrame:(CGRect)a3
{
  MFComposeSendLaterOnboardingView *v3;
  UIImageView *v4;
  UIImageView *sendLaterImageView;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *titleLabel;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *subtitleLabel;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIButton *cancelButton;
  double v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
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
  void *v43;
  objc_super v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)MFComposeSendLaterOnboardingView;
  v3 = -[MFComposeSendLaterOnboardingView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    sendLaterImageView = v3->_sendLaterImageView;
    v3->_sendLaterImageView = v4;

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.circle.badge.clock"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->_sendLaterImageView, "setImage:", v6);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_sendLaterImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4AE8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v3->_sendLaterImageView, "setPreferredSymbolConfiguration:", v7);

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v8;

    _EFLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_titleLabel, "setText:", v10);

    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC1438]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v11);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v14);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_subtitleLabel, "setFont:", v15);

    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC1420]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationWithFont:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setPreferredSymbolConfigurationForImage:", v18);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setImage:", v19);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setBaseForegroundColor:", v20);

    objc_msgSend(v43, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v43, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (UIButton *)v21;

    LODWORD(v23) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v3->_cancelButton, "setContentHuggingPriority:forAxis:", 0, v23);
    v24 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    v48[0] = v3->_titleLabel;
    v48[1] = v3->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "mf_addArrangedSubviews:", v25);

    objc_msgSend(v24, "setAxis:", 1);
    objc_msgSend(v24, "setSpacing:", 4.0);
    v26 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    v47[0] = v3->_sendLaterImageView;
    v47[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mf_addArrangedSubviews:", v27);

    objc_msgSend(v26, "setAxis:", 0);
    objc_msgSend(v26, "setAlignment:", 1);
    objc_msgSend(v26, "setSpacing:", 12.0);
    v28 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    v46[0] = v26;
    v46[1] = v3->_cancelButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "mf_addArrangedSubviews:", v29);

    objc_msgSend(v28, "setAxis:", 0);
    objc_msgSend(v28, "setAlignment:", 1);
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v28, "setSpacing:", 8.0);
    v30 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v30, "addSubview:", v28);
    -[MFComposeSendLaterOnboardingView addSubview:](v3, "addSubview:", v30);
    objc_msgSend(v28, "mf_pinToView:usingLayoutMargins:", v30, 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", v31);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", v32);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_sendLaterImageView, "setTintColor:", v33);

    _EFLocalizedString();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_subtitleLabel, "setText:", v34);

    objc_msgSend(v30, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCornerRadius:", 10.0);

    objc_msgSend(v30, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMasksToBounds:", 1);

    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v30, "setDirectionalLayoutMargins:", 8.0, 13.0, 8.0, 13.0);
    objc_msgSend(v30, "mf_pinToView:usingLayoutMargins:", v3, 1);
    -[MFComposeSendLaterOnboardingView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", 0.0, 16.0, 16.0, 16.0);
    v37 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView heightAnchor](v3->_sendLaterImageView, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView widthAnchor](v3->_sendLaterImageView, "widthAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v41);

  }
  return v3;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIImageView)sendLaterImageView
{
  return self->_sendLaterImageView;
}

- (void)setSendLaterImageView:(id)a3
{
  objc_storeStrong((id *)&self->_sendLaterImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendLaterImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end
