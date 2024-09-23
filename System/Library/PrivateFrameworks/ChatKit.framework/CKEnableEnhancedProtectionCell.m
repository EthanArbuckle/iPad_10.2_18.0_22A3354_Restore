@implementation CKEnableEnhancedProtectionCell

+ (id)reuseIdentifier
{
  return CFSTR("CKEnableEnhancedProtectionCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 1;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKEnableEnhancedProtectionCell;
  -[CKDetailsCell layoutSubviews](&v5, sel_layoutSubviews);
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (CKEnableEnhancedProtectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 conversation:(id)a5 shouldShowMacHeader:(BOOL)a6
{
  CKEnableEnhancedProtectionCell *v7;
  CKEnableEnhancedProtectionCell *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKEnableEnhancedProtectionCell;
  v7 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4, a5);
  v8 = v7;
  if (v7)
  {
    v7->_shouldShowMacHeader = a6;
    -[CKEnableEnhancedProtectionCell setupView](v7, "setupView");
  }
  return v8;
}

- (void)setupView
{
  void *v3;

  -[CKEnableEnhancedProtectionCell setupTitleLabel](self, "setupTitleLabel");
  if (self->_shouldShowMacHeader)
  {
    -[CKEnableEnhancedProtectionCell setupMacHeaderLabel](self, "setupMacHeaderLabel");
    -[CKEnableEnhancedProtectionCell setupSeparatorView](self, "setupSeparatorView");
  }
  -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  -[CKEnableEnhancedProtectionCell addConstraints](self, "addConstraints");
}

- (void)setupTitleLabel
{
  id v3;
  UILabel *v4;
  UILabel *ktTitleLabel;
  UILabel *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  ktTitleLabel = self->_ktTitleLabel;
  self->_ktTitleLabel = v4;

  v6 = self->_ktTitleLabel;
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("KT_ENABLE_KT_CELL_TEXT"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v6, "setText:", v8);

  v9 = self->_ktTitleLabel;
  -[CKEnableEnhancedProtectionCell textLabel](self, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v9, "setFont:", v11);

  v12 = self->_ktTitleLabel;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "theme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "detailsTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v12, "setTextColor:", v15);

  -[UILabel setNumberOfLines:](self->_ktTitleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_ktTitleLabel, "setLineBreakMode:", 4);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_ktTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v16, "isCarrierPigeonEnabled");

  if ((_DWORD)v13)
  {
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isSatelliteConnectionActive");

    -[CKEnableEnhancedProtectionCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v18 ^ 1u);
    -[UILabel setEnabled:](self->_ktTitleLabel, "setEnabled:", v18 ^ 1u);
  }
  -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_ktTitleLabel);

}

- (void)addConstraints
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
  UILabel *macHeaderLabel;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  double v32;
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
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[6];

  v74[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningInMacCatalyst() && self->_shouldShowMacHeader)
  {
    -[UILabel topAnchor](self->_macHeaderLabel, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "layoutMarginsGuide");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "detailsSectionHeaderPaddingAbove");
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v56);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v53;
    -[UILabel heightAnchor](self->_macHeaderLabel, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_macHeaderLabel, "font");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "pointSize");
    objc_msgSend(v47, "constraintEqualToConstant:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v44;
    -[UILabel leadingAnchor](self->_macHeaderLabel, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layoutMarginsGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detailsSectionHeaderPaddingLeading");
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v5;
    -[UILabel trailingAnchor](self->_macHeaderLabel, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutMarginsGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObjectsFromArray:", v11);

    -[UIView leadingAnchor](self->_separatorView, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "layoutMarginsGuide");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v60);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v57;
    -[UIView trailingAnchor](self->_separatorView, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "layoutMarginsGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v45);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v12;
    -[UIView bottomAnchor](self->_separatorView, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutMarginsGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v17;
    -[UIView heightAnchor](self->_separatorView, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObjectsFromArray:", v20);

  }
  -[UILabel leadingAnchor](self->_ktTitleLabel, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "layoutMarginsGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v70 = v21;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v58;
  -[UILabel trailingAnchor](self->_ktTitleLabel, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layoutMarginsGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trailingAnchor");
  v55 = v22;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v43;
  -[UILabel topAnchor](self->_ktTitleLabel, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  macHeaderLabel = self->_macHeaderLabel;
  if (macHeaderLabel)
  {
    -[UILabel bottomAnchor](self->_macHeaderLabel, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v25;
  }
  else
  {
    -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layoutMarginsGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "detailsCellLabelPadding");
  v41 = v23;
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v27;
  -[UILabel bottomAnchor](self->_ktTitleLabel, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self->_macHeaderLabel;
  if (v29)
  {
    -[UIView topAnchor](self->_separatorView, "topAnchor");
  }
  else
  {
    -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutMarginsGuide");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "detailsCellLabelPadding");
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, -v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addObjectsFromArray:", v34);

  if (!v29)
  {

    v30 = v36;
  }

  if (!macHeaderLabel)
  {

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v71);

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
  UILabel *macHeaderLabel;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGSize result;

  width = a3.width;
  -[CKEnableEnhancedProtectionCell contentView](self, "contentView", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMargins");
  v7 = v6;
  -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMargins");
  v10 = v7 + v9;

  -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12 - v10;

  v14 = 0.0;
  if (self->_shouldShowMacHeader)
  {
    macHeaderLabel = self->_macHeaderLabel;
    if (macHeaderLabel)
    {
      -[UILabel sizeThatFits:](macHeaderLabel, "sizeThatFits:", v13, 1.79769313e308);
      v17 = v16;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "detailsSectionHeaderPaddingAbove");
      v20 = v17 + v19;

      -[UIView frame](self->_separatorView, "frame");
      v14 = v20 + v21;
    }
  }
  -[UILabel sizeThatFits:](self->_ktTitleLabel, "sizeThatFits:", v13, 1.79769313e308);
  v23 = v14 + v22;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "detailsCellLabelPadding");
  v26 = v23 + v25 * 2.0;

  -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutMargins");
  v29 = v26 + v28;
  -[CKEnableEnhancedProtectionCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layoutMargins");
  v32 = v29 + v31;

  v33 = width;
  v34 = v32;
  result.height = v34;
  result.width = v33;
  return result;
}

- (UILabel)ktTitleLabel
{
  return self->_ktTitleLabel;
}

- (void)setKtTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ktTitleLabel, a3);
}

- (UILabel)macHeaderLabel
{
  return self->_macHeaderLabel;
}

- (void)setMacHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_macHeaderLabel, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (BOOL)shouldShowMacHeader
{
  return self->_shouldShowMacHeader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_macHeaderLabel, 0);
  objc_storeStrong((id *)&self->_ktTitleLabel, 0);
}

@end
