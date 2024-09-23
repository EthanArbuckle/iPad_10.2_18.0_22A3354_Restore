@implementation HMHome(HFUserNotificationTopics)

+ (id)_hf_groupedServiceTypeTopics
{
  if (qword_1ED379508 != -1)
    dispatch_once(&qword_1ED379508, &__block_literal_global_156_1);
  return (id)qword_1ED379510;
}

+ (id)_hf_standaloneTopicNameLocalizationKeyForPrimaryServiceType:()HFUserNotificationTopics
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (qword_1ED379558 != -1)
    dispatch_once(&qword_1ED379558, &__block_literal_global_180_1);
  v4 = (id)qword_1ED379560;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFUserNotificationServiceTopicName_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_hf_accessoryTopics:()HFUserNotificationTopics
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  if (a3)
  {
    objc_msgSend(a1, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_187_0);

    if (v7)
    {
      +[HFUserNotificationServiceTopic _cameraTopic](HFUserNotificationServiceTopic, "_cameraTopic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "na_safeAddObject:", v8);

    }
  }
  if (objc_msgSend(a1, "hf_shouldShowAnnounceFeatureForThisHome"))
  {
    +[HFUserNotificationServiceTopic _announceTopic](HFUserNotificationServiceTopic, "_announceTopic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v9);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasOptedToHH2");

  HFLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(a1, "hf_canUpdateToHH2");
    v15 = objc_msgSend(a1, "hf_hasHomePods");
    v16 = objc_msgSend(a1, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory");
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "homeManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413570;
    v24 = a1;
    v25 = 1024;
    v26 = v14;
    v27 = 1024;
    v28 = v12;
    v29 = 1024;
    v30 = v15;
    v31 = 1024;
    v32 = v16;
    v33 = 1024;
    v34 = objc_msgSend(v18, "homeSafetySecurityEnabled");
    _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Home:%@ canUpdateToHH2:%{BOOL}d hasOptedToHH2:%{BOOL}d hasHomePods:%{BOOL}d hasAtleastOneSafetyAndSecuritySupportedAccessory = %{BOOL}d, homeSafetySecurityEnabled = %{BOOL}d ", (uint8_t *)&v23, 0x2Au);

  }
  if (objc_msgSend(a1, "hf_hasHomePods") && objc_msgSend(a1, "hf_canUpdateToHH2"))
  {
    v19 = objc_msgSend(a1, "hf_canEnableAudioAnalysisAfterHH2Upgrade");
    if (!v12)
      goto LABEL_14;
    goto LABEL_13;
  }
  v19 = 0;
  if (v12)
LABEL_13:
    v12 = objc_msgSend(a1, "hf_hasAtleastOneAudioAnalysisSupportedAccessory");
LABEL_14:
  v20 = objc_msgSend(a1, "hf_shouldShowActivityLogSetting");
  if (((v19 | v12) & 1) != 0 || v20)
  {
    +[HFUserNotificationServiceTopic _safetyAndSecurityTopic](HFUserNotificationServiceTopic, "_safetyAndSecurityTopic");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v21);

  }
  return v5;
}

- (id)hf_userNotificationServiceTopics
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  _BOOL8 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  HFUserNotificationServiceTopic *(*v25)(uint64_t, void *);
  void *v26;
  id v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasOptedToHH2");

  if (v5)
  {
    objc_msgSend(a1, "residentDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 1;
  }
  HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[HMHome(HFUserNotificationTopics) hf_userNotificationServiceTopics]";
    v31 = 1024;
    v32 = v5;
    v33 = 1024;
    v34 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%s hasOptedToHH2 = %{BOOL}d, shouldShowNotificationsItem = %{BOOL}d ", buf, 0x18u);
  }

  if (v7)
  {
    objc_msgSend(a1, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_flatMap:", &__block_literal_global_190_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_194);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_hf_groupedServiceTypeTopics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E60];
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_4;
    v26 = &unk_1EA738448;
    v27 = v12;
    v28 = a1;
    v14 = v12;
    objc_msgSend(v11, "na_dictionaryByMappingValues:", &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allValues", v23, v24, v25, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v18);

  }
  objc_msgSend(a1, "_hf_accessoryTopics:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v19);

  objc_msgSend(a1, "hf_energyManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v20, "effectiveGridForecastAvailable");

  if ((_DWORD)v19)
  {
    +[HFUserNotificationServiceTopic _energyTopic](HFUserNotificationServiceTopic, "_energyTopic");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_safeAddObject:", v21);

  }
  return v2;
}

- (id)hf_userNotificationTopicForService:()HFUserNotificationTopics
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "hf_userNotificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "hf_userNotificationServiceTopics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__HMHome_HFUserNotificationTopics__hf_userNotificationTopicForService___block_invoke;
    v9[3] = &unk_1EA738420;
    v10 = v4;
    objc_msgSend(v6, "na_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)hf_userNotificationTopicForCameraProfile:()HFUserNotificationTopics
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend(v4, "hf_userNotificationSettings");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "accessory"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hf_isNotificationSupportedCamera"),
        v7,
        v6,
        v8))
  {
    objc_msgSend(v4, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "categoryType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "hf_userNotificationServiceTopics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__HMHome_HFUserNotificationTopics__hf_userNotificationTopicForCameraProfile___block_invoke;
    v16[3] = &unk_1EA738420;
    v17 = v11;
    v13 = v11;
    objc_msgSend(v12, "na_firstObjectPassingTest:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)hf_userNotificationTopicForObject:()HFUserNotificationTopics
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(a1, "hf_userNotificationTopicForService:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v9 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      objc_msgSend(a1, "hf_userNotificationTopicForCameraProfile:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSLog(CFSTR("Unexpected object %@"), v9);
      v8 = 0;
    }

  }
  return v8;
}

- (id)hf_servicesAffectedByServiceTopic:()HFUserNotificationTopics
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HMHome_HFUserNotificationTopics__hf_servicesAffectedByServiceTopic___block_invoke;
  v9[3] = &unk_1EA733520;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_cameraProfilesAffectedByServiceTopic:()HFUserNotificationTopics
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HMHome_HFUserNotificationTopics__hf_cameraProfilesAffectedByServiceTopic___block_invoke;
  v9[3] = &unk_1EA733520;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_safetyAndSecurityAccessoriesAffectedByServiceTopic:()HFUserNotificationTopics
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__HMHome_HFUserNotificationTopics__hf_safetyAndSecurityAccessoriesAffectedByServiceTopic___block_invoke;
  v9[3] = &unk_1EA727840;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_allObjectsAffectedByServiceTopic:()HFUserNotificationTopics
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "hf_servicesAffectedByServiceTopic:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_cameraProfilesAffectedByServiceTopic:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(a1, "hf_safetyAndSecurityAccessoriesAffectedByServiceTopic:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_arrayByFlattening");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
