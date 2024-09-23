@implementation HROnboardingElectrocardiogramAvailabilityViewController

- (id)initForOnboarding:(BOOL)a3 provenance:(int64_t)a4
{
  _BOOL4 v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  HRElectrocardiogramWatchAppInstallability *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v6 = *MEMORY[0x24BDD4290];
  v12.receiver = self;
  v12.super_class = (Class)HROnboardingElectrocardiogramAvailabilityViewController;
  v7 = -[HROnboardingElectrocardiogramAvailabilityViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v12, sel_initForOnboarding_upgradingFromAlgorithmVersion_, a3, v6);
  v8 = v7;
  if (v7)
  {
    if (v5)
      objc_msgSend(v7, "setRightButtonType:", 2);
    v8[147] = a4;
    v9 = objc_alloc_init(HRElectrocardiogramWatchAppInstallability);
    v10 = (void *)v8[134];
    v8[134] = v9;

  }
  return v8;
}

- (void)setDateOfBirth:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSDate isEqual:](self->_dateOfBirth, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dateOfBirth, a3);
    -[HROnboardingElectrocardiogramAvailabilityViewController _updateDateOfBirthDisplay](self, "_updateDateOfBirthDisplay");
  }

}

- (id)_defaultDOB
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithUTCTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_dateOfBirthDateComponentsWithDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 4, -35, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setUpUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  id v20;
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
  id v33;
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
  id v54;
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
  id v70;
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
  objc_super v94;
  _QWORD v95[2];

  v95[1] = *MEMORY[0x24BDAC8D0];
  v94.receiver = self;
  v94.super_class = (Class)HROnboardingElectrocardiogramAvailabilityViewController;
  -[HROnboardingElectrocardiogramAvailabilityViewController setUpUI](&v94, sel_setUpUI);
  -[HROnboardingElectrocardiogramAvailabilityViewController createHeroView](self, "createHeroView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController setHeroView:](self, "setHeroView:", v3);

  -[HROnboardingElectrocardiogramAvailabilityViewController heroView](self, "heroView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController heroView](self, "heroView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramAvailabilityViewController setTitleLabel:](self, "setTitleLabel:", v7);

  -[HROnboardingElectrocardiogramAvailabilityViewController titleString](self, "titleString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("Onboarding.PageTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", v10);

  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextAlignment:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController _titleFont](self, "_titleFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  v20 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramAvailabilityViewController setBodyLabel:](self, "setBodyLabel:", v20);

  -[HROnboardingElectrocardiogramAvailabilityViewController bodyString](self, "bodyString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("Onboarding.EcgDescription"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAccessibilityIdentifier:", v23);

  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextAlignment:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyFont](self, "_bodyFont");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFont:", v26);

  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v32);

  v33 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramAvailabilityViewController setBirthdayPromptLabel:](self, "setBirthdayPromptLabel:", v33);

  HRHeartRhythmUIFrameworkBundle();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("AGE_GATE_ENTER_DOB_TO_CONTINUE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayPromptLabel](self, "birthdayPromptLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setText:", v35);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("BirthDate.Prompt"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayPromptLabel](self, "birthdayPromptLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAccessibilityIdentifier:", v37);

  -[HROnboardingElectrocardiogramAvailabilityViewController _birthdayPromptFont](self, "_birthdayPromptFont");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayPromptLabel](self, "birthdayPromptLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFont:", v39);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayPromptLabel](self, "birthdayPromptLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayPromptLabel](self, "birthdayPromptLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayPromptLabel](self, "birthdayPromptLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayPromptLabel](self, "birthdayPromptLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addSubview:", v45);

  objc_msgSend(MEMORY[0x24BE4A838], "_hragegate_separatorView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController setBirthdayTopSeparator:](self, "setBirthdayTopSeparator:", v46);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayTopSeparator](self, "birthdayTopSeparator");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayTopSeparator](self, "birthdayTopSeparator");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addSubview:", v49);

  -[HROnboardingElectrocardiogramAvailabilityViewController _setupBirthdayEntryView](self, "_setupBirthdayEntryView");
  objc_msgSend(MEMORY[0x24BE4A838], "_hragegate_separatorView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController setBirthdayBottomSeparator:](self, "setBirthdayBottomSeparator:", v50);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayBottomSeparator](self, "birthdayBottomSeparator");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayBottomSeparator](self, "birthdayBottomSeparator");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addSubview:", v53);

  v54 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramAvailabilityViewController setBirthdayFooterLabel:](self, "setBirthdayFooterLabel:", v54);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterString](self, "birthdayFooterString");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setText:", v55);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("BirthDate.AgeRestriction"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setAccessibilityIdentifier:", v57);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setTextAlignment:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController _footnoteFont](self, "_footnoteFont");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setFont:", v60);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setTextColor:", v62);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addSubview:", v68);

  -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterString](self, "locationFooterString");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    v70 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[HROnboardingElectrocardiogramAvailabilityViewController setLocationFooterLabel:](self, "setLocationFooterLabel:", v70);

    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterString](self, "locationFooterString");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setText:", v71);

    objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("SetupLocation"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setAccessibilityIdentifier:", v73);

    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setTextAlignment:", 1);

    -[HROnboardingElectrocardiogramAvailabilityViewController _footnoteFont](self, "_footnoteFont");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setFont:", v76);

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setTextColor:", v78);

    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setAdjustsFontForContentSizeCategory:", 1);

    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setNumberOfLines:", 0);

    -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "addSubview:", v84);

  }
  -[HROnboardingElectrocardiogramAvailabilityViewController buttonTitleString](self, "buttonTitleString");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v85;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController disclaimerString](self, "disclaimerString");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:", v86, v87, 0, self);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController setStackedButtonView:](self, "setStackedButtonView:", v88);

  -[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setFixedBottomButtonSpacing:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setBlurHidden:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addSubview:", v93);

  -[HROnboardingElectrocardiogramAvailabilityViewController _updateDateOfBirthDisplay](self, "_updateDateOfBirthDisplay");
}

- (void)setUpConstraints
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
  double v54;
  double v55;
  double v56;
  double v57;
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
  objc_super v85;

  v85.receiver = self;
  v85.super_class = (Class)HROnboardingElectrocardiogramAvailabilityViewController;
  -[HROnboardingElectrocardiogramAvailabilityViewController setUpConstraints](&v85, sel_setUpConstraints);
  -[HROnboardingElectrocardiogramAvailabilityViewController heroView](self, "heroView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  -[HROnboardingElectrocardiogramAvailabilityViewController heroView](self, "heroView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v10, "hrui_alignHorizontalConstraintsWithView:insets:", v11);

  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController heroView](self, "heroView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 29.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController _titleBottomToBodyTop](self, "_titleBottomToBodyTop");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayPromptLabel](self, "birthdayPromptLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController bodyLabel](self, "bodyLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyBottomToAgePromptTop](self, "_bodyBottomToAgePromptTop");
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayPromptLabel](self, "birthdayPromptLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "hk_alignHorizontalConstraintsWithView:margin:", v30, 0.0);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayTopSeparator](self, "birthdayTopSeparator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hk_alignHorizontalConstraintsWithView:margin:", v32, 0.0);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayTopSeparator](self, "birthdayTopSeparator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayPromptLabel](self, "birthdayPromptLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "lastBaselineAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController _agePromptLastBaselineToAgeEntryTop](self, "_agePromptLastBaselineToAgeEntryTop");
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayEntryView](self, "birthdayEntryView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "hk_alignHorizontalConstraintsWithView:margin:", v39, 0.0);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayEntryView](self, "birthdayEntryView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "firstBaselineAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayTopSeparator](self, "birthdayTopSeparator");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController _ageEntryTopSeparatorToFirstBaseline](self, "_ageEntryTopSeparatorToFirstBaseline");
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayBottomSeparator](self, "birthdayBottomSeparator");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "hk_alignHorizontalConstraintsWithView:margin:", v46, 0.0);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayBottomSeparator](self, "birthdayBottomSeparator");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayEntryView](self, "birthdayEntryView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "lastBaselineAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController _ageEntryLastBaselineToBottomSeparator](self, "_ageEntryLastBaselineToBottomSeparator");
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *MEMORY[0x24BDF65E8];
  v55 = *(double *)(MEMORY[0x24BDF65E8] + 8);
  v56 = *(double *)(MEMORY[0x24BDF65E8] + 16);
  v57 = *(double *)(MEMORY[0x24BDF65E8] + 24);
  objc_msgSend(v52, "hk_alignHorizontalConstraintsWithView:insets:", v53, *MEMORY[0x24BDF65E8], v55, v56, v57);

  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "firstBaselineAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayBottomSeparator](self, "birthdayBottomSeparator");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController _bottomSeparatorToBirthdayFooterFirstBaseline](self, "_bottomSeparatorToBirthdayFooterFirstBaseline");
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setActive:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterString](self, "locationFooterString");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "hk_alignHorizontalConstraintsWithView:insets:", v65, v54, v55, v56, v57);

    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramAvailabilityViewController _birthdayFooterLastBaselineToContinueButton](self, "_birthdayFooterLastBaselineToContinueButton");
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setActive:", 1);

    -[HROnboardingElectrocardiogramAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "lastBaselineAnchor");
  }
  else
  {
    -[HROnboardingElectrocardiogramAvailabilityViewController birthdayFooterLabel](self, "birthdayFooterLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "bottomAnchor");
  }
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  -[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController titleLabel](self, "titleLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "hk_alignHorizontalConstraintsWithView:margin:", v74, 0.0);

  -[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController _birthdayFooterLastBaselineToContinueButton](self, "_birthdayFooterLastBaselineToContinueButton");
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v72);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setActive:", 1);

  -[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "alignBlurViewHorizontalConstraintsWithView:", v79);

  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "bottomAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setActive:", 1);

}

- (id)createHeroView
{
  HROnboardingWristImageView *v2;

  v2 = -[HROnboardingWristImageView initWithImageStyle:]([HROnboardingWristImageView alloc], "initWithImageStyle:", 1);
  -[HROnboardingWristImageView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HROnboardingWristImageView setContentMode:](v2, "setContentMode:", 1);
  -[HROnboardingWristImageView setTimeRemaining:](v2, "setTimeRemaining:", 26.0);
  return v2;
}

- (void)_setupBirthdayEntryView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HROnboardingElectrocardiogramAvailabilityViewController _ageEntryTitleFont](self, "_ageEntryTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  HRHeartRhythmUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AGE_GATE_DATE_OF_BIRTH_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("BirthDate.Title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v7);

  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  v8 = objc_alloc(MEMORY[0x24BE4A750]);
  HRHeartRhythmUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AGE_GATE_FIELD_REQUIRED_PLACEHOLDER"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController _defaultDOB](self, "_defaultDOB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithFrame:initialText:defaultDate:maxYears:", v10, v11, 130, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("BirthDate.Picker"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", v13);

  v14 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v20[0] = v3;
  v20[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithArrangedSubviews:", v15);

  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "setAxis:", HKUIApplicationIsUsingAccessibilityContentSizeCategory());
  objc_msgSend(v16, "setCustomSpacing:afterView:", v3, 28.0);
  LODWORD(v17) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v17);
  -[HROnboardingElectrocardiogramAvailabilityViewController setBirthdayEntryView:](self, "setBirthdayEntryView:", v16);
  -[HROnboardingElectrocardiogramAvailabilityViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController birthdayEntryView](self, "birthdayEntryView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

}

- (BOOL)_meetsAgeRequirement
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[HROnboardingElectrocardiogramAvailabilityViewController dateOfBirth](self, "dateOfBirth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramAvailabilityViewController ageWithDate:](self, "ageWithDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HROnboardingElectrocardiogramAvailabilityViewController ageLimit](self, "ageLimit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "compare:", v5) != -1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)ageWithDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithUTCTimeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramAvailabilityViewController dateOfBirth](self, "dateOfBirth");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_dateOfBirthDateComponentsWithDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "components:fromDateComponents:toDateComponents:options:", 4, v7, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "year"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)compactDatePickerView:(id)a3 didChangeValue:(id)a4
{
  -[HROnboardingElectrocardiogramAvailabilityViewController setDateOfBirth:](self, "setDateOfBirth:", a4);
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HRElectrocardiogramCurrentLocationOnboardingDeterminer *v11;
  void *v12;
  void *v13;
  HRElectrocardiogramCurrentLocationOnboardingDeterminer *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  HROnboardingElectrocardiogramAvailabilityViewController *v20;
  SEL v21;

  v7 = a3;
  if (!a4)
  {
    if (-[HROnboardingElectrocardiogramAvailabilityViewController _meetsAgeRequirement](self, "_meetsAgeRequirement"))
    {
      -[HROnboardingElectrocardiogramAvailabilityViewController _trackElectrocardiogramOnboardingStepIfNeeded:countryCode:algorithmVersion:](self, "_trackElectrocardiogramOnboardingStepIfNeeded:countryCode:algorithmVersion:", 3, 0, 0);
      objc_msgSend(v7, "buttons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setEnabled:", 0);
      -[HROnboardingElectrocardiogramAvailabilityViewController onboardingAvailabilityDeterminer](self, "onboardingAvailabilityDeterminer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = [HRElectrocardiogramCurrentLocationOnboardingDeterminer alloc];
        -[HROnboardingElectrocardiogramAvailabilityViewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "healthStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[HRElectrocardiogramCurrentLocationOnboardingDeterminer initWithHealthStore:](v11, "initWithHealthStore:", v13);
        -[HROnboardingElectrocardiogramAvailabilityViewController setOnboardingAvailabilityDeterminer:](self, "setOnboardingAvailabilityDeterminer:", v14);

      }
      -[HROnboardingElectrocardiogramAvailabilityViewController onboardingAvailabilityDeterminer](self, "onboardingAvailabilityDeterminer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke;
      v18[3] = &unk_24D34AA88;
      v19 = v9;
      v20 = self;
      v21 = a2;
      v16 = v9;
      objc_msgSend(v15, "isElectrocardiogramOnboardingAvailableInCurrentLocationForActiveWatch:", v18);

    }
    else
    {
      -[HROnboardingElectrocardiogramAvailabilityViewController ageIneligiblePromptBodyString](self, "ageIneligiblePromptBodyString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingElectrocardiogramAvailabilityViewController presentAlertWithMessage:](self, "presentAlertWithMessage:", v17);

    }
  }

}

void __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2;
  v15[3] = &unk_24D34AA60;
  v16 = *(id *)(a1 + 32);
  v17 = v9;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v18 = v8;
  v19 = v10;
  v20 = v7;
  v21 = v11;
  v12 = v7;
  v13 = v8;
  v14 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

void __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  uint64_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
  v3 = (id *)(a1 + 40);
  v2 = *(void **)(a1 + 40);
  if (v2 || !*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(v2, "code") == 111)
    {
      v4 = *(void **)(a1 + 56);
      objc_msgSend(v4, "featureDisabledBodyString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presentLearnMoreAlertWithMessage:learnMoreTapped:", v5, &__block_literal_global_0);
    }
    else if (objc_msgSend(*v3, "code") == 109)
    {
      v6 = *(void **)(a1 + 56);
      objc_msgSend(v6, "locationNotFoundPromptBodyString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "locationNotFoundPromptTitleString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentAlertWithMessage:title:", v5, v7);

    }
    else
    {
      if (objc_msgSend(*v3, "code") == 113)
      {
        v13 = *(void **)(a1 + 56);
        objc_msgSend(v13, "watchOSVersionTooLowBodyString");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = objc_msgSend(*(id *)(a1 + 40), "code");
        v13 = *(void **)(a1 + 56);
        if (v15 == 112)
          objc_msgSend(*(id *)(a1 + 56), "deviceNotSupportedBodyString");
        else
          objc_msgSend(*(id *)(a1 + 56), "locationFeatureIneligiblePromptBodyString");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v5 = (void *)v14;
      objc_msgSend(v13, "presentAlertWithMessage:", v14);
    }

    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2_cold_1(a1, v16, (uint64_t *)(a1 + 40));
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 64);
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136446722;
      v22 = "-[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView:didTapButtonAtIndex:]_block_invoke";
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_215454000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}s] Location check: countryCode: %{public}@ algorithmVersion: %{public}@", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 56), "ecgAppInstallability");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_229;
    v17[3] = &unk_24D34AA38;
    v12 = *(void **)(a1 + 64);
    v18 = *(_QWORD *)(a1 + 56);
    v19 = v12;
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v11, "checkElectrocardiogramAppInstallStateWithContext:completion:", v18, v17);

  }
}

void __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BDD2BD8]);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openURL:withOptions:", v1, 0);

}

void __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_229(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x24BDD3010];
    v15 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v15)
        goto LABEL_9;
      v19 = 136446466;
      v20 = "-[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView:didTapButtonAtIndex:]_block_invoke";
      v21 = 2114;
      v22 = v5;
      v16 = "[%{public}s]: Failed to install ECG App with error: %{public}@";
      v17 = v14;
      v18 = 22;
    }
    else
    {
      if (!v15)
        goto LABEL_9;
      v19 = 136446210;
      v20 = "-[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView:didTapButtonAtIndex:]_block_invoke";
      v16 = "[%{public}s]: ECG App install was cancelled";
      v17 = v14;
      v18 = 12;
    }
    _os_log_impl(&dword_215454000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    goto LABEL_9;
  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("HROnboardingElectrocardiogramCountryCodeKey"));

  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("HROnboardingElectrocardiogramAlgorithmVersionKey"));

  objc_msgSend(*(id *)(a1 + 32), "_trackElectrocardiogramOnboardingStepIfNeeded:countryCode:algorithmVersion:", 4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stepForward");

  objc_msgSend(*(id *)(a1 + 32), "ecgAppInstallability");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowInstallingElectrocardiogramWatchApp:", 1);

LABEL_9:
}

- (void)_trackElectrocardiogramOnboardingStepIfNeeded:(int64_t)a3 countryCode:(id)a4 algorithmVersion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  if (-[HROnboardingElectrocardiogramAvailabilityViewController isOnboarding](self, "isOnboarding")
    && !+[HRElectrocardiogramOnboardingManager hasOverriddenOnboardingSettings](HRElectrocardiogramOnboardingManager, "hasOverriddenOnboardingSettings"))
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x24BDD3B70], "onboardingVersionForKnownAlgorithmVersion:", objc_msgSend(v8, "integerValue")));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    +[HRUIAnalyticsManager sharedManager](HRUIAnalyticsManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackElectrocardiogramOnboardingStep:forOnboardingType:onboardingVersion:countryCode:provenance:", a3, 0, v9, v11, -[HROnboardingElectrocardiogramAvailabilityViewController provenance](self, "provenance"));

  }
}

- (void)_updateDateOfBirthDisplay
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[HROnboardingElectrocardiogramAvailabilityViewController dateOfBirth](self, "dateOfBirth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v25 = 0uLL;
    v26 = 0uLL;
    v23 = 0uLL;
    v24 = 0uLL;
    -[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView](self, "stackedButtonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v10, "setEnabled:", 1);
          HKHealthKeyColor();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setBackgroundColor:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }
  }
  else
  {
    v21 = 0uLL;
    v22 = 0uLL;
    *((_QWORD *)&v19 + 1) = 0;
    v20 = 0uLL;
    -[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView](self, "stackedButtonView", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "buttons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v5);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
          objc_msgSend(v17, "setEnabled:", 0);
          objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBackgroundColor:", v18);

        }
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }
  }

}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x24BDF7800];
}

- (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HROnboardingElectrocardiogramAvailabilityViewController _titleFontTextStyle](self, "_titleFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_bodyFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_birthdayPromptFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_footnoteTextStyle
{
  return (id)*MEMORY[0x24BDF77D0];
}

- (id)_footnoteFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HROnboardingElectrocardiogramAvailabilityViewController _footnoteTextStyle](self, "_footnoteTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_titleBottomToBodyTop
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 15.0);
  v4 = v3;

  return v4;
}

- (double)_bodyBottomToAgePromptTop
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 37.0);
  v4 = v3;

  return v4;
}

- (id)_ageEntryTitleFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x24BDF77B0], 2);
}

- (double)_agePromptLastBaselineToAgeEntryTop
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = v3;

  return v4;
}

- (double)_ageEntryTopSeparatorToFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 36.0);
  v4 = v3;

  return v4;
}

- (double)_ageEntryLastBaselineToBottomSeparator
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 24.0);
  v4 = v3;

  return v4;
}

- (double)_bottomSeparatorToBirthdayFooterFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = v3;

  return v4;
}

- (double)_birthdayFooterLastBaselineToContinueButton
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramAvailabilityViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 6.0);
  v4 = v3;

  return v4;
}

- (id)titleString
{
  return HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_1_TITLE"));
}

- (id)bodyString
{
  return HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_1_BODY"));
}

- (id)birthdayFooterString
{
  return HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_1_BIRTHDAY_FOOTNOTE"));
}

- (id)locationFooterString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_LOCATION_FOOTNOTE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)learnMoreString
{
  return 0;
}

- (id)disclaimerString
{
  return 0;
}

- (id)buttonTitleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CONTINUE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ageLimit
{
  return &unk_24D357E80;
}

- (id)ageIneligiblePromptTitleString
{
  return HRUIECGLocalizedString(CFSTR("ECG_AGE_GATE_INELIGIBLE_TITLE"));
}

- (id)ageIneligiblePromptBodyString
{
  return HRUIECGLocalizedString(CFSTR("ECG_AGE_GATE_INELIGIBLE_BODY"));
}

- (id)ageIneligiblePromptAckButtonString
{
  return HRUIECGLocalizedString(CFSTR("ECG_AGE_GATE_INELIGIBLE_ACK_BUTTON"));
}

- (id)locationFeatureIneligiblePromptBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_LOCATION_INELIGIBLE_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locationNotFoundPromptTitleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_LOCATION_NOT_FOUND_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locationNotFoundPromptBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_LOCATION_NOT_FOUND_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)featureDisabledBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_FEATURE_DISABLED_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)deviceNotSupportedBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_DEVICE_NOT_SUPPORTED_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)watchOSVersionTooLowBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_OS_VERSION_TOO_LOW"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HRElectrocardiogramCurrentLocationOnboardingDeterminer)onboardingAvailabilityDeterminer
{
  return self->_onboardingAvailabilityDeterminer;
}

- (void)setOnboardingAvailabilityDeterminer:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingAvailabilityDeterminer, a3);
}

- (HRElectrocardiogramWatchAppInstallability)ecgAppInstallability
{
  return self->_ecgAppInstallability;
}

- (void)setEcgAppInstallability:(id)a3
{
  objc_storeStrong((id *)&self->_ecgAppInstallability, a3);
}

- (UIView)heroView
{
  return self->_heroView;
}

- (void)setHeroView:(id)a3
{
  objc_storeStrong((id *)&self->_heroView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (UILabel)birthdayPromptLabel
{
  return self->_birthdayPromptLabel;
}

- (void)setBirthdayPromptLabel:(id)a3
{
  objc_storeStrong((id *)&self->_birthdayPromptLabel, a3);
}

- (HKSeparatorLineView)birthdayTopSeparator
{
  return self->_birthdayTopSeparator;
}

- (void)setBirthdayTopSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_birthdayTopSeparator, a3);
}

- (UIStackView)birthdayEntryView
{
  return self->_birthdayEntryView;
}

- (void)setBirthdayEntryView:(id)a3
{
  objc_storeStrong((id *)&self->_birthdayEntryView, a3);
}

- (NSDate)dateOfBirth
{
  return self->_dateOfBirth;
}

- (HKSeparatorLineView)birthdayBottomSeparator
{
  return self->_birthdayBottomSeparator;
}

- (void)setBirthdayBottomSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_birthdayBottomSeparator, a3);
}

- (UILabel)birthdayFooterLabel
{
  return self->_birthdayFooterLabel;
}

- (void)setBirthdayFooterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_birthdayFooterLabel, a3);
}

- (UILabel)locationFooterLabel
{
  return self->_locationFooterLabel;
}

- (void)setLocationFooterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationFooterLabel, a3);
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_stackedButtonView, a3);
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, a3);
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_locationFooterLabel, 0);
  objc_storeStrong((id *)&self->_birthdayFooterLabel, 0);
  objc_storeStrong((id *)&self->_birthdayBottomSeparator, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_birthdayEntryView, 0);
  objc_storeStrong((id *)&self->_birthdayTopSeparator, 0);
  objc_storeStrong((id *)&self->_birthdayPromptLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_ecgAppInstallability, 0);
  objc_storeStrong((id *)&self->_onboardingAvailabilityDeterminer, 0);
}

- (id)createLearnMoreExpandedView
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return objc_alloc_init(MEMORY[0x24BDF6F90]);
}

void __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(const char **)(a1 + 72);
  v6 = a2;
  NSStringFromSelector(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  v9 = 138543874;
  v10 = v4;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_215454000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Could not pass location check, Error: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
