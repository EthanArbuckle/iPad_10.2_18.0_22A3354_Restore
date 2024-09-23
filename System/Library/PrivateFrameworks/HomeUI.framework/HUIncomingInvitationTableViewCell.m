@implementation HUIncomingInvitationTableViewCell

- (HUIncomingInvitationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUIncomingInvitationTableViewCell *v4;
  id v5;
  uint64_t v6;
  CNAvatarView *avatarView;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *homeNameLabel;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *infoLabel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIButton *viewButton;
  UIButtonConfiguration *v23;
  void *v24;
  void *v25;
  void *v26;
  UIButtonConfiguration *knownContactViewButtonConfiguration;
  void *v28;
  uint64_t v29;
  UIButton *reportJunkButton;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  UIButton *closeButton;
  void *v39;
  void *v40;
  void *v41;
  HUInvitationHelper *v42;
  HUInvitationHelper *invitationHelper;
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
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSArray *dynamicConstraints;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  UIButtonConfiguration *v112;
  objc_super v113;

  v113.receiver = self;
  v113.super_class = (Class)HUIncomingInvitationTableViewCell;
  v4 = -[HUIncomingInvitationTableViewCell initWithStyle:reuseIdentifier:](&v113, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C97468]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    avatarView = v4->_avatarView;
    v4->_avatarView = (CNAvatarView *)v6;

    -[CNAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v4->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell avatarView](v4, "avatarView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    v108 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addLayoutGuide:", v108);

    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    homeNameLabel = v4->_homeNameLabel;
    v4->_homeNameLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_homeNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_homeNameLabel, "setFont:", v13);

    -[UILabel setNumberOfLines:](v4->_homeNameLabel, "setNumberOfLines:", 2);
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4->_homeNameLabel);

    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    infoLabel = v4->_infoLabel;
    v4->_infoLabel = v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_infoLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_infoLabel, "setFont:", v17);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_infoLabel, "setTextColor:", v18);

    -[UILabel setNumberOfLines:](v4->_infoLabel, "setNumberOfLines:", 0);
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v4->_infoLabel);

    objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setButtonSize:", 1);
    objc_msgSend(v20, "setCornerStyle:", 4);
    objc_msgSend(v20, "contentInsets");
    objc_msgSend(v20, "setContentInsets:");
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v21 = objc_claimAutoreleasedReturnValue();
    viewButton = v4->_viewButton;
    v4->_viewButton = (UIButton *)v21;

    v111 = v20;
    v23 = (UIButtonConfiguration *)objc_msgSend(v20, "copy");
    _HULocalizedStringWithDefaultValue(CFSTR("HUUserManagementViewButton"), CFSTR("HUUserManagementViewButton"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButtonConfiguration setTitle:](v23, "setTitle:", v24);

    -[HUIncomingInvitationTableViewCell tintColor](v4, "tintColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButtonConfiguration background](v23, "background");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBackgroundColor:", v25);

    knownContactViewButtonConfiguration = v4->_knownContactViewButtonConfiguration;
    v4->_knownContactViewButtonConfiguration = v23;
    v112 = v23;

    -[UIButton setConfiguration:](v4->_viewButton, "setConfiguration:", v112);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_viewButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v4->_viewButton, "addTarget:action:forControlEvents:", v4, sel_viewButtonPressed_, 64);
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v4->_viewButton);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v29 = objc_claimAutoreleasedReturnValue();
    reportJunkButton = v4->_reportJunkButton;
    v4->_reportJunkButton = (UIButton *)v29;

    v31 = (void *)objc_msgSend(v20, "copy");
    _HULocalizedStringWithDefaultValue(CFSTR("HUUserManagementReportJunkButton"), CFSTR("HUUserManagementReportJunkButton"), 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTitle:", v32);

    -[HUIncomingInvitationTableViewCell tintColor](v4, "tintColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBaseForegroundColor:", v33);

    objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "background");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBackgroundColor:", v34);

    -[UIButton setConfiguration:](v4->_reportJunkButton, "setConfiguration:", v31);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_reportJunkButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v4->_reportJunkButton, "addTarget:action:forControlEvents:", v4, sel_reportJunkPressed_, 64);
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v4->_reportJunkButton);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v37 = objc_claimAutoreleasedReturnValue();
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v37;

    objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setButtonSize:", 2);
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 6, 13.0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v110);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setImage:", v39);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGray3Color");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setBaseForegroundColor:", v40);

    objc_msgSend(v109, "setContentInsets:", *MEMORY[0x1E0CEA080], *(double *)(MEMORY[0x1E0CEA080] + 8), *(double *)(MEMORY[0x1E0CEA080] + 16), *(double *)(MEMORY[0x1E0CEA080] + 24));
    -[UIButton setConfiguration:](v4->_closeButton, "setConfiguration:", v109);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v4->_closeButton, "addTarget:action:forControlEvents:", v4, sel_closeButtonPressed_, 64);
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addSubview:", v4->_closeButton);

    v42 = -[HUInvitationHelper initWithMode:]([HUInvitationHelper alloc], "initWithMode:", 0);
    invitationHelper = v4->_invitationHelper;
    v4->_invitationHelper = v42;

    -[HUInvitationHelper setDelegate:](v4->_invitationHelper, "setDelegate:", v4);
    -[UILabel topAnchor](v4->_homeNameLabel, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    -[UILabel leadingAnchor](v4->_homeNameLabel, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setActive:", 1);

    -[UILabel trailingAnchor](v4->_homeNameLabel, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 1);

    -[UILabel topAnchor](v4->_infoLabel, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_homeNameLabel, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

    -[UILabel leadingAnchor](v4->_infoLabel, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setActive:", 1);

    -[UILabel trailingAnchor](v4->_infoLabel, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setActive:", 1);

    -[UIButton topAnchor](v4->_viewButton, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:constant:", v63, 11.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setActive:", 1);

    -[UIButton leadingAnchor](v4->_viewButton, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setActive:", 1);

    -[UIButton heightAnchor](v4->_viewButton, "heightAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintGreaterThanOrEqualToConstant:", 29.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setActive:", 1);

    -[UIButton heightAnchor](v4->_reportJunkButton, "heightAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintGreaterThanOrEqualToConstant:", 29.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setActive:", 1);

    -[CNAvatarView heightAnchor](v4->_avatarView, "heightAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToConstant:", 44.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setActive:", 1);

    -[CNAvatarView widthAnchor](v4->_avatarView, "widthAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView heightAnchor](v4->_avatarView, "heightAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setActive:", 1);

    -[CNAvatarView topAnchor](v4->_avatarView, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "topAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, 14.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setActive:", 1);

    -[CNAvatarView leadingAnchor](v4->_avatarView, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:constant:", v83, 16.0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setActive:", 1);

    -[UIButton topAnchor](v4->_closeButton, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v87, 14.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setActive:", 1);

    -[UIButton leadingAnchor](v4->_closeButton, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "trailingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintGreaterThanOrEqualToAnchor:constant:", v90, 14.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setActive:", 1);

    -[UIButton trailingAnchor](v4->_closeButton, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:constant:", v94, -14.0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setActive:", 1);

    objc_msgSend(v108, "topAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell contentView](v4, "contentView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "topAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintGreaterThanOrEqualToAnchor:constant:", v98, 11.0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setActive:", 1);

    objc_msgSend(v108, "bottomAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_infoLabel, "bottomAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setActive:", 1);

    objc_msgSend(v108, "leadingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView trailingAnchor](v4->_avatarView, "trailingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:constant:", v104, 12.0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setActive:", 1);

    dynamicConstraints = v4->_dynamicConstraints;
    v4->_dynamicConstraints = (NSArray *)MEMORY[0x1E0C9AA60];

    -[HUIncomingInvitationTableViewCell _setupDynamicConstraints](v4, "_setupDynamicConstraints");
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[HUIncomingInvitationTableViewCell setInvitation:](self, "setInvitation:", 0);
  -[HUIncomingInvitationTableViewCell setShowSpinner:](self, "setShowSpinner:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUIncomingInvitationTableViewCell;
  -[HUIncomingInvitationTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)viewButtonPressed:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "User pressed button (%@)", (uint8_t *)&v8, 0xCu);

  }
  -[HUIncomingInvitationTableViewCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invitationCell:didRespondToInvitationWithResponse:", self, 1);

}

- (void)declineButtonPressed:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "User pressed button (%@)", (uint8_t *)&v8, 0xCu);

  }
  -[HUIncomingInvitationTableViewCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invitationCell:didRespondToInvitationWithResponse:", self, 2);

}

- (void)reportJunkPressed:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "User pressed button (%@)", (uint8_t *)&v8, 0xCu);

  }
  -[HUIncomingInvitationTableViewCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invitationCell:didRespondToInvitationWithResponse:", self, 4);

}

- (void)closeButtonPressed:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HUIncomingInvitationTableViewCell *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "User pressed button (%@)", (uint8_t *)&v18, 0xCu);

  }
  -[HUIncomingInvitationTableViewCell invitationHelper](self, "invitationHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUnknownContact");

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      -[HUIncomingInvitationTableViewCell invitation](self, "invitation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_prettyDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v12;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring %@", (uint8_t *)&v18, 0xCu);

    }
    -[HUIncomingInvitationTableViewCell delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = self;
    v16 = 3;
  }
  else
  {
    if (v10)
    {
      -[HUIncomingInvitationTableViewCell invitation](self, "invitation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v17;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Declining %@", (uint8_t *)&v18, 0xCu);

    }
    -[HUIncomingInvitationTableViewCell delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = self;
    v16 = 2;
  }
  objc_msgSend(v13, "invitationCell:didRespondToInvitationWithResponse:", v15, v16);

}

- (void)setInvitation:(id)a3
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUIncomingInvitationTableViewCell invitation](self, "invitation");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_storeStrong((id *)&self->_invitation, a3);
    -[HUIncomingInvitationTableViewCell invitationHelper](self, "invitationHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInvitation:", v5);

    if (v5)
    {
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Setting invitation %@", (uint8_t *)&v12, 0xCu);

      }
      -[HUIncomingInvitationTableViewCell _updateInvitationViews](self, "_updateInvitationViews");
    }
    else
    {
      -[HUIncomingInvitationTableViewCell setContact:](self, "setContact:", 0);
      -[HUIncomingInvitationTableViewCell homeNameLabel](self, "homeNameLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", 0);

      -[HUIncomingInvitationTableViewCell infoLabel](self, "infoLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", 0);

    }
    -[HUIncomingInvitationTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateInvitationViews
{
  void *v3;
  int v4;
  id v5;
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
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[HUIncomingInvitationTableViewCell invitationHelper](self, "invitationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUnknownContact");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97360]);
    v28[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell avatarView](self, "avatarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContacts:", v6);

    -[HUIncomingInvitationTableViewCell reportJunkButton](self, "reportJunkButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    _HULocalizedStringWithDefaultValue(CFSTR("HUUserManagementViewButton"), CFSTR("HUUserManagementViewButton"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v11);

    -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConfiguration:", v10);

    -[HUIncomingInvitationTableViewCell reportJunkButton](self, "reportJunkButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

  }
  else
  {
    -[HUIncomingInvitationTableViewCell invitationHelper](self, "invitationHelper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inviterContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell avatarView](self, "avatarView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContacts:", v16);

    -[HUIncomingInvitationTableViewCell knownContactViewButtonConfiguration](self, "knownContactViewButtonConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setConfiguration:", v19);

    -[HUIncomingInvitationTableViewCell reportJunkButton](self, "reportJunkButton");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);
  }

  -[HUIncomingInvitationTableViewCell invitationHelper](self, "invitationHelper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "detailText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUIncomingInvitationTableViewCell invitationHelper](self, "invitationHelper");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "homeInvitationTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUIncomingInvitationTableViewCell homeNameLabel](self, "homeNameLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v24);

  -[HUIncomingInvitationTableViewCell infoLabel](self, "infoLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setText:", v22);

}

- (void)_setupDynamicConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
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
  _QWORD *v19;
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
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUIncomingInvitationTableViewCell dynamicConstraints](self, "dynamicConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[HUIncomingInvitationTableViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  -[HUIncomingInvitationTableViewCell reportJunkButton](self, "reportJunkButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v8;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", 17.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v27;
    -[HUIncomingInvitationTableViewCell reportJunkButton](self, "reportJunkButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v13;
    -[HUIncomingInvitationTableViewCell reportJunkButton](self, "reportJunkButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -14.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v18;
    v19 = v33;
  }
  else
  {
    objc_msgSend(v8, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = v20;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", 17.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v27;
    -[HUIncomingInvitationTableViewCell reportJunkButton](self, "reportJunkButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    objc_msgSend(v21, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v13;
    -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIncomingInvitationTableViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -14.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v18;
    v19 = v32;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIncomingInvitationTableViewCell setDynamicConstraints:](self, "setDynamicConstraints:", v22);

  v23 = (void *)MEMORY[0x1E0CB3718];
  -[HUIncomingInvitationTableViewCell dynamicConstraints](self, "dynamicConstraints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v24);

}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    if (a3)
      -[HUIncomingInvitationTableViewCell _showInvitationSpinner](self, "_showInvitationSpinner");
    else
      -[HUIncomingInvitationTableViewCell _hideInvitationSpinner](self, "_hideInvitationSpinner");
  }
}

- (void)_showInvitationSpinner
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
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  -[HUIncomingInvitationTableViewCell spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUIncomingInvitationTableViewCell spinner](self, "spinner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[HUIncomingInvitationTableViewCell setSpinner:](self, "setSpinner:", 0);
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  -[HUIncomingInvitationTableViewCell setSpinner:](self, "setSpinner:", v5);

  -[HUIncomingInvitationTableViewCell spinner](self, "spinner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUIncomingInvitationTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIncomingInvitationTableViewCell spinner](self, "spinner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[HUIncomingInvitationTableViewCell spinner](self, "spinner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAnimating");

  v26 = (void *)MEMORY[0x1E0CB3718];
  -[HUIncomingInvitationTableViewCell spinner](self, "spinner");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIncomingInvitationTableViewCell reportJunkButton](self, "reportJunkButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  -[HUIncomingInvitationTableViewCell spinner](self, "spinner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIncomingInvitationTableViewCell reportJunkButton](self, "reportJunkButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v18);

  -[HUIncomingInvitationTableViewCell reportJunkButton](self, "reportJunkButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", 1);

  -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUUserManagementCancelButton"), CFSTR("HUUserManagementCancelButton"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:", v22);

  -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setConfiguration:", v21);

  -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeTarget:action:forControlEvents:", 0, 0, 64);

  -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel_declineButtonPressed_, 64);

}

- (void)_hideInvitationSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HUIncomingInvitationTableViewCell spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUIncomingInvitationTableViewCell spinner](self, "spinner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[HUIncomingInvitationTableViewCell setSpinner:](self, "setSpinner:", 0);
  }
  -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUUserManagementViewButton"), CFSTR("HUUserManagementViewButton"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v7);

  -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration:", v11);

  -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeTarget:action:forControlEvents:", 0, 0, 64);

  -[HUIncomingInvitationTableViewCell viewButton](self, "viewButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_viewButtonPressed_, 64);

}

- (HMIncomingHomeInvitation)invitation
{
  return self->_invitation;
}

- (HUInvitationHelper)invitationHelper
{
  return self->_invitationHelper;
}

- (void)setInvitationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_invitationHelper, a3);
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (HUIncomingInvitationTableViewCellDelegate)delegate
{
  return (HUIncomingInvitationTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UILabel)homeNameLabel
{
  return self->_homeNameLabel;
}

- (void)setHomeNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_homeNameLabel, a3);
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UIButton)viewButton
{
  return self->_viewButton;
}

- (void)setViewButton:(id)a3
{
  objc_storeStrong((id *)&self->_viewButton, a3);
}

- (UIButtonConfiguration)knownContactViewButtonConfiguration
{
  return self->_knownContactViewButtonConfiguration;
}

- (void)setKnownContactViewButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_knownContactViewButtonConfiguration, a3);
}

- (UIButton)reportJunkButton
{
  return self->_reportJunkButton;
}

- (void)setReportJunkButton:(id)a3
{
  objc_storeStrong((id *)&self->_reportJunkButton, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicConstraints, a3);
}

- (HFContactController)contactsController
{
  return self->_contactsController;
}

- (void)setContactsController:(id)a3
{
  objc_storeStrong((id *)&self->_contactsController, a3);
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
  objc_storeStrong((id *)&self->_familyMembers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_contactsController, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_reportJunkButton, 0);
  objc_storeStrong((id *)&self->_knownContactViewButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_viewButton, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_homeNameLabel, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invitationHelper, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end
