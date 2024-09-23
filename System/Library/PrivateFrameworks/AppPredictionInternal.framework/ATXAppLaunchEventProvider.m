@implementation ATXAppLaunchEventProvider

- (id)biomePublisherWithBookmark:(id)a3
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v5 + -2419200.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "App");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "InFocus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v6, 0, 0, 0, 0);
  objc_msgSend(v9, "publisherWithUseCase:options:", *MEMORY[0x1E0CF9398], v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapWithTransform:", &__block_literal_global_160);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAppLaunchEventProvider.m"), 34, CFSTR("Publisher for app launches was nil."));

  }
  return v12;
}

ATXBiomeAppLaunchWrapper *__56__ATXAppLaunchEventProvider_biomePublisherWithBookmark___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXBiomeAppLaunchWrapper *v3;
  void *v4;
  ATXBiomeAppLaunchWrapper *v5;

  v2 = a2;
  v3 = [ATXBiomeAppLaunchWrapper alloc];
  objc_msgSend(v2, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ATXBiomeAppLaunchWrapper initWithAppLaunch:isLocal:isMacPortable:isMacDesktop:](v3, "initWithAppLaunch:isLocal:isMacPortable:isMacDesktop:", v4, 1, 0, 0);
  return v5;
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
  -[ATXAppLaunchEventProvider biomePublisherWithBookmark:](self, "biomePublisherWithBookmark:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__ATXAppLaunchEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E82DCD98;
  v10[4] = self;
  v5 = v3;
  v11 = v5;
  v6 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_17_1, v10);

  v7 = v11;
  v8 = v5;

  return v8;
}

void __48__ATXAppLaunchEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, void *a2)
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
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "isLocal") & 1) != 0;

  return v4;
}

- (id)aggregationEventsFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
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
  if (-[ATXAppLaunchEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "appLaunchEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "starting"))
    {
      objc_msgSend(v5, "bundleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = &unk_1E83CD6D8;
      if (v7)
        v9 = (void *)v7;
      v10 = v9;

      v11 = objc_alloc(MEMORY[0x1E0CF8CC0]);
      objc_msgSend(v5, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithBundleId:itunesGenreIds:", v12, v13);

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

  return v20;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[ATXAppLaunchEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    v5 = v4;
    objc_msgSend(v5, "launchTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v5, "launchTimestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "launchTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "initWithStartDate:endDate:", v8, v9);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)CFSTR("AppLaunches");
}

@end
