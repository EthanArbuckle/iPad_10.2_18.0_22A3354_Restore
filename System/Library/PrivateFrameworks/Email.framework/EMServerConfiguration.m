@implementation EMServerConfiguration

uint64_t __37__EMServerConfiguration_refreshAsync__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCacheRecent");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "refresh");
  return result;
}

+ (BOOL)isCacheRecent
{
  return objc_msgSend(a1, "isCacheRecentLastRefreshDate:", 0);
}

+ (BOOL)isCacheRecentLastRefreshDate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(a1, "getValueForKey:refreshIfNeeded:", CFSTR("EMServerConfiguration-propertyListLastDownloadTime"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v7);
  if (v7)
  {
    objc_msgSend(a1, "_cacheValidityInterval");
    v8 = objc_msgSend(v7, "ef_isMoreThanTimeIntervalAgo:") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)getValueForKey:(id)a3 refreshIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (v4 && (objc_msgSend(a1, "isCacheRecent") & 1) == 0)
    objc_msgSend(a1, "refreshAsync");
  objc_msgSend(a1, "_cachedPropertyList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_dateFormatter
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
  return v2;
}

+ (id)_cachedPropertyList
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

+ (id)_userDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
}

+ (id)_userDefaultsKey
{
  return CFSTR("mailServerConfigrationPropertyList");
}

+ (double)_cacheValidityInterval
{
  return 86400.0;
}

+ (void)refreshAsync
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = dispatch_queue_create("com.apple.mail.serverConfiguration.networkOperations", v4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EMServerConfiguration_refreshAsync__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v5, block);

}

void ___ef_log_EMServerConfiguration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EMServerConfiguration");
  v1 = (void *)_ef_log_EMServerConfiguration_log;
  _ef_log_EMServerConfiguration_log = (uint64_t)v0;

}

+ (id)_configurationLocation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://configuration.apple.com/configurations/internetservices/mail/configuration.plist"));
}

+ (void)_assertNotMainThread
{
  id v4;

  if (pthread_main_np())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMServerConfiguration.m"), 39, CFSTR("Current thread is main"));

  }
}

+ (BOOL)refresh
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  objc_msgSend(a1, "_assertNotMainThread");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = (void *)MEMORY[0x1E0C92C98];
  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_configurationLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__EMServerConfiguration_refresh__block_invoke;
  v11[3] = &unk_1E70F6138;
  v13 = &v15;
  v14 = a1;
  v8 = v3;
  v12 = v8;
  objc_msgSend(v6, "dataTaskWithURL:completionHandler:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v3;
}

void __32__EMServerConfiguration_refresh__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    _ef_log_EMServerConfiguration();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      __32__EMServerConfiguration_refresh__block_invoke_cold_1(v16, buf, v15);
    }
    v11 = v15;
    goto LABEL_9;
  }
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = *(void **)(a1 + 48);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v11);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_savePropertyList:withDate:", v13, v14);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    _ef_log_EMServerConfiguration();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1B99BB000, v15, OS_LOG_TYPE_DEFAULT, "downloadPropertyList success: %@", buf, 0xCu);
    }
LABEL_9:

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)_savePropertyList:(id)a3 withDate:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[5];

  v11 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(a1, "_dateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("EMServerConfiguration-propertyListLastDownloadTime"));
  objc_msgSend(a1, "_userDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userDefaultsKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v6, v10);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EMServerConfiguration__savePropertyList_withDate___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_savePropertyList_withDate__onceToken != -1)
    dispatch_once(&_savePropertyList_withDate__onceToken, block);

}

void __52__EMServerConfiguration__savePropertyList_withDate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_userDefaultsKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (id)getValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_cachedPropertyList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cachedPropertyList
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_cachedPropertyList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("EMServerConfiguration-propertyListLastDownloadTime"));

  return v3;
}

+ (void)clearCache
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _ef_log_EMServerConfiguration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "Clearing out the cached property list", v6, 2u);
  }

  objc_msgSend(a1, "_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userDefaultsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", 0, v5);

}

+ (void)overrideWithPropertyList:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  _ef_log_EMServerConfiguration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "Overriding with custom property list", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_savePropertyList:withDate:", v4, v6);

}

void __32__EMServerConfiguration_refresh__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "downloadPropertyList error: %@", buf, 0xCu);

}

@end
