@implementation LPDomainNameIndicator

- (LPDomainNameIndicator)initWithHost:(id)a3
{

  return 0;
}

- (LPDomainNameIndicator)initWithHost:(id)a3 domainName:(id)a4 theme:(id)a5
{
  id v8;
  LPDomainNameIndicator *v9;
  LPDomainNameIndicator *v10;
  uint64_t v11;
  UIVisualEffectView *blurView;
  id v13;
  void *v14;
  uint64_t v15;
  UIVisualEffectView *vibrancyView;
  id v17;
  void *v18;
  uint64_t v19;
  UIImageView *glyphView;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  UILabel *label;
  void *v26;
  double v27;
  double v28;
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
  LPDomainNameIndicator *v42;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  objc_super v83;
  _QWORD v84[16];

  v84[14] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v81 = a4;
  v82 = a5;
  v83.receiver = self;
  v83.super_class = (Class)LPDomainNameIndicator;
  v79 = v8;
  v9 = -[LPComponentView initWithHost:](&v83, sel_initWithHost_, v8);
  v10 = v9;
  if (v9)
  {
    -[LPDomainNameIndicator setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v80);
    blurView = v10->_blurView;
    v10->_blurView = (UIVisualEffectView *)v11;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v10->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v80, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithEffect:", v14);
    vibrancyView = v10->_vibrancyView;
    v10->_vibrancyView = (UIVisualEffectView *)v15;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v10->_vibrancyView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "_lp_systemImageNamed:", CFSTR("safari.fill"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithImage:", v18);
    glyphView = v10->_glyphView;
    v10->_glyphView = (UIImageView *)v19;

    -[UIImageView setContentMode:](v10->_glyphView, "setContentMode:", 4);
    v21 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v82, "domainNameIndicatorIconFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configurationWithFont:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v10->_glyphView, "setPreferredSymbolConfiguration:", v23);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_glyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v10->_label;
    v10->_label = v24;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setText:](v10->_label, "setText:", v81);
    objc_msgSend(v82, "domainNameIndicatorFont");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_label, "setFont:", v26);

    -[UILabel setNumberOfLines:](v10->_label, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v10->_label, "setLineBreakMode:", 4);
    -[UILabel setBaselineAdjustment:](v10->_label, "setBaselineAdjustment:", 2);
    LODWORD(v27) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v10->_label, "setContentCompressionResistancePriority:forAxis:", 1, v27);
    LODWORD(v28) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v10->_label, "setContentCompressionResistancePriority:forAxis:", 0, v28);
    -[LPDomainNameIndicator addSubview:](v10, "addSubview:", v10->_blurView);
    -[UIVisualEffectView contentView](v10->_blurView, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v10->_vibrancyView);

    -[UIVisualEffectView contentView](v10->_vibrancyView, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v10->_glyphView);

    -[UIVisualEffectView contentView](v10->_vibrancyView, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v10->_label);

    v32 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](v10->_glyphView, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v10->_blurView, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:constant:", 5.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v65;
    -[UIImageView topAnchor](v10->_glyphView, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](v10->_blurView, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", 5.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v63;
    -[UIVisualEffectView bottomAnchor](v10->_blurView, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v10->_glyphView, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", 5.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v61;
    -[UILabel leadingAnchor](v10->_label, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v10->_glyphView, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v84[3] = v59;
    -[UIVisualEffectView trailingAnchor](v10->_blurView, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v10->_label, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v84[4] = v57;
    -[UILabel centerYAnchor](v10->_label, "centerYAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView centerYAnchor](v10->_blurView, "centerYAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v84[5] = v55;
    -[UIVisualEffectView leadingAnchor](v10->_blurView, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPDomainNameIndicator leadingAnchor](v10, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", 10.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v84[6] = v53;
    -[LPDomainNameIndicator trailingAnchor](v10, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](v10->_blurView, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", 10.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v84[7] = v51;
    -[UIVisualEffectView topAnchor](v10->_blurView, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPDomainNameIndicator topAnchor](v10, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", 10.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v84[8] = v49;
    -[LPDomainNameIndicator bottomAnchor](v10, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView bottomAnchor](v10->_blurView, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", 10.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v84[9] = v47;
    -[UIVisualEffectView leadingAnchor](v10->_blurView, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v10->_vibrancyView, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v84[10] = v45;
    -[UIVisualEffectView trailingAnchor](v10->_blurView, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](v10->_vibrancyView, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v84[11] = v33;
    -[UIVisualEffectView topAnchor](v10->_blurView, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](v10->_vibrancyView, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v32;
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v84[12] = v37;
    -[UIVisualEffectView bottomAnchor](v10->_blurView, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView bottomAnchor](v10->_vibrancyView, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v84[13] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v41);

    v42 = v10;
  }

  return v10;
}

- (void)layoutComponentView
{
  UIVisualEffectView *blurView;
  double v3;

  blurView = self->_blurView;
  -[UIVisualEffectView frame](blurView, "frame");
  -[UIVisualEffectView _lp_setCornerRadius:](blurView, "_lp_setCornerRadius:", v3 * 0.5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
}

@end
