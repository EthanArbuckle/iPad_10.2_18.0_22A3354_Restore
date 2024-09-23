@implementation HDHRIrregularRhythmNotificationsV1SettingsProvider

- (id)featureSettingsUponBackgroundDelivery
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CB76F8]);
  objc_msgSend(MEMORY[0x1E0CB6720], "hdhr_irregularRhythmNotificationsV1SettingsFromDefaults:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB50C8];
  objc_msgSend(v4, "numberForKey:error:", *MEMORY[0x1E0CB50C8], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB6720]);
    v11 = v5;
    v12[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithDictionary:", v8);

    v4 = (void *)v9;
  }

  return v4;
}

@end
