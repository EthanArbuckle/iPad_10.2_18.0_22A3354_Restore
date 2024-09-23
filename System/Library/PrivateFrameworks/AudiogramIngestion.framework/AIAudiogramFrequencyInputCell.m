@implementation AIAudiogramFrequencyInputCell

- (AIAudiogramFrequencyInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AIAudiogramFrequencyInputCell *v4;
  void *v5;
  uint64_t v6;
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
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
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
  objc_super v83;
  _QWORD v84[4];
  _QWORD v85[4];
  _QWORD v86[2];
  _QWORD v87[4];

  v87[2] = *MEMORY[0x24BDAC8D0];
  v83.receiver = self;
  v83.super_class = (Class)AIAudiogramFrequencyInputCell;
  v4 = -[AIAudiogramFrequencyInputCell initWithStyle:reuseIdentifier:](&v83, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBD5E0], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBE270]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell createLabelWithText:textColor:font:](v4, "createLabelWithText:textColor:font:", &stru_24FD6E4F8, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell setFrequencyLabel:](v4, "setFrequencyLabel:", v8);

    aiLocString(CFSTR("AudiogramIngestionDecibelAbbreviation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell createLabelWithText:textColor:font:](v4, "createLabelWithText:textColor:font:", v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell setLeftEarSensitivity:](v4, "setLeftEarSensitivity:", v12);

    aiLocString(CFSTR("AudiogramIngestionDecibelAbbreviation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell createLabelWithText:textColor:font:](v4, "createLabelWithText:textColor:font:", v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell setRightEarSensitivity:](v4, "setRightEarSensitivity:", v16);

    filledImageForSymbolType(11);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell createImageViewWithImage:symbolType:](v4, "createImageViewWithImage:symbolType:", v82, 11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell setLeftEarSymbolImageView:](v4, "setLeftEarSymbolImageView:", v17);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell leftEarSymbolImageView](v4, "leftEarSymbolImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTintColor:", v18);

    labelForSymbolType(11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell leftEarSymbolImageView](v4, "leftEarSymbolImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAccessibilityLabel:", v20);

    filledImageForSymbolType(4);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell createImageViewWithImage:symbolType:](v4, "createImageViewWithImage:symbolType:", v81, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell setRightEarSymbolImageView:](v4, "setRightEarSymbolImageView:", v22);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell rightEarSymbolImageView](v4, "rightEarSymbolImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTintColor:", v23);

    labelForSymbolType(4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell rightEarSymbolImageView](v4, "rightEarSymbolImageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAccessibilityLabel:", v25);

    v27 = objc_alloc(MEMORY[0x24BEBD978]);
    -[AIAudiogramFrequencyInputCell leftEarSymbolImageView](v4, "leftEarSymbolImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v28;
    -[AIAudiogramFrequencyInputCell leftEarSensitivity](v4, "leftEarSensitivity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v27, "initWithArrangedSubviews:", v30);
    -[AIAudiogramFrequencyInputCell setLeftEarStackView:](v4, "setLeftEarStackView:", v31);

    -[AIAudiogramFrequencyInputCell leftEarStackView](v4, "leftEarStackView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAxis:", 0);

    -[AIAudiogramFrequencyInputCell leftEarStackView](v4, "leftEarStackView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDistribution:", 0);

    -[AIAudiogramFrequencyInputCell leftEarStackView](v4, "leftEarStackView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setSpacing:", 7.0);

    v35 = objc_alloc(MEMORY[0x24BEBD978]);
    -[AIAudiogramFrequencyInputCell rightEarSymbolImageView](v4, "rightEarSymbolImageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v36;
    -[AIAudiogramFrequencyInputCell rightEarSensitivity](v4, "rightEarSensitivity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v35, "initWithArrangedSubviews:", v38);
    -[AIAudiogramFrequencyInputCell setRightEarStackView:](v4, "setRightEarStackView:", v39);

    -[AIAudiogramFrequencyInputCell rightEarStackView](v4, "rightEarStackView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAxis:", 0);

    -[AIAudiogramFrequencyInputCell rightEarStackView](v4, "rightEarStackView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setDistribution:", 0);

    -[AIAudiogramFrequencyInputCell rightEarStackView](v4, "rightEarStackView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setSpacing:", 7.0);

    v43 = objc_alloc(MEMORY[0x24BEBD978]);
    -[AIAudiogramFrequencyInputCell frequencyLabel](v4, "frequencyLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v44;
    v45 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    v85[1] = v45;
    -[AIAudiogramFrequencyInputCell leftEarStackView](v4, "leftEarStackView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v85[2] = v46;
    -[AIAudiogramFrequencyInputCell rightEarStackView](v4, "rightEarStackView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v85[3] = v47;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v43, "initWithArrangedSubviews:", v48);
    -[AIAudiogramFrequencyInputCell setContainerStackView:](v4, "setContainerStackView:", v49);

    -[AIAudiogramFrequencyInputCell containerStackView](v4, "containerStackView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setAxis:", 0);

    -[AIAudiogramFrequencyInputCell containerStackView](v4, "containerStackView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setDistribution:", 0);

    -[AIAudiogramFrequencyInputCell containerStackView](v4, "containerStackView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setSpacing:", 8.0);

    -[AIAudiogramFrequencyInputCell containerStackView](v4, "containerStackView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell leftEarStackView](v4, "leftEarStackView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setCustomSpacing:afterView:", v54, 20.0);

    -[AIAudiogramFrequencyInputCell containerStackView](v4, "containerStackView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramFrequencyInputCell contentView](v4, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell containerStackView](v4, "containerStackView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v57);

    v72 = (void *)MEMORY[0x24BDD1628];
    -[AIAudiogramFrequencyInputCell containerStackView](v4, "containerStackView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell contentView](v4, "contentView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, 16.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v76;
    -[AIAudiogramFrequencyInputCell containerStackView](v4, "containerStackView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell contentView](v4, "contentView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v71, -7.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v70;
    -[AIAudiogramFrequencyInputCell containerStackView](v4, "containerStackView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell contentView](v4, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v59, 12.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v60;
    -[AIAudiogramFrequencyInputCell containerStackView](v4, "containerStackView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell contentView](v4, "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64, -12.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v84[3] = v65;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 4);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "activateConstraints:", v66);

    -[AIAudiogramFrequencyInputCell setHearingLevel:](v4, "setHearingLevel:", 0);
  }
  return v4;
}

- (void)configureLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  float Width;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v48[1] = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramFrequencyInputCell frequencyLabel](self, "frequencyLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFrequencyInputCell frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v47 = *MEMORY[0x24BEBD270];
  v9 = v47;
  -[AIAudiogramFrequencyInputCell frequencyLabel](self, "frequencyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 32, v12, 0, v6, v8);
  Width = CGRectGetWidth(v49);

  -[AIAudiogramFrequencyInputCell leftEarSensitivity](self, "leftEarSensitivity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFrequencyInputCell frame](self, "frame");
  v17 = v16;
  v19 = v18;
  v45 = v9;
  -[AIAudiogramFrequencyInputCell leftEarSensitivity](self, "leftEarSensitivity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 32, v22, 0, v17, v19);
  v23 = CGRectGetWidth(v50);

  -[AIAudiogramFrequencyInputCell rightEarSensitivity](self, "rightEarSensitivity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFrequencyInputCell frame](self, "frame");
  v27 = v26;
  v29 = v28;
  v43 = v9;
  -[AIAudiogramFrequencyInputCell rightEarSensitivity](self, "rightEarSensitivity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "font");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "boundingRectWithSize:options:attributes:context:", 32, v32, 0, v27, v29);
  *(float *)&v27 = CGRectGetWidth(v51);

  -[AIAudiogramFrequencyInputCell frame](self, "frame");
  v33 = CGRectGetWidth(v52) * 0.6;
  -[AIAudiogramFrequencyInputCell containerStackView](self, "containerStackView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v33 >= (float)((float)(Width + v23) + *(float *)&v27))
  {
    objc_msgSend(v34, "setAxis:", 0);

    -[AIAudiogramFrequencyInputCell containerStackView](self, "containerStackView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAlignment:", 0);

    -[AIAudiogramFrequencyInputCell containerStackView](self, "containerStackView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setSpacing:", 8.0);

    -[AIAudiogramFrequencyInputCell containerStackView](self, "containerStackView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell leftEarStackView](self, "leftEarStackView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 20.0;
  }
  else
  {
    objc_msgSend(v34, "setAxis:", 1);

    -[AIAudiogramFrequencyInputCell containerStackView](self, "containerStackView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlignment:", 1);

    -[AIAudiogramFrequencyInputCell containerStackView](self, "containerStackView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSpacing:", 0.0);

    -[AIAudiogramFrequencyInputCell containerStackView](self, "containerStackView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell leftEarStackView](self, "leftEarStackView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0.0;
  }
  objc_msgSend(v38, "setCustomSpacing:afterView:", v39, v40);

}

- (id)createLabelWithText:(id)a3 textColor:(id)a4 font:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v10, "setTextColor:", v8);
  objc_msgSend(v10, "setFont:", v7);

  LODWORD(v11) = 1144750080;
  objc_msgSend(v10, "setContentHuggingPriority:forAxis:", 0, v11);
  LODWORD(v12) = 1144750080;
  objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  return v10;
}

- (id)createImageViewWithImage:(id)a3 symbolType:(int64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;

  v6 = (objc_class *)MEMORY[0x24BEBD668];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithImage:", v7);
  objc_msgSend(v8, "setContentMode:", 1);
  -[AIAudiogramFrequencyInputCell _symbolConfigurationForSymbolType:](self, "_symbolConfigurationForSymbolType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredSymbolConfiguration:", v9);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v13 = v12;
  objc_msgSend(v7, "size");
  v15 = v14;

  objc_msgSend(v10, "constraintEqualToAnchor:multiplier:", v11, v13 / v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v17) = 1144750080;
  objc_msgSend(v16, "setPriority:", v17);
  objc_msgSend(v16, "setActive:", 1);
  LODWORD(v18) = 1132068864;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v18);

  return v8;
}

- (id)_symbolConfigurationForSymbolType:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE220], 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 11)
  {
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationByApplyingConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (void)setFrequency:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  double v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a3;
  objc_storeStrong((id *)&self->_frequency, a3);
  v16 = v5;
  if ((int)objc_msgSend(v16, "intValue") < 1000)
  {
    v9 = CFSTR("AudiogramIngestionHertzAbbreviation");
    v10 = v16;
  }
  else
  {
    HIDWORD(v6) = 652835029 * objc_msgSend(v16, "intValue") + 17179864;
    LODWORD(v6) = HIDWORD(v6);
    if ((v6 >> 3) <= 0x418936)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", ((int)objc_msgSend(v16, "intValue") / 1000));
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v16, "doubleValue");
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%.1f"), v8 / 1000.0);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = CFSTR("AudiogramIngestionKiloHertzAbbreviation");
  }
  aiLocString(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  aiLocString(CFSTR("AudiogramIngestionResultsFrequency"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFrequencyInputCell frequencyLabel](self, "frequencyLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

}

- (void)setLeftHearingLevel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  aiLocString(CFSTR("AudiogramIngestionDecibelAbbreviation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  aiLocString(CFSTR("AudiogramIngestionResultsFrequency"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v10)
  {
    aiLocString(CFSTR("AudiogramIngestionResultsNoData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "stringWithFormat:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFrequencyInputCell leftEarSensitivity](self, "leftEarSensitivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  if (!v10)
}

- (void)setRightHearingLevel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  aiLocString(CFSTR("AudiogramIngestionDecibelAbbreviation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  aiLocString(CFSTR("AudiogramIngestionResultsFrequency"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v10)
  {
    aiLocString(CFSTR("AudiogramIngestionResultsNoData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "stringWithFormat:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFrequencyInputCell rightEarSensitivity](self, "rightEarSensitivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  if (!v10)
}

- (void)setLeftEarLabelWidth:(id)a3
{
  -[AIAudiogramFrequencyInputCell _setWidth:forEar:](self, "_setWidth:forEar:", a3, 1);
}

- (void)setRightEarLabelWidth:(id)a3
{
  -[AIAudiogramFrequencyInputCell _setWidth:forEar:](self, "_setWidth:forEar:", a3, 2);
}

- (void)_setWidth:(id)a3 forEar:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  float v15;
  void *v16;
  float v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 == 1)
    -[AIAudiogramFrequencyInputCell leftEarSensitivity](self, "leftEarSensitivity");
  else
    -[AIAudiogramFrequencyInputCell rightEarSensitivity](self, "rightEarSensitivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v7, "constraints", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
LABEL_6:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
      if (objc_msgSend(v13, "firstAttribute") == 7)
      {
        if (objc_msgSend(v13, "isActive"))
        {
          NSClassFromString(CFSTR("NSContentSizeLayoutConstraint"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
        }
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          goto LABEL_6;
        goto LABEL_14;
      }
    }
    v14 = v13;

    if (!v14)
      goto LABEL_17;
    objc_msgSend(v6, "floatValue");
    objc_msgSend(v14, "setConstant:", v15);
  }
  else
  {
LABEL_14:

LABEL_17:
    objc_msgSend(v7, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    objc_msgSend(v16, "constraintEqualToConstant:", v17);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setActive:", 1);
  }

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[AIAudiogramFrequencyInputCell frequencyLabel](self, "frequencyLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = (void *)objc_opt_new();
  -[AIAudiogramFrequencyInputCell leftEarSensitivity](self, "leftEarSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionResultsNoData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsString:", v6);

  if (v7)
  {
    aiLocString(CFSTR("AudiogramIngestionNoLeftSymbol"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v8);
  }
  else
  {
    aiLocString(CFSTR("AudiogramIngestionSymbolAtLevelFormat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell leftEarSymbolImageView](self, "leftEarSymbolImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell leftEarSensitivity](self, "leftEarSensitivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AXCFormattedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v13, v10, v12);

  }
  objc_msgSend(v3, "appendString:", CFSTR(", "));
  -[AIAudiogramFrequencyInputCell rightEarSensitivity](self, "rightEarSensitivity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionResultsNoData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "containsString:", v16);

  if (v17)
  {
    aiLocString(CFSTR("AudiogramIngestionNoRightSymbol"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v18);
  }
  else
  {
    aiLocString(CFSTR("AudiogramIngestionSymbolAtLevelFormat"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell rightEarSymbolImageView](self, "rightEarSymbolImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accessibilityLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFrequencyInputCell rightEarSensitivity](self, "rightEarSensitivity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accessibilityLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AXCFormattedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v23, v20, v22);

  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF00];
}

- (int64_t)ear
{
  return self->_ear;
}

- (void)setEar:(int64_t)a3
{
  self->_ear = a3;
}

- (NSNumber)frequency
{
  return self->_frequency;
}

- (NSNumber)hearingLevel
{
  return self->_hearingLevel;
}

- (void)setHearingLevel:(id)a3
{
  objc_storeStrong((id *)&self->_hearingLevel, a3);
}

- (NSNumber)leftHearingLevel
{
  return self->_leftHearingLevel;
}

- (NSNumber)rightHearingLevel
{
  return self->_rightHearingLevel;
}

- (UILabel)frequencyLabel
{
  return self->_frequencyLabel;
}

- (void)setFrequencyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_frequencyLabel, a3);
}

- (UIStackView)containerStackView
{
  return self->_containerStackView;
}

- (void)setContainerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_containerStackView, a3);
}

- (UIImageView)leftEarSymbolImageView
{
  return self->_leftEarSymbolImageView;
}

- (void)setLeftEarSymbolImageView:(id)a3
{
  objc_storeStrong((id *)&self->_leftEarSymbolImageView, a3);
}

- (UIImageView)rightEarSymbolImageView
{
  return self->_rightEarSymbolImageView;
}

- (void)setRightEarSymbolImageView:(id)a3
{
  objc_storeStrong((id *)&self->_rightEarSymbolImageView, a3);
}

- (UILabel)leftEarSensitivity
{
  return self->_leftEarSensitivity;
}

- (void)setLeftEarSensitivity:(id)a3
{
  objc_storeStrong((id *)&self->_leftEarSensitivity, a3);
}

- (UILabel)rightEarSensitivity
{
  return self->_rightEarSensitivity;
}

- (void)setRightEarSensitivity:(id)a3
{
  objc_storeStrong((id *)&self->_rightEarSensitivity, a3);
}

- (UIStackView)leftEarStackView
{
  return self->_leftEarStackView;
}

- (void)setLeftEarStackView:(id)a3
{
  objc_storeStrong((id *)&self->_leftEarStackView, a3);
}

- (UIStackView)rightEarStackView
{
  return self->_rightEarStackView;
}

- (void)setRightEarStackView:(id)a3
{
  objc_storeStrong((id *)&self->_rightEarStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarStackView, 0);
  objc_storeStrong((id *)&self->_leftEarStackView, 0);
  objc_storeStrong((id *)&self->_rightEarSensitivity, 0);
  objc_storeStrong((id *)&self->_leftEarSensitivity, 0);
  objc_storeStrong((id *)&self->_rightEarSymbolImageView, 0);
  objc_storeStrong((id *)&self->_leftEarSymbolImageView, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_frequencyLabel, 0);
  objc_storeStrong((id *)&self->_rightHearingLevel, 0);
  objc_storeStrong((id *)&self->_leftHearingLevel, 0);
  objc_storeStrong((id *)&self->_hearingLevel, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
}

@end
