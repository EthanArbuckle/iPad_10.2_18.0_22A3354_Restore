@implementation HRAtrialFibrillationDataTypeDescriptionCell

- (HRAtrialFibrillationDataTypeDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HRAtrialFibrillationDataTypeDescriptionCell *v4;
  HRAtrialFibrillationDataTypeDescriptionCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HRAtrialFibrillationDataTypeDescriptionCell;
  v4 = -[HRAtrialFibrillationDataTypeDescriptionCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[HRAtrialFibrillationDataTypeDescriptionCell _setupDescriptionTextView](v4, "_setupDescriptionTextView");
  return v5;
}

- (void)_setupDescriptionTextView
{
  UITextView *v3;
  UITextView *descriptionTextView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  UITextView *v12;
  UITextView *settingsDescriptionTextView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HKAttributionTextView *v25;
  HKAttributionTextView *settingsLinkTextView;
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
  NSArray *v38;
  NSArray *availableVerticalConstraints;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSArray *v48;
  NSArray *unavailableVerticalConstraints;
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
  _QWORD v82[6];
  _QWORD v83[2];
  _QWORD v84[4];
  _QWORD v85[2];
  _QWORD v86[4];

  v86[2] = *MEMORY[0x24BDAC8D0];
  v3 = (UITextView *)objc_alloc_init(MEMORY[0x24BDF6EF8]);
  descriptionTextView = self->_descriptionTextView;
  self->_descriptionTextView = v3;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_descriptionTextView, "setBackgroundColor:", v5);

  -[UITextView setEditable:](self->_descriptionTextView, "setEditable:", 0);
  -[UITextView setSelectable:](self->_descriptionTextView, "setSelectable:", 1);
  -[UITextView _setInteractiveTextSelectionDisabled:](self->_descriptionTextView, "_setInteractiveTextSelectionDisabled:", 1);
  -[UITextView textContainer](self->_descriptionTextView, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineFragmentPadding:", 0.0);

  -[UITextView setScrollEnabled:](self->_descriptionTextView, "setScrollEnabled:", 0);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  HRHeartRhythmUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DATA_TYPE_DESCRIPTION_AHA"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setText:](self->_descriptionTextView, "setText:", v8);

  v9 = *MEMORY[0x24BDF77B0];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_descriptionTextView, "setFont:", v10);

  -[UITextView setDelegate:](self->_descriptionTextView, "setDelegate:", self);
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_descriptionTextView);

  v12 = (UITextView *)objc_alloc_init(MEMORY[0x24BDF6EF8]);
  settingsDescriptionTextView = self->_settingsDescriptionTextView;
  self->_settingsDescriptionTextView = v12;

  -[UITextView setEditable:](self->_settingsDescriptionTextView, "setEditable:", 0);
  -[UITextView setSelectable:](self->_settingsDescriptionTextView, "setSelectable:", 1);
  -[UITextView _setInteractiveTextSelectionDisabled:](self->_settingsDescriptionTextView, "_setInteractiveTextSelectionDisabled:", 1);
  -[UITextView textContainer](self->_settingsDescriptionTextView, "textContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLineFragmentPadding:", 0.0);

  -[UITextView setScrollEnabled:](self->_settingsDescriptionTextView, "setScrollEnabled:", 0);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_settingsDescriptionTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  HRHeartRhythmUIFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DATA_TYPE_DESCRIPTION_WATCH"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setText:](self->_settingsDescriptionTextView, "setText:", v16);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_settingsDescriptionTextView, "setBackgroundColor:", v17);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_settingsDescriptionTextView, "setFont:", v18);

  -[UITextView setHidden:](self->_settingsDescriptionTextView, "setHidden:", 1);
  -[UITextView setDelegate:](self->_settingsDescriptionTextView, "setDelegate:", self);
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_settingsDescriptionTextView);

  v20 = objc_alloc(MEMORY[0x24BDD1458]);
  HRHeartRhythmUIFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_WATCH_SETTINGS_LINK"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = *MEMORY[0x24BDF6600];
  HKHealthKeyColor();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = *MEMORY[0x24BDF6618];
  v86[0] = v23;
  v86[1] = CFSTR("bridge:root=NOTIFICATIONS_ID&path=com.apple.HeartRateSettings");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v20, "initWithString:attributes:", v22, v24);

  v25 = (HKAttributionTextView *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A2B8]), "initWithAttributedText:selectable:", v80, 1);
  settingsLinkTextView = self->_settingsLinkTextView;
  self->_settingsLinkTextView = v25;

  -[HKAttributionTextView setTranslatesAutoresizingMaskIntoConstraints:](self->_settingsLinkTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKAttributionTextView setHidden:](self->_settingsLinkTextView, "setHidden:", 1);
  -[HKAttributionTextView setDelegate:](self->_settingsLinkTextView, "setDelegate:", self);
  -[HKAttributionTextView _setInteractiveTextSelectionDisabled:](self->_settingsLinkTextView, "_setInteractiveTextSelectionDisabled:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 2, CFSTR("AboutIRNDescription.WatchSettingsLink"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAttributionTextView setAccessibilityIdentifier:](self->_settingsLinkTextView, "setAccessibilityIdentifier:", v27);

  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", self->_settingsLinkTextView);

  -[UITextView topAnchor](self->_descriptionTextView, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v73);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v71;
  -[UITextView topAnchor](self->_settingsDescriptionTextView, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView lastBaselineAnchor](self->_descriptionTextView, "lastBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v29, 8.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v30;
  -[HKAttributionTextView topAnchor](self->_settingsLinkTextView, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView lastBaselineAnchor](self->_settingsDescriptionTextView, "lastBaselineAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 8.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v33;
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAttributionTextView bottomAnchor](self->_settingsLinkTextView, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v36, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 4);
  v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
  availableVerticalConstraints = self->_availableVerticalConstraints;
  self->_availableVerticalConstraints = v38;

  -[UITextView topAnchor](self->_descriptionTextView, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v43;
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView bottomAnchor](self->_descriptionTextView, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 8.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 2);
  v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
  unavailableVerticalConstraints = self->_unavailableVerticalConstraints;
  self->_unavailableVerticalConstraints = v48;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_unavailableVerticalConstraints);
  v65 = (void *)MEMORY[0x24BDD1628];
  -[UITextView leadingAnchor](self->_descriptionTextView, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v74, 16.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v72;
  -[UITextView trailingAnchor](self->_descriptionTextView, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:constant:", v68, -16.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v67;
  -[UITextView leadingAnchor](self->_settingsDescriptionTextView, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 16.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v62;
  -[UITextView trailingAnchor](self->_settingsDescriptionTextView, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, -16.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v50;
  -[HKAttributionTextView leadingAnchor](self->_settingsLinkTextView, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, 16.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v54;
  -[HKAttributionTextView trailingAnchor](self->_settingsLinkTextView, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDataTypeDescriptionCell contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, -16.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v82[5] = v58;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 6);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "activateConstraints:", v59);

}

- (void)setFeatureAvailable:(BOOL)a3
{
  if (self->_featureAvailable != a3)
  {
    self->_featureAvailable = a3;
    -[HRAtrialFibrillationDataTypeDescriptionCell _updateTextForDescriptionTextView](self, "_updateTextForDescriptionTextView");
  }
}

- (void)_updateTextForDescriptionTextView
{
  _BOOL4 v3;
  _BOOL8 v4;
  int *v5;
  int *v6;

  v3 = -[HRAtrialFibrillationDataTypeDescriptionCell featureAvailable](self, "featureAvailable");
  v4 = !v3;
  if (v3)
    v5 = &OBJC_IVAR___HRAtrialFibrillationDataTypeDescriptionCell__unavailableVerticalConstraints;
  else
    v5 = &OBJC_IVAR___HRAtrialFibrillationDataTypeDescriptionCell__availableVerticalConstraints;
  if (v3)
    v6 = &OBJC_IVAR___HRAtrialFibrillationDataTypeDescriptionCell__availableVerticalConstraints;
  else
    v6 = &OBJC_IVAR___HRAtrialFibrillationDataTypeDescriptionCell__unavailableVerticalConstraints;
  -[UITextView setHidden:](self->_settingsDescriptionTextView, "setHidden:", v4);
  -[HKAttributionTextView setHidden:](self->_settingsLinkTextView, "setHidden:", v4);
  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v5));
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v6));
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HRAtrialFibrillationDataTypeDescriptionCell;
  -[HRAtrialFibrillationDataTypeDescriptionCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HRAtrialFibrillationDataTypeDescriptionCell _updateTextForDescriptionTextView](self, "_updateTextForDescriptionTextView");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v6;
  void *v7;
  int v8;
  void *v9;

  v6 = a4;
  objc_msgSend(v6, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("bridge"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openSensitiveURL:withOptions:", v6, 0);

  }
  return 0;
}

- (BOOL)featureAvailable
{
  return self->_featureAvailable;
}

- (UITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextView, a3);
}

- (UITextView)settingsDescriptionTextView
{
  return self->_settingsDescriptionTextView;
}

- (void)setSettingsDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_settingsDescriptionTextView, a3);
}

- (HKAttributionTextView)settingsLinkTextView
{
  return self->_settingsLinkTextView;
}

- (void)setSettingsLinkTextView:(id)a3
{
  objc_storeStrong((id *)&self->_settingsLinkTextView, a3);
}

- (NSArray)availableVerticalConstraints
{
  return self->_availableVerticalConstraints;
}

- (void)setAvailableVerticalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_availableVerticalConstraints, a3);
}

- (NSArray)unavailableVerticalConstraints
{
  return self->_unavailableVerticalConstraints;
}

- (void)setUnavailableVerticalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableVerticalConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_availableVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_settingsLinkTextView, 0);
  objc_storeStrong((id *)&self->_settingsDescriptionTextView, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
}

@end
