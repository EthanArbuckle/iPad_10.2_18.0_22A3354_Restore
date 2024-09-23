@implementation HMTrigger(HFAdditions)

- (id)hf_naturalLanguageNameWithHome:()HFAdditions type:
{
  id v6;
  HFTriggerNaturalLanguageOptions *v7;
  void *v8;

  v6 = a3;
  v7 = -[HFTriggerNaturalLanguageOptions initWithHome:nameType:]([HFTriggerNaturalLanguageOptions alloc], "initWithHome:nameType:", v6, a4);

  objc_msgSend(a1, "hf_naturalLanguageNameWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)hf_triggerType
{
  return 0;
}

- (uint64_t)hf_requiresConfirmationToRun
{
  return 0;
}

- (uint64_t)hf_isShortcutOwned
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "actionSets");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_141);

  return v2;
}

- (uint64_t)hf_isBuilder
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)hf_anonymousActions
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "actionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    if (_MergedGlobals_276 != -1)
      dispatch_once(&_MergedGlobals_276, &__block_literal_global_6_7);

  }
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "actionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_flatMap:", &__block_literal_global_9_11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)hf_shouldDisplayTrigger
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  objc_opt_class();
  v2 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(v4, "creator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

LABEL_10:
      objc_msgSend(v4, "events");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "na_any:", &__block_literal_global_14_9);

      goto LABEL_11;
    }
    objc_msgSend(v4, "events");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "na_all:", &__block_literal_global_12_10);

    if ((v8 & 1) == 0)
      goto LABEL_10;
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
LABEL_11:

  return v6;
}

- (id)hf_forceDisableReasons
{
  void *v1;
  void *v3;
  void *v4;

  if (!objc_msgSend(a1, "hf_requiresConfirmationToRun")
    || +[HFUtilities isAMac](HFUtilities, "isAMac")
    || +[HFUtilities isAVisionPro](HFUtilities, "isAVisionPro"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", &unk_1EA7CC6D0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HFUserNotificationCenter sharedInstance](HFUserNotificationCenter, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flatMap:", &__block_literal_global_19_3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

+ (__CFString)hf_localizedStringForSignficantEvent:()HFAdditions offset:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3570]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredLocalizations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("en")))
      v13 = 3;
    else
      v13 = 2;
    objc_msgSend(v9, "setUnitsStyle:", v13);

    objc_msgSend(v9, "setAllowedUnits:", 96);
    objc_msgSend(v8, "hf_absoluteValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDateComponents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateByAddingComponents:toDate:options:", v8, v16, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v16, "isEqual:", v18);
    objc_msgSend(v16, "earlierDate:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9B88]) & 1) != 0)
    {
      if (!v19)
      {
        if (v20 == v16)
          HFLocalizedStringWithFormat(CFSTR("HFTimerTriggerTimeStringSunriseWithPositiveOffset"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v15);
        else
          HFLocalizedStringWithFormat(CFSTR("HFTimerTriggerTimeStringSunriseWithNegativeOffset"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v15);
LABEL_22:
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      goto LABEL_11;
    }
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9B90]) & 1) != 0)
    {
      if (!v19)
      {
        if (v20 == v16)
          HFLocalizedStringWithFormat(CFSTR("HFTimerTriggerTimeStringSunseteWithPositiveOffset"), CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v15);
        else
          HFLocalizedStringWithFormat(CFSTR("HFTimerTriggerTimeStringSunsetWithNegativeOffset"), CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v15);
        goto LABEL_22;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9B88]) & 1) != 0)
    {
      v15 = 0;
LABEL_11:
      v27 = CFSTR("HFTimerTriggerTimeStringSunrise");
LABEL_18:
      _HFLocalizedStringWithDefaultValue(v27, v27, 1);
      v34 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v36 = (__CFString *)v34;
      goto LABEL_24;
    }
    v15 = 0;
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9B90]) & 1) != 0)
    {
LABEL_17:
      v27 = CFSTR("HFTimerTriggerTimeStringSunset");
      goto LABEL_18;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HMTrigger+HFAdditions.m"), 170, CFSTR("Unsupport significant event type: %@"), v7);

  v36 = &stru_1EA741FF8;
LABEL_24:

  return v36;
}

+ (id)hf_sanitizeTriggerName:()HFAdditions home:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  objc_msgSend(a4, "triggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_map:", &__block_literal_global_52);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFUtilities sanitizeAutoGeneratedHomeKitName:](HFUtilities, "sanitizeAutoGeneratedHomeKitName:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFUtilities uniqueHomeKitNameForName:allNames:](HFUtilities, "uniqueHomeKitNameForName:allNames:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (uint64_t)hf_affectsHomeKitObject:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_opt_class();
  v7 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "characteristics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v10);

  }
  objc_opt_class();
  v11 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v13, "services");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_flatMap:", &__block_literal_global_57_0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v15);

    objc_msgSend(v13, "profiles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v16);

  }
  objc_opt_class();
  v17 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if (v19)
  {
    objc_msgSend(v19, "services");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "na_flatMap:", &__block_literal_global_59);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v21);

  }
  objc_opt_class();
  v22 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  if (v24)
    objc_msgSend(v6, "addObject:", v24);
  v25 = v22;
  if (objc_msgSend(v25, "conformsToProtocol:", &unk_1F0449888))
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  if (v27)
  {
    objc_msgSend(v27, "mediaProfiles");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v28);

  }
  if ((objc_msgSend(a1, "hf_affectsCharacteristics:", v5) & 1) != 0)
    v29 = 1;
  else
    v29 = objc_msgSend(a1, "hf_affectsProfiles:", v6);

  return v29;
}

- (uint64_t)hf_affectsCharacteristics:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "actionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HMTrigger_HFAdditions__hf_affectsCharacteristics___block_invoke;
  v9[3] = &unk_1EA728840;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (uint64_t)hf_affectsProfiles:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "actionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__HMTrigger_HFAdditions__hf_affectsProfiles___block_invoke;
  v9[3] = &unk_1EA728840;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

@end
