@implementation MADownloadOptions

- (void)logOptions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[MADownloadOptions description](self, "description");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"-[MADownloadOptions logOptions]", CFSTR("The download options are %@"), v2, v3, v4, v5, (uint64_t)v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDirectory, 0);
  objc_storeStrong((id *)&self->_decryptionKey, 0);
  objc_storeStrong((id *)&self->_analyticsData, 0);
  objc_storeStrong((id *)&self->_downloadAuthorizationHeader, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_additionalServerParams, 0);
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t liveServerCatalogOnly;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  int64_t v18;
  _BOOL4 v19;
  void *v20;
  void *v21;

  v21 = (void *)MEMORY[0x1E0CB3940];
  v19 = -[MADownloadOptions allowsCellularAccess](self, "allowsCellularAccess");
  v18 = -[MADownloadOptions timeoutIntervalForResource](self, "timeoutIntervalForResource");
  v16 = -[MADownloadOptions canUseLocalCacheServer](self, "canUseLocalCacheServer");
  v15 = -[MADownloadOptions discretionary](self, "discretionary");
  v14 = -[MADownloadOptions disableUI](self, "disableUI");
  -[MADownloadOptions sessionId](self, "sessionId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADownloadOptions additionalServerParams](self, "additionalServerParams");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  stringWithoutNewlines((uint64_t)v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MADownloadOptions allowsExpensiveAccess](self, "allowsExpensiveAccess");
  v4 = -[MADownloadOptions requiresPowerPluggedIn](self, "requiresPowerPluggedIn");
  v5 = -[MADownloadOptions prefersInfraWiFi](self, "prefersInfraWiFi");
  if (self->_liveServerCatalogOnlyIsOverridden)
    liveServerCatalogOnly = self->_liveServerCatalogOnly;
  else
    liveServerCatalogOnly = 0xFFFFFFFFLL;
  -[MADownloadOptions downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("present");
  if (v7)
    v9 = CFSTR("present");
  else
    v9 = CFSTR("not present");
  -[MADownloadOptions analyticsData](self, "analyticsData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v8 = CFSTR("not present");
  objc_msgSend(v21, "stringWithFormat:", CFSTR("MADownloadOptions allowsCellular: %d resourceTimeout: %ld canUseCacheServer: %d discretionary: %d disableUI: %d sessionId: %@ additionalServerParams:%@ allowsExpensiveAccess:%d requiresPowerPluggedIn: %d prefersInfraWiFi: %d liveServerOnly: %d DownloadAuthorizationHeader: %@ analyticsData: %@ allowDaemonConnectionRetries: %d"), v19, v18, v16, v15, v14, v20, v3, v13, v4, v5, liveServerCatalogOnly, v9, v8, -[MADownloadOptions allowDaemonConnectionRetries](self, "allowDaemonConnectionRetries"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (int64_t)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (NSDictionary)analyticsData
{
  return self->_analyticsData;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (BOOL)disableUI
{
  return self->_disableUI;
}

- (BOOL)canUseLocalCacheServer
{
  return self->_canUseLocalCacheServer;
}

- (NSMutableDictionary)additionalServerParams
{
  return self->_additionalServerParams;
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (BOOL)prefersInfraWiFi
{
  return self->_prefersInfraWiFi;
}

- (NSString)downloadAuthorizationHeader
{
  return self->_downloadAuthorizationHeader;
}

- (BOOL)allowsExpensiveAccess
{
  return self->_allowsExpensiveAccess;
}

- (BOOL)allowDaemonConnectionRetries
{
  return self->_allowDaemonConnectionRetries;
}

- (void)setDownloadAuthorizationHeader:(id)a3
{
  objc_storeStrong((id *)&self->_downloadAuthorizationHeader, a3);
}

- (MADownloadOptions)initWithPlist:(id)a3
{
  id v4;
  MADownloadOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSData *decryptionKey;
  uint64_t v18;
  NSString *sourceDirectory;
  uint64_t v20;
  NSDictionary *analyticsData;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MADownloadOptions;
  v5 = -[MADownloadOptions init](&v23, sel_init);
  if (v5)
  {
    getPlistString(v4, CFSTR("SessionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADownloadOptions setSessionId:](v5, "setSessionId:", v6);

    getPlistData(v4, CFSTR("AdditionalServerParams"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v7, 0);
    plistDecodeClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v9, *MEMORY[0x1E0CB2CD0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      _MobileAssetLog(0, 6, (uint64_t)"-[MADownloadOptions initWithPlist:]", CFSTR("Invalid additionalServerParams; not a dictionary. Leaving as nil."),
        v11,
        v12,
        v13,
        v14,
        (uint64_t)v23.receiver);
    else
      -[MADownloadOptions setAdditionalServerParams:](v5, "setAdditionalServerParams:", v10);
    objc_msgSend(v8, "finishDecoding");
    v5->_allowsCellularAccess = getPlistNumberAsBool(v4, CFSTR("allowsCellularAccess"));
    v5->_allowsExpensiveAccess = getPlistNumberAsBool(v4, CFSTR("allowsExpensive"));
    v5->_requiresPowerPluggedIn = getPlistNumberAsBool(v4, CFSTR("requiresPowerPluggedIn"));
    v5->_prefersInfraWiFi = getPlistNumberAsBool(v4, CFSTR("prefersInfraWiFi"));
    getPlistNumber(v4, CFSTR("timeoutIntervalForResource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timeoutIntervalForResource = objc_msgSend(v15, "longValue");

    v5->_canUseLocalCacheServer = getPlistNumberAsBool(v4, CFSTR("canUseLocalCacheServer"));
    v5->_discretionary = getPlistNumberAsBool(v4, CFSTR("discretionary"));
    getPlistData(v4, CFSTR("decryptionKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    decryptionKey = v5->_decryptionKey;
    v5->_decryptionKey = (NSData *)v16;

    getPlistString(v4, CFSTR("sourceDirectory"));
    v18 = objc_claimAutoreleasedReturnValue();
    sourceDirectory = v5->_sourceDirectory;
    v5->_sourceDirectory = (NSString *)v18;

    v5->_allowDaemonConnectionRetries = getPlistNumberAsBool(v4, CFSTR("allowDaemonConnectionRetries"));
    v5->_liveServerCatalogOnly = getPlistNumberAsBool(v4, CFSTR("LiveServerOnly"));
    v5->_liveServerCatalogOnlyIsOverridden = getPlistNumberAsBool(v4, CFSTR("LiveServerOnlyIsOverridden"));
    getPlistDictionary(v4, CFSTR("AnalyticsData"));
    v20 = objc_claimAutoreleasedReturnValue();
    analyticsData = v5->_analyticsData;
    v5->_analyticsData = (NSDictionary *)v20;

  }
  return v5;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (void)setAdditionalServerParams:(id)a3
{
  objc_storeStrong((id *)&self->_additionalServerParams, a3);
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (void)setAllowsExpensiveAccess:(BOOL)a3
{
  self->_allowsExpensiveAccess = a3;
}

- (BOOL)liveServerCatalogOnly
{
  return self->_liveServerCatalogOnly;
}

- (MADownloadOptions)init
{
  MADownloadOptions *v2;
  MADownloadOptions *v3;
  NSMutableDictionary *additionalServerParams;
  NSString *sessionId;
  NSString *downloadAuthorizationHeader;
  NSData *decryptionKey;
  NSString *sourceDirectory;
  NSDictionary *analyticsData;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MADownloadOptions;
  v2 = -[MADownloadOptions init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_discretionary = 1;
    additionalServerParams = v2->_additionalServerParams;
    v2->_additionalServerParams = 0;

    sessionId = v3->_sessionId;
    v3->_sessionId = 0;

    *(_WORD *)&v3->_allowsCellularAccess = 0;
    v3->_timeoutIntervalForResource = -1;
    *(_DWORD *)&v3->_allowsExpensiveAccess = 65537;
    v3->_liveServerCatalogOnlyIsOverridden = 0;
    downloadAuthorizationHeader = v3->_downloadAuthorizationHeader;
    v3->_downloadAuthorizationHeader = 0;

    decryptionKey = v3->_decryptionKey;
    v3->_decryptionKey = 0;

    sourceDirectory = v3->_sourceDirectory;
    v3->_sourceDirectory = 0;

    analyticsData = v3->_analyticsData;
    v3->_analyticsData = 0;

    v3->_allowDaemonConnectionRetries = 0;
  }
  return v3;
}

- (void)setTimeoutIntervalForResource:(int64_t)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (id)encodeAsPlist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSData *decryptionKey;
  NSString *sourceDirectory;
  void *v14;
  void *v15;
  void *v16;
  NSString *sessionId;
  void *v18;
  void *v19;

  v3 = (void *)objc_opt_new();
  if (self->_additionalServerParams)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_additionalServerParams, 1, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("AdditionalServerParams"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsCellularAccess);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("allowsCellularAccess"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsExpensiveAccess);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("allowsExpensive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresPowerPluggedIn);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("requiresPowerPluggedIn"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prefersInfraWiFi);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("prefersInfraWiFi"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_timeoutIntervalForResource);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("timeoutIntervalForResource"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canUseLocalCacheServer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("canUseLocalCacheServer"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_discretionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("discretionary"));

  decryptionKey = self->_decryptionKey;
  if (decryptionKey)
    objc_msgSend(v3, "setValue:forKey:", decryptionKey, CFSTR("decryptionKey"));
  sourceDirectory = self->_sourceDirectory;
  if (sourceDirectory)
    objc_msgSend(v3, "setValue:forKey:", sourceDirectory, CFSTR("sourceDirectory"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowDaemonConnectionRetries);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v14, CFSTR("allowDaemonConnectionRetries"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_liveServerCatalogOnly);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("LiveServerOnly"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_liveServerCatalogOnlyIsOverridden);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("LiveServerOnlyIsOverridden"));

  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setValue:forKey:", sessionId, CFSTR("SessionId"));
  -[MADownloadOptions analyticsData](self, "analyticsData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MADownloadOptions analyticsData](self, "analyticsData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("AnalyticsData"));

  }
  return v3;
}

- (BOOL)liveServerCatalogOnlyIsOverridden
{
  return self->_liveServerCatalogOnlyIsOverridden;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADownloadOptions)initWithCoder:(id)a3
{
  id v4;
  MADownloadOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSData *decryptionKey;
  uint64_t v25;
  NSString *sourceDirectory;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  objc_super v37;
  _QWORD v38[9];

  v38[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MADownloadOptions;
  v5 = -[MADownloadOptions init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SessionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADownloadOptions setSessionId:](v5, "setSessionId:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AdditionalServerParams"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v7, 0);
    plistDecodeClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v9, *MEMORY[0x1E0CB2CD0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      _MobileAssetLog(0, 6, (uint64_t)"-[MADownloadOptions initWithCoder:]", CFSTR("Invalid additionalServerParams; not a dictionary. Leaving as nil."),
        v11,
        v12,
        v13,
        v14,
        v36);
    else
      -[MADownloadOptions setAdditionalServerParams:](v5, "setAdditionalServerParams:", v10);
    objc_msgSend(v8, "finishDecoding");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsCellularAccess"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsCellularAccess = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsExpensive"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsExpensiveAccess = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiresPowerPluggedIn"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requiresPowerPluggedIn = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prefersInfraWiFi"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_prefersInfraWiFi = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeoutIntervalForResource"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timeoutIntervalForResource = objc_msgSend(v19, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("canUseLocalCacheServer"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canUseLocalCacheServer = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discretionary"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_discretionary = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disableUI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_disableUI = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("decryptionKey"));
    v23 = objc_claimAutoreleasedReturnValue();
    decryptionKey = v5->_decryptionKey;
    v5->_decryptionKey = (NSData *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceDirectory"));
    v25 = objc_claimAutoreleasedReturnValue();
    sourceDirectory = v5->_sourceDirectory;
    v5->_sourceDirectory = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowDaemonConnectionRetries"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowDaemonConnectionRetries = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LiveServerOnly"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_liveServerCatalogOnly = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LiveServerOnlyIsOverridden"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_liveServerCatalogOnlyIsOverridden = objc_msgSend(v29, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DownloadAuthorizationHeader"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADownloadOptions setDownloadAuthorizationHeader:](v5, "setDownloadAuthorizationHeader:", v30);

    v31 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    v38[3] = objc_opt_class();
    v38[4] = objc_opt_class();
    v38[5] = objc_opt_class();
    v38[6] = objc_opt_class();
    v38[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithArray:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("AnalyticsData"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADownloadOptions setAnalyticsData:](v5, "setAnalyticsData:", v34);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSData *decryptionKey;
  NSString *sourceDirectory;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *sessionId;
  void *v20;
  id v21;

  v21 = a3;
  if (self->_additionalServerParams)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_additionalServerParams, 1, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "encodeObject:forKey:", v4, CFSTR("AdditionalServerParams"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsCellularAccess);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v5, CFSTR("allowsCellularAccess"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsExpensiveAccess);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v6, CFSTR("allowsExpensive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresPowerPluggedIn);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v7, CFSTR("requiresPowerPluggedIn"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prefersInfraWiFi);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v8, CFSTR("prefersInfraWiFi"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_timeoutIntervalForResource);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v9, CFSTR("timeoutIntervalForResource"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canUseLocalCacheServer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v10, CFSTR("canUseLocalCacheServer"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_discretionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v11, CFSTR("discretionary"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disableUI);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v12, CFSTR("disableUI"));

  decryptionKey = self->_decryptionKey;
  if (decryptionKey)
    objc_msgSend(v21, "encodeObject:forKey:", decryptionKey, CFSTR("decryptionKey"));
  sourceDirectory = self->_sourceDirectory;
  if (sourceDirectory)
    objc_msgSend(v21, "encodeObject:forKey:", sourceDirectory, CFSTR("sourceDirectory"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowDaemonConnectionRetries);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v15, CFSTR("allowDaemonConnectionRetries"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_liveServerCatalogOnly);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v16, CFSTR("LiveServerOnly"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_liveServerCatalogOnlyIsOverridden);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v17, CFSTR("LiveServerOnlyIsOverridden"));

  -[MADownloadOptions downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v18, CFSTR("DownloadAuthorizationHeader"));

  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v21, "encodeObject:forKey:", sessionId, CFSTR("SessionId"));
  -[MADownloadOptions analyticsData](self, "analyticsData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v20, CFSTR("AnalyticsData"));

}

- (void)setLiveServerCatalogOnly:(BOOL)a3
{
  self->_liveServerCatalogOnly = a3;
  self->_liveServerCatalogOnlyIsOverridden = 1;
}

- (id)tightSummaryIncludingAdditional:(BOOL)a3
{
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;

  v29 = a3;
  v28 = (void *)MEMORY[0x1E0CB3940];
  if (-[MADownloadOptions discretionary](self, "discretionary"))
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  if (-[MADownloadOptions allowsCellularAccess](self, "allowsCellularAccess"))
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  if (-[MADownloadOptions allowsExpensiveAccess](self, "allowsExpensiveAccess"))
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  if (-[MADownloadOptions requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  if (-[MADownloadOptions canUseLocalCacheServer](self, "canUseLocalCacheServer"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  if (-[MADownloadOptions prefersInfraWiFi](self, "prefersInfraWiFi"))
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  v10 = CFSTR("Y");
  if (!-[MADownloadOptions liveServerCatalogOnly](self, "liveServerCatalogOnly"))
  {
    if (-[MADownloadOptions liveServerCatalogOnlyIsOverridden](self, "liveServerCatalogOnlyIsOverridden"))
      v10 = CFSTR("Y");
    else
      v10 = CFSTR("N");
  }
  if (-[MADownloadOptions allowDaemonConnectionRetries](self, "allowDaemonConnectionRetries"))
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  objc_msgSend(v28, "stringWithFormat:", CFSTR("disc:%@,cell:%@,expen:%@,power:%@,cache:%@,pwifi:%@,live:%@,retry:%@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[MADownloadOptions additionalServerParams](self, "additionalServerParams");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[MADownloadOptions additionalServerParams](self, "additionalServerParams");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        -[MADownloadOptions sessionId](self, "sessionId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x1E0CB3940];
        -[MADownloadOptions additionalServerParams](self, "additionalServerParams");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        stringWithoutNewlines((uint64_t)v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v17)
        {
          -[MADownloadOptions sessionId](self, "sessionId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("%@,+%@,ssn:%@"), v12, v21, v22);
          v23 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v23;
        }
        else
        {
          objc_msgSend(v18, "stringWithFormat:", CFSTR("%@,+%@"), v12, v20);
          v27 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v27;
        }
        goto LABEL_33;
      }
    }
  }
  -[MADownloadOptions sessionId](self, "sessionId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    -[MADownloadOptions sessionId](self, "sessionId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@,ssn:%@"), v12, v19);
    v21 = v12;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

  }
  return v12;
}

- (void)setCanUseLocalCacheServer:(BOOL)a3
{
  self->_canUseLocalCacheServer = a3;
}

- (void)setDisableUI:(BOOL)a3
{
  self->_disableUI = a3;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
}

- (void)setPrefersInfraWiFi:(BOOL)a3
{
  self->_prefersInfraWiFi = a3;
}

- (void)setLiveServerCatalogOnlyIsOverridden:(BOOL)a3
{
  self->_liveServerCatalogOnlyIsOverridden = a3;
}

- (void)setAnalyticsData:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsData, a3);
}

- (NSData)decryptionKey
{
  return self->_decryptionKey;
}

- (void)setDecryptionKey:(id)a3
{
  objc_storeStrong((id *)&self->_decryptionKey, a3);
}

- (NSString)sourceDirectory
{
  return self->_sourceDirectory;
}

- (void)setSourceDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDirectory, a3);
}

- (void)setAllowDaemonConnectionRetries:(BOOL)a3
{
  self->_allowDaemonConnectionRetries = a3;
}

@end
