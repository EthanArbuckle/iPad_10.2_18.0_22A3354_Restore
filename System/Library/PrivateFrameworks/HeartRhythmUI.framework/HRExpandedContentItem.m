@implementation HRExpandedContentItem

+ (id)_atrialFibrillationExpandedContentItemsAlgorithmVersionTwo
{
  void *v2;
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
  id v26;
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
  _QWORD v43[15];

  v43[13] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_1"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemWithType:title:", 2, v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v41;
  v3 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("AFIB_HIGH_HR_TALK_TO_DOCTOR"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemWithType:title:", 2, v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v39;
  v4 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_2_HEADING"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemWithType:title:", 1, v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v37;
  v5 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_2"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemWithType:title:", 2, v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v35;
  v6 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_HEADING"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemWithType:title:", 1, v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v33;
  v7 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemWithType:title:", 2, v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v31;
  v8 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_1"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemWithType:title:", 3, v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v29;
  v9 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_2"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemWithType:title:", 3, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v27;
  v10 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_3"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemWithType:title:", 3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v12;
  v13 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_4"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemWithType:title:", 3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v15;
  v16 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_5"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "itemWithType:title:", 3, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[10] = v18;
  v19 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_6"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "itemWithType:title:", 3, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[11] = v21;
  v22 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_7"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "itemWithType:title:", 3, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[12] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 13);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)_inconclusiveExpandedContentItemsAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3 withLearnMoreDelegate:(id)a4
{
  objc_class *v5;
  id v6;
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
  void *v20;
  void *v21;
  HRExpandedContentItemLearnMore *v22;
  void *v23;

  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  if (a3 == 1)
  {
    v8 = (void *)objc_opt_class();
    HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_UPDATED_BADGE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemWithType:title:", 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v10);
  }
  v11 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_4_EXPANDED_1_HEADING"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemWithType:title:", 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v13);
  v14 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_4_EXPANDED_1_LIST_1"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemWithType:title:", 3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v16);
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_4_EXPANDED_1_LIST_2"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "itemWithType:title:", 3, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v18);
  v19 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_4_EXPANDED_1_LIST_3"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "itemWithType:title:", 3, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[HRExpandedContentItemLearnMore initWithURLIdentifier:delegate:]([HRExpandedContentItemLearnMore alloc], "initWithURLIdentifier:delegate:", 2, v6);
  objc_msgSend(v21, "setLearnMore:", v22);

  objc_msgSend(v7, "addObject:", v21);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)_highOrLowAbove150Below50HeartRateExpandedContentItemsAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_EXPANDED_1_BODY_0"));
  v5 = objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_EXPANDED_1_BODY_1"));
  v6 = objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_EXPANDED_2_BODY_1"));
  v7 = objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_EXPANDED_3_BODY_1"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v5;
  objc_msgSend((id)objc_opt_class(), "itemWithType:title:", 2, v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:");
  v8 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_EXPANDED_1_HEADING"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemWithType:title:", 1, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v10;
  objc_msgSend(v4, "addObject:", v10);
  v37 = (void *)v6;
  objc_msgSend((id)objc_opt_class(), "itemWithType:title:", 2, v6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:");
  v11 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_EXPANDED_1_BODY_2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemWithType:title:", 2, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v13);
  if (a3 == 1)
  {
    v14 = (void *)objc_opt_class();
    HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_UPDATED_BADGE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemWithType:title:", 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v16);
  }
  v17 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_EXPANDED_2_HEADING"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "itemWithType:title:", 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v19);
  v20 = (void *)v7;
  objc_msgSend((id)objc_opt_class(), "itemWithType:title:", 2, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v21);
  if (a3 == 1)
  {
    v22 = (void *)objc_opt_class();
    HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_UPDATED_BADGE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "itemWithType:title:", 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v24);
  }
  v25 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_EXPANDED_3_HEADING"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "itemWithType:title:", 1, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v27);
  objc_msgSend((id)objc_opt_class(), "itemWithType:title:", 2, v36);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v28);
  v29 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_EXPANDED_3_BODY_2"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "itemWithType:title:", 2, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v31);
  return v4;
}

+ (id)_poorRecordingExpandedContentItemsForAlgorithmVersionTwoWithLearnMoreDelegate:(id)a3
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
  HRExpandedContentItemLearnMore *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[6];

  v28[5] = *MEMORY[0x24BDAC8D0];
  v24 = (void *)MEMORY[0x24BDBCEB8];
  v27 = a3;
  v3 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_5_EXPANDED_1_HEADING"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemWithType:title:", 1, v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v25;
  v4 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_5_EXPANDED_1_LIST_1"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemWithType:title:", 3, v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v5;
  v6 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_5_EXPANDED_1_LIST_2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemWithType:title:", 3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v8;
  v9 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_5_EXPANDED_1_LIST_3"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemWithType:title:", 3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v11;
  v12 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_5_EXPANDED_1_LIST_4"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "itemWithType:title:", 3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_5_EXPANDED_1_LIST_5"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "itemWithType:title:", 3, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[HRExpandedContentItemLearnMore initWithURLIdentifier:delegate:]([HRExpandedContentItemLearnMore alloc], "initWithURLIdentifier:delegate:", 1, v27);
  objc_msgSend(v19, "setLearnMore:", v20);

  objc_msgSend(v16, "addObject:", v19);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)itemWithType:(int64_t)a3 title:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:title:", a3, v5);

  return v6;
}

- (HRExpandedContentItem)initWithType:(int64_t)a3 title:(id)a4
{
  id v7;
  HRExpandedContentItem *v8;
  HRExpandedContentItem *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HRExpandedContentItem;
  v8 = -[HRExpandedContentItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_title, a4);
  }

  return v9;
}

+ (id)sinusRhythmItemsForAlgorithmVersion:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) <= 1)
  {
    objc_msgSend(a1, "_sinusRhythmExpandedContentItemsAlgVersionOne", v3, v4);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

+ (id)atrialFibrillationItemsForAlgorithmVersion:(int64_t)a3
{
  const char *v3;

  if (a3 == 2)
  {
    objc_msgSend(a1, "_atrialFibrillationExpandedContentItemsAlgorithmVersionTwo");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    objc_msgSend(a1, "_atrialFibrillationExpandedContentItemsAlgVersionOne");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

+ (id)highOrLowAbove120Below50HeartRateItemsForAlgorithmVersion:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 1)
    return MEMORY[0x24BDBD1A8];
  objc_msgSend(a1, "_highOrLowAbove120Below50HeartRateExpandedContentItemsAlgVersionOne", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)inconclusiveItemsForAlgorithmVersion:(int64_t)a3 upgradingFromAlgorithmVersion:(int64_t)a4 learnMoreDelegate:(id)a5
{
  id v8;
  int64_t v9;

  v8 = a5;
  if (a3 == 2)
  {
    objc_msgSend(a1, "_inconclusiveExpandedContentItemsAlgorithmVersionTwoUpgradingFromAlgorithmVersion:withLearnMoreDelegate:", a4, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    objc_msgSend(a1, "_inconclusiveExpandedContentItemsAlgVersionOneWithLearnMoreDelegate:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    a4 = v9;
  }

  return (id)a4;
}

+ (id)highOrLowAbove150Below50HeartRateItemsForAlgorithmVersion:(int64_t)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 == 2)
  {
    objc_msgSend(a1, "_highOrLowAbove150Below50HeartRateExpandedContentItemsAlgorithmVersionTwoUpgradingFromAlgorithmVersion:", a4);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      +[HRExpandedContentItem highOrLowAbove150Below50HeartRateItemsForAlgorithmVersion:upgradingFromAlgorithmVersion:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    a1 = (id)MEMORY[0x24BDBD1A8];
  }
  return a1;
}

+ (id)poorRecordingItemsForAlgorithmVersion:(int64_t)a3 learnMoreDelegate:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  if (a3 == 2)
  {
    objc_msgSend(a1, "_poorRecordingExpandedContentItemsForAlgorithmVersionTwoWithLearnMoreDelegate:", v6);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      +[HRExpandedContentItem poorRecordingItemsForAlgorithmVersion:learnMoreDelegate:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    a1 = (id)MEMORY[0x24BDBD1A8];
  }

  return a1;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)type
{
  return self->_type;
}

- (HRExpandedContentItemLearnMore)learnMore
{
  return self->_learnMore;
}

- (void)setLearnMore:(id)a3
{
  objc_storeStrong((id *)&self->_learnMore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMore, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)_sinusRhythmExpandedContentItemsAlgVersionOne
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_1_EXPANDED_1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemWithType:title:", 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v5 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_1_EXPANDED_2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemWithType:title:", 2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_atrialFibrillationExpandedContentItemsAlgVersionOne
{
  void *v2;
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
  id v25;
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
  _QWORD v40[14];

  v40[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_1"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemWithType:title:", 2, v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v38;
  v3 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_2_HEADING"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemWithType:title:", 1, v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v36;
  v4 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_2"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemWithType:title:", 2, v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v34;
  v5 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_HEADING"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemWithType:title:", 1, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v32;
  v6 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemWithType:title:", 2, v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v30;
  v7 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_1"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemWithType:title:", 3, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v28;
  v8 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_2"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemWithType:title:", 3, v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v26;
  v9 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_3"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemWithType:title:", 3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v11;
  v12 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_4"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "itemWithType:title:", 3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v14;
  v15 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_5"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemWithType:title:", 3, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[9] = v17;
  v18 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_6"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "itemWithType:title:", 3, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[10] = v20;
  v21 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_EXPANDED_3_SYMPTOM_7"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "itemWithType:title:", 3, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[11] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 12);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)_highOrLowAbove120Below50HeartRateExpandedContentItemsAlgVersionOne
{
  void *v2;
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
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];

  v22[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_3_EXPANDED_1_HEADING"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemWithType:title:", 1, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v3 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_3_EXPANDED_1_BODY_1"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemWithType:title:", 2, v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v4;
  v5 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_3_EXPANDED_1_BODY_2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemWithType:title:", 2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  v8 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_3_EXPANDED_2_HEADING"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemWithType:title:", 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v10;
  v11 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_3_EXPANDED_2_BODY_1"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemWithType:title:", 2, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v13;
  v14 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_3_EXPANDED_2_BODY_2"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemWithType:title:", 2, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_inconclusiveExpandedContentItemsAlgVersionOneWithLearnMoreDelegate:(id)a3
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
  HRExpandedContentItemLearnMore *v19;
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
  HRExpandedContentItemLearnMore *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  _QWORD v50[6];

  v50[5] = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v3 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_1_HEADING"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemWithType:title:", 1, v44);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v4;
  v5 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_1_LIST_1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemWithType:title:", 3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v7;
  v8 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_1_LIST_2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemWithType:title:", 3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v10;
  v11 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_1_LIST_3"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemWithType:title:", 3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v13;
  v14 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_1_LIST_4"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemWithType:title:", 3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_1_LIST_5"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "itemWithType:title:", 3, v18);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[HRExpandedContentItemLearnMore initWithURLIdentifier:delegate:]([HRExpandedContentItemLearnMore alloc], "initWithURLIdentifier:delegate:", 1, v47);
  objc_msgSend(v45, "setLearnMore:", v19);

  v20 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_2_HEADING"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "itemWithType:title:", 1, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v22;
  v23 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_2_LIST_1"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "itemWithType:title:", 3, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v25;
  v26 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_2_LIST_2"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "itemWithType:title:", 3, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v28;
  v29 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_2_LIST_3"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "itemWithType:title:", 3, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_2_LIST_4"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "itemWithType:title:", 3, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = -[HRExpandedContentItemLearnMore initWithURLIdentifier:delegate:]([HRExpandedContentItemLearnMore alloc], "initWithURLIdentifier:delegate:", 2, v47);
  objc_msgSend(v35, "setLearnMore:", v36);

  v37 = (void *)objc_opt_class();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_EXPANDED_3"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "itemWithType:title:", 2, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v46);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v45);
  objc_msgSend(v41, "addObjectsFromArray:", v32);
  objc_msgSend(v41, "addObject:", v35);
  objc_msgSend(v41, "addObjectsFromArray:", v40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

+ (void)highOrLowAbove150Below50HeartRateItemsForAlgorithmVersion:(uint64_t)a3 upgradingFromAlgorithmVersion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_215454000, a1, a3, "High or low above 150 below 50 bpm expanded card should not show when active algorithm version is 1.", a5, a6, a7, a8, 0);
}

+ (void)poorRecordingItemsForAlgorithmVersion:(uint64_t)a3 learnMoreDelegate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_215454000, a1, a3, "Poor recording expanded card should not show when active algorithm version is 1.", a5, a6, a7, a8, 0);
}

@end
