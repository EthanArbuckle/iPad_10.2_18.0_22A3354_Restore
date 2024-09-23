@implementation HMAccessoryCollectionSettingItem(HFAlarmUtilities)

+ (id)hf_collectionSettingItemForAlarm:()HFAlarmUtilities
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAccessorySettingMobileTimerUtilities.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alarm"));

  }
  v6 = (void *)MEMORY[0x1DF0DABF0]();
  v7 = (void *)objc_opt_new();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v8, CFSTR("MTAlarms"));

  v9 = objc_alloc(MEMORY[0x1E0CBA1E8]);
  objc_msgSend(v7, "encodedDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithValue:", v10);

  objc_autoreleasePoolPop(v6);
  return v11;
}

+ (id)hf_alarmItemsMatchingAlarmId:()HFAlarmUtilities withinItemArray:
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
  v11[2] = __99__HMAccessoryCollectionSettingItem_HFAlarmUtilities__hf_alarmItemsMatchingAlarmId_withinItemArray___block_invoke;
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

@end
