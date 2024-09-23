@implementation GEOUserSession

- (void)shortSessionValues:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_shortNavSessionLock);
  -[GEOUserSession _shortSessionValues:](self, "_shortSessionValues:", v4);
  os_unfair_lock_unlock(&self->_shortNavSessionLock);

}

- (void)_shortSessionValues:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL8 v6;
  double *v7;
  double shortSessionStartTime;
  GEOSessionID *v9;
  NSObject *v10;
  unint64_t v11;
  __int16 v12[8];
  _QWORD v13[7];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  GEOSessionID *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  if (self->_shortNavSessionNeedsInit)
  {
    -[GEOUserSession _initializeShortAndNavData](self, "_initializeShortAndNavData");
    self->_shortNavSessionNeedsInit = 0;
  }
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v28 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __38__GEOUserSession__shortSessionValues___block_invoke;
  v24[3] = &unk_1E1C10930;
  v24[4] = &v25;
  -[GEOUserSession _currentTimeResult:](self, "_currentTimeResult:", v24);
  if (-[GEOUserSession _updateNavSessionIDAtTime:](self, "_updateNavSessionIDAtTime:", v26[3]))
    -[GEOUserSession _resetShortSessionID](self, "_resetShortSessionID");
  v18 = 0;
  v19 = (GEOSessionID *)&v18;
  v20 = 0x3010000000;
  v22 = 0;
  v23 = 0;
  v21 = "";
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = -[GEOUserSession shouldSuppressSession](self, "shouldSuppressSession");
  if (self->_shareSessionWithMaps)
  {
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __38__GEOUserSession__shortSessionValues___block_invoke_2;
    v13[3] = &unk_1E1C15998;
    v13[4] = &v18;
    v13[5] = &v14;
    v13[6] = &v25;
    -[GEOUserSession _mapsShortSessionValues:](self, "_mapsShortSessionValues:", v13);
    v7 = v26;
    shortSessionStartTime = v15[3];
    v9 = v19;
  }
  else
  {
    v7 = v26;
    if (v26[3] > self->_shortSessionStartTime + 900.0)
    {
      GEOGetUserSessionLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12[0] = 0;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "creating new short session data", (uint8_t *)v12, 2u);
      }

      self->_shortSessionID._high = objc_msgSend((id)objc_opt_class(), "_newSessionId");
      self->_shortSessionID._low = v11;
      v7 = v26;
      self->_shortSessionStartTime = v26[3];
    }
    v9 = v19;
    v19[2] = self->_shortSessionID;
    shortSessionStartTime = self->_shortSessionStartTime;
    v15[3] = shortSessionStartTime;
  }
  (*((void (**)(id, unint64_t, unint64_t, _QWORD, _QWORD, _QWORD, _BOOL8))v4 + 2))(v4, v9[2]._high, v9[2]._low, ((v7[3] - shortSessionStartTime) * 10000.0), 0, 0, v6);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v25, 8);

}

- (BOOL)shouldSuppressSession
{
  void *v2;
  char BOOL;

  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isInternalInstall") & 1) != 0)
  {

    return 1;
  }
  BOOL = GEOConfigGetBOOL(GeoUserSessionConfig_ChildSuppressionEnabled, (uint64_t)off_1EDF49BA0);

  return (BOOL & 1) != 0;
}

- (void)_currentTimeResult:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[GEOReferenceTimeManager sharedManager](GEOReferenceTimeManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceTimeResult:", v3);

}

- (BOOL)_updateNavSessionIDAtTime:(double)a3
{
  double navigationSessionStartTime;
  _BOOL4 v5;
  NSObject *v7;
  void *v8;
  double v9;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  navigationSessionStartTime = self->_navigationSessionStartTime;
  v5 = a3 - navigationSessionStartTime >= 10800.0 && navigationSessionStartTime != 0.0;
  if (v5)
  {
    GEOGetUserSessionLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      GEOSessionIDDescription(&self->_navigationSessionID._high);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_navigationSessionStartTime;
      v11 = 138478339;
      v12 = v8;
      v13 = 2049;
      v14 = v9;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "NavSessionID %{private}@ expired: startTime %{private}f, currentTime=%f", (uint8_t *)&v11, 0x20u);

    }
    -[GEOUserSession _generateNewNavSessionIDAtTime:](self, "_generateNewNavSessionIDAtTime:", a3);
  }
  return v5;
}

- (void)_initializeShortAndNavData
{
  NSData *navigationDirectionsID;
  NSData *previousNavigationDirectionsID;

  self->_shortSessionID = self->_zeroSessionID;
  self->_shortSessionStartTime = 0.0;
  navigationDirectionsID = self->_navigationDirectionsID;
  self->_navigationDirectionsID = 0;

  self->_navigationSessionID = self->_zeroSessionID;
  previousNavigationDirectionsID = self->_previousNavigationDirectionsID;
  self->_navigationSessionStartTime = 0.0;
  self->_previousNavigationDirectionsID = 0;

  self->_previousNavigationSessionID = self->_zeroSessionID;
}

+ (GEOSessionID)_newSessionId
{
  id v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  GEOSessionID result;

  v5 = 0;
  v6 = 0;
  v2 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v2, "getUUIDBytes:", &v5);

  v3 = v5;
  v4 = v6;
  result._low = v4;
  result._high = v3;
  return result;
}

+ (id)sharedInstance
{
  if (qword_1ECDBCA38 != -1)
    dispatch_once(&qword_1ECDBCA38, &__block_literal_global_181);
  return (id)_MergedGlobals_316;
}

uint64_t __38__GEOUserSession__shortSessionValues___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (void)setInitialShareSessionWithMaps:(BOOL)a3
{
  _initialShareSessionWithMaps = a3;
}

void __32__GEOUserSession_sharedInstance__block_invoke()
{
  GEOUserSession *v0;
  void *v1;

  v0 = objc_alloc_init(GEOUserSession);
  v1 = (void *)_MergedGlobals_316;
  _MergedGlobals_316 = (uint64_t)v0;

}

- (GEOUserSession)init
{
  GEOUserSession *v2;
  GEOUserSession *v3;
  BOOL v4;
  uint64_t v5;
  OS_dispatch_queue *serialQueue;
  OS_dispatch_queue *v7;
  GEOUserSession *v8;
  uint64_t v9;
  id shortSessionListener;
  NSObject *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int16 v14;
  _QWORD v15[4];
  GEOUserSession *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)GEOUserSession;
  v2 = -[GEOUserSession init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shortNavSessionLock._os_unfair_lock_opaque = 0;
    v2->_longSessionLock._os_unfair_lock_opaque = 0;
    v4 = 1;
    v2->_shortNavSessionNeedsInit = 1;
    v2->_longSessionNeedsInit = 1;
    v5 = geo_dispatch_queue_create();
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v5;

    v3->_zeroSessionID._high = 0;
    v3->_zeroSessionID._low = 0;
    if ((objc_msgSend((id)objc_opt_class(), "initialShareSessionWithMaps") & 1) == 0)
      v4 = +[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod");
    v3->_shareSessionWithMaps = v4;
    v3->_fifteenMoDeviceSessionLock._os_unfair_lock_opaque = 0;
    v7 = v3->_serialQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __22__GEOUserSession_init__block_invoke;
    v15[3] = &unk_1E1C158D0;
    v8 = v3;
    v16 = v8;
    _GEOConfigAddBlockListenerForKey(GeoUserSessionConfig_ShortSessionDataByAppID, (uint64_t)off_1EDF49B90, v7, v15);
    v9 = objc_claimAutoreleasedReturnValue();
    shortSessionListener = v8->_shortSessionListener;
    v8->_shortSessionListener = (id)v9;

    GEOGetUserSessionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 0;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "new instance", (uint8_t *)&v14, 2u);
    }

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)onLocationServicesResetNotification, CFSTR("com.apple.Preferences.ResetPrivacyWarningsNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  return v3;
}

+ (BOOL)initialShareSessionWithMaps
{
  return _initialShareSessionWithMaps;
}

+ (id)highBytesStringFromSession:(GEOSessionID)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*llu"), a3._low, 20, a3._high);
}

+ (id)lowBytesStringFromSession:(GEOSessionID)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*llu"), 20, a3._low);
}

void __22__GEOUserSession_init__block_invoke(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_updateSharedSessionDataByAppId");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)_initializeLongSessionData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  NSMutableDictionary *longSessionByAppID;
  NSMutableDictionary **p_longSessionByAppID;
  id v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  __int128 *p_buf;
  _QWORD v23[5];
  id v24;
  __int128 buf;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[GEOUserSession _getPersistedLongSessionData](self, "_getPersistedLongSessionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    v24 = 0;
    objc_msgSend(v4, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v5, objc_opt_class(), v3, &v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;
    v8 = v7;
    if (v6)
    {

      v9 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
      goto LABEL_8;
    }
    GEOGetUserSessionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "unarchival error %@", (uint8_t *)&buf, 0xCu);
    }

  }
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = 0;
LABEL_8:
  p_longSessionByAppID = &self->_longSessionByAppID;
  longSessionByAppID = self->_longSessionByAppID;
  self->_longSessionByAppID = v9;

  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x2020000000;
  v14 = MEMORY[0x1E0C809B0];
  v27 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __44__GEOUserSession__initializeLongSessionData__block_invoke;
  v23[3] = &unk_1E1C10930;
  v23[4] = &buf;
  -[GEOUserSession _currentTimeResult:](self, "_currentTimeResult:", v23);
  v15 = self->_longSessionByAppID;
  v17 = v14;
  v18 = 3221225472;
  v19 = __44__GEOUserSession__initializeLongSessionData__block_invoke_2;
  v20 = &unk_1E1C158F8;
  p_buf = &buf;
  v16 = v13;
  v21 = v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", &v17);
  if (objc_msgSend(v16, "count", v17, v18, v19, v20))
    -[NSMutableDictionary removeObjectsForKeys:](*p_longSessionByAppID, "removeObjectsForKeys:", v16);

  _Block_object_dispose(&buf, 8);
}

uint64_t __44__GEOUserSession__initializeLongSessionData__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __44__GEOUserSession__initializeLongSessionData__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  id v7;

  v7 = a2;
  v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(a3, "createTime");
  if (v5 > v6 + 2592000.0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (void)_accessLongSessionValuesInBlock:(id)a3
{
  unsigned int (**v4)(id, NSMutableDictionary *);
  os_unfair_lock_s *p_longSessionLock;
  NSMutableDictionary *longSessionByAppID;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, NSMutableDictionary *))a3;
  p_longSessionLock = &self->_longSessionLock;
  os_unfair_lock_lock(&self->_longSessionLock);
  if (self->_longSessionNeedsInit)
  {
    -[GEOUserSession _initializeLongSessionData](self, "_initializeLongSessionData");
    self->_longSessionNeedsInit = 0;
  }
  if (v4[2](v4, self->_longSessionByAppID))
  {
    longSessionByAppID = self->_longSessionByAppID;
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", longSessionByAppID, 1, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (v7)
    {
      -[GEOUserSession _setPersistedLongSessionData:](self, "_setPersistedLongSessionData:", v7);
      _setValue(GeoUserSessionConfig_LongSessionDataByAppID, (uint64_t)off_1EDF49B80, v7, 1, 0);
    }
    else
    {
      GEOGetUserSessionLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "archival error %@", buf, 0xCu);
      }

    }
  }
  os_unfair_lock_unlock(p_longSessionLock);

}

- (void)longSessionValuesForAppId:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  double v16;
  double v17;
  id v18;
  _QWORD block[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  double v25;
  double v26;
  _QWORD v27[4];
  id v28;
  GEOUserSession *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  _QWORD v34[5];
  uint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;

  v8 = a4;
  v9 = a5;
  -[GEOUserSession longSessionAppIdForActualAppId:](self, "longSessionAppIdForActualAppId:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3010000000;
  v51 = 0;
  v52 = 0;
  v50 = "";
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v38 = 0;
  v12 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_2;
    v27[3] = &unk_1E1C15920;
    v28 = v10;
    v29 = self;
    v30 = &v35;
    v31 = &v47;
    v32 = &v43;
    v33 = &v39;
    -[GEOUserSession _accessLongSessionValuesInBlock:](self, "_accessLongSessionValuesInBlock:", v27);

  }
  else
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke;
    v34[3] = &unk_1E1C10930;
    v34[4] = &v35;
    -[GEOUserSession _currentTimeResult:](self, "_currentTimeResult:", v34);
    v44[3] = v36[3];
    v13 = objc_msgSend((id)objc_opt_class(), "_newSessionId");
    v14 = v48;
    v48[4] = v13;
    v14[5] = v15;
    *((_DWORD *)v40 + 6) = -1;
  }
  v16 = v36[3];
  block[1] = 3221225472;
  v17 = v44[3];
  block[0] = v12;
  block[2] = __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_18;
  block[3] = &unk_1E1C15948;
  v20 = v9;
  v21 = &v35;
  v22 = &v47;
  v23 = &v43;
  v25 = floor(v16 / 60.0) * 60.0;
  v26 = v16 - v17;
  v24 = &v39;
  v18 = v9;
  dispatch_async(v8, block);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

}

uint64_t __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

BOOL __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  GEOAPSessionData *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[5];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (GEOAPSessionData *)v4;
  if (!v4)
  {
    v6 = *(void **)(a1 + 32);
    +[GEOUserSession mapsUnifiedBundleId](GEOUserSession, "mapsUnifiedBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    v5 = objc_alloc_init(GEOAPSessionData);
    if ((v8 & 1) != 0)
      v9 = 0;
    else
      v9 = objc_msgSend(*(id *)(a1 + 32), "hash");
    -[GEOAPSessionData setOpaqueAppId:](v5, "setOpaqueAppId:", v9);
    GEOGetUserSessionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138478083;
      v30 = v11;
      v31 = 1025;
      v32 = -[GEOAPSessionData opaqueAppId](v5, "opaqueAppId");
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "creating new long session for '%{private}@' with opaqueID %{private}u", buf, 0x12u);
    }

    -[GEOAPSessionData setCreateTime:](v5, "setCreateTime:", 0.0);
    if (*(_QWORD *)(a1 + 32))
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5);
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_16;
  v28[3] = &unk_1E1C10930;
  v12 = *(void **)(a1 + 40);
  v28[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v12, "_currentTimeResult:", v28);
  v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  -[GEOAPSessionData createTime](v5, "createTime");
  v15 = v14 + 2592000.0;
  if (v13 > v14 + 2592000.0)
  {
    GEOGetUserSessionLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      v30 = v17;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "long session expired for '%{private}@'", buf, 0xCu);
    }

    v18 = objc_msgSend((id)objc_opt_class(), "_newSessionId");
    -[GEOAPSessionData setSessionId:](v5, "setSessionId:", v18, v19);
    -[GEOAPSessionData setCreateTime:](v5, "setCreateTime:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    if (!v4)
    {
      v20 = arc4random_uniform(0x1Eu);
      -[GEOAPSessionData createTime](v5, "createTime");
      -[GEOAPSessionData setCreateTime:](v5, "setCreateTime:", v21 - (double)(86400 * v20));
      GEOGetUserSessionLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v20;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_DEBUG, "applying create time offset of %u days", buf, 8u);
      }

    }
  }
  v23 = -[GEOAPSessionData sessionId](v5, "sessionId");
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v24 + 32) = v23;
  *(_QWORD *)(v24 + 40) = v25;
  -[GEOAPSessionData createTime](v5, "createTime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v26;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -[GEOAPSessionData opaqueAppId](v5, "opaqueAppId");

  return v13 > v15;
}

uint64_t __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_16(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)fifteenMonthDeviceSessionValues:(id)a3
{
  os_unfair_lock_s *p_fifteenMoDeviceSessionLock;
  void (**v5)(id, uint64_t, uint64_t, _QWORD, uint64_t, double, double, double, double);
  double v6;
  double v7;
  unint64_t v8;
  GEOAPSessionData *fifteenMoDeviceSessionData;
  GEOAPSessionData *v10;
  GEOAPSessionData *v11;
  GEOAPSessionData *v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  GEOAPSessionData *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  GEOAPSessionData *v39;
  GEOAPSessionData *v40;
  GEOAPSessionData *v41;
  uint8_t buf[16];

  p_fifteenMoDeviceSessionLock = &self->_fifteenMoDeviceSessionLock;
  v5 = (void (**)(id, uint64_t, uint64_t, _QWORD, uint64_t, double, double, double, double))a3;
  os_unfair_lock_lock(p_fifteenMoDeviceSessionLock);
  -[GEOUserSession _currentTime](self, "_currentTime");
  v7 = v6;
  v8 = -[GEOUserSession _get15moDeviceSessionConfiguredEpoch](self, "_get15moDeviceSessionConfiguredEpoch");
  fifteenMoDeviceSessionData = self->_fifteenMoDeviceSessionData;
  if (fifteenMoDeviceSessionData)
  {
    v10 = fifteenMoDeviceSessionData;
  }
  else
  {
    -[GEOUserSession _get15moDeviceSessionData](self, "_get15moDeviceSessionData");
    v11 = (GEOAPSessionData *)objc_claimAutoreleasedReturnValue();
    v12 = self->_fifteenMoDeviceSessionData;
    self->_fifteenMoDeviceSessionData = v11;

    v10 = self->_fifteenMoDeviceSessionData;
    if (!v10)
    {
      v18 = 0;
      goto LABEL_9;
    }
  }
  v39 = v10;
  if (v8 == -[GEOAPSessionData sessionEpoch](v10, "sessionEpoch"))
  {
    -[GEOAPSessionData createTime](v39, "createTime");
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v13 + 39398400.0);
    v15 = objc_alloc(MEMORY[0x1E0C99D48]);
    v16 = (void *)objc_msgSend(v15, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(v16, "components:fromDate:", 12, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 1;
    objc_msgSend(v17, "setDay:", 1);
    objc_msgSend(v16, "dateFromComponents:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    v21 = v20;

    v10 = v39;
    if (v21 > v7)
      goto LABEL_16;
  }
  else
  {
    v18 = 1;
    v10 = v39;
  }
LABEL_9:
  v40 = v10;
  v22 = 0.0;
  if (-[GEOAPSessionData hasMapsUserStartDate](v10, "hasMapsUserStartDate"))
  {
    -[GEOAPSessionData mapsUserStartDate](v40, "mapsUserStartDate");
    v22 = v23;
  }
  GEOGetUserSessionLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_DEBUG, "creating new feature quality session data", buf, 2u);
  }

  v25 = objc_alloc_init(GEOAPSessionData);
  -[GEOAPSessionData setCreateTime:](v25, "setCreateTime:", v7);
  v26 = objc_msgSend((id)objc_opt_class(), "_newSessionId");
  -[GEOAPSessionData setSessionId:](v25, "setSessionId:", v26, v27);
  -[GEOAPSessionData setSessionEpoch:](v25, "setSessionEpoch:", v8);
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "hardwareClass");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAPSessionData setOriginHardwareClass:](v25, "setOriginHardwareClass:", v29);

  -[GEOAPSessionData setSessionHasRotated:](v25, "setSessionHasRotated:", v18);
  if (v22 != 0.0)
    -[GEOAPSessionData setMapsUserStartDate:](v25, "setMapsUserStartDate:", v22);
  GEOConfigSetBOOL(GeoUserSessionConfig_NeedsFallbackRegions, (uint64_t)off_1EDF49B70);

  objc_storeStrong((id *)&self->_fifteenMoDeviceSessionData, v25);
  -[GEOUserSession _set15moDeviceSessionData:](self, "_set15moDeviceSessionData:", v25);
  v10 = v25;
LABEL_16:
  v41 = v10;
  os_unfair_lock_unlock(p_fifteenMoDeviceSessionLock);
  -[GEOAPSessionData createTime](v41, "createTime");
  v31 = floor(floor(v7 - v30) / 86400.0) * 86400.0;
  v32 = -[GEOAPSessionData sessionEpoch](v41, "sessionEpoch");
  v33 = -[GEOAPSessionData sessionId](v41, "sessionId");
  v35 = v34;
  -[GEOAPSessionData createTime](v41, "createTime");
  v37 = v36;
  -[GEOAPSessionData mapsUserStartDate](v41, "mapsUserStartDate");
  v5[2](v5, v32, v33, v35, -[GEOAPSessionData sessionHasRotated](v41, "sessionHasRotated"), v7, v37, v31, v38);

}

- (void)shortAndNavSessionValues:(id)a3
{
  id v4;
  char v5;
  _QWORD v6[15];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double *v48;
  uint64_t v49;
  uint64_t v50;

  v4 = a3;
  v47 = 0;
  v48 = (double *)&v47;
  v49 = 0x2020000000;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3010000000;
  v45 = 0;
  v46 = 0;
  v44 = "";
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3010000000;
  v27 = 0;
  v28 = 0;
  v26 = "";
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  os_unfair_lock_lock(&self->_shortNavSessionLock);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__GEOUserSession_shortAndNavSessionValues___block_invoke;
  v6[3] = &unk_1E1C15970;
  v6[6] = &v41;
  v6[7] = &v37;
  v6[8] = &v33;
  v6[9] = &v29;
  v6[10] = &v23;
  v6[4] = self;
  v6[5] = &v47;
  v6[11] = &v19;
  v6[12] = &v15;
  v6[13] = &v11;
  v6[14] = &v7;
  -[GEOUserSession _shortSessionValues:](self, "_shortSessionValues:", v6);
  os_unfair_lock_unlock(&self->_shortNavSessionLock);
  v5 = *((_BYTE *)v8 + 24);
  (*((void (**)(id, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, double, double, double, double, char))v4
   + 2))(v4, v42[4], v42[5], *((unsigned int *)v30 + 6), v24[4], v24[5], *((unsigned __int8 *)v16 + 24), *((unsigned __int8 *)v12 + 24), v48[3], v38[3], v34[3], v20[3], v5);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

}

_QWORD *__43__GEOUserSession_shortAndNavSessionValues___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, int a4, char a5, char a6, char a7, double a8, double a9, double a10)
{
  uint64_t v10;
  double v11;
  double v12;

  *(double *)(*(_QWORD *)(result[5] + 8) + 24) = a8;
  v10 = *(_QWORD *)(result[6] + 8);
  *(_QWORD *)(v10 + 32) = a2;
  *(_QWORD *)(v10 + 40) = a3;
  *(double *)(*(_QWORD *)(result[7] + 8) + 24) = a9;
  *(double *)(*(_QWORD *)(result[8] + 8) + 24) = a10;
  *(_DWORD *)(*(_QWORD *)(result[9] + 8) + 24) = a4;
  *(_OWORD *)(*(_QWORD *)(result[10] + 8) + 32) = *(_OWORD *)(result[4] + 80);
  v11 = *(double *)(result[4] + 96);
  v12 = 0.0;
  if (v11 != 0.0)
    v12 = *(double *)(*(_QWORD *)(result[5] + 8) + 24) - v11;
  *(double *)(*(_QWORD *)(result[11] + 8) + 24) = v12;
  *(_BYTE *)(*(_QWORD *)(result[12] + 8) + 24) = a5;
  *(_BYTE *)(*(_QWORD *)(result[13] + 8) + 24) = a6;
  *(_BYTE *)(*(_QWORD *)(result[14] + 8) + 24) = a7;
  return result;
}

- (void)setShareSessionWithMaps:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_shortNavSessionLock;
  NSObject *v6;
  const char *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  p_shortNavSessionLock = &self->_shortNavSessionLock;
  os_unfair_lock_lock(&self->_shortNavSessionLock);
  if (self->_shortNavSessionNeedsInit)
  {
    -[GEOUserSession _initializeShortAndNavData](self, "_initializeShortAndNavData");
    self->_shortNavSessionNeedsInit = 0;
  }
  GEOGetUserSessionLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = "no";
    if (v3)
      v8 = "yes";
    else
      v8 = "no";
    if (self->_shareSessionWithMaps)
      v7 = "yes";
    v9 = 136315394;
    v10 = v8;
    v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "setting maps share state to %s; previous state %s",
      (uint8_t *)&v9,
      0x16u);
  }

  if (self->_shareSessionWithMaps != v3)
    self->_shortSessionStartTime = 0.0;
  self->_shareSessionWithMaps = v3;
  os_unfair_lock_unlock(p_shortNavSessionLock);
}

- (id)_updateSharedSessionDataByAppId
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSDictionary *v6;
  id v7;
  NSDictionary *shortSessionByAppID;
  NSDictionary *v9;
  id v11;

  _getValue(GeoUserSessionConfig_ShortSessionDataByAppID, (uint64_t)off_1EDF49B90, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    v11 = 0;
    objc_msgSend(v4, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v5, objc_opt_class(), v3, &v11);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    shortSessionByAppID = self->_shortSessionByAppID;
    self->_shortSessionByAppID = v6;

    v9 = self->_shortSessionByAppID;
  }
  else
  {
    v9 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

- (NSDictionary)_sharedSessionDataByAppId
{
  NSDictionary *shortSessionByAppID;

  shortSessionByAppID = self->_shortSessionByAppID;
  if (shortSessionByAppID)
    return shortSessionByAppID;
  -[GEOUserSession _updateSharedSessionDataByAppId](self, "_updateSharedSessionDataByAppId");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_saveSharedSessionDataByAppId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  objc_storeStrong((id *)&self->_shortSessionByAppID, a3);
  v4 = a3;
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _setValue(GeoUserSessionConfig_ShortSessionDataByAppID, (uint64_t)off_1EDF49B90, v5, 1, 0);

}

- (void)_mapsShortSessionValues:(id)a3
{
  double v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  GEOAPSessionData *v10;
  double v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  GEOAPSessionData *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  GEOUserSession *v39;
  void (**v40)(id, uint64_t, _QWORD, double, double);
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  uint64_t v47;
  double *v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t buf[4];
  NSObject *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  double v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v40 = (void (**)(id, uint64_t, _QWORD, double, double))a3;
  v47 = 0;
  v48 = (double *)&v47;
  v49 = 0x2020000000;
  v50 = 0;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __42__GEOUserSession__mapsShortSessionValues___block_invoke;
  v46[3] = &unk_1E1C10930;
  v46[4] = &v47;
  -[GEOUserSession _currentTimeResult:](self, "_currentTimeResult:", v46);
  v4 = v48[3];
  v39 = self;
  -[GEOUserSession _sharedSessionDataByAppId](self, "_sharedSessionDataByAppId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOGetUserSessionLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134217984;
    v52 = v7;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "===== will evalutate session data from %lu appIds", buf, 0xCu);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
  if (!v9)
  {

    v30 = 0;
    goto LABEL_29;
  }
  v41 = 0;
  v10 = 0;
  v11 = v4 + -900.0;
  v12 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v43 != v12)
        objc_enumerationMutation(v8);
      v14 = *(NSObject **)(*((_QWORD *)&v42 + 1) + 8 * i);
      GEOGetUserSessionLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v14;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "evalutating session data created by %@", buf, 0xCu);
      }

      objc_msgSend(v8, "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "createTime");
      if (v17 <= v11)
      {
        GEOGetUserSessionLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "createTime");
          *(_DWORD *)buf = 138412802;
          v52 = v14;
          v53 = 2048;
          v54 = v27;
          v55 = 2048;
          v56 = v11;
          _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_DEBUG, "session data created by %@ is already expired (%f <= %f)", buf, 0x20u);
        }
      }
      else if (v10)
      {
        objc_msgSend(v16, "createTime");
        v19 = v18;
        -[GEOAPSessionData createTime](v10, "createTime");
        if (v19 <= v20)
          goto LABEL_22;
        GEOGetUserSessionLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "createTime");
          v23 = v22;
          -[GEOAPSessionData createTime](v10, "createTime");
          *(_DWORD *)buf = 138412802;
          v52 = v14;
          v53 = 2048;
          v54 = v23;
          v55 = 2048;
          v56 = v24;
          _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "new candidate session data created by %@ (%f > %f)", buf, 0x20u);
        }

        v25 = v16;
        v26 = v41;
        v41 = v14;
        v10 = v25;
      }
      else
      {
        GEOGetUserSessionLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v14;
          _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_DEBUG, "new candidate session data created by %@", buf, 0xCu);
        }

        v10 = v16;
        v26 = v41;
        v41 = v14;
      }

LABEL_22:
    }
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
  }
  while (v9);

  if (v10)
  {
    GEOGetUserSessionLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v41;
      _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_DEBUG, "Using existing shared short session data created by %@", buf, 0xCu);
    }
    goto LABEL_32;
  }
  v30 = v41;
LABEL_29:
  GEOApplicationIdentifierOrProcessName();
  v41 = objc_claimAutoreleasedReturnValue();

  GEOGetUserSessionLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v41;
    _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_DEBUG, "%@ is creating new shared short session data", buf, 0xCu);
  }

  v10 = objc_alloc_init(GEOAPSessionData);
  -[GEOAPSessionData setCreateTime:](v10, "setCreateTime:", v48[3]);
  v32 = objc_msgSend((id)objc_opt_class(), "_newSessionId");
  -[GEOAPSessionData setSessionId:](v10, "setSessionId:", v32, v33);
  v29 = objc_msgSend(v8, "mutableCopy");
  -[NSObject setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v10, v41);
  -[GEOUserSession _saveSharedSessionDataByAppId:](v39, "_saveSharedSessionDataByAppId:", v29);
LABEL_32:

  v34 = v48[3];
  v35 = -[GEOAPSessionData sessionId](v10, "sessionId");
  v37 = v36;
  -[GEOAPSessionData createTime](v10, "createTime");
  v40[2](v40, v35, v37, v34, v38);

  _Block_object_dispose(&v47, 8);
}

uint64_t __42__GEOUserSession__mapsShortSessionValues___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

_QWORD *__38__GEOUserSession__shortSessionValues___block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v5;

  v5 = *(_QWORD *)(result[4] + 8);
  *(_QWORD *)(v5 + 32) = a2;
  *(_QWORD *)(v5 + 40) = a3;
  *(double *)(*(_QWORD *)(result[5] + 8) + 24) = a5;
  *(double *)(*(_QWORD *)(result[6] + 8) + 24) = a4;
  return result;
}

- (id)_mapsUserSessionEntity
{
  id v2;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[8];
  uint8_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (self->_shareSessionWithMaps)
  {
    *(_QWORD *)buf = 0;
    v7 = buf;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__91;
    v10 = __Block_byref_object_dispose__91;
    v11 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__GEOUserSession__mapsUserSessionEntity__block_invoke;
    v5[3] = &unk_1E1C159C0;
    v5[4] = buf;
    -[GEOUserSession shortSessionValues:](self, "shortSessionValues:", v5);
    v2 = *((id *)v7 + 5);
    _Block_object_dispose(buf, 8);

    return v2;
  }
  else
  {
    GEOGetUserSessionLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "maps short session requested but session sharing is not enabled", buf, 2u);
    }

    return 0;
  }
}

void __40__GEOUserSession__mapsUserSessionEntity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  GEOUserSessionEntity *v7;
  uint64_t v8;
  void *v9;

  v7 = -[GEOUserSessionEntity initWithSessionID:sessionCreationTime:sequenceNumber:]([GEOUserSessionEntity alloc], "initWithSessionID:sessionCreationTime:sequenceNumber:", a2, a3, a4, a6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)_setShortSessionId:(GEOSessionID)a3 sessionCreateTime:(double)a4
{
  unint64_t low;
  unint64_t high;
  os_unfair_lock_s *p_shortNavSessionLock;
  void *v9;
  NSObject *v10;
  GEOAPSessionData *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  low = a3._low;
  high = a3._high;
  v16 = *MEMORY[0x1E0C80C00];
  p_shortNavSessionLock = &self->_shortNavSessionLock;
  os_unfair_lock_lock(&self->_shortNavSessionLock);
  if (self->_shortNavSessionNeedsInit)
  {
    -[GEOUserSession _initializeShortAndNavData](self, "_initializeShortAndNavData");
    self->_shortNavSessionNeedsInit = 0;
  }
  if (self->_shareSessionWithMaps)
  {
    -[GEOUserSession _sharedSessionDataByAppId](self, "_sharedSessionDataByAppId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");

    v11 = objc_alloc_init(GEOAPSessionData);
    -[GEOAPSessionData setSessionId:](v11, "setSessionId:", high, low);
    -[GEOAPSessionData setCreateTime:](v11, "setCreateTime:", a4);
    GEOApplicationIdentifierOrProcessName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, v12);
    -[GEOUserSession _saveSharedSessionDataByAppId:](self, "_saveSharedSessionDataByAppId:", v10);
    GEOGetUserSessionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEBUG, "%@ has reset the short session", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    GEOGetUserSessionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "request to set maps short session but session sharing is not enabled", (uint8_t *)&v14, 2u);
    }
  }

  os_unfair_lock_unlock(p_shortNavSessionLock);
}

- (void)setMapsUserSessionEntity:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "sessionID");
  v7 = v6;
  objc_msgSend(v4, "sessionCreationTime");
  v9 = v8;

  -[GEOUserSession _setShortSessionId:sessionCreateTime:](self, "_setShortSessionId:sessionCreateTime:", v5, v7, v9);
}

- (void)setMapsShortSession:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "sessionID");
  v7 = v6;
  objc_msgSend(v4, "sessionCreationTime");
  v9 = v8;

  -[GEOUserSession _setShortSessionId:sessionCreateTime:](self, "_setShortSessionId:sessionCreateTime:", v5, v7, v9);
}

- (void)setSharedMapsUserSessionEntity:(id)a3 shareSessionIDWithMaps:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  self->_shareSessionWithMaps = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "sessionID");
  v8 = v7;
  objc_msgSend(v5, "sessionCreationTime");
  v10 = v9;

  -[GEOUserSession _setShortSessionId:sessionCreateTime:](self, "_setShortSessionId:sessionCreateTime:", v6, v8, v10);
}

- (void)mapsSessionEntityWithCallback:(id)a3 shareSessionIDWithMaps:(BOOL)a4 resetSession:(BOOL)a5
{
  id v7;
  id v8;

  self->_shareSessionWithMaps = a4;
  v7 = a3;
  -[GEOUserSession _mapsUserSessionEntity](self, "_mapsUserSessionEntity");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v7, v8);

}

- (void)_generateNewNavSessionIDAtTime:(double)a3
{
  unint64_t v4;

  self->_navigationSessionStartTime = a3;
  self->_navigationSessionID._high = objc_msgSend((id)objc_opt_class(), "_newSessionId");
  self->_navigationSessionID._low = v4;
}

- (GEOSessionID)navSessionID
{
  os_unfair_lock_s *p_shortNavSessionLock;
  unint64_t low;
  unint64_t high;
  unint64_t v6;
  unint64_t v7;
  GEOSessionID result;

  p_shortNavSessionLock = &self->_shortNavSessionLock;
  os_unfair_lock_lock(&self->_shortNavSessionLock);
  if (self->_shortNavSessionNeedsInit)
  {
    -[GEOUserSession _initializeShortAndNavData](self, "_initializeShortAndNavData");
    self->_shortNavSessionNeedsInit = 0;
  }
  high = self->_navigationSessionID._high;
  low = self->_navigationSessionID._low;
  os_unfair_lock_unlock(p_shortNavSessionLock);
  v6 = high;
  v7 = low;
  result._low = v7;
  result._high = v6;
  return result;
}

- (void)startNavigationSessionWithDirectionsID:(id)a3 originalDirectionsID:(id)a4
{
  NSData *v6;
  id v7;
  NSObject *v8;
  NSData *previousNavigationDirectionsID;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  NSData *v14;
  NSObject *v15;
  NSData *v16;
  NSData *navigationDirectionsID;
  uint8_t v18[8];
  _QWORD v19[5];
  uint8_t v20[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[6];
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  char v28;

  v6 = (NSData *)a3;
  v7 = a4;
  GEOGetUserSessionLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "begin nav", buf, 2u);
  }

  os_unfair_lock_lock(&self->_shortNavSessionLock);
  if (self->_shortNavSessionNeedsInit)
  {
    -[GEOUserSession _initializeShortAndNavData](self, "_initializeShortAndNavData");
    self->_shortNavSessionNeedsInit = 0;
  }
  *(_QWORD *)buf = 0;
  v26 = buf;
  v27 = 0x2020000000;
  v28 = 0;
  previousNavigationDirectionsID = self->_previousNavigationDirectionsID;
  v10 = MEMORY[0x1E0C809B0];
  if (!v7 || !previousNavigationDirectionsID)
  {
    GEOGetUserSessionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v20 = 0;
      v12 = "no previous nav session data";
LABEL_14:
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, v12, v20, 2u);
    }
LABEL_15:

    v26[24] = 1;
    goto LABEL_16;
  }
  if ((-[NSData isEqual:](previousNavigationDirectionsID, "isEqual:", v7) & 1) == 0)
  {
    GEOGetUserSessionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v20 = 0;
      v12 = "previous nav session data stale; not a reroute";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (self->_previousNavigationSessionEndTime > 0.0)
  {
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __78__GEOUserSession_startNavigationSessionWithDirectionsID_originalDirectionsID___block_invoke;
    v24[3] = &unk_1E1C159E8;
    v24[4] = self;
    v24[5] = buf;
    -[GEOUserSession _currentTimeResult:](self, "_currentTimeResult:", v24);
  }
LABEL_16:
  *(_QWORD *)v20 = 0;
  v21 = v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __78__GEOUserSession_startNavigationSessionWithDirectionsID_originalDirectionsID___block_invoke_29;
  v19[3] = &unk_1E1C10930;
  v19[4] = v20;
  -[GEOUserSession _currentTimeResult:](self, "_currentTimeResult:", v19);
  if (v26[24])
  {
    GEOGetUserSessionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEBUG, "will create new nav session data", v18, 2u);
    }

    -[GEOUserSession _generateNewNavSessionIDAtTime:](self, "_generateNewNavSessionIDAtTime:", *((double *)v21 + 3));
    v14 = v6;
  }
  else
  {
    GEOGetUserSessionLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "will continue using existing nav session data", v18, 2u);
    }

    self->_navigationSessionID = self->_previousNavigationSessionID;
    self->_navigationSessionStartTime = self->_previousNavigationSessionStartTime;
    v14 = self->_previousNavigationDirectionsID;
  }
  v16 = v14;
  navigationDirectionsID = self->_navigationDirectionsID;
  self->_navigationDirectionsID = v16;

  self->_previousNavigationSessionID = self->_navigationSessionID;
  self->_previousNavigationSessionStartTime = self->_navigationSessionStartTime;
  objc_storeStrong((id *)&self->_previousNavigationDirectionsID, self->_navigationDirectionsID);
  self->_previousNavigationSessionEndTime = 0.0;
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(buf, 8);
  os_unfair_lock_unlock(&self->_shortNavSessionLock);

}

void __78__GEOUserSession_startNavigationSessionWithDirectionsID_originalDirectionsID___block_invoke(uint64_t a1, double a2)
{
  NSObject *v3;
  uint8_t v4[16];

  if (a2 - *(double *)(*(_QWORD *)(a1 + 32) + 136) > 900.0)
  {
    GEOGetUserSessionLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "previous nav session data stale; reroute threshhold exceeded",
        v4,
        2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __78__GEOUserSession_startNavigationSessionWithDirectionsID_originalDirectionsID___block_invoke_29(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)endNavigationSession
{
  NSObject *v3;
  NSData *navigationDirectionsID;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  GEOGetUserSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "end nav", buf, 2u);
  }

  os_unfair_lock_lock(&self->_shortNavSessionLock);
  if (self->_shortNavSessionNeedsInit)
  {
    -[GEOUserSession _initializeShortAndNavData](self, "_initializeShortAndNavData");
    self->_shortNavSessionNeedsInit = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__GEOUserSession_endNavigationSession__block_invoke;
  v6[3] = &unk_1E1C04468;
  v6[4] = self;
  -[GEOUserSession _currentTimeResult:](self, "_currentTimeResult:", v6);
  self->_navigationSessionID = self->_zeroSessionID;
  self->_navigationSessionStartTime = 0.0;
  navigationDirectionsID = self->_navigationDirectionsID;
  self->_navigationDirectionsID = 0;

  GEOGetUserSessionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "will reset maps short session data", buf, 2u);
  }

  -[GEOUserSession _resetShortSessionID](self, "_resetShortSessionID");
  os_unfair_lock_unlock(&self->_shortNavSessionLock);
}

uint64_t __38__GEOUserSession_endNavigationSession__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(result + 32) + 136) = a2;
  return result;
}

- (BOOL)shareSessionWithMaps
{
  return self->_shareSessionWithMaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_fifteenMoDeviceSessionData, 0);
  objc_storeStrong((id *)&self->_longSessionByAppID, 0);
  objc_storeStrong((id *)&self->_previousNavigationDirectionsID, 0);
  objc_storeStrong((id *)&self->_navigationDirectionsID, 0);
  objc_storeStrong(&self->_shortSessionListener, 0);
  objc_storeStrong((id *)&self->_shortSessionByAppID, 0);
}

- (void)resetLongSessionValuesForAppId:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__GEOUserSession_Internal__resetLongSessionValuesForAppId_queue_completion___block_invoke;
  v8[3] = &unk_1E1C15A10;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[GEOUserSession _accessLongSessionValuesInBlock:](self, "_accessLongSessionValuesInBlock:", v8);

}

BOOL __76__GEOUserSession_Internal__resetLongSessionValuesForAppId_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "longSessionAppIdForActualAppId:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "removeObjectForKey:", v4);

  return v5 != 0;
}

- (void)_resetShortSessionID
{
  NSDictionary *shortSessionByAppID;

  if (-[GEOUserSession shareSessionWithMaps](self, "shareSessionWithMaps"))
  {
    _setValue(GeoUserSessionConfig_ShortSessionDataByAppID, (uint64_t)off_1EDF49B90, 0, 0, 0);
    shortSessionByAppID = self->_shortSessionByAppID;
    self->_shortSessionByAppID = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  else
  {
    self->_shortSessionStartTime = 0.0;
  }
}

+ (id)mapsUnifiedBundleId
{
  return CFSTR("com.apple.MapsConfederation");
}

- (id)longSessionAppIdForActualAppId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (qword_1ECDBCB18 == -1)
  {
    if (!v3)
      goto LABEL_4;
  }
  else
  {
    dispatch_once(&qword_1ECDBCB18, &__block_literal_global_192);
    if (!v4)
      goto LABEL_4;
  }
  if (!objc_msgSend((id)_MergedGlobals_326, "containsObject:", v4))
  {
    v5 = v4;
    goto LABEL_6;
  }
LABEL_4:
  objc_msgSend((id)objc_opt_class(), "mapsUnifiedBundleId");
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = v5;

  return v6;
}

void __67__GEOUserSession_LongSessionAppId__longSessionAppIdForActualAppId___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E1E85960);
  v1 = (void *)_MergedGlobals_326;
  _MergedGlobals_326 = v0;

}

- (double)_currentTime
{
  void *v2;
  double v3;
  double v4;

  +[GEOReferenceTimeManager sharedManager](GEOReferenceTimeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestReferenceTime");
  v4 = v3;

  return v4;
}

- (double)_preferredSessionStartDateDerivedFromMapsUserStartDate:(double)a3 currentDate:(double)a4
{
  double v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;

  v4 = a4;
  if (a3 != a4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v9, "setDay:", 456);
    if (objc_msgSend(v7, "compare:", v8) == 1)
    {
      v10 = v7;
    }
    else
    {
      do
      {
        objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v9, v7, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v10;
      }
      while (objc_msgSend(v10, "compare:", v8) != 1);
    }
    objc_msgSend(v9, "setDay:", -456);
    objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v4 = v12;

  }
  return v4;
}

- (BOOL)_hasMapsUserStartDate
{
  return _GEOConfigHasValue(GeoUserSessionConfig_MapsUserStartDate, (uint64_t)off_1EDF49B50);
}

- (double)_getMapsUserStartDate
{
  return GEOConfigGetDouble(GeoUserSessionConfig_MapsUserStartDate, (uint64_t)off_1EDF49B50);
}

- (void)_setMapsUserStartDate:(double)a3
{
  GEOConfigSetDouble(GeoUserSessionConfig_MapsUserStartDate, (uint64_t)off_1EDF49B50);
}

- (BOOL)_hasGoodTimeSync
{
  void *v2;
  char v3;

  +[GEOReferenceTimeManager sharedManager](GEOReferenceTimeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "synchronized");

  return v3;
}

- (unint64_t)_get15moDeviceSessionConfiguredEpoch
{
  return GEOConfigGetUint64(GeoUserSessionConfig_FifteenMonthDeviceSessionConfiguredEpoch, (uint64_t)off_1EDF49B00);
}

- (id)_get15moDeviceRawSessionData
{
  return _getValue(GeoUserSessionConfig_FifteenMonthDeviceSessionData, (uint64_t)off_1EDF49B20, 1, 0, 0, 0);
}

- (id)_get15moDeviceSessionData
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  GEOAPSessionData *v5;
  uint8_t v7[16];
  uint8_t buf[16];

  -[GEOUserSession _get15moDeviceRawSessionData](self, "_get15moDeviceRawSessionData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GEOGetUserSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "15mo device raw session data was retrieved", v7, 2u);
    }

    v5 = -[GEOAPSessionData initWithData:]([GEOAPSessionData alloc], "initWithData:", v2);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "15mo device raw session data not found", buf, 2u);
    }

    v5 = 0;
  }

  return v5;
}

- (void)_set15moDeviceSessionData:(id)a3
{
  id v3;

  objc_msgSend(a3, "data");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _setValue(GeoUserSessionConfig_FifteenMonthDeviceSessionData, (uint64_t)off_1EDF49B20, v3, 1, 0);

}

- (id)_getPersistedLongSessionData
{
  return _getValue(GeoUserSessionConfig_LongSessionDataByAppID, (uint64_t)off_1EDF49B80, 1, 0, 0, 0);
}

- (void)_setPersistedLongSessionData:(id)a3
{
  _setValue(GeoUserSessionConfig_LongSessionDataByAppID, (uint64_t)off_1EDF49B80, a3, 1, 0);
}

- (id)_getPersistedNavSessionData
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  _getValue(GeoUserSessionConfig_NavigationSessionInfo, (uint64_t)off_1EDF49B60, 1, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E60]);
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v5, v2, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (!v6)
    {
      GEOGetUserSessionLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "found stored nav session data but couldn't read it (%@)", buf, 0xCu);
      }

      _setValue(GeoUserSessionConfig_NavigationSessionInfo, (uint64_t)off_1EDF49B60, 0, 0, 0);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_setPersistedNavSessionData:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v3)
  {
    _setValue(GeoUserSessionConfig_NavigationSessionInfo, (uint64_t)off_1EDF49B60, v3, 1, 0);
  }
  else
  {
    GEOGetUserSessionLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "unable to serialize nav session data for archival (%@)", buf, 0xCu);
    }

  }
}

@end
