@implementation HMEventTrigger

uint64_t __62__HMEventTrigger_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "weekday"));
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1F03F70F0);
}

id __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[HFEventBuilder eventBuilderForEvent:](HFEventBuilder, "eventBuilderForEvent:", a2);
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1F0416110);
}

id __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_representativeTriggerValue");
}

uint64_t __98__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_characteristics_triggerValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8820]) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "characteristicType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v7);

  }
  return v5;
}

uint64_t __105__HMEventTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_sensorCharacteristics_triggerValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_6;
  v5 = *MEMORY[0x1E0CB8988];
  v20[0] = *MEMORY[0x1E0CB8958];
  v20[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  objc_msgSend(MEMORY[0x1E0CBA458], "hf_valueRangeCharacteristicTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if ((v11 & 1) != 0)
    goto LABEL_5;
  if ((v8 & 1) != 0)
    goto LABEL_5;
  v12 = (void *)MEMORY[0x1E0CBA458];
  objc_msgSend(v3, "characteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hf_abnormalValueForSensorCharacteristicType:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v15)
  {
LABEL_5:
    v16 = *(void **)(a1 + 40);
    objc_msgSend(v3, "characteristicType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "containsObject:", v17);

  }
  else
  {
LABEL_6:
    v18 = 0;
  }

  return v18;
}

uint64_t __108__HMEventTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_nonSensorCharacteristics_triggerValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_containedServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __105__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

uint64_t __130__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionWithCharacteristics_triggerValue_visibleTriggerValues___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

uint64_t __134__HMEventTrigger_NaturalLanguage__hf_triggerRangeValueNaturalLanguageDescriptionWithCharacteristics_triggerValueRange_thresholdValue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0CBA458];
  v3 = a2;
  objc_msgSend(v2, "hf_valueRangeCharacteristicTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

uint64_t __129__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionWithCharacteristics_triggerValueRange_thresholdValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

uint64_t __107__HMEventTrigger_NaturalLanguage__hf_triggerRangeTypeWithCharacteristics_triggerValueRange_thresholdValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

uint64_t __107__HMEventTrigger_NaturalLanguage__hf_triggerRangeTypeWithCharacteristics_triggerValueRange_thresholdValue___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "hf_minimumTriggerValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hf_maximumTriggerValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "maxValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "minValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 40), "minValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "maxValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
LABEL_15:
      v10 = 1;
      goto LABEL_16;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "minValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compare:", v2);

  objc_msgSend(*(id *)(a1 + 40), "maxValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "compare:", v3);

  if (!v7 && v9 == -1)
  {
LABEL_13:
    v10 = 0;
    goto LABEL_16;
  }
  if (!v9 && v7 == 1)
    goto LABEL_15;
  if (*(_QWORD *)(a1 + 48))
    v10 = 2;
  else
    v10 = 3;
LABEL_16:

  return v10;
}

uint64_t __89__HMEventTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __109__HMEventTrigger_NaturalLanguage__hf_naturalLanguageDetailsWithRecurrences_conditions_endEvents_withOptions___block_invoke_2()
{
  HFListFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(HFListFormatter);
  v1 = (void *)qword_1ED378FA0;
  qword_1ED378FA0 = (uint64_t)v0;

}

id __126__HMEventTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithRecurrences_conditions_endEvents_withOptions___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFConditionNaturalLanguageOptions optionsForCondition:inHome:formattingContext:formattingStyle:](HFConditionNaturalLanguageOptions, "optionsForCondition:inHome:formattingContext:formattingStyle:", v4, v5, a1[5], a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hf_naturalLanguageSummaryWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "conditionTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v7, "conditionTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __126__HMEventTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithRecurrences_conditions_endEvents_withOptions___block_invoke_3()
{
  HFListFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(HFListFormatter);
  v1 = (void *)qword_1ED378FB0;
  qword_1ED378FB0 = (uint64_t)v0;

}

uint64_t __126__HMEventTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithRecurrences_conditions_endEvents_withOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __59__HMEventTrigger_HFAdditions__hf_requiresConfirmationToRun__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __59__HMEventTrigger_HFAdditions__hf_requiresConfirmationToRun__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_requiresDeviceUnlock");
}

uint64_t __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1F03F70F0);
}

uint64_t __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke_355(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

void __69__HMEventTrigger_HFEventTriggerAdditions__hf_isHomeAppCreatedTrigger__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_opt_class();
  v13 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v13;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_programmableSwitchServiceTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v7, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_safeAddObject:", v12);

  }
}

void __63__HMEventTrigger_HFEventTriggerAdditions__hf_designateTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_opt_class();
  v13 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v13;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_programmableSwitchServiceTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v7, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_safeAddObject:", v12);

  }
}

void __63__HMEventTrigger_HFEventTriggerAdditions__hf_designateTrigger___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(id, _QWORD);

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("HFDesignatedTriggerAppDataKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
  {
    if (!*(_BYTE *)(a1 + 56))
    {
      NSLog(CFSTR("Trigger '%@' is already marked as undesignated, however the initial check succeeded.  Something is rotten in denmark."), *(_QWORD *)(a1 + 40));
      v7[2](v7, 0);
      goto LABEL_8;
    }
    v5 = (void *)objc_opt_new();
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v5, "addObject:", v6);
  else
    objc_msgSend(v5, "removeObject:", v6);
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("HFDesignatedTriggerAppDataKey"));
  objc_msgSend(*(id *)(a1 + 32), "hf_updateApplicationData:handleError:completionHandler:", v3, 1, v7);

LABEL_8:
}

id __69__HMEventTrigger_HFEventTriggerAdditions__hf_characteristicsInEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    v3 = (id)objc_msgSend(v2, "performSelector:", sel_characteristic);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __95__HMEventTrigger_HFEventTriggerAdditions__hf_allTriggerValuesForCharacteristic_similarToValue___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1EA7CC718, &unk_1EA7CC730, &unk_1EA7CC748, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379460;
  qword_1ED379460 = v0;

}

void __95__HMEventTrigger_HFEventTriggerAdditions__hf_allTriggerValuesForCharacteristic_similarToValue___block_invoke_2_374()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1EA7CC718, &unk_1EA7CC748, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379470;
  qword_1ED379470 = v0;

}

void __95__HMEventTrigger_HFEventTriggerAdditions__hf_allTriggerValuesForCharacteristic_similarToValue___block_invoke_4()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1EA7CC718, &unk_1EA7CC748, &unk_1EA7CC760, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379480;
  qword_1ED379480 = v0;

}

uint64_t __95__HMEventTrigger_HFEventTriggerAdditions__hf_allTriggerValuesForCharacteristic_similarToValue___block_invoke_379(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_hf_valueIsValidForCharacteristic:value:", *(_QWORD *)(a1 + 32), a2);
}

uint64_t __59__HMEventTrigger_AutomationBuilders__hf_updateWithBuilder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithBuilder:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __59__HMEventTrigger_AutomationBuilders__hf_updateWithBuilder___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__HMEventTrigger_AutomationBuilders__hf_newTriggerWithBuilder_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEventTriggerFromBuilder:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

@end
