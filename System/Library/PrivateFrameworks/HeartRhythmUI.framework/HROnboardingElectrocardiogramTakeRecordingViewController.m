@implementation HROnboardingElectrocardiogramTakeRecordingViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  _BOOL4 v4;
  _BYTE *v5;
  _BYTE *v6;
  BOOL v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewController;
  v5 = -[HROnboardingElectrocardiogramTakeRecordingViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v10, sel_initForOnboarding_upgradingFromAlgorithmVersion_, a3, a4);
  v6 = v5;
  if (v5)
    v7 = !v4;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend(v5, "setRightButtonType:", 4);
    objc_msgSend(v6, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidesBackButton:", 1);

    v6[1064] = 0;
  }
  return v6;
}

- (id)identifierBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("Onboarding.HowToTake"));
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewController;
  -[HROnboardingElectrocardiogramTakeRecordingViewController viewDidLoad](&v8, sel_viewDidLoad);
  if (-[HROnboardingElectrocardiogramTakeRecordingViewController isOnboarding](self, "isOnboarding"))
  {
    v3 = objc_alloc(MEMORY[0x24BDD3C70]);
    -[HROnboardingElectrocardiogramTakeRecordingViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "healthStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithHealthStore:", v5);
    -[HROnboardingElectrocardiogramTakeRecordingViewController setAvailability:](self, "setAvailability:", v6);

    -[HROnboardingElectrocardiogramTakeRecordingViewController availability](self, "availability");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addHeartRhythmAvailabilityObserver:", self);

    -[HROnboardingElectrocardiogramTakeRecordingViewController _setUpElectrocardiogramQuery](self, "_setUpElectrocardiogramQuery");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewController;
  -[HROnboardingElectrocardiogramTakeRecordingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (-[HROnboardingElectrocardiogramTakeRecordingViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingElectrocardiogramTakeRecordingViewController availability](self, "availability");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeHeartRhythmAvailabilityObserver:", self);

    -[HROnboardingElectrocardiogramTakeRecordingViewController _stopElectrocardiogramQuery](self, "_stopElectrocardiogramQuery");
  }
}

- (void)setUpUI
{
  HROnboardingWristImageView *v3;
  void *v4;
  void *v5;
  id v6;
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
  id v21;
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
  HRImageLabel *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  HRImageLabel *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
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
  HRImageLabel *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  HRImageLabel *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
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
  objc_super v98;

  v98.receiver = self;
  v98.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewController;
  -[HROnboardingElectrocardiogramTakeRecordingViewController setUpUI](&v98, sel_setUpUI);
  v3 = -[HROnboardingWristImageView initWithImageStyle:]([HROnboardingWristImageView alloc], "initWithImageStyle:", 1);
  -[HROnboardingWristImageView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HROnboardingWristImageView setContentMode:](v3, "setContentMode:", 1);
  -[HROnboardingWristImageView setTimeRemaining:](v3, "setTimeRemaining:", 26.0);
  -[HROnboardingElectrocardiogramTakeRecordingViewController setAssetView:](self, "setAssetView:", v3);
  -[HROnboardingElectrocardiogramTakeRecordingViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController assetView](self, "assetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramTakeRecordingViewController setTitleLabel:](self, "setTitleLabel:", v6);

  -[HROnboardingElectrocardiogramTakeRecordingViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController _titleForOnboarding:](self, "_titleForOnboarding:", objc_msgSend(v7, "firstTimeOnboarding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController _titleFont](self, "_titleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController identifierBundle](self, "identifierBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingString:", CFSTR(".Title"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", v17);

  -[HROnboardingElectrocardiogramTakeRecordingViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  v21 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramTakeRecordingViewController setBodyLabel:](self, "setBodyLabel:", v21);

  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_5_BODY"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v22);

  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextAlignment:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController _bodyFont](self, "_bodyFont");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFont:", v25);

  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController identifierBundle](self, "identifierBundle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringByAppendingString:", CFSTR(".Description"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAccessibilityIdentifier:", v31);

  -[HROnboardingElectrocardiogramTakeRecordingViewController contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v34);

  v35 = [HRImageLabel alloc];
  objc_msgSend(MEMORY[0x24BDF6AC8], "hrui_ECGAppIconImage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController _takeRecordingImageDimension](self, "_takeRecordingImageDimension");
  v38 = v37;
  v40 = v39;
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_5_LIST_ITEM_STEP-1"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[HRImageLabel initWithImage:size:text:](v35, "initWithImage:size:text:", v36, v41, v38, v40);
  -[HROnboardingElectrocardiogramTakeRecordingViewController setRecordingStep1ImageLabel:](self, "setRecordingStep1ImageLabel:", v42);

  -[HROnboardingElectrocardiogramTakeRecordingViewController _takeRecordingImageDimension](self, "_takeRecordingImageDimension");
  v44 = v43 * 0.5;
  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "imageView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "hrui_maskAllCornersWithRadius:", v44);

  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBoldText:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setImageAlignment:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v50 = objc_msgSend(v49, "CGColor");
  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "imageView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setBorderColor:", v50);

  HKUIOnePixel();
  v55 = v54;
  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "imageView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "layer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setBorderWidth:", v55);

  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController identifierBundle](self, "identifierBundle");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "stringByAppendingString:", CFSTR(".StepOne"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "textLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setAccessibilityIdentifier:", v61);

  -[HROnboardingElectrocardiogramTakeRecordingViewController contentView](self, "contentView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addSubview:", v65);

  v66 = [HRImageLabel alloc];
  objc_msgSend(MEMORY[0x24BDF6AC8], "hrui_fingerCrownImage");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController _takeRecordingImageDimension](self, "_takeRecordingImageDimension");
  v69 = v68;
  v71 = v70;
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_5_LIST_ITEM_STEP-2"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = -[HRImageLabel initWithImage:size:text:](v66, "initWithImage:size:text:", v67, v72, v69, v71);
  -[HROnboardingElectrocardiogramTakeRecordingViewController setRecordingStep2ImageLabel:](self, "setRecordingStep2ImageLabel:", v73);

  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep2ImageLabel](self, "recordingStep2ImageLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setBoldText:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep2ImageLabel](self, "recordingStep2ImageLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setImageAlignment:", 0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep2ImageLabel](self, "recordingStep2ImageLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController identifierBundle](self, "identifierBundle");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "stringByAppendingString:", CFSTR(".StepTwo"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep2ImageLabel](self, "recordingStep2ImageLabel");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "textLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setAccessibilityIdentifier:", v78);

  -[HROnboardingElectrocardiogramTakeRecordingViewController contentView](self, "contentView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep2ImageLabel](self, "recordingStep2ImageLabel");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "addSubview:", v82);

  v83 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramTakeRecordingViewController setWristSettingsLabel:](self, "setWristSettingsLabel:", v83);

  v84 = (void *)MEMORY[0x24BDD1688];
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_5_FOOTER"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = *MEMORY[0x24BDF7810];
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_5_BOLD_FOOTER"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "hrui_attributedStringForText:style:color:boldText:", v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController wristSettingsLabel](self, "wristSettingsLabel");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setAttributedText:", v89);

  -[HROnboardingElectrocardiogramTakeRecordingViewController wristSettingsLabel](self, "wristSettingsLabel");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController wristSettingsLabel](self, "wristSettingsLabel");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController identifierBundle](self, "identifierBundle");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "stringByAppendingString:", CFSTR(".Footer"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController wristSettingsLabel](self, "wristSettingsLabel");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setAccessibilityIdentifier:", v94);

  -[HROnboardingElectrocardiogramTakeRecordingViewController contentView](self, "contentView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController wristSettingsLabel](self, "wristSettingsLabel");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "addSubview:", v97);

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
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewController;
  -[HROnboardingElectrocardiogramTakeRecordingViewController setUpConstraints](&v50, sel_setUpConstraints);
  -[HROnboardingElectrocardiogramTakeRecordingViewController assetView](self, "assetView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController assetView](self, "assetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v10, "hrui_alignHorizontalConstraintsWithView:insets:", v11);

  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController assetView](self, "assetView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 29.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 15.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hk_alignHorizontalConstraintsWithView:margin:", v25, 0.0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController bodyLabel](self, "bodyLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, 20.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep2ImageLabel](self, "recordingStep2ImageLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hk_alignHorizontalConstraintsWithView:margin:", v32, 0.0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep2ImageLabel](self, "recordingStep2ImageLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep1ImageLabel](self, "recordingStep1ImageLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 20.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController wristSettingsLabel](self, "wristSettingsLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController titleLabel](self, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "hk_alignHorizontalConstraintsWithView:margin:", v39, 0.0);

  -[HROnboardingElectrocardiogramTakeRecordingViewController wristSettingsLabel](self, "wristSettingsLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController recordingStep2ImageLabel](self, "recordingStep2ImageLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43, 20.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[HROnboardingElectrocardiogramTakeRecordingViewController contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController wristSettingsLabel](self, "wristSettingsLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, *MEMORY[0x24BE4A138]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

}

- (void)skipButtonTapped:(id)a3
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
  _QWORD v14[5];

  v4 = (void *)MEMORY[0x24BDF67F0];
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_SKIP_DESCRIPTION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", 0, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDF67E8];
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_SKIP_RECORDING"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__HROnboardingElectrocardiogramTakeRecordingViewController_skipButtonTapped___block_invoke;
  v14[3] = &unk_24D34AEA0;
  v14[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF67E8];
  HRHeartRhythmUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CANCEL"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v9);
  objc_msgSend(v6, "addAction:", v13);
  -[HROnboardingElectrocardiogramTakeRecordingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __77__HROnboardingElectrocardiogramTakeRecordingViewController_skipButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stepForwardWithElectrocardiogramRecorded:", 0);
}

- (void)heartRhythmAvailabilityDidUpdate
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    *(_DWORD *)buf = 138412290;
    v8 = (id)objc_opt_class();
    v5 = v8;
    _os_log_impl(&dword_215454000, v4, OS_LOG_TYPE_INFO, "[%@]: Cinnamon availability update notification received.", buf, 0xCu);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__HROnboardingElectrocardiogramTakeRecordingViewController_heartRhythmAvailabilityDidUpdate__block_invoke;
  block[3] = &unk_24D34AAB0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __92__HROnboardingElectrocardiogramTakeRecordingViewController_heartRhythmAvailabilityDidUpdate__block_invoke(uint64_t a1)
{
  int v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "electrocardiogramFirstRecordingCompleted");
  if (v2 != objc_msgSend(v3, "hk_electrocardiogramFirstRecordingCompleted"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setElectrocardiogramFirstRecordingCompleted:", objc_msgSend(v3, "hk_electrocardiogramFirstRecordingCompleted"));
    if (objc_msgSend(*(id *)(a1 + 32), "electrocardiogramFirstRecordingCompleted"))
      objc_msgSend(*(id *)(a1 + 32), "_stepForwardWithElectrocardiogramRecorded:", 1);
  }

}

- (id)_titleForOnboarding:(BOOL)a3
{
  __CFString *v3;

  if (a3)
    v3 = CFSTR("ECG_ONBOARDING_5_TITLE");
  else
    v3 = CFSTR("ECG_EDUCATION_5_TITLE");
  HRUIECGLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)_takeRecordingImageDimension
{
  double v2;
  double v3;
  CGSize result;

  v2 = 58.0;
  v3 = 58.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_stepForwardWithElectrocardiogramRecorded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (!-[HROnboardingElectrocardiogramTakeRecordingViewController didStepForward](self, "didStepForward"))
  {
    -[HROnboardingElectrocardiogramTakeRecordingViewController setDidStepForward:](self, "setDidStepForward:", 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramTakeRecordingViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("HROnboardingElectrocardiogramDidCompleteRecordingKey"));

    -[HROnboardingElectrocardiogramTakeRecordingViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stepForward");

  }
}

- (void)_setUpElectrocardiogramQuery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id location;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HROnboardingElectrocardiogramTakeRecordingViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HROnboardingElectrocardiogramStartDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD3E88], "predicateForSamplesWithStartDate:endDate:options:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  _HKInitializeLogging();
  v7 = (id)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    v25 = 2112;
    v26 = v5;
    v9 = v8;
    _os_log_impl(&dword_215454000, v7, OS_LOG_TYPE_DEFAULT, "[%@]: Querying for new electrocardiograms during on-boarding after %@", buf, 0x16u);

  }
  v10 = objc_alloc(MEMORY[0x24BDD3920]);
  objc_msgSend(MEMORY[0x24BDD3B80], "electrocardiogramType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke;
  v20[3] = &unk_24D34AB00;
  v20[4] = self;
  objc_copyWeak(&v21, &location);
  v13 = (void *)objc_msgSend(v10, "initWithType:predicate:anchor:limit:resultsHandler:", v11, v6, 0, 0, v20);
  -[HROnboardingElectrocardiogramTakeRecordingViewController setElectrocardiogramQuery:](self, "setElectrocardiogramQuery:", v13);

  objc_copyWeak(&v19, &location);
  -[HROnboardingElectrocardiogramTakeRecordingViewController electrocardiogramQuery](self, "electrocardiogramQuery", v12, 3221225472, __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_247, &unk_24D34AB50);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUpdateHandler:", &v18);

  -[HROnboardingElectrocardiogramTakeRecordingViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "healthStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramTakeRecordingViewController electrocardiogramQuery](self, "electrocardiogramQuery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "executeQuery:", v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_2;
  v13[3] = &unk_24D34AAD8;
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v10;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x24BDAC9B8], v13);
  objc_destroyWeak(&v17);

}

void __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_cold_1(a1, v2);
  }
  else
  {
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3718], 0);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 48);
      v23[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        _HKInitializeLogging();
        v8 = (id)*MEMORY[0x24BDD3010];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
          v10 = (id)objc_opt_class();
          objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "showSensitiveLogItems");
          objc_msgSend(v6, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          v15 = v13;
          if ((v12 & 1) == 0)
          {
            objc_msgSend(v13, "UUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v19 = 138412546;
          v20 = v10;
          v21 = 2112;
          v22 = v15;
          _os_log_impl(&dword_215454000, v8, OS_LOG_TYPE_DEFAULT, "[%@]: Initial electrocardiogram retrieved during on-boarding: %@", (uint8_t *)&v19, 0x16u);
          if ((v12 & 1) == 0)

        }
        v16 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(v16, "_stepForwardWithElectrocardiogramRecorded:", 1);

      }
    }
    else
    {
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x24BDD3010];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
        return;
      v3 = v17;
      v19 = 138412290;
      v20 = (id)objc_opt_class();
      v18 = v20;
      _os_log_impl(&dword_215454000, v3, OS_LOG_TYPE_DEFAULT, "[%@]: No initial electrocardiograms retrieved during on-boarding", (uint8_t *)&v19, 0xCu);

    }
  }
}

void __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_247(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_2_248;
  block[3] = &unk_24D34AB28;
  v13 = v9;
  v10 = v9;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  v14 = v8;
  v11 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v15);
}

void __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_2_248(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_230_cold_1(a1, v2);
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3718], 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v21[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _HKInitializeLogging();
      v8 = (id)*MEMORY[0x24BDD3010];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        v10 = (id)objc_opt_class();
        objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "showSensitiveLogItems");
        objc_msgSend(v6, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = v13;
        if ((v12 & 1) == 0)
        {
          objc_msgSend(v13, "UUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v17 = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_215454000, v8, OS_LOG_TYPE_DEFAULT, "[%@]: New electrocardiogram received during on-boarding: %@", (uint8_t *)&v17, 0x16u);
        if ((v12 & 1) == 0)

      }
      v16 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v16, "_stepForwardWithElectrocardiogramRecorded:", 1);

    }
  }
}

- (void)_stopElectrocardiogramQuery
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HROnboardingElectrocardiogramTakeRecordingViewController electrocardiogramQuery](self, "electrocardiogramQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      *(_DWORD *)v10 = 138412290;
      *(_QWORD *)&v10[4] = objc_opt_class();
      v6 = *(id *)&v10[4];
      _os_log_impl(&dword_215454000, v5, OS_LOG_TYPE_DEFAULT, "[%@]: Stopping query for new electrocardiograms", v10, 0xCu);

    }
    -[HROnboardingElectrocardiogramTakeRecordingViewController delegate](self, "delegate", *(_OWORD *)v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "healthStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramTakeRecordingViewController electrocardiogramQuery](self, "electrocardiogramQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopQuery:", v9);

    -[HROnboardingElectrocardiogramTakeRecordingViewController setElectrocardiogramQuery:](self, "setElectrocardiogramQuery:", 0);
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
  -[HROnboardingElectrocardiogramTakeRecordingViewController _titleFontTextStyle](self, "_titleFontTextStyle");
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
  -[HROnboardingElectrocardiogramTakeRecordingViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_recordingStepFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HROnboardingElectrocardiogramTakeRecordingViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  v4 = (void *)MEMORY[0x24BDF67B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __96__HROnboardingElectrocardiogramTakeRecordingViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D34A7B8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[HROnboardingElectrocardiogramTakeRecordingViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __96__HROnboardingElectrocardiogramTakeRecordingViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[HROnboardingElectrocardiogramTakeRecordingViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (HKHeartRhythmAvailability)availability
{
  return self->_availability;
}

- (void)setAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_availability, a3);
}

- (HKAnchoredObjectQuery)electrocardiogramQuery
{
  return self->_electrocardiogramQuery;
}

- (void)setElectrocardiogramQuery:(id)a3
{
  objc_storeStrong((id *)&self->_electrocardiogramQuery, a3);
}

- (HKElectrocardiogram)electrocardiogram
{
  return self->_electrocardiogram;
}

- (void)setElectrocardiogram:(id)a3
{
  objc_storeStrong((id *)&self->_electrocardiogram, a3);
}

- (BOOL)electrocardiogramFirstRecordingCompleted
{
  return self->_electrocardiogramFirstRecordingCompleted;
}

- (void)setElectrocardiogramFirstRecordingCompleted:(BOOL)a3
{
  self->_electrocardiogramFirstRecordingCompleted = a3;
}

- (BOOL)didStepForward
{
  return self->_didStepForward;
}

- (void)setDidStepForward:(BOOL)a3
{
  self->_didStepForward = a3;
}

- (UIView)assetView
{
  return self->_assetView;
}

- (void)setAssetView:(id)a3
{
  objc_storeStrong((id *)&self->_assetView, a3);
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

- (HRImageLabel)recordingStep1ImageLabel
{
  return self->_recordingStep1ImageLabel;
}

- (void)setRecordingStep1ImageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_recordingStep1ImageLabel, a3);
}

- (HRImageLabel)recordingStep2ImageLabel
{
  return self->_recordingStep2ImageLabel;
}

- (void)setRecordingStep2ImageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_recordingStep2ImageLabel, a3);
}

- (UILabel)wristSettingsLabel
{
  return self->_wristSettingsLabel;
}

- (void)setWristSettingsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_wristSettingsLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristSettingsLabel, 0);
  objc_storeStrong((id *)&self->_recordingStep2ImageLabel, 0);
  objc_storeStrong((id *)&self->_recordingStep1ImageLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_electrocardiogram, 0);
  objc_storeStrong((id *)&self->_electrocardiogramQuery, 0);
  objc_storeStrong((id *)&self->_availability, 0);
}

@end
