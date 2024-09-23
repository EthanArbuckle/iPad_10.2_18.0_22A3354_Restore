@implementation PKTextInputDebugRadarEntryCell

- (PKTextInputDebugRadarEntryCell)initWithFrame:(CGRect)a3
{
  PKTextInputDebugRadarEntryCell *v3;
  PKTextInputDebugRadarEntryCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKTextInputDebugRadarEntryCell;
  v3 = -[PKTextInputDebugRadarEntryCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKTextInputDebugRadarEntryCell _setupViews](v3, "_setupViews");
  return v4;
}

- (void)setLogEntry:(id)a3 contentLevel:(int64_t)a4
{
  id v7;
  id v8;

  v7 = a3;
  if (*(_OWORD *)&self->_logEntry != __PAIR128__(a4, (unint64_t)v7))
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_logEntry, a3);
    self->_contentLevel = a4;
    -[PKTextInputDebugRadarEntryCell _updateDrawingView](self, "_updateDrawingView");
    -[PKTextInputDebugRadarEntryCell _updateResultTextLabel](self, "_updateResultTextLabel");
    v7 = v8;
  }

}

- (void)setIntendedText:(id)a3
{
  if (self->_intendedText != a3)
  {
    -[PKTextInputDebugRadarEntryCell _setIntendedText:notifyDelegate:](self, "_setIntendedText:notifyDelegate:");
    -[PKTextInputDebugRadarEntryCell _updateIntendedTextField](self, "_updateIntendedTextField");
  }
}

- (void)_setIntendedText:(id)a3 notifyDelegate:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v7;
  NSString *intendedText;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  BOOL v14;
  BOOL v15;
  NSString *v16;

  v4 = a4;
  v16 = self->_intendedText;
  v7 = (NSString *)objc_msgSend(a3, "copy");
  intendedText = self->_intendedText;
  self->_intendedText = v7;

  v9 = v16;
  if (v4)
  {
    v10 = self->_intendedText;
    v11 = v16;
    v12 = v10;
    if (v11 == v12)
    {

LABEL_12:
      v9 = v16;
      goto LABEL_13;
    }
    v13 = v12;
    if (v11)
      v14 = v12 == 0;
    else
      v14 = 1;
    if (v14)
    {

LABEL_11:
      -[PKTextInputDebugRadarEntryCell delegate](self, "delegate");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[NSString entryCellIntendedTextDidChange:](v11, "entryCellIntendedTextDidChange:", self);
      goto LABEL_12;
    }
    v15 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

    v9 = v16;
    if (!v15)
      goto LABEL_11;
  }
LABEL_13:

}

- (void)setIncludedEntry:(BOOL)a3
{
  if (self->_includedEntry != a3)
    -[PKTextInputDebugRadarEntryCell _setIncludedEntry:notifyDelegate:](self, "_setIncludedEntry:notifyDelegate:");
}

- (void)_setIncludedEntry:(BOOL)a3 notifyDelegate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  self->_includedEntry = a3;
  -[PKTextInputDebugRadarEntryCell _updateIncludedButton](self, "_updateIncludedButton");
  -[PKTextInputDebugRadarEntryCell _updateBorderView](self, "_updateBorderView");
  if (v4)
  {
    -[PKTextInputDebugRadarEntryCell delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryCellIncludedEntryDidChange:", self);

  }
}

- (void)_setupViews
{
  void *v3;
  UIView *v4;
  UIView *borderView;
  UIView *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UIButton *v11;
  UIButton *includedButton;
  UITextField *v13;
  UITextField *intendedResultField;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIImageView *v20;
  UIImageView *drawingImageView;
  UIView *v22;
  UIView *lineSeparator;
  UILabel *v24;
  UILabel *resultTextLabel;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  UIView *v38;
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
  UIView *v67;
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
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  _QWORD v113[24];

  v113[22] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.7, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  borderView = self->__borderView;
  self->__borderView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->__borderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = self->__borderView;
  -[UIView layer](v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderWidth:", 1.0);

  v112 = objc_retainAutorelease(v3);
  v8 = objc_msgSend(v112, "CGColor");
  -[UIView layer](v6, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderColor:", v8);

  -[UIView layer](v6, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 12.0);

  -[PKTextInputDebugRadarEntryCell _createIncludedButton](self, "_createIncludedButton");
  v11 = (UIButton *)objc_claimAutoreleasedReturnValue();
  includedButton = self->__includedButton;
  self->__includedButton = v11;

  -[PKTextInputDebugRadarEntryCell _createIntendedField](self, "_createIntendedField");
  v13 = (UITextField *)objc_claimAutoreleasedReturnValue();
  intendedResultField = self->__intendedResultField;
  self->__intendedResultField = v13;

  v15 = objc_alloc(MEMORY[0x1E0DC3890]);
  v16 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v20 = (UIImageView *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], v17, v18, v19);
  drawingImageView = self->__drawingImageView;
  self->__drawingImageView = v20;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->__drawingImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  lineSeparator = self->__lineSeparator;
  self->__lineSeparator = v22;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->__lineSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setBackgroundColor:](self->__lineSeparator, "setBackgroundColor:", v112);
  v24 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v16, v17, v18, v19);
  resultTextLabel = self->__resultTextLabel;
  self->__resultTextLabel = v24;

  -[UILabel setLineBreakMode:](self->__resultTextLabel, "setLineBreakMode:", 0);
  -[UILabel setNumberOfLines:](self->__resultTextLabel, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->__resultTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v26) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->__resultTextLabel, "setContentCompressionResistancePriority:forAxis:", 1, v26);
  LODWORD(v27) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->__resultTextLabel, "setContentHuggingPriority:forAxis:", 1, v27);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v16, v17, v18, v19);
  _PencilKitBundle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Expected:"), CFSTR("Expected:"), CFSTR("Localizable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setText:", v30);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFont:", v31);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextColor:", v32);

  objc_msgSend(v28, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v33) = 1148846080;
  objc_msgSend(v28, "setContentHuggingPriority:forAxis:", 0, v33);
  LODWORD(v34) = 1148846080;
  objc_msgSend(v28, "setContentHuggingPriority:forAxis:", 1, v34);
  -[PKTextInputDebugRadarEntryCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v6);

  -[UIView addSubview:](v6, "addSubview:", self->__drawingImageView);
  -[UIView addSubview:](v6, "addSubview:", self->__lineSeparator);
  -[UIView addSubview:](v6, "addSubview:", self->__resultTextLabel);
  -[UIView addSubview:](v6, "addSubview:", v28);
  -[UIView addSubview:](v6, "addSubview:", self->__intendedResultField);
  -[PKTextInputDebugRadarEntryCell contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", self->__includedButton);

  -[PKTextInputDebugRadarEntryCell _updateIncludedButton](self, "_updateIncludedButton");
  -[PKTextInputDebugRadarEntryCell _updateBorderView](self, "_updateBorderView");
  -[PKTextInputDebugRadarEntryCell _updateIntendedTextField](self, "_updateIntendedTextField");
  v83 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](v6, "topAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarEntryCell contentView](self, "contentView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "topAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:constant:", v109, 0.0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v108;
  -[UIView bottomAnchor](v6, "bottomAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarEntryCell contentView](self, "contentView");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "bottomAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:constant:", v105, -20.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v104;
  -[UIView leadingAnchor](v6, "leadingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarEntryCell contentView](self, "contentView");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "leadingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v101);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v100;
  -[UIView trailingAnchor](v6, "trailingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarEntryCell contentView](self, "contentView");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v97);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v96;
  -[UIImageView topAnchor](self->__drawingImageView, "topAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](v6, "topAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v94, 10.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v113[4] = v93;
  -[UIImageView centerXAnchor](self->__drawingImageView, "centerXAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v6, "centerXAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v91);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v113[5] = v90;
  -[UIImageView widthAnchor](self->__drawingImageView, "widthAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](v6, "widthAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v88, 1.0, -20.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v113[6] = v87;
  -[UIView topAnchor](self->__lineSeparator, "topAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->__drawingImageView, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:constant:", v85, 15.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v113[7] = v84;
  -[UIView heightAnchor](self->__lineSeparator, "heightAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToConstant:", 1.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v113[8] = v81;
  -[UIView leadingAnchor](self->__lineSeparator, "leadingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v6, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, 10.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v113[9] = v78;
  -[UIView trailingAnchor](self->__lineSeparator, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v6, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, -10.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v113[10] = v75;
  -[UILabel topAnchor](self->__resultTextLabel, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->__lineSeparator, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73, 15.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v113[11] = v72;
  -[UILabel centerXAnchor](self->__resultTextLabel, "centerXAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v6, "centerXAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v113[12] = v68;
  -[UILabel widthAnchor](self->__resultTextLabel, "widthAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](v6, "widthAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:multiplier:constant:", v65, 1.0, -20.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v113[13] = v64;
  v37 = v28;
  objc_msgSend(v28, "centerYAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField centerYAnchor](self->__intendedResultField, "centerYAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v113[14] = v61;
  objc_msgSend(v28, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->__includedButton, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 30.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v113[15] = v58;
  v71 = v28;
  objc_msgSend(v28, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField leadingAnchor](self->__intendedResultField, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, -5.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v113[16] = v55;
  -[UITextField topAnchor](self->__intendedResultField, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->__resultTextLabel, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 20.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v113[17] = v52;
  -[UITextField bottomAnchor](self->__intendedResultField, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v6;
  -[UIView bottomAnchor](v6, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, -10.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v113[18] = v49;
  -[UITextField trailingAnchor](self->__intendedResultField, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v6;
  -[UIView trailingAnchor](v6, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -10.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v113[19] = v41;
  -[UIButton centerYAnchor](self->__includedButton, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v113[20] = v44;
  -[UIButton leadingAnchor](self->__includedButton, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v38, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 10.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v113[21] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 22);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "activateConstraints:", v48);

}

- (id)_createIncludedButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
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

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", 1.0);

  objc_msgSend(v3, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 12.0);

  objc_msgSend(v3, "setContentEdgeInsets:", 4.5, 10.0, 4.5, 9.0);
  objc_msgSend(v3, "setImageEdgeInsets:", 0.0, -5.0, 0.0, 0.0);
  objc_msgSend(v3, "setTitleEdgeInsets:", 0.0, 1.0, 0.0, -1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v8);

  LODWORD(v9) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v9);
  LODWORD(v10) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v10);
  _PencilKitBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Excluded"), CFSTR("Excluded"), CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v12, 0);

  _PencilKitBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Included"), CFSTR("Included"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v14, 4);

  v15 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(v3, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configurationWithFont:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", v19, 0);
  objc_msgSend(v3, "setImage:forState:", v20, 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v21, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v22, 4);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__handleIncludedButton, 64);
  return v3;
}

- (id)_createIntendedField
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0DC3DB8]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v4, "setBorderStyle:", 3);
  objc_msgSend(v4, "setAutocapitalizationType:", 0);
  objc_msgSend(v4, "setAutocorrectionType:", 0);
  objc_msgSend(v4, "setSmartQuotesType:", 1);
  objc_msgSend(v4, "setSmartDashesType:", 1);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__handleIntendedFieldChanged, 0x20000);
  return v4;
}

- (void)_updateResultTextLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  id v19;

  -[PKTextInputDebugRadarEntryCell logEntry](self, "logEntry");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "referenceSubstringWithTargetContentLevel:", -[PKTextInputDebugRadarEntryCell contentLevel](self, "contentLevel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "inputTargetContentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "referenceSubstringRange");

  objc_msgSend(v19, "inputTargetContentInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "textContentLength");

  v8 = objc_msgSend(v19, "resultAffectedRange");
  v10 = v9;
  objc_msgSend(v19, "resultCommittedText");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_1E777DEE8;
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  -[PKTextInputDebugRadarEntryCell _attributedResultTextWithReferenceString:referenceStringOffset:recognitionResult:affectedRange:resultType:contentLength:](self, "_attributedResultTextWithReferenceString:referenceStringOffset:recognitionResult:affectedRange:resultType:contentLength:", v3, v5, v14, v8, v10, objc_msgSend(v19, "resultType"), v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (unint64_t)objc_msgSend(v15, "length") < 0x14;
  -[PKTextInputDebugRadarEntryCell _resultTextLabel](self, "_resultTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextAlignment:", v16);

  -[PKTextInputDebugRadarEntryCell _resultTextLabel](self, "_resultTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttributedText:", v15);

}

- (void)_updateDrawingView
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  PKDrawing *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  PKDrawing *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[PKTextInputDebugRadarEntryCell logEntry](self, "logEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDrawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[PKMetalUtility defaultDevice](PKMetalUtility, "defaultDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v5);
      v6 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKMetalResourceHandler strokeRenderCache](v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKLRUCache removeAllObjects]((uint64_t)v7);

    }
    v8 = v4;
    -[PKTextInputDebugRadarEntryCell logEntry](self, "logEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tokenizedTextResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v40 = v5;
      v41 = v4;
      -[PKTextInputDebugRadarEntryCell logEntry](self, "logEntry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "resultCommittedTokenColumnCount");

      -[PKTextInputDebugRadarEntryCell logEntry](self, "logEntry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tokenizedTextResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "strokeIndexesForColumnsInRange:", 0, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0C99DE8];
      -[PKDrawing strokes](v8, "strokes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      -[PKDrawing strokes](v8, "strokes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v20)
      {
        v21 = v20;
        v22 = 0;
        v23 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v43 != v23)
              objc_enumerationMutation(v19);
            v25 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v15, "containsIndex:", v22 + i))
              objc_msgSend(v18, "addObject:", v25);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          v22 += i;
        }
        while (v21);
      }

      v26 = -[PKDrawing initWithStrokes:]([PKDrawing alloc], "initWithStrokes:", v18);
      v8 = v26;
      v5 = v40;
      v4 = v41;
    }
    -[PKDrawing bounds](v8, "bounds");
    -[PKDrawing imageFromRect:scale:](v8, "imageFromRect:scale:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawing bounds](v8, "bounds");
    v29 = v28;
    v31 = v30;

  }
  else
  {
    v27 = 0;
    v29 = *MEMORY[0x1E0C9D820];
    v31 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[PKTextInputDebugRadarEntryCell _drawingImageView](self, "_drawingImageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setImage:", v27);
  -[PKTextInputDebugRadarEntryCell _drawingViewAspectRatioConstraint](self, "_drawingViewAspectRatioConstraint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[PKTextInputDebugRadarEntryCell _drawingViewAspectRatioConstraint](self, "_drawingViewAspectRatioConstraint");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeConstraint:", v34);

  }
  if (v29 <= 0.0)
    v35 = 0.0;
  else
    v35 = v31 / v29;
  objc_msgSend(v32, "heightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:multiplier:", v37, v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarEntryCell set_drawingViewAspectRatioConstraint:](self, "set_drawingViewAspectRatioConstraint:", v38);

  -[PKTextInputDebugRadarEntryCell _drawingViewAspectRatioConstraint](self, "_drawingViewAspectRatioConstraint");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

}

- (void)_updateBorderView
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[PKTextInputDebugRadarEntryCell includedEntry](self, "includedEntry");
  -[PKTextInputDebugRadarEntryCell _borderView](self, "_borderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setAlpha:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  }
  else
  {
    objc_msgSend(v4, "setAlpha:", 0.3);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarEntryCell _borderView](self, "_borderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (void)_updateIncludedButton
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[PKTextInputDebugRadarEntryCell _includedButton](self, "_includedButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PKTextInputDebugRadarEntryCell includedEntry](self, "includedEntry"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v3);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  }
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  objc_msgSend(v8, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v6);

  objc_msgSend(v8, "setSelected:", -[PKTextInputDebugRadarEntryCell includedEntry](self, "includedEntry"));
}

- (void)_updateIntendedTextField
{
  void *v3;
  id v4;

  -[PKTextInputDebugRadarEntryCell intendedText](self, "intendedText");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarEntryCell _intendedResultField](self, "_intendedResultField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

}

- (void)_handleIntendedFieldChanged
{
  void *v3;
  id v4;

  -[PKTextInputDebugRadarEntryCell _intendedResultField](self, "_intendedResultField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarEntryCell _setIntendedText:notifyDelegate:](self, "_setIntendedText:notifyDelegate:", v3, 1);

}

- (void)_handleIncludedButton
{
  -[PKTextInputDebugRadarEntryCell _setIncludedEntry:notifyDelegate:](self, "_setIncludedEntry:notifyDelegate:", -[PKTextInputDebugRadarEntryCell includedEntry](self, "includedEntry") ^ 1, 1);
}

- (id)_attributedResultTextWithReferenceString:(id)a3 referenceStringOffset:(int64_t)a4 recognitionResult:(id)a5 affectedRange:(_NSRange)a6 resultType:(int64_t)a7 contentLength:(int64_t)a8
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  _BOOL4 v32;
  NSUInteger v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  PKTextInputDebugRadarEntryCell *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSUInteger length;
  NSUInteger location;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[3];
  _QWORD v64[3];
  uint64_t v65;
  void *v66;
  _QWORD v67[2];
  uint64_t v68;
  _QWORD v69[3];
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[3];
  _QWORD v74[2];
  _QWORD v75[2];
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[4];

  length = a6.length;
  location = a6.location;
  v50 = self;
  v78[2] = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v9 = a5;
  v10 = objc_msgSend(v54, "length");
  v62 = v9;
  v11 = objc_msgSend(v9, "length") + v10;
  if ((unint64_t)v11 >= 0x12C)
    v11 = 300;
  v12 = ceil(cos((double)v11 * 0.01) * 10.0 + 24.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v12, *MEMORY[0x1E0DC1440]);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v12, *MEMORY[0x1E0DC1438]);
  v14 = objc_claimAutoreleasedReturnValue();
  v76 = *MEMORY[0x1E0DC1140];
  v15 = v76;
  objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = *MEMORY[0x1E0DC1138];
  v17 = v77;
  v78[0] = v16;
  v52 = (void *)v13;
  v78[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v76, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v74[0] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v17;
  v75[0] = v18;
  v75[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v19;
  v71 = *MEMORY[0x1E0DC1100];
  v20 = v71;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "colorWithAlphaComponent:", 0.5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v17;
  v73[1] = v22;
  v73[2] = v14;
  v51 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v70, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *MEMORY[0x1E0DC11A8];
  v69[0] = &unk_1E77EBA90;
  v67[0] = v23;
  v67[1] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = *MEMORY[0x1E0DC1108];
  v25 = v68;
  v69[1] = v24;
  v69[2] = &unk_1E77EBAA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v67, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = v20;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "colorWithAlphaComponent:", 0.4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
  v28 = objc_claimAutoreleasedReturnValue();

  v64[0] = &unk_1E77EBA90;
  v63[0] = v23;
  v63[1] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v25;
  v64[1] = v29;
  v64[2] = &unk_1E77EBAA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v54);
  v31 = location != 0x7FFFFFFFFFFFFFFFLL;
  v32 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  if (v32 && v31)
    v33 = length;
  else
    v33 = 0;
  if (v32 && v31)
    v34 = location - a4;
  else
    v34 = 0x7FFFFFFFFFFFFFFFLL;
  if (v34 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PKTextInputDebugRadarEntryCell logEntry](v50, "logEntry");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "resultType");

    switch(v36)
    {
      case 1:
        if (length)
          objc_msgSend(v30, "addAttributes:range:", v58, v34, v33);
        v39 = objc_alloc(MEMORY[0x1E0CB3498]);
        v40 = v62;
        v41 = v60;
        goto LABEL_21;
      case 2:
      case 3:
      case 4:
      case 5:
        v37 = v30;
        v38 = (void *)v28;
        goto LABEL_12;
      case 6:
        v37 = v30;
        v38 = v61;
LABEL_12:
        objc_msgSend(v37, "addAttributes:range:", v38, v34, v33, v50);
        break;
      case 7:
        if (length)
          objc_msgSend(v30, "addAttributes:range:", v61, v34, v33);
        if (objc_msgSend(v62, "length", v50))
        {
          v39 = objc_alloc(MEMORY[0x1E0CB3498]);
          v40 = v62;
          v41 = v59;
LABEL_21:
          v42 = (void *)objc_msgSend(v39, "initWithString:attributes:", v40, v41, v50);
          objc_msgSend(v30, "insertAttributedString:atIndex:", v42, v34 + v33);

        }
        break;
      default:
        break;
    }
  }
  v43 = (void *)v28;
  v44 = objc_msgSend(v54, "length", v50);
  if ((unint64_t)(a4 - 1) <= 0x7FFFFFFFFFFFFFFDLL && v44)
  {
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("…"), v53);
    objc_msgSend(v30, "insertAttributedString:atIndex:", v45, 0);

    v47 = v51;
    v46 = v52;
  }
  else
  {
    v47 = v51;
    v46 = v52;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_28;
  }
  if (objc_msgSend(v54, "length") + a4 < (unint64_t)a8)
  {
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("…"), v53);
    objc_msgSend(v30, "appendAttributedString:", v48);

  }
LABEL_28:

  return v30;
}

- (PKTextInputDebugRadarEntryCellDelegate)delegate
{
  return (PKTextInputDebugRadarEntryCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKTextInputDebugLogEntry)logEntry
{
  return self->_logEntry;
}

- (int64_t)contentLevel
{
  return self->_contentLevel;
}

- (BOOL)includedEntry
{
  return self->_includedEntry;
}

- (int64_t)entryIndex
{
  return self->_entryIndex;
}

- (void)setEntryIndex:(int64_t)a3
{
  self->_entryIndex = a3;
}

- (NSString)intendedText
{
  return self->_intendedText;
}

- (UIView)_borderView
{
  return self->__borderView;
}

- (UIButton)_includedButton
{
  return self->__includedButton;
}

- (UIImageView)_drawingImageView
{
  return self->__drawingImageView;
}

- (UILabel)_resultTextLabel
{
  return self->__resultTextLabel;
}

- (UITextField)_intendedResultField
{
  return self->__intendedResultField;
}

- (UIView)_lineSeparator
{
  return self->__lineSeparator;
}

- (NSLayoutConstraint)_drawingViewAspectRatioConstraint
{
  return self->__drawingViewAspectRatioConstraint;
}

- (void)set_drawingViewAspectRatioConstraint:(id)a3
{
  objc_storeStrong((id *)&self->__drawingViewAspectRatioConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__drawingViewAspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->__lineSeparator, 0);
  objc_storeStrong((id *)&self->__intendedResultField, 0);
  objc_storeStrong((id *)&self->__resultTextLabel, 0);
  objc_storeStrong((id *)&self->__drawingImageView, 0);
  objc_storeStrong((id *)&self->__includedButton, 0);
  objc_storeStrong((id *)&self->__borderView, 0);
  objc_storeStrong((id *)&self->_intendedText, 0);
  objc_storeStrong((id *)&self->_logEntry, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
