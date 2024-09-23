@implementation GEOSiriSyncHandler

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  __CFString *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a6;
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138478083;
    v14 = v8;
    v15 = 2113;
    v16 = v9;
    _os_log_impl(&dword_217763000, v11, OS_LOG_TYPE_DEBUG, "beginSyncWithAnchor:%{private}@ validity:%{private}@", (uint8_t *)&v13, 0x16u);
  }

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("20180510")) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138478083;
      v14 = CFSTR("20180510");
      v15 = 2113;
      v16 = v9;
      _os_log_impl(&dword_217763000, v12, OS_LOG_TYPE_DEBUG, "local validity:%{private}@ differs from validity:%{private}@; will reset with local value",
        (uint8_t *)&v13,
        0x16u);
    }

    objc_msgSend(v10, "resetWithValidity:", CFSTR("20180510"));
  }

}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138477827;
    v17 = v5;
    _os_log_impl(&dword_217763000, v7, OS_LOG_TYPE_DEBUG, "getChangeAfterAnchor:%{private}@", (uint8_t *)&v16, 0xCu);
  }

  v8 = objc_alloc_init(MEMORY[0x24BE3D050]);
  objc_msgSend(v8, "postAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_msgSend(v9, "isEqualToString:", v5) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138478083;
      v17 = v9;
      v18 = 2113;
      v19 = v5;
      _os_log_impl(&dword_217763000, v10, OS_LOG_TYPE_DEBUG, "postAnchor:%{private}@ differs from preAnchor:%{private}@; will provide new domainObject",
        (uint8_t *)&v16,
        0x16u);
    }

    v11 = objc_alloc_init(MEMORY[0x24BE81400]);
    objc_msgSend(v8, "additionalEnabledMarkets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdditionalEnabledTransitMarkets:", v12);

    objc_msgSend(v8, "manifestEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnvironment:", v13);

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("siri-sync://siri-maps-client-info"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdentifier:", v14);

    objc_msgSend(v8, "clientMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClientMetadata:", v15);

    objc_msgSend(v6, "setObject:", v11);
  }
  objc_msgSend(v6, "setPostAnchor:", v9);

}

- (void)syncDidEnd
{
  NSObject *v2;
  uint8_t v3[16];

  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_217763000, v2, OS_LOG_TYPE_DEBUG, "syncDidEnd", v3, 2u);
  }

}

@end
