@implementation HRMiniTilePlatterView

- (HRMiniTilePlatterView)initWithtitle:(id)a3 body:(id)a4 footnote:(id)a5 icon:(id)a6 actionText:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HRMiniTilePlatterView *v17;
  HRMiniTilePlatterView *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HRMiniTilePlatterView;
  v17 = -[HRMiniTilePlatterView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_body, a4);
    objc_storeStrong((id *)&v18->_footnote, a5);
    objc_storeStrong((id *)&v18->_icon, a6);
    objc_storeStrong((id *)&v18->_actionText, a7);
    -[HRMiniTilePlatterView _setupView](v18, "_setupView");
    -[HRMiniTilePlatterView _setupConstraints](v18, "_setupConstraints");
  }

  return v18;
}

- (void)_setupView
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  id v33;

  -[HRMiniTilePlatterView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[UIView hrui_maskAllCornersWithRadius:](self, "hrui_maskAllCornersWithRadius:", *MEMORY[0x24BE4A250]);
  v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
  -[HRMiniTilePlatterView icon](self, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v10);

  objc_msgSend(v9, "setContentMode:", 4);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HRMiniTilePlatterView setIconImageView:](self, "setIconImageView:", v9);

  -[HRMiniTilePlatterView iconImageView](self, "iconImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView addSubview:](self, "addSubview:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
  -[HRMiniTilePlatterView title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  -[HRMiniTilePlatterView _titleFont](self, "_titleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v14);

  objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12, "setNumberOfLines:", 0);
  -[HRMiniTilePlatterView setTitleLabel:](self, "setTitleLabel:", v12);

  -[HRMiniTilePlatterView titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView addSubview:](self, "addSubview:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
  -[HRMiniTilePlatterView body](self, "body");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v17);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v18);

  -[HRMiniTilePlatterView _bodyFont](self, "_bodyFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v19);

  objc_msgSend(v16, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "setNumberOfLines:", 0);
  -[HRMiniTilePlatterView setBodyLabel:](self, "setBodyLabel:", v16);

  -[HRMiniTilePlatterView bodyLabel](self, "bodyLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView addSubview:](self, "addSubview:", v20);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
  -[HRMiniTilePlatterView footnote](self, "footnote");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v22);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextColor:", v23);

  -[HRMiniTilePlatterView _footnoteFont](self, "_footnoteFont");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v24);

  objc_msgSend(v21, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v21, "setNumberOfLines:", 0);
  -[HRMiniTilePlatterView setFootnoteLabel:](self, "setFootnoteLabel:", v21);

  -[HRMiniTilePlatterView footnoteLabel](self, "footnoteLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView addSubview:](self, "addSubview:", v25);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A838]), "initWithFrame:", v5, v6, v7, v8);
  objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setColor:", v27);

  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HRMiniTilePlatterView setSeparatorView:](self, "setSeparatorView:", v26);

  -[HRMiniTilePlatterView separatorView](self, "separatorView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView addSubview:](self, "addSubview:", v28);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
  -[HRMiniTilePlatterView actionText](self, "actionText");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v30);

  objc_msgSend(MEMORY[0x24BDF6950], "hk_appKeyColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTextColor:", v31);

  -[HRMiniTilePlatterView _actionFont](self, "_actionFont");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v32);

  objc_msgSend(v29, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v29, "setNumberOfLines:", 0);
  -[HRMiniTilePlatterView setActionLabel:](self, "setActionLabel:", v29);

  -[HRMiniTilePlatterView actionLabel](self, "actionLabel");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView addSubview:](self, "addSubview:", v33);

}

- (void)_setupConstraints
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
  id v73;

  -[HRMiniTilePlatterView iconImageView](self, "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", 45.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  -[HRMiniTilePlatterView iconImageView](self, "iconImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 45.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[HRMiniTilePlatterView iconImageView](self, "iconImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView topAnchor](self, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 12.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[HRMiniTilePlatterView iconImageView](self, "iconImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView leadingAnchor](self, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 14.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HRMiniTilePlatterView titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView iconImageView](self, "iconImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[HRMiniTilePlatterView titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView iconImageView](self, "iconImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 11.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[HRMiniTilePlatterView titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView trailingAnchor](self, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -14.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[HRMiniTilePlatterView bodyLabel](self, "bodyLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView titleLabel](self, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView _titleBottomToBodyTop](self, "_titleBottomToBodyTop");
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[HRMiniTilePlatterView bodyLabel](self, "bodyLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView titleLabel](self, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "hk_alignHorizontalConstraintsWithView:margin:", v37, 0.0);

  -[HRMiniTilePlatterView footnoteLabel](self, "footnoteLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView bodyLabel](self, "bodyLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView _bodyBottomToFootnoteTop](self, "_bodyBottomToFootnoteTop");
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  -[HRMiniTilePlatterView footnoteLabel](self, "footnoteLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView bodyLabel](self, "bodyLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "hk_alignHorizontalConstraintsWithView:margin:", v44, 0.0);

  -[HRMiniTilePlatterView separatorView](self, "separatorView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView footnoteLabel](self, "footnoteLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, 12.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[HRMiniTilePlatterView separatorView](self, "separatorView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "heightAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView separatorView](self, "separatorView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "separatorThickness");
  objc_msgSend(v51, "constraintEqualToConstant:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setActive:", 1);

  -[HRMiniTilePlatterView separatorView](self, "separatorView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView footnoteLabel](self, "footnoteLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setActive:", 1);

  -[HRMiniTilePlatterView separatorView](self, "separatorView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView trailingAnchor](self, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setActive:", 1);

  -[HRMiniTilePlatterView actionLabel](self, "actionLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView separatorView](self, "separatorView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, 12.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  -[HRMiniTilePlatterView actionLabel](self, "actionLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView bottomAnchor](self, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, -12.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setActive:", 1);

  -[HRMiniTilePlatterView actionLabel](self, "actionLabel");
  v73 = (id)objc_claimAutoreleasedReturnValue();
  -[HRMiniTilePlatterView footnoteLabel](self, "footnoteLabel");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "hk_alignHorizontalConstraintsWithView:margin:", v72, 0.0);

}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRMiniTilePlatterView _titleFontTextStyle](self, "_titleFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x24BDF7810];
}

- (id)_bodyFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRMiniTilePlatterView _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_footnoteTextStyle
{
  return (id)*MEMORY[0x24BDF77D0];
}

- (id)_footnoteFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRMiniTilePlatterView _footnoteTextStyle](self, "_footnoteTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_actionTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_actionFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRMiniTilePlatterView _actionTextStyle](self, "_actionTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_titleBottomToBodyTop
{
  void *v2;
  double v3;
  double v4;

  -[HRMiniTilePlatterView _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 4.0);
  v4 = v3;

  return v4;
}

- (double)_bodyBottomToFootnoteTop
{
  void *v2;
  double v3;
  double v4;

  -[HRMiniTilePlatterView _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 6.0);
  v4 = v3;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)actionText
{
  return self->_actionText;
}

- (void)setActionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (UILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteLabel, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (HKSeparatorLineView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UILabel)actionLabel
{
  return self->_actionLabel;
}

- (void)setActionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_actionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
