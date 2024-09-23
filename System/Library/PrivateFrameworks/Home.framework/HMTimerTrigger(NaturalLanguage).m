@implementation HMTimerTrigger(NaturalLanguage)

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
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(a1, "recurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(a1, "recurrence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_arrayWithSafeObject:", v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFUnknownTimerTriggerName"), CFSTR("HFUnknownTimerTriggerName"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fireDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_opt_class();
    objc_msgSend(a1, "fireDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_naturalLanguageNameWithOptions:fireDate:recurrences:", v4, v13, v7);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:

    v10 = (void *)v14;
    goto LABEL_9;
  }
  objc_msgSend(a1, "significantEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)objc_opt_class();
    objc_msgSend(a1, "significantEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "significantEventOffset");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hf_naturalLanguageNameWithOptions:significantEvent:offset:recurrences:", v4, v13, v17, v7);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v17;
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage fireDate:recurrences:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v9, 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_hf_naturalLanguageNameWithOptions:timeString:fireDate:recurrences:", v8, v11, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSLog(CFSTR("fireDate must not be nil"));
    _HFLocalizedStringWithDefaultValue(CFSTR("HFUnknownTimerTriggerName"), CFSTR("HFUnknownTimerTriggerName"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)hf_naturalLanguageNameWithOptions:()NaturalLanguage significantEvent:offset:recurrences:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
    NSLog(CFSTR("significantEvent must not be nil"));
  objc_msgSend((id)objc_opt_class(), "hf_localizedStringForSignficantEvent:offset:", v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hf_naturalLanguageNameWithOptions:timeString:fireDate:recurrences:", v10, v14, 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (uint64_t)hf_recurrenceNaturalLanguageStringKeyWithOptions:()NaturalLanguage recurrences:
{
  return objc_msgSend(a1, "hf_recurrenceNaturalLanguageStringKeyWithOptions:recurrences:intendedForTimeTriggerEditor:", a3, a4, 0);
}

+ (id)hf_recurrenceNaturalLanguageStringKeyWithOptions:()NaturalLanguage recurrences:intendedForTimeTriggerEditor:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  HFLocalizableStringKey *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  HFLocalizableStringKey *v39;
  const __CFString *v40;
  HFEmptyLocalizableStringKey *v41;
  int v42;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hf_dailyWeekdayIntervalComponentsWithCalendar:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "na_any:", &__block_literal_global_26))
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "na_map:", &__block_literal_global_29_0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v12;
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v53 = a5;
    v54 = v7;
    if (objc_msgSend(v9, "firstWeekday") == 7)
      v16 = 0;
    else
      v16 = objc_msgSend(v9, "firstWeekday") - 1;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v23 = v14;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v58 != v27)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          if (objc_msgSend(v29, "integerValue") >= v16)
            objc_msgSend(v15, "insertObject:atIndex:", v29, v26++);
          else
            objc_msgSend(v15, "addObject:", v29);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v25);
    }

    v30 = objc_msgSend(v23, "count");
    objc_msgSend(v9, "maximumRangeOfUnit:", 512);
    v32 = v31;
    if (v30 == v31)
    {
      v33 = 0;
      v34 = 0;
    }
    else
    {
      objc_msgSend(v15, "indexesOfObjectsPassingTest:", &__block_literal_global_34_0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "count") != 2 || (v36 = objc_msgSend(v35, "count"), v36 != objc_msgSend(v15, "count")))
      {
        if (objc_msgSend(v35, "count"))
        {

        }
        else
        {
          v37 = objc_msgSend(v15, "count");

          if (v37 == 5)
          {
            v34 = 0;
            v33 = 1;
            goto LABEL_34;
          }
        }
        v33 = 0;
        v34 = 0;
        if ((unint64_t)objc_msgSend(v23, "count") <= 1)
          v38 = 1;
        else
          v38 = 3;
LABEL_38:
        if ((v53 & 1) != 0 || objc_msgSend(v54, "formattingStyle") == 2 || objc_msgSend(v54, "formattingStyle") == v38)
        {
          if (v30 == v32)
          {
            v39 = [HFLocalizableStringKey alloc];
            if (v53)
              v40 = CFSTR("HFDailyTimerTriggerDetailEvery");
            else
              v40 = CFSTR("HFDailyTimerTriggerDetail");
          }
          else if (v34)
          {
            v39 = [HFLocalizableStringKey alloc];
            v40 = CFSTR("HFWeekendTimerTriggerDetail");
          }
          else
          {
            if (!v33)
            {
              v7 = v54;
              if (objc_msgSend(v23, "count") == 1 || (objc_msgSend(v54, "shouldUseFullDayNames") & 1) != 0)
              {
                objc_msgSend(v9, "weekdaySymbols");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v9, "shortWeekdaySymbols");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v55[0] = MEMORY[0x1E0C809B0];
              v55[1] = 3221225472;
              v55[2] = __125__HMTimerTrigger_NaturalLanguage__hf_recurrenceNaturalLanguageStringKeyWithOptions_recurrences_intendedForTimeTriggerEditor___block_invoke_4;
              v55[3] = &unk_1EA72AD88;
              v45 = v44;
              v56 = v45;
              objc_msgSend(v15, "na_map:", v55);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v46, "count"))
              {
                objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v46);
                v47 = objc_claimAutoreleasedReturnValue();
                v51 = (void *)v47;
                if (v53)
                  v48 = CFSTR("HFSomeDaysTimerTriggerDetailEvery");
                else
                  v48 = CFSTR("HFSomeDaysTimerTriggerDetail");
                v61 = v47;
                v42 = 1;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1, HFLocalizableStringKey);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "stringKeyWithKey:arguments:", v48, v49);
                v32 = objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v42 = 0;
              }

LABEL_51:
              if (v42)
                v22 = (void *)v32;
              else
                v22 = 0;
              if (!v42 && (v53 & 1) != 0)
                goto LABEL_56;
              goto LABEL_58;
            }
            v39 = [HFLocalizableStringKey alloc];
            v40 = CFSTR("HFWeekdayTimerTriggerDetail");
          }
          v41 = -[HFLocalizableStringKey initWithKey:argumentKeys:](v39, "initWithKey:argumentKeys:", v40, 0);
        }
        else
        {
          v41 = objc_alloc_init(HFEmptyLocalizableStringKey);
        }
        v32 = (uint64_t)v41;
        v42 = 1;
        v7 = v54;
        goto LABEL_51;
      }

      v33 = 0;
      v34 = 1;
    }
LABEL_34:
    v38 = 1;
    goto LABEL_38;
  }
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D78], "hf_dailyIntervalComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "hf_isEqualToHomeKitRecurrence:", v18);

    if (v19)
    {
      if (a5)
        v20 = CFSTR("HFDailyTimerTriggerDetailEvery");
      else
        v20 = CFSTR("HFDailyTimerTriggerDetail");
      +[HFLocalizableStringKey stringKeyWithKey:argumentKeys:](HFLocalizableStringKey, "stringKeyWithKey:argumentKeys:", v20, 0);
      v21 = (HFLocalizableStringKey *)objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    }
  }
  if (a5)
  {
LABEL_56:
    v21 = -[HFLocalizableStringKey initWithKey:argumentKeys:]([HFLocalizableStringKey alloc], "initWithKey:argumentKeys:", CFSTR("HFDailyTimerTriggerDetailNever"), 0);
LABEL_57:
    v22 = v21;
    goto LABEL_58;
  }
  v22 = 0;
LABEL_58:

  return v22;
}

+ (uint64_t)hf_recurrenceNaturalLanguageStringWithRecurrences:()NaturalLanguage
{
  return objc_msgSend(a1, "hf_recurrenceNaturalLanguageStringWithRecurrences:isEditor:", a3, 1);
}

+ (id)hf_recurrenceNaturalLanguageStringWithRecurrences:()NaturalLanguage isEditor:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFTriggerNaturalLanguageOptions optionsWithHome:nameType:](HFTriggerNaturalLanguageOptions, "optionsWithHome:nameType:", v10, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setShouldUseFullDayNames:", 1);
  objc_msgSend(a1, "hf_recurrenceNaturalLanguageStringKeyWithOptions:recurrences:intendedForTimeTriggerEditor:", v11, v6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(v12, "localizedStringWithArgumentBlock:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_hf_naturalLanguageNameWithOptions:()NaturalLanguage timeString:fireDate:recurrences:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  int v30;
  const __CFString *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  _QWORD v63[5];
  void *v64;
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0C99D48];
  v14 = a6;
  objc_msgSend(v13, "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED378F38 != -1)
    dispatch_once(&qword_1ED378F38, &__block_literal_global_56_0);
  v16 = (id)qword_1ED378F40;
  if (qword_1ED378F48 != -1)
    dispatch_once(&qword_1ED378F48, &__block_literal_global_60);
  v59 = (id)qword_1ED378F50;
  if (qword_1ED378F58 != -1)
    dispatch_once(&qword_1ED378F58, &__block_literal_global_64_0);
  v60 = (id)qword_1ED378F60;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_7;
  v63[3] = &unk_1EA72D530;
  v63[4] = v16;
  __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_7((uint64_t)v63);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_recurrenceNaturalLanguageStringKeyWithOptions:recurrences:", v10, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = v16;
  v62 = v18;
  v58 = a1;
  if (v18)
  {
    objc_msgSend(v18, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED378F78 != -1)
      dispatch_once(&qword_1ED378F78, &__block_literal_global_68_0);
    v20 = (id)qword_1ED378F80;
    objc_msgSend(v20, "objectForKeyedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFLocalizableStringKey stringKeyWithKey:argumentKeys:](HFLocalizableStringKey, "stringKeyWithKey:argumentKeys:", v22, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v19, "isEqualToString:", CFSTR("HFSomeDaysTimerTriggerDetail")))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[HFLocalizableStringKey stringKeyWithKey:argumentKeys:](HFLocalizableStringKey, "stringKeyWithKey:argumentKeys:", CFSTR("HFShortTimerTriggerName"), v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
LABEL_17:

        if (!v12)
          goto LABEL_24;
        goto LABEL_18;
      }
      v65[0] = v61;
      v65[1] = v59;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFLocalizableStringKey stringKeyWithKey:argumentKeys:](HFLocalizableStringKey, "stringKeyWithKey:argumentKeys:", CFSTR("HFSomeDaysTimerTriggerName"), v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v62, "localizedStringWithArgumentBlock:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "argumentMap");
      v25 = v12;
      v26 = v15;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, v59);

      v15 = v26;
      v12 = v25;
    }

    v18 = v62;
    goto LABEL_17;
  }
  v23 = 0;
  if (!v12)
  {
LABEL_24:
    if (!v11)
      goto LABEL_35;
LABEL_25:
    if (v23)
      goto LABEL_35;
    _HFLocalizedStringWithDefaultValue(CFSTR("HFTimerTriggerTimeStringSunrise"), CFSTR("HFTimerTriggerTimeStringSunrise"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v11, "isEqualToString:", v29);

    if (v30)
    {
      v31 = CFSTR("HFOnceSunriseTimerTriggerName");
    }
    else
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFTimerTriggerTimeStringSunset"), CFSTR("HFTimerTriggerTimeStringSunset"), 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v11, "isEqualToString:", v32);

      if (!v33)
      {
        v31 = CFSTR("HFOnceTimerTriggerName");
        v34 = v17;
        goto LABEL_34;
      }
      v31 = CFSTR("HFOnceSunsetTimerTriggerName");
    }
    v34 = 0;
LABEL_34:
    +[HFLocalizableStringKey stringKeyWithKey:argumentKeys:](HFLocalizableStringKey, "stringKeyWithKey:argumentKeys:", v31, v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
LABEL_18:
  if (v23)
    goto LABEL_24;
  if (objc_msgSend(v15, "isDateInToday:", v12))
  {
    v28 = CFSTR("HFTodayTimerTriggerName");
LABEL_23:
    +[HFLocalizableStringKey stringKeyWithKey:argumentKeys:](HFLocalizableStringKey, "stringKeyWithKey:argumentKeys:", v28, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (objc_msgSend(v15, "isDateInTomorrow:", v12))
  {
    v28 = CFSTR("HFTomorrowTimerTriggerName");
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v12, 1, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFLocalizableStringKey stringKeyWithKey:arguments:](HFLocalizableStringKey, "stringKeyWithKey:arguments:", CFSTR("HFFormattedDateTimerTriggerName"), v36);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v62;
  if (v11)
    goto LABEL_25;
LABEL_35:
  objc_msgSend(v10, "actions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    v57 = v12;
    v39 = v15;
    objc_msgSend(v10, "actionNaturalLanguageOptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFormattingContext:", 5);

    objc_msgSend(v10, "actions");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionNaturalLanguageOptions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFActionNaturalLanguageUtilities hf_naturalLanguageDescriptionForActions:withOptions:](HFActionNaturalLanguageUtilities, "hf_naturalLanguageDescriptionForActions:withOptions:", v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "key");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringByAppendingString:", CFSTR("_WithAction"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    _HFLocalizedStringWithDefaultValue(v45, 0, 0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = (void *)v46;
      v48 = objc_msgSend(v43, "length");

      if (v48)
      {
        objc_msgSend(v23, "setKey:", v45);
        objc_msgSend(v23, "argumentKeys");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "arrayByAddingObject:", v60);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setArgumentKeys:", v50);

        objc_msgSend(v23, "argumentMap");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:forKeyedSubscript:", v43, v60);

      }
    }

    v15 = v39;
    v12 = v57;
    v18 = v62;
  }
  if (!v23
    || (objc_msgSend(v23, "argumentMap"),
        v52 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v11, v61),
        v52,
        objc_msgSend(v23, "localizedStringWithArgumentBlock:", 0),
        (v53 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFUnknownTimerTriggerName"), CFSTR("HFUnknownTimerTriggerName"), 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v10, "nameType"))
  {
    objc_msgSend(v10, "home");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "hf_sanitizeTriggerName:home:", v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();

    v53 = (void *)v55;
    v18 = v62;
  }

  return v53;
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

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "recurrences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:withOptions:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(a1, "recurrence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_arrayWithSafeObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:withOptions:", v10, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)hf_naturalLanguageDetailsWithRecurrences:()NaturalLanguage withOptions:
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:withOptions:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  if (objc_msgSend(v2, "count"))
  {
    if (qword_1ED378F88 != -1)
      dispatch_once(&qword_1ED378F88, &__block_literal_global_100_1);
    v3 = (id)qword_1ED378F90;
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

+ (id)_hf_naturalLanguageDetailsSentenceElementsWithRecurrences:()NaturalLanguage withOptions:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "hf_recurrenceNaturalLanguageStringKeyWithOptions:recurrences:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v9, "localizedStringWithArgumentBlock:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v10);

      }
    }

  }
  v11 = (void *)objc_msgSend(v7, "copy");

  return v11;
}

@end
