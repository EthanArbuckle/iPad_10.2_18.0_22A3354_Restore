@implementation CKFocusFilterBannerCollectionViewCell

+ (NSString)itemIdentifier
{
  return (NSString *)CFSTR("FocusFilterBanner");
}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("FocusFilterBanner");
}

+ (BOOL)_showsKeyline
{
  void *v2;
  char v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conversationListFocusFilterBannerShowsKeylines");

  return v3;
}

- (CKFocusFilterBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKFocusFilterBannerCollectionViewCell *v3;
  CKFocusFilterBannerCollectionViewCell *v4;
  void *v5;
  UILabel *v6;
  UILabel *focusFilterStateDescriptionLabel;
  uint64_t v8;
  UIButton *focusFilterToggleButton;
  UIView *v10;
  UIView *topKeylineView;
  void *v12;
  UIView *v13;
  UIView *bottomKeylineView;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSLayoutConstraint *topKeylineHeightConstraint;
  void *v34;
  uint64_t v35;
  NSLayoutConstraint *bottomKeylineHeightConstraint;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)CKFocusFilterBannerCollectionViewCell;
  v3 = -[CKFocusFilterBannerCollectionViewCell initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKFocusFilterBannerCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFocusFilterBannerCollectionViewCell setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 1);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    focusFilterStateDescriptionLabel = v4->_focusFilterStateDescriptionLabel;
    v4->_focusFilterStateDescriptionLabel = v6;

    -[UILabel setNumberOfLines:](v4->_focusFilterStateDescriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v4->_focusFilterStateDescriptionLabel, "setTextAlignment:", 4);
    objc_msgSend(v5, "addSubview:", v4->_focusFilterStateDescriptionLabel);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", CKIsRunningInMacCatalyst() != 0);
    v8 = objc_claimAutoreleasedReturnValue();
    focusFilterToggleButton = v4->_focusFilterToggleButton;
    v4->_focusFilterToggleButton = (UIButton *)v8;

    -[UIButton addTarget:action:forControlEvents:](v4->_focusFilterToggleButton, "addTarget:action:forControlEvents:", v4, sel__focusFilterToggleButtonSelected_, 0x2000);
    objc_msgSend(v5, "addSubview:", v4->_focusFilterToggleButton);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    topKeylineView = v4->_topKeylineView;
    v4->_topKeylineView = v10;

    objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_topKeylineView, "setBackgroundColor:", v12);

    objc_msgSend(v5, "addSubview:", v4->_topKeylineView);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    bottomKeylineView = v4->_bottomKeylineView;
    v4->_bottomKeylineView = v13;

    objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_bottomKeylineView, "setBackgroundColor:", v15);

    objc_msgSend(v5, "addSubview:", v4->_bottomKeylineView);
    -[CKFocusFilterBannerCollectionViewCell _updateTitle](v4, "_updateTitle");
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_focusFilterStateDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_focusFilterToggleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_topKeylineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_bottomKeylineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v16) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_focusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 0, v16);
    LODWORD(v17) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v4->_focusFilterToggleButton, "setContentHuggingPriority:forAxis:", 0, v17);
    LODWORD(v18) = 1132068864;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_focusFilterStateDescriptionLabel, "setContentHuggingPriority:forAxis:", 0, v18);
    LODWORD(v19) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_focusFilterStateDescriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    LODWORD(v20) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_focusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    LODWORD(v21) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_focusFilterStateDescriptionLabel, "setContentHuggingPriority:forAxis:", 1, v21);
    LODWORD(v22) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v4->_focusFilterToggleButton, "setContentHuggingPriority:forAxis:", 1, v22);
    -[UIView leadingAnchor](v4->_topKeylineView, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[UIView leadingAnchor](v4->_bottomKeylineView, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    -[UIView heightAnchor](v4->_topKeylineView, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", 1.0);
    v32 = objc_claimAutoreleasedReturnValue();
    topKeylineHeightConstraint = v4->_topKeylineHeightConstraint;
    v4->_topKeylineHeightConstraint = (NSLayoutConstraint *)v32;

    -[UIView heightAnchor](v4->_bottomKeylineView, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 1.0);
    v35 = objc_claimAutoreleasedReturnValue();
    bottomKeylineHeightConstraint = v4->_bottomKeylineHeightConstraint;
    v4->_bottomKeylineHeightConstraint = (NSLayoutConstraint *)v35;

    v37 = (void *)MEMORY[0x1E0CB3718];
    v48[0] = v4->_topKeylineHeightConstraint;
    v48[1] = v4->_bottomKeylineHeightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v38);

    -[CKFocusFilterBannerCollectionViewCell _updateKeylineHeightConstraints](v4, "_updateKeylineHeightConstraints");
    -[CKFocusFilterBannerCollectionViewCell _updateSizeClassDependentConstraints](v4, "_updateSizeClassDependentConstraints");
    -[CKFocusFilterBannerCollectionViewCell _updateFilterToggleButtonConfiguration](v4, "_updateFilterToggleButtonConfiguration");
    -[CKFocusFilterBannerCollectionViewCell _updateKeylineAlignmentConstraints](v4, "_updateKeylineAlignmentConstraints");
    -[UIView topAnchor](v4->_topKeylineView, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    -[UIView bottomAnchor](v4->_bottomKeylineView, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObserver:selector:name:object:", v4, sel_contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

    -[UIView setHidden:](v4->_topKeylineView, "setHidden:", objc_msgSend((id)objc_opt_class(), "_showsKeyline") ^ 1);
    -[UIView setHidden:](v4->_bottomKeylineView, "setHidden:", objc_msgSend((id)objc_opt_class(), "_showsKeyline") ^ 1);

  }
  return v4;
}

- (void)setIsFocusFilterEnabled:(BOOL)a3
{
  if (self->_isFocusFilterEnabled != a3)
  {
    self->_isFocusFilterEnabled = a3;
    -[CKFocusFilterBannerCollectionViewCell _updateTitle](self, "_updateTitle");
  }
}

- (void)setUseFullWidthKeylines:(BOOL)a3
{
  if (self->_useFullWidthKeylines != a3)
  {
    self->_useFullWidthKeylines = a3;
    -[CKFocusFilterBannerCollectionViewCell _updateKeylineAlignmentConstraints](self, "_updateKeylineAlignmentConstraints");
  }
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CKFocusFilterBannerCollectionViewCell *v32;
  void *v33;
  id v34;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationListFocusFilterBannerTitleFont");
  v34 = (id)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationListFocusFilterBannerTitleValueFont");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = self;
  LODWORD(v3) = self->_isFocusFilterEnabled;
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v3)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FILTERED_BY_FOCUS"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transcriptAvailabilityColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TURN_OFF"), &stru_1E276D870, CFSTR("ChatKit"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversationListFocusFilterBannerTextColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "conversationListFocusFilterBannerEnabledIcon");
  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FOCUS_FILTER_OFF"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "theme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "conversationListSummaryColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TURN_ON"), &stru_1E276D870, CFSTR("ChatKit"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "theme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "conversationListFocusFilterBannerTextColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "conversationListFocusFilterBannerDisabledIcon");
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v7;

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v7);
  objc_msgSend(v20, "replaceCharactersInRange:withString:", 0, 0, CFSTR(" "));
  v21 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v21, "setImage:", v19);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "insertAttributedString:atIndex:", v22, 0);
  v23 = objc_msgSend(v20, "length");
  v24 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v34, 0, v23);
  v25 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v31, 0, v23);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v30);
  v27 = objc_msgSend(v26, "length");
  objc_msgSend(v26, "addAttribute:value:range:", v24, v33, 0, v27);
  objc_msgSend(v26, "addAttribute:value:range:", v25, v29, 0, v27);
  -[UILabel setAttributedText:](v32->_focusFilterStateDescriptionLabel, "setAttributedText:", v20);
  -[UIButton setAttributedTitle:forState:](v32->_focusFilterToggleButton, "setAttributedTitle:forState:", v26, 0);

}

- (void)_updateKeylineHeightConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  double v8;

  -[CKFocusFilterBannerCollectionViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAccessibilityPreferredContentSizeCategory");

  if (v7)
    v8 = 1.0;
  else
    v8 = 1.0 / v5;
  -[NSLayoutConstraint setConstant:](self->_topKeylineHeightConstraint, "setConstant:", v8);
  -[NSLayoutConstraint setConstant:](self->_bottomKeylineHeightConstraint, "setConstant:", v8);
}

- (void)_updateKeylineAlignmentConstraints
{
  id v3;
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
  NSArray *v15;
  NSArray *keylineAlignmentConstraints;
  id v17;

  if (self->_keylineAlignmentConstraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  -[CKFocusFilterBannerCollectionViewCell contentView](self, "contentView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_useFullWidthKeylines)
  {
    objc_msgSend(v17, "trailingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_topKeylineView, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

    objc_msgSend(v17, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_bottomKeylineView, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);
  }
  else
  {
    objc_msgSend(v17, "layoutMarginsGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_topKeylineView, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

    objc_msgSend(v17, "layoutMarginsGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_bottomKeylineView, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  v15 = (NSArray *)objc_msgSend(v3, "copy");
  keylineAlignmentConstraints = self->_keylineAlignmentConstraints;
  self->_keylineAlignmentConstraints = v15;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_keylineAlignmentConstraints);
}

- (void)_updateSizeClassDependentConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  int v11;
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
  void *focusFilterToggleButton;
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
  NSArray *v54;
  NSArray *sizeClassDependentConstraints;
  id v56;

  if (self->_sizeClassDependentConstraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  -[CKFocusFilterBannerCollectionViewCell contentView](self, "contentView");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationListFocusFilterBannerTopPadding");
  v5 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationListFocusFilterBannerBottomPadding");
  v8 = v7;

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "conversationListFocusFilterBannerShouldUseAccessabilityLayout");

  -[UILabel leadingAnchor](self->_focusFilterStateDescriptionLabel, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "layoutMarginsGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v15);

  if (v11)
  {
    -[UILabel trailingAnchor](self->_focusFilterStateDescriptionLabel, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v19);

    -[UIButton leadingAnchor](self->_focusFilterToggleButton, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layoutMarginsGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v23);

    -[UIButton trailingAnchor](self->_focusFilterToggleButton, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v27);

    -[UILabel topAnchor](self->_focusFilterStateDescriptionLabel, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v30);

    -[UIButton topAnchor](self->_focusFilterToggleButton, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_focusFilterStateDescriptionLabel, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 8.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v33);

    objc_msgSend(v56, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    focusFilterToggleButton = self->_focusFilterToggleButton;
  }
  else
  {
    -[UIButton leadingAnchor](self->_focusFilterToggleButton, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](self->_focusFilterStateDescriptionLabel, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 10.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v38);

    -[UIButton trailingAnchor](self->_focusFilterToggleButton, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layoutMarginsGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v42);

    -[UILabel centerYAnchor](self->_focusFilterStateDescriptionLabel, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v45);

    -[UILabel topAnchor](self->_focusFilterStateDescriptionLabel, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, v5);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v48);

    -[UIButton centerYAnchor](self->_focusFilterToggleButton, "centerYAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](self->_focusFilterStateDescriptionLabel, "centerYAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v51);

    objc_msgSend(v56, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    focusFilterToggleButton = self->_focusFilterStateDescriptionLabel;
  }
  objc_msgSend(focusFilterToggleButton, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v52, v8);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v53);

  v54 = (NSArray *)objc_msgSend(v9, "copy");
  sizeClassDependentConstraints = self->_sizeClassDependentConstraints;
  self->_sizeClassDependentConstraints = v54;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_sizeClassDependentConstraints);
}

- (void)_updateFilterToggleButtonConfiguration
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conversationListFocusFilterBannerShouldUseAccessabilityLayout");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setButtonSize:", 0);
    objc_msgSend(v7, "setCornerStyle:", 4);
    objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    objc_msgSend(v7, "setBackground:", v5);
  }
  else
  {
    v7 = 0;
  }
  -[UIButton setConfiguration:](self->_focusFilterToggleButton, "setConfiguration:", v7);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFocusFilterBannerCollectionViewCell;
  -[CKFocusFilterBannerCollectionViewCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKFocusFilterBannerCollectionViewCell _updateKeylineHeightConstraints](self, "_updateKeylineHeightConstraints");
}

- (void)contentSizeCategoryDidChange
{
  -[CKFocusFilterBannerCollectionViewCell _updateTitle](self, "_updateTitle");
  -[CKFocusFilterBannerCollectionViewCell _updateSizeClassDependentConstraints](self, "_updateSizeClassDependentConstraints");
  -[CKFocusFilterBannerCollectionViewCell _updateKeylineHeightConstraints](self, "_updateKeylineHeightConstraints");
  -[CKFocusFilterBannerCollectionViewCell _updateFilterToggleButtonConfiguration](self, "_updateFilterToggleButtonConfiguration");
}

- (void)_focusFilterToggleButtonSelected:(id)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !self->_isFocusFilterEnabled;
  -[CKFocusFilterBannerCollectionViewCell focusFilterBannerDelegate](self, "focusFilterBannerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusFilterBannerEnabledStateDidChange:", v3);

}

- (CKFocusFilterBannerDelegate)focusFilterBannerDelegate
{
  return (CKFocusFilterBannerDelegate *)objc_loadWeakRetained((id *)&self->_focusFilterBannerDelegate);
}

- (void)setFocusFilterBannerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_focusFilterBannerDelegate, a3);
}

- (BOOL)isFocusFilterEnabled
{
  return self->_isFocusFilterEnabled;
}

- (BOOL)useFullWidthKeylines
{
  return self->_useFullWidthKeylines;
}

- (UILabel)focusFilterStateDescriptionLabel
{
  return self->_focusFilterStateDescriptionLabel;
}

- (void)setFocusFilterStateDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_focusFilterStateDescriptionLabel, a3);
}

- (UIButton)focusFilterToggleButton
{
  return self->_focusFilterToggleButton;
}

- (void)setFocusFilterToggleButton:(id)a3
{
  objc_storeStrong((id *)&self->_focusFilterToggleButton, a3);
}

- (UIView)topKeylineView
{
  return self->_topKeylineView;
}

- (void)setTopKeylineView:(id)a3
{
  objc_storeStrong((id *)&self->_topKeylineView, a3);
}

- (UIView)bottomKeylineView
{
  return self->_bottomKeylineView;
}

- (void)setBottomKeylineView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomKeylineView, a3);
}

- (NSLayoutConstraint)topKeylineHeightConstraint
{
  return self->_topKeylineHeightConstraint;
}

- (void)setTopKeylineHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topKeylineHeightConstraint, a3);
}

- (NSLayoutConstraint)bottomKeylineHeightConstraint
{
  return self->_bottomKeylineHeightConstraint;
}

- (void)setBottomKeylineHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomKeylineHeightConstraint, a3);
}

- (NSArray)sizeClassDependentConstraints
{
  return self->_sizeClassDependentConstraints;
}

- (void)setSizeClassDependentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_sizeClassDependentConstraints, a3);
}

- (NSArray)keylineAlignmentConstraints
{
  return self->_keylineAlignmentConstraints;
}

- (void)setKeylineAlignmentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_keylineAlignmentConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keylineAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_sizeClassDependentConstraints, 0);
  objc_storeStrong((id *)&self->_bottomKeylineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_topKeylineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_bottomKeylineView, 0);
  objc_storeStrong((id *)&self->_topKeylineView, 0);
  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
  objc_storeStrong((id *)&self->_focusFilterStateDescriptionLabel, 0);
  objc_destroyWeak((id *)&self->_focusFilterBannerDelegate);
}

@end
