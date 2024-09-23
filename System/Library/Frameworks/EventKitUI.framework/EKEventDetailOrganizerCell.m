@implementation EKEventDetailOrganizerCell

- (EKEventDetailOrganizerCell)initWithEvent:(id)a3 editable:(BOOL)a4 organizerOverride:(id)a5
{
  _BOOL8 v5;
  EKIdentityProtocol *v8;
  EKEventDetailOrganizerCell *v9;
  EKIdentityProtocol *organizerOverride;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
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
  void *v66;
  EKIdentityProtocol *v67;
  objc_super v68;

  v5 = a4;
  v8 = (EKIdentityProtocol *)a5;
  v68.receiver = self;
  v68.super_class = (Class)EKEventDetailOrganizerCell;
  v9 = -[EKEventDetailCell initWithEvent:editable:style:](&v68, sel_initWithEvent_editable_style_, a3, v5, 0);
  organizerOverride = v9->_organizerOverride;
  v9->_organizerOverride = v8;
  v67 = v8;

  -[EKEventDetailOrganizerCell _titleView](v9, "_titleView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailOrganizerCell _organizerView](v9, "_organizerView");
  v12 = objc_claimAutoreleasedReturnValue();
  -[EKEventDetailOrganizerCell _organizerLabel](v9, "_organizerLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailOrganizerCell contentView](v9, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v11);

  -[EKEventDetailOrganizerCell contentView](v9, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v13);

  -[EKEventDetailOrganizerCell contentView](v9, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v12);

  v17 = (void *)v12;
  _NSDictionaryOfVariableBindings(CFSTR("title,avatar,name"), v11, v12, v13, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[avatar(==37)]-(12)-[title]-|"), 0, 0, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v20);

  v66 = (void *)v18;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[avatar(==37)]-(12)-[name]-|"), 0, 0, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v21);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[avatar]-(>=0)-|"), 0, 0, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v22);

  +[EKEventDetailOrganizerCell _titleFont](EKEventDetailOrganizerCell, "_titleFont");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_scaledValueForValue:", 25.0);
  CalRoundToScreenScale(v24);
  v26 = v25;

  +[EKEventDetailOrganizerCell _organizerFont](EKEventDetailOrganizerCell, "_organizerFont");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_scaledValueForValue:", 20.0);
  CalRoundToScreenScale(v28);
  v30 = v29;

  +[EKEventDetailOrganizerCell _titleFont](EKEventDetailOrganizerCell, "_titleFont");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_scaledValueForValue:", 15.0);
  CalRoundToScreenScale(v32);
  v34 = v33;

  objc_msgSend(v13, "firstBaselineAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastBaselineAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v30);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v37);

  v38 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  -[EKEventDetailOrganizerCell contentView](v9, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addLayoutGuide:", v38);

  objc_msgSend(v11, "firstBaselineAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, v26);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v42);

  objc_msgSend(v38, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastBaselineAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, v34);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v45);

  objc_msgSend(v38, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailOrganizerCell contentView](v9, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "centerYAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v49);

  objc_msgSend(v38, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailOrganizerCell contentView](v9, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v53);

  objc_msgSend(v38, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailOrganizerCell contentView](v9, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v57);

  objc_msgSend(v17, "centerYAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailOrganizerCell contentView](v9, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "centerYAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v61);

  -[EKEventDetailOrganizerCell contentView](v9, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "heightAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintGreaterThanOrEqualToConstant:", 60.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v64);

  -[EKEventDetailOrganizerCell update](v9, "update");
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v19);

  return v9;
}

+ (id)_titleFont
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, v5 * 0.700999975);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_organizerFont
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, v5 * 0.700999975);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldDisplayForEvent
{
  void *v3;
  void *v4;
  BOOL v5;

  -[EKEvent organizer](self->super._event, "organizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3 && !objc_msgSend(v3, "isCurrentUser") || self->_organizerOverride != 0;

  return v5;
}

- (BOOL)update
{
  _BOOL8 v3;
  EKIdentityProtocol *organizerOverride;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *organizerName;
  EKIdentityProtocol *v16;
  EKIdentityProtocol *v17;
  void *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  NSString *v22;
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
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v39;

  LODWORD(v3) = -[EKEventDetailOrganizerCell shouldDisplayForEvent](self, "shouldDisplayForEvent");
  if (v3)
  {
    organizerOverride = self->_organizerOverride;
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (organizerOverride)
      v7 = CFSTR("Proposed by");
    else
      v7 = CFSTR("Invitation from");
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E601DFA8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEventDetailOrganizerCell _titleView](self, "_titleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    +[EKEventDetailOrganizerCell _titleFont](EKEventDetailOrganizerCell, "_titleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailOrganizerCell _titleView](self, "_titleView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailOrganizerCell _titleView](self, "_titleView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

    -[EKEventDetailOrganizerCell textLabel](self, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", 0);

    organizerName = self->_organizerName;
    self->_organizerName = 0;

    v16 = self->_organizerOverride;
    if (v16)
    {
      v17 = v16;
    }
    else
    {
      -[EKEvent organizer](self->super._event, "organizer");
      v17 = (EKIdentityProtocol *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
LABEL_15:
        -[EKEventDetailOrganizerCell _updateDisclosureIndicator](self, "_updateDisclosureIndicator");

        return v3;
      }
    }
    DisplayStringForIdentity((uint64_t)v17, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
    {
      v19 = v18;
      v20 = self->_organizerName;
      self->_organizerName = v19;
    }
    else
    {
      EventKitUIBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_1E601DFA8, 0);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      v22 = self->_organizerName;
      self->_organizerName = v21;

    }
    if (-[EKEvent couldBeJunk](self->super._event, "couldBeJunk"))
    {
      v23 = (void *)objc_opt_new();
      -[EKEventDetailOrganizerCell _organizerView](self, "_organizerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setContact:", v23);

      DisplayAddressForIdentity(v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDetailOrganizerCell _organizerLabel](self, "_organizerLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v25);

    }
    else
    {
      -[EKEventDetailOrganizerCell _organizerView](self, "_organizerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      DisplayAddressForIdentity(v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKIdentityProtocol name](v17, "name");
      v39 = v3;
      v3 = (_BOOL8)v18;
      v29 = v8;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKIdentityProtocol firstName](v17, "firstName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKIdentityProtocol lastName](v17, "lastName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "updateWithAddress:fullName:firstName:lastName:", v28, v30, v31, v32);

      v8 = v29;
      v18 = (void *)v3;
      LOBYTE(v3) = v39;

      v33 = self->_organizerName;
      -[EKEventDetailOrganizerCell _organizerLabel](self, "_organizerLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v33);
    }

    +[EKEventDetailOrganizerCell _organizerFont](EKEventDetailOrganizerCell, "_organizerFont");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailOrganizerCell _organizerLabel](self, "_organizerLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFont:", v34);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailOrganizerCell _organizerLabel](self, "_organizerLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTextColor:", v36);

    goto LABEL_15;
  }
  return v3;
}

- (id)_titleView
{
  UILabel *titleView;
  UILabel *v4;
  UILabel *v5;

  titleView = self->_titleView;
  if (!titleView)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v5 = self->_titleView;
    self->_titleView = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_titleView, "setNumberOfLines:", 0);
    titleView = self->_titleView;
  }
  return titleView;
}

- (id)_organizerLabel
{
  UILabel *organizerLabel;
  UILabel *v4;
  UILabel *v5;

  organizerLabel = self->_organizerLabel;
  if (!organizerLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v5 = self->_organizerLabel;
    self->_organizerLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_organizerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_organizerLabel, "setNumberOfLines:", 0);
    organizerLabel = self->_organizerLabel;
  }
  return organizerLabel;
}

- (id)_organizerView
{
  EKUILabeledAvatarView *organizerView;
  EKUILabeledAvatarView *v4;
  EKUILabeledAvatarView *v5;

  organizerView = self->_organizerView;
  if (!organizerView)
  {
    v4 = -[EKUILabeledAvatarView initWithPlacement:options:]([EKUILabeledAvatarView alloc], "initWithPlacement:options:", 0, 0);
    v5 = self->_organizerView;
    self->_organizerView = v4;

    -[EKUILabeledAvatarView setTranslatesAutoresizingMaskIntoConstraints:](self->_organizerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    organizerView = self->_organizerView;
  }
  return organizerView;
}

- (void)_updateDisclosureIndicator
{
  _BOOL8 v3;

  v3 = !self->_hideDisclosureIndicator && -[NSString length](self->_organizerName, "length") != 0;
  -[EKEventDetailOrganizerCell setAccessoryType:](self, "setAccessoryType:", v3);
}

- (void)setHideDisclosureIndicator:(BOOL)a3
{
  if (self->_hideDisclosureIndicator != a3)
  {
    self->_hideDisclosureIndicator = a3;
    -[EKEventDetailOrganizerCell _updateDisclosureIndicator](self, "_updateDisclosureIndicator");
  }
}

- (BOOL)hideDisclosureIndicator
{
  return self->_hideDisclosureIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizerOverride, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_organizerLabel, 0);
  objc_storeStrong((id *)&self->_organizerView, 0);
  objc_storeStrong((id *)&self->_organizerName, 0);
}

@end
