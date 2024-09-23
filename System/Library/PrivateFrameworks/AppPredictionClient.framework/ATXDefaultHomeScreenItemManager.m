@implementation ATXDefaultHomeScreenItemManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_77);
  return (id)sharedInstance_manager;
}

void __49__ATXDefaultHomeScreenItemManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = v0;

}

- (ATXDefaultHomeScreenItemManager)init
{
  void *v3;
  void *v4;
  ATXDefaultHomeScreenItemManager *v5;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("ATXDefaultWidgetStacks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("ATXAmbientDefaultWidgetStacks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXDefaultHomeScreenItemManager initWithHomeScreenPath:ambientPath:](self, "initWithHomeScreenPath:ambientPath:", v3, v4);

  return v5;
}

- (ATXDefaultHomeScreenItemManager)initWithHomeScreenPath:(id)a3 ambientPath:(id)a4
{
  id v6;
  id v7;
  ATXDefaultHomeScreenItemManager *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *internalQueue;
  uint64_t v12;
  NSString *homeScreenPath;
  uint64_t v14;
  NSString *ambientPath;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXDefaultHomeScreenItemManager;
  v8 = -[ATXDefaultHomeScreenItemManager init](&v17, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("ATXDefaultWidgetManager", v9);
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(v6, "copy");
    homeScreenPath = v8->_homeScreenPath;
    v8->_homeScreenPath = (NSString *)v12;

    v14 = objc_msgSend(v7, "copy");
    ambientPath = v8->_ambientPath;
    v8->_ambientPath = (NSString *)v14;

  }
  return v8;
}

- (void)writeHomeScreenUpdate:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSString *homeScreenPath;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  homeScreenPath = self->_homeScreenPath;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__ATXDefaultHomeScreenItemManager_writeHomeScreenUpdate_completionHandler___block_invoke;
  v9[3] = &unk_1E4D571E0;
  v10 = v6;
  v8 = v6;
  -[ATXDefaultHomeScreenItemManager _writeUpdate:atPath:completionHandler:](self, "_writeUpdate:atPath:completionHandler:", a3, homeScreenPath, v9);

}

void __75__ATXDefaultHomeScreenItemManager_writeHomeScreenUpdate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!v3)
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.widgetOnboardingUpdate"), "UTF8String"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)writeAmbientUpdate:(id)a3 completionHandler:(id)a4
{
  -[ATXDefaultHomeScreenItemManager _writeUpdate:atPath:completionHandler:](self, "_writeUpdate:atPath:completionHandler:", a3, self->_ambientPath, a4);
}

- (void)_writeUpdate:(id)a3 atPath:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke;
  v14[3] = &unk_1E4D5C1E8;
  v16 = v9;
  v17 = v10;
  v15 = v8;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  -[ATXDefaultHomeScreenItemManager _readUpdateFromFileAtPath:completionHandler:](self, "_readUpdateFromFileAtPath:completionHandler:", v11, v14);

}

void __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  int v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  NSObject *v39;
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  _QWORD v44[4];
  NSObject *v45;
  id v46;
  id v47;
  _QWORD block[4];
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  _QWORD v63[4];

  v63[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_home_screen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_3();

  }
  if (objc_msgSend(v5, "isEqual:", a1[4]))
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[ATXDefaultHomeScreenItemManager _writeUpdate:atPath:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s: Defaults are the same as cached, not updating", buf, 0xCu);
    }

    dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_14;
    block[3] = &unk_1E4D59D88;
    v49 = a1[6];
    dispatch_async(v9, block);

    v10 = v49;
  }
  else
  {
    objc_msgSend(a1[4], "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1A85A4F90]();
    v47 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v47);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v47;
    objc_autoreleasePoolPop(v11);
    if (v12)
    {
      v14 = open((const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "fileSystemRepresentation"), 514, 384);
      if (v14 == -1)
      {
        __atxlog_handle_home_screen();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_2();

        v27 = (void *)MEMORY[0x1E0CB35C8];
        v62 = *MEMORY[0x1E0CB2938];
        v63[0] = CFSTR("Unable to create file");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("ATXDefaultWidgetManager"), 0, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_get_global_queue(25, 0);
        v30 = objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_22;
        v41[3] = &unk_1E4D58780;
        v23 = &v43;
        v43 = a1[6];
        v13 = v29;
        v42 = v13;
        dispatch_async(v30, v41);

        v22 = v42;
      }
      else
      {
        v15 = v14;
        v16 = ATXCacheFileWrite();
        if ((v15 & 0x80000000) == 0)
          close(v15);
        if ((v16 & 1) != 0)
        {
          __atxlog_handle_home_screen();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(a1[4], "stack");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "smallWidgets");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "mediumWidgets");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "largeWidgets");
            v20 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316162;
            v51 = "-[ATXDefaultHomeScreenItemManager _writeUpdate:atPath:completionHandler:]_block_invoke_3";
            v52 = 2112;
            v53 = v35;
            v54 = 2112;
            v55 = v18;
            v56 = 2112;
            v57 = v19;
            v58 = 2112;
            v59 = v20;
            v21 = (void *)v20;
            _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "%s: New add widget defaults sucessfully written to cache: default stack: %@, default widgets small: %@, default widgets medium: %@ default widgets large: %@", buf, 0x34u);

          }
          dispatch_get_global_queue(25, 0);
          v22 = objc_claimAutoreleasedReturnValue();
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_26;
          v36[3] = &unk_1E4D59D88;
          v23 = &v37;
          v37 = a1[6];
          dispatch_async(v22, v36);
        }
        else
        {
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v60 = *MEMORY[0x1E0CB2938];
          v61 = CFSTR("Unable to write data to file");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("ATXDefaultWidgetManager"), 1, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          dispatch_get_global_queue(25, 0);
          v34 = objc_claimAutoreleasedReturnValue();
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_2;
          v38[3] = &unk_1E4D58780;
          v23 = &v40;
          v40 = a1[6];
          v13 = v33;
          v39 = v13;
          dispatch_async(v34, v38);

          v22 = v39;
        }
      }
    }
    else
    {
      __atxlog_handle_home_screen();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_1();

      dispatch_get_global_queue(25, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_17;
      v44[3] = &unk_1E4D58780;
      v23 = &v46;
      v46 = a1[6];
      v13 = v13;
      v45 = v13;
      dispatch_async(v25, v44);

      v22 = v45;
    }

  }
}

uint64_t __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchGalleryItemsForVariant:(unint64_t)a3 gridSize:(unint64_t)a4 supportedFamilies:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = +[ATXDemoStackAndWidgetProvider isDemoModeEnabled](ATXDemoStackAndWidgetProvider, "isDemoModeEnabled");
  if (!v10 || !v11)
  {
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke;
    v22[3] = &unk_1E4D5C210;
    v23 = v10;
    v24 = a3;
    v25 = a5;
    v26 = a4;
    v15 = (void *)MEMORY[0x1A85A511C](v22);
    v16 = v15;
    if (a3)
    {
      if (a3 != 1)
      {
LABEL_11:

        v12 = v23;
        goto LABEL_12;
      }
      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_2;
      v20[3] = &unk_1E4D5C238;
      v17 = &v21;
      v21 = v15;
      -[ATXDefaultHomeScreenItemManager _readAmbientUpdateFromFileWithCompletionHandler:](self, "_readAmbientUpdateFromFileWithCompletionHandler:", v20);
    }
    else
    {
      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_3;
      v18[3] = &unk_1E4D5C238;
      v17 = &v19;
      v19 = v15;
      -[ATXDefaultHomeScreenItemManager _readHomeScreenUpdateFromFileWithCompletionHandler:](self, "_readHomeScreenUpdateFromFileWithCompletionHandler:", v18);
    }

    goto LABEL_11;
  }
  +[ATXDemoStackAndWidgetProvider demoStackAndWidgets](ATXDemoStackAndWidgetProvider, "demoStackAndWidgets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[ATXDefaultHomeScreenItemManager fetchGalleryItemsForVariant:gridSize:supportedFamilies:completionHandler:]";
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "%s: Returning DEMO widget defaults: %@", buf, 0x16u);
  }

  (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v12, 0);
LABEL_12:

}

void __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  ATXDefaultHomeScreenItemProducer *v20;
  void *v21;
  uint64_t v22;
  ATXDefaultHomeScreenItemProducer *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  ATXDefaultHomeScreenItemTilerWrapper *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD block[4];
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_cold_2();

    +[ATXWidgetDescriptorCache sharedInstance](ATXWidgetDescriptorCache, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v9, "fetchHomeScreenWidgetDescriptorMetadataWithError:", &v51);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v51;
    if (v11)
    {
      v12 = v11;
      __atxlog_handle_home_screen();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_cold_1();

      dispatch_get_global_queue(25, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_30;
      block[3] = &unk_1E4D58780;
      v15 = *(id *)(a1 + 32);
      v49 = v12;
      v50 = v15;
      v16 = v12;
      dispatch_async(v14, block);

      v17 = v50;
      goto LABEL_19;
    }
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [ATXDefaultHomeScreenItemProducer alloc];
    objc_msgSend(v9, "homeScreenDescriptors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
    v23 = -[ATXDefaultHomeScreenItemProducer initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:appLaunchCounts:](v20, "initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:appLaunchCounts:", v21, v10, MEMORY[0x1E0C9AA60], 1, v22, 0, v19);

    -[ATXDefaultHomeScreenItemProducer update](v23, "update");
    v24 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v24;
  }
  v25 = objc_alloc(MEMORY[0x1E0C99E60]);
  v26 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
  v27 = v26;
  if (v26)
    v28 = v26;
  else
    v28 = (id)objc_opt_new();
  v29 = v28;

  v9 = (void *)objc_msgSend(v25, "initWithArray:", v29);
  v44 = v7;
  if (objc_msgSend(v5, "shouldSuggestStackInGallery"))
  {
    objc_msgSend(v5, "stack");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(v5, "smallWidgets");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:](ATXDefaultHomeScreenItemManager, "_descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:", v31, *(_QWORD *)(a1 + 40), v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "mediumWidgets");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:](ATXDefaultHomeScreenItemManager, "_descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:", v32, *(_QWORD *)(a1 + 40), v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "largeWidgets");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:](ATXDefaultHomeScreenItemManager, "_descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:", v33, *(_QWORD *)(a1 + 40), v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "extraLargeWidgets");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:](ATXDefaultHomeScreenItemManager, "_descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:", v35, *(_QWORD *)(a1 + 40), v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)v30;
  v37 = -[ATXDefaultHomeScreenItemTilerWrapper initWithDefaultStack:defaultWidgetsSmall:defaultWidgetsMedium:defaultWidgetsLarge:defaultWidgetsExtraLarge:widgetFamilyMask:gridSize:]([ATXDefaultHomeScreenItemTilerWrapper alloc], "initWithDefaultStack:defaultWidgetsSmall:defaultWidgetsMedium:defaultWidgetsLarge:defaultWidgetsExtraLarge:widgetFamilyMask:gridSize:", v30, v16, v17, v34, v36, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  -[ATXDefaultHomeScreenItemTilerWrapper tiledHomeScreenItems](v37, "tiledHomeScreenItems");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[ATXDefaultHomeScreenItemManager fetchGalleryItemsForVariant:gridSize:supportedFamilies:completionHandler:]_block_invoke_2";
    v54 = 2112;
    v55 = v38;
    _os_log_impl(&dword_1A49EF000, v39, OS_LOG_TYPE_DEFAULT, "%s: Fetched add widget defaults: %@", buf, 0x16u);
  }

  dispatch_get_global_queue(25, 0);
  v40 = objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_37;
  v45[3] = &unk_1E4D58780;
  v41 = *(id *)(a1 + 32);
  v46 = v38;
  v47 = v41;
  v42 = v38;
  dispatch_async(v40, v45);

  v10 = v43;
  v7 = v44;
LABEL_19:

}

uint64_t __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSuggestedGalleryItemsOfGridSize:(unint64_t)a3 widgetFamilyMask:(unint64_t)a4 withCompletionHandler:(id)a5
{
  -[ATXDefaultHomeScreenItemManager fetchGalleryItemsForVariant:gridSize:supportedFamilies:completionHandler:](self, "fetchGalleryItemsForVariant:gridSize:supportedFamilies:completionHandler:", 0, a3, a4, a5);
}

- (void)fetchSmartStackOfVariant:(unint64_t)a3 completionHandler:(id)a4
{
  -[ATXDefaultHomeScreenItemManager _fetchSmartStackOfVariant:localObserver:completionHandler:](self, "_fetchSmartStackOfVariant:localObserver:completionHandler:", a3, 0, a4);
}

- (void)_fetchSmartStackOfVariant:(unint64_t)a3 localObserver:(int)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *internalQueue;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  _QWORD block[5];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  __atxlog_handle_home_screen();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[ATXDefaultHomeScreenItemManager _fetchSmartStackOfVariant:localObserver:completionHandler:]";
    v23 = 2048;
    v24 = a3;
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "%s: fetching smart stack of variant %lu", buf, 0x16u);
  }

  if (a4)
    notify_cancel(a4);
  if (a3 == 3)
  {
    internalQueue = self->_internalQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2;
    v16[3] = &unk_1E4D5AC68;
    v16[4] = self;
    v18 = 3;
    v17 = v8;
    dispatch_async(internalQueue, v16);
    v11 = v17;
  }
  else if (a3 == 2)
  {
    dispatch_get_global_queue(25, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke;
    block[3] = &unk_1E4D58780;
    block[4] = self;
    v20 = v8;
    dispatch_async(v10, block);

    v11 = v20;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_40;
    v13[3] = &unk_1E4D5C288;
    v15 = a3;
    v13[4] = self;
    v14 = v8;
    -[ATXDefaultHomeScreenItemManager _readHomeScreenUpdateFromFileWithCompletionHandler:](self, "_readHomeScreenUpdateFromFileWithCompletionHandler:", v13);
    v11 = v14;
  }

}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fetchWidgetDiscoverabilityStacks");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_generateOnboardingStacksForVariant:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "stack1");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "smallDefaultStack");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      objc_msgSend(v2, "stack2");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "smallDefaultStack");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v23 = "-[ATXDefaultHomeScreenItemManager _fetchSmartStackOfVariant:localObserver:completionHandler:]_block_invoke_2";
      v24 = 2048;
      v25 = v7;
      v26 = 2048;
      v27 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: generated ambient onboarding stacks, stack 1: %tu widgets, stack 2: %tu widgets", buf, 0x20u);

    }
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "stack1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stack2", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v13, 0);

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2_cold_1(v4, v14, v15, v16, v17, v18, v19, v20);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD handler[5];
  id v67;
  _BYTE *v68;
  uint64_t v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  _QWORD block[4];
  id v83;
  id v84;
  uint64_t v85;
  const __CFString *v86;
  uint64_t v87;
  const __CFString *v88;
  _BYTE buf[24];
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == 2)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LODWORD(v90) = 0;
      v8 = (const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.widgetOnboardingUpdate"), "UTF8String");
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      v11 = *(NSObject **)(v9 + 8);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2_50;
      handler[3] = &unk_1E4D5C260;
      v12 = (int *)(*(_QWORD *)&buf[8] + 24);
      handler[1] = 3221225472;
      v13 = *(_QWORD *)(a1 + 48);
      v68 = buf;
      v69 = v13;
      handler[4] = v9;
      v67 = v10;
      notify_register_dispatch(v8, v12, v11, handler);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      __atxlog_handle_home_screen();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_40_cold_4();

      dispatch_get_global_queue(25, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_52;
      v63[3] = &unk_1E4D58780;
      v65 = *(id *)(a1 + 40);
      v64 = v7;
      dispatch_async(v25, v63);

    }
  }
  else
  {
    v15 = (uint64_t *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 48);
    if (v14 == 1)
    {
      objc_msgSend(v5, "todayStack");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = v26 == 0;
      __atxlog_handle_home_screen();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v27)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_40_cold_3(v29, v50, v51, v52, v53, v54, v55, v56);

        v57 = (void *)MEMORY[0x1E0CB35C8];
        v85 = *MEMORY[0x1E0CB2938];
        v86 = CFSTR("Missing today stack");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "errorWithDomain:code:userInfo:", CFSTR("ATXDefaultWidgetManager"), 0, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_get_global_queue(25, 0);
        v60 = objc_claimAutoreleasedReturnValue();
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_48;
        v73[3] = &unk_1E4D58780;
        v61 = *(id *)(a1 + 40);
        v74 = v59;
        v75 = v61;
        v62 = v59;
        dispatch_async(v60, v73);

      }
      else
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v30 = *v15;
          objc_msgSend(v5, "todayStack");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "compactDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[ATXDefaultHomeScreenItemManager _fetchSmartStackOfVariant:localObserver:completionHandl"
                               "er:]_block_invoke_2";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2112;
          v90 = v32;
          _os_log_impl(&dword_1A49EF000, v29, OS_LOG_TYPE_DEFAULT, "%s: fetched smart stack of variant %lu: %@", buf, 0x20u);

        }
        dispatch_get_global_queue(25, 0);
        v33 = objc_claimAutoreleasedReturnValue();
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_45;
        v76[3] = &unk_1E4D58780;
        v78 = *(id *)(a1 + 40);
        v77 = v5;
        dispatch_async(v33, v76);

      }
    }
    else if (v14)
    {
      __atxlog_handle_home_screen();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_40_cold_1();

      dispatch_get_global_queue(25, 0);
      v35 = objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_49;
      v70[3] = &unk_1E4D58780;
      v36 = *(id *)(a1 + 40);
      v71 = 0;
      v72 = v36;
      dispatch_async(v35, v70);

    }
    else
    {
      objc_msgSend(v5, "stack");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v16 == 0;
      __atxlog_handle_home_screen();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_40_cold_2(v19, v37, v38, v39, v40, v41, v42, v43);

        v44 = (void *)MEMORY[0x1E0CB35C8];
        v87 = *MEMORY[0x1E0CB2938];
        v88 = CFSTR("Missing stack");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("ATXDefaultWidgetManager"), 0, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_get_global_queue(25, 0);
        v47 = objc_claimAutoreleasedReturnValue();
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_44;
        v79[3] = &unk_1E4D58780;
        v48 = *(id *)(a1 + 40);
        v80 = v46;
        v81 = v48;
        v49 = v46;
        dispatch_async(v47, v79);

      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *v15;
          objc_msgSend(v5, "stack");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "compactDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[ATXDefaultHomeScreenItemManager _fetchSmartStackOfVariant:localObserver:completionHandl"
                               "er:]_block_invoke";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2112;
          v90 = v22;
          _os_log_impl(&dword_1A49EF000, v19, OS_LOG_TYPE_DEFAULT, "%s: fetched smart stack of variant %lu: %@", buf, 0x20u);

        }
        dispatch_get_global_queue(25, 0);
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_41;
        block[3] = &unk_1E4D58780;
        v84 = *(id *)(a1 + 40);
        v83 = v5;
        dispatch_async(v23, block);

      }
    }
  }

}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_41(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "stack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v3, 0);

}

uint64_t __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_45(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "todayStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v3, 0);

}

uint64_t __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2_50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSmartStackOfVariant:localObserver:completionHandler:", *(_QWORD *)(a1 + 56), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 40));
}

uint64_t __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)fetchWidgetDiscoverabilityStacks
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isiPad") & 1) != 0)
  {
    -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:](self, "_generateOnboardingStacksForVariant:", 2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      -[NSObject stack1](v3, "stack1");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v5;
      -[NSObject stack2](v4, "stack2");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXDefaultHomeScreenItemManager _logFetchedOnboardingStack:](self, "_logFetchedOnboardingStack:", v7);

      -[NSObject stack1](v4, "stack1");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject stack2](v4, "stack2", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      __atxlog_handle_home_screen();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXDefaultHomeScreenItemManager fetchWidgetDiscoverabilityStacks].cold.1(v8, v11, v12, v13, v14, v15, v16, v17);
      v10 = 0;
    }

  }
  else
  {
    __atxlog_handle_home_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[ATXDefaultHomeScreenItemManager fetchWidgetDiscoverabilityStacks]";
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: returning nil for non-pad devices", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)_logFetchedOnboardingStack:(id)a3
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &__block_literal_global_54_0);
}

void __62__ATXDefaultHomeScreenItemManager__logFetchedOnboardingStack___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a3 + 1;
    objc_msgSend(v4, "compactDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "_fetchSmartStackOfVariant: fetched onboarding smart stack %lu: %@", (uint8_t *)&v8, 0x16u);

  }
}

- (id)_generateOnboardingStacksForVariant:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v26;
  ATXDefaultHomeScreenItemOnboardingStacksProducer *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  ATXDefaultHomeScreenItemProducer *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  ATXDefaultHomeScreenItemOnboardingStacks *v41;
  void *v42;
  void *v43;
  ATXDefaultHomeScreenItemOnboardingStacks *v44;
  NSObject *v45;
  os_signpost_id_t v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  ATXDefaultHomeScreenItemProducer *v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  unsigned int v61;
  void *v62;
  os_signpost_id_t spid;
  unint64_t v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  unint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D14510], "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
    v73 = 2050;
    v74 = a3;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s: %{public}lu", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 - 3 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0D14510], "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v72 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s: generating ambient onboarding stacks", buf, 0xCu);
    }

    if (!-[ATXDefaultHomeScreenItemManager _doesBiomeAppLaunchDataGoBackAtLeast20Days](self, "_doesBiomeAppLaunchDataGoBackAtLeast20Days"))
    {
      objc_msgSend(MEMORY[0x1E0D14510], "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v72 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
        _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "%s: device is day zero, returning nil", buf, 0xCu);
      }
      v15 = 0;
      goto LABEL_61;
    }
    +[ATXWidgetDescriptorCache sharedInstance](ATXWidgetDescriptorCache, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject homeScreenDescriptors](v9, "homeScreenDescriptors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_pas_filteredSetWithTest:", &__block_literal_global_57);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = 0;
    -[NSObject fetchHomeScreenWidgetDescriptorMetadataWithError:](v9, "fetchHomeScreenWidgetDescriptorMetadataWithError:", &v70);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v70;
    if (v13 || !objc_msgSend(v12, "count") || !objc_msgSend(v11, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D14510], "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:].cold.1();
      v15 = 0;
      goto LABEL_11;
    }
    v31 = [ATXDefaultHomeScreenItemProducer alloc];
    v32 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
    v14 = -[ATXDefaultHomeScreenItemProducer initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:adblDrainClassification:appLaunchCounts:](v31, "initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:adblDrainClassification:appLaunchCounts:", v11, v12, MEMORY[0x1E0C9AA60], 0, v32, 0, 1, v7);
    -[NSObject ambientOnboardingStacks](v14, "ambientOnboardingStacks");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stack1");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "smallDefaultStack");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35 > 3)
    {
      objc_msgSend(v66, "stack2");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "smallDefaultStack");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "count");

      if (v54 > 3)
      {
        v37 = v66;
        v15 = v66;
        goto LABEL_64;
      }
      objc_msgSend(MEMORY[0x1E0D14510], "log");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v66;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:].cold.3(v66, v36);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D14510], "log");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v66;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:].cold.2(v66, v36);
    }

    v15 = 0;
LABEL_64:

LABEL_11:
LABEL_61:

    goto LABEL_62;
  }
  if (a3 == 2)
  {
    +[ATXBatteryDrainBehavior sharedInstance](ATXBatteryDrainBehavior, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fetchADBLDrainClassification");

    v9 = objc_opt_new();
    v69 = 0;
    -[NSObject fetchOnboardingStackWidgetCacheWithError:](v9, "fetchOnboardingStackWidgetCacheWithError:", &v69);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v69;
    if (v19)
    {
      __atxlog_handle_home_screen();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:].cold.5();

    }
    if (v18)
    {
      __atxlog_handle_home_screen();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v72 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
        _os_log_impl(&dword_1A49EF000, v21, OS_LOG_TYPE_DEFAULT, "%s: fetching onboarding stacks with cached widget data", buf, 0xCu);
      }

      __atxlog_handle_home_screen();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_signpost_id_generate(v22);

      __atxlog_handle_home_screen();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A49EF000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "widgetDiscoverabilityUsingCachedData", " enableTelemetry=YES ", buf, 2u);
      }

      v26 = [ATXDefaultHomeScreenItemOnboardingStacksProducer alloc];
      v27 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:](v26, "initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:", v18, v17, objc_msgSend(MEMORY[0x1E0D81588], "isiPad"), 1, v7);
      -[ATXDefaultHomeScreenItemOnboardingStacksProducer onboardingStacks](v27, "onboardingStacks");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_home_screen();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A49EF000, v30, OS_SIGNPOST_INTERVAL_END, v23, "widgetDiscoverabilityUsingCachedData", (const char *)&unk_1A4B927EA, buf, 2u);
      }

      +[ATXDefaultHomeScreenItemManager _onboardingStacksByFilteringDescriptorsInOnboardingStacks:variant:](ATXDefaultHomeScreenItemManager, "_onboardingStacksByFilteringDescriptorsInOnboardingStacks:variant:", v28, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v67 = v19;
      v27 = (ATXDefaultHomeScreenItemOnboardingStacksProducer *)objc_opt_new();
      -[ATXDefaultHomeScreenItemOnboardingStacksProducer fetchOnboardingStackResultCache](v27, "fetchOnboardingStackResultCache");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_home_screen();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (v39)
        {
          *(_DWORD *)buf = 136315138;
          v72 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
          _os_log_impl(&dword_1A49EF000, v38, OS_LOG_TYPE_DEFAULT, "%s: using result cache", buf, 0xCu);
        }

        objc_msgSend(v28, "resultForClassification:", v17);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = [ATXDefaultHomeScreenItemOnboardingStacks alloc];
        objc_msgSend(v40, "stack1");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stack2");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[ATXDefaultHomeScreenItemOnboardingStacks initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:](v41, "initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:", v42, v43, MEMORY[0x1E0C9AA60]);

        +[ATXDefaultHomeScreenItemManager _onboardingStacksByFilteringDescriptorsInOnboardingStacks:variant:](ATXDefaultHomeScreenItemManager, "_onboardingStacksByFilteringDescriptorsInOnboardingStacks:variant:", v44, 0);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v39)
        {
          *(_DWORD *)buf = 136315138;
          v72 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
          _os_log_impl(&dword_1A49EF000, v38, OS_LOG_TYPE_DEFAULT, "%s: no cached widget data, fetching onboarding stacks with descriptors and reading through biome stream", buf, 0xCu);
        }

        __atxlog_handle_home_screen();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = os_signpost_id_generate(v45);

        __atxlog_handle_home_screen();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v47;
        v64 = v46 - 1;
        if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A49EF000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v46, "widgetDiscoverabilityWithoutCachedData", " enableTelemetry=YES ", buf, 2u);
        }
        spid = v46;

        +[ATXWidgetDescriptorCache sharedInstance](ATXWidgetDescriptorCache, "sharedInstance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0;
        objc_msgSend(v40, "fetchHomeScreenWidgetDescriptorMetadataWithError:", &v68);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (ATXDefaultHomeScreenItemOnboardingStacks *)v68;
        objc_msgSend(v40, "homeScreenDescriptors");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49;
        if (v44 || !objc_msgSend(v49, "count"))
        {
          __atxlog_handle_home_screen();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:].cold.1();
          v15 = 0;
        }
        else
        {
          v61 = !-[ATXDefaultHomeScreenItemManager _doesBiomeAppLaunchDataGoBackAtLeast20Days](self, "_doesBiomeAppLaunchDataGoBackAtLeast20Days");
          v55 = [ATXDefaultHomeScreenItemProducer alloc];
          v56 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
          v62 = v50;
          v51 = -[ATXDefaultHomeScreenItemProducer initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:adblDrainClassification:appLaunchCounts:](v55, "initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:adblDrainClassification:appLaunchCounts:", v50, v65, MEMORY[0x1E0C9AA60], v61, v56, 0, v17, v7);
          -[NSObject onboardingStacks](v51, "onboardingStacks");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          __atxlog_handle_home_screen();
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = v58;
          if (v64 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A49EF000, v59, OS_SIGNPOST_INTERVAL_END, spid, "widgetDiscoverabilityWithoutCachedData", (const char *)&unk_1A4B927EA, buf, 2u);
          }

          +[ATXDefaultHomeScreenItemManager _onboardingStacksByFilteringDescriptorsInOnboardingStacks:variant:](ATXDefaultHomeScreenItemManager, "_onboardingStacksByFilteringDescriptorsInOnboardingStacks:variant:", v57, 0);
          v15 = (id)objc_claimAutoreleasedReturnValue();

          v50 = v62;
        }

      }
      v19 = v67;
    }

    goto LABEL_61;
  }
  v15 = 0;
LABEL_62:

  return v15;
}

BOOL __71__ATXDefaultHomeScreenItemManager__generateOnboardingStacksForVariant___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ATXDefaultHomeScreenItemManager isCHSWidgetDescriptorAllowedForAmbientOnboardingStacks:](ATXDefaultHomeScreenItemManager, "isCHSWidgetDescriptorAllowedForAmbientOnboardingStacks:", a2);
}

- (BOOL)_doesBiomeAppLaunchDataGoBackAtLeast20Days
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__17;
  v21 = __Block_byref_object_dispose__17;
  v22 = 0;
  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "App");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "InFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "atx_publisherFromStartDate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__ATXDefaultHomeScreenItemManager__doesBiomeAppLaunchDataGoBackAtLeast20Days__block_invoke_2;
  v16[3] = &unk_1E4D5C310;
  v16[4] = &v17;
  v6 = (id)objc_msgSend(v5, "sinkWithCompletion:shouldContinue:", &__block_literal_global_64_0, v16);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -20, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)v18[5];
  if (v10 && objc_msgSend(v10, "compare:", v9) != 1)
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v18[5];
      *(_DWORD *)buf = 136315394;
      v24 = "-[ATXDefaultHomeScreenItemManager _doesBiomeAppLaunchDataGoBackAtLeast20Days]";
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "%s: biome app launch data goes back at least 20 days. Date of first event: %@", buf, 0x16u);
    }
    v13 = 1;
  }
  else
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v18[5];
      *(_DWORD *)buf = 136315394;
      v24 = "-[ATXDefaultHomeScreenItemManager _doesBiomeAppLaunchDataGoBackAtLeast20Days]";
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "%s: biome app launch data does NOT go back at least 20 days. Date of first event: %@", buf, 0x16u);
    }
    v13 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v13;
}

uint64_t __77__ATXDefaultHomeScreenItemManager__doesBiomeAppLaunchDataGoBackAtLeast20Days__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 0;
}

- (id)_JSONCompatible:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)fetchDefaultStacksJSONWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__ATXDefaultHomeScreenItemManager_fetchDefaultStacksJSONWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E4D5C338;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ATXDefaultHomeScreenItemManager _readHomeScreenUpdateFromFileWithCompletionHandler:](self, "_readHomeScreenUpdateFromFileWithCompletionHandler:", v6);

}

void __79__ATXDefaultHomeScreenItemManager_fetchDefaultStacksJSONWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  ATXDefaultHomeScreenItemTilerWrapper *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  ATXDefaultHomeScreenItemTilerWrapper *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  id v30;

  v30 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v30, "stack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("smartStack"));

    objc_msgSend(v30, "todayStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("todayPageSmartStack"));

    if (objc_msgSend(v30, "shouldSuggestStackInGallery"))
    {
      objc_msgSend(v30, "stack");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    v11 = 0;
    v12 = 0x1E0CB3000uLL;
    do
    {
      v13 = (void *)MEMORY[0x1A85A4F90]();
      v14 = [ATXDefaultHomeScreenItemTilerWrapper alloc];
      objc_msgSend(v30, "smallWidgets");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "mediumWidgets");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "largeWidgets");
      v17 = a1;
      v18 = v6;
      v19 = v12;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "extraLargeWidgets");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[ATXDefaultHomeScreenItemTilerWrapper initWithDefaultStack:defaultWidgetsSmall:defaultWidgetsMedium:defaultWidgetsLarge:defaultWidgetsExtraLarge:widgetFamilyMask:gridSize:](v14, "initWithDefaultStack:defaultWidgetsSmall:defaultWidgetsMedium:defaultWidgetsLarge:defaultWidgetsExtraLarge:widgetFamilyMask:gridSize:", v29, v15, v16, v20, v21, 7294, v11);

      v12 = v19;
      v6 = v18;
      a1 = v17;

      v23 = *(void **)(v17 + 32);
      -[ATXDefaultHomeScreenItemTilerWrapper tiledHomeScreenItems](v22, "tiledHomeScreenItems");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_JSONCompatible:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(objc_alloc(*(Class *)(v12 + 2368)), "initWithFormat:", CFSTR("AddSheetGridSizeEnum_%lu"), v11);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, v26);

      objc_autoreleasePoolPop(v13);
      ++v11;
    }
    while (v11 != 4);
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      v28 = (__CFString *)objc_msgSend(objc_alloc(*(Class *)(v12 + 2368)), "initWithData:encoding:", v27, 4);
    else
      v28 = CFSTR("{ \"error\": \"Error formatting json\" }");
    v5 = 0;
    (*(void (**)(void))(*(_QWORD *)(v17 + 40) + 16))();

  }
}

- (void)_readHomeScreenUpdateFromFileWithCompletionHandler:(id)a3
{
  -[ATXDefaultHomeScreenItemManager _readUpdateFromFileAtPath:completionHandler:](self, "_readUpdateFromFileAtPath:completionHandler:", self->_homeScreenPath, a3);
}

- (void)_readAmbientUpdateFromFileWithCompletionHandler:(id)a3
{
  -[ATXDefaultHomeScreenItemManager _readUpdateFromFileAtPath:completionHandler:](self, "_readUpdateFromFileAtPath:completionHandler:", self->_ambientPath, a3);
}

- (void)_readUpdateFromFileAtPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke;
  v11[3] = &unk_1E4D57678;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, v11);

}

void __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  id buf[2];
  uint64_t v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = open((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"), 0);
  if (v2 == -1)
  {
    v4 = *__error();
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 == 2)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 136315138;
        *(id *)((char *)buf + 4) = "-[ATXDefaultHomeScreenItemManager _readUpdateFromFileAtPath:completionHandler:]_block_invoke";
        _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "%s: No suggestions file found.", (uint8_t *)buf, 0xCu);
      }

      v7 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2938];
      v27 = CFSTR("No suggestions file found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = 2;
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke_cold_1();

      v22 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2938];
      v30[0] = CFSTR("Unable to open file");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v22;
      v10 = 0;
    }
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("ATXDefaultWidgetManager"), v10, v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = v2;
    buf[0] = 0;
    ATXCacheFileRead();
    if ((v3 & 0x80000000) == 0)
      close(v3);
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2938];
    v25 = CFSTR("No data in file");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("ATXDefaultWidgetManager"), 1, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

+ (id)_onboardingStacksByFilteringDescriptorsInOnboardingStacks:(id)a3 variant:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ATXDefaultHomeScreenItemOnboardingStacks *v20;

  v6 = (objc_class *)MEMORY[0x1E0C99E60];
  v7 = a3;
  v8 = [v6 alloc];
  v9 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  v13 = (void *)objc_msgSend(v8, "initWithArray:", v12);
  objc_msgSend(v7, "stack1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_widgetStackByFilteringDescriptorsInWidgetStack:variant:", v14, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stack2");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_widgetStackByFilteringDescriptorsInWidgetStack:variant:", v16, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sortedThirdPartyWidgets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:", v18, a4, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[ATXDefaultHomeScreenItemOnboardingStacks initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:]([ATXDefaultHomeScreenItemOnboardingStacks alloc], "initWithOnboardingStack1:stack2:sortedThirdPartyWidgets:", v15, v17, v19);
  return v20;
}

+ (id)_widgetStackByFilteringDescriptorsInWidgetStack:(id)a3 variant:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  v12 = (void *)objc_msgSend(v7, "initWithArray:", v11);
  objc_msgSend(v5, "smallDefaultStack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:](ATXDefaultHomeScreenItemManager, "_descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:", v13, a4, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSmallDefaultStack:", v14);

  objc_msgSend(v5, "mediumDefaultStack");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:](ATXDefaultHomeScreenItemManager, "_descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:", v15, a4, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediumDefaultStack:", v16);

  objc_msgSend(v5, "largeDefaultStack");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:](ATXDefaultHomeScreenItemManager, "_descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:", v17, a4, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLargeDefaultStack:", v18);

  objc_msgSend(v5, "extraLargeDefaultStack");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:](ATXDefaultHomeScreenItemManager, "_descriptorsByFilteringDescriptors:variant:fromAppsDisabledOnHomeScreen:", v19, a4, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExtraLargeDefaultStack:", v20);

  v21 = objc_msgSend(v5, "suggestedSize");
  objc_msgSend(v6, "setSuggestedSize:", v21);

  return v6;
}

+ (id)_descriptorsByFilteringDescriptors:(id)a3 variant:(unint64_t)a4 fromAppsDisabledOnHomeScreen:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  unint64_t v14;
  id v15;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__ATXDefaultHomeScreenItemManager__descriptorsByFilteringDescriptors_variant_fromAppsDisabledOnHomeScreen___block_invoke;
  v12[3] = &unk_1E4D5C360;
  v14 = a4;
  v15 = a1;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __107__ATXDefaultHomeScreenItemManager__descriptorsByFilteringDescriptors_variant_fromAppsDisabledOnHomeScreen___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v11;

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 == 1)
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "shouldFilterOutWidgetDescriptorDueToAppProtection:fromDisabledApps:", v4, *(_QWORD *)(a1 + 32)) & 1) == 0&& (objc_msgSend(*(id *)(a1 + 48), "isDescriptorSpecial:", v4) & 1) == 0)
    {
      objc_msgSend(v4, "avocadoDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "disfavoredFamiliesForLocation:", 2);
      CHSWidgetFamilyFromATXStackLayoutSize(objc_msgSend(v4, "suggestedSize"));
      v9 = CHSWidgetFamilyMaskContainsFamily();

      if ((v9 & 1) == 0)
      {
        objc_msgSend(v4, "avocadoDescriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = objc_msgSend(v11, "isLinkedOnOrAfter:", 0);

        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  if (!v5)
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "shouldFilterOutWidgetDescriptorDueToAppProtection:fromDisabledApps:", v4, *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      objc_msgSend(v4, "avocadoDescriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "disfavoredFamiliesForLocation:", 0);
      CHSWidgetFamilyFromATXStackLayoutSize(objc_msgSend(v4, "suggestedSize"));
      v7 = CHSWidgetFamilyMaskContainsFamily();

      v2 = v7 ^ 1;
      goto LABEL_9;
    }
LABEL_8:
    v2 = 0;
  }
LABEL_9:

  return v2 & 1;
}

+ (BOOL)isCHSWidgetDescriptorAllowedForAmbientOnboardingStacks:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_msgSend(v3, "disfavoredFamiliesForLocation:", 2);
  if ((CHSWidgetFamilyMaskContainsFamily() & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isLinkedOnOrAfter:", 0);

  return v4;
}

+ (BOOL)isDescriptorSpecial:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "widgetKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ATXSpecialWidgetKindFiles();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v3, "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ATXSpecialWidgetKindShortcutsSingle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v3, "widgetKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ATXSpecialWidgetKindShortcutsFolder();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) != 0
    || (objc_msgSend(v3, "widgetKind"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        ATXSpecialWidgetKindAppPredictions(),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "isEqualToString:", v14),
        v14,
        v13,
        (v15 & 1) != 0))
  {
LABEL_5:
    v16 = 1;
  }
  else
  {
    objc_msgSend(v3, "widgetKind");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ATXSpecialWidgetKindSiriSuggestions();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v18, "isEqualToString:", v19);

  }
  return v16;
}

+ (BOOL)shouldFilterOutWidgetDescriptorDueToAppProtection:(id)a3 fromDisabledApps:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  _BOOL4 v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "appBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  if (!v7)
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "+[ATXDefaultHomeScreenItemManager shouldFilterOutWidgetDescriptorDueToAppProtection:fromDisabledApps:]";
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "%s: No parent bundleId for Widget descriptor: %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_11;
  }
  objc_msgSend(v5, "appBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "containsObject:", v9);

  if (v10)
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "appBundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315650;
      v18 = "+[ATXDefaultHomeScreenItemManager shouldFilterOutWidgetDescriptorDueToAppProtection:fromDisabledApps:]";
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v12;
      v13 = "%s: filtering out widget descriptor: %@. Reason: Show on Homescreen is disabled for parent bundleId %@";
LABEL_10:
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v5, "appBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[ATXAppProtectionInfo bundleIdIsLockedOrHiddenByUserPreference:](ATXAppProtectionInfo, "bundleIdIsLockedOrHiddenByUserPreference:", v14);

    if (!v15)
    {
      v8 = 0;
      goto LABEL_12;
    }
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "appBundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315650;
      v18 = "+[ATXDefaultHomeScreenItemManager shouldFilterOutWidgetDescriptorDueToAppProtection:fromDisabledApps:]";
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v12;
      v13 = "%s: filtering out widget descriptor: %@. Reason: the parent bundleId %@ is locked or hidden by user preference";
      goto LABEL_10;
    }
  }
LABEL_11:

LABEL_12:
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientPath, 0);
  objc_storeStrong((id *)&self->_homeScreenPath, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: Error archiving default widget stacks: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_36(&dword_1A49EF000, v1, v2, "%s: Couldn't create file: [%i] %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_9_5();
}

void __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: Error reading from cache: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: Error when attempting to fetch widget descriptors with additional data - %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: Error fetching add widget defaults: %@, fetching results on the fly", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: generated ambient onboarding stacks were nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_40_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: Error fetching smart stack due to unknown variant: %lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_40_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, a1, a3, "Nullability violation: handled the variant ATXSmartStackVariantAppList but there was no stack", a5, a6, a7, a8, 0);
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_40_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, a1, a3, "Nullability violation: handled the variant ATXSmartStackVariantTodayPage but there was no today stack", a5, a6, a7, a8, 0);
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_40_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_11_1();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1A49EF000, v1, OS_LOG_TYPE_ERROR, "%s: Error fetching smart stack of variant %lu: %@", (uint8_t *)v2, 0x20u);
  OUTLINED_FUNCTION_5_2();
}

- (void)fetchWidgetDiscoverabilityStacks
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: _generateOnboardingStacks returned nil onboarding stacks", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_generateOnboardingStacksForVariant:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: Error when attempting to fetch widget descriptors with additional data, or list of descriptors were empty - %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_generateOnboardingStacksForVariant:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "stack1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a2, v4, "%s: stack 1 contains less than 4 widgets, returning nil. stack 1: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_5_2();
}

- (void)_generateOnboardingStacksForVariant:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "stack2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a2, v4, "%s: stack 2 contains less than 4 widgets, returning nil. stack 2: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_5_2();
}

- (void)_generateOnboardingStacksForVariant:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: Error when attempting to fetch onboarding stack cached data - %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_36(&dword_1A49EF000, v1, v2, "%s: Couldn't open file: [%i] %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_9_5();
}

void __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: No data in file", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: Error unarchiving object: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
