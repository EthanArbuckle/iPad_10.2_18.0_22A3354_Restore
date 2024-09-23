@implementation HROnboardingInlineExpandedContentView

+ (id)viewWithItems:(id)a3
{
  id v4;
  HROnboardingInlineExpandedContentView *v5;
  uint64_t v6;
  void *v7;
  HROnboardingInlineExpandedContentView *v8;
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
  HROnboardingInlineExpandedContentView *v20;
  _QWORD v22[4];
  void *v23;
  _QWORD v24[4];
  HROnboardingInlineExpandedContentView *v25;
  _QWORD v26[5];

  v4 = a3;
  v5 = objc_alloc_init(HROnboardingInlineExpandedContentView);
  -[HROnboardingInlineExpandedContentView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (objc_msgSend(v4, "count"))
  {
    v6 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke;
    v26[3] = &__block_descriptor_40_e31__16__0__HRExpandedContentItem_8l;
    v26[4] = a1;
    objc_msgSend(v4, "hk_map:", v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke_2;
    v24[3] = &unk_24D34ACF0;
    v8 = v5;
    v25 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24);
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstBaselineAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingInlineExpandedContentView topAnchor](v8, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_bodyFontDistance");
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    objc_msgSend(a1, "_spacingBetweenItems:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke_3;
    v22[3] = &unk_24D34AD18;
    v23 = v7;
    v14 = v7;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v22);
    -[HROnboardingInlineExpandedContentView bottomAnchor](v8, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastBaselineAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    v19 = v23;
    v20 = v8;

  }
  return v5;
}

uint64_t __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_makeViewWithContentItem:", a2);
}

void __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("SessionDetails.MoreInfo.%lu"), a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v6);
  objc_msgSend(v6, "hk_alignHorizontalConstraintsWithView:margin:", *(_QWORD *)(a1 + 32), 0.0);

}

void __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  id v13;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstBaselineAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastBaselineAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v11 = v10;

  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

}

+ (id)learnMoreAboutAtrialFibrillationExpandedView
{
  void *v2;
  void *v3;
  HROnboardingInlineExpandedContentView *v4;
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
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HROnboardingInlineExpandedContentView *v36;
  void *v38;
  void *v39;
  void *v40;
  HROnboardingInlineExpandedContentView *v41;
  HROnboardingInlineExpandedContentView *v42;
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
  _QWORD v55[4];
  void *v56;
  _QWORD v57[4];
  HROnboardingInlineExpandedContentView *v58;
  _QWORD v59[11];
  _QWORD v60[14];

  v60[12] = *MEMORY[0x24BDAC8D0];
  v41 = objc_alloc_init(HROnboardingInlineExpandedContentView);
  -[HROnboardingInlineExpandedContentView setTranslatesAutoresizingMaskIntoConstraints:](v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HROnboardingInlineExpandedContentView widthAnchor](v41, "widthAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintLessThanOrEqualToConstant:", 500.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 1);

  objc_msgSend((id)objc_opt_class(), "_bodyLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_1"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_headingLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_2_HEADING"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_bodyLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_2"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_headingLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_HEADING"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_bodyLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_listLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_1"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_listLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_2"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_listLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_3"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_listLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_4"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_listLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_5"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_listLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_6"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_listLabelWithAtrialFibrillationLocalizationKey:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_7"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v54;
  v60[1] = v53;
  v60[2] = v52;
  v60[3] = v51;
  v60[4] = v50;
  v60[5] = v49;
  v60[6] = v48;
  v60[7] = v47;
  v60[8] = v46;
  v60[9] = v45;
  v60[10] = v44;
  v60[11] = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 12);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __85__HROnboardingInlineExpandedContentView_learnMoreAboutAtrialFibrillationExpandedView__block_invoke;
  v57[3] = &unk_24D34ACF0;
  v4 = v41;
  v58 = v4;
  v42 = v4;
  objc_msgSend(v40, "enumerateObjectsUsingBlock:", v57);
  objc_msgSend(v40, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstBaselineAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingInlineExpandedContentView topAnchor](v4, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_bodyFontDistance");
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_headingBodyFontDistance");
  objc_msgSend(v9, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v39;
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_bodyFontDistance");
  objc_msgSend(v10, "numberWithDouble:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v38;
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_headingBodyFontDistance");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v12;
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_bodyFontDistance");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v14;
  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_listFontDistance");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v16;
  v17 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_listFontDistance");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59[5] = v18;
  v19 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_listFontDistance");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59[6] = v20;
  v21 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_listFontDistance");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v59[7] = v22;
  v23 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_listFontDistance");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59[8] = v24;
  v25 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_listFontDistance");
  objc_msgSend(v25, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v59[9] = v26;
  v27 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_opt_class(), "_listFontDistance");
  objc_msgSend(v27, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v59[10] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __85__HROnboardingInlineExpandedContentView_learnMoreAboutAtrialFibrillationExpandedView__block_invoke_2;
  v55[3] = &unk_24D34AD18;
  v56 = v40;
  v30 = v40;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v55);
  -[HROnboardingInlineExpandedContentView bottomAnchor](v42, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "lastObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "lastBaselineAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  v35 = v56;
  v36 = v42;

  return v36;
}

void __85__HROnboardingInlineExpandedContentView_learnMoreAboutAtrialFibrillationExpandedView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addSubview:", v4);
  objc_msgSend(v4, "hk_alignHorizontalConstraintsWithView:margin:", *(_QWORD *)(a1 + 32), 0.0);

}

void __85__HROnboardingInlineExpandedContentView_learnMoreAboutAtrialFibrillationExpandedView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  id v13;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstBaselineAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastBaselineAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v11 = v10;

  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

}

+ (id)_bodyLabelWithAtrialFibrillationLocalizationKey:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDF6B68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  HRHeartRhythmUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v4, &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setText:", v7);
  objc_msgSend((id)objc_opt_class(), "_bodyFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v8);

  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  return v5;
}

+ (id)_headingLabelWithAtrialFibrillationLocalizationKey:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDF6B68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  HRHeartRhythmUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v4, &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setText:", v7);
  objc_msgSend((id)objc_opt_class(), "_headingBodyFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v8);

  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  return v5;
}

+ (id)_listLabelWithAtrialFibrillationLocalizationKey:(id)a3
{
  id v3;
  HRBulletedIndentedLabel *v4;
  void *v5;
  void *v6;
  HRBulletedIndentedLabel *v7;

  v3 = a3;
  v4 = [HRBulletedIndentedLabel alloc];
  HRHeartRhythmUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v3, &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HRBulletedIndentedLabel initWithText:](v4, "initWithText:", v6);
  -[HRBulletedIndentedLabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v7;
}

+ (id)_spacingBetweenItems:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v5 = 1;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v6, "type"))
      {
        case 0:
          v7 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend((id)objc_opt_class(), "_badgeFontDistance");
          goto LABEL_9;
        case 1:
          objc_msgSend(v3, "objectAtIndexedSubscript:", v5 - 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "type");
          v10 = (void *)MEMORY[0x24BDD16E0];
          v11 = (void *)objc_opt_class();
          if (v9)
            objc_msgSend(v11, "_headingBodyFontDistance");
          else
            objc_msgSend(v11, "_headingToBadgeFontDistance");
          objc_msgSend(v10, "numberWithDouble:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

          goto LABEL_12;
        case 2:
          v7 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend((id)objc_opt_class(), "_bodyFontDistance");
          goto LABEL_9;
        case 3:
          v7 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend((id)objc_opt_class(), "_listFontDistance");
LABEL_9:
          objc_msgSend(v7, "numberWithDouble:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v8);
LABEL_12:

          break;
        default:
          break;
      }

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }

  return v4;
}

+ (id)_makeViewWithContentItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      v5 = (void *)objc_opt_class();
      objc_msgSend(v4, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_badgeLabelWithLocalizedText:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      v8 = (void *)objc_opt_class();
      objc_msgSend(v4, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_headingLabelWithLocalizedText:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      v9 = (void *)objc_opt_class();
      objc_msgSend(v4, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_bodyLabelWithLocalizedText:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend(v4, "learnMore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_opt_class();
      objc_msgSend(v4, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v4, "learnMore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "urlIdentifier");
        objc_msgSend(v4, "learnMore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_learnMoreListLabelWithLocalizedText:URLIdentifier:delegate:", v6, v13, v15);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v11, "_listLabelWithLocalizedText:", v6);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v3 = (void *)v7;
      }

LABEL_10:
      return v3;
    default:
      goto LABEL_10;
  }
}

+ (id)_badgeLabelWithLocalizedText:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDF6B68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend((id)objc_opt_class(), "_badgeFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "hk_heartKeyColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  return v5;
}

+ (id)_bodyLabelWithLocalizedText:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDF6B68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend((id)objc_opt_class(), "_bodyFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(v5, "setText:", v4);

  return v5;
}

+ (id)_headingLabelWithLocalizedText:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDF6B68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend((id)objc_opt_class(), "_headingBodyFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(v5, "setText:", v4);

  return v5;
}

+ (id)_listLabelWithLocalizedText:(id)a3
{
  id v3;
  HRBulletedIndentedLabel *v4;

  v3 = a3;
  v4 = -[HRBulletedIndentedLabel initWithText:]([HRBulletedIndentedLabel alloc], "initWithText:", v3);

  -[HRBulletedIndentedLabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

+ (id)_bulletedTextViewWithLocalizationKey:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BDF6EF8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScrollEnabled:", 0);
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);
  objc_msgSend(v5, "setSelectable:", 0);
  objc_msgSend(v5, "setEditable:", 0);
  objc_msgSend(v5, "setTextContainerInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  objc_msgSend(v5, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  v8 = (void *)MEMORY[0x24BDD1688];
  HRUIECGLocalizedString(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_bodyFontTextStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hrui_bulletedString:textStyle:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v11);

  return v5;
}

+ (id)_learnMoreListLabelWithLocalizedText:(id)a3 URLIdentifier:(int64_t)a4 delegate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  HRLinkTextView *v21;
  id v22;
  HRLinkTextView *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;

  v7 = a5;
  v8 = a3;
  HRHeartRhythmUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_LEARN_MORE_WITH_ELLIPSES"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD1688];
  objc_msgSend((id)objc_opt_class(), "_bodyFontTextStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hrui_bulletedString:textStyle:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "rangeOfString:", v10);
  v18 = v17;

  v19 = *MEMORY[0x24BDF6600];
  objc_msgSend(MEMORY[0x24BDF6950], "hk_appKeyColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAttribute:value:range:", v19, v20, v16, v18);

  v21 = [HRLinkTextView alloc];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __101__HROnboardingInlineExpandedContentView__learnMoreListLabelWithLocalizedText_URLIdentifier_delegate___block_invoke;
  v28[3] = &unk_24D34AD40;
  v29 = v10;
  v22 = v10;
  v23 = -[HRLinkTextView initWithLinkRange:URLIdentifier:delegate:userInterfaceStyleChanged:](v21, "initWithLinkRange:URLIdentifier:delegate:userInterfaceStyleChanged:", v16, v18, a4, v7, v28);

  -[HRLinkTextView textView](v23, "textView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAttributedText:", v14);

  -[HRLinkTextView textView](v23, "textView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "textContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLineFragmentPadding:", 0.0);

  return v23;
}

void __101__HROnboardingInlineExpandedContentView__learnMoreListLabelWithLocalizedText_URLIdentifier_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v11, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeOfString:", *(_QWORD *)(a1 + 32));

  v8 = *MEMORY[0x24BDF6600];
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAttribute:value:range:", v8, v9, 0, v7);

  objc_msgSend(v3, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAttributedText:", v11);
}

+ (id)_badgeFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend((id)objc_opt_class(), "_badgeFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)_badgeFontDistance
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_badgeFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 48.0);
  v4 = v3;

  return v4;
}

+ (id)_badgeFontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

+ (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

+ (id)_headingBodyFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend((id)objc_opt_class(), "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_bodyFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend((id)objc_opt_class(), "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)_bodyFontDistance
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 30.0);
  v4 = v3;

  return v4;
}

+ (double)_headingBodyFontDistance
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_headingBodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 48.0);
  v4 = v3;

  return v4;
}

+ (double)_headingToBadgeFontDistance
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_headingBodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 22.0);
  v4 = v3;

  return v4;
}

+ (double)_listFontDistance
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 34.0);
  v4 = v3;

  return v4;
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

@end
