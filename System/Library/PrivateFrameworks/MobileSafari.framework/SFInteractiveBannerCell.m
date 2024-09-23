@implementation SFInteractiveBannerCell

- (void)_updateActionButtonWithText:(id)a3
{
  UIButton *actionButton;
  id v4;
  void *v6;
  id v7;
  void *v8;
  UIButton *v9;
  UIButton *v10;
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  actionButton = self->_actionButton;
  if (actionButton)
  {
    v4 = a3;
    -[UIButton setTitle:forState:](actionButton, "setTitle:forState:", v4, 0);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0DC3520];
    v7 = a3;
    objc_msgSend(v6, "grayButtonConfiguration");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentInsets:", 6.0, 14.0, 6.0, 14.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBaseForegroundColor:", v8);

    objc_msgSend(v4, "setCornerStyle:", 4);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v4, 0);
    v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v10 = self->_actionButton;
    self->_actionButton = v9;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton titleLabel](self->_actionButton, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);

    -[UIButton setTitle:forState:](self->_actionButton, "setTitle:forState:", v7, 0);
    -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__actionButtonTapped_, 0x2000);
    -[SFInteractiveBannerCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", self->_actionButton);
    objc_msgSend(v29, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton leadingAnchor](self->_actionButton, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](self->_captionLabel, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v26;
    -[UIButton trailingAnchor](self->_actionButton, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v23 = v12;
    objc_msgSend(v12, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v15;
    -[UIButton topAnchor](self->_actionButton, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_textLayoutGuide, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 12.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v18;
    -[UIButton bottomAnchor](self->_actionButton, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v22);

  }
}

- (void)configureUsingBanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id buttonAction;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_captionLabel, "setText:", v5);

  objc_msgSend(v4, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  buttonAction = self->_buttonAction;
  self->_buttonAction = v6;

  objc_msgSend(v4, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFInteractiveBannerCell _updateActionButtonWithText:](self, "_updateActionButtonWithText:", v8);

  v9 = (void *)MEMORY[0x1E0DC12B0];
  objc_msgSend(v4, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "textAttachmentWithImage:", v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v12, "appendAttributedString:", v11);
  -[UILabel setAttributedText:](self->_leadingLabel, "setAttributedText:", v12);

}

- (UILabel)leadingLabel
{
  return self->_leadingLabel;
}

- (UILabel)captionLabel
{
  return self->_captionLabel;
}

- (void)_removeActionButton
{
  UIButton *actionButton;

  -[UIButton removeFromSuperview](self->_actionButton, "removeFromSuperview");
  actionButton = self->_actionButton;
  self->_actionButton = 0;

}

- (SFInteractiveBannerCell)initWithFrame:(CGRect)a3
{
  SFInteractiveBannerCell *v3;
  SFInteractiveBannerCell *v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *backgroundEffectView;
  void *v8;
  UILabel *v9;
  UILabel *leadingLabel;
  void *v11;
  double v12;
  double v13;
  UILabel *v14;
  UILabel *captionLabel;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILayoutGuide *v20;
  UILayoutGuide *textLayoutGuide;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIVisualEffectView *v33;
  void *v34;
  id v35;
  SFInteractiveBannerCell *v36;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  objc_super v71;
  _QWORD v72[14];

  v72[12] = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)SFInteractiveBannerCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v71, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFStartPageFilledBackgroundCell defaultBackgroundConfiguration](v3, "defaultBackgroundConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024PrivacyReportEnabled") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3F58], "sf_startPageCellBackgroundEffectViewWithShadow:", 1);
      v6 = objc_claimAutoreleasedReturnValue();
      backgroundEffectView = v4->_backgroundEffectView;
      v4->_backgroundEffectView = (UIVisualEffectView *)v6;

      objc_msgSend(v5, "setCustomView:", v4->_backgroundEffectView);
    }
    objc_msgSend(v5, "setCornerRadius:", 10.0);
    -[SFInteractiveBannerCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v5);
    -[SFInteractiveBannerCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayoutMargins:", 20.0, 20.0, 20.0, 20.0);
    v70 = v5;
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    leadingLabel = v4->_leadingLabel;
    v4->_leadingLabel = v9;

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_leadingLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_leadingLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_leadingLabel, "setFont:", v11);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_leadingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_leadingLabel, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    LODWORD(v13) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_leadingLabel, "setContentHuggingPriority:forAxis:", 0, v13);
    objc_msgSend(v8, "addSubview:", v4->_leadingLabel);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    captionLabel = v4->_captionLabel;
    v4->_captionLabel = v14;

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_captionLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMaximumContentSizeCategory:](v4->_captionLabel, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B10]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fontDescriptorWithSymbolicTraits:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v17, "pointSize");
    objc_msgSend(v18, "fontWithDescriptor:size:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v4->_captionLabel, "setFont:", v19);
    -[UILabel setNumberOfLines:](v4->_captionLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_captionLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_captionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v69 = v8;
    objc_msgSend(v8, "addSubview:", v4->_captionLabel);
    v20 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    textLayoutGuide = v4->_textLayoutGuide;
    v4->_textLayoutGuide = v20;

    -[UILayoutGuide setIdentifier:](v4->_textLayoutGuide, "setIdentifier:", CFSTR("SFPrivacyReportBannerText"));
    objc_msgSend(v8, "addLayoutGuide:", v4->_textLayoutGuide);
    objc_msgSend(v8, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)MEMORY[0x1E0CB3718];
    -[UILayoutGuide leadingAnchor](v4->_textLayoutGuide, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v66;
    -[UILayoutGuide widthAnchor](v4->_textLayoutGuide, "widthAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "widthAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v62;
    -[UILayoutGuide topAnchor](v4->_textLayoutGuide, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v59;
    -[UILayoutGuide heightAnchor](v4->_textLayoutGuide, "heightAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v22;
    objc_msgSend(v22, "heightAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintLessThanOrEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v72[3] = v56;
    -[UILayoutGuide centerYAnchor](v4->_textLayoutGuide, "centerYAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerYAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1144750080;
    objc_msgSend(v53, "sf_withPriority:", v23);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v72[4] = v51;
    -[UILabel leadingAnchor](v4->_leadingLabel, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_textLayoutGuide, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v72[5] = v48;
    -[UILabel topAnchor](v4->_leadingLabel, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v4->_textLayoutGuide, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v72[6] = v45;
    -[UILabel heightAnchor](v4->_leadingLabel, "heightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide heightAnchor](v4->_textLayoutGuide, "heightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v72[7] = v42;
    -[UILabel leadingAnchor](v4->_captionLabel, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v4->_leadingLabel, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 20.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v72[8] = v39;
    -[UILabel trailingAnchor](v4->_captionLabel, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_textLayoutGuide, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v72[9] = v25;
    -[UILabel topAnchor](v4->_captionLabel, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v4->_textLayoutGuide, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v72[10] = v28;
    -[UILabel heightAnchor](v4->_captionLabel, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide heightAnchor](v4->_textLayoutGuide, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v72[11] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "activateConstraints:", v32);

    -[SFInteractiveBannerCell _updateVibrancy](v4, "_updateVibrancy");
    v33 = v4->_backgroundEffectView;
    objc_msgSend(MEMORY[0x1E0DC3F58], "sf_startPageBackgroundTraits");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (id)-[UIVisualEffectView registerForTraitChanges:withTarget:action:](v33, "registerForTraitChanges:withTarget:action:", v34, v4, sel__updateVibrancy);

    v36 = v4;
  }

  return v4;
}

- (void)_updateVibrancy
{
  -[UIVisualEffectView sf_configureAsStartPageBackground](self->_backgroundEffectView, "sf_configureAsStartPageBackground");
}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("InteractiveBanner");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  UIVisualEffectView *backgroundEffectView;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[SFInteractiveBannerCell isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)SFInteractiveBannerCell;
  -[SFInteractiveBannerCell setHighlighted:](&v8, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    backgroundEffectView = self->_backgroundEffectView;
    -[SFInteractiveBannerCell configurationState](self, "configurationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView sf_setHighlighted:cellState:](backgroundEffectView, "sf_setHighlighted:cellState:", v3, v7);

  }
}

- (void)_actionButtonTapped:(id)a3
{
  void (**buttonAction)(void);

  buttonAction = (void (**)(void))self->_buttonAction;
  if (buttonAction)
    buttonAction[2]();
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return (_UIVisualEffectBackdropView *)-[UIVisualEffectView _captureView](self->_backgroundEffectView, "_captureView");
}

- (void)setBackdropCaptureView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UIVisualEffectView _captureView](self->_backgroundEffectView, "_captureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
    -[UIVisualEffectView _setCaptureView:](self->_backgroundEffectView, "_setCaptureView:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_leadingLabel, 0);
}

@end
