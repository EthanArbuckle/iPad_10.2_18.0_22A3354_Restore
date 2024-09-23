@implementation WFContentAttributionTableViewCell

- (WFContentAttributionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFContentAttributionTableViewCell *v4;
  UILabel *v5;
  UILabel *bundleNameLabel;
  uint64_t v7;
  void *v8;
  UILabel *v9;
  UILabel *accountIdentifierLabel;
  void *v11;
  UILabel *v12;
  UILabel *managedLevelLabel;
  uint64_t v14;
  void *v15;
  UILabel *v16;
  UILabel *disclosureLevelLabel;
  void *v18;
  UILabel *v19;
  UILabel *contentItemsCountLabel;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
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
  uint64_t v50;
  NSLayoutConstraint *firstLineBaseLineConstaint;
  void *v52;
  void *v53;
  uint64_t v54;
  NSLayoutConstraint *secondLineBaseLineConstaint;
  WFContentAttributionTableViewCell *v56;
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
  objc_super v81;
  _QWORD v82[4];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[5];

  v85[3] = *MEMORY[0x24BDAC8D0];
  v81.receiver = self;
  v81.super_class = (Class)WFContentAttributionTableViewCell;
  v4 = -[WFContentAttributionTableViewCell initWithStyle:reuseIdentifier:](&v81, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    bundleNameLabel = v4->_bundleNameLabel;
    v4->_bundleNameLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_bundleNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_bundleNameLabel, "setFont:", v8);

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    accountIdentifierLabel = v4->_accountIdentifierLabel;
    v4->_accountIdentifierLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_accountIdentifierLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_accountIdentifierLabel, "setFont:", v11);

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    managedLevelLabel = v4->_managedLevelLabel;
    v4->_managedLevelLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_managedLevelLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = *MEMORY[0x24BEBE1E0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_managedLevelLabel, "setFont:", v15);

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    disclosureLevelLabel = v4->_disclosureLevelLabel;
    v4->_disclosureLevelLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_disclosureLevelLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_disclosureLevelLabel, "setFont:", v18);

    v19 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    contentItemsCountLabel = v4->_contentItemsCountLabel;
    v4->_contentItemsCountLabel = v19;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentItemsCountLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_contentItemsCountLabel, "setFont:", v21);

    v22 = objc_alloc(MEMORY[0x24BEBD978]);
    v85[0] = v4->_bundleNameLabel;
    v85[1] = v4->_accountIdentifierLabel;
    v85[2] = v4->_contentItemsCountLabel;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithArrangedSubviews:", v23);

    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v24, "setAxis:", 1);
    objc_msgSend(v24, "setSpacing:", 8.0);
    objc_msgSend(v24, "setAlignment:", 1);
    v25 = v24;
    v80 = v24;
    objc_msgSend(v24, "setDistribution:", 1);
    v26 = objc_alloc(MEMORY[0x24BEBD978]);
    v84[0] = v4->_disclosureLevelLabel;
    v84[1] = v4->_managedLevelLabel;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithArrangedSubviews:", v27);

    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v28, "setAxis:", 1);
    objc_msgSend(v28, "setSpacing:", 8.0);
    objc_msgSend(v28, "setAlignment:", 4);
    v29 = v28;
    v79 = v28;
    objc_msgSend(v28, "setDistribution:", 1);
    v30 = objc_alloc(MEMORY[0x24BEBD978]);
    v83[0] = v25;
    v83[1] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithArrangedSubviews:", v31);
    -[WFContentAttributionTableViewCell setContentStackView:](v4, "setContentStackView:", v32);

    -[WFContentAttributionTableViewCell contentStackView](v4, "contentStackView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[WFContentAttributionTableViewCell contentStackView](v4, "contentStackView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAxis:", 0);

    -[WFContentAttributionTableViewCell contentStackView](v4, "contentStackView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSpacing:", 8.0);

    -[WFContentAttributionTableViewCell contentStackView](v4, "contentStackView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlignment:", 2);

    -[WFContentAttributionTableViewCell contentView](v4, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentAttributionTableViewCell contentStackView](v4, "contentStackView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v38);

    v66 = (void *)MEMORY[0x24BDD1628];
    -[WFContentAttributionTableViewCell contentView](v4, "contentView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "layoutMarginsGuide");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentAttributionTableViewCell contentStackView](v4, "contentStackView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "layoutMarginsGuide");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v72;
    -[WFContentAttributionTableViewCell contentView](v4, "contentView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "layoutMarginsGuide");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentAttributionTableViewCell contentStackView](v4, "contentStackView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "layoutMarginsGuide");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v64;
    -[WFContentAttributionTableViewCell contentView](v4, "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "layoutMarginsGuide");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentAttributionTableViewCell contentStackView](v4, "contentStackView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "layoutMarginsGuide");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v58);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v82[2] = v39;
    -[WFContentAttributionTableViewCell contentView](v4, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layoutMarginsGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentAttributionTableViewCell contentStackView](v4, "contentStackView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "layoutMarginsGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v82[3] = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "activateConstraints:", v47);

    -[UILabel firstBaselineAnchor](v4->_bundleNameLabel, "firstBaselineAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v4->_disclosureLevelLabel, "firstBaselineAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v49);
    v50 = objc_claimAutoreleasedReturnValue();
    firstLineBaseLineConstaint = v4->_firstLineBaseLineConstaint;
    v4->_firstLineBaseLineConstaint = (NSLayoutConstraint *)v50;

    -[UILabel firstBaselineAnchor](v4->_accountIdentifierLabel, "firstBaselineAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v4->_managedLevelLabel, "firstBaselineAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = objc_claimAutoreleasedReturnValue();
    secondLineBaseLineConstaint = v4->_secondLineBaseLineConstaint;
    v4->_secondLineBaseLineConstaint = (NSLayoutConstraint *)v54;

    v56 = v4;
  }

  return v4;
}

- (void)updateCellWithContentAttribution:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  unint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;

  v5 = a3;
  objc_msgSend(v5, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v6, "appDescriptor"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "bundleIdentifier"),
        v49 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v49))
  {
    objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v49, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedShortName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }
  else
  {
    v49 = 0;
    v8 = 0;
    v9 = 1;
  }
  -[WFContentAttributionTableViewCell bundleNameLabel](self, "bundleNameLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v8);

  if ((v9 & 1) == 0)
  {

  }
  -[WFContentAttributionTableViewCell bundleNameLabel](self, "bundleNameLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length") == 0;
  -[WFContentAttributionTableViewCell bundleNameLabel](self, "bundleNameLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v13);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "accountIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[WFContentAttributionTableViewCell accountIdentifierLabel](self, "accountIdentifierLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  -[WFContentAttributionTableViewCell accountIdentifierLabel](self, "accountIdentifierLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length") == 0;
  -[WFContentAttributionTableViewCell accountIdentifierLabel](self, "accountIdentifierLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v19);

  v21 = objc_msgSend(v6, "managedLevel") - 1;
  if (v21 > 2)
    v22 = CFSTR("None");
  else
    v22 = off_24E342C88[v21];
  -[WFContentAttributionTableViewCell managedLevelLabel](self, "managedLevelLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v22);

  -[WFContentAttributionTableViewCell managedLevelLabel](self, "managedLevelLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length") == 0;
  -[WFContentAttributionTableViewCell managedLevelLabel](self, "managedLevelLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", v26);

  v28 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "privateItemIdentifiers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%d privateItemIdentifiers"), objc_msgSend(v29, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentAttributionTableViewCell contentItemsCountLabel](self, "contentItemsCountLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v30);

  v32 = objc_msgSend(v5, "disclosureLevel");
  if (v32 == 1)
    v33 = CFSTR("Private");
  else
    v33 = CFSTR("Public");
  -[WFContentAttributionTableViewCell disclosureLevelLabel](self, "disclosureLevelLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setText:", v33);

  -[WFContentAttributionTableViewCell disclosureLevelLabel](self, "disclosureLevelLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "text");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "length") == 0;
  -[WFContentAttributionTableViewCell disclosureLevelLabel](self, "disclosureLevelLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setHidden:", v37);

  -[WFContentAttributionTableViewCell accountIdentifierLabel](self, "accountIdentifierLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = objc_msgSend(v39, "isHidden");

  -[WFContentAttributionTableViewCell contentStackView](self, "contentStackView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if ((_DWORD)v36)
    v42 = 3;
  else
    v42 = 0;
  objc_msgSend(v40, "setAlignment:", v42);

  -[WFContentAttributionTableViewCell accountIdentifierLabel](self, "accountIdentifierLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isHidden") ^ 1;
  -[WFContentAttributionTableViewCell firstLineBaseLineConstaint](self, "firstLineBaseLineConstaint");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", v44);

  -[WFContentAttributionTableViewCell accountIdentifierLabel](self, "accountIdentifierLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isHidden") ^ 1;
  -[WFContentAttributionTableViewCell secondLineBaseLineConstaint](self, "secondLineBaseLineConstaint");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", v47);

}

- (UILabel)bundleNameLabel
{
  return self->_bundleNameLabel;
}

- (void)setBundleNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bundleNameLabel, a3);
}

- (UILabel)accountIdentifierLabel
{
  return self->_accountIdentifierLabel;
}

- (void)setAccountIdentifierLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifierLabel, a3);
}

- (UILabel)managedLevelLabel
{
  return self->_managedLevelLabel;
}

- (void)setManagedLevelLabel:(id)a3
{
  objc_storeStrong((id *)&self->_managedLevelLabel, a3);
}

- (UILabel)disclosureLevelLabel
{
  return self->_disclosureLevelLabel;
}

- (void)setDisclosureLevelLabel:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureLevelLabel, a3);
}

- (UILabel)contentItemsCountLabel
{
  return self->_contentItemsCountLabel;
}

- (void)setContentItemsCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contentItemsCountLabel, a3);
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (NSLayoutConstraint)firstLineBaseLineConstaint
{
  return self->_firstLineBaseLineConstaint;
}

- (void)setFirstLineBaseLineConstaint:(id)a3
{
  objc_storeStrong((id *)&self->_firstLineBaseLineConstaint, a3);
}

- (NSLayoutConstraint)secondLineBaseLineConstaint
{
  return self->_secondLineBaseLineConstaint;
}

- (void)setSecondLineBaseLineConstaint:(id)a3
{
  objc_storeStrong((id *)&self->_secondLineBaseLineConstaint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondLineBaseLineConstaint, 0);
  objc_storeStrong((id *)&self->_firstLineBaseLineConstaint, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_contentItemsCountLabel, 0);
  objc_storeStrong((id *)&self->_disclosureLevelLabel, 0);
  objc_storeStrong((id *)&self->_managedLevelLabel, 0);
  objc_storeStrong((id *)&self->_accountIdentifierLabel, 0);
  objc_storeStrong((id *)&self->_bundleNameLabel, 0);
}

@end
