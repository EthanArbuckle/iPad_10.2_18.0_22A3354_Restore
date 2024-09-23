@implementation HMEventTrigger(NaturalLanguage)

- (id)hf_naturalLanguageNameWithHome:()NaturalLanguage type:
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

- (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_effectiveRecurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "creator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_naturalLanguageNameWithOptions:events:recurrences:forUser:", v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(a1, "name");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (uint64_t)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:
{
  return objc_msgSend(a1, "hf_naturalLanguageNameWithOptions:events:recurrences:forUser:", a3, a4, MEMORY[0x1E0C9AA60], 0);
}

+ (uint64_t)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:forUser:
{
  return objc_msgSend(a1, "hf_naturalLanguageNameWithOptions:events:recurrences:forUser:", a3, a4, MEMORY[0x1E0C9AA60], a5);
}

+ (uint64_t)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:recurrences:
{
  return objc_msgSend(a1, "hf_naturalLanguageNameWithOptions:events:recurrences:forUser:", a3, a4, a5, 0);
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage events:recurrences:forUser:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_120_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_122_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v10, "na_filter:", &__block_literal_global_124_0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "na_map:", &__block_literal_global_176_0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "na_firstObjectPassingTest:", &__block_literal_global_179);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v14)
  {
    objc_msgSend((id)objc_opt_class(), "hf_naturalLanguageNameWithOptions:presenceEvent:", v9, v14);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v22 = (void *)v21;
    if (v21)
      goto LABEL_10;
    goto LABEL_7;
  }
  if (!v13)
  {
    if (!v19)
    {
      if (objc_msgSend(v17, "count"))
      {
        v39 = (void *)MEMORY[0x1E0CB3550];
        objc_msgSend(v17, "na_map:", &__block_literal_global_190);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setWithSet:", v35);
        v34 = v11;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "na_mostCommonObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_7;
        v42[3] = &unk_1EA72D698;
        v43 = v40;
        v33 = v40;
        objc_msgSend(v17, "na_filter:", v42);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "na_map:", &__block_literal_global_192);
        v29 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0CB3550];
        v41 = (void *)v29;
        objc_msgSend(v32, "na_map:", &__block_literal_global_193);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setWithSet:", v31);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "na_mostCommonObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v34;
        objc_msgSend((id)objc_opt_class(), "hf_naturalLanguageNameWithOptions:characteristics:triggerValue:", v9, v41, v37);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          goto LABEL_10;
      }
      goto LABEL_7;
    }
    objc_msgSend(v19, "naturalLanguageNameWithOptions:recurrences:", v9, v11);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(v13, "region");
  v38 = v13;
  v23 = v17;
  v24 = v11;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hf_naturalLanguageNameWithOptions:region:forUser:", v9, v25, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v24;
  v17 = v23;
  v13 = v38;
  if (v22)
    goto LABEL_10;
LABEL_7:
  HFLogForCategory(0x43uLL);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v10;
    _os_log_fault_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_FAULT, "Could not generate name for events: %@", buf, 0xCu);
  }

  _HFLocalizedStringWithDefaultValue(CFSTR("HFTriggerDescriptionUnknownName"), CFSTR("HFTriggerDescriptionUnknownName"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v22;
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage region:forUser:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  HFUserNameFormatter *v33;
  void *v34;
  HFUserNameFormatter *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v9, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(v8, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentUser");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v17 = CFSTR("HFOtherUser_");
    if (v16 == v10)
      v17 = CFSTR("HFCurrentUser_");
    v18 = v17;
    if (objc_msgSend(v9, "notifyOnEntry") && (objc_msgSend(v9, "notifyOnExit") & 1) != 0)
    {
      v19 = CFSTR("ArriveOrLeaveLocationTriggerName");
    }
    else if ((objc_msgSend(v9, "notifyOnEntry") & 1) != 0)
    {
      v19 = CFSTR("ArriveLocationTriggerName");
    }
    else
    {
      if (!objc_msgSend(v9, "notifyOnExit"))
      {
LABEL_18:
        if (v12)
        {
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Home")) & 1) != 0)
          {
            v21 = CFSTR("_Home");
          }
          else if (objc_msgSend(v12, "isEqualToString:", CFSTR("Work")))
          {
            v21 = CFSTR("_Work");
          }
          else
          {
            v21 = CFSTR("_placeName");
          }
          -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v21);
          v22 = objc_claimAutoreleasedReturnValue();

          v18 = (__CFString *)v22;
        }
        v49 = v12;
        if (objc_msgSend(v8, "nameType") == 2)
        {
          -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", CFSTR("_fullSentence"));
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "actions");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "count");

          if (v25)
          {
            objc_msgSend(v8, "actionNaturalLanguageOptions");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setFormattingContext:", 5);

            objc_msgSend(v8, "actions");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "actionNaturalLanguageOptions");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[HFActionNaturalLanguageUtilities hf_naturalLanguageDescriptionForActions:withOptions:](HFActionNaturalLanguageUtilities, "hf_naturalLanguageDescriptionForActions:withOptions:", v27, v28);
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (-[__CFString length](v29, "length"))
            {
              -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("_WithAction"));
              v30 = objc_claimAutoreleasedReturnValue();
              v31 = v23;
              v23 = (__CFString *)v30;
            }
            else
            {
              v31 = v29;
              v29 = 0;
            }

          }
          else
          {
            v29 = 0;
          }
          v18 = v23;
        }
        else
        {
          v29 = 0;
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 != v10)
        {
          v48 = a1;
          v33 = [HFUserNameFormatter alloc];
          objc_msgSend(v8, "home");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[HFUserNameFormatter initWithHome:](v33, "initWithHome:", v34);

          -[HFUserNameFormatter setStyle:](v35, "setStyle:", 1);
          objc_msgSend(v8, "home");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "hf_handleForUser:", v10);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          -[HFUserNameFormatter stringForObjectValue:](v35, "stringForObjectValue:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            objc_msgSend(v32, "na_safeAddObject:", v38);
          }
          else
          {
            objc_msgSend(v10, "name");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v39)
            {
              objc_msgSend(v32, "na_safeAddObject:", v39);
            }
            else
            {
              objc_msgSend(v10, "userID");
              v40 = objc_claimAutoreleasedReturnValue();
              v47 = (void *)v40;
              if (v40)
              {
                objc_msgSend(v32, "na_safeAddObject:", v40);
              }
              else
              {
                _HFLocalizedStringWithDefaultValue(CFSTR("HFOtherUserDefaultName"), CFSTR("HFOtherUserDefaultName"), 1);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "na_safeAddObject:", v46);

              }
            }

          }
          a1 = v48;
        }
        objc_msgSend(v32, "na_safeAddObject:", v49);
        objc_msgSend(v32, "na_safeAddObject:", v29);
        v41 = (void *)MEMORY[0x1E0CB3940];
        _HFLocalizedStringWithDefaultValue(v18, v18, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "hf_stringWithFormat:arguments:", v42, v32);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v8, "nameType"))
        {
          objc_msgSend(v8, "home");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "hf_sanitizeTriggerName:home:", v14, v43);
          v44 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v44;
        }

        goto LABEL_48;
      }
      v19 = CFSTR("LeaveLocationTriggerName");
    }
    -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v18 = (__CFString *)v20;
    goto LABEL_18;
  }
  HFLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "region is nil!", buf, 2u);
  }

  _HFLocalizedStringWithDefaultValue(CFSTR("HFUnknownLocationTriggerName"), CFSTR("HFUnknownLocationTriggerName"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_48:

  return v14;
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage presenceEvent:
{
  id v5;
  id v6;
  HFPresenceEventFormatter *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HFPresenceEventBuilder *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = -[HFPresenceEventFormatter initWithOptions:]([HFPresenceEventFormatter alloc], "initWithOptions:", v5);
  -[HFPresenceEventFormatter setStyle:](v7, "setStyle:", 0);
  objc_msgSend(v5, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    goto LABEL_5;
  objc_msgSend(v5, "actionNaturalLanguageOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFormattingContext:", 5);

  objc_msgSend(v5, "actions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionNaturalLanguageOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFActionNaturalLanguageUtilities hf_naturalLanguageDescriptionForActions:withOptions:](HFActionNaturalLanguageUtilities, "hf_naturalLanguageDescriptionForActions:withOptions:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "length"))
  {

LABEL_5:
    -[HFPresenceEventFormatter stringForPresenceEvent:](v7, "stringForPresenceEvent:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v14 = -[HFPresenceEventBuilder initWithEvent:]([HFPresenceEventBuilder alloc], "initWithEvent:", v6);
  -[HFPresenceEventFormatter stringForPresenceEventBuilder:actionsDescription:](v7, "stringForPresenceEventBuilder:actionsDescription:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v15;
}

+ (id)hf_naturalLanguageDescriptionForCharacteristic:()NaturalLanguage
{
  void *v3;
  __CFString *v4;
  void *v5;

  objc_msgSend(a3, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB87B0]) & 1) != 0)
  {
    v4 = CFSTR("HFCharacteristicTriggerDescriptionTypeAirQuality");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8880]) & 1) != 0)
  {
    v4 = CFSTR("HFCharacteristicTriggerDescriptionTypeHumidity");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8890]) & 1) != 0)
  {
    v4 = CFSTR("HFCharacteristicTriggerDescriptionTypeTemperature");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8860]))
  {
    v4 = CFSTR("HFCharacteristicTriggerDescriptionTypeLightLevel");
  }
  else
  {
    v4 = 0;
  }
  _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("No localized string for characteristic description key: %@"), v4);

  return v5;
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage characteristics:triggerValue:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "count"))
    NSLog(CFSTR("characteristics must not be nil or empty"));
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_characteristics_triggerValue___block_invoke;
    v15[3] = &unk_1EA72BB50;
    v16 = v11;
    v12 = v11;
    if (objc_msgSend(v9, "na_any:", v15))
      objc_msgSend(a1, "_hf_naturalLanguageNameWithOptions:sensorCharacteristics:triggerValue:", v8, v9, v10);
    else
      objc_msgSend(a1, "_hf_naturalLanguageNameWithOptions:nonSensorCharacteristics:triggerValue:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicTriggerDescriptionUnknownName"), CFSTR("HFCharacteristicTriggerDescriptionUnknownName"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)_hf_naturalLanguageNameWithOptions:()NaturalLanguage sensorCharacteristics:triggerValue:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  id v53;
  id v54;
  _QWORD v56[4];
  id v57;
  id v58;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __105__HMEventTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_sensorCharacteristics_triggerValue___block_invoke;
  v56[3] = &unk_1EA72D700;
  v11 = v9;
  v57 = v11;
  v12 = v10;
  v58 = v12;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v56);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "characteristicType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v53 = v12;
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB8958]))
    {
      objc_opt_class();
      v16 = v11;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      v19 = objc_msgSend(v18, "BOOLValue");
      v20 = CFSTR("HFCharacteristicTriggerDescriptionSensorMotionNotDetected");
      v21 = CFSTR("HFCharacteristicTriggerDescriptionSensorMotionDetected");
LABEL_7:
      if (v19)
        v20 = (__CFString *)v21;
      v52 = v20;

LABEL_33:
      objc_msgSend(MEMORY[0x1E0CBA458], "hf_valueRangeCharacteristicTypes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "containsObject:", v15);

      if (v28)
      {
        objc_opt_class();
        v29 = v11;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;
        v31 = v30;

        if (v31)
        {
          objc_msgSend(v13, "hf_thresholdValueForRange:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_hf_triggerRangeKeyComponentForRangeType:", objc_msgSend(a1, "hf_triggerRangeTypeWithCharacteristics:triggerValueRange:thresholdValue:", v8, v31, v32));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v8, v32);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v50 = 0;
          v51 = 0;
        }

      }
      else
      {
        v50 = 0;
        v51 = 0;
      }
      objc_msgSend(v7, "actions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v11;
      v48 = v13;
      if (objc_msgSend(v33, "count"))
      {
        objc_msgSend(v7, "actionNaturalLanguageOptions");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          v36 = 0;
          goto LABEL_48;
        }
        objc_msgSend(v7, "actions");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "actionNaturalLanguageOptions");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFActionNaturalLanguageUtilities hf_naturalLanguageDescriptionForActions:withOptions:](HFActionNaturalLanguageUtilities, "hf_naturalLanguageDescriptionForActions:withOptions:", v33, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v36 = 0;
      }

LABEL_48:
      v37 = v8;
      objc_msgSend(v8, "anyObject", v48);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "service");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "hf_parentRoom");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "home");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "roomForEntireHome");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v40, "isEqual:", v42);

      if ((v43 & 1) != 0)
      {
        v44 = 0;
      }
      else
      {
        objc_msgSend(v40, "name");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(a1, "_hf_alarmNaturalLanguageNameWithNameStringKey:nameType:thresholdKey:thresholdValueDescription:roomName:actionsDescription:", v52, objc_msgSend(v7, "nameType"), v51, v50, v44, v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v37;
      v12 = v53;
      v11 = v54;
      v13 = v49;
      goto LABEL_52;
    }
    if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB87D8]) & 1) != 0)
    {
      v23 = CFSTR("HFCharacteristicTriggerDescriptionSensorCO2Detected");
    }
    else if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB87F0]) & 1) != 0)
    {
      v23 = CFSTR("HFCharacteristicTriggerDescriptionSensorCODetected");
    }
    else if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB8930]) & 1) != 0)
    {
      v23 = CFSTR("HFCharacteristicTriggerDescriptionSensorLeakDetected");
    }
    else
    {
      if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB8988]))
      {
        objc_opt_class();
        v24 = v11;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
        v18 = v25;

        v19 = objc_msgSend(v18, "BOOLValue");
        v20 = CFSTR("HFCharacteristicTriggerDescriptionSensorOccupancyNotDetected");
        v21 = CFSTR("HFCharacteristicTriggerDescriptionSensorOccupancyDetected");
        goto LABEL_7;
      }
      if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB8A38]) & 1) != 0)
      {
        v23 = CFSTR("HFCharacteristicTriggerDescriptionSensorSmokeDetected");
      }
      else if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB87B0]) & 1) != 0)
      {
        v23 = CFSTR("HFCharacteristicTriggerDescriptionSensorAirQuality");
      }
      else if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB8890]) & 1) != 0)
      {
        v23 = CFSTR("HFCharacteristicTriggerDescriptionSensorTemperature");
      }
      else if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB8880]) & 1) != 0)
      {
        v23 = CFSTR("HFCharacteristicTriggerDescriptionSensorHumidity");
      }
      else
      {
        v26 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB8860]);
        v23 = CFSTR("HFCharacteristicTriggerDescriptionSensorLightLevel");
        if (!v26)
          v23 = 0;
      }
    }
    v52 = (__CFString *)v23;
    goto LABEL_33;
  }
  v22 = 0;
LABEL_52:
  if (!objc_msgSend(v7, "nameType"))
  {
    objc_msgSend(v7, "home");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_sanitizeTriggerName:home:", v22, v45);
    v46 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v46;
  }

  return v22;
}

+ (id)_hf_alarmNaturalLanguageNameWithNameStringKey:()NaturalLanguage nameType:thresholdKey:thresholdValueDescription:roomName:actionsDescription:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("_%@"), v14);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "na_safeAddObject:", v15);
      v13 = (id)v19;
    }
    if (a4 == 1)
      v20 = CFSTR("_Fragment");
    else
      v20 = CFSTR("_Sentence");
    objc_msgSend(v13, "stringByAppendingString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v21, "stringByAppendingString:", CFSTR("_withRoom"));
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "addObject:", v16);
      v21 = (void *)v22;
    }
    if (v17)
    {
      objc_msgSend(v21, "stringByAppendingString:", CFSTR("_WithAction"));
      v23 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "addObject:", v17);
      v21 = (void *)v23;
    }
    _HFLocalizedStringWithDefaultValue(v21, v21, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "hf_stringWithFormat:arguments:", v24, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicTriggerDescriptionUnknownName"), CFSTR("HFCharacteristicTriggerDescriptionUnknownName"), 1);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;

  }
  else
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicTriggerDescriptionUnknownName"), CFSTR("HFCharacteristicTriggerDescriptionUnknownName"), 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

+ (id)_hf_naturalLanguageNameWithOptions:()NaturalLanguage nonSensorCharacteristics:triggerValue:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
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
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicTriggerDescriptionUnknownName"), CFSTR("HFCharacteristicTriggerDescriptionUnknownName"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v48 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v12 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValueRange:thresholdValue:", v10, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v10, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "anyObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hf_serviceGroupsForService:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v21 = v20;
  else
    v21 = v17;
  objc_msgSend(v21, "hf_displayName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsInContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    objc_msgSend(v8, "objectsInContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __108__HMEventTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_nonSensorCharacteristics_triggerValue___block_invoke;
    v49[3] = &unk_1EA72B188;
    v26 = v17;
    v50 = v26;
    objc_msgSend(v25, "na_firstObjectPassingTest:", v49);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      if (v20)
        v28 = v20;
      else
        v28 = v26;
      objc_msgSend(v28, "hf_serviceNameComponents");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "rawServiceName");
      v30 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v30;
    }

  }
  if (v22 && v15)
  {
    if (objc_msgSend(v8, "nameType") == 2)
    {
      objc_msgSend(v8, "actions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "count");

      v33 = CFSTR("HFCharacteristicTriggerDescriptionFormatString_fullSentence");
      if (v32)
      {
        objc_msgSend(v8, "actionNaturalLanguageOptions");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setFormattingContext:", 5);

        objc_msgSend(v8, "actions");
        v47 = a1;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "actionNaturalLanguageOptions");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFActionNaturalLanguageUtilities hf_naturalLanguageDescriptionForActions:withOptions:](HFActionNaturalLanguageUtilities, "hf_naturalLanguageDescriptionForActions:withOptions:", v35, v36);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        a1 = v47;
        if (objc_msgSend(v32, "length"))
          v33 = CFSTR("HFCharacteristicTriggerDescriptionFormatString_fullSentence_WithAction");
      }
    }
    else
    {
      v32 = 0;
      v33 = CFSTR("HFCharacteristicTriggerDescriptionFormatString");
    }
    if (objc_msgSend(v32, "length"))
      HFLocalizedStringWithFormat(v33, CFSTR("%@%@%@"), v37, v38, v39, v40, v41, v42, (uint64_t)v22);
    else
      HFLocalizedStringWithFormat(v33, CFSTR("%@%@"), v37, v38, v39, v40, v41, v42, (uint64_t)v22);
    v43 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v43;
  }
  if (!objc_msgSend(v8, "nameType"))
  {
    objc_msgSend(v8, "home");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_sanitizeTriggerName:home:", v11, v44);
    v45 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v45;
  }

  return v11;
}

+ (id)hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:()NaturalLanguage
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics___block_invoke;
  v12[3] = &unk_1EA72BB50;
  v6 = v5;
  v13 = v6;
  v7 = objc_msgSend(v3, "na_any:", v12);

  if ((v7 & 1) != 0)
    goto LABEL_2;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB87B0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3658], "hf_valueFormatterForCharacteristic:options:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8890]))
  {
    +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "temperatureFormatter");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v8 = (void *)v10;

    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8880]))
  {
    +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "percentFormatter");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8860]))
  {
    +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "luxFormatter");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_2:
  v8 = 0;
LABEL_12:

  return v8;
}

+ (id)hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValue:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_visibleTriggerValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:visibleTriggerValues:", v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValue:visibleTriggerValues:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  id v16;
  char isKindOfClass;
  uint64_t v18;
  char v19;
  __CFString *v20;
  void *v21;
  int v22;
  int v23;
  __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  __CFString *v32;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, void *);
  void *v39;
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "characteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = __130__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionWithCharacteristics_triggerValue_visibleTriggerValues___block_invoke;
  v39 = &unk_1EA72BB50;
  v13 = v12;
  v40 = v13;
  v14 = objc_msgSend(v8, "na_any:", &v36);
  objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_valueRangeCharacteristicTypes");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "containsObject:", v13))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_20:
        objc_msgSend(v15, "stringForObjectValue:", v9);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      v16 = v9;
      v18 = objc_msgSend(MEMORY[0x1E0CBA458], "hf_indexOfSortedValues:closestToValue:", v10, v16);
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = v16;
      }
      else
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v18);
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    goto LABEL_20;
  }
  if (v9)
    v19 = v14;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsObject:", v13);

    if (v22)
    {
      v23 = objc_msgSend(v9, "BOOLValue");
      v24 = CFSTR("HFCharacteristicTriggerDescriptionValueOff");
      v25 = CFSTR("HFCharacteristicTriggerDescriptionValueOn");
LABEL_13:
      if (v23)
        v24 = (__CFString *)v25;
LABEL_26:
      v20 = v24;
      goto LABEL_27;
    }
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8868]))
    {
      v26 = objc_msgSend(v9, "integerValue");
      v24 = CFSTR("HFCharacteristicTriggerDescriptionValueUnlocked");
      v27 = CFSTR("HFCharacteristicTriggerDescriptionValueLocked");
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8838]))
      {
        if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8820]))
        {
          if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8888]))
          {
            v35 = objc_msgSend(v9, "integerValue");
            if (v35 < 5)
            {
              v20 = off_1EA72D830[v35];
              goto LABEL_27;
            }
            goto LABEL_10;
          }
          if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8878]))
          {
            if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8908]) & 1) != 0)
            {
              objc_msgSend(a1, "hf_localizationKeyForProgrammableSwitchCharacteristic:value:", v11, v9);
              v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v20)
                goto LABEL_27;
              goto LABEL_10;
            }
            if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8958]))
            {
              v23 = objc_msgSend(v9, "BOOLValue");
              v24 = CFSTR("HFCharacteristicTriggerDescriptionValueDetectsNoMotion");
              v25 = CFSTR("HFCharacteristicTriggerDescriptionValueDetectsMotion");
            }
            else
            {
              if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB87D8]) & 1) != 0)
              {
                v20 = CFSTR("HFCharacteristicTriggerDescriptionValueDetectsCO2");
                goto LABEL_27;
              }
              if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB87F0]) & 1) != 0)
              {
                v20 = CFSTR("HFCharacteristicTriggerDescriptionValueDetectsCO");
                goto LABEL_27;
              }
              if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8930]) & 1) != 0)
              {
                v20 = CFSTR("HFCharacteristicTriggerDescriptionValueDetectsLeak");
                goto LABEL_27;
              }
              if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8988]))
              {
                if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8A38]) & 1) != 0)
                {
                  v20 = CFSTR("HFCharacteristicTriggerDescriptionValueDetectsSmoke");
                  goto LABEL_27;
                }
                goto LABEL_10;
              }
              v23 = objc_msgSend(v9, "BOOLValue");
              v24 = CFSTR("HFCharacteristicTriggerDescriptionValueDetectsNoOccupancy");
              v25 = CFSTR("HFCharacteristicTriggerDescriptionValueDetectsOccupancy");
            }
            goto LABEL_13;
          }
        }
        v34 = objc_msgSend(v9, "integerValue");
        v24 = CFSTR("HFCharacteristicTriggerDescriptionValueOpen");
        v27 = CFSTR("HFCharacteristicTriggerDescriptionValueClosed");
        v29 = v34 == 0;
LABEL_24:
        if (v29)
          v24 = (__CFString *)v27;
        goto LABEL_26;
      }
      v26 = objc_msgSend(v9, "integerValue");
      v24 = CFSTR("HFCharacteristicTriggerDescriptionValueOpen");
      v27 = CFSTR("HFCharacteristicTriggerDescriptionValueClosed");
    }
    v29 = v26 == 1;
    goto LABEL_24;
  }
LABEL_10:
  v20 = CFSTR("HFCharacteristicTriggerDescriptionValueOther");
LABEL_27:
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Plural"), v20, v36, v37, v38, v39);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_hf_localizedStringOrNilIfNotFoundForKey:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = v30;

      v20 = v32;
    }

  }
  _HFLocalizedStringWithDefaultValue(v20, v20, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
    NSLog(CFSTR("No localized string for trigger value description key: %@"), 0);

LABEL_34:
  return v28;
}

+ (id)hf_triggerRangeValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValueRange:thresholdValue:
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "na_any:", &__block_literal_global_328);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  if (!v9 || !v11)
    goto LABEL_11;
  objc_msgSend(a1, "_hf_triggerRangeKeyComponentForRangeType:", objc_msgSend(a1, "hf_triggerRangeTypeWithCharacteristics:triggerValueRange:thresholdValue:", v8, v9, v10));
  v15 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v15;
  if (!v10)
  {
    v13 = 0;
    if (v15)
      goto LABEL_5;
LABEL_8:
    v14 = 0;
    goto LABEL_11;
  }
  objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_8;
LABEL_5:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTriggerRangeValueNaturalLanguageDescription_%@"), v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v16;
  if (v13)
  {
    HFLocalizedStringWithFormat(v16, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("_WithoutValue"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v24, v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_11:

  return v14;
}

+ (id)hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:()NaturalLanguage triggerValueRange:thresholdValue:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "characteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __129__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionWithCharacteristics_triggerValueRange_thresholdValue___block_invoke;
  v22 = &unk_1EA72BB50;
  v13 = v12;
  v23 = v13;
  if ((objc_msgSend(v8, "na_any:", &v19) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_valueRangeCharacteristicTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v13);

    if (v15)
    {
      objc_msgSend(a1, "hf_triggerRangeValueNaturalLanguageDescriptionWithCharacteristics:triggerValueRange:thresholdValue:", v8, v9, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8878]))
    {
      objc_msgSend(v9, "hf_representativeValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v8, v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicTriggerDescriptionValueOther"), CFSTR("HFCharacteristicTriggerDescriptionValueOther"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    NSLog(CFSTR("No localized string for trigger value range description key: %@"), CFSTR("HFCharacteristicTriggerDescriptionValueOther"), v19, v20, v21, v22);
LABEL_8:

  return v16;
}

+ (id)hf_localizationKeyForProgrammableSwitchCharacteristic:()NaturalLanguage value:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    objc_msgSend(a3, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_isValidValue:", v6);

    if (v9)
    {
      HFProgrammableSwitchLocalizedStringKeyForValue(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (id)hf_localizedStringForProgrammableSwitchCharacteristic:()NaturalLanguage value:
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "hf_localizationKeyForProgrammableSwitchCharacteristic:value:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    _HFLocalizedStringWithDefaultValue(v1, v1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)hf_naturalLanguageTurnOffAfterDuration:()NaturalLanguage style:
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  if (a3)
  {
    objc_msgSend(a3, "doubleValue");
    v6 = v5;
    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredLocalizations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("en"));

    if (v11)
      v12 = 3;
    else
      v12 = 2;
    objc_msgSend(v7, "setUnitsStyle:", v12);
    objc_msgSend(v7, "stringFromTimeInterval:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v13;
    if (a4 == 1)
    {
      HFLocalizedStringWithFormat(CFSTR("HFTriggerDurationValueDurationFormatSentence"), CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    }
    else
    {
      if (a4)
      {
        v22 = v13;
        goto LABEL_12;
      }
      HFLocalizedStringWithFormat(CFSTR("HFTriggerDurationValueDurationFormat"), CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    }
    v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v21 = v22;

    return v21;
  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFTriggerDurationValueNoDuration"), CFSTR("HFTriggerDurationValueNoDuration"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  return v21;
}

+ (const)_hf_triggerRangeKeyComponentForRangeType:()NaturalLanguage
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("DropsBelow");
  else
    return off_1EA72D858[a3 - 1];
}

+ (unint64_t)hf_triggerRangeTypeWithCharacteristics:()NaturalLanguage triggerValueRange:thresholdValue:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  _QWORD v20[7];
  _QWORD v21[4];
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "characteristicType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __107__HMEventTrigger_NaturalLanguage__hf_triggerRangeTypeWithCharacteristics_triggerValueRange_thresholdValue___block_invoke;
  v21[3] = &unk_1EA72BB50;
  v13 = v11;
  v22 = v13;
  if ((objc_msgSend(v7, "na_any:", v21) & 1) != 0)
  {
    v14 = 3;
  }
  else
  {
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __107__HMEventTrigger_NaturalLanguage__hf_triggerRangeTypeWithCharacteristics_triggerValueRange_thresholdValue___block_invoke_2;
    v20[3] = &unk_1EA72D748;
    v20[4] = v10;
    v20[5] = v8;
    v20[6] = v9;
    v14 = __107__HMEventTrigger_NaturalLanguage__hf_triggerRangeTypeWithCharacteristics_triggerValueRange_thresholdValue___block_invoke_2((uint64_t)v20);
  }
  objc_msgSend(v7, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "characteristicType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB87B0]);

  if (v14 <= 1)
    v18 = 1;
  else
    v18 = v14;
  if (v14 == 1)
    v18 = 0;
  if (v17)
    v14 = v18;

  return v14;
}

+ (id)_hf_localizedStringOrNilIfNotFoundForKey:()NaturalLanguage
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  _HFLocalizedStringWithDefaultValue(v3, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "isEqualToString:", &stru_1EA741FF8) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", v3))
  {

    v5 = 0;
  }

  return v5;
}

- (id)_hf_naturalLanguageDetailsSentenceElementsWithOptions:()NaturalLanguage
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

  v4 = a3;
  objc_msgSend(a1, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFConditionCollection conditionCollectionForPredicate:](HFConditionCollection, "conditionCollectionForPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "conditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_352);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      objc_msgSend(v6, "removeCondition:", v8);
  }
  v10 = (void *)objc_opt_class();
  objc_msgSend(a1, "hf_effectiveRecurrences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:conditions:endEvents:withOptions:", v11, v6, v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)hf_naturalLanguageDetailsWithRecurrences:()NaturalLanguage conditions:endEvents:withOptions:
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:conditions:endEvents:withOptions:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  if (objc_msgSend(v2, "count"))
  {
    if (qword_1ED378F98 != -1)
      dispatch_once(&qword_1ED378F98, &__block_literal_global_355);
    v3 = (id)qword_1ED378FA0;
    objc_msgSend(v3, "setListStyle:", 2);
    objc_msgSend(v2, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringForObjectValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:()NaturalLanguage conditions:endEvents:withOptions:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  __int128 v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CBA910], "hf_recurrenceNaturalLanguageStringKeyWithOptions:recurrences:", v12, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v14, "localizedStringWithArgumentBlock:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v15);

      }
    }

  }
  if (v10)
  {
    objc_msgSend(v10, "conditions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __126__HMEventTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithRecurrences_conditions_endEvents_withOptions___block_invoke;
    v30[3] = &unk_1EA72D7D0;
    v31 = v12;
    v32 = xmmword_1DD669620;
    objc_msgSend(v16, "na_map:", v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count"))
    {
      if (qword_1ED378FA8 != -1)
        dispatch_once(&qword_1ED378FA8, &__block_literal_global_360);
      v18 = (id)qword_1ED378FB0;
      objc_msgSend(v18, "stringForObjectValue:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hf_stringByCapitalizingFirstWord");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v20);

    }
  }
  objc_msgSend(v11, "na_firstObjectPassingTest:", &__block_literal_global_361);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "duration");
    v24 = v23;
    v25 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hf_naturalLanguageTurnOffAfterDuration:style:", v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "addObject:", v27);
  }
  v28 = (void *)objc_msgSend(v13, "copy");

  return v28;
}

@end
