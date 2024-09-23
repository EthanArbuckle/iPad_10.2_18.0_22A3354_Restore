@implementation HUAccessorySettingsDetailsViewControllerFactory

+ (id)_viewControllerForIdentifier:(id)a3 groupItem:(id)a4
{
  id v5;
  id v6;
  id v7;
  objc_class *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  if (_MergedGlobals_642 != -1)
    dispatch_once(&_MergedGlobals_642, &__block_literal_global_257);
  v7 = (id)qword_1ED580DE8;
  v8 = (objc_class *)objc_msgSend(v7, "objectForKeyedSubscript:", v6);

  v9 = (void *)objc_msgSend([v8 alloc], "initWithAccessoryGroupItem:", v5);
  return v9;
}

void __90__HUAccessorySettingsDetailsViewControllerFactory__viewControllerForIdentifier_groupItem___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AnalyticsLogsViewController");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("AnalyticsViewController");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("AppleMusicAccountViewController");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("DataAnalyticsViewController");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("DoorbellChimeDevicesViewController");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("PlaybackInfluencesViewController");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("ProfilesViewController");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("SiriHistoryViewController");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("SiriOutputVoiceViewController");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("SiriPersonalRequestsViewController");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("SiriRecognitionLanguageViewController");
  v3[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580DE8;
  qword_1ED580DE8 = v0;

}

+ (id)_viewControllerForIdentifier:(id)a3 settingItem:(id)a4
{
  id v5;
  id v6;
  id v7;
  objc_class *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  if (qword_1ED580DF0 != -1)
    dispatch_once(&qword_1ED580DF0, &__block_literal_global_294);
  v7 = (id)qword_1ED580DF8;
  v8 = (objc_class *)objc_msgSend(v7, "objectForKeyedSubscript:", v6);

  v9 = (void *)objc_msgSend([v8 alloc], "initWithAccessorySettingItem:", v5);
  return v9;
}

void __92__HUAccessorySettingsDetailsViewControllerFactory__viewControllerForIdentifier_settingItem___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AnnounceSettingsViewController");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("AudioAnalysisSettingsViewController");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("PlaybackInfluencesViewController");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("SiriTriggerPhraseSettingDetailsViewController");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580DF8;
  qword_1ED580DF8 = v0;

}

+ (id)viewControllerForSettingItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  int v9;
  HUAccessorySettingsDetailsViewController *v10;
  HUAccessorySettingsDetailsViewController *v11;
  HUAccessorySettingsDetailsViewController *v12;

  v4 = a3;
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30198]);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl()
    && (objc_msgSend(v4, "settingKeyPath"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D30778]),
        v8,
        v9))
  {

    v7 = CFSTR("SiriTriggerPhraseSettingDetailsViewController");
  }
  else if (!v7)
  {
    v11 = 0;
LABEL_9:
    v12 = -[HUAccessorySettingsDetailsViewController initWithAccessorySettingItem:]([HUAccessorySettingsDetailsViewController alloc], "initWithAccessorySettingItem:", v4);

    goto LABEL_10;
  }
  objc_msgSend(a1, "_viewControllerForIdentifier:settingItem:", v7, v4);
  v10 = (HUAccessorySettingsDetailsViewController *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_9;
  v12 = v10;
  if ((-[HUAccessorySettingsDetailsViewController conformsToProtocol:](v10, "conformsToProtocol:", &unk_1EF290298) & 1) == 0)
    goto LABEL_9;
LABEL_10:

  return v12;
}

+ (id)viewControllerForGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HUAccessorySettingsDetailsViewController *v8;
  HUAccessorySettingsDetailsViewController *v9;
  HUAccessorySettingsDetailsViewController *v10;

  v4 = a3;
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30198]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v9 = 0;
LABEL_6:
    v10 = -[HUAccessorySettingsDetailsViewController initWithAccessoryGroupItem:]([HUAccessorySettingsDetailsViewController alloc], "initWithAccessoryGroupItem:", v4);

    goto LABEL_7;
  }
  objc_msgSend(a1, "_viewControllerForIdentifier:groupItem:", v7, v4);
  v8 = (HUAccessorySettingsDetailsViewController *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_6;
  v10 = v8;
  if ((-[HUAccessorySettingsDetailsViewController conformsToProtocol:](v8, "conformsToProtocol:", &unk_1EF290298) & 1) == 0)
    goto LABEL_6;
LABEL_7:

  return v10;
}

@end
