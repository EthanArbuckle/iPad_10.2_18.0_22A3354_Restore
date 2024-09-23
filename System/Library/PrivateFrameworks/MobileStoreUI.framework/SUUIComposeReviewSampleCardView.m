@implementation SUUIComposeReviewSampleCardView

- (SUUIComposeReviewSampleCardView)initWithFrame:(CGRect)a3
{
  SUUIComposeReviewSampleCardView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIComposeReviewSampleCardView;
  v3 = -[SUUIComposeReviewSampleCardView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIComposeReviewSampleCardView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SUUIComposeReviewSampleCardView _setupView](v3, "_setupView");
  }
  return v3;
}

- (void)_setupView
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
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;

  -[SUUIComposeReviewSampleCardView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 12.0);

  -[SUUIComposeReviewSampleCardView setClipsToBounds:](self, "setClipsToBounds:", 0);
  v99 = (id)objc_opt_new();
  objc_msgSend(v99, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setBackgroundColor:", v4);

  objc_msgSend(v99, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 5.0);

  -[SUUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v99);
  objc_msgSend(v99, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  objc_msgSend(v99, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView leadingAnchor](self, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 20.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v99, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 66.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(v99, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 11.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SUUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v16);
  objc_msgSend(v16, "layoutSubviews");
  objc_msgSend(v16, "firstBaselineAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView topAnchor](self, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 50.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  objc_msgSend(v16, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView leadingAnchor](self, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 20.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  SUUIFontLimitedPreferredFontForTextStyle(11, 7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v24);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextColor:", v25);

  -[SUUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v23);
  objc_msgSend(v23, "firstBaselineAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstBaselineAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 5.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  objc_msgSend(v23, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView trailingAnchor](self, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -20.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  objc_msgSend(v23, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView centerXAnchor](self, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:constant:", v33, 20.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("NICKNAME_VIEW_PLACEHOLDER"), &stru_2511FF0C8, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v36);

  v37 = (void *)objc_opt_new();
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v38 = (void *)MEMORY[0x24BEBD660];
  SUUIFontLimitedPreferredFontForTextStyle(30, 7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "configurationWithFont:", v39);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "imageNamed:inBundle:", CFSTR("arrow.backward.extended"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "imageWithSymbolConfiguration:", v98);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "setImage:", v97);
  -[SUUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v37);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTintColor:", v43);

  objc_msgSend(v37, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, 14.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  objc_msgSend(v37, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  v50 = (void *)objc_opt_new();
  objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setBackgroundColor:", v51);

  objc_msgSend(v50, "layer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setCornerRadius:", 5.0);

  -[SUUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v50);
  objc_msgSend(v50, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstBaselineAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 13.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

  objc_msgSend(v50, "widthAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToConstant:", 222.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

  objc_msgSend(v50, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView leadingAnchor](self, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 20.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setActive:", 1);

  objc_msgSend(v50, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView trailingAnchor](self, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, -20.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setActive:", 1);

  objc_msgSend(v50, "heightAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToConstant:", 11.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setActive:", 1);

  v66 = (void *)objc_opt_new();
  objc_msgSend(v66, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setBackgroundColor:", v67);

  objc_msgSend(v66, "layer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setCornerRadius:", 5.0);

  -[SUUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v66);
  objc_msgSend(v66, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, 7.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setActive:", 1);

  objc_msgSend(v66, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView leadingAnchor](self, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, 20.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setActive:", 1);

  objc_msgSend(v66, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView trailingAnchor](self, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, -20.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setActive:", 1);

  objc_msgSend(v66, "heightAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToConstant:", 11.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setActive:", 1);

  v80 = (void *)objc_opt_new();
  objc_msgSend(v80, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setBackgroundColor:", v81);

  objc_msgSend(v80, "layer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setCornerRadius:", 5.0);

  -[SUUIComposeReviewSampleCardView addSubview:](self, "addSubview:", v80);
  objc_msgSend(v80, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "bottomAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84, 7.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setActive:", 1);

  objc_msgSend(v80, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView leadingAnchor](self, "leadingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:constant:", v87, 20.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setActive:", 1);

  objc_msgSend(v80, "trailingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView trailingAnchor](self, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, -20.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setActive:", 1);

  objc_msgSend(v80, "heightAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToConstant:", 11.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setActive:", 1);

  objc_msgSend(v80, "bottomAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewSampleCardView bottomAnchor](self, "bottomAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95, -20.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setActive:", 1);

}

@end
