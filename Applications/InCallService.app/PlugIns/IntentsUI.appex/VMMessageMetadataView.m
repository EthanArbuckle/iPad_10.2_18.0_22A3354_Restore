@implementation VMMessageMetadataView

- (VMMessageMetadataView)initWithAccessibleLayout:(BOOL)a3
{
  VMMessageMetadataView *v4;
  VMMessageMetadataView *v5;
  uint64_t v6;
  UIButton *infoButton;
  UIButton *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  UIButton *actionButton;
  double v14;
  double v15;
  UILabel *v16;
  UILabel *titleLabel;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *subtitleLabel;
  void *v22;
  void *v23;
  void *v24;
  UIDateLabel *v25;
  UIDateLabel *shortDateLabel;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  UILabel *v32;
  UILabel *shortDurationLabel;
  void *v34;
  void *v35;
  double v36;
  double v37;
  UILabel *v38;
  UILabel *fullDateLabel;
  void *v40;
  void *v41;
  TPBadgeView *v42;
  TPBadgeView *badgeView;
  double v44;
  double v45;
  double v46;
  double v47;
  UILayoutGuide *v48;
  UILayoutGuide *buttonLayoutGuide;
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
  uint64_t v61;
  NSLayoutConstraint *subtitleLeadingToLayoutMarginConstrant;
  void *v63;
  void *v64;
  uint64_t v65;
  NSLayoutConstraint *badgeViewTrailingToSubtitleLeadingConstrant;
  NSArray *currentActiveFixedConstraints;
  NSString *currentRequiredConstraintsKey;
  NSArray *currentRequiredConstraints;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  objc_super v77;
  _QWORD v78[4];

  v77.receiver = self;
  v77.super_class = (Class)VMMessageMetadataView;
  v4 = -[VMMessageMetadataView init](&v77, "init");
  v5 = v4;
  if (v4)
  {
    v4->_layoutIsAccessible = a3;
    -[VMMessageMetadataView setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", 12.0, 0.0, 12.0, 0.0);
    v6 = objc_claimAutoreleasedReturnValue(+[TPActionButton button](TPActionButton, "button"));
    infoButton = v5->_infoButton;
    v5->_infoButton = (UIButton *)v6;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_infoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAccessibilityIdentifier:](v5->_infoButton, "setAccessibilityIdentifier:", CFSTR("VMMessageMetadataView_Info"));
    v8 = v5->_infoButton;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage telephonyUIInfoButtonGlyphImage](UIImage, "telephonyUIInfoButtonGlyphImage"));
    -[UIButton setImage:forStates:](v8, "setImage:forStates:", v9, 0);

    -[UIButton addTarget:action:forEvents:](v5->_infoButton, "addTarget:action:forEvents:", v5, "didTapInfo:", 64);
    LODWORD(v10) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5->_infoButton, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    LODWORD(v11) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v5->_infoButton, "setContentHuggingPriority:forAxis:", 0, v11);
    -[VMMessageMetadataView addSubview:](v5, "addSubview:", v5->_infoButton);
    v12 = objc_claimAutoreleasedReturnValue(+[TPActionButton button](TPActionButton, "button"));
    actionButton = v5->_actionButton;
    v5->_actionButton = (UIButton *)v12;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAccessibilityIdentifier:](v5->_actionButton, "setAccessibilityIdentifier:", CFSTR("VMMessageMetadataView_Action"));
    -[UIButton addTarget:action:forEvents:](v5->_actionButton, "addTarget:action:forEvents:", v5, "didTapAction:", 64);
    LODWORD(v14) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5->_actionButton, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    LODWORD(v15) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v5->_actionButton, "setContentHuggingPriority:forAxis:", 0, v15);
    -[VMMessageMetadataView addSubview:](v5, "addSubview:", v5->_actionButton);
    v16 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortEmphasizedFont](UIFont, "telephonyUIBodyShortEmphasizedFont"));
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
    -[UILabel setTextColor:](v5->_titleLabel, "setTextColor:", v19);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[VMMessageMetadataView addSubview:](v5, "addSubview:", v5->_titleLabel);
    v20 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v20;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUISubheadlineShortFont](UIFont, "telephonyUISubheadlineShortFont"));
    -[UILabel setFont:](v5->_subtitleLabel, "setFont:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView _accessibilityHigherContrastTintColorForColor:](v5, "_accessibilityHigherContrastTintColorForColor:", v23));
    -[UILabel setTextColor:](v5->_subtitleLabel, "setTextColor:", v24);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[VMMessageMetadataView addSubview:](v5, "addSubview:", v5->_subtitleLabel);
    v25 = (UIDateLabel *)objc_alloc_init((Class)UIDateLabel);
    shortDateLabel = v5->_shortDateLabel;
    v5->_shortDateLabel = v25;

    -[UIDateLabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_shortDateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUISubheadlineShortFont](UIFont, "telephonyUISubheadlineShortFont"));
    -[UIDateLabel setFont:](v5->_shortDateLabel, "setFont:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
    -[UIDateLabel setTextColor:](v5->_shortDateLabel, "setTextColor:", v28);

    -[UIDateLabel setAdjustsFontForContentSizeCategory:](v5->_shortDateLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v29) = 1144750080;
    -[UIDateLabel setContentHuggingPriority:forAxis:](v5->_shortDateLabel, "setContentHuggingPriority:forAxis:", 0, v29);
    LODWORD(v30) = 1144750080;
    -[UIDateLabel setContentHuggingPriority:forAxis:](v5->_shortDateLabel, "setContentHuggingPriority:forAxis:", 1, v30);
    LODWORD(v31) = 1148846080;
    -[UIDateLabel setContentCompressionResistancePriority:forAxis:](v5->_shortDateLabel, "setContentCompressionResistancePriority:forAxis:", 0, v31);
    -[VMMessageMetadataView addSubview:](v5, "addSubview:", v5->_shortDateLabel);
    v32 = (UILabel *)objc_alloc_init((Class)UILabel);
    shortDurationLabel = v5->_shortDurationLabel;
    v5->_shortDurationLabel = v32;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_shortDurationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUISubheadlineShortFont](UIFont, "telephonyUISubheadlineShortFont"));
    -[UILabel setFont:](v5->_shortDurationLabel, "setFont:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
    -[UILabel setTextColor:](v5->_shortDurationLabel, "setTextColor:", v35);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_shortDurationLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v36) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_shortDurationLabel, "setContentHuggingPriority:forAxis:", 0, v36);
    LODWORD(v37) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_shortDurationLabel, "setContentHuggingPriority:forAxis:", 1, v37);
    -[VMMessageMetadataView addSubview:](v5, "addSubview:", v5->_shortDurationLabel);
    v38 = (UILabel *)objc_alloc_init((Class)UILabel);
    fullDateLabel = v5->_fullDateLabel;
    v5->_fullDateLabel = v38;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_fullDateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUISubheadlineShortFont](UIFont, "telephonyUISubheadlineShortFont"));
    -[UILabel setFont:](v5->_fullDateLabel, "setFont:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
    -[UILabel setTextColor:](v5->_fullDateLabel, "setTextColor:", v41);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_fullDateLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[VMMessageMetadataView addSubview:](v5, "addSubview:", v5->_fullDateLabel);
    v42 = (TPBadgeView *)objc_msgSend(objc_alloc((Class)TPBadgeView), "initWithTitle:", &stru_10007F010);
    badgeView = v5->_badgeView;
    v5->_badgeView = v42;

    -[TPBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v5->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPBadgeView setHidden:](v5->_badgeView, "setHidden:", 1);
    LODWORD(v44) = 1148846080;
    -[TPBadgeView setContentCompressionResistancePriority:forAxis:](v5->_badgeView, "setContentCompressionResistancePriority:forAxis:", 0, v44);
    LODWORD(v45) = 1148846080;
    -[TPBadgeView setContentHuggingPriority:forAxis:](v5->_badgeView, "setContentHuggingPriority:forAxis:", 0, v45);
    LODWORD(v46) = 1148846080;
    -[TPBadgeView setContentCompressionResistancePriority:forAxis:](v5->_badgeView, "setContentCompressionResistancePriority:forAxis:", 1, v46);
    LODWORD(v47) = 1148846080;
    -[TPBadgeView setContentHuggingPriority:forAxis:](v5->_badgeView, "setContentHuggingPriority:forAxis:", 1, v47);
    -[VMMessageMetadataView addSubview:](v5, "addSubview:", v5->_badgeView);
    v48 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    buttonLayoutGuide = v5->_buttonLayoutGuide;
    v5->_buttonLayoutGuide = v48;

    -[VMMessageMetadataView addLayoutGuide:](v5, "addLayoutGuide:", v5->_buttonLayoutGuide);
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v5->_buttonLayoutGuide, "topAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIDateLabel bottomAnchor](v5->_shortDateLabel, "bottomAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v75));
    v78[0] = v74;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v5->_buttonLayoutGuide, "bottomAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_shortDurationLabel, "topAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
    v78[1] = v71;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TPBadgeView leadingAnchor](v5->_badgeView, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](v5, "layoutMarginsGuide"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v52));
    v78[2] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[TPBadgeView centerYAnchor](v5->_badgeView, "centerYAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_subtitleLabel, "centerYAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));
    v78[3] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v57);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_subtitleLabel, "leadingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](v5, "layoutMarginsGuide"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "leadingAnchor"));
    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v60));
    subtitleLeadingToLayoutMarginConstrant = v5->_subtitleLeadingToLayoutMarginConstrant;
    v5->_subtitleLeadingToLayoutMarginConstrant = (NSLayoutConstraint *)v61;

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[TPBadgeView trailingAnchor](v5->_badgeView, "trailingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_subtitleLabel, "leadingAnchor"));
    v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v64, -8.0));
    badgeViewTrailingToSubtitleLeadingConstrant = v5->_badgeViewTrailingToSubtitleLeadingConstrant;
    v5->_badgeViewTrailingToSubtitleLeadingConstrant = (NSLayoutConstraint *)v65;

    currentActiveFixedConstraints = v5->_currentActiveFixedConstraints;
    v5->_currentActiveFixedConstraints = (NSArray *)&__NSArray0__struct;

    currentRequiredConstraintsKey = v5->_currentRequiredConstraintsKey;
    v5->_currentRequiredConstraintsKey = 0;

    currentRequiredConstraints = v5->_currentRequiredConstraints;
    v5->_currentRequiredConstraints = (NSArray *)&__NSArray0__struct;

    -[VMMessageMetadataView createConstraints](v5, "createConstraints");
    -[VMMessageMetadataView updateSubviewConfiguration](v5, "updateSubviewConfiguration");
  }
  return v5;
}

- (void)configureWithViewModel:(id)a3
{
  void *v4;
  unsigned __int8 v5;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView currentViewModel](self, "currentViewModel"));
  v5 = objc_msgSend(v23, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[VMMessageMetadataView setCurrentViewModel:](self, "setCurrentViewModel:", v23);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
    objc_msgSend(v7, "setText:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedSubtitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v9, "setText:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
    objc_msgSend(v11, "setDate:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedDuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
    objc_msgSend(v13, "setText:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
    objc_msgSend(v15, "setText:", v14);

    v16 = objc_msgSend(v23, "showsRestrictedAlertView") ^ 1;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView actionButton](self, "actionButton"));
    objc_msgSend(v17, "setEnabled:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedSenderIdentityTitle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView badgeView](self, "badgeView"));
    v20 = v19;
    if (v18)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedSenderIdentityTitle"));
      objc_msgSend(v20, "setTitle:", v21);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView badgeView](self, "badgeView"));
      v20 = v19;
      v22 = 0;
    }
    else
    {
      v22 = 1;
    }
    objc_msgSend(v19, "setHidden:", v22);

    -[VMMessageMetadataView updateSubviewConfiguration](self, "updateSubviewConfiguration");
  }

}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[VMMessageMetadataView updateSubviewConfiguration](self, "updateSubviewConfiguration");
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[VMMessageMetadataView updateSubviewConfiguration](self, "updateSubviewConfiguration");
  }
}

- (void)setLayoutIsAccessible:(BOOL)a3
{
  if (self->_layoutIsAccessible != a3)
  {
    self->_layoutIsAccessible = a3;
    -[VMMessageMetadataView createConstraints](self, "createConstraints");
    -[VMMessageMetadataView updateSubviewConfiguration](self, "updateSubviewConfiguration");
  }
}

- (void)didTapInfo:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView delegate](self, "delegate", a3));
  objc_msgSend(v4, "messageMetadataView:didTapButtonType:", self, 2);

}

- (void)didTapAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView delegate](self, "delegate", a3));
  objc_msgSend(v4, "messageMetadataView:didTapButtonType:", self, 1);

}

- (void)updateSubviewConfiguration
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;

  v3 = objc_msgSend((id)objc_opt_class(self), "constraintsKeyForAccessibleLayout:expanded:editing:", -[VMMessageMetadataView layoutIsAccessible](self, "layoutIsAccessible"), -[VMMessageMetadataView isExpanded](self, "isExpanded"), -[VMMessageMetadataView isEditing](self, "isEditing"));
  v38 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView currentRequiredConstraintsKey](self, "currentRequiredConstraintsKey"));
  v5 = objc_msgSend(v38, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView currentRequiredConstraints](self, "currentRequiredConstraints"));
    LODWORD(v7) = 1132068864;
    -[VMMessageMetadataView setPriorityOfConstraints:to:](self, "setPriorityOfConstraints:to:", v6, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView constraintsForLayouts](self, "constraintsForLayouts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v38));
    -[VMMessageMetadataView setCurrentRequiredConstraints:](self, "setCurrentRequiredConstraints:", v9);

    -[VMMessageMetadataView setCurrentRequiredConstraintsKey:](self, "setCurrentRequiredConstraintsKey:", v38);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView currentRequiredConstraints](self, "currentRequiredConstraints"));
    LODWORD(v11) = 1148846080;
    -[VMMessageMetadataView setPriorityOfConstraints:to:](self, "setPriorityOfConstraints:to:", v10, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView badgeView](self, "badgeView"));
  v13 = objc_msgSend(v12, "isHidden");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLeadingToLayoutMarginConstrant](self, "subtitleLeadingToLayoutMarginConstrant"));
  v15 = v14;
  if (v13)
  {
    objc_msgSend(v14, "setActive:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView badgeViewTrailingToSubtitleLeadingConstrant](self, "badgeViewTrailingToSubtitleLeadingConstrant"));
    v17 = v16;
    v18 = 0;
  }
  else
  {
    objc_msgSend(v14, "setActive:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView badgeViewTrailingToSubtitleLeadingConstrant](self, "badgeViewTrailingToSubtitleLeadingConstrant"));
    v17 = v16;
    v18 = 1;
  }
  objc_msgSend(v16, "setActive:", v18);

  if (-[VMMessageMetadataView isExpanded](self, "isExpanded"))
    v19 = 0.0;
  else
    v19 = 1.0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
  objc_msgSend(v20, "setAlpha:", v19);

  if (-[VMMessageMetadataView isExpanded](self, "isExpanded"))
    v21 = 0.0;
  else
    v21 = 1.0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
  objc_msgSend(v22, "setAlpha:", v21);

  if (-[VMMessageMetadataView isExpanded](self, "isExpanded"))
    v23 = 1.0;
  else
    v23 = 0.0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  objc_msgSend(v24, "setAlpha:", v23);

  if (-[VMMessageMetadataView isExpanded](self, "isExpanded"))
    v25 = 1.0;
  else
    v25 = 0.0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView actionButton](self, "actionButton"));
  objc_msgSend(v26, "setAlpha:", v25);

  if (-[VMMessageMetadataView isEditing](self, "isEditing"))
    v27 = 0.0;
  else
    v27 = 1.0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
  objc_msgSend(v28, "setAlpha:", v27);

  -[VMMessageMetadataView updateLabelColors](self, "updateLabelColors");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView traitCollection](self, "traitCollection"));
  v30 = objc_msgSend(v29, "preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells") ^ 1;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  objc_msgSend(v31, "setNumberOfLines:", v30);

  v32 = -[VMMessageMetadataView layoutIsAccessible](self, "layoutIsAccessible") ^ 1;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v33, "setNumberOfLines:", v32);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
  objc_msgSend(v34, "setNumberOfLines:", 1);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
  objc_msgSend(v35, "setNumberOfLines:", 1);

  if (-[VMMessageMetadataView layoutIsAccessible](self, "layoutIsAccessible"))
    v36 = 2;
  else
    v36 = 1;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  objc_msgSend(v37, "setNumberOfLines:", v36);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMMessageMetadataView;
  -[VMMessageMetadataView tintColorDidChange](&v3, "tintColorDidChange");
  -[VMMessageMetadataView updateLabelColors](self, "updateLabelColors");
}

- (void)updateLabelColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v4, "setTextColor:", v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
  objc_msgSend(v5, "setTextColor:", v7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  objc_msgSend(v6, "setTextColor:", v7);

}

- (void)createConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  id v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _QWORD v49[6];
  _QWORD v50[6];
  _BYTE v51[128];

  -[VMMessageMetadataView setCurrentRequiredConstraints:](self, "setCurrentRequiredConstraints:", &__NSArray0__struct);
  -[VMMessageMetadataView setCurrentRequiredConstraintsKey:](self, "setCurrentRequiredConstraintsKey:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView currentActiveFixedConstraints](self, "currentActiveFixedConstraints"));
  -[VMMessageMetadataView removeConstraints:](self, "removeConstraints:", v3);

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView constraintsForLayouts](self, "constraintsForLayouts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(v5);
        -[VMMessageMetadataView removeConstraints:](self, "removeConstraints:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v7);
  }

  v10 = objc_msgSend((id)objc_opt_class(self), "constraintsKeyForAccessibleLayout:expanded:editing:", 0, 0, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v49[0] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView createConstraintsForNonAccessibleNonExpandedLayoutForEditing:](self, "createConstraintsForNonAccessibleNonExpandedLayoutForEditing:", 0));
  v50[0] = v38;
  v11 = objc_msgSend((id)objc_opt_class(self), "constraintsKeyForAccessibleLayout:expanded:editing:", 0, 0, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v49[1] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView createConstraintsForNonAccessibleNonExpandedLayoutForEditing:](self, "createConstraintsForNonAccessibleNonExpandedLayoutForEditing:", 1));
  v50[1] = v36;
  v12 = objc_msgSend((id)objc_opt_class(self), "constraintsKeyForAccessibleLayout:expanded:editing:", 0, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v49[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView createConstraintsForNonAccessibleExpandedLayout](self, "createConstraintsForNonAccessibleExpandedLayout"));
  v50[2] = v14;
  v15 = objc_msgSend((id)objc_opt_class(self), "constraintsKeyForAccessibleLayout:expanded:editing:", 1, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v49[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView createConstraintsForAccessibleNonExpandedLayoutForEditing:](self, "createConstraintsForAccessibleNonExpandedLayoutForEditing:", 0));
  v50[3] = v17;
  v18 = objc_msgSend((id)objc_opt_class(self), "constraintsKeyForAccessibleLayout:expanded:editing:", 1, 0, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v49[4] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView createConstraintsForAccessibleNonExpandedLayoutForEditing:](self, "createConstraintsForAccessibleNonExpandedLayoutForEditing:", 1));
  v50[4] = v20;
  v21 = objc_msgSend((id)objc_opt_class(self), "constraintsKeyForAccessibleLayout:expanded:editing:", 1, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v49[5] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView createConstraintsForAccessibleExpandedLayout](self, "createConstraintsForAccessibleExpandedLayout"));
  v50[5] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 6));
  -[VMMessageMetadataView setConstraintsForLayouts:](self, "setConstraintsForLayouts:", v24);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView constraintsForLayouts](self, "constraintsForLayouts"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allValues"));

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v27)
  {
    v29 = v27;
    v30 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(v26);
        v32 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
        LODWORD(v28) = 1132068864;
        -[VMMessageMetadataView setPriorityOfConstraints:to:](self, "setPriorityOfConstraints:to:", v32, v28, v36);
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);
      }
      v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v29);
  }

  if (-[VMMessageMetadataView layoutIsAccessible](self, "layoutIsAccessible"))
    v33 = objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView createFixedConstraintsForAccessibleLayout](self, "createFixedConstraintsForAccessibleLayout"));
  else
    v33 = objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView createFixedConstraintsForNonAccessibleLayout](self, "createFixedConstraintsForNonAccessibleLayout"));
  v34 = (void *)v33;
  -[VMMessageMetadataView setCurrentActiveFixedConstraints:](self, "setCurrentActiveFixedConstraints:", v33, v36);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView currentActiveFixedConstraints](self, "currentActiveFixedConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

}

- (void)removeConstraints:(id)a3
{
  id v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  char v16;
  NSObject *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];

  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v21;
    *(_QWORD *)&v5 = 138412290;
    v19 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstItem", v19));
        v11 = objc_opt_class(UIView);
        isKindOfClass = objc_opt_isKindOfClass(v10, v11);

        if ((isKindOfClass & 1) != 0)
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstItem"));
LABEL_10:
          v17 = v13;
          -[NSObject removeConstraint:](v13, "removeConstraint:", v9);
          goto LABEL_13;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "secondItem"));
        v15 = objc_opt_class(UIView);
        v16 = objc_opt_isKindOfClass(v14, v15);

        if ((v16 & 1) != 0)
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "secondItem"));
          goto LABEL_10;
        }
        v18 = PHDefaultLog();
        v17 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v19;
          v25 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to remove constraint: %@", buf, 0xCu);
        }
LABEL_13:

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

}

+ (id)constraintsKeyForAccessibleLayout:(BOOL)a3 expanded:(BOOL)a4 editing:(BOOL)a5
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d:%d:%d"), a3, a4, a5);
}

- (void)setPriorityOfConstraints:(id)a3 to:(float)a4
{
  id v5;
  id v6;
  double v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v5);
        *(float *)&v7 = a4;
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setPriority:", v7);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)createFixedConstraintsForNonAccessibleLayout
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
  id v14;
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
  _QWORD v65[12];

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "centerYAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView buttonLayoutGuide](self, "buttonLayoutGuide"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "centerYAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v65[0] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
  v65[1] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView actionButton](self, "actionButton"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "firstBaselineAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "firstBaselineAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v65[2] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView actionButton](self, "actionButton"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, -24.0));
  v65[3] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v65[4] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v65[5] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "firstBaselineAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastBaselineAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v31, 1.0));
  v65[6] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstBaselineAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstBaselineAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v65[7] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstBaselineAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstBaselineAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v65[8] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstBaselineAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v16, 1.0));
  v65[9] = v15;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v65[10] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v65[11] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 12));

  return v14;
}

- (id)createConstraintsForNonAccessibleNonExpandedLayoutForEditing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[2];
  _QWORD v37[2];

  v3 = a3;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
    v37[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    v37[1] = v13;
    v14 = v37;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, -8.0));
    v36[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -8.0));
    v36[1] = v13;
    v14 = v36;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:constant:", v29, -8.0));
  v35[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:constant:", v16, -8.0));
  v35[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  v35[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3));
  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v31));

  return v25;
}

- (id)createConstraintsForNonAccessibleExpandedLayout
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
  id v14;
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
  _QWORD v30[5];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView actionButton](self, "actionButton"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:constant:", v26, -8.0));
  v30[0] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView actionButton](self, "actionButton"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:constant:", v21, -8.0));
  v30[1] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, -8.0));
  v30[2] = v15;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, -8.0));
  v30[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v30[4] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 5));

  return v14;
}

- (id)createFixedConstraintsForAccessibleLayout
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
  id v14;
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
  _QWORD v90[17];

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "firstBaselineAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "firstBaselineAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
  v90[0] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v81));
  v90[1] = v80;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView actionButton](self, "actionButton"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "firstBaselineAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "firstBaselineAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
  v90[2] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView actionButton](self, "actionButton"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, -24.0));
  v90[3] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
  v90[4] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v90[5] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "firstBaselineAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "lastBaselineAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v56, 1.0));
  v90[6] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v90[7] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "firstBaselineAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "lastBaselineAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v46, 1.0));
  v90[8] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v90[9] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v90[10] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "firstBaselineAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDateLabel](self, "shortDateLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastBaselineAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v31, 1.0));
  v90[11] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v90[12] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v90[13] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstBaselineAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView subtitleLabel](self, "subtitleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v16, 1.0));
  v90[14] = v15;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v90[15] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v90[16] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v90, 17));

  return v14;
}

- (id)createConstraintsForAccessibleNonExpandedLayoutForEditing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v3 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:", v7));
    v19[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    v19[1] = v13;
    v14 = v19;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView infoButton](self, "infoButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:constant:", v7, -8.0));
    v18[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView shortDurationLabel](self, "shortDurationLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    v18[1] = v13;
    v14 = v18;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));

  return v15;
}

- (id)createConstraintsForAccessibleExpandedLayout
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
  void *v14;
  _QWORD v15[2];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView actionButton](self, "actionButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintLessThanOrEqualToAnchor:constant:", v5, -8.0));
  v15[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageMetadataView fullDateLabel](self, "fullDateLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));

  return v12;
}

- (VMMessageMetadataViewDelegate)delegate
{
  return (VMMessageMetadataViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIDateLabel)shortDateLabel
{
  return self->_shortDateLabel;
}

- (UILabel)shortDurationLabel
{
  return self->_shortDurationLabel;
}

- (UILabel)fullDateLabel
{
  return self->_fullDateLabel;
}

- (TPBadgeView)badgeView
{
  return self->_badgeView;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)layoutIsAccessible
{
  return self->_layoutIsAccessible;
}

- (MPVoicemailMessageViewModel)currentViewModel
{
  return self->_currentViewModel;
}

- (void)setCurrentViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewModel, a3);
}

- (UILayoutGuide)buttonLayoutGuide
{
  return self->_buttonLayoutGuide;
}

- (void)setButtonLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_buttonLayoutGuide, a3);
}

- (NSDictionary)constraintsForLayouts
{
  return self->_constraintsForLayouts;
}

- (void)setConstraintsForLayouts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)currentRequiredConstraintsKey
{
  return self->_currentRequiredConstraintsKey;
}

- (void)setCurrentRequiredConstraintsKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)currentRequiredConstraints
{
  return self->_currentRequiredConstraints;
}

- (void)setCurrentRequiredConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)currentActiveFixedConstraints
{
  return self->_currentActiveFixedConstraints;
}

- (void)setCurrentActiveFixedConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSLayoutConstraint)subtitleLeadingToLayoutMarginConstrant
{
  return self->_subtitleLeadingToLayoutMarginConstrant;
}

- (void)setSubtitleLeadingToLayoutMarginConstrant:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLeadingToLayoutMarginConstrant, a3);
}

- (NSLayoutConstraint)badgeViewTrailingToSubtitleLeadingConstrant
{
  return self->_badgeViewTrailingToSubtitleLeadingConstrant;
}

- (void)setBadgeViewTrailingToSubtitleLeadingConstrant:(id)a3
{
  objc_storeStrong((id *)&self->_badgeViewTrailingToSubtitleLeadingConstrant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeViewTrailingToSubtitleLeadingConstrant, 0);
  objc_storeStrong((id *)&self->_subtitleLeadingToLayoutMarginConstrant, 0);
  objc_storeStrong((id *)&self->_currentActiveFixedConstraints, 0);
  objc_storeStrong((id *)&self->_currentRequiredConstraints, 0);
  objc_storeStrong((id *)&self->_currentRequiredConstraintsKey, 0);
  objc_storeStrong((id *)&self->_constraintsForLayouts, 0);
  objc_storeStrong((id *)&self->_buttonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_currentViewModel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_fullDateLabel, 0);
  objc_storeStrong((id *)&self->_shortDurationLabel, 0);
  objc_storeStrong((id *)&self->_shortDateLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
