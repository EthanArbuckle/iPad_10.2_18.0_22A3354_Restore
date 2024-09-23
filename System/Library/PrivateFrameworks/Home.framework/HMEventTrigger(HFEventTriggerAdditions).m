@implementation HMEventTrigger(HFEventTriggerAdditions)

- (id)hf_durationEndEvent
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "endEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(a1, "endEvents", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_opt_class();
          v11 = v10;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
          v13 = v12;

          objc_msgSend(v13, "duration");
          if (v14 > 1.0)
          {
            if (!v7 || (objc_msgSend(v7, "duration"), v16 = v15, objc_msgSend(v13, "duration"), v16 > v17))
            {
              v18 = v13;

              v7 = v18;
            }
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)hf_effectiveRecurrences
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "recurrences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hf_dailyWeekdayIntervalComponents");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  if (objc_msgSend(a1, "executeOnce"))
  {

    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (uint64_t)hf_triggerType
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  char v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  objc_msgSend(a1, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_336);

  objc_msgSend(a1, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_337);

  objc_msgSend(a1, "events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_340);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_filter:", &__block_literal_global_342);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "presenceEventType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(&unk_1EA7CDDE0, "containsObject:", v10);

    if (v11)
      v12 = 4;
    else
      v12 = 3;
  }
  else
  {
    v13 = v3 | v5;
    if (v3)
      v12 = 2;
    else
      v12 = 1;
    if ((v13 & 1) == 0)
    {
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke_355;
        v17[3] = &unk_1EA72D698;
        v18 = v14;
        v15 = v14;
        if (objc_msgSend(v9, "na_any:", v17))
          v12 = 6;
        else
          v12 = 5;

      }
      else
      {
        v12 = 0;
      }
    }
  }

  return v12;
}

- (uint64_t)hf_isHomeAppCreatedTrigger
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(a1, "events");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __69__HMEventTrigger_HFEventTriggerAdditions__hf_isHomeAppCreatedTrigger__block_invoke;
    v22[3] = &unk_1EA729FC8;
    v6 = v4;
    v23 = v6;
    objc_msgSend(v5, "na_each:", v22);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "applicationData", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("HFDesignatedTriggerAppDataKey"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v3);

          if ((v15 & 1) != 0)
          {
            v16 = 1;
            goto LABEL_12;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v9)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_12:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (uint64_t)hf_markTriggerAsHomeAppCreated
{
  return objc_msgSend(a1, "hf_designateTrigger:", 1);
}

- (uint64_t)hf_unmarkTriggerAsHomeAppCreated
{
  return objc_msgSend(a1, "hf_designateTrigger:", 0);
}

- (id)hf_designateTrigger:()HFEventTriggerAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  void *v21;
  id v22;
  char v23;
  _QWORD v24[4];
  id v25;

  objc_msgSend(a1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(a1, "hf_isHomeAppCreatedTrigger") == a3)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(a1, "events");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __63__HMEventTrigger_HFEventTriggerAdditions__hf_designateTrigger___block_invoke;
      v24[3] = &unk_1EA729FC8;
      v10 = v7;
      v25 = v10;
      objc_msgSend(v8, "na_each:", v24);

      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D519C0];
        v19[0] = v9;
        v19[1] = 3221225472;
        v19[2] = __63__HMEventTrigger_HFEventTriggerAdditions__hf_designateTrigger___block_invoke_2;
        v19[3] = &unk_1EA738070;
        v23 = a3;
        v20 = v11;
        v21 = a1;
        v22 = v6;
        v13 = v11;
        objc_msgSend(v12, "futureWithErrorOnlyHandlerAdapterBlock:", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = (void *)MEMORY[0x1E0D519C0];
        objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "futureWithError:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "futureWithError:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)hf_characteristicsInEvents
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "events");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_364);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hf_allTriggerValuesForCharacteristic:()HFEventTriggerAdditions similarToValue:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  void *v18;
  int v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characteristicType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8888]);

  if (v10)
  {
    if (qword_1ED379458 != -1)
      dispatch_once(&qword_1ED379458, &__block_literal_global_367);
    v11 = (void *)qword_1ED379460;
  }
  else
  {
    objc_msgSend(v6, "characteristicType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB8838]);

    if (!v13)
    {
      objc_msgSend(v6, "characteristicType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB8868]);

      if (!v19)
        goto LABEL_12;
      if (qword_1ED379478 != -1)
        dispatch_once(&qword_1ED379478, &__block_literal_global_377_0);
      v14 = (id)qword_1ED379480;
      if (objc_msgSend(v14, "containsObject:", v7))
        goto LABEL_10;
      goto LABEL_11;
    }
    if (qword_1ED379468 != -1)
      dispatch_once(&qword_1ED379468, &__block_literal_global_375);
    v11 = (void *)qword_1ED379470;
  }
  v14 = v11;
  if ((objc_msgSend(v14, "containsObject:", v7) & 1) != 0)
  {
LABEL_10:
    v14 = v14;

    v8 = v14;
  }
LABEL_11:

LABEL_12:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __95__HMEventTrigger_HFEventTriggerAdditions__hf_allTriggerValuesForCharacteristic_similarToValue___block_invoke_379;
  v20[3] = &unk_1EA738138;
  v21 = v6;
  v22 = a1;
  v15 = v6;
  objc_msgSend(v8, "na_filter:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (uint64_t)_hf_valueIsValidForCharacteristic:()HFEventTriggerAdditions value:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maximumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "compare:", v6);

    objc_msgSend(v5, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minimumValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "compare:", v6);

    objc_msgSend(v5, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "validValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v9 == -1 || v12 == 1;
    v16 = !v15;
    v17 = !v15 && v14 == 0;
    if (v14 && v16)
      v17 = objc_msgSend(v14, "containsObject:", v6);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)hf_representativeTriggerValueForCharacteristic:()HFEventTriggerAdditions similarToValue:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(a1, "hf_allTriggerValuesForCharacteristic:similarToValue:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (!v9)
      goto LABEL_17;
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        v15 = v14;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
        v17 = v16;

        if (v17 && (!v11 || objc_msgSend(v17, "compare:", v11) == -1))
        {
          v18 = v15;

          v11 = v18;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
    if (!v11)
    {
LABEL_17:
      objc_msgSend(v8, "anyObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
