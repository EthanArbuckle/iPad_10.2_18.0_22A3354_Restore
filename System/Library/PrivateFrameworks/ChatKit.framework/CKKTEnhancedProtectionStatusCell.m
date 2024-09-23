@implementation CKKTEnhancedProtectionStatusCell

+ (id)reuseIdentifier
{
  return CFSTR("CKKTEnhancedProtectionStatusCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (CKKTEnhancedProtectionStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 state:(int64_t)a5 delegate:(id)a6 handlesInChat:(id)a7 verifiedHandles:(id)a8 titleString:(id)a9 shouldShowMacHeader:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  CKKTEnhancedProtectionStatusCell *v20;
  CKKTEnhancedProtectionStatusCell *v21;
  objc_super v23;

  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)CKKTEnhancedProtectionStatusCell;
  v20 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v23, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v21 = v20;
  if (v20)
  {
    v20->_enhancedProtectionStatusCellState = a5;
    objc_storeWeak((id *)&v20->_delegate, v16);
    v21->_handlesInChatCount = objc_msgSend(v17, "count");
    v21->_verifiedHandlesCount = objc_msgSend(v18, "count");
    objc_storeStrong((id *)&v21->_titleString, a9);
    v21->_shouldShowMacHeader = a10;
    -[CKKTEnhancedProtectionStatusCell setupView](v21, "setupView");
  }

  return v21;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKKTEnhancedProtectionStatusCell;
  -[CKKTEnhancedProtectionStatusCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKKTEnhancedProtectionStatusCell activateConstraints](self, "activateConstraints");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKKTEnhancedProtectionStatusCell;
  -[CKDetailsCell layoutSubviews](&v3, sel_layoutSubviews);
  -[CKKTEnhancedProtectionStatusCell activateConstraints](self, "activateConstraints");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGSize result;

  width = a3.width;
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMargins");
  v7 = v6;
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMargins");
  v10 = v7 + v9;

  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12 - v10;

  -[UIButton sizeThatFits:](self->_ktStatusButton, "sizeThatFits:", v13, 1.79769313e308);
  v15 = v14;
  v17 = v16;
  -[UILabel sizeThatFits:](self->_macHeaderLabel, "sizeThatFits:", v13, 1.79769313e308);
  v19 = v18;
  -[UILabel sizeThatFits:](self->_ktTitleLabel, "sizeThatFits:", v13, 1.79769313e308);
  if (v15 + v21 <= v13)
  {
    v22 = fmax(v17, v20);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "detailsCellLabelPadding");
    v25 = 2.0;
  }
  else
  {
    v22 = v17 + 0.0 + v20;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "detailsCellLabelPadding");
    v25 = 4.0;
  }
  v26 = v22 + v24 * v25;

  if (self->_macHeaderLabel && self->_shouldShowMacHeader)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "detailsSectionHeaderPaddingAbove");
    v26 = v19 + v26 + v28;

  }
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layoutMargins");
  v31 = v26 + v30;
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutMargins");
  v34 = v31 + v33;

  v35 = width;
  v36 = v34;
  result.height = v36;
  result.width = v35;
  return result;
}

- (void)setupView
{
  void *v3;

  -[CKKTEnhancedProtectionStatusCell setupVibrancyEffectView](self, "setupVibrancyEffectView");
  -[CKKTEnhancedProtectionStatusCell setupTitleLabel](self, "setupTitleLabel");
  -[CKKTEnhancedProtectionStatusCell setupStatusButton](self, "setupStatusButton");
  -[CKKTEnhancedProtectionStatusCell setupSeparators](self, "setupSeparators");
  if (self->_shouldShowMacHeader)
    -[CKKTEnhancedProtectionStatusCell setupMacHeaderLabel](self, "setupMacHeaderLabel");
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  -[CKKTEnhancedProtectionStatusCell setupConstraintsForLayouts](self, "setupConstraintsForLayouts");
}

- (void)setupTitleLabel
{
  id v3;
  UILabel *v4;
  UILabel *ktTitleLabel;
  UILabel *v6;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  ktTitleLabel = self->_ktTitleLabel;
  self->_ktTitleLabel = v4;

  -[UILabel setText:](self->_ktTitleLabel, "setText:", self->_titleString);
  v6 = self->_ktTitleLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v6, "setFont:", v7);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_ktTitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setLineBreakMode:](self->_ktTitleLabel, "setLineBreakMode:", 0);
  -[UILabel setNumberOfLines:](self->_ktTitleLabel, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_ktTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_ktTitleLabel);

}

- (id)statusButtonConfiguration
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t handlesInChatCount;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  switch(self->_enhancedProtectionStatusCellState)
  {
    case 1:
      v7 = -[CKKTEnhancedProtectionStatusCell handlesInChatCount](self, "handlesInChatCount");
      v8 = objc_alloc(MEMORY[0x1E0CB3498]);
      CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v7 == 1)
        v11 = CFSTR("KT_SINGLE_VERIFIED");
      else
        v11 = CFSTR("KT_MULTIPLE_VERIFIED");
      objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v8, "initWithString:", v12);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "theme");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "secondaryLabelColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0CEA638];
      v18 = CFSTR("checkmark.circle.fill");
      goto LABEL_14;
    case 2:
      handlesInChatCount = self->_handlesInChatCount;
      v19 = objc_alloc(MEMORY[0x1E0CB3498]);
      if (handlesInChatCount < 2)
      {
        CKFrameworkBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = CFSTR("KT_ENHANCED_PROTECTION_STATE_NOT_VERIFIED");
LABEL_21:
        objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v19, "initWithString:", v45);

      }
      else
      {
        v38 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("N_OF_N_VERIFIED"), &stru_1E276D870, CFSTR("ChatKitFormats-Key-Transparency"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringWithFormat:", v40, -[CKKTEnhancedProtectionStatusCell verifiedHandlesCount](self, "verifiedHandlesCount"), -[CKKTEnhancedProtectionStatusCell handlesInChatCount](self, "handlesInChatCount"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "userInterfaceLayoutDirection");

        if (v43 == 1)
          v44 = CFSTR("\u200F");
        else
          v44 = CFSTR("\u200E");
        -[__CFString stringByAppendingString:](v44, "stringByAppendingString:", v41);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)objc_msgSend(v19, "initWithString:", v21);
      }

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "theme");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "secondaryLabelColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = 0;
      goto LABEL_23;
    case 3:
      v19 = objc_alloc(MEMORY[0x1E0CB3498]);
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = CFSTR("KT_ENHANCED_PROTECTION_STATE_VERIFICATION_OFF");
      goto LABEL_21;
    case 4:
      if (!CKIsRunningInMacCatalyst())
        goto LABEL_10;
      v23 = objc_alloc(MEMORY[0x1E0CB3778]);
      CKFrameworkBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("KT_ENHANCED_PROTECTION_STATE_WARNING"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v23, "initWithString:", v25);

      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.down"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "imageWithSymbolConfiguration:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "imageWithTintColor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
      objc_msgSend(v31, "setImage:", v30);
      objc_msgSend(v31, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
      v32 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "ktStringAttachmentPadding");
      objc_msgSend(v32, "setBounds:");

      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendAttributedString:", v34);

      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendAttributedString:", v35);

      v13 = (void *)objc_msgSend(v5, "copy");
      goto LABEL_13;
    case 5:
      v3 = objc_alloc(MEMORY[0x1E0CB3498]);
      CKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("KT_ENHANCED_PROTECTION_STATE_TURNED_OFF");
      goto LABEL_12;
    case 6:
    case 7:
      v3 = objc_alloc(MEMORY[0x1E0CB3498]);
      CKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("KT_STATE_UNAVAILABLE");
      goto LABEL_12;
    default:
LABEL_10:
      v3 = objc_alloc(MEMORY[0x1E0CB3498]);
      CKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("KT_ENHANCED_PROTECTION_STATE_WARNING");
LABEL_12:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v3, "initWithString:", v30);
LABEL_13:

      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CEA638];
      v18 = CFSTR("exclamationmark.triangle.fill");
LABEL_14:
      objc_msgSend(v17, "systemImageNamed:", v18);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
      objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setContentInsets:", *MEMORY[0x1E0CEA080], *(double *)(MEMORY[0x1E0CEA080] + 8), *(double *)(MEMORY[0x1E0CEA080] + 16), *(double *)(MEMORY[0x1E0CEA080] + 24));
      objc_msgSend(v48, "setAttributedTitle:", v13);
      objc_msgSend(v48, "setBaseForegroundColor:", v16);
      objc_msgSend(v48, "setBaseBackgroundColor:", v16);
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "imageWithSymbolConfiguration:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v48, "setImage:", v50);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "ktStatusCellImagePadding");
      objc_msgSend(v48, "setImagePadding:");

      objc_msgSend(v48, "setImagePlacement:", 2);
      objc_msgSend(v48, "setTitleAlignment:", 1);

      return v48;
  }
}

- (void)setupStatusButton
{
  void *v3;
  void *v4;
  UIButton *v5;
  UIButton *ktStatusButton;
  UIButton *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CEA3A0];
  -[CKKTEnhancedProtectionStatusCell statusButtonConfiguration](self, "statusButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonWithConfiguration:primaryAction:", v4, 0);
  v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
  ktStatusButton = self->_ktStatusButton;
  self->_ktStatusButton = v5;

  -[UIButton setPreferredBehavioralStyle:](self->_ktStatusButton, "setPreferredBehavioralStyle:", 1);
  v7 = self->_ktStatusButton;
  -[CKKTEnhancedProtectionStatusCell ktStatusMenu](self, "ktStatusMenu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setMenu:](v7, "setMenu:", v8);

  -[UIButton setShowsMenuAsPrimaryAction:](self->_ktStatusButton, "setShowsMenuAsPrimaryAction:", 1);
  if ((unint64_t)(self->_enhancedProtectionStatusCellState - 1) <= 2)
    -[UIButton setUserInteractionEnabled:](self->_ktStatusButton, "setUserInteractionEnabled:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_ktStatusButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_ktStatusButton);

}

- (void)reconfigureStatusButton
{
  UIButton *ktStatusButton;
  void *v4;
  void *v5;
  UIButton *v6;

  ktStatusButton = self->_ktStatusButton;
  -[CKKTEnhancedProtectionStatusCell statusButtonConfiguration](self, "statusButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setConfiguration:](ktStatusButton, "setConfiguration:", v4);

  v6 = self->_ktStatusButton;
  -[CKKTEnhancedProtectionStatusCell ktStatusMenu](self, "ktStatusMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setMenu:](v6, "setMenu:", v5);

  -[UIButton setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", (unint64_t)(self->_enhancedProtectionStatusCellState - 4) < 0xFFFFFFFFFFFFFFFDLL);
}

- (void)setupSeparators
{
  void *v3;
  void *v4;

  -[CKDetailsCell topSeperator](self, "topSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[CKDetailsCell setIndentTopSeperator:](self, "setIndentTopSeperator:", 1);
  -[CKDetailsCell setIndentBottomSeperator:](self, "setIndentBottomSeperator:", 1);
}

- (void)setupConstraintsForLayouts
{
  NSMutableArray *v3;
  NSMutableArray *horizontalLayoutConstraints;
  NSMutableArray *v5;
  NSMutableArray *verticalLayoutConstraints;
  UILabel *macHeaderLabel;
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
  UILabel *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  UILabel *v48;
  uint64_t v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSMutableArray *v60;
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
  NSMutableArray *v88;
  void *v89;
  NSMutableArray *v90;
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
  NSMutableArray *v101;
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
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  NSMutableArray *v117;
  void *v118;
  NSMutableArray *v119;
  void *v120;
  void *v121;
  UILabel *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  UILabel *v127;
  void *v128;
  void *v129;
  _QWORD v130[2];
  _QWORD v131[4];
  _QWORD v132[4];
  _QWORD v133[3];
  _QWORD v134[4];
  _QWORD v135[6];

  v135[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  horizontalLayoutConstraints = self->_horizontalLayoutConstraints;
  self->_horizontalLayoutConstraints = v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  verticalLayoutConstraints = self->_verticalLayoutConstraints;
  self->_verticalLayoutConstraints = v5;

  if (CKIsRunningInMacCatalyst())
  {
    macHeaderLabel = self->_macHeaderLabel;
    if (macHeaderLabel)
    {
      if (self->_shouldShowMacHeader)
      {
        v90 = self->_horizontalLayoutConstraints;
        -[UILabel topAnchor](macHeaderLabel, "topAnchor");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "layoutMarginsGuide");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "topAnchor");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "detailsSectionHeaderPaddingAbove");
        objc_msgSend(v120, "constraintEqualToAnchor:constant:", v110);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v135[0] = v105;
        -[UILabel heightAnchor](self->_macHeaderLabel, "heightAnchor");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel font](self->_macHeaderLabel, "font");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "pointSize");
        objc_msgSend(v95, "constraintEqualToConstant:");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v135[1] = v85;
        -[UILabel leadingAnchor](self->_macHeaderLabel, "leadingAnchor");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "layoutMarginsGuide");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "leadingAnchor");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "detailsSectionHeaderPaddingLeading");
        objc_msgSend(v73, "constraintEqualToAnchor:constant:", v71);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v135[2] = v9;
        -[UILabel trailingAnchor](self->_macHeaderLabel, "trailingAnchor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "layoutMarginsGuide");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "trailingAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "constraintEqualToAnchor:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v135[3] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v90, "addObjectsFromArray:", v15);

        v101 = self->_verticalLayoutConstraints;
        -[UILabel topAnchor](self->_macHeaderLabel, "topAnchor");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "layoutMarginsGuide");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "topAnchor");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "detailsSectionHeaderPaddingAbove");
        objc_msgSend(v121, "constraintEqualToAnchor:constant:", v111);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v134[0] = v106;
        -[UILabel heightAnchor](self->_macHeaderLabel, "heightAnchor");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel font](self->_macHeaderLabel, "font");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "pointSize");
        objc_msgSend(v91, "constraintEqualToConstant:");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v134[1] = v86;
        -[UILabel leadingAnchor](self->_macHeaderLabel, "leadingAnchor");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "layoutMarginsGuide");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "leadingAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v134[2] = v17;
        -[UILabel trailingAnchor](self->_macHeaderLabel, "trailingAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "layoutMarginsGuide");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "trailingAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v134[3] = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v101, "addObjectsFromArray:", v23);

      }
    }
  }
  v117 = self->_verticalLayoutConstraints;
  -[UILabel topAnchor](self->_ktTitleLabel, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self->_macHeaderLabel;
  v122 = v25;
  if (v25)
  {
    -[UILabel bottomAnchor](v25, "bottomAnchor");
  }
  else
  {
    -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "layoutMarginsGuide");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "topAnchor");
  }
  v26 = objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "detailsCellLabelPadding");
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = v102;
  -[UILabel leadingAnchor](self->_ktTitleLabel, "leadingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "layoutMarginsGuide");
  v107 = v24;
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v133[1] = v28;
  -[UILabel trailingAnchor](self->_ktTitleLabel, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layoutMarginsGuide");
  v31 = (void *)v26;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v133[2] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v117, "addObjectsFromArray:", v35);

  if (!v122)
  {

    v31 = v81;
  }

  v88 = self->_verticalLayoutConstraints;
  -[UIButton topAnchor](self->_ktStatusButton, "topAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_ktTitleLabel, "bottomAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "detailsCellLabelPadding");
  objc_msgSend(v123, "constraintEqualToAnchor:constant:", v113, v36 + v36);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = v108;
  -[UIButton leadingAnchor](self->_ktStatusButton, "leadingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "layoutMarginsGuide");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v83);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v132[1] = v79;
  -[UIButton trailingAnchor](self->_ktStatusButton, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "layoutMarginsGuide");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintLessThanOrEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v132[2] = v38;
  -[UIButton bottomAnchor](self->_ktStatusButton, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layoutMarginsGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "detailsCellLabelPadding");
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v42, -v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v132[3] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v88, "addObjectsFromArray:", v46);

  v119 = self->_horizontalLayoutConstraints;
  -[UILabel topAnchor](self->_ktTitleLabel, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = self->_macHeaderLabel;
  v127 = v48;
  if (v48)
  {
    -[UILabel bottomAnchor](v48, "bottomAnchor");
  }
  else
  {
    -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "layoutMarginsGuide");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "topAnchor");
  }
  v49 = objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "detailsCellLabelPadding");
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v114;
  -[UILabel bottomAnchor](self->_ktTitleLabel, "bottomAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "layoutMarginsGuide");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "bottomAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "detailsCellLabelPadding");
  objc_msgSend(v99, "constraintEqualToAnchor:constant:", v84, -v50);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v131[1] = v80;
  -[UILabel leadingAnchor](self->_ktTitleLabel, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "layoutMarginsGuide");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v53);
  v94 = v47;
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v131[2] = v54;
  -[UILabel trailingAnchor](self->_ktTitleLabel, "trailingAnchor");
  v55 = (void *)v49;
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton leadingAnchor](self->_ktStatusButton, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v131[3] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v119, "addObjectsFromArray:", v59);

  if (!v127)
  {

    v55 = v72;
  }

  v60 = self->_horizontalLayoutConstraints;
  -[UIButton trailingAnchor](self->_ktStatusButton, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "layoutMarginsGuide");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = v65;
  -[UIButton centerYAnchor](self->_ktStatusButton, "centerYAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerYAnchor](self->_ktTitleLabel, "centerYAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v130[1] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v60, "addObjectsFromArray:", v69);

}

- (void)activateConstraints
{
  UIButton *ktStatusButton;
  void *v4;
  double v5;
  double v6;
  double v7;
  UILabel *ktTitleLabel;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;

  ktStatusButton = self->_ktStatusButton;
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  -[UIButton sizeThatFits:](ktStatusButton, "sizeThatFits:", v5, 1.79769313e308);
  v7 = v6;

  ktTitleLabel = self->_ktTitleLabel;
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  -[UILabel sizeThatFits:](ktTitleLabel, "sizeThatFits:", v10, 1.79769313e308);
  v12 = v11;

  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMargins");
  v15 = v14;
  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutMargins");
  v18 = v15 + v17;

  -[CKKTEnhancedProtectionStatusCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20 - v18;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_horizontalLayoutConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_verticalLayoutConstraints);
  if (v7 + v12 <= v21)
    v22 = 1120;
  else
    v22 = 1128;
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.super.isa + v22), v7 + v12);
}

- (void)updateTitleAndStatusButtonConfiguration
{
  -[UILabel setText:](self->_ktTitleLabel, "setText:", self->_titleString);
  -[CKKTEnhancedProtectionStatusCell reconfigureStatusButton](self, "reconfigureStatusButton");
}

- (id)ktStatusMenu
{
  int64_t enhancedProtectionStatusCellState;
  void *v3;

  enhancedProtectionStatusCellState = self->_enhancedProtectionStatusCellState;
  if ((unint64_t)(enhancedProtectionStatusCellState - 6) < 2)
  {
    -[CKKTEnhancedProtectionStatusCell menuForKTStatusUnavailable](self, "menuForKTStatusUnavailable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (enhancedProtectionStatusCellState == 4)
  {
    -[CKKTEnhancedProtectionStatusCell menuForKTStatusError](self, "menuForKTStatusError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (enhancedProtectionStatusCellState == 5)
  {
    -[CKKTEnhancedProtectionStatusCell menuForKTStatusTurnedOff](self, "menuForKTStatusTurnedOff");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)menuForKTStatusError
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
  char v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell learnMoreAction](self, "learnMoreAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell reportToAppleAction](self, "reportToAppleAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell verifyConversationAction](self, "verifyConversationAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell clearWarningAction](self, "clearWarningAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEA740];
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = v6;
  v16[2] = v5;
  v16[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isKeyTransparencyReportToAppleEnabled");

  if ((v13 & 1) == 0)
    objc_msgSend(v3, "removeObject:", v5);
  if (self->_handlesInChatCount >= 2)
    objc_msgSend(v3, "removeObject:", v6);
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)menuForKTStatusUnavailable
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
  char v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell learnMoreAction](self, "learnMoreAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell reportToAppleAction](self, "reportToAppleAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell clearWarningAction](self, "clearWarningAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEA740];
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v9;
  v15[1] = v5;
  v15[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isKeyTransparencyReportToAppleEnabled");

  if ((v12 & 1) == 0)
    objc_msgSend(v3, "removeObject:", v5);
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)menuForKTStatusTurnedOff
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell learnMoreAction](self, "learnMoreAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTEnhancedProtectionStatusCell clearWarningAction](self, "clearWarningAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA740];
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)learnMoreAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("KT_LEARN_MORE_ELLIPSES"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("info.circle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CKKTEnhancedProtectionStatusCell_learnMoreAction__block_invoke;
  v8[3] = &unk_1E274A4C0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __51__CKKTEnhancedProtectionStatusCell_learnMoreAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "keyTransparencyDetailsStatusCellDidSelectLearnMore:", v3);

}

- (id)reportToAppleAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("KT_REPORT_TO_APPLE_ELLIPSES"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("exclamationmark.bubble"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CKKTEnhancedProtectionStatusCell_reportToAppleAction__block_invoke;
  v8[3] = &unk_1E274A4C0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __55__CKKTEnhancedProtectionStatusCell_reportToAppleAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "keyTransparencyDetailsStatusCellDidRequestReportToApple:", v3);

}

- (id)verifyConversationAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("KT_VERIFY_CONVERSATION_ELLIPSES"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("person.crop.circle.badge.checkmark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__CKKTEnhancedProtectionStatusCell_verifyConversationAction__block_invoke;
  v8[3] = &unk_1E274A4C0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __60__CKKTEnhancedProtectionStatusCell_verifyConversationAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "keyTransparencyDetailsStatusCellDidRequestVerification:", v3);

}

- (id)clearWarningAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("KT_CLEAR_WARNING"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __54__CKKTEnhancedProtectionStatusCell_clearWarningAction__block_invoke;
  v11 = &unk_1E274A4C0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAttributes:", 2, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

void __54__CKKTEnhancedProtectionStatusCell_clearWarningAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "keyTransparencyDetailsStatusCellDidSelectIgnoreFailures:", v3);

}

- (int64_t)enhancedProtectionStatusCellState
{
  return self->_enhancedProtectionStatusCellState;
}

- (void)setEnhancedProtectionStatusCellState:(int64_t)a3
{
  self->_enhancedProtectionStatusCellState = a3;
}

- (unint64_t)verifiedHandlesCount
{
  return self->_verifiedHandlesCount;
}

- (void)setVerifiedHandlesCount:(unint64_t)a3
{
  self->_verifiedHandlesCount = a3;
}

- (unint64_t)handlesInChatCount
{
  return self->_handlesInChatCount;
}

- (void)setHandlesInChatCount:(unint64_t)a3
{
  self->_handlesInChatCount = a3;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (UILabel)macHeaderLabel
{
  return self->_macHeaderLabel;
}

- (void)setMacHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_macHeaderLabel, a3);
}

- (UIButton)ktStatusButton
{
  return self->_ktStatusButton;
}

- (void)setKtStatusButton:(id)a3
{
  objc_storeStrong((id *)&self->_ktStatusButton, a3);
}

- (UILabel)ktTitleLabel
{
  return self->_ktTitleLabel;
}

- (void)setKtTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ktTitleLabel, a3);
}

- (CKKTEnhancedProtectionStatusCellDelegate)delegate
{
  return (CKKTEnhancedProtectionStatusCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldShowMacHeader
{
  return self->_shouldShowMacHeader;
}

- (NSMutableArray)horizontalLayoutConstraints
{
  return self->_horizontalLayoutConstraints;
}

- (void)setHorizontalLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalLayoutConstraints, a3);
}

- (NSMutableArray)verticalLayoutConstraints
{
  return self->_verticalLayoutConstraints;
}

- (void)setVerticalLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_verticalLayoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_horizontalLayoutConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ktTitleLabel, 0);
  objc_storeStrong((id *)&self->_ktStatusButton, 0);
  objc_storeStrong((id *)&self->_macHeaderLabel, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
