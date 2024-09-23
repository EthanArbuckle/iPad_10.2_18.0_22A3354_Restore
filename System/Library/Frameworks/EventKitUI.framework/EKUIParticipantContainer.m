@implementation EKUIParticipantContainer

- (EKUIParticipantContainer)initWithParticipant:(id)a3 viewController:(id)a4
{
  id v7;
  id v8;
  EKUIParticipantContainer *v9;
  EKUIParticipantContainer *v10;
  void *v11;
  EKUILabeledAvatarView *v12;
  EKUILabeledAvatarView *avatar;
  uint64_t v14;
  UILabel *nameLabel;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableArray *labelConstraints;
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
  void *v35;
  objc_super v36;
  const __CFString *v37;
  EKUILabeledAvatarView *v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)EKUIParticipantContainer;
  v9 = -[EKUIParticipantContainer initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_participant, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIParticipantContainer setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = -[EKUILabeledAvatarView initWithIdentity:placement:options:]([EKUILabeledAvatarView alloc], "initWithIdentity:placement:options:", v7, 0, 2);
    avatar = v10->_avatar;
    v10->_avatar = v12;

    -[EKUILabeledAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v10->_avatar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIParticipantContainer addSubview:](v10, "addSubview:", v10->_avatar);
    v14 = objc_opt_new();
    nameLabel = v10->_nameLabel;
    v10->_nameLabel = (UILabel *)v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_nameLabel, "setFont:", v16);

    objc_msgSend(MEMORY[0x1E0CAA0E8], "participantForSortingWithEKParticipant:", v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10->_nameLabel, "setText:", v17);

    -[EKUIParticipantContainer addSubview:](v10, "addSubview:", v10->_nameLabel);
    v18 = objc_opt_new();
    labelConstraints = v10->_labelConstraints;
    v10->_labelConstraints = (NSMutableArray *)v18;

    -[EKUIParticipantContainer updateSublabelWithState:](v10, "updateSublabelWithState:", 0);
    -[EKUILabeledAvatarView leadingAnchor](v10->_avatar, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIParticipantContainer safeAreaLayoutGuide](v10, "safeAreaLayoutGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setConstant:", 20.0);
    objc_msgSend(v23, "setActive:", 1);
    v24 = (void *)MEMORY[0x1E0CB3718];
    v39 = CFSTR("avatar");
    v40[0] = v10->_avatar;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[avatar(==30)]"), 1024, 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v26);

    v27 = (void *)MEMORY[0x1E0CB3718];
    v37 = CFSTR("avatar");
    v38 = v10->_avatar;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[avatar(==30)]"), 0, 0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v29);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10->_avatar, 10, 0, v10, 10, 1.0, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v10, sel_updateContentForSizeCategoryChange_, *MEMORY[0x1E0DC48E8], 0);
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v10, sel_singleTap_);
    objc_msgSend(v32, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v32, "setCancelsTouchesInView:", 0);
    -[EKUIParticipantContainer addGestureRecognizer:](v10, "addGestureRecognizer:", v32);
    objc_msgSend(v8, "navigationController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIParticipantContainer setNavController:](v10, "setNavController:", v33);

  }
  return v10;
}

- (void)singleTap:(id)a3
{
  EKIdentityViewController *v4;
  void *v5;
  void *v6;
  EKIdentityViewController *v7;

  v4 = [EKIdentityViewController alloc];
  -[EKUIParticipantContainer participant](self, "participant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKIdentityViewController initWithIdentity:](v4, "initWithIdentity:", v5);

  -[EKUIParticipantContainer navController](self, "navController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v7, 1);

}

- (void)updateSublabelWithState:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
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
  uint64_t v74;
  uint64_t v75;
  void *v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  _QWORD v94[3];

  v94[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIParticipantContainer participant](self, "participant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLocationRoom");

  if (v7)
  {
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Room");
LABEL_7:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E601DFA8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[EKUIParticipantContainer participant](self, "participant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "participantRole");

  if (v12 == 2)
  {
    EventKitUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Optional"), &stru_1E601DFA8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v9 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  -[EKUIParticipantContainer participant](self, "participant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Organizer");
    goto LABEL_7;
  }
  v14 = 0;
LABEL_9:
  EventKitUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Conflict"), &stru_1E601DFA8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (a3 == 2)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("StatusConflictFormat"), CFSTR("%@, %@"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v21, v14, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v22, "rangeOfString:", v18);
      v74 = v24;
      v75 = v23;
      v25 = objc_alloc(MEMORY[0x1E0CB3778]);
      v26 = v18;
      v27 = v5;
      v93 = *MEMORY[0x1E0DC1140];
      v28 = v93;
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v25, "initWithString:attributes:", v22, v30);

      v91 = v28;
      v5 = v27;
      v18 = v26;
      v32 = (uint64_t)v31;
      v92 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAttributes:range:", v33, v75, v74);

LABEL_19:
      goto LABEL_20;
    }
    v35 = objc_alloc(MEMORY[0x1E0CB3778]);
    v89 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v35, "initWithString:attributes:", v14, v36);
LABEL_18:

    goto LABEL_19;
  }
  if (a3 == 1)
  {
    v37 = objc_alloc(MEMORY[0x1E0CB3778]);
    EventKitUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Available"), &stru_1E601DFA8, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v37, "initWithString:attributes:", v36, v39);

    v32 = v40;
    goto LABEL_18;
  }
  if (a3 == 2)
  {
    v34 = objc_alloc(MEMORY[0x1E0CB3778]);
    v87 = *MEMORY[0x1E0DC1140];
    v88 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v34, "initWithString:attributes:", v18, v22);
    goto LABEL_19;
  }
  v32 = 0;
LABEL_20:
  v41 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIParticipantContainer labelConstraints](self, "labelConstraints");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "deactivateConstraints:", v42);

  -[EKUIParticipantContainer labelConstraints](self, "labelConstraints");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "removeAllObjects");

  -[EKUIParticipantContainer subLabel](self, "subLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  v76 = (void *)v32;
  if (v32)
  {

    if (!v45)
    {
      v46 = (void *)objc_opt_new();
      -[EKUIParticipantContainer setSubLabel:](self, "setSubLabel:", v46);

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIParticipantContainer subLabel](self, "subLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setFont:", v47);

      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIParticipantContainer subLabel](self, "subLabel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setTextColor:", v49);

      -[EKUIParticipantContainer subLabel](self, "subLabel");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[EKUIParticipantContainer subLabel](self, "subLabel");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIParticipantContainer addSubview:](self, "addSubview:", v52);

    }
    -[EKUIParticipantContainer subLabel](self, "subLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setAttributedText:", v32);

    -[EKUIParticipantContainer subLabel](self, "subLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setHidden:", 0);

    v55 = (void *)MEMORY[0x1E0CB3718];
    v83[0] = CFSTR("avatar");
    -[EKUIParticipantContainer avatar](self, "avatar");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = CFSTR("title");
    v84[0] = v56;
    -[EKUIParticipantContainer nameLabel](self, "nameLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v57;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[avatar]-[title]-|"), 0, 0, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v59);

    v60 = (void *)MEMORY[0x1E0CB3718];
    v81[0] = CFSTR("avatar");
    -[EKUIParticipantContainer avatar](self, "avatar");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = CFSTR("subtitle");
    v82[0] = v61;
    -[EKUIParticipantContainer subLabel](self, "subLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v62;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[avatar]-[subtitle]-|"), 0, 0, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "activateConstraints:", v64);

    v65 = (void *)MEMORY[0x1E0CB3718];
    v79[0] = CFSTR("title");
    -[EKUIParticipantContainer nameLabel](self, "nameLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = CFSTR("subtitle");
    v80[0] = v66;
    -[EKUIParticipantContainer subLabel](self, "subLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v67;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(3)-[title][subtitle]-(3)-|"), 0, 0, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "activateConstraints:", v69);
  }
  else
  {
    objc_msgSend(v44, "setHidden:", 1);

    -[EKUIParticipantContainer labelConstraints](self, "labelConstraints");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)MEMORY[0x1E0CB3718];
    v77[0] = CFSTR("avatar");
    -[EKUIParticipantContainer avatar](self, "avatar");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = CFSTR("title");
    v78[0] = v67;
    -[EKUIParticipantContainer nameLabel](self, "nameLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v68;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[avatar]-[title]-|"), 1024, 0, v69);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObjectsFromArray:", v71);

  }
  v72 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIParticipantContainer labelConstraints](self, "labelConstraints");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "activateConstraints:", v73);

}

- (void)updateContentForSizeCategoryChange:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_nameLabel, "setFont:", v4);

  -[UILabel invalidateIntrinsicContentSize](self->_nameLabel, "invalidateIntrinsicContentSize");
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subLabel, "setFont:", v5);

  -[UILabel invalidateIntrinsicContentSize](self->_subLabel, "invalidateIntrinsicContentSize");
  -[EKUIParticipantContainer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBusy:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[EKUIParticipantContainer updateSublabelWithState:](self, "updateSublabelWithState:", v3);
}

- (EKParticipant)participant
{
  return (EKParticipant *)objc_getProperty(self, a2, 416, 1);
}

- (void)setParticipant:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (EKUILabeledAvatarView)avatar
{
  return (EKUILabeledAvatarView *)objc_getProperty(self, a2, 424, 1);
}

- (void)setAvatar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (UILabel)nameLabel
{
  return (UILabel *)objc_getProperty(self, a2, 432, 1);
}

- (void)setNameLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (UILabel)subLabel
{
  return (UILabel *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSubLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSMutableArray)labelConstraints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 448, 1);
}

- (void)setLabelConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (UINavigationController)navController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navController);
}

- (void)setNavController:(id)a3
{
  objc_storeWeak((id *)&self->_navController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navController);
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

@end
