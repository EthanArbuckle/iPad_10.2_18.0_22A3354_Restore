@implementation AIAudiogramResultEarCell

- (AIAudiogramResultEarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AIAudiogramResultEarCell *v4;
  AIAudiogramResultEarCell *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
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
  double v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
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
  void *v85;
  _QWORD v86[5];

  v86[3] = *MEMORY[0x24BDAC8D0];
  v83.receiver = self;
  v83.super_class = (Class)AIAudiogramResultEarCell;
  v4 = -[AIAudiogramResultEarCell initWithStyle:reuseIdentifier:](&v83, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AIAudiogramResultEarCell semanticContentAttribute](v4, "semanticContentAttribute")) != 1;
    v7 = (void *)objc_opt_new();
    -[AIAudiogramResultEarCell setTitleLabel:](v5, "setTitleLabel:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell titleLabel](v5, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    v10 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell titleLabel](v5, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    -[AIAudiogramResultEarCell titleLabel](v5, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1144750080;
    objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 0, v14);

    v15 = (void *)objc_opt_new();
    -[AIAudiogramResultEarCell setValueUnitLabel:](v5, "setValueUnitLabel:", v15);

    v16 = 2 * v6;
    -[AIAudiogramResultEarCell valueUnitLabel](v5, "valueUnitLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextAlignment:", v16);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell valueUnitLabel](v5, "valueUnitLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextColor:", v18);

    aiLocString(CFSTR("AudiogramIngestionDecibelAbbreviation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell valueUnitLabel](v5, "valueUnitLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v20);

    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell valueUnitLabel](v5, "valueUnitLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v22);

    -[AIAudiogramResultEarCell valueUnitLabel](v5, "valueUnitLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 1144750080;
    objc_msgSend(v24, "setContentHuggingPriority:forAxis:", 0, v25);

    v26 = (void *)objc_opt_new();
    -[AIAudiogramResultEarCell setValueTextField:](v5, "setValueTextField:", v26);

    -[AIAudiogramResultEarCell valueTextField](v5, "valueTextField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTextAlignment:", v16);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell valueTextField](v5, "valueTextField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTextColor:", v28);

    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell valueTextField](v5, "valueTextField");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFont:", v30);

    -[AIAudiogramResultEarCell valueTextField](v5, "valueTextField");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setKeyboardType:", 4);

    -[AIAudiogramResultEarCell valueTextField](v5, "valueTextField");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setReturnKeyType:", 9);

    aiLocString(CFSTR("AudiogramIngestionResultsNoData"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell valueTextField](v5, "valueTextField");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPlaceholder:", v34);

    -[AIAudiogramResultEarCell valueTextField](v5, "valueTextField");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = 1132068864;
    objc_msgSend(v36, "setContentCompressionResistancePriority:forAxis:", 0, v37);

    -[AIAudiogramResultEarCell valueTextField](v5, "valueTextField");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addTarget:action:forControlEvents:", v5, sel__textFieldEditingChanged_, 0x20000);

    -[AIAudiogramResultEarCell valueTextField](v5, "valueTextField");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setDelegate:", v5);

    v40 = objc_alloc(MEMORY[0x24BEBD978]);
    -[AIAudiogramResultEarCell titleLabel](v5, "titleLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v41;
    -[AIAudiogramResultEarCell valueTextField](v5, "valueTextField");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v42;
    -[AIAudiogramResultEarCell valueUnitLabel](v5, "valueUnitLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v40, "initWithArrangedSubviews:", v44);
    -[AIAudiogramResultEarCell setLabelStackView:](v5, "setLabelStackView:", v45);

    -[AIAudiogramResultEarCell labelStackView](v5, "labelStackView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAxis:", 0);

    -[AIAudiogramResultEarCell labelStackView](v5, "labelStackView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setDistribution:", 0);

    -[AIAudiogramResultEarCell labelStackView](v5, "labelStackView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAlignment:", 0);

    -[AIAudiogramResultEarCell labelStackView](v5, "labelStackView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setSpacing:", 8.0);

    v50 = objc_alloc(MEMORY[0x24BEBD978]);
    -[AIAudiogramResultEarCell labelStackView](v5, "labelStackView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v50, "initWithArrangedSubviews:", v52);
    -[AIAudiogramResultEarCell setVerticalStackView:](v5, "setVerticalStackView:", v53);

    -[AIAudiogramResultEarCell verticalStackView](v5, "verticalStackView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAxis:", 1);

    -[AIAudiogramResultEarCell verticalStackView](v5, "verticalStackView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setDistribution:", 0);

    -[AIAudiogramResultEarCell verticalStackView](v5, "verticalStackView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setAlignment:", 0);

    -[AIAudiogramResultEarCell verticalStackView](v5, "verticalStackView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramResultEarCell contentView](v5, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell verticalStackView](v5, "verticalStackView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addSubview:", v59);

    v74 = (void *)MEMORY[0x24BDD1628];
    -[AIAudiogramResultEarCell verticalStackView](v5, "verticalStackView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell contentView](v5, "contentView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, 16.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v78;
    -[AIAudiogramResultEarCell verticalStackView](v5, "verticalStackView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell contentView](v5, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:constant:", v73, -16.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v72;
    -[AIAudiogramResultEarCell verticalStackView](v5, "verticalStackView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell contentView](v5, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v61, 16.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v62;
    -[AIAudiogramResultEarCell verticalStackView](v5, "verticalStackView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell contentView](v5, "contentView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, -16.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v84[3] = v67;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 4);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "activateConstraints:", v68);

    -[AIAudiogramResultEarCell setHearingLevel:](v5, "setHearingLevel:", 0);
  }
  return v5;
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
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v32[1] = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramResultEarCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultEarCell frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v31 = *MEMORY[0x24BEBD270];
  v9 = v31;
  -[AIAudiogramResultEarCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 32, v12, 0, v6, v8);
  Width = CGRectGetWidth(v33);

  -[AIAudiogramResultEarCell valueUnitLabel](self, "valueUnitLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultEarCell frame](self, "frame");
  v17 = v16;
  v19 = v18;
  v29 = v9;
  -[AIAudiogramResultEarCell valueUnitLabel](self, "valueUnitLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 32, v22, 0, v17, v19);
  *(float *)&v17 = CGRectGetWidth(v34);

  -[AIAudiogramResultEarCell titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeFromSuperview");

  -[AIAudiogramResultEarCell frame](self, "frame");
  if (CGRectGetWidth(v35) * 0.6 >= (float)(Width + *(float *)&v17))
  {
    v25 = 2
        * (objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AIAudiogramResultEarCell semanticContentAttribute](self, "semanticContentAttribute")) != 1);
    -[AIAudiogramResultEarCell valueTextField](self, "valueTextField");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextAlignment:", v25);

    -[AIAudiogramResultEarCell labelStackView](self, "labelStackView");
  }
  else
  {
    -[AIAudiogramResultEarCell valueTextField](self, "valueTextField");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextAlignment:", 4);

    -[AIAudiogramResultEarCell verticalStackView](self, "verticalStackView");
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultEarCell titleLabel](self, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "insertArrangedSubview:atIndex:", v28, 0);

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
  -[AIAudiogramResultEarCell titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

}

- (void)setHearingLevel:(id)a3
{
  NSNumber *v4;
  NSNumber *hearingLevel;
  void *v6;
  id v7;

  validateHearingLevel(a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hearingLevel = self->_hearingLevel;
  self->_hearingLevel = v4;

  -[NSNumber stringValue](self->_hearingLevel, "stringValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultEarCell valueTextField](self, "valueTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

}

- (void)showActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  _BOOL4 v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  AIAudiogramResultEarCell *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  AXLogAudiogram();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[AIAudiogramResultEarCell frequency](self, "frequency");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v8 = v3;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_22FB4F000, v5, OS_LOG_TYPE_INFO, "Ear cell will activate? %d (%@) %@", buf, 0x1Cu);

  }
  AXPerformBlockOnMainThread();
}

void __39__AIAudiogramResultEarCell_showActive___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  AXLogAudiogram();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "valueTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFirstResponder");
    v5 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "valueTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canBecomeFirstResponder");
    objc_msgSend(*(id *)(a1 + 32), "valueTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canResignFirstResponder");
    objc_msgSend(*(id *)(a1 + 32), "frequency");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v17[0] = 67110402;
    v17[1] = v4;
    v18 = 1024;
    v19 = v5;
    v20 = 1024;
    v21 = v7;
    v22 = 1024;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_22FB4F000, v2, OS_LOG_TYPE_INFO, "Ear cell is activating %d->%d %d? %d? %@ %@", (uint8_t *)v17, 0x2Eu);

  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "valueTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isFirstResponder");

    if ((v13 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "valueTextField");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "becomeFirstResponder");
      goto LABEL_9;
    }
    if (*(_BYTE *)(a1 + 40))
      return;
  }
  objc_msgSend(*(id *)(a1 + 32), "valueTextField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isFirstResponder");

  if (!v15)
    return;
  objc_msgSend(*(id *)(a1 + 32), "valueTextField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resignFirstResponder");
LABEL_9:

}

- (void)setKeyboardToolbar:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AIAudiogramResultEarCell valueTextField](self, "valueTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputAccessoryView:", v4);

}

- (void)_textFieldEditingChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *hearingLevel;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "numberFromString:", v6);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hearingLevel = self->_hearingLevel;
  self->_hearingLevel = v7;

  -[AIAudiogramResultEarCell delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultEarCell hearingLevel](self, "hearingLevel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultEarCell frequency](self, "frequency");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "earCellDidUpdateHearingLevel:forFrequency:forEar:", v9, v10, -[AIAudiogramResultEarCell ear](self, "ear"));

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = v7;
  AXPerformBlockOnMainThreadAfterDelay();
  -[AIAudiogramResultEarCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultEarCell frequency](self, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earCellDidBeginEditingForFrequency:forEar:", v6, -[AIAudiogramResultEarCell ear](self, "ear"));

}

void __53__AIAudiogramResultEarCell_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "endOfDocument");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textRangeFromPosition:toPosition:", v3, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSelectedTextRange:", v2);

}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  id v5;

  -[AIAudiogramResultEarCell delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultEarCell frequency](self, "frequency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earCellDidEndEditingForFrequency:forEar:", v4, -[AIAudiogramResultEarCell ear](self, "ear"));

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "numberFromString:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  validateHearingLevel(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "isEqualToString:", v15);
  if ((v16 & 1) == 0)
  {
    -[AIAudiogramResultEarCell setHearingLevel:](self, "setHearingLevel:", v14);
    -[AIAudiogramResultEarCell delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell hearingLevel](self, "hearingLevel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell frequency](self, "frequency");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "earCellDidUpdateHearingLevel:forFrequency:forEar:", v18, v19, -[AIAudiogramResultEarCell ear](self, "ear"));

  }
  return v16;
}

- (id)accessibilityLabel
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
  uint64_t v12;

  -[AIAudiogramResultEarCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AIAudiogramResultEarCell hearingLevel](self, "hearingLevel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[AIAudiogramResultEarCell valueTextField](self, "valueTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultEarCell valueUnitLabel](self, "valueUnitLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR(" %@ %@"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v12;
  }
  return v4;
}

- (AIAudiogramResultEarCellDelegate)delegate
{
  return (AIAudiogramResultEarCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)valueUnitLabel
{
  return self->_valueUnitLabel;
}

- (void)setValueUnitLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueUnitLabel, a3);
}

- (UITextField)valueTextField
{
  return self->_valueTextField;
}

- (void)setValueTextField:(id)a3
{
  objc_storeStrong((id *)&self->_valueTextField, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_valueTextField, 0);
  objc_storeStrong((id *)&self->_valueUnitLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_hearingLevel, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
