@implementation AVTUsageTrackingSession

+ (id)defaultRecordTransformerForCoreModel:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__AVTUsageTrackingSession_defaultRecordTransformerForCoreModel___block_invoke;
  v7[3] = &unk_1EA51EE08;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1DF0D0754](v7);

  return v5;
}

id __64__AVTUsageTrackingSession_defaultRecordTransformerForCoreModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AVTAvatarConfiguration configurationForRecord:coreModel:](AVTAvatarConfiguration, "configurationForRecord:coreModel:", a2, *(_QWORD *)(a1 + 32));
}

+ (id)defaultTimeProvider
{
  return &__block_literal_global_16;
}

uint64_t __46__AVTUsageTrackingSession_defaultTimeProvider__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

+ (id)payloadForAvatarRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEditable"))
  {
    v9 = CFSTR("recordType");
    v10[0] = CFSTR("memoji");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7[0] = CFSTR("recordType");
    v7[1] = CFSTR("animojiName");
    v8[0] = CFSTR("animoji");
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)payloadForAvatarRecordIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD *v7;
  const __CFString **v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D00648], "animojiNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
  {
    v12[0] = CFSTR("recordType");
    v12[1] = CFSTR("animojiName");
    v13[0] = CFSTR("animoji");
    v13[1] = v3;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = v13;
    v8 = (const __CFString **)v12;
    v9 = 2;
  }
  else
  {
    v14 = CFSTR("recordType");
    v15[0] = CFSTR("memoji");
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = v15;
    v8 = &v14;
    v9 = 1;
  }
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)getPresetDescription:(id *)a3 usedCategoriesDescription:(id *)a4 forAvatarConfiguration:(id)a5 defaultConfiguration:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend(v9, "presetConfigurationPresets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __118__AVTUsageTrackingSession_getPresetDescription_usedCategoriesDescription_forAvatarConfiguration_defaultConfiguration___block_invoke;
  v18 = &unk_1EA51EE70;
  v13 = v10;
  v22 = &v23;
  v19 = v13;
  v20 = &unk_1EA571B50;
  v14 = v11;
  v21 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v15);

  *a3 = (id)objc_msgSend(v14, "copy", v15, v16, v17, v18);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v24[3]);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v23, 8);
}

void __118__AVTUsageTrackingSession_getPresetDescription_usedCategoriesDescription_forAvatarConfiguration_defaultConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  char v21;
  char v22;
  id v23;

  v23 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v23, "settingKind");
  objc_msgSend(v3, "presetForCategory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "preset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!(v8 | v6))
    goto LABEL_4;
  v9 = (void *)v8;
  objc_msgSend(v23, "preset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v6) & 1) != 0)
  {

LABEL_4:
    v12 = 0;
    v13 = v23;
    goto LABEL_5;
  }
  v21 = objc_msgSend(v23, "isDefaultPreset");

  v13 = v23;
  if ((v21 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v23, "settingKind");
    v13 = v23;
    v12 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 1 << v22;
  }
LABEL_5:
  v14 = *(void **)(a1 + 40);
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "settingKind");
  objc_msgSend(v15, "numberWithInteger:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v14, "containsObject:", v17);

  if ((_DWORD)v14)
  {
    objc_msgSend(v23, "settingKind");
    AVTPresetCategoryToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v23, "preset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = CFSTR("none");
    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v20, v18);

  }
}

+ (id)colorPresetDescriptionForAvatarConfiguration:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorConfigurationPresets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__AVTUsageTrackingSession_colorPresetDescriptionForAvatarConfiguration___block_invoke;
  v10[3] = &unk_1EA51EE98;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

void __72__AVTUsageTrackingSession_colorPresetDescriptionForAvatarConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  const __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "preset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", CFSTR("none")) & 1) != 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  v6 = objc_msgSend(v18, "isDefaultPreset");

  if ((v6 & 1) == 0)
  {
    v7 = objc_msgSend(v18, "settingKind");
    v8 = CFSTR("c");
    if (v7 == 3)
      v8 = CFSTR("ct");
    if (v7 == 2)
      v9 = CFSTR("cs");
    else
      v9 = (__CFString *)v8;
    objc_msgSend(v18, "settingKind");
    v11 = v10;
    objc_msgSend(v18, "preset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("%ld_%@"), v11, v14);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v18, "preset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorPreset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "variation");
    objc_msgSend(v15, "numberWithFloat:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
    goto LABEL_10;
  }
LABEL_11:

}

+ (id)dpKeyBasePrefix
{
  return CFSTR("com.apple.avatar.");
}

+ (id)keyBasePrefixForBundleIdentifier:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Jellyfish.Animoji")) & 1) != 0)
  {
    v4 = CFSTR("com.apple.Animoji.Analytics.AnimojiApp.");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Animoji.StickersApp.MessagesExtension")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Stickers.UserGenerated.MessagesExtension")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.iMessageAppsViewService")) & 1) != 0)
  {
    v4 = CFSTR("com.apple.Animoji.Analytics.StickersApp.");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.camera.CameraMessagesApp")))
  {
    v4 = CFSTR("com.apple.Animoji.Analytics.FunCamApp.");
  }
  else
  {
    v4 = CFSTR("com.apple.Animoji.Analytics.AnyApp.");
  }

  return (id)v4;
}

+ (id)allowListAppNameFromBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  if (allowListAppNameFromBundleID__onceToken != -1)
    dispatch_once(&allowListAppNameFromBundleID__onceToken, &__block_literal_global_87);
  objc_msgSend((id)allowListAppNameFromBundleID__bundleIDMapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)allowListAppNameFromBundleID__bundleIDMapping, "objectForKeyedSubscript:", CFSTR("*"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

void __56__AVTUsageTrackingSession_allowListAppNameFromBundleID___block_invoke()
{
  void *v0;

  v0 = (void *)allowListAppNameFromBundleID__bundleIDMapping;
  allowListAppNameFromBundleID__bundleIDMapping = (uint64_t)&unk_1EA571BC0;

}

+ (id)makeKeyAnalyticsCompliant:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
}

+ (id)makeDPKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "dpKeyBasePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)configurationDistanceClassifierWithMetric:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__AVTUsageTrackingSession_configurationDistanceClassifierWithMetric___block_invoke;
  v7[3] = &unk_1EA51EEE0;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1DF0D0754](v7);

  return v5;
}

uint64_t __69__AVTUsageTrackingSession_configurationDistanceClassifierWithMetric___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "distanceFromConfiguration:toConfiguration:", a2, a3);
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "gapFromDistance:", v4));
}

+ (id)likenessComparator
{
  return &__block_literal_global_181;
}

uint64_t __45__AVTUsageTrackingSession_likenessComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (AVTUsageTrackingSession)initWithSerialQueueProvider:(id)a3 recordTransformer:(id)a4 logger:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVTCoreAnalyticsClient *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  AVTUsageTrackingSession *v19;
  void *v20;
  AVTDifferentialPrivacyRecorder *v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(AVTCoreAnalyticsClient);
  v21 = objc_alloc_init(AVTDifferentialPrivacyRecorder);
  objc_msgSend(MEMORY[0x1E0D00850], "defaultAvatarRecord");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarConfigurationMetric defaultMetric](AVTAvatarConfigurationMetric, "defaultMetric");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "keyBasePrefixForBundleIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "allowListAppNameFromBundleID:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultTimeProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AVTUsageTrackingSession initWithCoreAnalyticsClient:dpRecorder:serialQueueProvider:recordTransformer:avatarRecord:defaultConfiguration:timeProvider:configurationMetric:logger:keyBasePrefix:bundleAppName:](self, "initWithCoreAnalyticsClient:dpRecorder:serialQueueProvider:recordTransformer:avatarRecord:defaultConfiguration:timeProvider:configurationMetric:logger:keyBasePrefix:bundleAppName:", v11, v21, v10, v9, v20, 0, v16, v18, v8, v14, v15);

  return v19;
}

- (AVTUsageTrackingSession)initWithCoreAnalyticsClient:(id)a3 dpRecorder:(id)a4 serialQueueProvider:(id)a5 recordTransformer:(id)a6 avatarRecord:(id)a7 defaultConfiguration:(id)a8 timeProvider:(id)a9 configurationMetric:(id)a10 logger:(id)a11 keyBasePrefix:(id)a12 bundleAppName:(id)a13
{
  void (**v18)(id, const char *);
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  AVTUsageTrackingSession *v25;
  uint64_t v26;
  OS_dispatch_queue *workQueue;
  uint64_t v28;
  id recordTransformer;
  uint64_t v30;
  id timeProvider;
  id v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v39 = a3;
  v34 = a4;
  v38 = a4;
  v18 = (void (**)(id, const char *))a5;
  v40 = a6;
  v19 = a8;
  v37 = a7;
  v36 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v41.receiver = self;
  v41.super_class = (Class)AVTUsageTrackingSession;
  v25 = -[AVTUsageTrackingSession init](&v41, sel_init);
  if (v25)
  {
    v18[2](v18, "com.apple.AvatarUI.AVTUsageTrackingSession.workQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    workQueue = v25->_workQueue;
    v25->_workQueue = (OS_dispatch_queue *)v26;

    objc_storeStrong((id *)&v25->_ntsCAClient, a3);
    objc_storeStrong((id *)&v25->_ntsDPRecorder, v34);
    v28 = objc_msgSend(v40, "copy");
    recordTransformer = v25->_recordTransformer;
    v25->_recordTransformer = (id)v28;

    v30 = objc_msgSend(v20, "copy");
    timeProvider = v25->_timeProvider;
    v25->_timeProvider = (id)v30;

    objc_storeStrong((id *)&v25->_defaultConfiguration, v19);
    objc_storeStrong((id *)&v25->_avatarRecord, a7);
    objc_storeStrong((id *)&v25->_metric, a10);
    objc_storeStrong((id *)&v25->_logger, a11);
    objc_storeStrong((id *)&v25->_keyBasePrefix, a12);
    objc_storeStrong((id *)&v25->_bundleAppName, a13);
  }

  return v25;
}

- (void)performClientWork:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AVTUsageTrackingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__AVTUsageTrackingSession_performClientWork___block_invoke;
  v7[3] = &unk_1EA51D058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__AVTUsageTrackingSession_performClientWork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "ntsCAClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ntsDPRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (id)makeEventKeyForAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AVTUsageTrackingSession keyBasePrefix](self, "keyBasePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "makeKeyAnalyticsCompliant:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)makeCrossAppEventKeyForAction:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(CFSTR("com.apple.Animoji.Analytics.AnyApp."), "stringByAppendingString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "makeKeyAnalyticsCompliant:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sendEventForAction:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[AVTUsageTrackingSession makeEventKeyForAction:](self, "makeEventKeyForAction:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AVTUsageTrackingSession_sendEventForAction___block_invoke;
  v6[3] = &unk_1EA51EF48;
  v7 = v4;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

uint64_t __46__AVTUsageTrackingSession_sendEventForAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendEventForKey:payload:", *(_QWORD *)(a1 + 32), 0);
}

- (id)payloadForCrossAppEvent
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("appName");
  -[AVTUsageTrackingSession bundleAppName](self, "bundleAppName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)sendCrossAppsEventForAction:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AVTUsageTrackingSession *v8;

  -[AVTUsageTrackingSession makeCrossAppEventKeyForAction:](self, "makeCrossAppEventKeyForAction:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__AVTUsageTrackingSession_sendCrossAppsEventForAction___block_invoke;
  v6[3] = &unk_1EA51EF70;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

void __55__AVTUsageTrackingSession_sendCrossAppsEventForAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "payloadForCrossAppEvent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEventForKey:payload:", v2, v5);

}

- (void)didSendVideoWithAvatar:(id)a3 duration:(double)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  double v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__AVTUsageTrackingSession_didSendVideoWithAvatar_duration___block_invoke;
  v8[3] = &unk_1EA51EF98;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v8);
  -[AVTUsageTrackingSession didResumeFaceTracking](self, "didResumeFaceTracking");

}

void __59__AVTUsageTrackingSession_didSendVideoWithAvatar_duration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "setRecordedVideo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "makeEventKeyForAction:", CFSTR("VideoSent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "payloadForAvatarRecord:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("duration"));

  objc_msgSend(v6, "sendEventForKey:payload:", v7, v9);
  if (objc_msgSend(*(id *)(a1 + 40), "isEditable"))
    objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarDescription:dpRecorder:", *(_QWORD *)(a1 + 40), v11);

}

- (void)didDiscardVideoWithDuration:(double)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__AVTUsageTrackingSession_didDiscardVideoWithDuration___block_invoke;
  v4[3] = &unk_1EA51EFC0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v4);
  -[AVTUsageTrackingSession didResumeFaceTracking](self, "didResumeFaceTracking");
}

void __55__AVTUsageTrackingSession_didDiscardVideoWithDuration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setRecordedVideo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "makeEventKeyForAction:", CFSTR("VideoDiscarded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEventForKey:payload:", v5, v7);

}

- (void)didReplayVideo
{
  -[AVTUsageTrackingSession sendEventForAction:](self, "sendEventForAction:", CFSTR("ReplayVideo"));
}

- (void)didSendImageWithAvatar:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__AVTUsageTrackingSession_didSendImageWithAvatar___block_invoke;
  v6[3] = &unk_1EA51EF70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

void __50__AVTUsageTrackingSession_didSendImageWithAvatar___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "makeEventKeyForAction:", CFSTR("StickerSent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "payloadForAvatarRecord:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("peeled"));
  objc_msgSend(v6, "sendEventForKey:payload:", v7, v9);

  if (objc_msgSend(*(id *)(a1 + 40), "isEditable"))
    objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarDescription:dpRecorder:", *(_QWORD *)(a1 + 40), v10);

}

- (void)didSendStickerWithAvatar:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__AVTUsageTrackingSession_didSendStickerWithAvatar___block_invoke;
  v6[3] = &unk_1EA51EF70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

void __52__AVTUsageTrackingSession_didSendStickerWithAvatar___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "makeEventKeyForAction:", CFSTR("StickerSent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "payloadForAvatarRecord:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("peeled"));
  objc_msgSend(v6, "sendEventForKey:payload:", v7, v9);

  if (objc_msgSend(*(id *)(a1 + 40), "isEditable"))
    objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarDescription:dpRecorder:", *(_QWORD *)(a1 + 40), v10);

}

- (void)didDeleteAvatar:(id)a3
{
  _QWORD v4[5];

  if (objc_msgSend(a3, "isEditable"))
  {
    -[AVTUsageTrackingSession sendCrossAppsEventForAction:](self, "sendCrossAppsEventForAction:", CFSTR("MemojiDeleted"));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43__AVTUsageTrackingSession_didDeleteAvatar___block_invoke;
    v4[3] = &unk_1EA51EF48;
    v4[4] = self;
    -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v4);
  }
}

uint64_t __43__AVTUsageTrackingSession_didDeleteAvatar___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarLikenessClustersWithClient:", a2);
}

- (void)didCreateAvatar:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEditable"))
  {
    -[AVTUsageTrackingSession sendCrossAppsEventForAction:](self, "sendCrossAppsEventForAction:", CFSTR("MemojiCreated"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v4);
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__AVTUsageTrackingSession_didCreateAvatar___block_invoke;
    v6[3] = &unk_1EA51EF70;
    v6[4] = self;
    v7 = v5;
    -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

  }
}

void __43__AVTUsageTrackingSession_didCreateAvatar___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v5, "nts_reportAvatarDescription:dpRecorder:", v6, a3);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarComplexity:withClient:", *(_QWORD *)(a1 + 40), v7);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarLikenessClustersWithClient:", v7);

}

- (void)didEditAvatar:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEditable"))
  {
    -[AVTUsageTrackingSession sendCrossAppsEventForAction:](self, "sendCrossAppsEventForAction:", CFSTR("MemojiEdited"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v4);
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__AVTUsageTrackingSession_didEditAvatar___block_invoke;
    v6[3] = &unk_1EA51EF70;
    v6[4] = self;
    v7 = v5;
    -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

  }
}

void __41__AVTUsageTrackingSession_didEditAvatar___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v5, "nts_reportAvatarDescription:dpRecorder:", v6, a3);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarComplexity:withClient:", *(_QWORD *)(a1 + 40), v7);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarLikenessClustersWithClient:", v7);

}

- (void)didDuplicateAvatar:(id)a3
{
  if (objc_msgSend(a3, "isEditable"))
    -[AVTUsageTrackingSession sendCrossAppsEventForAction:](self, "sendCrossAppsEventForAction:", CFSTR("MemojiDuplicated"));
}

- (void)didShowExpandedMode
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__AVTUsageTrackingSession_didShowExpandedMode__block_invoke;
  v2[3] = &unk_1EA51EF48;
  v2[4] = self;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v2);
}

uint64_t __46__AVTUsageTrackingSession_didShowExpandedMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setExpandedMode:", 1);
}

- (void)didRecordVideo
{
  _QWORD v3[5];

  -[AVTUsageTrackingSession didPauseFaceTracking](self, "didPauseFaceTracking");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__AVTUsageTrackingSession_didRecordVideo__block_invoke;
  v3[3] = &unk_1EA51EF48;
  v3[4] = self;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v3);
}

uint64_t __41__AVTUsageTrackingSession_didRecordVideo__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRecordedVideo:", 1);
}

- (void)didEnterEditor
{
  void (**v3)(void);
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[AVTUsageTrackingSession timeProvider](self, "timeProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__AVTUsageTrackingSession_didEnterEditor__block_invoke;
  v6[3] = &unk_1EA51EF70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

uint64_t __41__AVTUsageTrackingSession_didEnterEditor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditorEnterDate:", *(_QWORD *)(a1 + 40));
}

- (void)didLeaveEditor
{
  void (**v3)(void);
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[AVTUsageTrackingSession timeProvider](self, "timeProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__AVTUsageTrackingSession_didLeaveEditor__block_invoke;
  v6[3] = &unk_1EA51EF70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

void __41__AVTUsageTrackingSession_didLeaveEditor__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "editorEnterDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "nts_reportEditorTimeWithExitTime:client:", *(_QWORD *)(a1 + 40), v4);

}

- (void)didStartFaceTrackingInCarouselWithAvatar:(id)a3
{
  id v4;
  AVTUsageTrackingRecordTimedEvent *v5;
  void (**v6)(void);
  void *v7;
  AVTUsageTrackingRecordTimedEvent *v8;
  AVTUsageTrackingRecordTimedEvent *v9;
  _QWORD v10[5];
  AVTUsageTrackingRecordTimedEvent *v11;

  v4 = a3;
  v5 = [AVTUsageTrackingRecordTimedEvent alloc];
  -[AVTUsageTrackingSession timeProvider](self, "timeProvider");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTUsageTrackingRecordTimedEvent initWithStartTime:record:](v5, "initWithStartTime:record:", v7, v4);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__AVTUsageTrackingSession_didStartFaceTrackingInCarouselWithAvatar___block_invoke;
  v10[3] = &unk_1EA51EF70;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v10);

}

uint64_t __68__AVTUsageTrackingSession_didStartFaceTrackingInCarouselWithAvatar___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFaceTrackingEvent:", *(_QWORD *)(a1 + 40));
}

- (void)didChangeCurrentAvatarInCarousel:(id)a3
{
  id v4;
  void (**v5)(void);
  void *v6;
  AVTUsageTrackingRecordTimedEvent *v7;
  AVTUsageTrackingRecordTimedEvent *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  AVTUsageTrackingRecordTimedEvent *v12;

  v4 = a3;
  -[AVTUsageTrackingSession timeProvider](self, "timeProvider");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AVTUsageTrackingRecordTimedEvent initWithStartTime:record:]([AVTUsageTrackingRecordTimedEvent alloc], "initWithStartTime:record:", v6, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__AVTUsageTrackingSession_didChangeCurrentAvatarInCarousel___block_invoke;
  v10[3] = &unk_1EA51EFE8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v10);

}

void __60__AVTUsageTrackingSession_didChangeCurrentAvatarInCarousel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "faceTrackingEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "nts_reportFaceTrackingTimeWithEndTime:client:", *(_QWORD *)(a1 + 40), v6);
    objc_msgSend(*(id *)(a1 + 32), "setFaceTrackingEvent:", *(_QWORD *)(a1 + 48));
    if (objc_msgSend(*(id *)(a1 + 32), "recordedVideo"))
    {
      objc_msgSend(*(id *)(a1 + 32), "faceTrackingEvent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pauseAtTime:", *(_QWORD *)(a1 + 40));

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "recordedVideo"))
  {
    objc_msgSend(*(id *)(a1 + 32), "makeEventKeyForAction:", CFSTR("SwitchVideoAvatar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendEventForKey:payload:", v5, 0);

  }
}

- (void)didStopFaceTrackingInCarousel
{
  void (**v3)(void);
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[AVTUsageTrackingSession timeProvider](self, "timeProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__AVTUsageTrackingSession_didStopFaceTrackingInCarousel__block_invoke;
  v6[3] = &unk_1EA51EF70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

void __56__AVTUsageTrackingSession_didStopFaceTrackingInCarousel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "faceTrackingEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "nts_reportFaceTrackingTimeWithEndTime:client:", *(_QWORD *)(a1 + 40), v4);

}

- (void)didPauseFaceTracking
{
  void (**v3)(void);
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[AVTUsageTrackingSession timeProvider](self, "timeProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__AVTUsageTrackingSession_didPauseFaceTracking__block_invoke;
  v6[3] = &unk_1EA51EF70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

void __47__AVTUsageTrackingSession_didPauseFaceTracking__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "faceTrackingEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "faceTrackingEvent");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseAtTime:", *(_QWORD *)(a1 + 40));

  }
}

- (void)didResumeFaceTracking
{
  void (**v3)(void);
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[AVTUsageTrackingSession timeProvider](self, "timeProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__AVTUsageTrackingSession_didResumeFaceTracking__block_invoke;
  v6[3] = &unk_1EA51EF70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

void __48__AVTUsageTrackingSession_didResumeFaceTracking__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "faceTrackingEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "faceTrackingEvent");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resumeAtTime:", *(_QWORD *)(a1 + 40));

  }
}

- (void)didSelectStickerFromStickersApp:(id)a3 withAvatar:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTUsageTrackingSession didSelectStickerFromStickersApp:withAvatar:bundleIdentifier:](self, "didSelectStickerFromStickersApp:withAvatar:bundleIdentifier:", v8, v7, v10);
}

- (void)didSelectStickerFromStickersApp:(id)a3 withAvatar:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "allowListAppNameFromBundleID:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTUsageTrackingSession sentStickerFromStickersApp:withAvatarRecord:action:appName:](self, "sentStickerFromStickersApp:withAvatarRecord:action:appName:", v10, v9, CFSTR("StickerSent"), v11);
}

- (void)didChangeCurrentAvatarInStickers:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__AVTUsageTrackingSession_didChangeCurrentAvatarInStickers___block_invoke;
  v3[3] = &unk_1EA51EF48;
  v3[4] = self;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v3);
}

void __60__AVTUsageTrackingSession_didChangeCurrentAvatarInStickers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "makeEventKeyForAction:", CFSTR("SwitchStickersAvatar"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendEventForKey:payload:", v4, 0);

}

- (void)didTapStickerFromRecents:(id)a3 withAvatarIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__AVTUsageTrackingSession_didTapStickerFromRecents_withAvatarIdentifier___block_invoke;
  v10[3] = &unk_1EA51EFE8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v10);

}

void __73__AVTUsageTrackingSession_didTapStickerFromRecents_withAvatarIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "makeEventKeyForAction:", CFSTR("StickerRecentSent"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "payloadForAvatarRecordIdentifier:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKeyedSubscript:", a1[6], CFSTR("sticker"));
  objc_msgSend(v4, "sendEventForKey:payload:", v7, v6);

}

- (void)didOpenStickersAppFromRecents
{
  -[AVTUsageTrackingSession sendEventForAction:](self, "sendEventForAction:", CFSTR("StickerRecentsOpenStickersApp"));
}

- (void)sentStickerFromStickersApp:(id)a3 withAvatarRecord:(id)a4 action:(id)a5 appName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__AVTUsageTrackingSession_sentStickerFromStickersApp_withAvatarRecord_action_appName___block_invoke;
  v18[3] = &unk_1EA51F010;
  v18[4] = self;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  v22 = v13;
  v14 = v13;
  v15 = v10;
  v16 = v11;
  v17 = v12;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v18);

}

void __86__AVTUsageTrackingSession_sentStickerFromStickersApp_withAvatarRecord_action_appName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v5, "makeEventKeyForAction:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "payloadForAvatarRecord:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("sticker"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("appName"));
  objc_msgSend(v7, "sendEventForKey:payload:", v8, v10);

  if (objc_msgSend(*(id *)(a1 + 48), "isEditable"))
    objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarDescription:dpRecorder:", *(_QWORD *)(a1 + 48), v11);

}

- (void)beginWithStore:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AVTUsageTrackingSession *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__AVTUsageTrackingSession_beginWithStore___block_invoke;
  v6[3] = &unk_1EA51EF70;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

uint64_t __42__AVTUsageTrackingSession_beginWithStore___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_1F03E3D60) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "setAvatarStore:", *(_QWORD *)(a1 + 32));
}

- (void)end
{
  void (**v3)(void);
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[AVTUsageTrackingSession timeProvider](self, "timeProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__AVTUsageTrackingSession_end__block_invoke;
  v6[3] = &unk_1EA51EF70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AVTUsageTrackingSession performClientWork:](self, "performClientWork:", v6);

}

void __30__AVTUsageTrackingSession_end__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "avatarStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Session not started with a store"));
  objc_msgSend(*(id *)(a1 + 32), "setRecordedVideo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarCountWithClient:", v6);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportExpandedModeWithClient:", v6);
  objc_msgSend(*(id *)(a1 + 32), "editorEnterDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "nts_reportEditorTimeWithExitTime:client:", *(_QWORD *)(a1 + 40), v6);
  objc_msgSend(*(id *)(a1 + 32), "faceTrackingEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "nts_reportFaceTrackingTimeWithEndTime:client:", *(_QWORD *)(a1 + 40), v6);

}

- (void)nts_loadDefaultConfigurationIfNeeded
{
  void *avatarRecord;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  AVTAvatarConfiguration *v7;
  AVTAvatarConfiguration *defaultConfiguration;

  -[AVTUsageTrackingSession defaultConfiguration](self, "defaultConfiguration");
  avatarRecord = (void *)objc_claimAutoreleasedReturnValue();
  if (!avatarRecord)
  {
    -[AVTUsageTrackingSession avatarRecord](self, "avatarRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
    -[AVTUsageTrackingSession recordTransformer](self, "recordTransformer");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[AVTUsageTrackingSession avatarRecord](self, "avatarRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);
    v7 = (AVTAvatarConfiguration *)objc_claimAutoreleasedReturnValue();
    defaultConfiguration = self->_defaultConfiguration;
    self->_defaultConfiguration = v7;

    avatarRecord = self->_avatarRecord;
    self->_avatarRecord = 0;
  }

}

- (void)nts_reportEditorTimeWithExitTime:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[AVTUsageTrackingSession editorEnterDate](self, "editorEnterDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  -[AVTUsageTrackingSession setEditorEnterDate:](self, "setEditorEnterDate:", 0);
  -[AVTUsageTrackingSession makeCrossAppEventKeyForAction:](self, "makeCrossAppEventKeyForAction:", CFSTR("EditorTime"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTUsageTrackingSession payloadForCrossAppEvent](self, "payloadForCrossAppEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("time"));

  objc_msgSend(v6, "sendEventForKey:payload:", v14, v12);
}

- (void)nts_reportFaceTrackingTimeWithEndTime:(id)a3 client:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v6 = a3;
  -[AVTUsageTrackingSession faceTrackingEvent](self, "faceTrackingEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "totalElapsedTimeAtTime:", v6);
  v9 = v8;

  -[AVTUsageTrackingSession faceTrackingEvent](self, "faceTrackingEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "record");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTUsageTrackingSession setFaceTrackingEvent:](self, "setFaceTrackingEvent:", 0);
  -[AVTUsageTrackingSession makeEventKeyForAction:](self, "makeEventKeyForAction:", CFSTR("FaceTrackingTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "payloadForAvatarRecord:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("time"));

  objc_msgSend(v18, "sendEventForKey:payload:", v12, v14);
  if (v9 > 30.0)
  {
    -[AVTUsageTrackingSession makeEventKeyForAction:](self, "makeEventKeyForAction:", CFSTR("FaceTrackingMoreThan30s"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "payloadForAvatarRecord:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendEventForKey:payload:", v16, v17);

  }
}

- (void)nts_reportAvatarCountWithClient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AVTUsageTrackingSession avatarStore](self, "avatarStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00840], "requestForCustomAvatars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarsForFetchRequest:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "count");
    -[AVTUsageTrackingSession logger](self, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logUsageTrackingRecordCount:", v7);

    -[AVTUsageTrackingSession makeCrossAppEventKeyForAction:](self, "makeCrossAppEventKeyForAction:", CFSTR("MemojiCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUsageTrackingSession payloadForCrossAppEvent](self, "payloadForCrossAppEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("memojiCount"));

    objc_msgSend(v13, "sendEventForKey:payload:", v9, v11);
  }

}

- (void)nts_reportAvatarDescription:(id)a3 dpRecorder:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v6);
  v8 = v6;
  -[AVTUsageTrackingSession recordTransformer](self, "recordTransformer");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v9)[2](v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTUsageTrackingSession nts_loadDefaultConfigurationIfNeeded](self, "nts_loadDefaultConfigurationIfNeeded");
  v11 = (void *)objc_opt_class();
  v21 = 0;
  v22 = 0;
  -[AVTUsageTrackingSession defaultConfiguration](self, "defaultConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getPresetDescription:usedCategoriesDescription:forAvatarConfiguration:defaultConfiguration:", &v22, &v21, v10, v12);
  v13 = v22;
  v14 = v21;
  v15 = v13;

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__AVTUsageTrackingSession_nts_reportAvatarDescription_dpRecorder___block_invoke;
  v19[3] = &unk_1EA51F038;
  v19[4] = self;
  v20 = v7;
  v16 = v7;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v19);
  objc_msgSend(v14, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "makeDPKey:", CFSTR("MemojiCategoryUsed"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "recordString:forKey:", v17, v18);

}

void __66__AVTUsageTrackingSession_nts_reportAvatarDescription_dpRecorder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_class();
  objc_msgSend(CFSTR("MemojiAssetUsed."), "stringByAppendingString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "makeDPKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "recordString:forKey:", v5, v9);
}

- (void)nts_reportAvatarLikenessClustersWithClient:(id)a3
{
  id v4;
  AVTUsageTrackingSession *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  AVTUsageTrackingSession *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double (**v24)(_QWORD, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  -[AVTUsageTrackingSession avatarStore](self, "avatarStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00840], "requestForCustomAvatars");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarsForFetchRequest:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v37 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v36 = v8;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v42 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1DF0D05A4]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v14);
          v16 = v14;
          -[AVTUsageTrackingSession recordTransformer](v5, "recordTransformer");
          v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v17)[2](v17, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "addObject:", v18);
          objc_autoreleasePoolPop(v15);
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v11);
    }

    v19 = v5;
    v20 = (void *)objc_opt_class();
    -[AVTUsageTrackingSession metric](v5, "metric");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "configurationDistanceClassifierWithMetric:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "likenessComparator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __70__AVTUsageTrackingSession_nts_reportAvatarLikenessClustersWithClient___block_invoke;
    v39[3] = &unk_1EA51F060;
    v40 = obj;
    v24 = (double (**)(_QWORD, _QWORD))MEMORY[0x1DF0D0754](v39);
    +[AVTArrayPairClassification clustersForObjectsInArray:withClassifier:likenessThreshold:likenessComparator:](AVTArrayPairClassification, "clustersForObjectsInArray:withClassifier:likenessThreshold:likenessComparator:", v9, v22, &unk_1EA5716F8, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTArrayPairClassification clustersForObjectsInArray:withClassifier:likenessThreshold:likenessComparator:](AVTArrayPairClassification, "clustersForObjectsInArray:withClassifier:likenessThreshold:likenessComparator:", v9, v22, &unk_1EA571710, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUsageTrackingSession logger](v19, "logger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logUsageTrackingSmallDifferencesClusterCount:", objc_msgSend(v25, "count"));

    -[AVTUsageTrackingSession logger](v19, "logger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "logUsageTrackingBigDifferencesClusterCount:", objc_msgSend(v26, "count"));

    v29 = ((double (**)(_QWORD, void *))v24)[2](v24, v25);
    v30 = ((double (**)(_QWORD, void *))v24)[2](v24, v26);
    -[AVTUsageTrackingSession makeCrossAppEventKeyForAction:](v19, "makeCrossAppEventKeyForAction:", CFSTR("MemojiDifferences"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUsageTrackingSession payloadForCrossAppEvent](v19, "payloadForCrossAppEvent");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("smallDifferenceRatio"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("bigDifferenceRatio"));

    v4 = v37;
    objc_msgSend(v37, "sendEventForKey:payload:", v31, v33);

    v8 = v36;
  }

}

double __70__AVTUsageTrackingSession_nts_reportAvatarLikenessClustersWithClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;

  v3 = a2;
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't have 0 cluster if we have records"));
  v4 = (double)(unint64_t)objc_msgSend(v3, "count") + -1.0;
  v5 = 1.0 - v4 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "count");

  return v5;
}

- (void)nts_reportAvatarComplexity:(id)a3 withClient:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v7 = a3;
  -[AVTUsageTrackingSession nts_loadDefaultConfigurationIfNeeded](self, "nts_loadDefaultConfigurationIfNeeded");
  -[AVTUsageTrackingSession recordTransformer](self, "recordTransformer");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v8)[2](v8, v7);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTUsageTrackingSession metric](self, "metric");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUsageTrackingSession defaultConfiguration](self, "defaultConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "distanceFromConfiguration:toConfiguration:", v10, v18);

  -[AVTUsageTrackingSession metric](self, "metric");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "differenceCountFromDistance:", v11);

  -[AVTUsageTrackingSession makeCrossAppEventKeyForAction:](self, "makeCrossAppEventKeyForAction:", CFSTR("MemojiComplexity"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUsageTrackingSession payloadForCrossAppEvent](self, "payloadForCrossAppEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("complexity"));

  objc_msgSend(v6, "sendEventForKey:payload:", v14, v16);
}

- (void)nts_reportExpandedModeWithClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVTUsageTrackingSession makeEventKeyForAction:](self, "makeEventKeyForAction:", CFSTR("SessionEnded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("expandedUsed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVTUsageTrackingSession expandedMode](self, "expandedMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEventForKey:payload:", v5, v7);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTCoreAnalyticsClient)ntsCAClient
{
  return self->_ntsCAClient;
}

- (NSString)keyBasePrefix
{
  return self->_keyBasePrefix;
}

- (NSString)bundleAppName
{
  return self->_bundleAppName;
}

- (AVTDifferentialPrivacyRecorder)ntsDPRecorder
{
  return self->_ntsDPRecorder;
}

- (AVTAvatarConfigurationMetric)metric
{
  return self->_metric;
}

- (id)recordTransformer
{
  return self->_recordTransformer;
}

- (AVTAvatarConfiguration)defaultConfiguration
{
  return self->_defaultConfiguration;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (id)timeProvider
{
  return self->_timeProvider;
}

- (BOOL)expandedMode
{
  return self->_expandedMode;
}

- (void)setExpandedMode:(BOOL)a3
{
  self->_expandedMode = a3;
}

- (BOOL)recordedVideo
{
  return self->_recordedVideo;
}

- (void)setRecordedVideo:(BOOL)a3
{
  self->_recordedVideo = a3;
}

- (NSDate)editorEnterDate
{
  return self->_editorEnterDate;
}

- (void)setEditorEnterDate:(id)a3
{
  objc_storeStrong((id *)&self->_editorEnterDate, a3);
}

- (AVTUsageTrackingRecordTimedEvent)faceTrackingEvent
{
  return self->_faceTrackingEvent;
}

- (void)setFaceTrackingEvent:(id)a3
{
  objc_storeStrong((id *)&self->_faceTrackingEvent, a3);
}

- (AVTAvatarStoreInternal)avatarStore
{
  return self->_avatarStore;
}

- (void)setAvatarStore:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_faceTrackingEvent, 0);
  objc_storeStrong((id *)&self->_editorEnterDate, 0);
  objc_storeStrong(&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
  objc_storeStrong(&self->_recordTransformer, 0);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_ntsDPRecorder, 0);
  objc_storeStrong((id *)&self->_bundleAppName, 0);
  objc_storeStrong((id *)&self->_keyBasePrefix, 0);
  objc_storeStrong((id *)&self->_ntsCAClient, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
