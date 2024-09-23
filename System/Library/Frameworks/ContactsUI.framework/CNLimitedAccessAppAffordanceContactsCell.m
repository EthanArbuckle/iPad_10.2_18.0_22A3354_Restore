@implementation CNLimitedAccessAppAffordanceContactsCell

- (CNLimitedAccessAppAffordanceContactsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNLimitedAccessAppAffordanceContactsCell *v4;
  void *v5;
  uint64_t v6;
  CNAvatarViewControllerSettings *settings;
  void *v8;
  void *v9;
  CNLimitedAccessAppAffordanceContactsCell *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNLimitedAccessAppAffordanceContactsCell;
  v4 = -[CNLimitedAccessAppAffordanceContactsCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, 1, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessAppAffordanceContactsCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    +[CNAvatarViewControllerSettings defaultSettings](CNAvatarViewControllerSettings, "defaultSettings");
    v6 = objc_claimAutoreleasedReturnValue();
    settings = v4->_settings;
    v4->_settings = (CNAvatarViewControllerSettings *)v6;

    -[CNAvatarViewControllerSettings setStyle:](v4->_settings, "setStyle:", 0);
    -[CNAvatarViewControllerSettings setThreeDTouchEnabled:](v4->_settings, "setThreeDTouchEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessAppAffordanceContactsCell textLabel](v4, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    v10 = v4;
  }

  return v4;
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNLimitedAccessAppAffordanceContactsCell;
  -[CNLimitedAccessAppAffordanceContactsCell awakeFromNib](&v2, sel_awakeFromNib);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNLimitedAccessAppAffordanceContactsCell;
  -[CNLimitedAccessAppAffordanceContactsCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (void)setContact:(id)a3 caption:(unint64_t)a4
{
  id v6;
  CNAvatarView *v7;
  CNAvatarView *avatarView;
  CNAvatarView *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  CNLimitedAccessAppAffordanceContactsCell *v19;
  id v20;
  void *v21;
  void *v22;
  CNLimitedAccessAppAffordanceContactsCell *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  id v42;
  void *v43;
  id v44;
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
  id *p_isa;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  v7 = -[CNAvatarView initWithSettings:]([CNAvatarView alloc], "initWithSettings:", self->_settings);
  avatarView = self->_avatarView;
  self->_avatarView = v7;

  v9 = self->_avatarView;
  v81[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarView setContacts:](v9, "setContacts:", v10);

  -[CNLimitedAccessAppAffordanceContactsCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_avatarView);

  v12 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v12, "setEmphasizesPrimaryNameComponent:", 1);
  objc_msgSend(v12, "setIgnoresNickname:", 1);
  objc_msgSend(v12, "setIgnoresOrganization:", 1);
  v13 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v14 = objc_claimAutoreleasedReturnValue();
  v56 = *MEMORY[0x1E0DC1140];
  v15 = *MEMORY[0x1E0DC1140];
  v57 = *MEMORY[0x1E0DC1138];
  v79[0] = *MEMORY[0x1E0DC1138];
  v79[1] = v15;
  v80[0] = v14;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributedStringFromContact:defaultAttributes:", v6, v17);
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = self;
  v20 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v21);

  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v20, "setAttributedText:", v18);
  objc_msgSend(v20, "setAdjustsFontSizeToFitWidth:", 1);
  -[CNLimitedAccessAppAffordanceContactsCell contentView](v19, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v20;
  objc_msgSend(v22, "addSubview:", v20);

  v75 = v12;
  v76 = v6;
  v73 = (void *)v18;
  v74 = (void *)v14;
  if (!a4)
  {
    v23 = v19;
    objc_msgSend(v6, "emailAddresses");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (v30)
    {
      objc_msgSend(v6, "emailAddresses");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "value");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_9:
    v58 = 0;
    v59 = 0;
    goto LABEL_10;
  }
  if (a4 != 1)
  {
    v58 = 0;
    v59 = 0;
    goto LABEL_11;
  }
  v23 = v19;
  objc_msgSend(v6, "phoneNumbers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (!v25)
    goto LABEL_9;
  objc_msgSend(v6, "phoneNumbers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "value");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "formattedStringValue");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v59 = 1;
LABEL_10:
  v19 = v23;
LABEL_11:
  p_isa = (id *)&v19->super.super.super.super.isa;
  -[CNLimitedAccessAppAffordanceContactsCell contentView](v19, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "layoutMarginsGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNLimitedAccessAppAffordanceContactsCell contentView](v19, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CNAvatarView heightAnchor](v19->_avatarView, "heightAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarView widthAnchor](v19->_avatarView, "widthAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarView leadingAnchor](v19->_avatarView, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarView centerYAnchor](v19->_avatarView, "centerYAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v32;
  objc_msgSend(v32, "centerYAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v33;
  objc_msgSend(v33, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v36, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarView trailingAnchor](v19->_avatarView, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:constant:", v39, 4.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v64, "initWithObjects:", v61, v60, v34, v37, v40, 0);

  if (v59)
  {
    v42 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B28]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_alloc(MEMORY[0x1E0CB3498]);
    v77[0] = v57;
    v77[1] = v56;
    v78[0] = v43;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v45;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v44, "initWithString:attributes:", v58, v46);
    objc_msgSend(v42, "setAttributedText:", v47);

    objc_msgSend(p_isa, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addSubview:", v42);

    objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v42, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintGreaterThanOrEqualToAnchor:constant:", v50, 4.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v51);

    objc_msgSend(v42, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[128], "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintGreaterThanOrEqualToAnchor:constant:", v53, 4.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v54);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v41);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CNLimitedAccessAppAffordanceContactsCell;
  -[CNLimitedAccessAppAffordanceContactsCell prepareForReuse](&v13, sel_prepareForReuse);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CNLimitedAccessAppAffordanceContactsCell contentView](self, "contentView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeFromSuperview");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (CNAvatarViewControllerSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("CNLimitedAccessAppAffordanceContactsCellIdentifier");
}

@end
