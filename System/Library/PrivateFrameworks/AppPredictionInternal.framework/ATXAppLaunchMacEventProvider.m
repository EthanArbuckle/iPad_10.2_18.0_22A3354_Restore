@implementation ATXAppLaunchMacEventProvider

- (ATXAppLaunchMacEventProvider)init
{
  ATXAppLaunchMacEventProvider *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSSet *iOSInstalledApps;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXAppLaunchMacEventProvider;
  v2 = -[ATXAppLaunchMacEventProvider init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E20]);
    +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allInstalledAppsKnownToSpringBoard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithArray:", v5);
    iOSInstalledApps = v2->_iOSInstalledApps;
    v2->_iOSInstalledApps = (NSSet *)v6;

  }
  return v2;
}

- (id)biomePublisherWithBookmark:(id)a3 devicePlatform:(int64_t)a4 startTime:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  BOOL v17;
  BOOL v18;

  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "App");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "InFocus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAppLaunchMacEventProvider remoteDevicesForDevicePlatform:](self, "remoteDevicesForDevicePlatform:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "publishersForDevices:withUseCase:startTime:includeLocal:pipeline:", v11, *MEMORY[0x1E0CF9398], 0, &__block_literal_global_213, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "merge");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __84__ATXAppLaunchMacEventProvider_biomePublisherWithBookmark_devicePlatform_startTime___block_invoke_2;
    v16[3] = &__block_descriptor_34_e48___ATXBiomeAppLaunchWrapper_16__0__BMStoreEvent_8l;
    v17 = a4 == 4;
    v18 = a4 == 3;
    objc_msgSend(v13, "mapWithTransform:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "bpsPublisher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

id __84__ATXAppLaunchMacEventProvider_biomePublisherWithBookmark_devicePlatform_startTime___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

ATXBiomeAppLaunchWrapper *__84__ATXAppLaunchMacEventProvider_biomePublisherWithBookmark_devicePlatform_startTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  ATXBiomeAppLaunchWrapper *v4;
  void *v5;
  ATXBiomeAppLaunchWrapper *v6;

  v3 = a2;
  v4 = [ATXBiomeAppLaunchWrapper alloc];
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXBiomeAppLaunchWrapper initWithAppLaunch:isLocal:isMacPortable:isMacDesktop:](v4, "initWithAppLaunch:isLocal:isMacPortable:isMacDesktop:", v5, 0, *(unsigned __int8 *)(a1 + 32), *(unsigned __int8 *)(a1 + 33));
  return v6;
}

- (id)remoteDevicesForDevicePlatform:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v14 = 0;
  objc_msgSend(v4, "remoteDevicesWithError:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__ATXAppLaunchMacEventProvider_remoteDevicesForDevicePlatform___block_invoke;
  v13[3] = &__block_descriptor_40_e18_B16__0__BMDevice_8l;
  v13[4] = a3;
  objc_msgSend(v5, "_pas_filteredArrayWithTest:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_modes();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXAppLaunchMacEventProvider remoteDevicesForDevicePlatform:].cold.1((uint64_t)v6, v9);

    v10 = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134218240;
      v16 = v11;
      v17 = 2048;
      v18 = a3;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "ATXAppLaunchMacEventProvider: Got %lu remote devices for BMDevicePlatform: %ld", buf, 0x16u);
    }

    v10 = v7;
  }

  return v10;
}

BOOL __63__ATXAppLaunchMacEventProvider_remoteDevicesForDevicePlatform___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "platform") == *(_QWORD *)(a1 + 32);
}

- (id)biomePublisherWithBookmark:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Subclass must implement biomePublisherWithBookmark:"));
  return 0;
}

- (id)eventsFromPublisher
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v3 = (void *)objc_opt_new();
  -[ATXAppLaunchMacEventProvider biomePublisherWithBookmark:](self, "biomePublisherWithBookmark:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__ATXAppLaunchMacEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E82DCD98;
  v10[4] = self;
  v5 = v3;
  v11 = v5;
  v6 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_20_3, v10);

  v7 = v11;
  v8 = v5;

  return v8;
}

void __51__ATXAppLaunchMacEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "aggregationEventsFromEvent:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6);

    v5 = v7;
  }

}

- (id)aggregationEventsFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  ATXModeEvent *v15;
  void *v16;
  void *v17;
  ATXModeEvent *v18;
  id v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ATXAppLaunchMacEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "appLaunchEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "starting"))
    {
      objc_msgSend(v5, "bundleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAppLaunchMacEventProvider iOSBundleIDForMacOSBundleID:](self, "iOSBundleIDForMacOSBundleID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && -[NSSet containsObject:](self->_iOSInstalledApps, "containsObject:", v7))
      {
        +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = &unk_1E83CDE40;
        if (v8)
          v10 = (void *)v8;
        v11 = v10;

        v12 = objc_alloc(MEMORY[0x1E0CF8CC0]);
        v22[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithBundleId:itunesGenreIds:", v7, v13);

        v15 = [ATXModeEvent alloc];
        objc_msgSend(v5, "absoluteTimestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "absoluteTimestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[ATXModeEvent initWithStartDate:endDate:entity:](v15, "initWithStartDate:endDate:entity:", v16, v17, v14);

        v19 = objc_alloc(MEMORY[0x1E0C99D20]);
        v20 = (void *)objc_msgSend(v19, "initWithObjects:", v18, 0);

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)publisherIsCoreDuetWrapper
{
  return 0;
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v3, "isLocal");

  return v4;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[ATXAppLaunchMacEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    v5 = (objc_class *)MEMORY[0x1E0CB3588];
    v6 = v4;
    v7 = [v5 alloc];
    objc_msgSend(v6, "launchTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "launchTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(v7, "initWithStartDate:endDate:", v8, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)iOSBundleIDForMacOSBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0D0D510], "sharedCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIDForPlatform:fromBundleID:platform:", *MEMORY[0x1E0D0D4F8], v3, *MEMORY[0x1E0D0D500]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iOSInstalledApps, 0);
}

- (void)remoteDevicesForDevicePlatform:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXAppLaunchMacEventProvider: Biome couldn't fetch remote devices with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
