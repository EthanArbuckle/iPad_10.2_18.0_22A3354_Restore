@implementation AppCache

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)userManagedAssetsURL
{
  return self->_userManagedAssetsURL;
}

- (BOOL)isPlugin
{
  return self->_isPlugin;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (void)addBundleRecords:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[AppCache addBundleRecord:](self, "addBundleRecord:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addBundleRecord:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AppCache bundleRecords](self, "bundleRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v10);

  if ((v5 & 1) == 0)
  {
    -[AppCache dataContainerURL](self, "dataContainerURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataContainerURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      -[AppCache bundleRecords](self, "bundleRecords");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
  }

}

- (NSMutableSet)bundleRecords
{
  return self->_bundleRecords;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  const char *v9;
  const char *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v32 = (void *)MEMORY[0x1E0CB3940];
  -[AppCache identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v30 = -[AppCache urgency](self, "urgency");
  -[AppCache lastUsed](self, "lastUsed");
  v4 = objc_claimAutoreleasedReturnValue();
  humanReadableNumber(-[AppCache caches:purge:](self, "caches:purge:", 0, 0));
  v5 = objc_claimAutoreleasedReturnValue();
  humanReadableNumber(-[AppCache tmp:purge:all:](self, "tmp:purge:all:", 0, 0, 0));
  v6 = objc_claimAutoreleasedReturnValue();
  -[AppCache lastKnownFreespace](self, "lastKnownFreespace");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  humanReadableNumber(objc_msgSend(v33, "unsignedLongLongValue"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppCache bundleRecords](self, "bundleRecords");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppCache personaUniqueString](self, "personaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v4;
  v36 = (void *)v3;
  v34 = (void *)v5;
  if (v7)
  {
    -[AppCache personaUniqueString](self, "personaUniqueString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("none");
  }
  if (-[AppCache isDataseparated](self, "isDataseparated"))
    v9 = " Dataseparated ";
  else
    v9 = "";
  if (-[AppCache isPlaceholder](self, "isPlaceholder"))
    v10 = " Placeholder ";
  else
    v10 = "";
  -[AppCache dataContainerURL](self, "dataContainerURL");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "fileSystemRepresentation");
  -[AppCache userManagedAssetsURL](self, "userManagedAssetsURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", user managed assets: %s"), -[NSURL fileSystemRepresentation](self->_userManagedAssetsURL, "fileSystemRepresentation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v12;
    v23 = v9;
    v25 = v10;
    v21 = v6;
    v15 = (void *)v6;
    v16 = v34;
    v17 = v35;
    v18 = v36;
    objc_msgSend(v32, "stringWithFormat:", CFSTR("identifier: %@, urgency: %d, lastUsed: %@, cacheSize: %@, tmpSize: %@, freespace: %@ bundleRecords: [ %@ ], persona: %@%s%s, data container: %s%@"), v36, v30, v35, v34, v21, v38, v37, v8, v23, v25, v27, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = v12;
    v24 = v9;
    v26 = v10;
    v22 = v6;
    v15 = (void *)v6;
    v16 = v34;
    v17 = v35;
    v18 = v36;
    objc_msgSend(v32, "stringWithFormat:", CFSTR("identifier: %@, urgency: %d, lastUsed: %@, cacheSize: %@, tmpSize: %@, freespace: %@ bundleRecords: [ %@ ], persona: %@%s%s, data container: %s%@"), v36, v30, v35, v34, v22, v38, v37, v8, v24, v26, v28, &stru_1E4A34440);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  return v19;
}

- (AppCache)initWithBundleRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 cacheDeleteVolume:(id)a8 isDataseparated:(BOOL)a9 isPlaceholder:(BOOL)a10 isPlugin:(BOOL)a11 telemetry:(id)a12
{
  id v18;
  id v19;
  id v20;
  AppCache *v21;
  AppCache *v22;
  NSURL *dataContainerURL;
  uint64_t v24;
  void *v25;
  CacheDeleteVolume *v26;
  void *cdVol;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  AppCache *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  CacheDeleteVolume *v38;
  uint64_t v39;
  NSMutableSet *bundleRecords;
  uint64_t v41;
  NSNumber *lastKnownTmpSize;
  uint64_t v43;
  NSNumber *lastKnownCacheSize;
  NSNumber *v45;
  NSNumber *lastKnownFreespace;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v50 = a5;
  v49 = a6;
  v48 = a7;
  v20 = a8;
  v47 = a12;
  v51.receiver = self;
  v51.super_class = (Class)AppCache;
  v21 = -[AppCache init](&v51, sel_init);
  v22 = v21;
  if (!v21)
    goto LABEL_15;
  if (!v18 || !v19)
  {
    CDGetLogHandle((uint64_t)"client");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

LABEL_15:
      v32 = 0;
      v34 = v48;
      v33 = v49;
      v35 = v47;
      goto LABEL_16;
    }
    *(_DWORD *)buf = 67109120;
    v53 = 95;
    v29 = "%d AppCache: cannot create an AppCache without an identifier and LSRecord(s)!";
    v30 = v28;
    v31 = 8;
LABEL_26:
    _os_log_error_impl(&dword_1A3662000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_14;
  }
  if (v50)
    objc_storeStrong((id *)&v21->_dataContainerURL, a5);
  dataContainerURL = v22->_dataContainerURL;
  if (!dataContainerURL)
  {
    CDGetLogHandle((uint64_t)"client");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 67109378;
    v53 = 92;
    v54 = 2112;
    v55 = v19;
    v29 = "%d AppCache: cannot create an AppCache for %@ without dataContainerURL";
    v30 = v28;
    v31 = 18;
    goto LABEL_26;
  }
  if (v20)
  {
    if (!initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v20, "freespace"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace;
      initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace = v24;

    }
    v26 = (CacheDeleteVolume *)v20;
    cdVol = v22->_cdVol;
    v22->_cdVol = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", -[NSURL fileSystemRepresentation](dataContainerURL, "fileSystemRepresentation"));
    cdVol = (void *)objc_claimAutoreleasedReturnValue();
    +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", cdVol);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v22->_cdVol;
    v22->_cdVol = (CacheDeleteVolume *)v37;

  }
  if (!v22->_cdVol)
    goto LABEL_15;
  if (!a11)
    objc_storeStrong((id *)&v22->_userManagedAssetsURL, a6);
  v39 = objc_msgSend(v18, "mutableCopy");
  bundleRecords = v22->_bundleRecords;
  v22->_bundleRecords = (NSMutableSet *)v39;

  objc_storeStrong((id *)&v22->_identifier, a4);
  objc_storeStrong((id *)&v22->_personaUniqueString, a7);
  v22->_isPlaceholder = a10;
  v22->_isPlugin = a11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AppCache tmp:purge:all:](v22, "tmp:purge:all:", 0, 0, 0));
  v41 = objc_claimAutoreleasedReturnValue();
  lastKnownTmpSize = v22->_lastKnownTmpSize;
  v22->_lastKnownTmpSize = (NSNumber *)v41;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AppCache caches:purge:](v22, "caches:purge:", 0, 0));
  v43 = objc_claimAutoreleasedReturnValue();
  lastKnownCacheSize = v22->_lastKnownCacheSize;
  v22->_lastKnownCacheSize = (NSNumber *)v43;

  if (initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace)
  {
    v45 = (NSNumber *)(id)initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CacheDeleteVolume freespace](v22->_cdVol, "freespace"));
    v45 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  lastKnownFreespace = v22->_lastKnownFreespace;
  v22->_lastKnownFreespace = v45;
  v34 = v48;
  v33 = v49;
  v35 = v47;

  objc_storeStrong((id *)&v22->_telemetry, a12);
  v22->_timestamp = nan("");
  v32 = v22;
LABEL_16:

  return v32;
}

+ (id)appCacheWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 isDataseparated:(BOOL)a8 isPlaceholder:(BOOL)a9 isPlugin:(BOOL)a10 telemetry:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  AppCache *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a11;
  if (!v17)
  {
    CDGetLogHandle((uint64_t)"client");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "AppCache: identifier is required";
LABEL_10:
      v28 = v24;
      v29 = 2;
LABEL_11:
      _os_log_error_impl(&dword_1A3662000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    }
LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  if (!v18)
  {
    CDGetLogHandle((uint64_t)"client");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "AppCache: dataContainerURL is required";
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  BYTE2(v31) = a10;
  BYTE1(v31) = a9;
  LOBYTE(v31) = a8;
  v22 = -[AppCache initWithBundleRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:]([AppCache alloc], "initWithBundleRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:", v16, v17, v18, v19, v20, 0, v31, v21);
  CDGetLogHandle((uint64_t)"client");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v22)
  {
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 138412290;
    v34 = v17;
    v27 = "AppCache: unable to create AppCache for %@";
    v28 = v24;
    v29 = 12;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[AppCache identifier](v22, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppCache lastKnownCacheSize](v22, "lastKnownCacheSize");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    humanReadableNumber(objc_msgSend(v32, "unsignedLongLongValue"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v25;
    v35 = 2112;
    v36 = v26;
    _os_log_impl(&dword_1A3662000, v24, OS_LOG_TYPE_DEFAULT, "AppCache: created an app cache - identifier: %@, cacheSize: %@", buf, 0x16u);

  }
LABEL_14:

  return v22;
}

+ (id)appCacheWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 cacheDeleteVolume:(id)a8 isDataseparated:(BOOL)a9 isPlaceholder:(BOOL)a10 isPlugin:(BOOL)a11 telemetry:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  AppCache *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a12;
  if (!v18)
  {
    CDGetLogHandle((uint64_t)"client");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "AppCache: identifier is required";
LABEL_10:
      v29 = v26;
      v30 = 2;
LABEL_11:
      _os_log_error_impl(&dword_1A3662000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    }
LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
  if (!v19)
  {
    CDGetLogHandle((uint64_t)"client");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "AppCache: dataContainerURL is required";
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  BYTE2(v32) = a11;
  LOWORD(v32) = __PAIR16__(a10, a9);
  v24 = -[AppCache initWithBundleRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:]([AppCache alloc], "initWithBundleRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:", v17, v18, v19, v20, v21, v22, v32, v23);
  CDGetLogHandle((uint64_t)"client");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v24)
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 138412290;
    v36 = v18;
    v28 = "AppCache: unable to create AppCache for %@";
    v29 = v26;
    v30 = 12;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    -[AppCache identifier](v24, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppCache lastKnownCacheSize](v24, "lastKnownCacheSize");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    humanReadableNumber(objc_msgSend(v34, "unsignedLongLongValue"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v36 = v27;
    v37 = 2112;
    v38 = v33;
    _os_log_impl(&dword_1A3662000, v26, OS_LOG_TYPE_DEFAULT, "AppCache: created an app cache - identifier: %@, cacheSize: %@", buf, 0x16u);

  }
LABEL_14:

  return v24;
}

- (int)urgency
{
  void *v2;
  int v3;

  -[AppCache lastUsed](self, "lastUsed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = urgencyForDate(v2);

  return v3;
}

- (id)cachePath
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[AppCache dataContainerURL](self, "dataContainerURL");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithUTF8String:", objc_msgSend(v3, "fileSystemRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Library/Caches"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tmpPath
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[AppCache dataContainerURL](self, "dataContainerURL");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithUTF8String:", objc_msgSend(v3, "fileSystemRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("tmp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)invalidate
{
  -[AppCache setTimestamp:](self, "setTimestamp:", nan("));
}

- (BOOL)validate
{
  id v3;
  int v4;
  BOOL result;
  void *v6;
  void *v7;
  _BOOL4 v8;
  CacheDeleteVolume *cdVol;
  void *v10;

  -[AppCache cachePath](self, "cachePath");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = access((const char *)objc_msgSend(v3, "UTF8String"), 0);

  result = 0;
  if (!v4)
  {
    -[AppCache timestamp](self, "timestamp");
    v6 = (void *)MEMORY[0x1E0C99D68];
    -[AppCache timestamp](self, "timestamp");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = validateTimestamp(v7, 3600.0);

    if (v8)
    {
      cdVol = self->_cdVol;
      -[AppCache lastKnownFreespace](self, "lastKnownFreespace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(cdVol) = -[CacheDeleteVolume freespaceIsStale:](cdVol, "freespaceIsStale:", objc_msgSend(v10, "unsignedLongLongValue"));

      return cdVol ^ 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int64_t)three_days_ago
{
  NSObject *v2;
  int *v4;
  char *v5;
  timeval v6;
  uint8_t buf[4];
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.tv_sec = 0;
  *(_QWORD *)&v6.tv_usec = 0;
  if (gettimeofday(&v6, 0))
  {
    CDGetLogHandle((uint64_t)"client");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = __error();
      v5 = strerror(*v4);
      *(_DWORD *)buf = 136315138;
      v8 = v5;
      _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "gettimeofday failed: %s", buf, 0xCu);
    }

  }
  return v6.tv_sec - 259200;
}

- (unint64_t)groupCache:(BOOL)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  AppCache *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a3 || !-[AppCache validate](self, "validate"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[AppCache bundleRecords](self, "bundleRecords");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    v23 = self;
    v7 = 0;
    if (v26)
    {
      v25 = *(_QWORD *)v33;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(obj);
          v27 = v8;
          v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v9, "groupContainerURLs");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v29;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v29 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14);
                objc_msgSend(v9, "groupContainerURLs");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", v15);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                v18 = (void *)MEMORY[0x1E0CB3940];
                v19 = objc_retainAutorelease(v17);
                objc_msgSend(v18, "stringWithUTF8String:", objc_msgSend(v19, "fileSystemRepresentation"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("Library/Caches"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                v7 += did_fast_size_directory(v21, 0);
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v12);
          }

          v8 = v27 + 1;
        }
        while (v27 + 1 != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v26);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppCache setLastKnownGroupCacheSize:](v23, "setLastKnownGroupCacheSize:", v22);

    return v7;
  }
  else
  {
    -[AppCache lastKnownGroupCacheSize](self, "lastKnownGroupCacheSize");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedLongLongValue");

    return v5;
  }
}

- (unint64_t)tmp:(BOOL)a3 purge:(BOOL)a4 all:(BOOL)a5
{
  unint64_t v5;
  void *v9;
  void *v10;
  _QWORD v12[6];
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (a5)
  {
    if (!a3 && !a4)
      -[AppCache validate](self, "validate");
    -[AppCache tmpPath](self, "tmpPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __26__AppCache_tmp_purge_all___block_invoke;
    v12[3] = &unk_1E4A32FC0;
    v13 = a5;
    v14 = a4;
    v12[4] = self;
    v12[5] = &v15;
    traverse_dir_with_state(v9, 0, 0, v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppCache setLastKnownTmpSize:](self, "setLastKnownTmpSize:", v10);

    v5 = v16[3];
  }
  _Block_object_dispose(&v15, 8);
  return v5;
}

uint64_t __26__AppCache_tmp_purge_all___block_invoke(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v6;

  if (*(_BYTE *)a3)
  {
    *(_BYTE *)(a3 + 1) = 1;
  }
  else if (*(_BYTE *)(a1 + 48) || (v6 = *(_QWORD *)(a3 + 48), v6 < objc_msgSend(*(id *)(a1 + 32), "three_days_ago")))
  {
    if (*(_BYTE *)(a1 + 49))
      unlink(a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += *(_QWORD *)(a3 + 8);
  }
  return 1;
}

- (BOOL)moveCacheAside:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  const std::__fs::filesystem::path *v14;
  const std::__fs::filesystem::path *v15;
  std::error_code *v16;
  int v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  char *v23;
  BOOL v24;
  id v26;
  void *v27;
  uint64_t v28;
  int *v29;
  char *v30;
  uint64_t v31;
  int *v32;
  char *v33;
  int v34;
  _BYTE v35[18];
  __int16 v36;
  char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AppCache cdVol](self, "cdVol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  discardedCachesPathForVolume(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CDGetLogHandle((uint64_t)"client");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 67109378;
    *(_DWORD *)v35 = 309;
    *(_WORD *)&v35[4] = 2112;
    *(_QWORD *)&v35[6] = v6;
    _os_log_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEFAULT, "%d parent discardedCachesPath: %@", (uint8_t *)&v34, 0x12u);
  }

  if (!v6)
  {
    CDGetLogHandle((uint64_t)"client");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[CacheDeleteVolume mountPoint](self->_cdVol, "mountPoint");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138412290;
      *(_QWORD *)v35 = v27;
      _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "AppCache moveCacheAside: Unable to create destination path for mount point: %@", (uint8_t *)&v34, 0xCu);

    }
    v8 = 0;
    goto LABEL_19;
  }
  v8 = objc_retainAutorelease(v6);
  if (mkdir((const char *)objc_msgSend(v8, "UTF8String"), 0x1C0u) && *__error() != 17)
  {
    CDGetLogHandle((uint64_t)"client");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_19:
      v24 = 0;
      goto LABEL_20;
    }
LABEL_27:
    v8 = objc_retainAutorelease(v8);
    v28 = objc_msgSend(v8, "UTF8String");
    v29 = __error();
    v30 = strerror(*v29);
    v34 = 136315394;
    *(_QWORD *)v35 = v28;
    *(_WORD *)&v35[8] = 2080;
    *(_QWORD *)&v35[10] = v30;
    _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "mkdir failed for %s : %s", (uint8_t *)&v34, 0x16u);
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CDGetLogHandle((uint64_t)"client");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 67109378;
    *(_DWORD *)v35 = 326;
    *(_WORD *)&v35[4] = 2112;
    *(_QWORD *)&v35[6] = v11;
    _os_log_impl(&dword_1A3662000, v12, OS_LOG_TYPE_DEFAULT, "%d child discardedCachesPath: %@", (uint8_t *)&v34, 0x12u);
  }

  v8 = objc_retainAutorelease(v11);
  if (mkdir((const char *)objc_msgSend(v8, "UTF8String"), 0x1C0u) && *__error() != 17)
  {
    CDGetLogHandle((uint64_t)"client");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    goto LABEL_27;
  }
  v13 = objc_retainAutorelease(v4);
  v14 = (const std::__fs::filesystem::path *)objc_msgSend(v13, "UTF8String");
  v8 = objc_retainAutorelease(v8);
  v15 = (const std::__fs::filesystem::path *)objc_msgSend(v8, "UTF8String");
  rename(v14, v15, v16);
  if (v17)
  {
    CDGetLogHandle((uint64_t)"client");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[AppCache cachePath](self, "cachePath");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = objc_msgSend(v19, "UTF8String");
      v8 = objc_retainAutorelease(v8);
      v21 = objc_msgSend(v8, "UTF8String");
      v22 = __error();
      v23 = strerror(*v22);
      v34 = 136315650;
      *(_QWORD *)v35 = v20;
      *(_WORD *)&v35[8] = 2080;
      *(_QWORD *)&v35[10] = v21;
      v36 = 2080;
      v37 = v23;
      _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "rename failed for %s -> %s : %s", (uint8_t *)&v34, 0x20u);

    }
    goto LABEL_19;
  }
  v26 = objc_retainAutorelease(v13);
  if (!mkdir((const char *)objc_msgSend(v26, "UTF8String"), 0x1C0u))
  {
    v24 = 1;
    goto LABEL_21;
  }
  CDGetLogHandle((uint64_t)"client");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v31 = objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    v32 = __error();
    v33 = strerror(*v32);
    v34 = 136315394;
    *(_QWORD *)v35 = v31;
    *(_WORD *)&v35[8] = 2080;
    *(_QWORD *)&v35[10] = v33;
    _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "Unable to re-create Caches directory at: %s : %s", (uint8_t *)&v34, 0x16u);
  }
  v24 = 1;
LABEL_20:

LABEL_21:
  return v24;
}

- (unint64_t)caches:(BOOL)a3 purge:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  BOOL v7;
  NSObject *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  char *v16;
  id v17;
  id v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  int v35;
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
LABEL_16:
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[AppCache cachePath](self, "cachePath");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v26, "numberWithUnsignedLongLong:", size_dir((const char *)objc_msgSend(v27, "UTF8String")));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppCache setLastKnownCacheSize:](self, "setLastKnownCacheSize:", v28);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    -[AppCache setTimestamp:](self, "setTimestamp:");

    if (v4)
      goto LABEL_5;
LABEL_17:
    -[AppCache lastKnownCacheSize](self, "lastKnownCacheSize");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v25, "unsignedLongLongValue");
    goto LABEL_18;
  }
  -[AppCache lastKnownCacheSize](self, "lastKnownCacheSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "unsignedLongLongValue"))
  {

    goto LABEL_16;
  }
  v7 = -[AppCache validate](self, "validate");

  if (!v7)
    goto LABEL_16;
  if (!v4)
    goto LABEL_17;
LABEL_5:
  CDGetLogHandle((uint64_t)"client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AppCache identifier](self, "identifier");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    -[AppCache lastKnownCacheSize](self, "lastKnownCacheSize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99D68];
    -[AppCache timestamp](self, "timestamp");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 67109890;
    v36 = 363;
    v37 = 2112;
    v38 = v9;
    v39 = 2112;
    v40 = (unint64_t)v10;
    v41 = 2112;
    v42 = v12;
    _os_log_impl(&dword_1A3662000, v8, OS_LOG_TYPE_DEFAULT, "%d %@ purging cache, self.lastKnownCacheSize: %@ at %@", (uint8_t *)&v35, 0x26u);

  }
  -[AppCache cachePath](self, "cachePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AppCache moveCacheAside:](self, "moveCacheAside:", v13);

  if (!v14)
  {
    CDGetLogHandle((uint64_t)"client");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[AppCache identifier](self, "identifier");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      v35 = 67109378;
      v36 = 365;
      v37 = 2112;
      v38 = v16;
      _os_log_impl(&dword_1A3662000, v15, OS_LOG_TYPE_DEFAULT, "%d %@ Unable to move aside cache, clearing in place", (uint8_t *)&v35, 0x12u);

    }
    -[AppCache cachePath](self, "cachePath");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    nuke_dir((const char *)objc_msgSend(v17, "UTF8String"), 1);

  }
  -[AppCache cachePath](self, "cachePath");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = size_dir((const char *)objc_msgSend(v18, "UTF8String"));

  -[AppCache lastKnownCacheSize](self, "lastKnownCacheSize");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedLongLongValue");

  if (v21 <= v19)
  {
    v23 = 0;
  }
  else
  {
    -[AppCache lastKnownCacheSize](self, "lastKnownCacheSize");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedLongLongValue") - v19;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppCache setLastKnownCacheSize:](self, "setLastKnownCacheSize:", v24);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "timeIntervalSinceReferenceDate");
  -[AppCache setTimestamp:](self, "setTimestamp:");
LABEL_18:

  -[AppCache telemetry](self, "telemetry");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    CDGetLogHandle((uint64_t)"client");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        v32 = " purge";
      else
        v32 = "";
      -[AppCache cachePath](self, "cachePath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 67109890;
      v36 = 380;
      v37 = 2080;
      v38 = v32;
      v39 = 2048;
      v40 = v23;
      v41 = 2112;
      v42 = v33;
      _os_log_impl(&dword_1A3662000, v31, OS_LOG_TYPE_DEFAULT, "%d%s caches result: %llu on %@", (uint8_t *)&v35, 0x26u);

    }
  }
  return v23;
}

- (unint64_t)clearCaches:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  unint64_t v19;
  __int128 v21;
  _QWORD v23[6];
  BOOL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v4 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[AppCache bundleRecords](self, "bundleRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v6);
  }

  v12 = 0;
  v13 = -3;
  *(_QWORD *)&v14 = 138412290;
  v21 = v14;
  do
  {
    -[AppCache telemetry](self, "telemetry", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __24__AppCache_clearCaches___block_invoke;
    v23[3] = &unk_1E4A32FE8;
    v23[4] = self;
    v23[5] = &v29;
    v24 = a3;
    assert_group_cache_deletion(v15, v4, v23, &__block_literal_global_9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    CDGetLogHandle((uint64_t)"client");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v21;
      v34 = v16;
      _os_log_impl(&dword_1A3662000, v17, OS_LOG_TYPE_DEFAULT, "clearCaches assert_group_cache_deletion retryIDs: %@", buf, 0xCu);
    }

    if (__CFADD__(v13++, 1))
      break;
    v12 = v16;
  }
  while (objc_msgSend(v16, "count"));
  v19 = v30[3];

  _Block_object_dispose(&v29, 8);
  return v19;
}

void __24__AppCache_clearCaches___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "caches:purge:", 0, 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "tmp:purge:all:", 0, 1, *(unsigned __int8 *)(a1 + 48));
  CDGetLogHandle((uint64_t)"client");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cachePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = 67109890;
    v6[1] = 402;
    v7 = 2048;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A3662000, v2, OS_LOG_TYPE_DEFAULT, "%d clearCaches result: %llu for %@ on %@", (uint8_t *)v6, 0x26u);

  }
}

void __24__AppCache_clearCaches___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  CDGetLogHandle((uint64_t)"client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v4;
    _os_log_error_impl(&dword_1A3662000, v6, OS_LOG_TYPE_ERROR, "AppCache clearCaches: Unable to clear caches for %@ : %@", (uint8_t *)&v7, 0x16u);
  }

}

+ (void)enumerateWithContainerQuery:(id)a3 container_class:(unint64_t)a4 options:(int)a5 telemetry:(id)a6 block:(id)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  int iterate_results_sync;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = a7;
  v12 = (void *)MEMORY[0x1A8591C18]();
  if (container_query_create())
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject listAllPersonaWithAttributes](v13, "listAllPersonaWithAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    v20 = v14;
    v21 = v9;
    v22 = v10;
    v23 = v11;
    v15 = v14;
    iterate_results_sync = container_query_iterate_results_sync();
    container_query_get_last_error();
    v17 = (void *)container_error_copy_unlocalized_description();
    CDGetLogHandle((uint64_t)"client");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (iterate_results_sync)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v25 = v17;
        _os_log_debug_impl(&dword_1A3662000, v19, OS_LOG_TYPE_DEBUG, "container_query_iterate_results_sync succeeded; %s",
          buf,
          0xCu);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = v17;
      _os_log_error_impl(&dword_1A3662000, v19, OS_LOG_TYPE_ERROR, "container_query_iterate_results_sync failed; %s",
        buf,
        0xCu);
    }

    free(v17);
    container_query_free();

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3662000, v13, OS_LOG_TYPE_DEFAULT, "container_query_create failed", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v12);
}

uint64_t __80__AppCache_enumerateWithContainerQuery_container_class_options_telemetry_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t path;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t persona_unique_string;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  void *v38;
  uint64_t user_managed_assets_relative_path;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  char v44;
  char v45;
  char v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A8591C18]();
  path = container_get_path();
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (path)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      v64 = path;
      _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "path: %s\n", buf, 0xCu);
    }
    v47 = path;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", container_get_identifier());
    v4 = objc_claimAutoreleasedReturnValue();
    persona_unique_string = container_get_persona_unique_string();
    v50 = a1;
    if (persona_unique_string)
    {
      v51 = v4;
      v48 = v2;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", persona_unique_string);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v8 = *(id *)(a1 + 32);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v59 != v12)
              objc_enumerationMutation(v8);
            v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend(v14, "userPersonaUniqueString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v7);

            if (v16)
              v11 = objc_msgSend(v14, "isDataSeparatedPersona");
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
        }
        while (v10);
      }
      else
      {
        v11 = 0;
      }

      v17 = v11 & 1;
      v2 = v48;
      v4 = v51;
    }
    else
    {
      v7 = 0;
      v17 = 0;
    }
    v57 = 0;
    objc_msgSend(MEMORY[0x1E0CA58A0], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v57);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v57;
    v20 = v19;
    if (!v18 || v19)
    {
      CDGetLogHandle((uint64_t)"client");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v64 = (uint64_t)v4;
        v65 = 2112;
        v66 = v20;
        _os_log_error_impl(&dword_1A3662000, v21, OS_LOG_TYPE_ERROR, "Unable to create an LSBundleRecord for %@ : %@", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v18, "UIBackgroundModes");
      v21 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject containsObject:](v21, "containsObject:", CFSTR("continuous")) & 1) != 0)
      {
LABEL_51:

        goto LABEL_52;
      }
      v46 = v17;
      v52 = v4;
      objc_msgSend(v18, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || *(_QWORD *)(v50 + 72) == 3)
      {
        objc_msgSend(v18, "containingBundleRecord");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "infoDictionary");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          -[NSObject objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("CacheDeleteInfo"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            CDGetLogHandle((uint64_t)"client");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v64 = (uint64_t)v24;
              _os_log_impl(&dword_1A3662000, v29, OS_LOG_TYPE_DEFAULT, "skipping CacheDelete extension: %@", buf, 0xCu);
            }

LABEL_49:
            v4 = v52;
            goto LABEL_50;
          }
        }
        v30 = v2;

        v45 = 1;
      }
      else
      {
        v30 = v2;
        v45 = 0;
        v24 = v22;
      }
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v25 = *(id *)(v50 + 40);
      v31 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v54;
        while (2)
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v54 != v33)
              objc_enumerationMutation(v25);
            if (objc_msgSend(v24, "containsString:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j)))
            {
              CDGetLogHandle((uint64_t)"client");
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v18, "bundleIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v64 = (uint64_t)v36;
                _os_log_impl(&dword_1A3662000, v27, OS_LOG_TYPE_DEFAULT, "skipping excluded App %@", buf, 0xCu);

              }
              v2 = v30;
              goto LABEL_49;
            }
          }
          v32 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          if (v32)
            continue;
          break;
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v47;
        if ((objc_msgSend(v18, "isPlaceholder") & 1) != 0)
          v44 = 1;
        else
          v44 = objc_msgSend(v18, "isSystemPlaceholder");
        v2 = v30;
      }
      else
      {
        v44 = 0;
        v2 = v30;
        v35 = v47;
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v35, 1, 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v4 = v52;
      if ((*(_BYTE *)(v50 + 80) & 2) != 0)
      {
        user_managed_assets_relative_path = container_get_user_managed_assets_relative_path();
        if (!user_managed_assets_relative_path)
        {
          CDGetLogHandle((uint64_t)"client");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v64 = (uint64_t)v52;
            _os_log_debug_impl(&dword_1A3662000, v27, OS_LOG_TYPE_DEBUG, "%@ does not have a user managed assets path, skipping", buf, 0xCu);
          }
LABEL_50:

          goto LABEL_51;
        }
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", user_managed_assets_relative_path, 1, v25);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v25)
      {
        v49 = v2;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v18);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        BYTE2(v43) = v45;
        BYTE1(v43) = v44;
        LOBYTE(v43) = v46;
        +[AppCache appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:](AppCache, "appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:", v40, v52, v25, v38, v7, *(_QWORD *)(v50 + 48), v43, *(_QWORD *)(v50 + 56));
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          (*(void (**)(void))(*(_QWORD *)(v50 + 64) + 16))();
        }
        else
        {
          CDGetLogHandle((uint64_t)"client");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v64 = (uint64_t)v18;
            _os_log_error_impl(&dword_1A3662000, v42, OS_LOG_TYPE_ERROR, "Unable to create AppCache for %@", buf, 0xCu);
          }

        }
        v2 = v49;
      }

      v20 = 0;
    }

LABEL_52:
    goto LABEL_53;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "data container path is not returned:", buf, 2u);
  }
LABEL_53:

  objc_autoreleasePoolPop(v2);
  return 1;
}

+ (void)enumerateAppCachesOnVolume:(id)a3 options:(int)a4 telemetry:(id)a5 block:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1A8591C18]();
  getRootVolume();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a1, "enumerateWithContainerQuery:container_class:options:telemetry:block:", v10, 2, v8, v11, v12);
    if ((v8 & 1) != 0)
      objc_msgSend(a1, "enumerateWithContainerQuery:container_class:options:telemetry:block:", v10, 4, v8, v11, v12);
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1A3662000, v15, OS_LOG_TYPE_ERROR, "No root volume, unable to enumerate apps!", v16, 2u);
    }

  }
  objc_autoreleasePoolPop(v13);

}

+ (void)enumerateGroupCachesOnVolume:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *empty;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  xpc_object_t v18;
  int iterate_results_sync;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A8591C18]();
  getRootVolume();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = container_query_create();
    v10 = v9;
    if (v5)
    {
      v24 = v6;
      v11 = v7;
      empty = xpc_array_create_empty();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = v5;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v13);
            v18 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i)), "UTF8String"));
            xpc_array_append_value(empty, v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v15);
      }

      v7 = v11;
      v6 = v24;
      if (v10)
        goto LABEL_11;
    }
    else
    {
      empty = 0;
      if (v9)
      {
LABEL_11:
        container_query_set_class();
        container_query_operation_set_flags();
        if (empty)
          container_query_set_group_identifiers();
        container_query_set_include_other_owners();
        v25 = v6;
        iterate_results_sync = container_query_iterate_results_sync();
        container_query_get_last_error();
        v20 = (void *)container_error_copy_unlocalized_description();
        CDGetLogHandle((uint64_t)"client");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (iterate_results_sync)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v31 = v20;
            _os_log_debug_impl(&dword_1A3662000, v22, OS_LOG_TYPE_DEBUG, "container_query_iterate_results_sync succeeded; %s",
              buf,
              0xCu);
          }
        }
        else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v31 = v20;
          _os_log_error_impl(&dword_1A3662000, v22, OS_LOG_TYPE_ERROR, "container_query_iterate_results_sync failed; %s",
            buf,
            0xCu);
        }

        free(v20);
        container_query_free();
        v23 = v25;
LABEL_24:

        goto LABEL_25;
      }
    }
    CDGetLogHandle((uint64_t)"client");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3662000, v23, OS_LOG_TYPE_DEFAULT, "container_query_create failed", buf, 2u);
    }
    goto LABEL_24;
  }
  CDGetLogHandle((uint64_t)"client");
  empty = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(empty, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A3662000, empty, OS_LOG_TYPE_ERROR, "No root volume, unable to enumerate apps!", buf, 2u);
  }
LABEL_25:

  objc_autoreleasePoolPop(v7);
}

uint64_t __47__AppCache_enumerateGroupCachesOnVolume_block___block_invoke(uint64_t a1)
{
  uint64_t path;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  path = container_get_path();
  if (path)
  {
    v3 = path;
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315138;
      v14 = v3;
      _os_log_debug_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEBUG, "group path: %s\n", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v3, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_retainAutorelease(v5);
    objc_msgSend(v6, "stringWithUTF8String:", objc_msgSend(v7, "fileSystemRepresentation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Library/Caches"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    if (size_dir((const char *)objc_msgSend(v10, "UTF8String")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", container_get_identifier());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
  return 1;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setBundleRecords:(id)a3
{
  objc_storeStrong((id *)&self->_bundleRecords, a3);
}

- (CacheDeleteVolume)cdVol
{
  return self->_cdVol;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isDataseparated
{
  return self->_isDataseparated;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (NSNumber)lastKnownCacheSize
{
  return self->_lastKnownCacheSize;
}

- (void)setLastKnownCacheSize:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownCacheSize, a3);
}

- (NSNumber)lastKnownGroupCacheSize
{
  return self->_lastKnownGroupCacheSize;
}

- (void)setLastKnownGroupCacheSize:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownGroupCacheSize, a3);
}

- (NSNumber)lastKnownTmpSize
{
  return self->_lastKnownTmpSize;
}

- (void)setLastKnownTmpSize:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownTmpSize, a3);
}

- (NSNumber)lastKnownFreespace
{
  return self->_lastKnownFreespace;
}

- (void)setLastKnownFreespace:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownFreespace, a3);
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsed, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (TestTelemetry)telemetry
{
  return self->_telemetry;
}

- (void)setTelemetry:(id)a3
{
  objc_storeStrong((id *)&self->_telemetry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_lastKnownFreespace, 0);
  objc_storeStrong((id *)&self->_lastKnownTmpSize, 0);
  objc_storeStrong((id *)&self->_lastKnownGroupCacheSize, 0);
  objc_storeStrong((id *)&self->_lastKnownCacheSize, 0);
  objc_storeStrong((id *)&self->_userManagedAssetsURL, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_cdVol, 0);
  objc_storeStrong((id *)&self->_bundleRecords, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
