@implementation BLHLSKeyFetcher

- (BLHLSKeyFetcher)init
{
  BLHLSKeyFetcher *v2;
  BLHLSKeyFetcher *v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLHLSKeyFetcher;
  v2 = -[BLHLSKeyFetcher init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_ignoreCache = 1;
    BLHLSKeyFetchingLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21323F000, v4, OS_LOG_TYPE_INFO, "Ignoring any local cache.", v6, 2u);
    }

  }
  return v3;
}

+ (BLHLSKeyFetcher)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_213243E34;
  block[3] = &unk_24CF70CA0;
  block[4] = a1;
  if (qword_253E79BE8 != -1)
    dispatch_once(&qword_253E79BE8, block);
  return (BLHLSKeyFetcher *)(id)qword_254B8C3A0;
}

- (id)fetchOnlineKeyForMediaItem:(id)a3 loadingRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  BLStreamingKeyRequest *v15;
  const char *v16;
  void *v17;
  const char *v18;
  _QWORD v20[5];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  sub_213243D0C();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForProperty_(v5, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BUDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_unsignedIntValue(v10, v11, v12);

  BLHLSKeyFetchingLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = v13;
    _os_log_impl(&dword_21323F000, v14, OS_LOG_TYPE_DEFAULT, "Fetching online key for %llu.", buf, 0xCu);
  }

  v15 = [BLStreamingKeyRequest alloc];
  v17 = (void *)objc_msgSend_initWithMediaItem_loadingRequest_(v15, v16, (uint64_t)v5, v6);

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_213243FDC;
  v20[3] = &unk_24CF70CC0;
  v20[4] = v13;
  objc_msgSend_performRequestWithResponseHandler_(v17, v18, (uint64_t)v20);

  return v17;
}

- (id)fetchOfflineKeyForMediaItem:(id)a3 identity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  BLOfflineKeyRequest *v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  BLHLSKeyFetchingLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_title(v8, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v39 = v14;
    v40 = 1024;
    LODWORD(v41) = objc_msgSend_ignoreCache(self, v15, v16);
    _os_log_impl(&dword_21323F000, v11, OS_LOG_TYPE_DEFAULT, "Fetching offline key for '%@'. Ignore Cache? %{BOOL}d", buf, 0x12u);

  }
  objc_msgSend_hlsOfflinePlaybackKeysForItem_(BLMediaItemUtils, v17, (uint64_t)v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && !objc_msgSend_ignoreCache(self, v21, v22))
  {
    BLHLSKeyFetchingLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_title(v8, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v32;
      _os_log_impl(&dword_21323F000, v29, OS_LOG_TYPE_DEFAULT, "Cache hit of offline key for '%@'", buf, 0xCu);

    }
    v33 = MEMORY[0x2199AEBD8](v10);
    v28 = (void *)v33;
    if (v33)
      (*(void (**)(uint64_t, void *, _QWORD))(v33 + 16))(v33, v20, 0);
    v25 = 0;
  }
  else
  {
    v23 = [BLOfflineKeyRequest alloc];
    v25 = (void *)objc_msgSend_initWithMediaItem_identity_(v23, v24, (uint64_t)v8, v9);
    BLHLSKeyFetchingLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v39 = v25;
      v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_21323F000, v26, OS_LOG_TYPE_DEFAULT, "Created Offline key request (%@) with identity: '%@'", buf, 0x16u);
    }

    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_2132443A0;
    v35[3] = &unk_24CF70CE8;
    v36 = v8;
    v37 = v10;
    objc_msgSend_performRequestWithResponseHandler_(v25, v27, (uint64_t)v35);

    v28 = v36;
  }

  return v25;
}

- (BOOL)ignoreCache
{
  return self->_ignoreCache;
}

- (void)setIgnoreCache:(BOOL)a3
{
  self->_ignoreCache = a3;
}

@end
