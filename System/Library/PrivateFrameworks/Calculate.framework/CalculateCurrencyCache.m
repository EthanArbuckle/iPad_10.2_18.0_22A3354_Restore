@implementation CalculateCurrencyCache

- (CalculateCurrencyCache)init
{
  char *v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CalculateCurrencyCache;
  v2 = -[CalculateCurrencyCache init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v2 + 1) = objc_msgSend(v3, "hash");

    v4 = dispatch_queue_create("com.apple.framework.calculate.currency-cache", 0);
    v5 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v4;

    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = 0;

    *(_OWORD *)(v2 + 24) = xmmword_1B8917C90;
    v7 = objc_opt_new();
    v8 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v7;

    objc_msgSend(v2, "_loadPersistedCurrencyCache");
  }
  return (CalculateCurrencyCache *)v2;
}

- (BOOL)refresh
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  dispatch_semaphore_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = dispatch_semaphore_create(0);
  -[CalculateCurrencyCache serializer](self, "serializer");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CalculateCurrencyCache_refresh__block_invoke;
  block[3] = &unk_1E6E9F890;
  v8 = v3;
  v9 = &v10;
  block[4] = self;
  v5 = v3;
  dispatch_async(v4, block);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

- (BOOL)refreshIfNeeded
{
  return !-[CalculateCurrencyCache needsRefresh](self, "needsRefresh")
      || -[CalculateCurrencyCache refresh](self, "refresh");
}

- (BOOL)refreshWithTimeOut:(float)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v9[5];
  dispatch_semaphore_t v10;
  uint64_t *v11;
  float v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v5 = dispatch_semaphore_create(0);
  -[CalculateCurrencyCache serializer](self, "serializer");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__CalculateCurrencyCache_refreshWithTimeOut___block_invoke;
  v9[3] = &unk_1E6E9F8B8;
  v10 = v5;
  v11 = &v13;
  v12 = a3;
  v9[4] = self;
  v7 = v5;
  dispatch_async(v6, v9);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v6) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v6;
}

- (NSDate)lastRefreshDate
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSDate copy](self->_lastRefreshDate, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSDate *)v3;
}

- (BOOL)_needsRefresh
{
  double v3;
  double v4;
  double v5;

  -[NSDate timeIntervalSinceReferenceDate](self->_lastRefreshDate, "timeIntervalSinceReferenceDate");
  v4 = vabdd_f64(CFAbsoluteTimeGetCurrent(), v3);
  -[CalculateCurrencyCache refreshInterval](self, "refreshInterval");
  return v4 > v5;
}

- (BOOL)needsRefresh
{
  BOOL v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[CalculateCurrencyCache _needsRefresh](self, "_needsRefresh");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSDictionary)currencyData
{
  NSDictionary *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_currencyData;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)_consumerSecret
{
  void *v2;
  uint64_t i;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 40; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%c"), consumerSecret[i]);
  return v2;
}

- (id)_consumerKey
{
  return CFSTR("dj0yJmk9cU51ZlhUZ2ZneDBJJmQ9WVdrOU1rOVVlWE5vTkhNbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1hNw--");
}

- (id)createCredential
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D64EA0]);
  -[CalculateCurrencyCache _consumerKey](self, "_consumerKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConsumerKey:", v4);

  -[CalculateCurrencyCache _consumerSecret](self, "_consumerSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConsumerSecret:", v5);

  return v3;
}

- (BOOL)_queue_refresh:(double)a3
{
  double lastRefreshTimeInternal;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[5];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  -[NSLock lock](self->_lock, "lock");
  lastRefreshTimeInternal = self->_lastRefreshTimeInternal;
  -[NSLock unlock](self->_lock, "unlock");
  if (CFAbsoluteTimeGetCurrent() - lastRefreshTimeInternal < 5.0)
    return 1;
  v7 = (void *)MEMORY[0x1E0CB37A8];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://apple-finance.query.yahoo.com/v1/yql/applewf/currencies?lang=en&region=US&format=json"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestWithURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("JSON"), CFSTR("Content-Type"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("no-cache"), CFSTR("Cache-Control"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[CalculateCurrencyCache uuid](self, "uuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Client-ID"));

  objc_msgSend(v9, "setTimeoutInterval:", a3);
  -[CalculateCurrencyCache createCredential](self, "createCredential");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64EA8]), "initWithCredential:", v11);
  v13 = dispatch_group_create();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  dispatch_group_enter(v13);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "signedURLRequestWithRequest:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __41__CalculateCurrencyCache__queue_refresh___block_invoke;
  v19[3] = &unk_1E6E9F8E0;
  v19[4] = self;
  v21 = &v22;
  v16 = v13;
  v20 = v16;
  objc_msgSend(v14, "dataTaskWithRequest:completionHandler:", v15, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "resume");
  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  v6 = *((_BYTE *)v23 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  return v6;
}

- (BOOL)_queue_refresh
{
  -[CalculateCurrencyCache timeout](self, "timeout");
  return -[CalculateCurrencyCache _queue_refresh:](self, "_queue_refresh:");
}

- (void)_queue_persistCurrencyCache
{
  SecTaskRef v3;
  SecTaskRef v4;
  uint64_t v5;
  int v6;
  char v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  _QWORD aBlock[5];
  uint8_t buf[16];

  v3 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v3)
  {
    v4 = v3;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__CalculateCurrencyCache__queue_persistCurrencyCache__block_invoke;
    aBlock[3] = &__block_descriptor_40_e18_B16__0__NSString_8l;
    aBlock[4] = v3;
    v5 = (uint64_t)_Block_copy(aBlock);
    v6 = (*(uint64_t (**)(uint64_t, const __CFString *))(v5 + 16))(v5, CFSTR("com.apple.security.app-sandbox"));
    v7 = (*(uint64_t (**)(uint64_t, const __CFString *))(v5 + 16))(v5, CFSTR("user-preference-write"));
    v8 = (*(uint64_t (**)(uint64_t, const __CFString *))(v5 + 16))(v5, CFSTR("file-write-data"));
    CFRelease(v4);
    CalculateLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (!v6 || (v7 & 1) != 0 || (v8 & 1) != 0)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B885B000, v9, OS_LOG_TYPE_DEFAULT, "Calculate: successfully updated currency exchange rates", buf, 2u);
      }

      CFPreferencesSetAppValue(CFSTR("currencyCacheRefreshDate"), self->_lastRefreshDate, CFSTR("com.apple.calculateframework"));
      CFPreferencesSetAppValue(CFSTR("currencyCache"), self->_currencyData, CFSTR("com.apple.calculateframework"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.calculateframework"));
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B885B000, v9, OS_LOG_TYPE_DEFAULT, "Calculate: currency persist failed; insufficient entitlements",
          buf,
          2u);
      }

    }
  }
  else
  {
    CalculateLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B885B000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Calculate: unexpected NULL from SecTaskCreateFromSelf", buf, 2u);
    }
  }

}

- (void)_loadPersistedCurrencyCache
{
  SecTaskRef v3;
  SecTaskRef v4;
  uint64_t v5;
  int v6;
  char v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD aBlock[5];
  uint8_t buf[16];

  v3 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v3)
  {
    v4 = v3;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__CalculateCurrencyCache__loadPersistedCurrencyCache__block_invoke;
    aBlock[3] = &__block_descriptor_40_e18_B16__0__NSString_8l;
    aBlock[4] = v3;
    v5 = (uint64_t)_Block_copy(aBlock);
    v6 = (*(uint64_t (**)(uint64_t, const __CFString *))(v5 + 16))(v5, CFSTR("com.apple.security.app-sandbox"));
    v7 = (*(uint64_t (**)(uint64_t, const __CFString *))(v5 + 16))(v5, CFSTR("user-preference-read"));
    v8 = (*(uint64_t (**)(uint64_t, const __CFString *))(v5 + 16))(v5, CFSTR("file-read-data"));
    CFRelease(v4);
    if (!v6 || (v7 & 1) != 0 || (v8 & 1) != 0)
    {
      CFPreferencesAppSynchronize(CFSTR("com.apple.calculateframework"));
      v10 = CFPreferencesCopyAppValue(CFSTR("currencyCache"), CFSTR("com.apple.calculateframework"));
      v9 = v10;
      if (v10 && (unint64_t)-[NSObject count](v10, "count") >= 0xB)
      {
        v11 = (void *)CFPreferencesCopyAppValue(CFSTR("currencyCacheRefreshDate"), CFSTR("com.apple.calculateframework"));
        if (v11)
        {
          objc_storeStrong((id *)&self->_currencyData, v9);
          objc_storeStrong((id *)&self->_lastRefreshDate, v11);
        }

      }
    }
    else
    {
      CalculateLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B885B000, v9, OS_LOG_TYPE_DEFAULT, "Calculate: currency load failed; insufficient entitlements",
          buf,
          2u);
      }
    }

  }
  else
  {
    CalculateLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B885B000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Calculate: unexpected NULL from SecTaskCreateFromSelf", buf, 2u);
    }
  }

}

- (BOOL)updateCurrencyCacheWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSDate *v9;
  NSDate *lastRefreshDate;
  NSDate *v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  NSDate *v15;
  NSDate *v16;
  NSObject *v17;
  NSDate *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("query"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("created"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
    goto LABEL_15;
  CalculateLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = (uint64_t)v5;
    _os_log_impl(&dword_1B885B000, v6, OS_LOG_TYPE_DEFAULT, "Calculate: currency last updated: %@", buf, 0xCu);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCalendar:", v8);

  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
  objc_msgSend(v7, "dateFromString:", v5);
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastRefreshDate = self->_lastRefreshDate;
  self->_lastRefreshDate = v9;

  if (-[CalculateCurrencyCache _needsRefresh](self, "_needsRefresh"))
  {
    v11 = self->_lastRefreshDate;
    CalculateLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        v14 = "Calculate: refresh date was too different from system time; setting to now";
LABEL_10:
        _os_log_impl(&dword_1B885B000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      }
    }
    else if (v13)
    {
      *(_WORD *)buf = 0;
      v14 = "Calculate: refresh date was nil; setting to now";
      goto LABEL_10;
    }

    v15 = (NSDate *)objc_opt_new();
    v16 = self->_lastRefreshDate;
    self->_lastRefreshDate = v15;

  }
  CalculateLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_lastRefreshDate;
    *(_DWORD *)buf = 138543362;
    v52 = (uint64_t)v18;
    _os_log_impl(&dword_1B885B000, v17, OS_LOG_TYPE_DEFAULT, "Calculate: currency refresh date: %{public}@", buf, 0xCu);
  }

LABEL_15:
  objc_msgSend(v3, "objectForKey:", CFSTR("query"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("results"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("item"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("response"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("finance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("currencies"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKey:", CFSTR("currency"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "count");
  if (v26)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v27 = v25;
    v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v28)
    {
      v29 = v28;
      v41 = v26;
      v42 = v25;
      v43 = v5;
      v44 = v3;
      v30 = *(_QWORD *)v47;
      do
      {
        v31 = v27;
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v47 != v30)
            objc_enumerationMutation(v31);
          v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v33, "objectForKey:", CFSTR("currency_to"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v33, "objectForKey:", CFSTR("price"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "doubleValue");
          objc_msgSend(v35, "numberWithDouble:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v34, "length"))
            v38 = v37 == 0;
          else
            v38 = 1;
          if (!v38)
            -[NSMutableDictionary setObject:forKey:](self->_mutableCurrencyCache, "setObject:forKey:", v37, v34);

        }
        v27 = v31;
        v29 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v29);
      v5 = v43;
      v3 = v44;
      v26 = v41;
      v25 = v42;
    }
  }
  else
  {
    CalculateLogForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 134217984;
      v52 = v39;
      _os_log_impl(&dword_1B885B000, v27, OS_LOG_TYPE_DEFAULT, "Calculate: Received response data but the currency data is empty(currency count): %lu", buf, 0xCu);
    }
  }

  return v26 != 0;
}

- (unint64_t)uuid
{
  return self->_uuid;
}

- (OS_dispatch_queue)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(double)a3
{
  self->_refreshInterval = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)lastRefreshTimeInternal
{
  return self->_lastRefreshTimeInternal;
}

- (void)setLastRefreshTimeInternal:(double)a3
{
  self->_lastRefreshTimeInternal = a3;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_mutableCurrencyCache, 0);
  objc_storeStrong((id *)&self->_currentString, 0);
  objc_storeStrong((id *)&self->_currentRate, 0);
  objc_storeStrong((id *)&self->_currentCurrency, 0);
  objc_storeStrong((id *)&self->_currencyData, 0);
  objc_storeStrong((id *)&self->_lastRefreshDate, 0);
}

uint64_t __53__CalculateCurrencyCache__loadPersistedCurrencyCache__block_invoke(uint64_t a1, const __CFString *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)SecTaskCopyValueForEntitlement(*(SecTaskRef *)(a1 + 32), a2, 0);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

uint64_t __53__CalculateCurrencyCache__queue_persistCurrencyCache__block_invoke(uint64_t a1, const __CFString *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)SecTaskCopyValueForEntitlement(*(SecTaskRef *)(a1 + 32), a2, 0);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

void __41__CalculateCurrencyCache__queue_refresh___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = v7;
  if (!v6 || v7)
  {
    CalculateLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_error_impl(&dword_1B885B000, v14, OS_LOG_TYPE_ERROR, "Calculate: currency refresh failed, error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "lock");
    CalculateLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B885B000, v9, OS_LOG_TYPE_DEFAULT, "Calculate: currency refresh succeed", buf, 2u);
    }

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 72);
    *(_QWORD *)(v11 + 72) = v10;

    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 4, &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    if (v14 || !objc_msgSend(*(id *)(a1 + 32), "updateCurrencyCacheWithData:", v13))
    {
      CalculateLogForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v14;
        _os_log_error_impl(&dword_1B885B000, v21, OS_LOG_TYPE_ERROR, "Calculate: JSON parsing error:%{public}@ or currency data update error", buf, 0xCu);
      }

    }
    else
    {
      v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 72);
      *(_QWORD *)(v18 + 72) = 0;

      CalculateLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B885B000, v20, OS_LOG_TYPE_DEFAULT, "Calculate: save new currency data to disk", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_queue_persistCurrencyCache");
      *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 88) = CFAbsoluteTimeGetCurrent();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "unlock");

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

intptr_t __45__CalculateCurrencyCache_refreshWithTimeOut___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  CalculateLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B885B000, v2, OS_LOG_TYPE_DEFAULT, "Calculate: start refreshing currency rates", v4, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_queue_refresh:", *(float *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __33__CalculateCurrencyCache_refresh__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  CalculateLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B885B000, v2, OS_LOG_TYPE_DEFAULT, "Calculate: start refreshing currency rates", v4, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_queue_refresh");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (CalculateCurrencyCache)shared
{
  if (shared_onceToken[0] != -1)
    dispatch_once(shared_onceToken, &__block_literal_global_12);
  return (CalculateCurrencyCache *)(id)shared_shared;
}

void __32__CalculateCurrencyCache_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_shared;
  shared_shared = v0;

}

@end
