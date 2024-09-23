@implementation _HKEmergencyCardContactCell

- (_HKEmergencyCardContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _HKEmergencyCardContactCell *v4;
  _HKEmergencyCardContactCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKEmergencyCardContactCell;
  v4 = -[_HKEmergencyCardContactCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_HKEmergencyCardContactCell _setupIndividualViews](v4, "_setupIndividualViews");
    -[_HKEmergencyCardContactCell setupViewHeirarchy](v5, "setupViewHeirarchy");
    -[_HKEmergencyCardContactCell setupConstraints](v5, "setupConstraints");
    -[_HKEmergencyCardContactCell _contentSizeCategoryDidChange:](v5, "_contentSizeCategoryDidChange:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_HKEmergencyCardContactCell;
  -[_HKEmergencyCardContactCell dealloc](&v4, sel_dealloc);
}

- (void)_setupIndividualViews
{
  UILabel *v3;
  UILabel *relationshipLabel;
  void *v5;
  UILabel *v6;
  UILabel *nameLabel;
  void *v8;
  UILabel *v9;
  UILabel *phoneNumberLabel;
  void *v11;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  relationshipLabel = self->_relationshipLabel;
  self->_relationshipLabel = v3;

  -[UILabel setNumberOfLines:](self->_relationshipLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_relationshipLabel, "setTextColor:", v5);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_relationshipLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  nameLabel = self->_nameLabel;
  self->_nameLabel = v6;

  -[UILabel setNumberOfLines:](self->_nameLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_nameLabel, "setTextColor:", v8);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  phoneNumberLabel = self->_phoneNumberLabel;
  self->_phoneNumberLabel = v9;

  -[UILabel setNumberOfLines:](self->_phoneNumberLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_phoneNumberLabel, "setTextColor:", v11);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_phoneNumberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)setupViewHeirarchy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell relationshipLabel](self, "relationshipLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell nameLabel](self, "nameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell phoneNumberLabel](self, "phoneNumberLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

}

- (void)setupConstraints
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
  id v60;

  -[_HKEmergencyCardContactCell relationshipLabel](self, "relationshipLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell relationshipLabel](self, "relationshipLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scaledValueForValue:", 20.0);
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[_HKEmergencyCardContactCell relationshipLabel](self, "relationshipLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 16.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell relationshipLabel](self, "relationshipLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 16.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[_HKEmergencyCardContactCell nameLabel](self, "nameLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstBaselineAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell relationshipLabel](self, "relationshipLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lastBaselineAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell nameLabel](self, "nameLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "font");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_scaledValueForValue:", 24.0);
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[_HKEmergencyCardContactCell nameLabel](self, "nameLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leftAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, 16.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell nameLabel](self, "nameLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, 16.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[_HKEmergencyCardContactCell phoneNumberLabel](self, "phoneNumberLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "firstBaselineAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell nameLabel](self, "nameLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "lastBaselineAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell nameLabel](self, "nameLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "font");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_scaledValueForValue:", 24.0);
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setActive:", 1);

  -[_HKEmergencyCardContactCell phoneNumberLabel](self, "phoneNumberLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leftAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leftAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, 16.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell phoneNumberLabel](self, "phoneNumberLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, 16.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setActive:", 1);

  -[_HKEmergencyCardContactCell contentView](self, "contentView");
  v60 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell phoneNumberLabel](self, "phoneNumberLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyCardContactCell relationshipLabel](self, "relationshipLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "font");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "_scaledValueForValue:", 20.0);
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v56);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setActive:", 1);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_relationshipLabel, "setFont:", v4);

  v5 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_nameLabel, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_phoneNumberLabel, "setFont:", v7);

}

- (void)setContact:(id)a3
{
  -[_HKEmergencyCardContactCell setContact:showRelationship:showPhoneIcon:](self, "setContact:showRelationship:showPhoneIcon:", a3, 1, 1);
}

- (void)setContact:(id)a3 showRelationship:(BOOL)a4 showPhoneIcon:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v13 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  objc_msgSend(v13, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_nameLabel, "setText:", v8);

  objc_msgSend(v13, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_phoneNumberLabel, "setText:", v9);

  if (v5)
  {
    v10 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(v13, "relationship");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForLabel:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_relationshipLabel, "setText:", v12);

  }
  else
  {
    -[UILabel setText:](self->_relationshipLabel, "setText:", 0);
  }

}

- (_HKEmergencyContact)contact
{
  return self->_contact;
}

- (UILabel)relationshipLabel
{
  return self->_relationshipLabel;
}

- (void)setRelationshipLabel:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipLabel, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)phoneNumberLabel
{
  return self->_phoneNumberLabel;
}

- (void)setPhoneNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_relationshipLabel, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
