@implementation NSHTTPCookieStorageToCookie2Storage

- (NSHTTPCookieStorageToCookie2Storage)init
{
  NSHTTPCookieStorageToCookie2Storage *v2;
  uint64_t v3;
  NSHTTPCookie2Storage *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
  v2 = -[NSHTTPCookieStorage init](&v6, sel_init);
  if (v2)
  {
    +[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage](NSHTTPCookie2Storage, "sharedNSHTTPCookie2Storage");
    v3 = objc_claimAutoreleasedReturnValue();
    store = v2->_store;
    v2->_store = (NSHTTPCookie2Storage *)v3;

    v2->_acceptPolicy = 2;
    v2->_behavesLikeNS = 1;
    -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](v2);
  }
  return v2;
}

- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4
{
  NSHTTPCookieStorageToCookie2Storage *v4;
  NSHTTPCookieStorageToCookie2Storage *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
  v4 = -[NSHTTPCookieStorage init](&v8, sel_init, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_acceptPolicy = 2;
    +[NSHTTPCookieStorage sharedHTTPCookieStorage](NSHTTPCookieStorageToCookie2Storage, "sharedHTTPCookieStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_initWithCFHTTPCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  void *v4;

  self->_acceptPolicy = 2;
  +[NSHTTPCookieStorage sharedHTTPCookieStorage](NSHTTPCookieStorageToCookie2Storage, "sharedHTTPCookieStorage", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  getCookieLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_183ECA000, v3, OS_LOG_TYPE_DEFAULT, "Do nothing", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
  -[NSHTTPCookieStorage dealloc](&v4, sel_dealloc);
}

- (void)setCookie:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSHTTPCookie2Storage *store;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  NSObject *v12;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  store = self->_store;
  -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__NSHTTPCookieStorageToCookie2Storage_setCookie___block_invoke;
  v10[3] = &unk_1E14FDE88;
  v8 = v4;
  v11 = v8;
  v9 = v5;
  v12 = v9;
  -[NSHTTPCookie2Storage setCookie:withFilter:completionHandler:](store, "setCookie:withFilter:completionHandler:", v7, 0, v10);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5
{
  -[NSHTTPCookieStorageToCookie2Storage _setCookies:forURL:mainDocumentURL:policyProperties:](self, "_setCookies:forURL:mainDocumentURL:policyProperties:", a3, a4, a5, 0);
}

- (void)_setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5 policyProperties:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSHTTPCookie2StorageFilter *v13;
  dispatch_semaphore_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSHTTPCookie2Storage *store;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v27 = a4;
  v11 = a5;
  v12 = a6;
  v26 = v11;
  v13 = objc_alloc_init(NSHTTPCookie2StorageFilter);
  -[NSHTTPCookie2StorageFilter setMainDocumentURL:](v13, "setMainDocumentURL:", v11);
  -[NSHTTPCookie2StorageFilter setUrl:](v13, "setUrl:", v27);
  -[NSHTTPCookie2StorageFilter setAcceptPolicy:](v13, "setAcceptPolicy:", -[NSHTTPCookieStorageToCookie2Storage cookieAcceptPolicy](self, "cookieAcceptPolicy"));
  v14 = dispatch_semaphore_create(0);
  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HTTPCookiePolicyPropertyCookieAcceptPolicy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HTTPCookiePolicyPropertyCookieAcceptPolicy"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSHTTPCookie2StorageFilter setAcceptPolicy:](v13, "setAcceptPolicy:", (int)objc_msgSend(v16, "intValue"));

    }
  }
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v32;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v18);
        -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, *(void **)(*((_QWORD *)&v31 + 1) + 8 * v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v19);
  }

  store = self->_store;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __91__NSHTTPCookieStorageToCookie2Storage__setCookies_forURL_mainDocumentURL_policyProperties___block_invoke;
  v28[3] = &unk_1E14FDE88;
  v24 = v17;
  v29 = v24;
  v25 = v14;
  v30 = v25;
  -[NSHTTPCookie2Storage setCookies:withFilter:completionHandler:](store, "setCookies:withFilter:completionHandler:", v24, v13, v28);
  dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_testingOfStoringOfCookie:(id)a3
{
  id v4;
  NSHTTPCookie2StorageFilter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  NSHTTPCookie2Storage *store;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(NSHTTPCookie2StorageFilter);
  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("http://%@%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2StorageFilter setUrl:](v5, "setUrl:", v11);

  -[NSHTTPCookie2StorageFilter setOverwriteHTTPOnlyCookies:](v5, "setOverwriteHTTPOnlyCookies:", 1);
  v12 = dispatch_semaphore_create(0);
  -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  store = self->_store;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__NSHTTPCookieStorageToCookie2Storage__testingOfStoringOfCookie___block_invoke;
  v18[3] = &unk_1E14FDE88;
  v19 = v14;
  v16 = v12;
  v20 = v16;
  v17 = v14;
  -[NSHTTPCookie2Storage setCookies:withFilter:completionHandler:](store, "setCookies:withFilter:completionHandler:", v17, v5, v18);
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)storeCookies:(id)a3 forTask:(id)a4
{
  id v6;
  id v7;
  NSHTTPCookie2StorageFilter *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t acceptPolicy;
  void *v14;
  dispatch_semaphore_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSHTTPCookie2Storage *store;
  id v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(NSHTTPCookie2StorageFilter);
  objc_msgSend(v7, "currentRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainDocumentURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2StorageFilter setMainDocumentURL:](v8, "setMainDocumentURL:", v10);

  objc_msgSend(v7, "currentRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2StorageFilter setUrl:](v8, "setUrl:", v12);

  if (self->_behavesLikeNS)
    acceptPolicy = (int)objc_msgSend(v7, "_cookieAcceptPolicy");
  else
    acceptPolicy = self->_acceptPolicy;
  -[NSHTTPCookie2StorageFilter setAcceptPolicy:](v8, "setAcceptPolicy:", acceptPolicy);
  objc_msgSend(v7, "_storagePartitionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2StorageFilter setPartition:](v8, "setPartition:", v14);

  -[NSHTTPCookie2StorageFilter setOverwriteHTTPOnlyCookies:](v8, "setOverwriteHTTPOnlyCookies:", 1);
  v15 = dispatch_semaphore_create(0);
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v17);
        -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, *(void **)(*((_QWORD *)&v28 + 1) + 8 * i));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v21);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }

  store = self->_store;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__NSHTTPCookieStorageToCookie2Storage_storeCookies_forTask___block_invoke;
  v25[3] = &unk_1E14FDE88;
  v23 = v17;
  v26 = v23;
  v24 = v15;
  v27 = v24;
  -[NSHTTPCookie2Storage setCookies:withFilter:completionHandler:](store, "setCookies:withFilter:completionHandler:", v16, v8, v25);
  dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_saveCookies:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(_QWORD))a3;
  getCookieLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_INFO, "_saveCookies is no longer needed", v5, 2u);
  }

  v3[2](v3);
}

- (void)_saveCookies
{
  NSObject *v2;
  uint8_t v3[16];

  getCookieLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_183ECA000, v2, OS_LOG_TYPE_INFO, "_saveCookies is no longer needed", v3, 2u);
  }

}

- (id)cookies
{
  id v3;
  dispatch_semaphore_t v4;
  NSHTTPCookie2Storage *store;
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  NSHTTPCookieStorageToCookie2Storage *v13;
  dispatch_semaphore_t v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = dispatch_semaphore_create(0);
  store = self->_store;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__NSHTTPCookieStorageToCookie2Storage_cookies__block_invoke;
  v11[3] = &unk_1E14F6B68;
  v6 = v3;
  v12 = v6;
  v13 = self;
  v14 = v4;
  v7 = v4;
  -[NSHTTPCookie2Storage getAllCookiesWithCompletionHandler:](store, "getAllCookiesWithCompletionHandler:", v11);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = v14;
  v9 = v6;

  return v9;
}

- (id)cookiesForURL:(id)a3
{
  void *v3;
  id v5;
  NSHTTPCookie2LookupFilter *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  dispatch_semaphore_t v12;
  id v13;
  NSHTTPCookie2Storage *store;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  NSHTTPCookieStorageToCookie2Storage *v22;
  NSObject *v23;

  v5 = a3;
  v6 = objc_alloc_init(NSHTTPCookie2LookupFilter);
  objc_msgSend(v5, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setDomain:](v6, "setDomain:", v7);

  objc_msgSend(v5, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("https"));
  if (v9)
  {
    objc_msgSend(v5, "scheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("wss")) == 0;
  }
  else
  {
    v10 = 1;
  }
  -[NSHTTPCookie2LookupFilter setSecure:](v6, "setSecure:", v10);
  if (v9)

  objc_msgSend(v5, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setPath:](v6, "setPath:", v11);

  -[NSHTTPCookie2LookupFilter setAcceptPolicy:](v6, "setAcceptPolicy:", -[NSHTTPCookieStorageToCookie2Storage cookieAcceptPolicy](self, "cookieAcceptPolicy"));
  v12 = dispatch_semaphore_create(0);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  store = self->_store;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__NSHTTPCookieStorageToCookie2Storage_cookiesForURL___block_invoke;
  v20[3] = &unk_1E14F6B68;
  v15 = v13;
  v21 = v15;
  v22 = self;
  v16 = v12;
  v23 = v16;
  -[NSHTTPCookie2Storage getCookiesWithFilter:completionHandler:](store, "getCookiesWithFilter:completionHandler:", v6, v20);
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  v17 = v23;
  v18 = v15;

  return v18;
}

- (void)getCookiesForTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSHTTPCookie2LookupFilter *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSHTTPCookie2Storage *store;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  NSHTTPCookieStorageToCookie2Storage *v32;
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(NSHTTPCookie2LookupFilter);
  objc_msgSend(v6, "currentRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setDomain:](v8, "setDomain:", v11);

  objc_msgSend(v6, "currentRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setSecure:](v8, "setSecure:", objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("https")) == 0);

  objc_msgSend(v6, "currentRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setPath:](v8, "setPath:", v17);

  objc_msgSend(v6, "_storagePartitionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setPartition:](v8, "setPartition:", v18);

  objc_msgSend(v6, "currentRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setInURL:](v8, "setInURL:", v20);

  objc_msgSend(v6, "currentRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mainDocumentURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setMainDocumentURL:](v8, "setMainDocumentURL:", v22);

  -[NSHTTPCookie2LookupFilter setAcceptPolicy:](v8, "setAcceptPolicy:", (int)objc_msgSend(v6, "_cookieAcceptPolicy"));
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[NSHTTPCookieStorage _overrideSessionCookieAcceptPolicy](self, "_overrideSessionCookieAcceptPolicy"))
  {
    -[NSHTTPCookie2LookupFilter setAcceptPolicy:](v8, "setAcceptPolicy:", -[NSHTTPCookieStorageToCookie2Storage cookieAcceptPolicy](self, "cookieAcceptPolicy"));
  }
  objc_msgSend(v6, "_siteForCookies");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v6, "_siteForCookies");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSHTTPCookie2LookupFilter setSiteForCookies:](v8, "setSiteForCookies:", v24);

    objc_msgSend(v6, "currentRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSHTTPCookie2LookupFilter setIsSafe:](v8, "setIsSafe:", objc_msgSend(v25, "_isIdempotent"));

    -[NSHTTPCookie2LookupFilter setIsTopLevelNavigation:](v8, "setIsTopLevelNavigation:", objc_msgSend(v6, "_isTopLevelNavigation"));
  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  store = self->_store;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __75__NSHTTPCookieStorageToCookie2Storage_getCookiesForTask_completionHandler___block_invoke;
  v30[3] = &unk_1E14F6B90;
  v31 = v26;
  v32 = self;
  v28 = v7;
  v33 = v28;
  v29 = v26;
  -[NSHTTPCookie2Storage getCookiesWithFilter:completionHandler:](store, "getCookiesWithFilter:completionHandler:", v8, v30);

}

- (id)_cookiesForURL:(id)a3 mainDocumentURL:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  dispatch_semaphore_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v7 = a3;
  v8 = dispatch_semaphore_create(0);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__860;
  v19 = __Block_byref_object_dispose__861;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__NSHTTPCookieStorageToCookie2Storage__cookiesForURL_mainDocumentURL___block_invoke;
  v12[3] = &unk_1E14FB1A8;
  v13 = v8;
  v14 = &v15;
  v9 = v8;
  -[NSHTTPCookieStorageToCookie2Storage _getCookiesForURL:mainDocumentURL:partition:completionHandler:](self, "_getCookiesForURL:mainDocumentURL:partition:completionHandler:", v7, v6, 0, v12);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 completionHandler:(id)a6
{
  void *v6;
  id v11;
  id v12;
  id v13;
  id v14;
  NSHTTPCookie2LookupFilter *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  dispatch_semaphore_t v20;
  NSHTTPCookie2Storage *store;
  id v22;
  NSObject *v23;
  _QWORD v24[5];
  dispatch_semaphore_t v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_alloc_init(NSHTTPCookie2LookupFilter);
  objc_msgSend(v11, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setDomain:](v15, "setDomain:", v16);

  -[NSHTTPCookie2LookupFilter setInURL:](v15, "setInURL:", v11);
  -[NSHTTPCookie2LookupFilter setMainDocumentURL:](v15, "setMainDocumentURL:", v12);
  objc_msgSend(v11, "scheme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v11, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("https")) == 0;
  }
  else
  {
    v18 = 0;
  }
  -[NSHTTPCookie2LookupFilter setSecure:](v15, "setSecure:", v18);
  if (v17)

  objc_msgSend(v11, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setPath:](v15, "setPath:", v19);

  -[NSHTTPCookie2LookupFilter setPartition:](v15, "setPartition:", v13);
  -[NSHTTPCookie2LookupFilter setAcceptPolicy:](v15, "setAcceptPolicy:", self->_acceptPolicy);
  v20 = dispatch_semaphore_create(0);
  store = self->_store;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__NSHTTPCookieStorageToCookie2Storage__getCookiesForURL_mainDocumentURL_partition_completionHandler___block_invoke;
  v24[3] = &unk_1E14F6B90;
  v24[4] = self;
  v22 = v14;
  v25 = v20;
  v26 = v22;
  v23 = v20;
  -[NSHTTPCookie2Storage getCookiesWithFilter:completionHandler:](store, "getCookiesWithFilter:completionHandler:", v15, v24);
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 policyProperties:(id)a6 completionHandler:(id)a7
{
  -[NSHTTPCookieStorageToCookie2Storage _getCookiesForURL:mainDocumentURL:partition:completionHandler:](self, "_getCookiesForURL:mainDocumentURL:partition:completionHandler:", a3, a4, a5, a7);
}

- (void)_getCookiesForPartition:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__NSHTTPCookieStorageToCookie2Storage__getCookiesForPartition_completionHandler___block_invoke;
  v11[3] = &unk_1E14FBDA8;
  v12 = v8;
  v13 = v6;
  v9 = v8;
  v10 = v6;
  -[NSHTTPCookieStorageToCookie2Storage _getCookiesForURL:mainDocumentURL:partition:completionHandler:](self, "_getCookiesForURL:mainDocumentURL:partition:completionHandler:", 0, 0, v7, v11);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)deleteCookie:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSHTTPCookie2Storage *store;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  store = self->_store;
  -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__NSHTTPCookieStorageToCookie2Storage_deleteCookie___block_invoke;
  v9[3] = &unk_1E14FE118;
  v8 = v5;
  v10 = v8;
  -[NSHTTPCookie2Storage deleteCookie:withCompletionHandler:](store, "deleteCookie:withCompletionHandler:", v7, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)removeCookiesSinceDate:(id)a3
{
  dispatch_semaphore_t v4;
  NSHTTPCookie2Storage *store;
  NSObject *v6;
  _QWORD v7[4];
  dispatch_semaphore_t v8;

  v4 = dispatch_semaphore_create(0);
  store = self->_store;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__NSHTTPCookieStorageToCookie2Storage_removeCookiesSinceDate___block_invoke;
  v7[3] = &unk_1E14FE118;
  v8 = v4;
  v6 = v4;
  -[NSHTTPCookie2Storage deleteAllCookiesWithCompletionHandler:](store, "deleteAllCookiesWithCompletionHandler:", v7);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)setCookieAcceptPolicy:(unint64_t)a3
{
  NSObject *v4;
  _QWORD block[5];

  self->_acceptPolicy = a3;
  cookieNotificationQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__NSHTTPCookieStorageToCookie2Storage_setCookieAcceptPolicy___block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v4, block);

}

- (unint64_t)cookieAcceptPolicy
{
  return self->_acceptPolicy;
}

- (void)_setPrivateBrowsingEnabled:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  getCookieLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_183ECA000, v3, OS_LOG_TYPE_INFO, "_setPrivateBrowsingEnabled is not implemented", v4, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

void __61__NSHTTPCookieStorageToCookie2Storage_setCookieAcceptPolicy___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NSHTTPCookieManagerCookiesChangedNotification"), *(_QWORD *)(a1 + 32));

}

intptr_t __62__NSHTTPCookieStorageToCookie2Storage_removeCookiesSinceDate___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSMutableHTTPCookie2)_nsToNewCookie:(NSMutableHTTPCookie2 *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableHTTPCookie2 *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "value");
      a1 = (NSMutableHTTPCookie2 *)objc_claimAutoreleasedReturnValue();
      if (!a1)
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v4, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [NSMutableHTTPCookie2 alloc];
        objc_msgSend(v4, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "value");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = -[NSMutableHTTPCookie2 initWithName:value:domain:](v7, "initWithName:value:domain:", v8, v9, v10);

        objc_msgSend(v4, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setPath:](a1, "setPath:", v11);

        objc_msgSend(v4, "expiresDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setExpirationDate:](a1, "setExpirationDate:", v12);

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (a1)
        {
          objc_msgSend(v13, "timeIntervalSince1970");
          a1->super._sCreationDate = vcvtad_u64_f64(v15);
        }

        objc_msgSend(v4, "domain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setHostOnly:](a1, "setHostOnly:", objc_msgSend(v16, "hasPrefix:", CFSTR(".")) ^ 1);

        -[NSMutableHTTPCookie2 setHttpOnly:](a1, "setHttpOnly:", objc_msgSend(v4, "isHTTPOnly"));
        -[NSMutableHTTPCookie2 setSecure:](a1, "setSecure:", objc_msgSend(v4, "isSecure"));
        objc_msgSend(v4, "expiresDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setExpirationDate:](a1, "setExpirationDate:", v17);

        objc_msgSend(v4, "_storagePartition");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setPartition:](a1, "setPartition:", v18);

        objc_msgSend(v4, "sameSitePolicy");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_msgSend(v4, "sameSitePolicy");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "caseInsensitiveCompare:", 0x1EDCFCAC8))
            v19 = 2 * (objc_msgSend(v9, "caseInsensitiveCompare:", 0x1EDCFCB38) == 0);
          else
            v19 = 1;

        }
        else
        {
          v19 = 0;
        }
        -[NSMutableHTTPCookie2 setSameSite:](a1, "setSameSite:", v19);
        if (v5)

        goto LABEL_16;
      }
    }
    a1 = 0;
  }
LABEL_17:

  return a1;
}

intptr_t __52__NSHTTPCookieStorageToCookie2Storage_deleteCookie___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __81__NSHTTPCookieStorageToCookie2Storage__getCookiesForPartition_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __101__NSHTTPCookieStorageToCookie2Storage__getCookiesForURL_mainDocumentURL_partition_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSHTTPCookie *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:](*(_QWORD *)(a1 + 32), *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8));
        objc_msgSend(v4, "addObject:", v9, (_QWORD)v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (NSHTTPCookie)_newCookieToNSCookie:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSHTTPCookie *v21;

  v3 = a2;
  if (!a1)
  {
    v21 = 0;
    goto LABEL_22;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Name"));

  objc_msgSend(v3, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Value"));

  objc_msgSend(v3, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("Expires"));

  objc_msgSend(v3, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("Path"));

  v9 = objc_msgSend(v3, "sameSite");
  if (v9 == 1)
  {
    v10 = &_kCFHTTPCookieSameSiteLax;
  }
  else
  {
    if (v9 != 2)
    {
      v11 = 0;
      goto LABEL_8;
    }
    v10 = &_kCFHTTPCookieSameSiteStrict;
  }
  v11 = (id)*v10;
LABEL_8:
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("SameSite"));

  objc_msgSend(v3, "partition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("none"));

  if (v13)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, 0x1EDCFC9B0);
  }
  else
  {
    objc_msgSend(v3, "partition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, 0x1EDCFC9B0);

  }
  if (objc_msgSend(v3, "secure"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("Secure"));
  if (objc_msgSend(v3, "httpOnly"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("HttpOnly"));
  objc_msgSend(v3, "expirationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "expirationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("Expires"));

  }
  if (objc_msgSend(v3, "hostOnly")
    && (objc_msgSend(v3, "domain"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "hasPrefix:", CFSTR(".")),
        v17,
        v18))
  {
    objc_msgSend(v3, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "substringFromIndex:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("Domain"));

  }
  else
  {
    objc_msgSend(v3, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("Domain"));
  }

  v21 = -[NSHTTPCookie initWithProperties:]([NSHTTPCookie alloc], "initWithProperties:", v4);
LABEL_22:

  return v21;
}

void __70__NSHTTPCookieStorageToCookie2Storage__cookiesForURL_mainDocumentURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __75__NSHTTPCookieStorageToCookie2Storage_getCookiesForTask_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSHTTPCookie *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = (void *)a1[4];
        v8 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:](a1[5], *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6));
        objc_msgSend(v7, "addObject:", v8, (_QWORD)v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __53__NSHTTPCookieStorageToCookie2Storage_cookiesForURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSHTTPCookie *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(a1 + 32);
        v8 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:](*(_QWORD *)(a1 + 40), *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6));
        objc_msgSend(v7, "addObject:", v8, (_QWORD)v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __46__NSHTTPCookieStorageToCookie2Storage_cookies__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSHTTPCookie *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(a1 + 32);
        v8 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:](*(_QWORD *)(a1 + 40), *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6));
        objc_msgSend(v7, "addObject:", v8, (_QWORD)v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

intptr_t __60__NSHTTPCookieStorageToCookie2Storage_storeCookies_forTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getCookieLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEBUG, "Cookies stored for task. %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __65__NSHTTPCookieStorageToCookie2Storage__testingOfStoringOfCookie___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getCookieLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEBUG, "Set cookie completion. Cookies = %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __91__NSHTTPCookieStorageToCookie2Storage__setCookies_forURL_mainDocumentURL_policyProperties___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getCookieLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEBUG, "Set cookie completion. Cookies = %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __49__NSHTTPCookieStorageToCookie2Storage_setCookie___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getCookieLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEBUG, "Set cookie completion called. Cookie = %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)registerForPostingNotifications
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;
  _QWORD block[5];
  _QWORD *v11;

  objc_initWeak(&location, val);
  v2 = *((_QWORD *)val + 5);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke;
  v7[3] = &unk_1E14FCD98;
  objc_copyWeak(&v8, &location);
  v4 = v7;
  v5 = v4;
  if (v2)
  {
    v6 = *(NSObject **)(v2 + 24);
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __68__NSHTTPCookie2Storage__setDefaultCookieChangedNotificationHandler___block_invoke;
    block[3] = &unk_1E14FDF00;
    block[4] = v2;
    v11 = v4;
    dispatch_async(v6, block);

  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    cookieNotificationQueue();
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke_2;
    block[3] = &unk_1E14FE118;
    v4 = WeakRetained;
    dispatch_async(v2, block);

  }
}

void __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.Foundation.NSHTTPCookieManagerAcceptPolicyChanged"), *(_QWORD *)(a1 + 32));

}

- (_QWORD)initMemoryCookieStore
{
  _QWORD *v1;
  id v2;
  void *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
  v1 = objc_msgSendSuper2(&v5, sel_init);
  if (v1)
  {
    v2 = -[NSHTTPCookie2Storage initInNSMemoryHTTPCookie2Storage]([NSHTTPCookie2Storage alloc], "initInNSMemoryHTTPCookie2Storage");
    v3 = (void *)v1[5];
    v1[5] = v2;

    v1[3] = 2;
    -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](v1);
  }
  return v1;
}

- (_QWORD)initWithPath:(_QWORD *)a1
{
  id v3;
  NSHTTPCookie2Storage *v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = -[NSHTTPCookie2Storage initWithPath:]([NSHTTPCookie2Storage alloc], "initWithPath:", v3);
      v5 = (void *)a1[5];
      a1[5] = v4;

      a1[3] = 2;
      -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](a1);
    }
  }

  return a1;
}

- (_QWORD)initWithIdentifyingData:(_QWORD *)a1
{
  id v3;
  NSHTTPCookie2Storage *v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = -[NSHTTPCookie2Storage initWithIdentifyingData:]([NSHTTPCookie2Storage alloc], "initWithIdentifyingData:", v3);
      v5 = (void *)a1[5];
      a1[5] = v4;

      a1[3] = 2;
      -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](a1);
    }
  }

  return a1;
}

@end
