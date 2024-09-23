@implementation HKFeatureSettings(HDHRIrregularRhythmNotificationsV1Settings)

+ (id)hdhr_irregularRhythmNotificationsV1SettingsFromDefaults:()HDHRIrregularRhythmNotificationsV1Settings
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CB76D0];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB76D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v3, "hk_BOOLForKey:defaultValue:", v4, 0);
    v7 = objc_alloc(MEMORY[0x1E0CB6720]);
    v13 = *MEMORY[0x1E0CB50C8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithDictionary:", v9);

  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB6720]);
    v10 = (void *)objc_msgSend(v11, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  }

  return v10;
}

@end
