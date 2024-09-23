@implementation EKUIInviteesViewInviteesCell

- (EKUIInviteesViewInviteesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIInviteesViewInviteesCell *v4;
  EKUIInviteesViewInviteesCell *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  EKUILabeledAvatarView *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)EKUIInviteesViewInviteesCell;
  v4 = -[EKUIInviteesViewInviteesCell initWithStyle:reuseIdentifier:](&v40, sel_initWithStyle_reuseIdentifier_, 3, a4);
  v5 = v4;
  if (v4)
  {
    -[EKUIInviteesViewInviteesCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[EKUIInviteesViewInviteesCell _statusImageViewSymbolConfiguration](v5, "_statusImageViewSymbolConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreferredSymbolConfiguration:", v8);

    LODWORD(v9) = 1148846080;
    objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v9);
    LODWORD(v10) = 1148846080;
    objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 1, v10);
    LODWORD(v11) = 1148846080;
    objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v11);
    LODWORD(v12) = 1148846080;
    objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    -[EKUIInviteesViewInviteesCell setStatusImageView:](v5, "setStatusImageView:", v7);
    -[EKUIInviteesViewInviteesCell setAccessoryView:](v5, "setAccessoryView:", v7);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    LODWORD(v14) = 1148846080;
    objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 0, v14);
    LODWORD(v15) = 1148846080;
    objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 1, v15);
    LODWORD(v16) = 1148846080;
    objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 0, v16);
    LODWORD(v17) = 1148846080;
    objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    objc_msgSend(v13, "setAlpha:", 0.0);
    -[EKUIInviteesViewInviteesCell setSpinner:](v5, "setSpinner:", v13);
    v18 = -[EKUILabeledAvatarView initWithPlacement:options:]([EKUILabeledAvatarView alloc], "initWithPlacement:options:", 0, 0);
    -[EKUILabeledAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUILabeledAvatarView setLoadContactsAsynchronously:](v18, "setLoadContactsAsynchronously:", 1);
    v39 = v6;
    objc_msgSend(v6, "addSubview:", v18);
    -[EKUIInviteesViewInviteesCell setContactAvatarView:](v5, "setContactAvatarView:", v18);
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v19);
    -[EKUIInviteesViewInviteesCell setTextContainerView:](v5, "setTextContainerView:", v19);
    v20 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)objc_opt_class(), "_nameLabelFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v21);

    -[EKUIInviteesViewInviteesCell textLabel](v5, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v23);

    LODWORD(v24) = 1148846080;
    objc_msgSend(v20, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    objc_msgSend(v20, "setNumberOfLines:", 0);
    -[EKUIInviteesViewInviteesCell textContainerView](v5, "textContainerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v20);

    -[EKUIInviteesViewInviteesCell setNameLabel:](v5, "setNameLabel:", v20);
    v26 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)objc_opt_class(), "_commentLabelFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v27);

    -[EKUIInviteesViewInviteesCell detailTextLabel](v5, "detailTextLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "textColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v29);

    objc_msgSend(v26, "setNumberOfLines:", 0);
    LODWORD(v30) = 1148846080;
    objc_msgSend(v26, "setContentCompressionResistancePriority:forAxis:", 1, v30);
    objc_msgSend(v26, "setLineBreakMode:", 0);
    -[EKUIInviteesViewInviteesCell textContainerView](v5, "textContainerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v26);

    -[EKUIInviteesViewInviteesCell setCommentLabel:](v5, "setCommentLabel:", v26);
    v32 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)objc_opt_class(), "_commentLabelFont");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFont:", v33);

    -[EKUIInviteesViewInviteesCell detailTextLabel](v5, "detailTextLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "textColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextColor:", v35);

    objc_msgSend(v32, "setNumberOfLines:", 1);
    LODWORD(v36) = 1148846080;
    objc_msgSend(v32, "setContentCompressionResistancePriority:forAxis:", 1, v36);
    objc_msgSend(v32, "setLineBreakMode:", 0);
    -[EKUIInviteesViewInviteesCell textContainerView](v5, "textContainerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v32);

    -[EKUIInviteesViewInviteesCell setOptionalInviteeLabel:](v5, "setOptionalInviteeLabel:", v32);
    -[EKUIInviteesViewInviteesCell setNeedsUpdateConstraints](v5, "setNeedsUpdateConstraints");

  }
  return v5;
}

- (void)updateConstraints
{
  void *v3;
  id v4;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _BOOL4 v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  _BOOL4 v89;
  void *v90;
  double v91;
  double v92;
  double v93;
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
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  objc_super v116;

  -[EKUIInviteesViewInviteesCell persistentConstraints](self, "persistentConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[EKUIInviteesViewInviteesCell contactAvatarView](self, "contactAvatarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutMarginsGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    -[EKUIInviteesViewInviteesCell contactAvatarView](self, "contactAvatarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

    -[EKUIInviteesViewInviteesCell contactAvatarView](self, "contactAvatarView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 37.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v18);

    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell contactAvatarView](self, "contactAvatarView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 12.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);

    -[EKUIInviteesViewInviteesCell nameLabel](self, "nameLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v39);

    -[EKUIInviteesViewInviteesCell nameLabel](self, "nameLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v44);

    -[EKUIInviteesViewInviteesCell nameLabel](self, "nameLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v49);

    -[EKUIInviteesViewInviteesCell commentLabel](self, "commentLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v54);

    -[EKUIInviteesViewInviteesCell commentLabel](self, "commentLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v59);

    -[EKUIInviteesViewInviteesCell optionalInviteeLabel](self, "optionalInviteeLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v64);

    -[EKUIInviteesViewInviteesCell optionalInviteeLabel](self, "optionalInviteeLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v69);

    -[EKUIInviteesViewInviteesCell contentView](self, "contentView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "heightAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintGreaterThanOrEqualToConstant:", 60.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v72);

    -[EKUIInviteesViewInviteesCell contentView](self, "contentView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "heightAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "heightAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintGreaterThanOrEqualToAnchor:constant:", v76, 12.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v77);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
    -[EKUIInviteesViewInviteesCell setPersistentConstraints:](self, "setPersistentConstraints:", v4);

  }
  -[EKUIInviteesViewInviteesCell removableConstraints](self, "removableConstraints");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v78)
  {
    v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[EKUIInviteesViewInviteesCell commentLabel](self, "commentLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "text");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {
      -[EKUIInviteesViewInviteesCell commentLabel](self, "commentLabel");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "text");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "length") != 0;

    }
    else
    {
      v84 = 0;
    }

    -[EKUIInviteesViewInviteesCell optionalInviteeLabel](self, "optionalInviteeLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "text");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      -[EKUIInviteesViewInviteesCell optionalInviteeLabel](self, "optionalInviteeLabel");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "text");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v88, "length") != 0;

    }
    else
    {
      v89 = 0;
    }

    objc_msgSend((id)objc_opt_class(), "_commentLabelFont");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "_scaledValueForValue:", 20.0);
    CalRoundToScreenScale(v91);
    v93 = v92;

    if (v84 && v89)
    {
      -[EKUIInviteesViewInviteesCell commentLabel](self, "commentLabel");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "firstBaselineAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIInviteesViewInviteesCell nameLabel](self, "nameLabel");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "lastBaselineAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "constraintEqualToAnchor:constant:", v97, v93);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "addObject:", v98);

      -[EKUIInviteesViewInviteesCell optionalInviteeLabel](self, "optionalInviteeLabel");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "firstBaselineAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIInviteesViewInviteesCell commentLabel](self, "commentLabel");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v89)
      {
        if (v84)
        {
          -[EKUIInviteesViewInviteesCell commentLabel](self, "commentLabel");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "firstBaselineAnchor");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKUIInviteesViewInviteesCell nameLabel](self, "nameLabel");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "lastBaselineAnchor");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "constraintEqualToAnchor:constant:", v114, v93);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "addObject:", v115);

          -[EKUIInviteesViewInviteesCell commentLabel](self, "commentLabel");
        }
        else
        {
          -[EKUIInviteesViewInviteesCell nameLabel](self, "nameLabel");
        }
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      -[EKUIInviteesViewInviteesCell optionalInviteeLabel](self, "optionalInviteeLabel");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "firstBaselineAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIInviteesViewInviteesCell nameLabel](self, "nameLabel");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v102 = v101;
    objc_msgSend(v101, "lastBaselineAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:constant:", v103, v93);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v104);

    -[EKUIInviteesViewInviteesCell optionalInviteeLabel](self, "optionalInviteeLabel");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v106 = v105;
    objc_msgSend(v105, "bottomAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell textContainerView](self, "textContainerView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "bottomAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:", v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v110);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v79);
    -[EKUIInviteesViewInviteesCell setRemovableConstraints:](self, "setRemovableConstraints:", v79);

  }
  v116.receiver = self;
  v116.super_class = (Class)EKUIInviteesViewInviteesCell;
  -[EKUIInviteesViewInviteesCell updateConstraints](&v116, sel_updateConstraints);
}

- (void)updateWithParticipantForSorting:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  EKUIInviteesViewInviteesCell *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, "Updating cell with participant for sorting: [%@]. Cell: [%@]", (uint8_t *)&v14, 0x16u);
  }
  -[EKUIInviteesViewInviteesCell setShowSpinner:](self, "setShowSpinner:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v6, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v7, "fontWithDescriptor:size:", v8, v9 + 2.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "participant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "participantStatus");
  attributedStatusGlyph();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CalImageFromGlyph(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewInviteesCell updateCommonElements:statusImage:conflict:](self, "updateCommonElements:statusImage:conflict:", v4, v13, 0);

}

- (void)updateWithParticipantForSorting:(id)a3 availabilityType:(int64_t)a4 showSpinner:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  EKUIInviteesViewInviteesCell *v23;
  uint64_t v24;

  v6 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v11 = v10;
    EKAvailabilitySpanTypeAsString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CalBooleanAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v9;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Updating cell with participant for sorting: [%@] availability type: [%@] showSpinner: [%@].  Cell: [%@]", (uint8_t *)&v16, 0x2Au);

  }
  -[EKUIInviteesViewInviteesCell setHideStatus:](self, "setHideStatus:", 0);
  -[EKUIInviteesViewInviteesCell setShowSpinner:](self, "setShowSpinner:", v6);
  v14 = objc_msgSend(MEMORY[0x1E0CA9FE8], "showTypeAsBusy:", a4);
  ImageForAvailabilityType(a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewInviteesCell updateCommonElements:statusImage:conflict:](self, "updateCommonElements:statusImage:conflict:", v9, v15, v14);

}

- (void)updateCommonElements:(id)a3 statusImage:(id)a4 conflict:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  _BOOL8 v17;
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
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  int v48;
  int v49;
  int v50;
  void *v51;
  void *v52;
  id v53;

  v5 = a5;
  v53 = a4;
  v8 = a3;
  objc_msgSend(v8, "participant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKUIInviteesViewInviteesCell showSpinner](self, "showSpinner"))
  {
    -[EKUIInviteesViewInviteesCell spinner](self, "spinner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell setAccessoryView:](self, "setAccessoryView:", v10);

    -[EKUIInviteesViewInviteesCell spinner](self, "spinner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAnimating");

    if ((v12 & 1) != 0)
      goto LABEL_7;
    -[EKUIInviteesViewInviteesCell spinner](self, "spinner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startAnimating");
  }
  else
  {
    -[EKUIInviteesViewInviteesCell statusImageView](self, "statusImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell setAccessoryView:](self, "setAccessoryView:", v14);

    -[EKUIInviteesViewInviteesCell spinner](self, "spinner");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isAnimating");

    if (!v16)
      goto LABEL_7;
    -[EKUIInviteesViewInviteesCell spinner](self, "spinner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopAnimating");
  }

LABEL_7:
  v17 = -[EKUIInviteesViewInviteesCell hideStatus](self, "hideStatus");
  -[EKUIInviteesViewInviteesCell statusImageView](self, "statusImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", v17);

  if (!-[EKUIInviteesViewInviteesCell hideStatus](self, "hideStatus"))
  {
    -[EKUIInviteesViewInviteesCell statusImageView](self, "statusImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImage:", v53);

    -[EKUIInviteesViewInviteesCell _statusImageViewSymbolConfiguration](self, "_statusImageViewSymbolConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell statusImageView](self, "statusImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPreferredSymbolConfiguration:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell statusImageView](self, "statusImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTintColor:", v22);

    -[EKUIInviteesViewInviteesCell statusImageView](self, "statusImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sizeToFit");

  }
  -[EKUIInviteesViewInviteesCell contactAvatarView](self, "contactAvatarView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updateWithParticipant:", v9);

  objc_msgSend(v8, "displayName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewInviteesCell nameLabel](self, "nameLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setText:", v26);

  -[EKUIInviteesViewInviteesCell commentLabel](self, "commentLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "text");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "commentLabelString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewInviteesCell commentLabel](self, "commentLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v30);

  -[EKUIInviteesViewInviteesCell optionalInviteeLabel](self, "optionalInviteeLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "text");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "participantRole") == 2)
  {
    EventKitUIBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Optional"), &stru_1E601DFA8, 0);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      EventKitUIBundle();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Conflict"), &stru_1E601DFA8, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("StatusConflictFormat"), CFSTR("%@, %@"), 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringWithFormat:", v40, v35, v37);
      v41 = objc_claimAutoreleasedReturnValue();

      v35 = (__CFString *)v41;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v42 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v5)
  {
    EventKitUIBundle();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Conflict"), &stru_1E601DFA8, 0);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v42 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v44 = (void *)v42;
    -[EKUIInviteesViewInviteesCell optionalInviteeLabel](self, "optionalInviteeLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setTextColor:", v44);

    goto LABEL_17;
  }
  v35 = &stru_1E601DFA8;
LABEL_17:
  -[EKUIInviteesViewInviteesCell optionalInviteeLabel](self, "optionalInviteeLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setText:", v35);

  if (v29)
  {
    v47 = objc_msgSend(v29, "length") == 0;
    if (v30)
      goto LABEL_19;
  }
  else
  {
    v47 = 1;
    if (v30)
    {
LABEL_19:
      v48 = objc_msgSend(v30, "length") == 0;
      if (v33)
        goto LABEL_20;
LABEL_24:
      v49 = 1;
      if (v35)
        goto LABEL_21;
LABEL_25:
      v50 = 1;
      goto LABEL_26;
    }
  }
  v48 = 1;
  if (!v33)
    goto LABEL_24;
LABEL_20:
  v49 = objc_msgSend(v33, "length") == 0;
  if (!v35)
    goto LABEL_25;
LABEL_21:
  v50 = -[__CFString length](v35, "length") == 0;
LABEL_26:
  if (v47 != v48 || v49 != v50)
  {
    v51 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewInviteesCell removableConstraints](self, "removableConstraints");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "deactivateConstraints:", v52);

    -[EKUIInviteesViewInviteesCell setRemovableConstraints:](self, "setRemovableConstraints:", 0);
    -[EKUIInviteesViewInviteesCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (id)_statusImageViewSymbolConfiguration
{
  void *v2;
  int64_t v3;

  -[EKUIInviteesViewInviteesCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[EKUIConstrainedFontUtilities tableViewCellCappedSymbolImageScaleWithScale:traitCollection:](EKUIConstrainedFontUtilities, "tableViewCellCappedSymbolImageScaleWithScale:traitCollection:", -1, v2);

  return (id)objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], v3);
}

+ (id)_nameLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)_commentLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

- (BOOL)hideStatus
{
  return self->_hideStatus;
}

- (void)setHideStatus:(BOOL)a3
{
  self->_hideStatus = a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)commentLabel
{
  return self->_commentLabel;
}

- (void)setCommentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_commentLabel, a3);
}

- (UILabel)optionalInviteeLabel
{
  return self->_optionalInviteeLabel;
}

- (void)setOptionalInviteeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_optionalInviteeLabel, a3);
}

- (UIImageView)statusImageView
{
  return self->_statusImageView;
}

- (void)setStatusImageView:(id)a3
{
  objc_storeStrong((id *)&self->_statusImageView, a3);
}

- (EKUILabeledAvatarView)contactAvatarView
{
  return self->_contactAvatarView;
}

- (void)setContactAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_contactAvatarView, a3);
}

- (UIView)textContainerView
{
  return self->_textContainerView;
}

- (void)setTextContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_textContainerView, a3);
}

- (NSArray)persistentConstraints
{
  return self->_persistentConstraints;
}

- (void)setPersistentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_persistentConstraints, a3);
}

- (NSArray)removableConstraints
{
  return self->_removableConstraints;
}

- (void)setRemovableConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_removableConstraints, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_removableConstraints, 0);
  objc_storeStrong((id *)&self->_persistentConstraints, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_contactAvatarView, 0);
  objc_storeStrong((id *)&self->_statusImageView, 0);
  objc_storeStrong((id *)&self->_optionalInviteeLabel, 0);
  objc_storeStrong((id *)&self->_commentLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
