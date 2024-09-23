@implementation CKDetailsContactsLargeTextTableViewCell

+ (double)preferredHeight
{
  return *MEMORY[0x1E0CEBC10];
}

+ (double)estimatedHeight
{
  return *MEMORY[0x1E0CEBC10];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView", a3.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMarginsGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutFrame");
  v8 = v7;

  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v8, height);
  v11 = v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "detailsContactCellButtonHeight");
  v14 = v11 + v13 + 20.0;

  if (-[CKDetailsContactsTableViewCell showsTUConversationStatus](self, "showsTUConversationStatus"))
  {
    -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v16 = v15;
    objc_msgSend(v15, "sizeThatFits:", v8, v14);
    v14 = v14 + v17;

    goto LABEL_6;
  }
  if (-[CKDetailsContactsTableViewCell showsLocation](self, "showsLocation"))
  {
    -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  v18 = v8;
  v19 = v14;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CKDetailsContactsLargeTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsContactsLargeTextTableViewCell *v4;
  CKDetailsContactsLargeTextTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKDetailsContactsLargeTextTableViewCell;
  v4 = -[CKDetailsContactsTableViewCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKDetailsContactsTableViewCell contactAvatarView](v4, "contactAvatarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKDetailsContactsTableViewCell nameLabel](v5, "nameLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKDetailsContactsTableViewCell nameLabel](v5, "nameLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    -[CKDetailsContactsTableViewCell nameLabel](v5, "nameLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

    -[CKDetailsContactsTableViewCell nameLabel](v5, "nameLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1148846080;
    objc_msgSend(v10, "setContentHuggingPriority:forAxis:", 1, v11);

    -[CKDetailsContactsLargeTextTableViewCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell contactAvatarView](v5, "contactAvatarView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    -[CKDetailsContactsLargeTextTableViewCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell nameLabel](v5, "nameLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    -[CKDetailsContactsLargeTextTableViewCell _hideAllButtons](v5, "_hideAllButtons");
    -[CKDetailsContactsLargeTextTableViewCell _initConstraints](v5, "_initConstraints");
  }
  return v5;
}

- (void)_initConstraints
{
  void *v3;
  double v4;
  double v5;
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
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[10];

  v85[8] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailsViewContactImageDiameter");
  v5 = v4;

  v48 = (void *)MEMORY[0x1E0CB3718];
  -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "heightAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "detailsContactCellMinimumHeight");
  objc_msgSend(v74, "constraintGreaterThanOrEqualToConstant:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v71;
  -[CKDetailsContactsTableViewCell contactAvatarView](self, "contactAvatarView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "widthAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToConstant:", v5);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v62;
  -[CKDetailsContactsTableViewCell contactAvatarView](self, "contactAvatarView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "heightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToConstant:", v5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v54;
  -[CKDetailsContactsTableViewCell contactAvatarView](self, "contactAvatarView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layoutMarginsGuide");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v49);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v47;
  -[CKDetailsContactsTableViewCell contactAvatarView](self, "contactAvatarView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsLargeTextTableViewCell topAnchor](self, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 10.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v43;
  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutMarginsGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v37;
  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layoutMarginsGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v8;
  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsTableViewCell contactAvatarView](self, "contactAvatarView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v85[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "activateConstraints:", v14);

  if (-[CKDetailsContactsTableViewCell showsLocation](self, "showsLocation"))
  {
    v60 = (void *)MEMORY[0x1E0CB3718];
    -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "layoutMarginsGuide");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v69);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v66;
    -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v16;
    -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutMarginsGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "activateConstraints:", v23);

  }
  if (-[CKDetailsContactsTableViewCell showsTUConversationStatus](self, "showsTUConversationStatus"))
  {
    v61 = (void *)MEMORY[0x1E0CB3718];
    -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "layoutMarginsGuide");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v70);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v67;
    -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v26;
    -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v83[2] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "activateConstraints:", v33);

  }
}

- (void)setShowsLocation:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
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
  objc_super v31;
  _QWORD v32[4];

  v3 = a3;
  v32[3] = *MEMORY[0x1E0C80C00];
  v5 = -[CKDetailsContactsTableViewCell showsLocation](self, "showsLocation");
  v31.receiver = self;
  v31.super_class = (Class)CKDetailsContactsLargeTextTableViewCell;
  -[CKDetailsContactsTableViewCell setShowsLocation:](&v31, sel_setShowsLocation_, v3);
  if (v5 != -[CKDetailsContactsTableViewCell showsLocation](self, "showsLocation"))
  {
    if (-[CKDetailsContactsTableViewCell showsLocation](self, "showsLocation"))
    {
      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNumberOfLines:", 0);

      -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      -[CKDetailsContactsLargeTextTableViewCell buttonsTopConstraint](self, "buttonsTopConstraint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setActive:", 0);

      v24 = (void *)MEMORY[0x1E0CB3718];
      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "leadingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "layoutMarginsGuide");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "leadingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v26;
      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layoutMarginsGuide");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v13;
      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 0.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activateConstraints:", v19);

    }
    else
    {
      -[CKDetailsContactsLargeTextTableViewCell buttonsTopConstraint](self, "buttonsTopConstraint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setActive:", 1);
    }

    -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNeedsLayout");

  }
}

- (void)setShowsTUConversationStatus:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
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
  objc_super v31;
  _QWORD v32[4];

  v3 = a3;
  v32[3] = *MEMORY[0x1E0C80C00];
  v5 = -[CKDetailsContactsTableViewCell showsTUConversationStatus](self, "showsTUConversationStatus");
  v31.receiver = self;
  v31.super_class = (Class)CKDetailsContactsLargeTextTableViewCell;
  -[CKDetailsContactsTableViewCell setShowsTUConversationStatus:](&v31, sel_setShowsTUConversationStatus_, v3);
  if (v5 != -[CKDetailsContactsTableViewCell showsTUConversationStatus](self, "showsTUConversationStatus"))
  {
    if (-[CKDetailsContactsTableViewCell showsTUConversationStatus](self, "showsTUConversationStatus"))
    {
      -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNumberOfLines:", 0);

      -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      -[CKDetailsContactsLargeTextTableViewCell buttonsTopConstraint](self, "buttonsTopConstraint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setActive:", 0);

      v24 = (void *)MEMORY[0x1E0CB3718];
      -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "leadingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "layoutMarginsGuide");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "leadingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v26;
      -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layoutMarginsGuide");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v13;
      -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 0.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activateConstraints:", v19);

    }
    else
    {
      -[CKDetailsContactsLargeTextTableViewCell buttonsTopConstraint](self, "buttonsTopConstraint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setActive:", 1);
    }

    -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNeedsLayout");

  }
}

- (void)configureWithViewModel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CKDetailsContactsLargeTextTableViewCell;
  -[CKDetailsContactsTableViewCell configureWithViewModel:](&v13, sel_configureWithViewModel_, a3);
  v4 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[CKDetailsContactsTableViewCell entityName](self, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1178];
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v7);

  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v8);

  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setOverallWritingDirectionFollowsLayoutDirection:", 1);

  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  -[CKDetailsContactsLargeTextTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

}

- (void)_updateVisibleButtons
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = -[CKDetailsContactsTableViewCell showFaceTimeVideoButton](self, "showFaceTimeVideoButton") ^ 1;
  -[CKDetailsContactsTableViewCell facetimeVideoButton](self, "facetimeVideoButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  v5 = -[CKDetailsContactsTableViewCell showMessageButton](self, "showMessageButton") ^ 1;
  -[CKDetailsContactsTableViewCell messageButton](self, "messageButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  v7 = -[CKDetailsContactsTableViewCell showPhoneButton](self, "showPhoneButton") ^ 1;
  -[CKDetailsContactsTableViewCell phoneButton](self, "phoneButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

  v9 = -[CKDetailsContactsTableViewCell showScreenSharingButton](self, "showScreenSharingButton") ^ 1;
  -[CKDetailsContactsTableViewCell screenSharingButton](self, "screenSharingButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

}

- (void)_hideAllButtons
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKDetailsContactsTableViewCell facetimeVideoButton](self, "facetimeVideoButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsContactsTableViewCell messageButton](self, "messageButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[CKDetailsContactsTableViewCell phoneButton](self, "phoneButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[CKDetailsContactsTableViewCell screenSharingButton](self, "screenSharingButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

}

- (NSLayoutConstraint)buttonsTopConstraint
{
  return self->_buttonsTopConstraint;
}

- (void)setButtonsTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsTopConstraint, 0);
}

@end
