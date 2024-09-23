@implementation CKKTVerifyConversationTableViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKKTVerifyConversationTableViewCell_reuseIdentifier");
}

- (CKKTVerifyConversationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 numberOfRowsInSection:(int64_t)a5 shouldShowMacHeader:(BOOL)a6 ktStatus:(unint64_t)a7
{
  CKKTVerifyConversationTableViewCell *v10;
  CKKTVerifyConversationTableViewCell *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKKTVerifyConversationTableViewCell;
  v10 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v11 = v10;
  if (v10)
  {
    v10->_numberOfRowsInSection = a5;
    v10->_shouldShowMacHeader = a6;
    v10->_ktStatus = a7;
    -[CKKTVerifyConversationTableViewCell setupView](v10, "setupView");
  }
  return v11;
}

- (void)setupView
{
  void *v3;

  -[CKKTVerifyConversationTableViewCell setupTitleLabel](self, "setupTitleLabel");
  -[CKKTVerifyConversationTableViewCell setupSeparators](self, "setupSeparators");
  if (self->_shouldShowMacHeader)
    -[CKKTVerifyConversationTableViewCell setupMacHeaderLabel](self, "setupMacHeaderLabel");
  -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  -[CKKTVerifyConversationTableViewCell addConstraints](self, "addConstraints");
}

- (void)setupSeparators
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = self->_numberOfRowsInSection < 2;
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[CKDetailsCell setIndentTopSeperator:](self, "setIndentTopSeperator:", 1);
  -[CKDetailsCell setIndentBottomSeperator:](self, "setIndentBottomSeperator:", 1);
}

- (void)setEnabled:(BOOL)a3
{
  -[UILabel setEnabled:](self->_verifyConversationLabel, "setEnabled:", a3);
}

- (void)setupTitleLabel
{
  id v3;
  UILabel *v4;
  UILabel *verifyConversationLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  verifyConversationLabel = self->_verifyConversationLabel;
  self->_verifyConversationLabel = v4;

  v6 = self->_verifyConversationLabel;
  -[CKKTVerifyConversationTableViewCell verifyTitleString](self, "verifyTitleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v6, "setText:", v7);

  v8 = self->_verifyConversationLabel;
  -[CKKTVerifyConversationTableViewCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8, "setFont:", v10);

  v11 = self->_verifyConversationLabel;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "detailsTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v11, "setTextColor:", v14);

  -[UILabel setNumberOfLines:](self->_verifyConversationLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_verifyConversationLabel, "setLineBreakMode:", 4);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_verifyConversationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_verifyConversationLabel);

}

- (void)addConstraints
{
  unint64_t v3;
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
  UILabel *macHeaderLabel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UILabel *v32;
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
  _QWORD v54[4];
  _QWORD v55[6];

  v55[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0x1E0C99000;
  if (CKIsRunningInMacCatalyst() && self->_shouldShowMacHeader)
  {
    -[UILabel topAnchor](self->_macHeaderLabel, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "layoutMarginsGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "detailsSectionHeaderPaddingAbove");
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v43);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v41;
    -[UILabel heightAnchor](self->_macHeaderLabel, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_macHeaderLabel, "font");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "pointSize");
    objc_msgSend(v37, "constraintEqualToConstant:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v35;
    -[UILabel leadingAnchor](self->_macHeaderLabel, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layoutMarginsGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailsSectionHeaderPaddingLeading");
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v6;
    -[UILabel trailingAnchor](self->_macHeaderLabel, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMarginsGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObjectsFromArray:", v12);

    v3 = 0x1E0C99000uLL;
  }
  -[UILabel leadingAnchor](self->_verifyConversationLabel, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "layoutMarginsGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v52 = v13;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v44;
  -[UILabel trailingAnchor](self->_verifyConversationLabel, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layoutMarginsGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v42 = v14;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v34;
  -[UILabel topAnchor](self->_verifyConversationLabel, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  macHeaderLabel = self->_macHeaderLabel;
  v32 = macHeaderLabel;
  if (macHeaderLabel)
  {
    -[UILabel bottomAnchor](macHeaderLabel, "bottomAnchor");
  }
  else
  {
    -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "detailsCellLabelPadding");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v18;
  -[UILabel bottomAnchor](self->_verifyConversationLabel, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "detailsCellLabelPadding");
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v22, -v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v25;
  objc_msgSend(*(id *)(v3 + 3360), "arrayWithObjects:count:", v54, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObjectsFromArray:", v26);

  if (!v32)
  {

    v17 = v28;
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v53);
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
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  width = a3.width;
  -[CKKTVerifyConversationTableViewCell contentView](self, "contentView", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMargins");
  v7 = v6;
  -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMargins");
  v10 = v7 + v9;

  -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
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
      v14 = v17 + v19;

    }
  }
  -[UILabel sizeThatFits:](self->_verifyConversationLabel, "sizeThatFits:", v13, 1.79769313e308);
  v21 = v14 + v20;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "detailsCellLabelPadding");
  v24 = v21 + v23 * 2.0;

  -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutMargins");
  v27 = v24 + v26;
  -[CKKTVerifyConversationTableViewCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layoutMargins");
  v30 = v27 + v29;

  v31 = width;
  v32 = v30;
  result.height = v32;
  result.width = v31;
  return result;
}

- (void)updateForNewKTState
{
  void *v3;
  id v4;

  -[CKKTVerifyConversationTableViewCell setupSeparators](self, "setupSeparators");
  if (self->_shouldShowMacHeader)
    -[CKKTVerifyConversationTableViewCell setupMacHeaderLabel](self, "setupMacHeaderLabel");
  -[CKKTVerifyConversationTableViewCell verifyConversationLabel](self, "verifyConversationLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKKTVerifyConversationTableViewCell verifyTitleString](self, "verifyTitleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (id)verifyTitleString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("KT_VERIFY_CONVERSATION_CELL_TEXT"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKKTVerifyConversationTableViewCell ktStatus](self, "ktStatus") == 4)
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("KT_SHOW_VREIFICATION_CODE_CELL_TEXT"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (unint64_t)ktStatus
{
  return self->_ktStatus;
}

- (void)setKtStatus:(unint64_t)a3
{
  self->_ktStatus = a3;
}

- (BOOL)shouldShowMacHeader
{
  return self->_shouldShowMacHeader;
}

- (void)setShouldShowMacHeader:(BOOL)a3
{
  self->_shouldShowMacHeader = a3;
}

- (int64_t)numberOfRowsInSection
{
  return self->_numberOfRowsInSection;
}

- (void)setNumberOfRowsInSection:(int64_t)a3
{
  self->_numberOfRowsInSection = a3;
}

- (UILabel)verifyConversationLabel
{
  return self->_verifyConversationLabel;
}

- (void)setVerifyConversationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_verifyConversationLabel, a3);
}

- (UILabel)macHeaderLabel
{
  return self->_macHeaderLabel;
}

- (void)setMacHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_macHeaderLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macHeaderLabel, 0);
  objc_storeStrong((id *)&self->_verifyConversationLabel, 0);
}

@end
