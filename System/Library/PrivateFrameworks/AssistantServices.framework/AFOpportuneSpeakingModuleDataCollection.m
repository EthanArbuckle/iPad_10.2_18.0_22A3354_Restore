@implementation AFOpportuneSpeakingModuleDataCollection

- (AFOpportuneSpeakingModuleDataCollection)init
{
  AFOpportuneSpeakingModuleDataCollection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *speakableMap;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id DCRuleClass;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)AFOpportuneSpeakingModuleDataCollection;
  v2 = -[AFOpportuneSpeakingModuleDataCollection init](&v25, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("OSMDataCollection", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    speakableMap = v2->_speakableMap;
    v2->_speakableMap = v6;

    if (DataCollectionServicesLibrary_sOnce != -1)
      dispatch_once(&DataCollectionServicesLibrary_sOnce, &__block_literal_global_84);
    if (DataCollectionServicesLibrary_sLib)
    {
      v8 = (void *)AFSiriLogContextService;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
      {
        v21 = (void *)MEMORY[0x1E0CB3898];
        v22 = v8;
        objc_msgSend(v21, "processInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "processName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v27 = "-[AFOpportuneSpeakingModuleDataCollection init]";
        v28 = 2112;
        v29 = v24;
        _os_log_debug_impl(&dword_19AF50000, v22, OS_LOG_TYPE_DEBUG, "%s Configuring data collection manager for process: %@", buf, 0x16u);

      }
      objc_msgSend(getDCConfigurationClass(), "sharedConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPrimaryProcess:", CFSTR("assistantd"));
      objc_msgSend(v9, "setPackingPolicy:", getDCPackingPolicyTypeOnTimer());
      objc_msgSend(v9, "setPackagingTimeInterval:", 3600.0);
      objc_msgSend(v9, "setLogWriteTimeInterval:", 300.0);
      objc_msgSend(v9, "setOutputDirectoryPath:", CFSTR("/tmp/OSM/"));
      objc_msgSend(v9, "setUploadUrl:", CFSTR("https://osmdatacollectionproxy.usspk02.orchard.apple.com/upload"));
      objc_msgSend(getDCLongRunningLogClass(), "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addLogger:toProcess:", v10, CFSTR("assistantd"));

      objc_msgSend(getDCLongRunningLogClass(), "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addLogger:toProcess:", v11, CFSTR("OpportuneSpeakingModelService"));

      DCRuleClass = getDCRuleClass();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("process-%@"), CFSTR("assistantd"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(DCRuleClass, "getNearestFileAfterMarkWithPrefix:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addPackingRule:", v14);

      v15 = getDCRuleClass();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("process-%@"), CFSTR("OpportuneSpeakingModelService"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "getNearestFileAfterMarkWithPrefix:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addPackingRule:", v17);

      objc_msgSend(getDCManagerClass(), "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setupWithConfiguration:", v9);

      v19 = _AFPreferencesOpportuneSpeakingModuleEnabled();
      AFSetSpokenNotificationDataCollectionEnabled(v19);

    }
  }
  return v2;
}

- (void)logSpeakable:(id)a3 forContact:(id)a4 withModelId:(id)a5 withFeatures:(id)a6 withScore:(float)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  float v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __102__AFOpportuneSpeakingModuleDataCollection_logSpeakable_forContact_withModelId_withFeatures_withScore___block_invoke;
  v21[3] = &unk_1E3A2EF68;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v26 = a7;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(queue, v21);

}

- (void)logFeedbackOfType:(int64_t)a3 forSpeakableId:(id)a4 withModelId:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__AFOpportuneSpeakingModuleDataCollection_logFeedbackOfType_forSpeakableId_withModelId___block_invoke;
  v13[3] = &unk_1E3A32C20;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)logRecommendedAction:(id)a3 forSpeakableId:(id)a4 withModelId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__AFOpportuneSpeakingModuleDataCollection_logRecommendedAction_forSpeakableId_withModelId___block_invoke;
  v15[3] = &unk_1E3A369B8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void)logInteractionEvents:(id)a3 forSpeakableId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AFOpportuneSpeakingModuleDataCollection_logInteractionEvents_forSpeakableId___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)_deleteSpeakablesOlderThan:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __objc2_class **p_superclass;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v17;
  NSObject *log;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allKeys](self->_speakableMap, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    p_superclass = &OBJC_METACLASS___AFFeatureFlags.superclass;
    *(_QWORD *)&v7 = 136315650;
    v17 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_speakableMap, "objectForKey:", v12, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isOlderThan:", v4))
        {
          v14 = p_superclass[194];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            log = v14;
            objc_msgSend(v13, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "date");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v24 = "-[AFOpportuneSpeakingModuleDataCollection _deleteSpeakablesOlderThan:]";
            v25 = 2112;
            v26 = v15;
            v27 = 2112;
            v28 = v16;
            _os_log_debug_impl(&dword_19AF50000, log, OS_LOG_TYPE_DEBUG, "%s Deleting sanitized speakable:%@ date:%@", buf, 0x20u);

            p_superclass = (__objc2_class **)(&OBJC_METACLASS___AFFeatureFlags + 8);
          }
          -[NSMutableDictionary removeObjectForKey:](self->_speakableMap, "removeObjectForKey:", v12);
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __79__AFOpportuneSpeakingModuleDataCollection_logInteractionEvents_forSpeakableId___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v8 = (void *)v2;
    v4 = AFSpokenNotificationDataCollectionEnabled();
    v3 = v8;
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "setObject:forKey:", a1[6], CFSTR("InteractionEvents"));
      objc_msgSend(v8, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("SpeakableId"));

      objc_msgSend(getDCLongRunningLogClass(), "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addEventWithType:eventDataAsDictionary:", CFSTR("InteractionInfo"), v5);

      v3 = v8;
    }
  }

}

void __91__AFOpportuneSpeakingModuleDataCollection_logRecommendedAction_forSpeakableId_withModelId___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v8 = (void *)v2;
    v4 = AFSpokenNotificationDataCollectionEnabled();
    v3 = v8;
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "setObject:forKey:", a1[6], CFSTR("RecommendedAction"));
      objc_msgSend(v5, "setObject:forKey:", a1[7], CFSTR("ModelId"));
      objc_msgSend(v8, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("SpeakableId"));

      objc_msgSend(getDCLongRunningLogClass(), "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addEventWithType:eventDataAsDictionary:", CFSTR("RecommendationInfo"), v5);

      v3 = v8;
    }
  }

}

void __88__AFOpportuneSpeakingModuleDataCollection_logFeedbackOfType_forSpeakableId_withModelId___block_invoke(_QWORD *a1)
{
  id v2;
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && AFSpokenNotificationDataCollectionEnabled())
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = a1[7];
    if (v3 > 2)
      v4 = CFSTR("Unknown");
    else
      v4 = off_1E3A312A0[v3];
    v5 = v4;
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("Feedback"));

    objc_msgSend(v2, "setObject:forKey:", a1[6], CFSTR("ModelId"));
    objc_msgSend(v8, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("SpeakableId"));

    objc_msgSend(getDCLongRunningLogClass(), "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEventWithType:eventDataAsDictionary:", CFSTR("FeedbackInfo"), v2);

  }
}

void __102__AFOpportuneSpeakingModuleDataCollection_logSpeakable_forContact_withModelId_withFeatures_withScore___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable *v17;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "speakableIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v17 = (AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v4 = [AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable alloc];
    objc_msgSend(*(id *)(a1 + 40), "speakableDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable initWithDate:](v4, "initWithDate:", v5);

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "speakableIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v17, v7);

  }
  if (AFSpokenNotificationDataCollectionEnabled())
  {
    if (objc_msgSend(getDCUtilsClass(), "isCurrentProcess:", CFSTR("assistantd")))
    {
      objc_msgSend(getDCManagerClass(), "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "markSessionForUpload:withReason:", mach_absolute_time(), CFSTR("NotificationEvent"));

    }
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(*(id *)(a1 + 48), "length"))
      v10 = *(const __CFString **)(a1 + 48);
    else
      v10 = CFSTR("NOID");
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("ContactId"));
    objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(a1 + 56), CFSTR("ModelId"));
    -[AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable identifier](v17, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("SpeakableId"));

    objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(a1 + 64), CFSTR("SpeakableFeatures"));
    LODWORD(v12) = *(_DWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("SpeakableScore"));

    objc_msgSend(getDCLongRunningLogClass(), "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addEventWithType:eventDataAsDictionary:", CFSTR("SpeakableInfo"), v9);

  }
  v15 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -600.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_deleteSpeakablesOlderThan:", v16);

}

+ (id)sharedCollector
{
  if (sharedCollector_onceToken != -1)
    dispatch_once(&sharedCollector_onceToken, &__block_literal_global_9268);
  return (id)sharedCollector__sharedInstance;
}

void __58__AFOpportuneSpeakingModuleDataCollection_sharedCollector__block_invoke()
{
  AFOpportuneSpeakingModuleDataCollection *v0;
  void *v1;

  v0 = objc_alloc_init(AFOpportuneSpeakingModuleDataCollection);
  v1 = (void *)sharedCollector__sharedInstance;
  sharedCollector__sharedInstance = (uint64_t)v0;

}

@end
