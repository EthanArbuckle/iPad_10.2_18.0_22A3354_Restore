@implementation SFCreditCardCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("CreditCardCell");
}

- (SFCreditCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  SFCreditCardCollectionViewCell *v3;
  SFCreditCardCollectionViewCell *v4;
  UILabel *v5;
  UILabel *cardNameLabel;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIVisualEffectView *v22;
  UIVisualEffectView *vibrantWalletImageView;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UILabel *v29;
  UILabel *cardDescriptionLabel;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  UILabel *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  UIStackView *cardDescriptionStackView;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  UIImageView *cardArt;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  UIStackView *topLevelStackView;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  SFCreditCardCollectionViewCell *v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  objc_super v90;
  _QWORD v91[4];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[4];

  v96[2] = *MEMORY[0x1E0C80C00];
  v90.receiver = self;
  v90.super_class = (Class)SFCreditCardCollectionViewCell;
  v3 = -[SFCreditCardCollectionViewCell initWithFrame:](&v90, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFCreditCardCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CreditCardCell"));
    -[SFCreditCardCollectionViewCell contentView](v4, "contentView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    cardNameLabel = v4->_cardNameLabel;
    v4->_cardNameLabel = v5;

    v7 = (void *)MEMORY[0x1E0DC37E8];
    v8 = *MEMORY[0x1E0DC4AB8];
    v9 = *MEMORY[0x1E0DC4918];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_cardNameLabel, "setFont:", v11);

    v12 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("wallet.fill"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithImage:", v13);

    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

    v16 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v14, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 18.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = v18;
    objc_msgSend(v14, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 20.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v96[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v21);

    v22 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    vibrantWalletImageView = v4->_vibrantWalletImageView;
    v4->_vibrantWalletImageView = v22;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v87, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](v4->_vibrantWalletImageView, "setEffect:", v24);

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4->_vibrantWalletImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView contentView](v4->_vibrantWalletImageView, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v14;
    objc_msgSend(v25, "addSubview:", v14);

    v26 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView contentView](v4->_vibrantWalletImageView, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safari_constraintsMatchingFrameOfView:withFrameOfView:", v14, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v28);

    v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    cardDescriptionLabel = v4->_cardDescriptionLabel;
    v4->_cardDescriptionLabel = v29;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_cardDescriptionLabel, "setTextColor:", v31);

    v32 = (void *)MEMORY[0x1E0DC37E8];
    v33 = *MEMORY[0x1E0DC4A98];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "preferredFontForTextStyle:compatibleWithTraitCollection:", v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_cardDescriptionLabel, "setFont:", v35);

    -[UILabel setLineBreakMode:](v4->_cardDescriptionLabel, "setLineBreakMode:", 5);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_cardDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v36 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v87, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setEffect:", v37);

    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v36, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v4->_cardDescriptionLabel);

    v39 = (void *)MEMORY[0x1E0CB3718];
    v40 = v4->_cardDescriptionLabel;
    v41 = v36;
    v86 = v36;
    objc_msgSend(v36, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "safari_constraintsMatchingFrameOfView:withFrameOfView:", v40, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v43);

    v44 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v95[0] = v4->_vibrantWalletImageView;
    v95[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "initWithArrangedSubviews:", v45);
    cardDescriptionStackView = v4->_cardDescriptionStackView;
    v4->_cardDescriptionStackView = (UIStackView *)v46;

    -[UIStackView setAxis:](v4->_cardDescriptionStackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v4->_cardDescriptionStackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v4->_cardDescriptionStackView, "setSpacing:", 4.0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v4->_cardDescriptionStackView, "setLayoutMarginsRelativeArrangement:", 1);
    v48 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v94[0] = v4->_cardNameLabel;
    v94[1] = v4->_cardDescriptionStackView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v48, "initWithArrangedSubviews:", v49);

    objc_msgSend(v50, "setAxis:", 1);
    objc_msgSend(v50, "setDistribution:", 2);
    objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v85 = v50;
    objc_msgSend(v50, "setSpacing:", 2.0);
    v51 = objc_alloc(MEMORY[0x1E0DC3890]);
    SFLargeCreditCardIconForType();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "initWithImage:", v52);
    cardArt = v4->_cardArt;
    v4->_cardArt = (UIImageView *)v53;

    v55 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView widthAnchor](v4->_cardArt, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToConstant:", 56.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v57;
    -[UIImageView heightAnchor](v4->_cardArt, "heightAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToConstant:", 36.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v59;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v60);

    -[UIImageView setContentMode:](v4->_cardArt, "setContentMode:", 8);
    v61 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v92[0] = v4->_cardArt;
    v92[1] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "initWithArrangedSubviews:", v62);
    topLevelStackView = v4->_topLevelStackView;
    v4->_topLevelStackView = (UIStackView *)v63;

    -[UIStackView setAxis:](v4->_topLevelStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v4->_topLevelStackView, "setDistribution:", 2);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_topLevelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v4->_topLevelStackView, "setSpacing:", 10.0);
    -[UIStackView directionalLayoutMargins](v4->_topLevelStackView, "directionalLayoutMargins");
    -[UIStackView setDirectionalLayoutMargins:](v4->_topLevelStackView, "setDirectionalLayoutMargins:", v65 + 8.0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v4->_topLevelStackView, "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v89, "addSubview:", v4->_topLevelStackView);
    v78 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView centerYAnchor](v4->_topLevelStackView, "centerYAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "centerYAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v82;
    -[UIStackView topAnchor](v4->_topLevelStackView, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v79;
    -[UIStackView leadingAnchor](v4->_topLevelStackView, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "layoutMarginsGuide");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v69;
    -[UIStackView trailingAnchor](v4->_topLevelStackView, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "layoutMarginsGuide");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v91[3] = v73;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 4);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "activateConstraints:", v74);

    v75 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v75, "_setContinuousCornerRadius:", 12.0);
    -[SFCreditCardCollectionViewCell setBackgroundView:](v4, "setBackgroundView:", v75);
    v76 = v4;

  }
  return v4;
}

- (void)configureViewWithCardData:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;

  v5 = a3;
  if ((WBSIsEqual() & 1) != 0)
    goto LABEL_21;
  objc_storeStrong((id *)&self->_cardData, a3);
  objc_msgSend(v5, "cardName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v5, "cardName");
  else
    _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_cardNameLabel, "setText:", v7);
  -[UIStackView directionalLayoutMargins](self->_cardDescriptionStackView, "directionalLayoutMargins");
  v9 = v8;
  v11 = v10;
  if (objc_msgSend(v5, "isVirtualCard"))
    v12 = -2.0;
  else
    v12 = 0.0;
  if (objc_msgSend(v5, "isVirtualCard"))
    v13 = -4.0;
  else
    v13 = 0.0;
  -[UIStackView setDirectionalLayoutMargins:](self->_cardDescriptionStackView, "setDirectionalLayoutMargins:", v9, v12, v13, v11);
  -[UIVisualEffectView setHidden:](self->_vibrantWalletImageView, "setHidden:", objc_msgSend(v5, "isVirtualCard") ^ 1);
  objc_msgSend(v5, "cardNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WBSLastDigitsOfCreditCardNumber();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "isVirtualCard"))
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringWithFormat:", v16, v15);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v17 = (void *)v20;
    -[UILabel setText:](self->_cardDescriptionLabel, "setText:", v20);
    goto LABEL_17;
  }
  objc_msgSend(v5, "balance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    WBSDisplayTextForCreditCardNumber();
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(v5, "balance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "formattedStringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_cardDescriptionLabel, "setText:", v18);

LABEL_17:
  if (objc_msgSend(v5, "isVirtualCard"))
  {
    -[UIImageView setAlpha:](self->_cardArt, "setAlpha:", 0.0);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__SFCreditCardCollectionViewCell_configureViewWithCardData___block_invoke;
    v23[3] = &unk_1E4AC2570;
    v23[4] = self;
    v24 = v5;
    objc_msgSend(v24, "virtualCardArtworkWithSize:completionHandler:", v23, 56.0, 36.0);

  }
  else
  {
    objc_msgSend(v5, "cardNumber");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    WBSCreditCardTypeFromNumber();
    SFLargeCreditCardIconForType();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_cardArt, "setImage:", v22);

    -[UIImageView setAlpha:](self->_cardArt, "setAlpha:", 1.0);
  }
  -[SFCreditCardCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

LABEL_21:
}

void __60__SFCreditCardCollectionViewCell_configureViewWithCardData___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (WBSIsEqual())
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setImage:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setAlpha:", 1.0);
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[SFCreditCardCollectionViewCell isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)SFCreditCardCollectionViewCell;
  -[SFCreditCardCollectionViewCell setHighlighted:](&v8, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    if (v3)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCreditCardCollectionViewCell backgroundView](self, "backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
}

- (WBSCreditCardData)cardData
{
  return self->_cardData;
}

- (void)setCardData:(id)a3
{
  objc_storeStrong((id *)&self->_cardData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardData, 0);
  objc_storeStrong((id *)&self->_cardDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_vibrantWalletImageView, 0);
  objc_storeStrong((id *)&self->_cardNameLabel, 0);
  objc_storeStrong((id *)&self->_cardArt, 0);
  objc_storeStrong((id *)&self->_cardDescriptionStackView, 0);
  objc_storeStrong((id *)&self->_topLevelStackView, 0);
}

@end
