@implementation HKCategorySample(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(a1, "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");

  if (v6 != 140)
  {
    if (v6 == 250)
    {
      objc_msgSend(a1, "_addWalkingSteadinessEventDetailValuesToSection:", v4);
      goto LABEL_7;
    }
    if (v6 != 147)
    {
      objc_msgSend(a1, "_addDefaultCategoryDetailValuesToSection:", v4);
      goto LABEL_7;
    }
  }
  objc_msgSend(a1, "_addHeartEventDetailValuesToSection:", v4);
LABEL_7:
  v7.receiver = a1;
  v7.super_class = (Class)&off_1F02283F8;
  objc_msgSendSuper2(&v7, sel_addDetailValuesToSection_, v4);

}

- (void)_addDefaultCategoryDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
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
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "displayTypeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTypeForObjectType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_enumeratedValueLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(a1, "sampleType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = CFSTR("DisplayType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v10, v12, v16);

  }
}

- (void)_addHeartEventDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  uint64_t v26;
  uint64_t v27;
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
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("BEATS_PER_MINUTE_NUMBERLESS_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = a1;
  objc_msgSend(v9, "localizedStringWithFormat:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB72A8];
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB72A8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    HKFormatValueAndUnit(v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", v13, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "sampleType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v41 = a1;
    v19 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v20;
    v45[1] = CFSTR("Range");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v21 = v14;
    v22 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v15, v17, v24);

    v11 = v22;
    v14 = v21;

    v5 = v19;
    v10 = v41;

  }
  objc_msgSend(v10, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0CB5520];
  objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0CB5520]);
  v27 = objc_claimAutoreleasedReturnValue();
  v43 = v4;
  if (v27)
  {
    v28 = (void *)v27;

LABEL_6:
    objc_msgSend(v28, "doubleValueForUnit:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    HKLocalizedStringForNumberWithDecimalPrecision(v30, 0, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    HKFormatValueAndUnit(v31, v11);
    v42 = v5;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", v26, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sampleType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v36;
    v44[1] = CFSTR("Threshold");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v37 = v14;
    v38 = v11;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addText:detail:baseIdentifier:", v32, v34, v40);

    v11 = v38;
    v14 = v37;

    v5 = v42;
    goto LABEL_7;
  }
  objc_msgSend(v10, "metadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72A0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    goto LABEL_6;
LABEL_7:

}

- (void)_addWalkingSteadinessEventDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "value") - 1;
  if (v7 <= 3
    && (+[HKMobilityUtilities localizedTitleForClassification:](HKMobilityUtilities, "localizedTitleForClassification:", qword_1D7B82B98[v7]), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WALKING_STEADINESS_EVENT_VALUE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-WalkingSteadiness"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v6;
    v25[1] = CFSTR("EventValue");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v9, v11, v13);

  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB5328];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_FAULT))
      -[HKCategorySample(HKDataMetadataDetailSection) _addWalkingSteadinessEventDetailValuesToSection:].cold.1(v14, a1);
  }
  v15 = objc_msgSend(a1, "value");
  if ((unint64_t)(v15 - 3) < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("WALKING_STEADINESS_EVENT_TYPE_REPEAT");
  }
  else
  {
    if ((unint64_t)(v15 - 1) > 1)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("WALKING_STEADINESS_EVENT_TYPE_INITIAL");
  }
  objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-WalkingSteadiness"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("WALKING_STEADINESS_EVENT_TYPE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-WalkingSteadiness"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    v24[1] = CFSTR("EventType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v19, v21, v23);

  }
LABEL_12:

}

- (void)_addWalkingSteadinessEventDetailValuesToSection:()HKDataMetadataDetailSection .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = 134217984;
  v5 = objc_msgSend(a2, "value");
  _os_log_fault_impl(&dword_1D7813000, v3, OS_LOG_TYPE_FAULT, "Unable to localize classification for category value: %llu", (uint8_t *)&v4, 0xCu);

}

@end
