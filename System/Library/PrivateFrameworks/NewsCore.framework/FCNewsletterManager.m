@implementation FCNewsletterManager

- (BOOL)isOptedIntoIssues
{
  return ((unint64_t)-[FCNewsletterManager includeOptions](self, "includeOptions") >> 1) & 1;
}

- (int64_t)includeOptions
{
  return self->_includeOptions;
}

- (BOOL)isSubscribed
{
  return (self->_subscription & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCNewsletterManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)activityObservingApplicationDidBecomeActive
{
  id v2;

  v2 = -[FCNewsletterManager updateSubscription](self, "updateSubscription");
}

- (id)updateSubscription
{
  NSDate *v3;
  double v4;
  void *v5;
  NSDate *v6;
  NSDate *cacheExpiration;
  NFPromise *v8;
  NFPromise *v9;

  if (-[FCNewsletterManager enabled](self, "enabled"))
  {
    v3 = self->_cacheExpiration;
    objc_sync_enter(v3);
    -[NSDate timeIntervalSinceNow](self->_cacheExpiration, "timeIntervalSinceNow");
    if (v4 >= 0.0)
    {
      v9 = self->_updateSubscriptionPromise;
      objc_sync_exit(v3);

      return v9;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingTimeInterval:", 60.0);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    cacheExpiration = self->_cacheExpiration;
    self->_cacheExpiration = v6;

    objc_sync_exit(v3);
    -[FCNewsletterManager forceUpdateSubscription](self, "forceUpdateSubscription");
    v8 = (NFPromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = self->_updateSubscriptionPromise;
  }
  v9 = v8;
  return v9;
}

- (void)appleAccountChanged
{
  NSString *v3;
  NSString *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];

  -[FCAppleAccount iTunesAccountName](self->_appleAccount, "iTunesAccountName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 != self->_activeiTunesAccountName && !-[NSString isEqualToString:](v3, "isEqualToString:"))
  {
    v5 = FCNewsletterLog;
    if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Newsletter Manager: account changed, resetting caches", v7, 2u);
    }
    -[FCNewsletterManager resetCaches](self, "resetCaches");
  }
  v6 = -[FCNewsletterManager forceUpdateSubscription](self, "forceUpdateSubscription");

}

- (id)forceUpdateSubscription
{
  NSDate *v3;
  id v4;
  NFPromise *v5;
  NFPromise *updateSubscriptionPromise;
  NFPromise *v7;
  _QWORD v9[5];

  if (!-[FCNewsletterManager enabled](self, "enabled"))
    return self->_updateSubscriptionPromise;
  v3 = self->_cacheExpiration;
  objc_sync_enter(v3);
  v4 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_2;
  v9[3] = &unk_1E463DAD0;
  v9[4] = self;
  v5 = (NFPromise *)objc_msgSend(v4, "initWithResolver:", v9);
  updateSubscriptionPromise = self->_updateSubscriptionPromise;
  self->_updateSubscriptionPromise = v5;

  v7 = self->_updateSubscriptionPromise;
  objc_sync_exit(v3);

  return v7;
}

- (BOOL)enabled
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  -[FCNewsAppConfigurationManager possiblyUnfetchedAppConfiguration](self->_appConfig, "possiblyUnfetchedAppConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("news.onboarding.version.latest_completed"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerForKey:", CFSTR("news.onboarding.version.debug_latest_completed"));

  v7 = v6 >= 0 ? v6 : v4;
  if (v7 >= 1)
    v8 = objc_msgSend(v2, "newsletterSubscriptionType") != 0;
  else
LABEL_7:
    v8 = 0;

  return v8;
}

- (FCNewsletterManager)initWithEndpointConnection:(id)a3 endpointCommandQueue:(id)a4 appleAccount:(id)a5 appConfig:(id)a6 userInfo:(id)a7 bundleSubscriptionManager:(id)a8 privateDataContext:(id)a9
{
  id v16;
  id v17;
  FCNewsletterManager *v18;
  FCNewsletterManager *v19;
  void *v20;
  uint64_t v21;
  FCCKPrivateDatabase *database;
  uint64_t v23;
  NSHashTable *observers;
  uint64_t v25;
  NFPromise *updateSubscriptionPromise;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSString *cachedWebToken;
  uint64_t v36;
  NSDate *webTokenExpiration;
  id v38;
  uint64_t v39;
  uint64_t v40;
  NSDate *cacheExpiration;
  void *v42;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v48 = a3;
  v47 = a4;
  v16 = a5;
  v46 = a6;
  v45 = a7;
  v44 = a8;
  v17 = a9;
  v49.receiver = self;
  v49.super_class = (Class)FCNewsletterManager;
  v18 = -[FCNewsletterManager init](&v49, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_endpointConnection, a3);
    objc_storeStrong((id *)&v19->_endpointCommandQueue, a4);
    objc_storeStrong((id *)&v19->_appleAccount, a5);
    objc_storeStrong((id *)&v19->_appConfig, a6);
    objc_storeStrong((id *)&v19->_userInfo, a7);
    objc_storeStrong((id *)&v19->_bundleSubscriptionManager, a8);
    objc_msgSend(v17, "internalPrivateDataContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "privateDatabase");
    v21 = objc_claimAutoreleasedReturnValue();
    database = v19->_database;
    v19->_database = (FCCKPrivateDatabase *)v21;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v23 = objc_claimAutoreleasedReturnValue();
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithValue:", v19);
    updateSubscriptionPromise = v19->_updateSubscriptionPromise;
    v19->_updateSubscriptionPromise = (NFPromise *)v25;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", FCNewsletterManagerSubscriptionKey);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "integerForKey:", FCNewsletterManagerIncludeKey);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKey:", FCNewsletterManagerCacheAgeKey);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKey:", FCNewsletterManagerCachedVectorKey);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    cachedWebToken = v19->_cachedWebToken;
    v19->_cachedWebToken = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v36 = objc_claimAutoreleasedReturnValue();
    webTokenExpiration = v19->_webTokenExpiration;
    v19->_webTokenExpiration = (NSDate *)v36;

    if (v28)
    {
      v38 = v28;
      if ((objc_msgSend(v38, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
      {
        v39 = 1;
      }
      else if ((objc_msgSend(v38, "isEqualToString:", CFSTR("NEWSLETTER")) & 1) != 0)
      {
        v39 = 2;
      }
      else if (objc_msgSend(v38, "isEqualToString:", CFSTR("PERSONALIZED_NEWSLETTER")))
      {
        v39 = 3;
      }
      else
      {
        v39 = 0;
      }

    }
    else
    {
      v39 = 0;
    }
    v19->_subscription = v39;
    v19->_includeOptions = v30;
    if (v32)
    {
      -[FCNewsletterManager cacheTimeout](v19, "cacheTimeout");
      objc_msgSend(v32, "dateByAddingTimeInterval:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    }
    v40 = objc_claimAutoreleasedReturnValue();
    cacheExpiration = v19->_cacheExpiration;
    v19->_cacheExpiration = (NSDate *)v40;

    if (v34)
      objc_storeStrong((id *)&v19->_cachedVector, v34);
    -[FCAppleAccount iTunesAccountName](v19->_appleAccount, "iTunesAccountName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCNewsletterManager setActiveiTunesAccountName:](v19, "setActiveiTunesAccountName:", v42);

    objc_msgSend(v16, "addObserver:", v19);
  }

  return v19;
}

- (void)setActiveiTunesAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)activeNewsletter
{
  void *v3;
  int64_t v4;

  if (!-[FCNewsletterManager enabled](self, "enabled"))
    return 0;
  -[FCNewsAppConfigurationManager appConfiguration](self->_appConfig, "appConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "newsletterSubscriptionType");

  return v4;
}

- (BOOL)canSubscribe
{
  int64_t v3;

  v3 = -[FCNewsletterManager activeNewsletter](self, "activeNewsletter");
  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2
      && -[FCNewsletterManager canSubscribeToNewsletter:](self, "canSubscribeToNewsletter:", v3);
}

- (BOOL)canUnsubscribe
{
  return -[FCNewsletterManager canSubscribeToNewsletter:](self, "canSubscribeToNewsletter:", 1);
}

- (BOOL)includeUserVector
{
  return -[FCNewsletterManager includeOptions](self, "includeOptions") & 1;
}

- (BOOL)includeBundleSubscribedVector
{
  return ((unint64_t)-[FCNewsletterManager includeOptions](self, "includeOptions") >> 1) & 1;
}

- (BOOL)includeSportsVector
{
  return ((unint64_t)-[FCNewsletterManager includeOptions](self, "includeOptions") >> 2) & 1;
}

- (int64_t)subscriptionStatusForNewsletter:(int64_t)a3
{
  int64_t result;
  int64_t v6;
  int64_t v7;

  if (!a3)
    return 0;
  result = -[FCNewsletterManager activeNewsletter](self, "activeNewsletter");
  if (!result)
    return result;
  if (-[FCAppleAccount isUserSignedInToiCloud](self->_appleAccount, "isUserSignedInToiCloud")
    && -[FCAppleAccount isPrimaryAccountEmailAddress](self->_appleAccount, "isPrimaryAccountEmailAddress"))
  {
    if (!self->_subscription)
      return 6;
    v6 = 1;
  }
  else
  {
    v6 = 4;
  }
  if (a3 == 2 && self->_subscription == 3)
    return 5;
  v7 = -[FCNewsletterManager activeNewsletter](self, "activeNewsletter");
  if (a3 != 1 && v7 != a3)
    return 3;
  if (self->_subscription == a3)
    return 2;
  return v6;
}

- (BOOL)canSubscribeToNewsletter:(int64_t)a3
{
  return (unint64_t)(-[FCNewsletterManager subscriptionStatusForNewsletter:](self, "subscriptionStatusForNewsletter:", a3)- 1) < 2;
}

- (BOOL)isEligibleForIssues
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  BOOL v10;

  -[FCNewsAppConfigurationManager appConfiguration](self->_appConfig, "appConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "issuesNewsletterOptinEnabled");

  if (!v4
    || !-[FCAppleAccount isUserSignedInToiCloud](self->_appleAccount, "isUserSignedInToiCloud")
    || !-[FCAppleAccount isPrimaryAccountEmailAddress](self->_appleAccount, "isPrimaryAccountEmailAddress"))
  {
    return 0;
  }
  -[FCBundleSubscriptionManagerType cachedSubscription](self->_bundleSubscriptionManager, "cachedSubscription");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject((id)v5, (const void *)(v5 + 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = v7;
  objc_getAssociatedObject((id)v5, (const void *)~v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_msgSend(v9, "unsignedIntegerValue") ^ v8) & 1;

  return v10;
}

- (BOOL)isSignedIntoEmailAccount
{
  _BOOL4 v3;

  v3 = -[FCAppleAccount isUserSignedInToiCloud](self->_appleAccount, "isUserSignedInToiCloud");
  if (v3)
    LOBYTE(v3) = -[FCAppleAccount isPrimaryAccountEmailAddress](self->_appleAccount, "isPrimaryAccountEmailAddress");
  return v3;
}

- (int64_t)issueOptinStatus
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  char v10;

  -[FCNewsAppConfigurationManager appConfiguration](self->_appConfig, "appConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "issuesNewsletterOptinEnabled");

  if (!v4)
    return 3;
  if (!-[FCNewsletterManager isSignedIntoEmailAccount](self, "isSignedIntoEmailAccount"))
    return 4;
  -[FCBundleSubscriptionManagerType cachedSubscription](self->_bundleSubscriptionManager, "cachedSubscription");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject((id)v5, (const void *)(v5 + 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = v7;
  objc_getAssociatedObject((id)v5, (const void *)~v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue") ^ v8;

  if ((v10 & 1) == 0)
    return 6;
  if (!self->_subscription)
    return 0;
  if ((-[FCNewsletterManager includeOptions](self, "includeOptions") & 2) != 0)
    return 2;
  return 1;
}

- (BOOL)canOptIntoIssues
{
  return -[FCNewsletterManager issueOptinStatus](self, "issueOptinStatus") == 1;
}

- (int64_t)updatedIncludeOptionsWithNewsletter:(int64_t)a3 includeOptions:(int64_t)a4
{
  int64_t v4;
  int64_t v5;

  v4 = a4 & 4;
  v5 = a4 | 1;
  if (a3 != 3)
    v5 = a4;
  if (a3 != 2)
    v4 = v5;
  if ((unint64_t)a3 >= 2)
    return v4;
  else
    return 0;
}

- (void)subscribeTo:(int64_t)a3 includeOptions:(int64_t)a4
{
  _BOOL4 v7;
  int64_t v8;
  void *v9;
  const __CFString *v10;
  objc_class *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSDate *v17;
  int64_t subscription;
  int64_t includeOptions;
  FCNewsletterSubscribeCommand *v20;
  const __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  FCNewsletterSubscribeCommand *v25;
  int v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v7 = -[FCNewsletterManager enabled](self, "enabled");
  if (!a3 || !v7)
    return;
  v8 = -[FCNewsletterManager updatedIncludeOptionsWithNewsletter:includeOptions:](self, "updatedIncludeOptionsWithNewsletter:includeOptions:", a3, a4);
  v9 = (void *)FCNewsletterLog;
  if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3)
      v10 = CFSTR("UNKNOWN");
    else
      v10 = off_1E464A5C8[a3 - 1];
    v11 = (objc_class *)MEMORY[0x1E0C99DE8];
    v12 = v9;
    v13 = objc_alloc_init(v11);
    v14 = v13;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v13, "addObject:", CFSTR("ARTICLES"));
      if ((v8 & 2) == 0)
      {
LABEL_9:
        if ((v8 & 4) == 0)
        {
LABEL_11:
          v15 = (void *)objc_msgSend(v14, "copy");

          objc_msgSend(v15, "componentsJoinedByString:", CFSTR("|"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138412546;
          v27 = v10;
          v28 = 2112;
          v29 = v16;
          _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Subscribing to newsletter [%@] options [%@]", (uint8_t *)&v26, 0x16u);

          goto LABEL_12;
        }
LABEL_10:
        objc_msgSend(v14, "addObject:", CFSTR("SPORTS"));
        goto LABEL_11;
      }
    }
    else if ((v8 & 2) == 0)
    {
      goto LABEL_9;
    }
    objc_msgSend(v14, "addObject:", CFSTR("NEWSPLUS_CHANNELS"));
    if ((v8 & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_12:
  v17 = self->_cacheExpiration;
  objc_sync_enter(v17);
  subscription = self->_subscription;
  includeOptions = self->_includeOptions;
  self->_subscription = a3;
  self->_includeOptions = v8;
  if (subscription != a3 || v8 != includeOptions)
    -[FCNewsletterManager notifyObserversWithPreviousSubscription:](self, "notifyObserversWithPreviousSubscription:");
  objc_sync_exit(v17);

  v20 = [FCNewsletterSubscribeCommand alloc];
  if ((unint64_t)a3 > 3)
    v21 = CFSTR("UNKNOWN");
  else
    v21 = off_1E464A5C8[a3 - 1];
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = v22;
  if ((v8 & 1) != 0)
    objc_msgSend(v22, "addObject:", CFSTR("ARTICLES"));
  if ((v8 & 2) != 0)
    objc_msgSend(v23, "addObject:", CFSTR("NEWSPLUS_CHANNELS"));
  if ((v8 & 4) != 0)
    objc_msgSend(v23, "addObject:", CFSTR("SPORTS"));
  v24 = (void *)objc_msgSend(v23, "copy");

  v25 = -[FCNewsletterSubscribeCommand initWithNewsletter:includeArray:](v20, "initWithNewsletter:includeArray:", v21, v24);
  -[FCCommandQueue addCommand:](self->_endpointCommandQueue, "addCommand:", v25);

}

- (void)subscribeTo:(int64_t)a3 includeOptions:(int64_t)a4 completion:(id)a5
{
  id v8;
  _BOOL4 v9;
  char v10;
  void *v11;
  const __CFString *v12;
  objc_class *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v9 = -[FCNewsletterManager enabled](self, "enabled");
  if (a3 && v9)
  {
    v10 = -[FCNewsletterManager updatedIncludeOptionsWithNewsletter:includeOptions:](self, "updatedIncludeOptionsWithNewsletter:includeOptions:", a3, a4);
    v11 = (void *)FCNewsletterLog;
    if (!os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    if ((unint64_t)a3 > 3)
      v12 = CFSTR("UNKNOWN");
    else
      v12 = off_1E464A5C8[a3 - 1];
    v13 = (objc_class *)MEMORY[0x1E0C99DE8];
    v14 = v11;
    v15 = objc_alloc_init(v13);
    v16 = v15;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v15, "addObject:", CFSTR("ARTICLES"));
      if ((v10 & 2) == 0)
      {
LABEL_9:
        if ((v10 & 4) == 0)
        {
LABEL_11:
          v17 = (void *)objc_msgSend(v16, "copy");

          objc_msgSend(v17, "componentsJoinedByString:", CFSTR("|"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v28 = v12;
          v29 = 2112;
          v30 = v18;
          _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Subscribing to newsletter [%@] options [%@]", buf, 0x16u);

LABEL_12:
          -[FCNewsletterManager endpointConnection](self, "endpointConnection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)a3 > 3)
            v20 = CFSTR("UNKNOWN");
          else
            v20 = off_1E464A5C8[a3 - 1];
          v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v22 = v21;
          if ((v10 & 1) != 0)
          {
            objc_msgSend(v21, "addObject:", CFSTR("ARTICLES"));
            if ((v10 & 2) == 0)
            {
LABEL_17:
              if ((v10 & 4) == 0)
              {
LABEL_19:
                v23 = (void *)objc_msgSend(v22, "copy");

                dispatch_get_global_queue(-2, 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25[0] = MEMORY[0x1E0C809B0];
                v25[1] = 3221225472;
                v25[2] = __61__FCNewsletterManager_subscribeTo_includeOptions_completion___block_invoke_25;
                v25[3] = &unk_1E464A4E8;
                v25[4] = self;
                v26 = v8;
                objc_msgSend(v19, "newsletterSubscribeTo:includeArray:callbackQueue:completion:", v20, v23, v24, v25);

                goto LABEL_20;
              }
LABEL_18:
              objc_msgSend(v22, "addObject:", CFSTR("SPORTS"));
              goto LABEL_19;
            }
          }
          else if ((v10 & 2) == 0)
          {
            goto LABEL_17;
          }
          objc_msgSend(v22, "addObject:", CFSTR("NEWSPLUS_CHANNELS"));
          if ((v10 & 4) == 0)
            goto LABEL_19;
          goto LABEL_18;
        }
LABEL_10:
        objc_msgSend(v16, "addObject:", CFSTR("SPORTS"));
        goto LABEL_11;
      }
    }
    else if ((v10 & 2) == 0)
    {
      goto LABEL_9;
    }
    objc_msgSend(v16, "addObject:", CFSTR("NEWSPLUS_CHANNELS"));
    if ((v10 & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_20:

}

void __61__FCNewsletterManager_subscribeTo_includeOptions_completion___block_invoke_25(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateCacheWithNewsletterString:includeArray:", v7, v8);
    v10 = 1;
  }
  else
  {
    v10 = 2;
  }
  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__FCNewsletterManager_subscribeTo_includeOptions_completion___block_invoke_2;
    block[3] = &unk_1E463F9A0;
    v14 = v11;
    v15 = v10;
    v13 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __61__FCNewsletterManager_subscribeTo_includeOptions_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (int64_t)includeOptionsForNewsletter:(int64_t)a3
{
  int64_t v4;
  void *v6;
  uint64_t v7;

  if (a3 != 3)
    return 0;
  if (-[FCNewsletterManager canOptIntoIssues](self, "canOptIntoIssues")
    || -[FCNewsletterManager isOptedIntoIssues](self, "isOptedIntoIssues"))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }
  -[FCNewsletterManager userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sportsOnboardingState");

  if (v7 == 1)
    return v4 | 4;
  else
    return v4;
}

- (void)subscribeTo:(int64_t)a3
{
  -[FCNewsletterManager subscribeTo:includeOptions:](self, "subscribeTo:includeOptions:", a3, -[FCNewsletterManager includeOptionsForNewsletter:](self, "includeOptionsForNewsletter:"));
}

- (void)subscribeTo:(int64_t)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  -[FCNewsletterManager subscribeTo:includeOptions:completion:](self, "subscribeTo:includeOptions:completion:", a3, -[FCNewsletterManager includeOptionsForNewsletter:](self, "includeOptionsForNewsletter:", a3), v6);

}

- (void)subscribeFromPrivacyModalCTA
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = FCNewsletterLog;
  if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: subscribeFromPrivacyModalCTA", v4, 2u);
  }
  -[FCNewsletterManager subscribeTo:](self, "subscribeTo:", -[FCNewsletterManager activeNewsletter](self, "activeNewsletter"));
}

- (void)subscribeFromPrivacyModalCTAWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[FCNewsletterManager subscribeTo:completion:](self, "subscribeTo:completion:", -[FCNewsletterManager activeNewsletter](self, "activeNewsletter"), v4);

}

- (void)unsubscribe
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v3 = FCNewsletterLog;
  if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: unsubscribe", v5, 2u);
  }
  if (-[FCNewsletterManager isSubscribed](self, "isSubscribed"))
  {
    -[FCNewsletterManager subscribeTo:](self, "subscribeTo:", 1);
  }
  else
  {
    v4 = FCNewsletterLog;
    if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Already unsubscribed. Skipping operation.", buf, 2u);
    }
  }
}

- (void)optOutOfIssues
{
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = -[FCNewsletterManager includeOptions](self, "includeOptions");
  v4 = FCNewsletterLog;
  v5 = os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 2) != 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Opting out of Issues...", buf, 2u);
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__FCNewsletterManager_optOutOfIssues__block_invoke_29;
    v7[3] = &unk_1E463AB18;
    v7[4] = self;
    v6 = -[FCNewsletterManager forceSubscriptionThen:](self, "forceSubscriptionThen:", v7);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Already opted out of Issues. Skipping update.", buf, 2u);
  }
}

uint64_t __37__FCNewsletterManager_optOutOfIssues__block_invoke_29(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscribeTo:includeOptions:", objc_msgSend(*(id *)(a1 + 32), "subscription"), objc_msgSend(*(id *)(a1 + 32), "includeOptions") & 0xFFFFFFFFFFFFFFFDLL);
}

- (id)forceSubscriptionThen:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__FCNewsletterManager_forceSubscriptionThen___block_invoke;
  v13[3] = &unk_1E463D3A8;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zalgoIfMain();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __45__FCNewsletterManager_forceSubscriptionThen___block_invoke_2;
  v11[3] = &unk_1E464A510;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v6, "thenOn:then:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __45__FCNewsletterManager_forceSubscriptionThen___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceUpdateSubscription");
}

uint64_t __45__FCNewsletterManager_forceSubscriptionThen___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = FCNewsletterLog;
  if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Updated subscription state.", buf, 2u);
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "isSubscribed");
  v6 = FCNewsletterLog;
  v7 = os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: user is subscribed. Continuing...", v10, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v7)
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: user is not subscribed. Skipping update.", v9, 2u);
  }

  return 0;
}

- (void)optIntoSports
{
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = -[FCNewsletterManager includeOptions](self, "includeOptions");
  v4 = FCNewsletterLog;
  v5 = os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 4) != 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Already opted into sports. Skipping subscription.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Opting into sports...", buf, 2u);
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__FCNewsletterManager_optIntoSports__block_invoke_33;
    v7[3] = &unk_1E463AB18;
    v7[4] = self;
    v6 = -[FCNewsletterManager forceSubscriptionThen:](self, "forceSubscriptionThen:", v7);
  }
}

uint64_t __36__FCNewsletterManager_optIntoSports__block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscribeTo:includeOptions:", objc_msgSend(*(id *)(a1 + 32), "subscription"), objc_msgSend(*(id *)(a1 + 32), "includeOptions") | 4);
}

- (void)optOutOfSports
{
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = -[FCNewsletterManager includeOptions](self, "includeOptions");
  v4 = FCNewsletterLog;
  v5 = os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 4) != 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Opting out from sports...", buf, 2u);
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__FCNewsletterManager_optOutOfSports__block_invoke_35;
    v7[3] = &unk_1E463AB18;
    v7[4] = self;
    v6 = -[FCNewsletterManager forceSubscriptionThen:](self, "forceSubscriptionThen:", v7);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Already opted out from sports. Skipping unsubscribing.", buf, 2u);
  }
}

uint64_t __37__FCNewsletterManager_optOutOfSports__block_invoke_35(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscribeTo:includeOptions:", objc_msgSend(*(id *)(a1 + 32), "subscription"), objc_msgSend(*(id *)(a1 + 32), "includeOptions") & 0xFFFFFFFFFFFFFFFBLL);
}

void __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_3;
  block[3] = &unk_1E463CD80;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_3(uint64_t a1)
{
  FCGetNewsletterSubscriptionOperation *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  FCGetNewsletterSubscriptionOperation *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = [FCGetNewsletterSubscriptionOperation alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(v3 + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_4;
  v7[3] = &unk_1E464A538;
  v7[4] = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v6 = -[FCGetNewsletterSubscriptionOperation initWithEndpointConnection:completion:](v2, "initWithEndpointConnection:completion:", v5, v7);
  -[FCGetNewsletterSubscriptionOperation performOperation](v6, "performOperation");

}

void __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void (*v8)(void);
  id v9;

  v7 = a4;
  v9 = v7;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateCacheWithNewsletterString:includeArray:", a2, a3);
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (objc_msgSend(v7, "fc_hasErrorCode:", 32))
      objc_msgSend(*(id *)(a1 + 32), "resetCaches");
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v8();

}

- (id)getWebToken
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  NFPromise *v9;
  NFPromise *getWebTokenPromise;
  _QWORD v12[5];

  if (-[FCNewsletterManager enabled](self, "enabled"))
  {
    -[FCNewsletterManager webTokenExpiration](self, "webTokenExpiration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceNow");
    v5 = v4;

    if (v5 < 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateByAddingTimeInterval:", 60.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCNewsletterManager setWebTokenExpiration:](self, "setWebTokenExpiration:", v7);

      v8 = objc_alloc(MEMORY[0x1E0D60AF0]);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __34__FCNewsletterManager_getWebToken__block_invoke_3;
      v12[3] = &unk_1E463DAD0;
      v12[4] = self;
      v9 = (NFPromise *)objc_msgSend(v8, "initWithResolver:", v12);
      getWebTokenPromise = self->_getWebTokenPromise;
      self->_getWebTokenPromise = v9;

    }
  }
  return self->_getWebTokenPromise;
}

void __34__FCNewsletterManager_getWebToken__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCGetWebTokenOperation *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  FCGetWebTokenOperation *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = [FCGetWebTokenOperation alloc];
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 24);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__FCNewsletterManager_getWebToken__block_invoke_4;
  v13[3] = &unk_1E464A560;
  v13[4] = v8;
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  v12 = -[FCGetWebTokenOperation initWithEndpointConnection:completion:](v7, "initWithEndpointConnection:completion:", v9, v13);
  -[FCGetWebTokenOperation performOperation](v12, "performOperation");

}

void __34__FCNewsletterManager_getWebToken__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedWebToken:", v10);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", 300.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setWebTokenExpiration:", v7);

    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_msgSend(v10, "copy");
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)updateCacheWithNewsletterString:(id)a3 includeArray:(id)a4
{
  id v6;
  id v7;
  int64_t subscription;
  int64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unsigned int v18;
  int v19;
  int v20;
  int64_t v21;
  void *v22;
  NSDate *v23;
  NSDate *cacheExpiration;
  void *v25;
  void *v26;
  unint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  NSDate *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v35 = self->_cacheExpiration;
  objc_sync_enter(v35);
  subscription = self->_subscription;
  v9 = subscription;
  if (v6)
  {
    v10 = v6;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("NEWSLETTER")) & 1) != 0)
    {
      v9 = 2;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("PERSONALIZED_NEWSLETTER")))
    {
      v9 = 3;
    }
    else
    {
      v9 = 0;
    }

    self->_subscription = v9;
  }
  if (v7)
  {
    v11 = v7;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v11)
    {
      v14 = 0;
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      obj = v11;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v32 = v11;
      v33 = v7;
      v34 = v6;
      v14 = 0;
      if (v13)
      {
        v15 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v38 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("ARTICLES"));
            v19 = objc_msgSend(v17, "isEqualToString:", CFSTR("NEWSPLUS_CHANNELS"));
            v20 = objc_msgSend(v17, "isEqualToString:", CFSTR("SPORTS"));
            v21 = v14 | v18;
            if (v19)
              v21 |= 2uLL;
            if (v20)
              v14 = v21 | 4;
            else
              v14 = v21;
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v13);
      }

      v7 = v33;
      v6 = v34;
      v11 = v32;
    }

    self->_includeOptions = v14;
    v9 = self->_subscription;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCNewsletterManager cacheTimeout](self, "cacheTimeout");
    objc_msgSend(v22, "dateByAddingTimeInterval:");
    v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
    cacheExpiration = self->_cacheExpiration;
    self->_cacheExpiration = v23;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = self->_subscription - 1;
    if (v27 > 2)
      v28 = CFSTR("UNKNOWN");
    else
      v28 = off_1E464A5C8[v27];
    objc_msgSend(v25, "setObject:forKey:", v28, FCNewsletterManagerSubscriptionKey);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setInteger:forKey:", self->_includeOptions, FCNewsletterManagerIncludeKey);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v31, FCNewsletterManagerCacheAgeKey);

    if (self->_subscription != subscription)
      -[FCNewsletterManager notifyObserversWithPreviousSubscription:](self, "notifyObserversWithPreviousSubscription:", subscription);
  }
  objc_sync_exit(v35);

}

- (BOOL)shouldSubmitPersonalizationVector
{
  _BOOL4 v3;

  v3 = -[FCNewsletterManager enabled](self, "enabled");
  if (v3)
    LOBYTE(v3) = -[FCNewsletterManager subscription](self, "subscription") == 3
              || -[FCNewsletterManager subscription](self, "subscription") == 2
              && -[FCNewsletterManager isOptedIntoIssues](self, "isOptedIntoIssues");
  return v3;
}

- (void)submitPersonalizationVector:(id)a3 subscribedBundleChannelIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  FCSubmitNewsletterPersonalizationVectorCommand *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v14 && -[FCNewsletterManager shouldSubmitPersonalizationVector](self, "shouldSubmitPersonalizationVector"))
  {
    objc_msgSend(v14, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isEqualToString:", &stru_1E464BC40) & 1) == 0)
    {
      -[FCNewsletterManager cachedVector](self, "cachedVector");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v10 & 1) == 0)
      {
        -[FCNewsletterManager setCachedVector:](self, "setCachedVector:", v8);
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v8, FCNewsletterManagerCachedVectorKey);

        v12 = -[FCSubmitNewsletterPersonalizationVectorCommand initWithPersonalizationVector:]([FCSubmitNewsletterPersonalizationVectorCommand alloc], "initWithPersonalizationVector:", v8);
        -[FCCommandQueue addCommand:](self->_endpointCommandQueue, "addCommand:", v12);

      }
    }
    if (-[FCNewsletterManager isOptedIntoIssues](self, "isOptedIntoIssues"))
    {
      objc_msgSend(v6, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0C9AA60];
    }
    -[FCNewsletterManager saveToCloudKitSubscribedChannels:](self, "saveToCloudKitSubscribedChannels:", v13);

  }
}

- (void)saveToCloudKitSubscribedChannels:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  FCCKPrivateSaveRecordZonesOperation *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  FCNewsletterManager *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C95098]);
  v6 = (void *)objc_msgSend(v5, "initWithZoneName:ownerName:", CFSTR("UserPrivacyExporter"), *MEMORY[0x1E0C94730]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v6);
  v8 = objc_alloc_init(FCCKPrivateSaveRecordZonesOperation);
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateSaveRecordZonesOperation setRecordZonesToSave:](v8, "setRecordZonesToSave:", v9);

  -[FCNewsletterManager database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseOperation setDatabase:](v8, "setDatabase:", v10);

  -[FCOperation setQualityOfService:](v8, "setQualityOfService:", 17);
  -[FCCKPrivateDatabaseOperation setSkipPreflight:](v8, "setSkipPreflight:", 1);
  -[FCCKPrivateSaveRecordZonesOperation setCanBypassEncryptionRequirement:](v8, "setCanBypassEncryptionRequirement:", 1);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke;
  v14[3] = &unk_1E464A5A8;
  v15 = v6;
  v16 = v4;
  v17 = self;
  v11 = v4;
  v12 = v6;
  -[FCCKPrivateSaveRecordZonesOperation setSaveRecordZonesCompletionBlock:](v8, "setSaveRecordZonesCompletionBlock:", v14);
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v8);

}

void __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  FCCKPrivateSaveRecordsOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2;
    v14[3] = &unk_1E463AB18;
    v14[4] = v4;
    __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2((uint64_t)v14);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("static_user_privacy_exporter_record"), *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("UserPrivacyExporter"), v6);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "encryptedValuesByKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("subscribedChannelTagIDs"));

    v10 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateSaveRecordsOperation setRecordsToSave:](v10, "setRecordsToSave:", v11);

    objc_msgSend(*(id *)(a1 + 48), "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabaseOperation setDatabase:](v10, "setDatabase:", v12);

    -[FCOperation setQualityOfService:](v10, "setQualityOfService:", 17);
    -[FCCKPrivateSaveRecordsOperation setSavePolicy:](v10, "setSavePolicy:", 1);
    -[FCCKPrivateDatabaseOperation setSkipPreflight:](v10, "setSkipPreflight:", 1);
    -[FCCKPrivateSaveRecordsOperation setCanBypassEncryptionRequirement:](v10, "setCanBypassEncryptionRequirement:", 1);
    -[FCCKPrivateSaveRecordsOperation setSaveRecordsCompletionBlock:](v10, "setSaveRecordsCompletionBlock:", &__block_literal_global_55_2);
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addOperation:", v10);

  }
}

void __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "failed to save subscribed channels to CK with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  _QWORD v5[5];

  v3 = a3;
  if (v3)
  {
    v5[1] = 3221225472;
    v5[2] = __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2_56;
    v5[3] = &unk_1E463AB18;
    v5[4] = v3;
    v4 = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2_56((uint64_t)v5);
    v3 = v4;
  }

}

void __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2_56(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "failed to save subscribed channels to CK with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)deletePersonalizationVector
{
  void *v3;
  FCDeleteNewsletterPersonalizationVectorCommand *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (-[FCNewsletterManager enabled](self, "enabled"))
  {
    -[FCNewsletterManager setCachedVector:](self, "setCachedVector:", 0);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", FCNewsletterManagerCachedVectorKey);

    v4 = objc_alloc_init(FCDeleteNewsletterPersonalizationVectorCommand);
    -[FCCommandQueue addCommand:](self->_endpointCommandQueue, "addCommand:", v4);
    -[FCNewsletterManager saveToCloudKitSubscribedChannels:](self, "saveToCloudKitSubscribedChannels:", MEMORY[0x1E0C9AA60]);

  }
}

- (void)resetCaches
{
  NSDate *v3;
  NSDate *cacheExpiration;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  NSDate *obj;

  obj = self->_cacheExpiration;
  objc_sync_enter(obj);
  self->_subscription = 0;
  self->_includeOptions = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  cacheExpiration = self->_cacheExpiration;
  self->_cacheExpiration = v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = self->_subscription - 1;
  if (v7 > 2)
    v8 = CFSTR("UNKNOWN");
  else
    v8 = off_1E464A5C8[v7];
  objc_msgSend(v5, "setObject:forKey:", v8, FCNewsletterManagerSubscriptionKey);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInteger:forKey:", self->_includeOptions, FCNewsletterManagerIncludeKey);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", self->_cacheExpiration, FCNewsletterManagerCacheAgeKey);

  objc_sync_exit(obj);
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCNewsletterManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)notifyObservers
{
  -[FCNewsletterManager notifyObserversWithPreviousSubscription:](self, "notifyObserversWithPreviousSubscription:", self->_subscription);
}

- (double)cacheTimeout
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;

  -[FCNewsAppConfigurationManager possiblyUnfetchedAppConfiguration](self->_appConfig, "possiblyUnfetchedAppConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 86400.0;
  -[FCNewsAppConfigurationManager possiblyUnfetchedAppConfiguration](self->_appConfig, "possiblyUnfetchedAppConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "newsletterSubscriptionStatusCacheTimeout");
  v7 = v6;

  return v7;
}

- (void)notifyObserversWithPreviousSubscription:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[FCNewsletterManager observers](self, "observers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "newsletterSubscriptionChangedFromSubscription:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int64_t)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(int64_t)a3
{
  self->_subscription = a3;
}

- (void)setIncludeOptions:(int64_t)a3
{
  self->_includeOptions = a3;
}

- (FCNewsletterEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (FCCommandQueue)endpointCommandQueue
{
  return self->_endpointCommandQueue;
}

- (FCAppleAccount)appleAccount
{
  return self->_appleAccount;
}

- (FCNewsAppConfigurationManager)appConfig
{
  return self->_appConfig;
}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (NSString)activeiTunesAccountName
{
  return self->_activeiTunesAccountName;
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (NSDate)cacheExpiration
{
  return self->_cacheExpiration;
}

- (void)setCacheExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_cacheExpiration, a3);
}

- (NFPromise)updateSubscriptionPromise
{
  return self->_updateSubscriptionPromise;
}

- (void)setUpdateSubscriptionPromise:(id)a3
{
  objc_storeStrong((id *)&self->_updateSubscriptionPromise, a3);
}

- (NFPromise)getWebTokenPromise
{
  return self->_getWebTokenPromise;
}

- (void)setGetWebTokenPromise:(id)a3
{
  objc_storeStrong((id *)&self->_getWebTokenPromise, a3);
}

- (NSString)cachedVector
{
  return self->_cachedVector;
}

- (void)setCachedVector:(id)a3
{
  objc_storeStrong((id *)&self->_cachedVector, a3);
}

- (NSString)cachedWebToken
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCachedWebToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSDate)webTokenExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setWebTokenExpiration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webTokenExpiration, 0);
  objc_storeStrong((id *)&self->_cachedWebToken, 0);
  objc_storeStrong((id *)&self->_cachedVector, 0);
  objc_storeStrong((id *)&self->_getWebTokenPromise, 0);
  objc_storeStrong((id *)&self->_updateSubscriptionPromise, 0);
  objc_storeStrong((id *)&self->_cacheExpiration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_activeiTunesAccountName, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_appConfig, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_endpointCommandQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

@end
