@implementation HKInteractiveChartInfographicFactory

+ (BOOL)infographicSupportedForDisplayType:(id)a3 factorDisplayType:(id)a4 healthStore:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    do
    {
      v10 = v9;
      objc_msgSend(v10, "baseDisplayType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
  }
  if (v7)
  {
    objc_msgSend(v9, "hk_chartFactorDescriptionDisplayTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v7);

    if ((v12 & 1) == 0)
    {
LABEL_10:
      v13 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v14 = 0;
    while (1)
    {
      v15 = _supportedDisplayTypes[v14];
      if (v15 == objc_msgSend(v9, "displayTypeIdentifier"))
        break;
      if (++v14 == 5)
        goto LABEL_10;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

+ (id)infographicViewControllerForDisplayType:(id)a3 factorDisplayType:(id)a4 healthStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  HKModalNavigationController *v17;

  v7 = a3;
  v8 = a4;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v9 = v7;
    objc_msgSend(v9, "baseDisplayType");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v7, "displayTypeIdentifier") == 172)
  {
    objc_msgSend(a1, "_environmentalAudioExposureInfographic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v7, "displayTypeIdentifier") == 173)
  {
    objc_msgSend(a1, "_headphoneAudioExposureInfographic");
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  if (objc_msgSend(v7, "displayTypeIdentifier") == 249)
  {
    objc_msgSend(a1, "_appleWalkingSteadinessInfographicForDisplayType:", v7);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  if (objc_msgSend(v7, "displayTypeIdentifier") == 256)
  {
    objc_msgSend(a1, "_appleSleepingWristTemperatureInfographicForDisplayType:", v7);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  if (objc_msgSend(v7, "displayTypeIdentifier") == 275)
  {
    objc_msgSend(a1, "_appleSleepingBreathingDisturbancesInfographicForDisplayType:", v7);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  if (v8)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      v15 = v8;
      objc_msgSend(v15, "baseDisplayType");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1, "_factorDescriptionForDisplayType:factorDisplayType:", v7, v8);
    v16 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v16;
  }
  if (v10)
    v17 = -[HKModalNavigationController initWithRootViewController:]([HKModalNavigationController alloc], "initWithRootViewController:", v10);
  else
    v17 = 0;

  return v17;
}

+ (id)_environmentalAudioExposureInfographic
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
  HKInfographicViewController *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[11];

  v18[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_itemForAudioInfographicWithClassification:descriptionKey:", 1, CFSTR("ENVIRONMENTAL_EXPOSURE_OK_DESCRIPTION"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  objc_msgSend(a1, "_itemForAudioInfographicWithClassification:descriptionKey:", 2, CFSTR("ENVIRONMENTAL_EXPOSURE_LOUD_DESCRIPTION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(a1, "_exposureLimitTextItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v4;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_75"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_75"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v5;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_80"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_80"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v6;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_90"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_90"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v7;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_100"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_100"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v8;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_110"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_110"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v9;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:hideSeparator:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_120"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_120"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v10;
  objc_msgSend(a1, "_whoExposureTextItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HKInfographicViewController initWithItems:]([HKInfographicViewController alloc], "initWithItems:", v12);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SOUND_LEVEL_CLASSIFICATIONS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController setTitle:](v13, "setTitle:", v15);

  return v13;
}

+ (id)_headphoneAudioExposureInfographic
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
  HKInfographicViewController *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[11];

  v18[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_itemForAudioInfographicWithClassification:descriptionKey:", 1, CFSTR("HEADPHONE_EXPOSURE_OK_DESCRIPTION"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  objc_msgSend(a1, "_itemForAudioInfographicWithClassification:descriptionKey:", 2, CFSTR("HEADPHONE_EXPOSURE_LOUD_DESCRIPTION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(a1, "_exposureLimitTextItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v4;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_75"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_75"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v5;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_80"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_80"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v6;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_90"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_90"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v7;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_100"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_100"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v8;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_110"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_110"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v9;
  objc_msgSend(a1, "_itemWithTitleKey:valueKey:hideSeparator:", CFSTR("EXPOSURE_EXAMPLE_QUANTITY_120"), CFSTR("EXPOSURE_EXAMPLE_DESCRIPTION_120"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v10;
  objc_msgSend(a1, "_whoExposureTextItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HKInfographicViewController initWithItems:]([HKInfographicViewController alloc], "initWithItems:", v12);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SOUND_LEVEL_CLASSIFICATIONS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController setTitle:](v13, "setTitle:", v15);

  return v13;
}

+ (id)_appleWalkingSteadinessInfographicForDisplayType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKInfographicViewController *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_itemForAppleWalkingSteadinessInfographicWithClassification:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_itemForAppleWalkingSteadinessInfographicWithClassification:", 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(a1, "_itemForAppleWalkingSteadinessInfographicWithClassification:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HKInfographicViewController initWithItems:]([HKInfographicViewController alloc], "initWithItems:", v8);
  objc_msgSend(v4, "localization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController setTitle:](v9, "setTitle:", v11);

  return v9;
}

+ (id)_appleSleepingWristTemperatureInfographicForDisplayType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HKInfographicButtonItem *v9;
  void *v10;
  void *v11;
  void *v12;
  HKInfographicViewController *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC3520];
  v5 = a3;
  objc_msgSend(v4, "plainButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SLEEPING_WRIST_TEMPERATURE_INFOGRAPHIC_LEARN_MORE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  v9 = -[HKInfographicButtonItem initWithConfiguration:buttonTapHandler:]([HKInfographicButtonItem alloc], "initWithConfiguration:buttonTapHandler:", v6, &__block_literal_global_53);
  objc_msgSend(a1, "_appleSleepingWristTemperatureItemWithTitleKey:descriptionKey:", CFSTR("SLEEPING_WRIST_TEMPERATURE_INFOGRAPHIC_YOUR_BASELINE_TITLE"), CFSTR("SLEEPING_WRIST_TEMPERATURE_INFOGRAPHIC_YOUR_BASELINE_BODY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_appleSleepingWristTemperatureItemWithTitleKey:descriptionKey:", CFSTR("ESTABLISHING_BASELINE"), CFSTR("SLEEPING_WRIST_TEMPERATURE_INFOGRAPHIC_ESTABLISHING_BASELINE_BODY"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  v17[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HKInfographicViewController initWithItems:]([HKInfographicViewController alloc], "initWithItems:", v12);
  objc_msgSend(v5, "localization");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController setTitle:](v13, "setTitle:", v15);

  return v13;
}

void __96__HKInteractiveChartInfographicFactory__appleSleepingWristTemperatureInfographicForDisplayType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("SLEEPING_WRIST_TEMPERATURE_KNOWLEDGE_BASE_ARTICLE_URL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withOptions:", v4, 0);

}

+ (id)_appleSleepingBreathingDisturbancesInfographicForDisplayType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HKInfographicButtonItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKInfographicViewController *v15;
  void *v16;
  void *v17;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC3520];
  v5 = a3;
  objc_msgSend(v4, "plainButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_LEARN_MORE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Nebula"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  v9 = -[HKInfographicButtonItem initWithConfiguration:buttonTapHandler:]([HKInfographicButtonItem alloc], "initWithConfiguration:buttonTapHandler:", v6, &__block_literal_global_253);
  objc_msgSend(a1, "_appleSleepingBreathingDisturbancesItemWithTitleKey:descriptionKey:", CFSTR("SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_1_TITLE"), CFSTR("SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_1_BODY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_appleSleepingBreathingDisturbancesItemWithTitleKey:descriptionKey:", CFSTR("SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_2_TITLE"), CFSTR("SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_2_BODY"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(a1, "_appleSleepingBreathingDisturbancesItemWithTitleKey:descriptionKey:", CFSTR("SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_3_TITLE"), CFSTR("SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_3_BODY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  objc_msgSend(a1, "_appleSleepingBreathingDisturbancesItemWithTitleKey:descriptionKey:", CFSTR("SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_4_TITLE"), CFSTR("SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_4_BODY"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  v19[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HKInfographicViewController initWithItems:]([HKInfographicViewController alloc], "initWithItems:", v14);
  objc_msgSend(v5, "localization");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "displayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController setTitle:](v15, "setTitle:", v17);

  return v15;
}

void __101__HKInteractiveChartInfographicFactory__appleSleepingBreathingDisturbancesInfographicForDisplayType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("SLEEP_BREATHING_DISTURBANCES_KNOWLEDGE_BASE_ARTICLE_URL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Nebula"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withOptions:", v4, 0);

}

+ (id)_itemForAudioInfographicWithClassification:(unint64_t)a3 descriptionKey:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HKInfographicContentItem *v18;

  v6 = *MEMORY[0x1E0DC4B58];
  v7 = a4;
  objc_msgSend(a1, "_attributedSymbolForAudioClassification:textStyle:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB62F8], "localizedDisplayNameForClassification:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(a1, "_titleAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v10, v12);
  objc_msgSend(v9, "appendAttributedString:", v13);

  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v14, "initWithString:", v16);
  v18 = -[HKInfographicContentItem initWithTitle:description:]([HKInfographicContentItem alloc], "initWithTitle:description:", v9, v17);

  return v18;
}

+ (id)_exposureLimitTextItem
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKInfographicTextItem *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EXPOSURE_LIMIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithString:attributes:", v4, v7);

  v9 = -[HKInfographicTextItem initWithDescription:]([HKInfographicTextItem alloc], "initWithDescription:", v8);
  return v9;
}

+ (id)_whoExposureTextItem
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKInfographicTextItem *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EXPOSURE_WHO_RECOMMENDATION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4AC0], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithString:attributes:", v4, v7);

  v9 = -[HKInfographicTextItem initWithDescription:]([HKInfographicTextItem alloc], "initWithDescription:", v8);
  return v9;
}

+ (id)_itemWithTitleKey:(id)a3 valueKey:(id)a4
{
  return (id)objc_msgSend(a1, "_itemWithTitleKey:valueKey:hideSeparator:", a3, a4, 0);
}

+ (id)_itemWithTitleKey:(id)a3 valueKey:(id)a4 hideSeparator:(BOOL)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HKInfographicTableItem *v19;
  _BOOL4 v21;

  v21 = a5;
  v7 = (objc_class *)MEMORY[0x1E0CB3498];
  v8 = a4;
  v9 = a3;
  v10 = [v7 alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v9, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_tableTitleAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithString:attributes:", v12, v13);

  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", v8, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v15, "initWithString:", v17);
  v19 = -[HKInfographicTableItem initWithTitle:value:separatorHidden:]([HKInfographicTableItem alloc], "initWithTitle:value:separatorHidden:", v14, v18, v21);

  return v19;
}

+ (id)_attributedSymbolForAudioClassification:(unint64_t)a3 textStyle:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_hearingHealthAudioExposureSymbolForClassification:font:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendAttributedString:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v11, "appendAttributedString:", v13);

  v14 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_hearingHealthAudioExposureColorForClassification:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAttribute:value:range:", v14, v15, 0, objc_msgSend(v11, "length"));

  v16 = (void *)objc_msgSend(v11, "copy");
  return v16;
}

+ (id)_itemForAppleWalkingSteadinessInfographicWithClassification:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HKInfographicContentItem *v11;

  +[HKMobilityUtilities localizedTitleForClassification:](HKMobilityUtilities, "localizedTitleForClassification:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMobilityUtilities localizedDescriptionForClassification:](HKMobilityUtilities, "localizedDescriptionForClassification:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(a1, "_titleAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v5, v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
  v11 = -[HKInfographicContentItem initWithTitle:description:]([HKInfographicContentItem alloc], "initWithTitle:description:", v9, v10);

  return v11;
}

+ (id)_appleSleepingWristTemperatureItemWithTitleKey:(id)a3 descriptionKey:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HKInfographicContentItem *v19;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = *MEMORY[0x1E0DC1138];
  v5 = (void *)MEMORY[0x1E0DC1350];
  v6 = *MEMORY[0x1E0DC4B58];
  v21 = a4;
  v7 = a3;
  objc_msgSend(v5, "_preferredFontForTextStyle:variant:", v6, 66560);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v22[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v11, "initWithString:attributes:", v13, v10);
  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", v21, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v15, "initWithString:", v17);
  v19 = -[HKInfographicContentItem initWithTitle:description:]([HKInfographicContentItem alloc], "initWithTitle:description:", v14, v18);

  return v19;
}

+ (id)_appleSleepingBreathingDisturbancesItemWithTitleKey:(id)a3 descriptionKey:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HKInfographicContentItem *v18;

  v6 = (objc_class *)MEMORY[0x1E0CB3498];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v8, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Nebula"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_titleAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithString:attributes:", v11, v12);

  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Nebula"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v14, "initWithString:", v16);
  v18 = -[HKInfographicContentItem initWithTitle:description:]([HKInfographicContentItem alloc], "initWithTitle:description:", v13, v17);

  return v18;
}

+ (id)_factorDescriptionForDisplayType:(id)a3 factorDisplayType:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "displayTypeIdentifier");
  if (v8 > 136)
  {
    if (v8 == 137)
    {
      if (objc_msgSend(v7, "displayTypeIdentifier") == 191)
      {
        v9 = CFSTR("WALKING_HEARTRATE_PREGNANCY_TITLE");
        v10 = &unk_1E9CE9F50;
        goto LABEL_20;
      }
    }
    else if (v8 == 248)
    {
      if (objc_msgSend(v7, "displayTypeIdentifier") == 191)
      {
        v9 = CFSTR("AFIB_BURDEN_PREGNANCY_TITLE");
        v10 = &unk_1E9CE9F80;
        goto LABEL_20;
      }
    }
    else if (v8 == 284 && objc_msgSend(v7, "displayTypeIdentifier") == 191)
    {
      v9 = CFSTR("STATE_OF_MIND_PREGNANCY_TITLE");
      v10 = &unk_1E9CE9F98;
      goto LABEL_20;
    }
LABEL_21:
    objc_msgSend(a1, "_undefinedFactorDescriptionViewController:factorDisplayType:", v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v8 == 3)
  {
    if (objc_msgSend(v7, "displayTypeIdentifier") == 191)
    {
      v9 = CFSTR("BODY_MASS_PREGNANCY_TITLE");
      v10 = &unk_1E9CE9F20;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (v8 == 118)
  {
    if (objc_msgSend(v7, "displayTypeIdentifier") == 191)
    {
      v9 = CFSTR("RESTING_HEARTRATE_PREGNANCY_TITLE");
      v10 = &unk_1E9CE9F38;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (v8 != 124 || objc_msgSend(v7, "displayTypeIdentifier") != 191)
    goto LABEL_21;
  v9 = CFSTR("CARDIO_FITNESS_PREGNANCY_TITLE");
  v10 = &unk_1E9CE9F68;
LABEL_20:
  objc_msgSend(a1, "_pregnancyHealthFactorDescriptionTitleKey:bodyKeys:", v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v12 = (void *)v11;

  return v12;
}

+ (id)_undefinedFactorDescriptionViewController:(id)a3 factorDisplayType:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HKInfographicContentItem *v19;
  void *v20;
  HKInfographicViewController *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3498];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(a1, "_tableTitleAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", CFSTR("Undefined Factor Description"), v10);

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "localization");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localization");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "displayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("No description is available for %@ with the factor %@."), v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v17);
  v19 = -[HKInfographicContentItem initWithTitle:description:]([HKInfographicContentItem alloc], "initWithTitle:description:", v11, v18);
  v25[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[HKInfographicViewController initWithItems:]([HKInfographicViewController alloc], "initWithItems:", v20);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("LIFE_FACTOR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-AFibBurden"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController setTitle:](v21, "setTitle:", v23);

  return v21;
}

+ (id)_pregnancyHealthFactorDescriptionTitleKey:(id)a3 bodyKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HKInfographicViewController *v15;
  HKInfographicViewController *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  HKInfographicContentItem *(*v22)(uint64_t, void *);
  void *v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[3];
  char v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v6, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Seahorse"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(a1, "_titleAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v9, v11);

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 1;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __91__HKInteractiveChartInfographicFactory__pregnancyHealthFactorDescriptionTitleKey_bodyKeys___block_invoke;
  v23 = &unk_1E9C43588;
  v25 = v26;
  v13 = v12;
  v24 = v13;
  objc_msgSend(v7, "hk_map:", &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [HKInfographicViewController alloc];
  v16 = -[HKInfographicViewController initWithItems:](v15, "initWithItems:", v14, v20, v21, v22, v23);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LIFE_FACTOR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-AFibBurden"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController setTitle:](v16, "setTitle:", v18);

  _Block_object_dispose(v26, 8);
  return v16;
}

HKInfographicContentItem *__91__HKInteractiveChartInfographicFactory__pregnancyHealthFactorDescriptionTitleKey_bodyKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKInfographicContentItem *v9;
  HKInfographicContentItem *v10;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a2;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Seahorse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 0;
    v9 = -[HKInfographicContentItem initWithTitle:description:]([HKInfographicContentItem alloc], "initWithTitle:description:", *(_QWORD *)(a1 + 32), v7);
  }
  else
  {
    v9 = -[HKInfographicTextItem initWithDescription:]([HKInfographicTextItem alloc], "initWithDescription:", v7);
  }
  v10 = v9;

  return v10;
}

@end
