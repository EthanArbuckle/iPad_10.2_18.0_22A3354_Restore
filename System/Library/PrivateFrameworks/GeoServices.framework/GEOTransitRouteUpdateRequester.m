@implementation GEOTransitRouteUpdateRequester

+ (id)sharedInstance
{
  if (qword_1ECDBBA38 != -1)
    dispatch_once(&qword_1ECDBBA38, &__block_literal_global_25);
  return (id)_MergedGlobals_191;
}

void __48__GEOTransitRouteUpdateRequester_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[GEOTransitRouteUpdateRequester initPrivate]([GEOTransitRouteUpdateRequester alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_191;
  _MergedGlobals_191 = (uint64_t)v0;

}

- (id)initPrivate
{
  GEOTransitRouteUpdateRequester *v2;
  GEOTransitRouteUpdateRequester *v3;
  uint64_t v4;
  NSHashTable *updaters;
  uint64_t v6;
  NSMutableSet *processedRequests;
  uint64_t v8;
  NSMutableSet *inflightRequests;
  GEOTransitRouteUpdateRequester *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GEOTransitRouteUpdateRequester;
  v2 = -[GEOTransitRouteUpdateRequester init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_updatersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    updaters = v3->_updaters;
    v3->_updaters = (NSHashTable *)v4;

    v3->_processedRequestsLock._os_unfair_lock_opaque = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 5);
    processedRequests = v3->_processedRequests;
    v3->_processedRequests = (NSMutableSet *)v6;

    v3->_inflightRequestsLock._os_unfair_lock_opaque = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 5);
    inflightRequests = v3->_inflightRequests;
    v3->_inflightRequests = (NSMutableSet *)v8;

    *(_OWORD *)&v3->_maxRetries = xmmword_189CC2D90;
    v10 = v3;
  }

  return v3;
}

- (double)initialDelay
{
  double result;

  result = self->_initialDelay;
  if (fabs(result) < 0.000001)
  {
    result = GEOConfigGetDouble(GeoServicesConfig_RealtimeTransitInitialUpdateDelay, (uint64_t)off_1EDF4DC98);
    self->_initialDelay = result;
    if (fabs(result) < 0.000001)
    {
      self->_initialDelay = 15.0;
      return 15.0;
    }
  }
  return result;
}

- (double)requestInterval
{
  double result;

  result = self->_requestInterval;
  if (fabs(result) < 0.000001)
  {
    -[GEOTransitRouteUpdateRequester initialDelay](self, "initialDelay");
    self->_requestInterval = result;
  }
  return result;
}

- (void)_purgeAllObjects
{
  -[GEOTransitRouteUpdateRequester _cancelAllRequestsIfNeeded](self, "_cancelAllRequestsIfNeeded");
  -[GEOTransitRouteUpdateRequester _cancelUpdateTimer](self, "_cancelUpdateTimer");
  os_unfair_lock_lock(&self->_updatersLock);
  -[NSHashTable removeAllObjects](self->_updaters, "removeAllObjects");
  os_unfair_lock_unlock(&self->_updatersLock);
  os_unfair_lock_lock(&self->_processedRequestsLock);
  -[NSMutableSet removeAllObjects](self->_processedRequests, "removeAllObjects");
  os_unfair_lock_unlock(&self->_processedRequestsLock);
  os_unfair_lock_lock(&self->_inflightRequestsLock);
  -[NSMutableSet removeAllObjects](self->_inflightRequests, "removeAllObjects");
  os_unfair_lock_unlock(&self->_inflightRequestsLock);
}

- (void)_cancelAllRequestsIfNeeded
{
  os_unfair_lock_s *p_inflightRequestsLock;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_inflightRequestsLock = &self->_inflightRequestsLock;
  os_unfair_lock_lock(&self->_inflightRequestsLock);
  v4 = (void *)-[NSMutableSet copy](self->_inflightRequests, "copy");
  -[NSMutableSet removeAllObjects](self->_inflightRequests, "removeAllObjects");
  os_unfair_lock_unlock(p_inflightRequestsLock);
  self->_requestInterval = 0.0;
  if (objc_msgSend(v4, "count"))
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v19 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "cancelling %lu requests", buf, 0xCu);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          +[GEOTransitUpdateRequester sharedRequester](GEOTransitUpdateRequester, "sharedRequester", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "cancelTransitRouteUpdateRequest:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)registerRouteUpdater:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138477827;
      v7 = v4;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "registering Updater %{private}@", (uint8_t *)&v6, 0xCu);
    }

    -[GEOTransitRouteUpdateRequester _cancelAllRequestsIfNeeded](self, "_cancelAllRequestsIfNeeded");
    os_unfair_lock_lock(&self->_updatersLock);
    -[NSHashTable addObject:](self->_updaters, "addObject:", v4);
    os_unfair_lock_unlock(&self->_updatersLock);
    if (objc_msgSend(v4, "isActive"))
    {
      -[GEOTransitRouteUpdateRequester requestInterval](self, "requestInterval");
      -[GEOTransitRouteUpdateRequester _scheduleUpdateTimerWithInterval:](self, "_scheduleUpdateTimerWithInterval:");
    }
  }

}

- (void)unregisterRouteUpdater:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138477827;
      v8 = v4;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "unregistering Updater %{private}@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v4, "requests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTransitRouteUpdateRequester _removeRequestsIfApplicable:](self, "_removeRequestsIfApplicable:", v6);

    os_unfair_lock_lock(&self->_updatersLock);
    -[NSHashTable removeObject:](self->_updaters, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_updatersLock);
  }

}

- (void)_scheduleUpdateTimerWithInterval:(double)a3
{
  NSObject *v5;
  void *v6;
  NSTimer *updateTimer;
  int BOOL;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSTimer *v13;
  NSTimer *v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[6];
  uint8_t buf[4];
  double v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (self->_updateTimer)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[NSTimer fireDate](self->_updateTimer, "fireDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = *(double *)&v6;
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "cancelling updated scheduled for %@", buf, 0xCu);

      }
      -[NSTimer invalidate](self->_updateTimer, "invalidate");
      updateTimer = self->_updateTimer;
      self->_updateTimer = 0;

    }
    BOOL = GEOConfigGetBOOL(GeoServicesConfig_SuppressTransitRealtimeUpdates, (uint64_t)off_1EDF4E0D8);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (BOOL)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "suppressing timer due to debug setting", buf, 2u);
      }

    }
    else
    {
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v19 = a3;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "scheduling update in %#.1lfs at %@", buf, 0x16u);

      }
      objc_initWeak((id *)buf, self);
      v12 = (void *)MEMORY[0x1E0C99E88];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __67__GEOTransitRouteUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke_8;
      v15[3] = &unk_1E1C02240;
      objc_copyWeak(&v16, (id *)buf);
      objc_msgSend(v12, "scheduledTimerWithTimeInterval:repeats:block:", 0, v15, a3);
      v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v14 = self->_updateTimer;
      self->_updateTimer = v13;

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__GEOTransitRouteUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke;
    block[3] = &unk_1E1BFF6D0;
    block[4] = self;
    *(double *)&block[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __67__GEOTransitRouteUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdateTimerWithInterval:", *(double *)(a1 + 40));
}

void __67__GEOTransitRouteUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  NSObject *v6;
  id v7;
  __int16 v8[8];

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && WeakRetained[7] == v3)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8[0] = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "performing scheduled update", (uint8_t *)v8, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)v5 + 6);
    objc_msgSend(v5[4], "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)v5 + 6);
    v7 = v5[7];
    v5[7] = 0;

    objc_msgSend(v5, "_processRequests");
  }

}

- (void)_cancelUpdateTimer
{
  NSObject *v3;
  NSTimer *updateTimer;
  uint8_t v5[16];

  if (self->_updateTimer)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "cancelling scheduled update", v5, 2u);
    }

    -[NSTimer invalidate](self->_updateTimer, "invalidate");
    updateTimer = self->_updateTimer;
    self->_updateTimer = 0;

  }
}

- (void)_processRequests
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  -[GEOTransitRouteUpdateRequester _cancelUpdateTimer](self, "_cancelUpdateTimer");
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "processing current requests", buf, 2u);
  }

  os_unfair_lock_lock(&self->_updatersLock);
  -[NSHashTable allObjects](self->_updaters, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitRouteUpdateRequester _requestsForUpdaters:](self, "_requestsForUpdaters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_updatersLock);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_processedRequestsLock);
  objc_msgSend(v6, "minusSet:", self->_processedRequests);
  os_unfair_lock_unlock(&self->_processedRequestsLock);
  os_unfair_lock_lock(&self->_inflightRequestsLock);
  objc_msgSend(v6, "minusSet:", self->_inflightRequests);
  os_unfair_lock_unlock(&self->_inflightRequestsLock);
  if (objc_msgSend(v6, "count"))
  {
    -[GEOTransitRouteUpdateRequester _sendRequestForRequests:](self, "_sendRequestForRequests:", v6);
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "no requests to process", v8, 2u);
    }

  }
}

- (id)_requestsForUpdaters:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "requests", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)_sendRequestForRequests:(id)a3
{
  os_unfair_lock_s *p_updatersLock;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t j;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  NSObject *obj;
  GEOTransitRouteUpdateRequester *val;
  _QWORD v40[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  id v47;
  _QWORD block[5];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  if (objc_msgSend(v36, "count"))
  {
    p_updatersLock = &self->_updatersLock;
    os_unfair_lock_lock(&self->_updatersLock);
    val = self;
    -[NSHashTable allObjects](self->_updaters, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_updatersLock);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v5;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v51 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if (objc_msgSend(v9, "isActive"))
          {
            v10 = objc_alloc(MEMORY[0x1E0C99E20]);
            objc_msgSend(v9, "requests");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)objc_msgSend(v10, "initWithSet:", v11);

            objc_msgSend(v12, "intersectSet:", v36);
            if (objc_msgSend(v12, "count"))
            {
              objc_msgSend(v9, "delegate");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_opt_respondsToSelector();

              if ((v14 & 1) != 0)
              {
                GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138478083;
                  v56 = (uint64_t)v9;
                  v57 = 2113;
                  v58 = (uint64_t)v12;
                  _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "notifying %{private}@ will request %{private}@", buf, 0x16u);
                }

                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke;
                block[3] = &unk_1E1C00738;
                block[4] = v9;
                v49 = v12;
                dispatch_async(MEMORY[0x1E0C80D38], block);

              }
              objc_msgSend(v9, "delegate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_opt_respondsToSelector();

              if ((v17 & 1) != 0)
              {
                -[GEOTransitRouteUpdateRequester _uuidsForRequests:](val, "_uuidsForRequests:", v12);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138478083;
                  v56 = (uint64_t)v9;
                  v57 = 2113;
                  v58 = (uint64_t)v18;
                  _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "notifying %{private}@ will update %{private}@", buf, 0x16u);
                }

                v46[0] = MEMORY[0x1E0C809B0];
                v46[1] = 3221225472;
                v46[2] = __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke_15;
                v46[3] = &unk_1E1C00738;
                v46[4] = v9;
                v47 = v18;
                v20 = v18;
                dispatch_async(MEMORY[0x1E0C80D38], v46);

              }
            }

          }
        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v6);
    }

    os_unfair_lock_lock(&val->_inflightRequestsLock);
    -[NSMutableSet unionSet:](val->_inflightRequests, "unionSet:", v36);
    os_unfair_lock_unlock(&val->_inflightRequestsLock);
    objc_msgSend(v36, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOTransitRouteUpdateRequest mergedTransitRouteUpdateRequests:](GEOTransitRouteUpdateRequest, "mergedTransitRouteUpdateRequests:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = objc_msgSend(v36, "count");
      v25 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 134218240;
      v56 = v24;
      v57 = 2048;
      v58 = v25;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_DEBUG, "merged %lu requests into %lu", buf, 0x16u);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v37 = v22;
    v26 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v43;
      v28 = (void *)MEMORY[0x1E0C80D38];
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v37);
          v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v30, "routeIdentifiers");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v56 = (uint64_t)v32;
            _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_INFO, "sending request for routes %{private}@", buf, 0xCu);

          }
          objc_initWeak((id *)buf, val);
          +[GEOTransitUpdateRequester sharedRequester](GEOTransitUpdateRequester, "sharedRequester");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v28;
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke_17;
          v40[3] = &unk_1E1C03178;
          objc_copyWeak(&v41, (id *)buf);
          v40[4] = v30;
          objc_msgSend(v33, "startTransitRouteUpdateRequest:auditToken:throttleToken:queue:networkActivity:completion:", v30, 0, 0, v28, 0, v40);

          objc_destroyWeak(&v41);
          objc_destroyWeak((id *)buf);
        }
        v26 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v26);
    }

    v35 = obj;
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v35, OS_LOG_TYPE_DEBUG, "no requests to make", buf, 2u);
    }
  }

}

void __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitRouteUpdater:willSendRequests:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke_15(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitRouteUpdater:willUpdateTransitForRouteIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double *WeakRetained;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double Double;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_msgSend(v5, "hasRouteUpdateConfiguration"))
    {
      objc_msgSend(v5, "routeUpdateConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasTtlSeconds");

      if (v9)
      {
        objc_msgSend(v5, "routeUpdateConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (double)(unint64_t)objc_msgSend(v10, "ttlSeconds");

        Double = GEOConfigGetDouble(GeoServicesConfig_RealtimeTransitUpdateIntervalOverride, (uint64_t)off_1EDF4DCA8);
        if (Double > 0.0)
          v11 = Double;
        if (v11 != WeakRetained[11])
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v14 = *((_QWORD *)WeakRetained + 11);
            v15 = 134218240;
            v16 = v14;
            v17 = 2048;
            v18 = v11;
            _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "changing response interval from %#.1lfs to %#.1lfs", (uint8_t *)&v15, 0x16u);
          }

          WeakRetained[11] = v11;
        }
      }
    }
    objc_msgSend(WeakRetained, "_handleResponse:andError:forRequest:", v5, v6, *(_QWORD *)(a1 + 32));
  }

}

- (id)_uuidsForRequests:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "allClientRouteIDs", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWithArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_handleResponse:(id)a3 andError:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  GEOTransitRouteUpdateRequester *v35;
  void *v36;
  void *v37;
  id v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  NSObject *v63;
  void *v64;
  void *v65;
  char v66;
  NSObject *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  BOOL v71;
  unint64_t maxRetries;
  unint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  void *v79;
  void *v80;
  char v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  id obj;
  void *v97;
  GEOTransitRouteUpdateRequester *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  id v122;
  uint8_t buf[4];
  void *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  id v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v91 = a5;
  if (v91)
  {
    objc_msgSend(v8, "routeUpdates");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v91, "routeIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "valueForKey:", CFSTR("_logDescription"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v124 = v11;
      v125 = 2113;
      v126 = v12;
      v127 = 2112;
      v128 = v9;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "handling response for %{private}@:\nupdates: %{private}@\nerror: %@", buf, 0x20u);

    }
    os_unfair_lock_lock(&self->_updatersLock);
    -[NSHashTable allObjects](self->_updaters, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_updatersLock);
    v98 = self;
    v14 = (void *)MEMORY[0x1E0C99E60];
    v122 = v91;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOTransitRouteUpdateRequest splitTransitRouteUpdateRequests:](GEOTransitRouteUpdateRequest, "splitTransitRouteUpdateRequests:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock(&self->_inflightRequestsLock);
    -[NSMutableSet minusSet:](self->_inflightRequests, "minusSet:", v17);
    os_unfair_lock_unlock(&self->_inflightRequestsLock);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v91);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTransitRouteUpdateRequester _uuidsForRequests:](self, "_uuidsForRequests:", v18);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    v93 = v8;
    v97 = v9;
    v88 = (void *)v17;
    v89 = v13;
    if (v9)
    {
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v19 = v13;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v114, v121, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v115;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v115 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
            if (objc_msgSend(v24, "isActive", v88, v89))
            {
              objc_msgSend(v24, "delegate");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_opt_respondsToSelector();

              if ((v26 & 1) != 0)
              {
                v27 = objc_alloc(MEMORY[0x1E0C99E20]);
                objc_msgSend(v24, "requests");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[GEOTransitRouteUpdateRequester _uuidsForRequests:](v98, "_uuidsForRequests:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = (void *)objc_msgSend(v27, "initWithSet:", v29);

                objc_msgSend(v30, "intersectSet:", v101);
                if (objc_msgSend(v30, "count"))
                {
                  GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                  v31 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138478339;
                    v124 = v24;
                    v125 = 2113;
                    v126 = v30;
                    v127 = 2112;
                    v128 = v97;
                    _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_ERROR, "notifying %{private}@ did fail routeIDs %{private}@ with error: %@", buf, 0x20u);
                  }

                  objc_msgSend(v24, "delegate");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "transitRouteUpdater:didFailUpdateForRouteIDs:withError:", v24, v30, v97);

                }
              }
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v114, v121, 16);
        }
        while (v21);
      }

      v9 = v97;
      objc_msgSend(v97, "domain");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      GEOErrorDomain();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "isEqualToString:", v34))
      {
        v8 = v93;
        if (objc_msgSend(v97, "code") == -8)
        {

          v35 = v98;
          v37 = v88;
          v36 = v89;
        }
        else
        {
          v70 = objc_msgSend(v97, "code");

          v71 = v70 == -11;
          v35 = v98;
          v37 = v88;
          v36 = v89;
          if (!v71)
            goto LABEL_72;
        }
        maxRetries = v35->_maxRetries;
        v73 = v35->_numRetries + 1;
        v35->_numRetries = v73;
        if (v73 <= maxRetries)
        {
          -[GEOTransitRouteUpdateRequester requestInterval](v35, "requestInterval");
          -[GEOTransitRouteUpdateRequester _scheduleUpdateTimerWithInterval:](v35, "_scheduleUpdateTimerWithInterval:");
          goto LABEL_72;
        }
        v35->_numRetries = 0;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        v113 = 0u;
        v74 = v19;
        v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
        if (v75)
        {
          v76 = v75;
          v77 = *(_QWORD *)v111;
          do
          {
            for (j = 0; j != v76; ++j)
            {
              if (*(_QWORD *)v111 != v77)
                objc_enumerationMutation(v74);
              v79 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
              if (objc_msgSend(v79, "isActive", v88, v89))
              {
                objc_msgSend(v79, "delegate");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = objc_opt_respondsToSelector();

                if ((v81 & 1) != 0)
                {
                  v82 = objc_alloc(MEMORY[0x1E0C99E20]);
                  objc_msgSend(v79, "requests");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  -[GEOTransitRouteUpdateRequester _uuidsForRequests:](v98, "_uuidsForRequests:", v83);
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  v85 = (void *)objc_msgSend(v82, "initWithSet:", v84);

                  objc_msgSend(v85, "intersectSet:", v101);
                  if (objc_msgSend(v85, "count"))
                  {
                    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                    v86 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138478083;
                      v124 = v79;
                      v125 = 2113;
                      v126 = v85;
                      _os_log_impl(&dword_1885A9000, v86, OS_LOG_TYPE_ERROR, "notifying %{private}@ did timeout routeIDs %{private}@", buf, 0x16u);
                    }

                    objc_msgSend(v79, "delegate");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "transitRouteUpdater:didTimeoutForRouteIDs:", v79, v85);

                  }
                }
              }
            }
            v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
          }
          while (v76);
        }

        v8 = v93;
        v9 = v97;
      }
      else
      {

        v8 = v93;
      }
    }
    else
    {
      self->_numRetries = 0;
      os_unfair_lock_lock(&self->_processedRequestsLock);
      -[NSMutableSet unionSet:](self->_processedRequests, "unionSet:", v17);
      os_unfair_lock_unlock(&self->_processedRequestsLock);
      v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v90);
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      v38 = v13;
      v39 = 0x1E0C99000uLL;
      obj = v38;
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v107;
        v94 = *(_QWORD *)v107;
        do
        {
          v43 = 0;
          v95 = v41;
          do
          {
            if (*(_QWORD *)v107 != v42)
              objc_enumerationMutation(obj);
            v44 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v43);
            if (objc_msgSend(v44, "isActive", v88, v89))
            {
              v100 = v43;
              v45 = objc_alloc(*(Class *)(v39 + 3616));
              v99 = v44;
              objc_msgSend(v44, "requests");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOTransitRouteUpdateRequester _uuidsForRequests:](self, "_uuidsForRequests:", v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = (void *)objc_msgSend(v45, "initWithSet:", v47);

              objc_msgSend(v48, "intersectSet:", v101);
              if (objc_msgSend(v48, "count"))
              {
                v49 = (void *)objc_msgSend(objc_alloc(*(Class *)(v39 + 3616)), "initWithCapacity:", objc_msgSend(v92, "count"));
                v102 = 0u;
                v103 = 0u;
                v104 = 0u;
                v105 = 0u;
                v50 = v92;
                v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
                if (v51)
                {
                  v52 = v51;
                  v53 = *(_QWORD *)v103;
                  do
                  {
                    for (k = 0; k != v52; ++k)
                    {
                      if (*(_QWORD *)v103 != v53)
                        objc_enumerationMutation(v50);
                      v55 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * k);
                      v56 = (void *)MEMORY[0x1E0CB3A28];
                      objc_msgSend(v55, "routeIdentifier");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "clientRouteHandle");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v56, "_maps_UUIDWithData:", v58);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v48, "containsObject:", v59))
                        objc_msgSend(v49, "addObject:", v55);

                    }
                    v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
                  }
                  while (v52);
                }

                v8 = v93;
                v9 = 0;
                self = v98;
                v39 = 0x1E0C99000;
                if (objc_msgSend(v49, "count"))
                {
                  v60 = v99;
                  objc_msgSend(v99, "delegate");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = objc_opt_respondsToSelector();

                  if ((v62 & 1) != 0)
                  {
                    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                    v63 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138478083;
                      v124 = v99;
                      v125 = 2113;
                      v126 = v93;
                      _os_log_impl(&dword_1885A9000, v63, OS_LOG_TYPE_INFO, "notifying %{private}@ did receive response %{private}@", buf, 0x16u);
                    }

                    v60 = v99;
                    objc_msgSend(v99, "delegate");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "transitRouteUpdater:didReceiveResponse:", v99, v93);

                  }
                  objc_msgSend(v60, "delegate");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v66 = objc_opt_respondsToSelector();

                  if ((v66 & 1) != 0)
                  {
                    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                    v67 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138478083;
                      v124 = v99;
                      v125 = 2113;
                      v126 = v48;
                      _os_log_impl(&dword_1885A9000, v67, OS_LOG_TYPE_INFO, "notifying %{private}@ did receive updates for %{private}@", buf, 0x16u);
                    }

                    objc_msgSend(v99, "delegate");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "allObjects");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v68, "transitRouteUpdater:didUpdateTransitRoutes:", v99, v69);

                  }
                }

              }
              v42 = v94;
              v41 = v95;
              v43 = v100;
            }
            ++v43;
          }
          while (v43 != v41);
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
        }
        while (v41);
      }

      -[GEOTransitRouteUpdateRequester requestInterval](self, "requestInterval");
      -[GEOTransitRouteUpdateRequester _scheduleUpdateTimerWithInterval:](self, "_scheduleUpdateTimerWithInterval:");

    }
    v37 = v88;
    v36 = v89;
LABEL_72:

  }
}

- (void)_removeRequestsIfApplicable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  GEOTransitRouteUpdateRequester *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_updatersLock);
    -[NSHashTable allObjects](self->_updaters, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_updatersLock);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v4);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      v25 = self;
      v26 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v12, "requests", v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToSet:", v4);

          if ((v14 & 1) == 0)
          {
            objc_msgSend(v12, "requests");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "allObjects");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v28;
              while (2)
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v28 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
                  if (objc_msgSend(v6, "containsObject:", v22))
                  {
                    objc_msgSend(v6, "removeObject:", v22);
                    if (!objc_msgSend(v6, "count"))
                    {

                      goto LABEL_24;
                    }
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
                if (v19)
                  continue;
                break;
              }
            }

            v10 = v26;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        self = v25;
      }
      while (v9);
    }

    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134217984;
      v36 = v24;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_DEBUG, "removing %lu processed requests", buf, 0xCu);
    }

    os_unfair_lock_lock(&self->_processedRequestsLock);
    -[NSMutableSet minusSet:](self->_processedRequests, "minusSet:", v6);
    os_unfair_lock_unlock(&self->_processedRequestsLock);
LABEL_24:

  }
}

- (NSHashTable)updaters
{
  return self->_updaters;
}

- (NSMutableSet)processedRequests
{
  return self->_processedRequests;
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (void)setRequestInterval:(double)a3
{
  self->_requestInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_inflightRequests, 0);
  objc_storeStrong((id *)&self->_processedRequests, 0);
  objc_storeStrong((id *)&self->_updaters, 0);
}

@end
