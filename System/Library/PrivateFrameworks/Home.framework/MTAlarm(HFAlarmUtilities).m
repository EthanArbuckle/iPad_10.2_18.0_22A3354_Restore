@implementation MTAlarm(HFAlarmUtilities)

+ (id)hf_buildAlarmFromCollectionSettingItem:()HFAlarmUtilities
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1DF0DABF0]();
  objc_opt_class();
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4FA90]), "initWithEncodedDictionary:", v7);
    objc_msgSend(v8, "decodeObjectForKey:", CFSTR("MTAlarms"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v10;
}

+ (id)hf_buildAlarmsFromCollectionSettingItems:()HFAlarmUtilities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "na_map:", &__block_literal_global_112);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)hf_areAlarms:()HFAlarmUtilities equalToAlarms:includeModificationDate:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id obj;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0D4FA50], "hf_verifyThatAlarmsAreConsistent:", v7);
  objc_msgSend(MEMORY[0x1E0D4FA50], "hf_verifyThatAlarmsAreConsistent:", v8);
  if (v7 == v8)
  {
    v17 = 1;
  }
  else if ((v7 || !v8) && (!v7 || v8) && (v9 = objc_msgSend(v7, "count"), v9 == objc_msgSend(v8, "count")))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v7;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __80__MTAlarm_HFAlarmUtilities__hf_areAlarms_equalToAlarms_includeModificationDate___block_invoke;
          v20[3] = &unk_1EA7353A8;
          v20[4] = v14;
          objc_msgSend(v8, "na_firstObjectPassingTest:", v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if ((a5 & 1) != 0)
          {
            if (!objc_msgSend(v15, "isEqualToAlarm:", v14))
              goto LABEL_22;
          }
          else if ((objc_msgSend(v15, "isEqualIgnoringLastModifiedDate:", v14) & 1) == 0)
          {
LABEL_22:

            v17 = 0;
            goto LABEL_23;
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }
    v17 = 1;
LABEL_23:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)hf_alarmsMatchingAlarmId:()HFAlarmUtilities withinItemArray:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__MTAlarm_HFAlarmUtilities__hf_alarmsMatchingAlarmId_withinItemArray___block_invoke;
  v11[3] = &unk_1EA735340;
  v12 = v5;
  v6 = v5;
  objc_msgSend(a4, "na_filter:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v7;

  return v9;
}

+ (uint64_t)hf_verifyThatAlarmsAreConsistent:()HFAlarmUtilities
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_21_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    v8 = 1;
    *(_QWORD *)&v5 = 138412290;
    v16 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10, v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12 >= 2)
        {
          HFLogForCategory(0x39uLL);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v16;
            v22 = v14;
            _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "FOUND DUPLICATE ALARMS: %@", buf, 0xCu);

          }
          v8 = 0;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1;
  }

  return v8 & 1;
}

@end
