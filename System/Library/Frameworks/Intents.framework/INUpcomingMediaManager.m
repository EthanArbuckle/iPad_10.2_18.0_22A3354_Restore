@implementation INUpcomingMediaManager

- (void)setPredictionMode:(INUpcomingMediaPredictionMode)mode forType:(INMediaItemType)type
{
  void *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _INVCVoiceShortcutClient();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((unint64_t)(type - 1) > 0x13)
      v7 = CFSTR("unknown");
    else
      v7 = *(&off_1E22928C8 + type - 1);
    v9 = v7;
    objc_msgSend(v6, "setInteger:forKey:inDomain:completionHandler:", mode, v9, CFSTR("com.apple.Intents.UpcomingMediaManager"), &__block_literal_global_19_54919);

  }
  else
  {
    v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[INUpcomingMediaManager setPredictionMode:forType:]";
      _os_log_error_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_ERROR, "%s Failed to set prediction mode: VoiceShortcutClient framework not found", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)setSuggestedMediaIntents:(NSOrderedSet *)intents
{
  -[INUpcomingMediaManager _setSuggestedMediaIntents:forBundleIdentifier:](self, "_setSuggestedMediaIntents:forBundleIdentifier:", intents, 0);
}

uint64_t __72__INUpcomingMediaManager__setSuggestedMediaIntents_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_replaceMediaIntents:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (INUpcomingMediaManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__INUpcomingMediaManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_54945 != -1)
    dispatch_once(&sharedManager_onceToken_54945, block);
  return (INUpcomingMediaManager *)(id)sharedManager_sharedManager;
}

void __52__INUpcomingMediaManager_setPredictionMode_forType___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[INUpcomingMediaManager setPredictionMode:forType:]_block_invoke";
      v8 = 2114;
      v9 = v4;
      _os_log_error_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_ERROR, "%s Failed to set prediction mode: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }

}

void __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(NSObject **)(a1 + 32);
  v6 = a2;
  dispatch_group_enter(v5);
  objc_msgSend(v6, "_intents_preferredScaledImageSize");
  v8 = v7;
  v10 = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_2;
  v13[3] = &unk_1E228DE68;
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(void **)(a1 + 48);
  v13[4] = *(_QWORD *)(a1 + 40);
  v17 = v11;
  v18 = a3;
  v13[1] = 3221225472;
  v14 = v12;
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 32);
  INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler(v6, 0x15u, 0, 1, 0, v13, v8, v10);

}

void __39__INUpcomingMediaManager_sharedManager__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  INUpcomingMediaManager *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v2 = (void *)getCSSearchableIndexClass_softClass_54946;
  v13 = getCSSearchableIndexClass_softClass_54946;
  if (!getCSSearchableIndexClass_softClass_54946)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getCSSearchableIndexClass_block_invoke_54947;
    v9[3] = &unk_1E22953C0;
    v9[4] = &v10;
    __getCSSearchableIndexClass_block_invoke_54947((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v10, 8);
  v4 = [v3 alloc];
  NSStringFromClass(*(Class *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:protectionClass:", v5, *MEMORY[0x1E0CB2AC0]);

  v7 = -[INUpcomingMediaManager initWithSearchableIndex:]([INUpcomingMediaManager alloc], "initWithSearchableIndex:", v6);
  v8 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v7;

}

- (INUpcomingMediaManager)initWithSearchableIndex:(id)a3
{
  id v5;
  INUpcomingMediaManager *v6;
  INUpcomingMediaManager *v7;
  INUpcomingMediaManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INUpcomingMediaManager;
  v6 = -[INUpcomingMediaManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_index, a3);
    v8 = v7;
  }

  return v7;
}

void __36__INUpcomingMediaManager_mediaQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("INUpcomingMediaManagerQueue", v2);
  v1 = (void *)mediaQueue_mediaQueue;
  mediaQueue_mediaQueue = (uint64_t)v0;

}

- (void)_setSuggestedMediaIntents:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "isMemberOfClass:", objc_opt_class()) & 1) == 0)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("Expecting INPlayMediaIntent, not %@"), v18);
          v19 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v20);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  +[INUpcomingMediaManager mediaQueue](INUpcomingMediaManager, "mediaQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__INUpcomingMediaManager__setSuggestedMediaIntents_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E228DE38;
  block[4] = self;
  v22 = v8;
  v23 = v7;
  v14 = v7;
  v15 = v8;
  dispatch_async(v13, block);

}

- (void)_replaceMediaIntents:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  dispatch_group_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  INUpcomingMediaManager *v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[INUpcomingMediaManager mediaQueue](INUpcomingMediaManager, "mediaQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCount:", v9);
  v11 = (void *)objc_opt_new();
  v12 = dispatch_group_create();
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke;
  v29[3] = &unk_1E228DE90;
  v14 = v12;
  v30 = v14;
  v31 = self;
  v34 = v9;
  v32 = v11;
  v15 = v10;
  v33 = v15;
  v16 = v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v29);

  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v15, "compact");
  -[INUpcomingMediaManager index](self, "index");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v14);
  v35[0] = CFSTR("com.apple.siri.upcomingmedia");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0CB2AC0];
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_15;
  v24[3] = &unk_1E228DEE0;
  v25 = v15;
  v26 = v14;
  v27 = v17;
  v28 = v6;
  v20 = v6;
  v21 = v17;
  v22 = v14;
  v23 = v15;
  objc_msgSend(v21, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:completionHandler:", v18, v19, v20, 0, v24);

  dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
}

+ (id)mediaQueue
{
  if (mediaQueue_onceToken != -1)
    dispatch_once(&mediaQueue_onceToken, &__block_literal_global_54954);
  return (id)mediaQueue_mediaQueue;
}

void __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[INUpcomingMediaManager _replaceMediaIntents:forBundleIdentifier:]_block_invoke";
      v7 = 2114;
      v8 = v3;
      _os_log_error_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_ERROR, "%s Error when trying to index new upcoming media items: %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (int64_t)_predictionModeForBundleId:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v7 = a3;
  if ((unint64_t)(a4 - 1) > 0x13)
    v8 = CFSTR("unknown");
  else
    v8 = *(&off_1E22928C8 + a4 - 1);
  v9 = v8;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Intents.UpcomingMediaManager"));
  -[INUpcomingMediaManager keyWithMediaItemTypeName:bundleId:](self, "keyWithMediaItemTypeName:bundleId:", v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "integerForKey:", v11);
  return v12;
}

- (id)keyWithMediaItemTypeName:(id)a3 bundleId:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = a4;
  v11[1] = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("-"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
}

void __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[INUpcomingMediaManager _replaceMediaIntents:forBundleIdentifier:]_block_invoke";
      v13 = 2114;
      v14 = v3;
      _os_log_error_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_ERROR, "%s Error when trying to delete existing upcoming media items: %{public}@", buf, 0x16u);
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CB2AC0];
    v8 = *(_QWORD *)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_16;
    v9[3] = &unk_1E228DEB8;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v6, MEMORY[0x1E0C9AA60], 0, v7, v8, 0, v9);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __67__INUpcomingMediaManager__replaceMediaIntents_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  INInteraction *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6
    && (v7 = INSiriLogContextIntents,
        os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 136315650;
    v15 = "-[INUpcomingMediaManager _replaceMediaIntents:forBundleIdentifier:]_block_invoke_2";
    v16 = 2112;
    v17 = v13;
    v18 = 2114;
    v19 = v6;
    _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Error injecting image proxies into %{publc}@: %{public}@", (uint8_t *)&v14, 0x20u);
    if (!v5)
      goto LABEL_7;
  }
  else if (!v5)
  {
    goto LABEL_7;
  }
  v8 = -[INInteraction initWithIntent:response:]([INInteraction alloc], "initWithIntent:response:", v5, 0);
  -[INInteraction _searchableItemIncludingData:](v8, "_searchableItemIncludingData:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "attributeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDomainIdentifier:", CFSTR("com.apple.siri.upcomingmedia"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64) + ~*(_QWORD *)(a1 + 72));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRankingHint:", v12);

    objc_msgSend(*(id *)(a1 + 40), "lock");
    objc_msgSend(*(id *)(a1 + 48), "replacePointerAtIndex:withPointer:", *(_QWORD *)(a1 + 72), v10);
    objc_msgSend(*(id *)(a1 + 40), "unlock");

  }
LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

@end
