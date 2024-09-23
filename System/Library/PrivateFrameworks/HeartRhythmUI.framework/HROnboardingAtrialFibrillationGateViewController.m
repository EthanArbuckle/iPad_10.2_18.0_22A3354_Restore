@implementation HROnboardingAtrialFibrillationGateViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  _BOOL4 v4;
  _BYTE *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  v5 = -[HROnboardingAtrialFibrillationGateViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v8, sel_initForOnboarding_upgradingFromAlgorithmVersion_, a3, a4);
  v6 = v5;
  if (v5)
  {
    v5[1064] = 0;
    if (v4)
      objc_msgSend(v5, "configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation");
  }
  return v6;
}

- (id)initForOnboarding:(BOOL)a3 hasAtrialFibrillationDiagnosis:(id)a4
{
  _BOOL8 v5;
  id v7;
  id *v8;
  id *v9;
  objc_super v11;

  v5 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  v8 = (id *)-[HROnboardingAtrialFibrillationGateViewController initForOnboarding:](&v11, sel_initForOnboarding_, v5);
  v9 = v8;
  if (v8)
  {
    *((_BYTE *)v8 + 1064) = 0;
    if (v5)
      objc_msgSend(v8, "configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation");
    objc_storeStrong(v9 + 143, a4);
  }

  return v9;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  -[HROnboardingAtrialFibrillationGateViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HROnboardingAtrialFibrillationGateViewController _setUpButtonFooterView](self, "_setUpButtonFooterView");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  -[HROnboardingAtrialFibrillationGateViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (!self->_didLayoutSubviewsOnce)
  {
    self->_didLayoutSubviewsOnce = 1;
    -[HROnboardingAtrialFibrillationGateViewController _adjustButtonFooterViewLocationForViewContentHeight](self, "_adjustButtonFooterViewLocationForViewContentHeight");
  }
}

- (void)setUpUI
{
  id v3;
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
  id v14;
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
  id v35;
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
  id v49;
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
  id v77;
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
  objc_super v95;
  _QWORD v96[2];

  v96[1] = *MEMORY[0x24BDAC8D0];
  v95.receiver = self;
  v95.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  -[HROnboardingAtrialFibrillationGateViewController setUpUI](&v95, sel_setUpUI);
  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationGateViewController setTitleLabel:](self, "setTitleLabel:", v3);

  HRHeartRhythmUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);

  -[HROnboardingAtrialFibrillationGateViewController titleFont](self, "titleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  v14 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationGateViewController setBodyLabel:](self, "setBodyLabel:", v14);

  HRHeartRhythmUIFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController bodyLabel](self, "bodyLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

  -[HROnboardingAtrialFibrillationGateViewController bodyLabel](self, "bodyLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextAlignment:", 1);

  -[HROnboardingAtrialFibrillationGateViewController _bodyFont](self, "_bodyFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController bodyLabel](self, "bodyLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v19);

  -[HROnboardingAtrialFibrillationGateViewController bodyLabel](self, "bodyLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController bodyLabel](self, "bodyLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationGateViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("GetStartedSubtitle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController bodyLabel](self, "bodyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAccessibilityIdentifier:", v23);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController bodyLabel](self, "bodyLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  objc_msgSend(MEMORY[0x24BE4A838], "_hrafibgate_separatorView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController setBirthdayTopSeparator:](self, "setBirthdayTopSeparator:", v27);

  -[HROnboardingAtrialFibrillationGateViewController birthdayTopSeparator](self, "birthdayTopSeparator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayTopSeparator](self, "birthdayTopSeparator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v30);

  -[HROnboardingAtrialFibrillationGateViewController _setUpBirthdayEntryView](self, "_setUpBirthdayEntryView");
  objc_msgSend(MEMORY[0x24BE4A838], "_hrafibgate_separatorView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController setBirthdayBottomSeparator:](self, "setBirthdayBottomSeparator:", v31);

  -[HROnboardingAtrialFibrillationGateViewController birthdayBottomSeparator](self, "birthdayBottomSeparator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayBottomSeparator](self, "birthdayBottomSeparator");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v34);

  v35 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationGateViewController setBirthdayFooterLabel:](self, "setBirthdayFooterLabel:", v35);

  HRHeartRhythmUIFrameworkBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_BIRTHDAY_FOOTER"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setText:", v37);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTextColor:", v39);

  -[HROnboardingAtrialFibrillationGateViewController _footnoteFont](self, "_footnoteFont");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFont:", v41);

  -[HROnboardingAtrialFibrillationGateViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationGateViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("AgeRestriction"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setAccessibilityIdentifier:", v45);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addSubview:", v48);

  v49 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationGateViewController setDiagnosisPromptLabel:](self, "setDiagnosisPromptLabel:", v49);

  HRHeartRhythmUIFrameworkBundle();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_DIAGNOSIS_PROMPT"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisPromptLabel](self, "diagnosisPromptLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setText:", v51);

  -[HROnboardingAtrialFibrillationGateViewController _diagnosisPromptFont](self, "_diagnosisPromptFont");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisPromptLabel](self, "diagnosisPromptLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFont:", v53);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisPromptLabel](self, "diagnosisPromptLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisPromptLabel](self, "diagnosisPromptLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationGateViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("PriorAFibDiagnosis"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisPromptLabel](self, "diagnosisPromptLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setAccessibilityIdentifier:", v57);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisPromptLabel](self, "diagnosisPromptLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addSubview:", v60);

  objc_msgSend(MEMORY[0x24BE4A838], "_hrafibgate_separatorView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController setDiagnosisTopSeparator:](self, "setDiagnosisTopSeparator:", v61);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisTopSeparator](self, "diagnosisTopSeparator");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisTopSeparator](self, "diagnosisTopSeparator");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addSubview:", v64);

  HRHeartRhythmUIFrameworkBundle();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_DIAGNOSIS_YES"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _setUpDiagnosisRowWithTitle:value:](self, "_setUpDiagnosisRowWithTitle:value:", v66, 1);

  objc_msgSend(MEMORY[0x24BE4A838], "_hrafibgate_separatorView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController setDiagnosisMiddleSeparator:](self, "setDiagnosisMiddleSeparator:", v67);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisMiddleSeparator](self, "diagnosisMiddleSeparator");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisMiddleSeparator](self, "diagnosisMiddleSeparator");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addSubview:", v70);

  HRHeartRhythmUIFrameworkBundle();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_DIAGNOSIS_NO"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _setUpDiagnosisRowWithTitle:value:](self, "_setUpDiagnosisRowWithTitle:value:", v72, 0);

  objc_msgSend(MEMORY[0x24BE4A838], "_hrafibgate_separatorView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController setDiagnosisBottomSeparator:](self, "setDiagnosisBottomSeparator:", v73);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisBottomSeparator](self, "diagnosisBottomSeparator");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisBottomSeparator](self, "diagnosisBottomSeparator");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addSubview:", v76);

  v77 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationGateViewController setDiagnosisFooterLabel:](self, "setDiagnosisFooterLabel:", v77);

  HRHeartRhythmUIFrameworkBundle();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_DIAGNOSIS_FOOTER"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisFooterLabel](self, "diagnosisFooterLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setText:", v79);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisFooterLabel](self, "diagnosisFooterLabel");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setTextColor:", v81);

  -[HROnboardingAtrialFibrillationGateViewController _footnoteFont](self, "_footnoteFont");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisFooterLabel](self, "diagnosisFooterLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setFont:", v83);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisFooterLabel](self, "diagnosisFooterLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisFooterLabel](self, "diagnosisFooterLabel");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisFooterLabel](self, "diagnosisFooterLabel");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "addSubview:", v88);

  HRHeartRhythmUIFrameworkBundle();
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CONTINUE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v90;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 1);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:", v91, 0, 0, self);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController setStackedButtonView:](self, "setStackedButtonView:", v92);

  -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setFixedBottomButtonSpacing:", 1);

  -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationGateViewController _updateButtonState](self, "_updateButtonState");
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
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  objc_super v132;

  v132.receiver = self;
  v132.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  -[HROnboardingAtrialFibrillationGateViewController setUpConstraints](&v132, sel_setUpConstraints);
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController contentTop](self, "contentTop");
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController bodyLabel](self, "bodyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_alignHorizontalConstraintsWithView:margin:", v11, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController bodyLabel](self, "bodyLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 15.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController birthdayTopSeparator](self, "birthdayTopSeparator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController birthdayTopSeparator](self, "birthdayTopSeparator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController bodyLabel](self, "bodyLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 37.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController birthdayEntryView](self, "birthdayEntryView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hk_alignHorizontalConstraintsWithView:margin:", v25, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController birthdayEntryView](self, "birthdayEntryView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstBaselineAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayTopSeparator](self, "birthdayTopSeparator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _ageEntryTopSeparatorToFirstBaseline](self, "_ageEntryTopSeparatorToFirstBaseline");
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController birthdayBottomSeparator](self, "birthdayBottomSeparator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hk_alignHorizontalConstraintsWithView:margin:", v32, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController birthdayBottomSeparator](self, "birthdayBottomSeparator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayEntryView](self, "birthdayEntryView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "lastBaselineAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _ageEntryLastBaselineToBottomSeparator](self, "_ageEntryLastBaselineToBottomSeparator");
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "hk_alignHorizontalConstraintsWithView:margin:", v39, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "firstBaselineAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayBottomSeparator](self, "birthdayBottomSeparator");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _separatorToFooterFirstBaseline](self, "_separatorToFooterFirstBaseline");
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisPromptLabel](self, "diagnosisPromptLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "hk_alignHorizontalConstraintsWithView:margin:", v46, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisPromptLabel](self, "diagnosisPromptLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "firstBaselineAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayFooterLabel](self, "birthdayFooterLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _ageEntryFooterToDiagnosisPromptFirstBaseline](self, "_ageEntryFooterToDiagnosisPromptFirstBaseline");
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisTopSeparator](self, "diagnosisTopSeparator");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "hk_alignHorizontalConstraintsWithView:margin:", v53, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisTopSeparator](self, "diagnosisTopSeparator");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisPromptLabel](self, "diagnosisPromptLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "lastBaselineAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _diagnosisPromptLastBaselineToDiagnosisTop](self, "_diagnosisPromptLastBaselineToDiagnosisTop");
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisYesBackground](self, "diagnosisYesBackground");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "hk_alignHorizontalConstraintsWithView:margin:", v60, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisYesBackground](self, "diagnosisYesBackground");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisTopSeparator](self, "diagnosisTopSeparator");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisYesRow](self, "diagnosisYesRow");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "hk_alignHorizontalConstraintsWithView:margin:", v67, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisYesLabel](self, "diagnosisYesLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "firstBaselineAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisTopSeparator](self, "diagnosisTopSeparator");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _diagnosisTopSeparatorToFirstBaseline](self, "_diagnosisTopSeparatorToFirstBaseline");
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisYesBackground](self, "diagnosisYesBackground");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisMiddleSeparator](self, "diagnosisMiddleSeparator");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisMiddleSeparator](self, "diagnosisMiddleSeparator");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisMiddleSeparator](self, "diagnosisMiddleSeparator");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "trailingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisMiddleSeparator](self, "diagnosisMiddleSeparator");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "topAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisYesLabel](self, "diagnosisYesLabel");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "lastBaselineAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _diagnosisLastBaselineToBottomSeparator](self, "_diagnosisLastBaselineToBottomSeparator");
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisNoBackground](self, "diagnosisNoBackground");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "hk_alignHorizontalConstraintsWithView:margin:", v94, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisNoBackground](self, "diagnosisNoBackground");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisMiddleSeparator](self, "diagnosisMiddleSeparator");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "bottomAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisNoRow](self, "diagnosisNoRow");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "hk_alignHorizontalConstraintsWithView:margin:", v101, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisNoLabel](self, "diagnosisNoLabel");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "firstBaselineAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisMiddleSeparator](self, "diagnosisMiddleSeparator");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "bottomAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _diagnosisTopSeparatorToFirstBaseline](self, "_diagnosisTopSeparatorToFirstBaseline");
  objc_msgSend(v103, "constraintEqualToAnchor:constant:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisNoBackground](self, "diagnosisNoBackground");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "bottomAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisBottomSeparator](self, "diagnosisBottomSeparator");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "topAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisBottomSeparator](self, "diagnosisBottomSeparator");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "hk_alignHorizontalConstraintsWithView:margin:", v113, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisBottomSeparator](self, "diagnosisBottomSeparator");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "topAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisNoLabel](self, "diagnosisNoLabel");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "lastBaselineAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _diagnosisLastBaselineToBottomSeparator](self, "_diagnosisLastBaselineToBottomSeparator");
  objc_msgSend(v115, "constraintEqualToAnchor:constant:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisFooterLabel](self, "diagnosisFooterLabel");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "hk_alignHorizontalConstraintsWithView:margin:", v120, 0.0);

  -[HROnboardingAtrialFibrillationGateViewController diagnosisFooterLabel](self, "diagnosisFooterLabel");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "firstBaselineAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisBottomSeparator](self, "diagnosisBottomSeparator");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "bottomAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _separatorToFooterFirstBaseline](self, "_separatorToFooterFirstBaseline");
  objc_msgSend(v122, "constraintEqualToAnchor:constant:", v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setActive:", 1);

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "bottomAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisFooterLabel](self, "diagnosisFooterLabel");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "bottomAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _diagnosisFooterLabelToContinueButton](self, "_diagnosisFooterLabelToContinueButton");
  objc_msgSend(v127, "constraintEqualToAnchor:constant:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v130);

  -[HROnboardingAtrialFibrillationGateViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setActive:", 1);

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

- (void)_setUpBirthdayEntryView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HROnboardingAtrialFibrillationGateViewController _ageEntryTitleFont](self, "_ageEntryTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  HRHeartRhythmUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AGE_GATE_DATE_OF_BIRTH_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v6);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  v7 = objc_alloc(MEMORY[0x24BE4A750]);
  HRHeartRhythmUIFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AGE_GATE_FIELD_REQUIRED_PLACEHOLDER"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController _defaultDOB](self, "_defaultDOB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithFrame:initialText:defaultDate:maxYears:", v9, v10, 130, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v18[0] = v3;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArrangedSubviews:", v13);

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setAxis:", HKUIApplicationIsUsingAccessibilityContentSizeCategory());
  objc_msgSend(v14, "setCustomSpacing:afterView:", v3, 28.0);
  LODWORD(v15) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v15);
  -[HROnboardingAtrialFibrillationGateViewController setBirthdayEntryView:](self, "setBirthdayEntryView:", v14);
  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController birthdayEntryView](self, "birthdayEntryView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

}

- (void)setDateOfBirth:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSDate isEqual:](self->_dateOfBirth, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dateOfBirth, a3);
    -[HROnboardingAtrialFibrillationGateViewController _updateButtonState](self, "_updateButtonState");
  }

}

- (void)setDiagnosis:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSNumber isEqual:](self->_diagnosis, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_diagnosis, a3);
    -[HROnboardingAtrialFibrillationGateViewController _updateButtonState](self, "_updateButtonState");
  }

}

- (void)compactDatePickerView:(id)a3 didChangeValue:(id)a4
{
  -[HROnboardingAtrialFibrillationGateViewController setDateOfBirth:](self, "setDateOfBirth:", a4);
}

- (void)_setUpDiagnosisRowWithTitle:(id)a3 value:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSNumber *prefilledDiagnosis;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];

  v4 = a4;
  v28[2] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BDF6F90];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:scale:");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "tertiaryLabelColor");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("circle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  v26 = (void *)v9;
  objc_msgSend(v12, "setPreferredSymbolConfiguration:", v9);
  objc_msgSend(v12, "setImage:", v11);
  v25 = (void *)v10;
  objc_msgSend(v12, "setTintColor:", v10);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v13) = 1148846080;
  objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 0, v13);
  LODWORD(v14) = 1148846080;
  objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 1, v14);
  LODWORD(v15) = 1148846080;
  objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 0, v15);
  LODWORD(v16) = 1148846080;
  objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 1, v16);
  v17 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HROnboardingAtrialFibrillationGateViewController _ageEntryTitleFont](self, "_ageEntryTitleFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v18);

  objc_msgSend(v17, "setText:", v7);
  objc_msgSend(v17, "setNumberOfLines:", 0);
  v19 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v28[0] = v12;
  v28[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithArrangedSubviews:", v20);

  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v21, "setAxis:", 0);
  objc_msgSend(v21, "setCustomSpacing:afterView:", v12, 12.0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__diagnosisRowTapped_);
  objc_msgSend(v8, "addGestureRecognizer:", v22);
  if (v4)
  {
    -[HROnboardingAtrialFibrillationGateViewController setDiagnosisYesBackground:](self, "setDiagnosisYesBackground:", v8);
    -[HROnboardingAtrialFibrillationGateViewController setDiagnosisYesRow:](self, "setDiagnosisYesRow:", v21);
    -[HROnboardingAtrialFibrillationGateViewController setDiagnosisYesCheckmark:](self, "setDiagnosisYesCheckmark:", v12);
    -[HROnboardingAtrialFibrillationGateViewController setDiagnosisYesLabel:](self, "setDiagnosisYesLabel:", v17);
  }
  else
  {
    -[HROnboardingAtrialFibrillationGateViewController setDiagnosisNoBackground:](self, "setDiagnosisNoBackground:", v8);
    -[HROnboardingAtrialFibrillationGateViewController setDiagnosisNoRow:](self, "setDiagnosisNoRow:", v21);
    -[HROnboardingAtrialFibrillationGateViewController setDiagnosisNoCheckmark:](self, "setDiagnosisNoCheckmark:", v12);
    -[HROnboardingAtrialFibrillationGateViewController setDiagnosisNoLabel:](self, "setDiagnosisNoLabel:", v17);
  }
  objc_msgSend(v8, "addSubview:", v21);
  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v8);

  prefilledDiagnosis = self->_prefilledDiagnosis;
  if (prefilledDiagnosis && -[NSNumber BOOLValue](prefilledDiagnosis, "BOOLValue") == v4)
    -[HROnboardingAtrialFibrillationGateViewController _diagnosisRowTapped:](self, "_diagnosisRowTapped:", v22);

}

- (void)_diagnosisRowTapped:(id)a3
{
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:scale:", v4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:scale:", v4, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "tertiaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("circle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController diagnosisYesBackground](self, "diagnosisYesBackground");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    -[HROnboardingAtrialFibrillationGateViewController diagnosisYesCheckmark](self, "diagnosisYesCheckmark");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPreferredSymbolConfiguration:", v5);

    -[HROnboardingAtrialFibrillationGateViewController diagnosisYesCheckmark](self, "diagnosisYesCheckmark");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:", v7);

    -[HROnboardingAtrialFibrillationGateViewController diagnosisYesCheckmark](self, "diagnosisYesCheckmark");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTintColor:", v6);

    -[HROnboardingAtrialFibrillationGateViewController diagnosisNoCheckmark](self, "diagnosisNoCheckmark");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPreferredSymbolConfiguration:", v8);

    -[HROnboardingAtrialFibrillationGateViewController diagnosisNoCheckmark](self, "diagnosisNoCheckmark");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setImage:", v10);

    -[HROnboardingAtrialFibrillationGateViewController diagnosisNoCheckmark](self, "diagnosisNoCheckmark");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDBD1C8];
  }
  else
  {
    -[HROnboardingAtrialFibrillationGateViewController diagnosisNoCheckmark](self, "diagnosisNoCheckmark");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPreferredSymbolConfiguration:", v5);

    -[HROnboardingAtrialFibrillationGateViewController diagnosisNoCheckmark](self, "diagnosisNoCheckmark");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v7);

    -[HROnboardingAtrialFibrillationGateViewController diagnosisNoCheckmark](self, "diagnosisNoCheckmark");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTintColor:", v6);

    -[HROnboardingAtrialFibrillationGateViewController diagnosisYesCheckmark](self, "diagnosisYesCheckmark");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreferredSymbolConfiguration:", v8);

    -[HROnboardingAtrialFibrillationGateViewController diagnosisYesCheckmark](self, "diagnosisYesCheckmark");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v10);

    -[HROnboardingAtrialFibrillationGateViewController diagnosisYesCheckmark](self, "diagnosisYesCheckmark");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDBD1C0];
  }
  objc_msgSend(v18, "setTintColor:", v9);

  -[HROnboardingAtrialFibrillationGateViewController setDiagnosis:](self, "setDiagnosis:", v19);
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (!a4)
  {
    if (-[HROnboardingAtrialFibrillationGateViewController _meetsAgeRequirement](self, "_meetsAgeRequirement", a3))
    {
      if (-[HROnboardingAtrialFibrillationGateViewController _meetsDiagnosisRequirement](self, "_meetsDiagnosisRequirement"))
      {
        -[HROnboardingAtrialFibrillationGateViewController delegate](self, "delegate");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stepForward");
LABEL_8:

        return;
      }
      v9 = (void *)MEMORY[0x24BDF67F0];
      -[HROnboardingAtrialFibrillationGateViewController diagnosisIneligiblePromptBodyString](self, "diagnosisIneligiblePromptBodyString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", 0, v10, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x24BDF67E8];
      -[HROnboardingAtrialFibrillationGateViewController diagnosisIneligiblePromptAckButtonString](self, "diagnosisIneligiblePromptAckButtonString");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)MEMORY[0x24BDF67F0];
      -[HROnboardingAtrialFibrillationGateViewController ageIneligiblePromptBodyString](self, "ageIneligiblePromptBodyString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", 0, v6, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x24BDF67E8];
      -[HROnboardingAtrialFibrillationGateViewController ageIneligiblePromptAckButtonString](self, "ageIneligiblePromptAckButtonString");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v8;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v12);

    -[HROnboardingAtrialFibrillationGateViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
    goto LABEL_8;
  }
}

- (void)_updateButtonState
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HROnboardingAtrialFibrillationGateViewController dateOfBirth](self, "dateOfBirth");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[HROnboardingAtrialFibrillationGateViewController diagnosis](self, "diagnosis"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "setEnabled:", 1);
          HKHealthKeyColor();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setBackgroundColor:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v7);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
          objc_msgSend(v19, "setEnabled:", 0);
          objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setBackgroundColor:", v20);

        }
        v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }
  }

}

- (void)_setUpButtonFooterView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  -[HROnboardingAtrialFibrillationGateViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

  -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignBlurViewHorizontalConstraintsWithView:", v5);

  -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBlurHidden:", 0);

}

- (void)_adjustButtonFooterViewLocationForViewContentHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
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
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  -[HROnboardingAtrialFibrillationGateViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:fromView:", v15, v8, v10, v12, v14);
  v17 = v16;

  -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;
  -[HROnboardingAtrialFibrillationGateViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safeAreaInsets");
  v23 = v17 - v22;

  if (v20 > v23)
  {
    -[HROnboardingAtrialFibrillationGateViewController removeFooterView](self, "removeFooterView");
    -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBlurHidden:", 1);

    -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v26);

    -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationGateViewController titleLabel](self, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hk_alignHorizontalConstraintsWithView:margin:", v28, 0.0);

    -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationGateViewController diagnosisFooterLabel](self, "diagnosisFooterLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, 20.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    v34 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingAtrialFibrillationGateViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "deactivateConstraints:", v36);

    -[HROnboardingAtrialFibrillationGateViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
    -[HROnboardingAtrialFibrillationGateViewController contentView](self, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationGateViewController stackedButtonView](self, "stackedButtonView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationGateViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v41);

    -[HROnboardingAtrialFibrillationGateViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

  }
}

- (BOOL)_meetsAgeRequirement
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[HROnboardingAtrialFibrillationGateViewController dateOfBirth](self, "dateOfBirth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewController ageWithDate:](self, "ageWithDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HROnboardingAtrialFibrillationGateViewController ageLimit](self, "ageLimit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "compare:", v5) != -1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_meetsDiagnosisRequirement
{
  void *v3;
  void *v4;
  int v5;

  -[HROnboardingAtrialFibrillationGateViewController diagnosis](self, "diagnosis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HROnboardingAtrialFibrillationGateViewController diagnosis](self, "diagnosis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
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
    -[HROnboardingAtrialFibrillationGateViewController dateOfBirth](self, "dateOfBirth");
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

- (id)ageLimit
{
  return &unk_24D357E98;
}

- (id)ageIneligiblePromptTitleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_AGE_GATE_INELIGIBLE_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ageIneligiblePromptBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_AGE_GATE_INELIGIBLE_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ageIneligiblePromptAckButtonString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_AGE_GATE_INELIGIBLE_ACK_BUTTON"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)diagnosisIneligiblePromptTitleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_DIAGNOSIS_GATE_INELIGIBLE_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)diagnosisIneligiblePromptBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_DIAGNOSIS_GATE_INELIGIBLE_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)diagnosisIneligiblePromptAckButtonString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_DIAGNOSIS_GATE_INELIGIBLE_ACK_BUTTON"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axidForElementWithString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BirthDate.%@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_ageEntryTopSeparatorToFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationGateViewController _bodyFont](self, "_bodyFont");
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

  -[HROnboardingAtrialFibrillationGateViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 24.0);
  v4 = v3;

  return v4;
}

- (double)_ageEntryFooterToDiagnosisPromptFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationGateViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 48.0);
  v4 = v3;

  return v4;
}

- (double)_diagnosisPromptLastBaselineToDiagnosisTop
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationGateViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 24.0);
  v4 = v3;

  return v4;
}

- (double)_diagnosisTopSeparatorToFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationGateViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 36.0);
  v4 = v3;

  return v4;
}

- (double)_diagnosisLastBaselineToBottomSeparator
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationGateViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 24.0);
  v4 = v3;

  return v4;
}

- (double)_separatorToFooterFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationGateViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = v3;

  return v4;
}

- (double)_diagnosisFooterLabelToContinueButton
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationGateViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 44.0);
  v4 = v3;

  return v4;
}

- (id)_bodyFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
}

- (id)_ageEntryTitleFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x24BDF77B0], 2);
}

- (id)_diagnosisPromptFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x24BDF77B0], 2);
}

- (id)_footnoteFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
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

- (UILabel)birthdayFooterLabel
{
  return self->_birthdayFooterLabel;
}

- (void)setBirthdayFooterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_birthdayFooterLabel, a3);
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

- (UILabel)diagnosisPromptLabel
{
  return self->_diagnosisPromptLabel;
}

- (void)setDiagnosisPromptLabel:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisPromptLabel, a3);
}

- (NSNumber)diagnosis
{
  return self->_diagnosis;
}

- (NSNumber)prefilledDiagnosis
{
  return self->_prefilledDiagnosis;
}

- (void)setPrefilledDiagnosis:(id)a3
{
  objc_storeStrong((id *)&self->_prefilledDiagnosis, a3);
}

- (HKSeparatorLineView)diagnosisTopSeparator
{
  return self->_diagnosisTopSeparator;
}

- (void)setDiagnosisTopSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisTopSeparator, a3);
}

- (UIView)diagnosisYesBackground
{
  return self->_diagnosisYesBackground;
}

- (void)setDiagnosisYesBackground:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisYesBackground, a3);
}

- (UIStackView)diagnosisYesRow
{
  return self->_diagnosisYesRow;
}

- (void)setDiagnosisYesRow:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisYesRow, a3);
}

- (UIImageView)diagnosisYesCheckmark
{
  return self->_diagnosisYesCheckmark;
}

- (void)setDiagnosisYesCheckmark:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisYesCheckmark, a3);
}

- (UILabel)diagnosisYesLabel
{
  return self->_diagnosisYesLabel;
}

- (void)setDiagnosisYesLabel:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisYesLabel, a3);
}

- (HKSeparatorLineView)diagnosisMiddleSeparator
{
  return self->_diagnosisMiddleSeparator;
}

- (void)setDiagnosisMiddleSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisMiddleSeparator, a3);
}

- (UIView)diagnosisNoBackground
{
  return self->_diagnosisNoBackground;
}

- (void)setDiagnosisNoBackground:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisNoBackground, a3);
}

- (UIStackView)diagnosisNoRow
{
  return self->_diagnosisNoRow;
}

- (void)setDiagnosisNoRow:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisNoRow, a3);
}

- (UIImageView)diagnosisNoCheckmark
{
  return self->_diagnosisNoCheckmark;
}

- (void)setDiagnosisNoCheckmark:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisNoCheckmark, a3);
}

- (UILabel)diagnosisNoLabel
{
  return self->_diagnosisNoLabel;
}

- (void)setDiagnosisNoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisNoLabel, a3);
}

- (HKSeparatorLineView)diagnosisBottomSeparator
{
  return self->_diagnosisBottomSeparator;
}

- (void)setDiagnosisBottomSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisBottomSeparator, a3);
}

- (UILabel)diagnosisFooterLabel
{
  return self->_diagnosisFooterLabel;
}

- (void)setDiagnosisFooterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisFooterLabel, a3);
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

- (BOOL)didLayoutSubviewsOnce
{
  return self->_didLayoutSubviewsOnce;
}

- (void)setDidLayoutSubviewsOnce:(BOOL)a3
{
  self->_didLayoutSubviewsOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_diagnosisFooterLabel, 0);
  objc_storeStrong((id *)&self->_diagnosisBottomSeparator, 0);
  objc_storeStrong((id *)&self->_diagnosisNoLabel, 0);
  objc_storeStrong((id *)&self->_diagnosisNoCheckmark, 0);
  objc_storeStrong((id *)&self->_diagnosisNoRow, 0);
  objc_storeStrong((id *)&self->_diagnosisNoBackground, 0);
  objc_storeStrong((id *)&self->_diagnosisMiddleSeparator, 0);
  objc_storeStrong((id *)&self->_diagnosisYesLabel, 0);
  objc_storeStrong((id *)&self->_diagnosisYesCheckmark, 0);
  objc_storeStrong((id *)&self->_diagnosisYesRow, 0);
  objc_storeStrong((id *)&self->_diagnosisYesBackground, 0);
  objc_storeStrong((id *)&self->_diagnosisTopSeparator, 0);
  objc_storeStrong((id *)&self->_prefilledDiagnosis, 0);
  objc_storeStrong((id *)&self->_diagnosis, 0);
  objc_storeStrong((id *)&self->_diagnosisPromptLabel, 0);
  objc_storeStrong((id *)&self->_birthdayBottomSeparator, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_birthdayFooterLabel, 0);
  objc_storeStrong((id *)&self->_birthdayEntryView, 0);
  objc_storeStrong((id *)&self->_birthdayTopSeparator, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
