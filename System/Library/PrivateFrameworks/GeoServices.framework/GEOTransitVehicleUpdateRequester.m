@implementation GEOTransitVehicleUpdateRequester

+ (id)sharedInstance
{
  if (qword_1ECDBB9A8 != -1)
    dispatch_once(&qword_1ECDBB9A8, &__block_literal_global_13);
  return (id)_MergedGlobals_183;
}

void __50__GEOTransitVehicleUpdateRequester_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[GEOTransitVehicleUpdateRequester initPrivate]([GEOTransitVehicleUpdateRequester alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_183;
  _MergedGlobals_183 = (uint64_t)v0;

}

- (id)initPrivate
{
  GEOTransitVehicleUpdateRequester *v2;
  GEOTransitVehicleUpdateRequester *v3;
  uint64_t v4;
  NSHashTable *updaters;
  uint64_t v6;
  NSMutableSet *processedTripIds;
  uint64_t v8;
  NSMutableSet *inflightTripIds;
  GEOTransitVehicleUpdateRequester *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GEOTransitVehicleUpdateRequester;
  v2 = -[GEOTransitVehicleUpdateRequester init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_updatersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    updaters = v3->_updaters;
    v3->_updaters = (NSHashTable *)v4;

    v3->_processedTripIdsLock._os_unfair_lock_opaque = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 5);
    processedTripIds = v3->_processedTripIds;
    v3->_processedTripIds = (NSMutableSet *)v6;

    v3->_inflightTripIdsLock._os_unfair_lock_opaque = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 5);
    inflightTripIds = v3->_inflightTripIds;
    v3->_inflightTripIds = (NSMutableSet *)v8;

    v3->_requestInterval = 15.0;
    *(_OWORD *)&v3->_maxRetries = xmmword_189CC2D90;
    v10 = v3;
  }

  return v3;
}

- (void)_purgeAllObjects
{
  -[GEOTransitVehicleUpdateRequester _cancelRequestIfNeeded](self, "_cancelRequestIfNeeded");
  -[GEOTransitVehicleUpdateRequester _cancelUpdateTimer](self, "_cancelUpdateTimer");
  os_unfair_lock_lock(&self->_updatersLock);
  -[NSHashTable removeAllObjects](self->_updaters, "removeAllObjects");
  os_unfair_lock_unlock(&self->_updatersLock);
  os_unfair_lock_lock(&self->_processedTripIdsLock);
  -[NSMutableSet removeAllObjects](self->_processedTripIds, "removeAllObjects");
  os_unfair_lock_unlock(&self->_processedTripIdsLock);
  os_unfair_lock_lock(&self->_inflightTripIdsLock);
  -[NSMutableSet removeAllObjects](self->_inflightTripIds, "removeAllObjects");
  os_unfair_lock_unlock(&self->_inflightTripIdsLock);
}

- (void)_cancelRequestIfNeeded
{
  GEOTransitVehicleUpdateRequester *v2;
  GEOMapServiceTicket *v3;
  GEOMapServiceTicket *ticket;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_ticket;
  ticket = v2->_ticket;
  v2->_ticket = 0;

  objc_sync_exit(v2);
  if (v3)
  {
    os_unfair_lock_lock(&v2->_inflightTripIdsLock);
    v5 = (void *)-[NSMutableSet copy](v2->_inflightTripIds, "copy");
    -[NSMutableSet removeAllObjects](v2->_inflightTripIds, "removeAllObjects");
    os_unfair_lock_unlock(&v2->_inflightTripIdsLock);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138477827;
      v8 = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "cancelling ticket for inflight tripIDs %{private}@", (uint8_t *)&v7, 0xCu);
    }

    -[GEOMapServiceTicket cancel](v3, "cancel");
  }

}

- (void)registerVehicleUpdater:(id)a3
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
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138477827;
      v7 = v4;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "registering Updater %{private}@", (uint8_t *)&v6, 0xCu);
    }

    -[GEOTransitVehicleUpdateRequester _cancelRequestIfNeeded](self, "_cancelRequestIfNeeded");
    os_unfair_lock_lock(&self->_updatersLock);
    -[NSHashTable addObject:](self->_updaters, "addObject:", v4);
    os_unfair_lock_unlock(&self->_updatersLock);
    if (objc_msgSend(v4, "isActive"))
      -[GEOTransitVehicleUpdateRequester _processTripIds](self, "_processTripIds");
  }

}

- (void)unregisterVehicleUpdater:(id)a3
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
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138477827;
      v8 = v4;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "unregistering Updater %{private}@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v4, "tripIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTransitVehicleUpdateRequester _removeTripIdsIfApplicable:](self, "_removeTripIdsIfApplicable:", v6);

    os_unfair_lock_lock(&self->_updatersLock);
    -[NSHashTable removeObject:](self->_updaters, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_updatersLock);
  }

}

- (void)_scheduleUpdateTimerWithInterval:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSTimer *v8;
  NSTimer *updateTimer;
  _QWORD v10[4];
  id v11;
  _QWORD block[6];
  uint8_t buf[4];
  double v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v14 = a3;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Scheduling update in %#.1lfs at %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    -[NSTimer invalidate](self->_updateTimer, "invalidate");
    v7 = (void *)MEMORY[0x1E0C99E88];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__GEOTransitVehicleUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke_7;
    v10[3] = &unk_1E1C02240;
    objc_copyWeak(&v11, (id *)buf);
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, a3);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    updateTimer = self->_updateTimer;
    self->_updateTimer = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__GEOTransitVehicleUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke;
    block[3] = &unk_1E1BFF6D0;
    block[4] = self;
    *(double *)&block[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __69__GEOTransitVehicleUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdateTimerWithInterval:", *(double *)(a1 + 40));
}

void __69__GEOTransitVehicleUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Performing scheduled update", v4, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 6);
    objc_msgSend(*((id *)WeakRetained + 4), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
    v3 = (void *)*((_QWORD *)WeakRetained + 8);
    *((_QWORD *)WeakRetained + 8) = 0;

    objc_msgSend(WeakRetained, "_processTripIds");
  }

}

- (void)_cancelUpdateTimer
{
  NSObject *v3;
  NSTimer *updateTimer;
  uint8_t v5[16];

  if (self->_updateTimer)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Cancelling scheduled update", v5, 2u);
    }

    -[NSTimer invalidate](self->_updateTimer, "invalidate");
    updateTimer = self->_updateTimer;
    self->_updateTimer = 0;

  }
}

- (void)_processTripIds
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  char v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Processing current requested tripIDs", buf, 2u);
  }

  v10 = 0;
  os_unfair_lock_lock(&self->_updatersLock);
  -[NSHashTable allObjects](self->_updaters, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitVehicleUpdateRequester _tripIdsForUpdaters:filteredTripIDs:](self, "_tripIdsForUpdaters:filteredTripIDs:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_updatersLock);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_processedTripIdsLock);
  v7 = -[NSMutableSet count](self->_processedTripIds, "count");
  objc_msgSend(v6, "minusSet:", self->_processedTripIds);
  os_unfair_lock_unlock(&self->_processedTripIdsLock);
  os_unfair_lock_lock(&self->_inflightTripIdsLock);
  v8 = -[NSMutableSet count](self->_inflightTripIds, "count");
  objc_msgSend(v6, "minusSet:", self->_inflightTripIds);
  os_unfair_lock_unlock(&self->_inflightTripIdsLock);
  if (objc_msgSend(v6, "count"))
  {
    -[GEOTransitVehicleUpdateRequester _cancelUpdateTimer](self, "_cancelUpdateTimer");
    -[GEOTransitVehicleUpdateRequester _sendRequestForTripIds:](self, "_sendRequestForTripIds:", v6);
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v12 = v8;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "No tripIDs to process (%lu in-flight, %lu processed)", buf, 0x16u);
    }

    if (v10)
      -[GEOTransitVehicleUpdateRequester _scheduleUpdateTimerWithInterval:](self, "_scheduleUpdateTimerWithInterval:", self->_requestInterval);
  }

}

- (id)_tripIdsForUpdaters:(id)a3 filteredTripIDs:(BOOL *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  BOOL *v21;
  id v22;
  id obj;
  BOOL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v21 = a4;
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v7)
    {
      v8 = v7;
      v24 = 0;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v11, "tripIDs", v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");
          if (objc_msgSend(v12, "count")
            && (objc_msgSend(v11, "delegate"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_opt_respondsToSelector(),
                v14,
                (v15 & 1) != 0))
          {
            objc_msgSend(v11, "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "transitVehicleUpdater:shouldUpdateVehiclePositionsForTripIDs:", v11, v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = v24 || v13 != objc_msgSend(v17, "count");
            v24 = v18;
            GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138478083;
              v30 = v17;
              v31 = 2112;
              v32 = v11;
              _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_INFO, "Validated tripIDs %{private}@ for %@", buf, 0x16u);
            }

          }
          else
          {
            v17 = v12;
          }
          objc_msgSend(v6, "unionSet:", v17);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v8);
    }
    else
    {
      v24 = 0;
    }

    if (v21)
      *v21 = v24;
    v5 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_sendRequestForTripIds:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  GEOMapServiceTicket *ticket;
  GEOMapServiceTicket *v22;
  GEOTransitVehicleUpdateRequester *val;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_updatersLock);
    val = self;
    -[NSHashTable allObjects](self->_updaters, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_updatersLock);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v10, "isActive"))
          {
            objc_msgSend(v10, "delegate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_opt_respondsToSelector();

            if ((v12 & 1) != 0)
            {
              v13 = objc_alloc(MEMORY[0x1E0C99E20]);
              objc_msgSend(v10, "tripIDs");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = (void *)objc_msgSend(v13, "initWithSet:", v14);

              objc_msgSend(v15, "intersectSet:", v4);
              if (objc_msgSend(v15, "count"))
              {
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __59__GEOTransitVehicleUpdateRequester__sendRequestForTripIds___block_invoke;
                block[3] = &unk_1E1C00738;
                block[4] = v10;
                v28 = v15;
                dispatch_async(MEMORY[0x1E0C80D38], block);

              }
            }
          }
        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v7);
    }

    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v34 = v4;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_INFO, "Sending request for tripIDs %{private}@", buf, 0xCu);
    }

    os_unfair_lock_lock(&val->_inflightTripIdsLock);
    -[NSMutableSet unionSet:](val->_inflightTripIds, "unionSet:", v4);
    os_unfair_lock_unlock(&val->_inflightTripIdsLock);
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "defaultTraits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ticketForTransitTripIdentifiers:traits:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    ticket = val->_ticket;
    val->_ticket = (GEOMapServiceTicket *)v20;

    objc_initWeak((id *)buf, val);
    v22 = val->_ticket;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__GEOTransitVehicleUpdateRequester__sendRequestForTripIds___block_invoke_15;
    v24[3] = &unk_1E1C02268;
    objc_copyWeak(&v26, (id *)buf);
    v25 = v4;
    -[GEOMapServiceTicket submitWithHandler:networkActivity:](v22, "submitWithHandler:networkActivity:", v24, 0);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "No tripIDs to request", buf, 2u);
    }
  }

}

void __59__GEOTransitVehicleUpdateRequester__sendRequestForTripIds___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitVehicleUpdater:willUpdateVehiclePositionsForTripIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __59__GEOTransitVehicleUpdateRequester__sendRequestForTripIds___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_sync_enter(v8);
    v9 = (void *)v8[7];
    v8[7] = 0;

    objc_sync_exit(v8);
    objc_msgSend(v8, "_handleMapItems:error:forTripIDs:", v10, v5, *(_QWORD *)(a1 + 32));
  }

}

- (void)_handleMapItems:(id)a3 error:(id)a4 forTripIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  NSObject *v62;
  _BOOL4 v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  BOOL v70;
  unint64_t maxRetries;
  unint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t j;
  void *v79;
  void *v80;
  char v81;
  id v82;
  void *v83;
  void *v84;
  GEOTransitVehicleUpdateRequester *v85;
  id v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  id obj;
  void *v92;
  uint64_t v93;
  id v94;
  void *v95;
  _QWORD v96[5];
  NSObject *v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[5];
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD block[5];
  id v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  uint8_t v125[128];
  uint8_t buf[4];
  uint64_t v127;
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  id v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_updatersLock);
  -[NSHashTable allObjects](self->_updaters, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_updatersLock);
  os_unfair_lock_lock(&self->_inflightTripIdsLock);
  -[NSMutableSet minusSet:](self->_inflightTripIds, "minusSet:", v10);
  os_unfair_lock_unlock(&self->_inflightTripIdsLock);
  v94 = v10;
  v86 = v8;
  v87 = v11;
  v88 = v9;
  v85 = self;
  if (v9)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412547;
      v127 = (uint64_t)v9;
      v128 = 2113;
      v129 = (uint64_t)v10;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Error %@ for requested tripIDs %{private}@", buf, 0x16u);
    }

    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v121;
      v17 = MEMORY[0x1E0C80D38];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v121 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
          if (objc_msgSend(v19, "isActive"))
          {
            objc_msgSend(v19, "delegate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_opt_respondsToSelector();

            if ((v21 & 1) != 0)
            {
              v22 = objc_alloc(MEMORY[0x1E0C99E20]);
              objc_msgSend(v19, "tripIDs");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = (void *)objc_msgSend(v22, "initWithSet:", v23);

              objc_msgSend(v24, "intersectSet:", v94);
              if (objc_msgSend(v24, "count"))
              {
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke;
                block[3] = &unk_1E1C01790;
                block[4] = v19;
                v118 = v24;
                v119 = v88;
                dispatch_async(v17, block);

              }
            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
      }
      while (v15);
    }

    v25 = v88;
    objc_msgSend(v88, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqualToString:", v27))
    {
      v28 = v86;
      if (objc_msgSend(v88, "code") == -8)
      {

        v29 = v94;
      }
      else
      {
        v69 = objc_msgSend(v88, "code");

        v70 = v69 == -11;
        v29 = v94;
        if (!v70)
          goto LABEL_83;
      }
      maxRetries = v85->_maxRetries;
      v72 = v85->_numRetries + 1;
      v85->_numRetries = v72;
      if (v72 <= maxRetries)
      {
        -[GEOTransitVehicleUpdateRequester _scheduleUpdateTimerWithInterval:](v85, "_scheduleUpdateTimerWithInterval:", v85->_requestInterval);
        goto LABEL_83;
      }
      v85->_numRetries = 0;
      v113 = 0u;
      v114 = 0u;
      v115 = 0u;
      v116 = 0u;
      v73 = v13;
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v113, v133, 16);
      if (v74)
      {
        v75 = v74;
        v76 = *(_QWORD *)v114;
        v77 = MEMORY[0x1E0C80D38];
        do
        {
          for (j = 0; j != v75; ++j)
          {
            if (*(_QWORD *)v114 != v76)
              objc_enumerationMutation(v73);
            v79 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
            if (objc_msgSend(v79, "isActive"))
            {
              objc_msgSend(v79, "delegate");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = objc_opt_respondsToSelector();

              if ((v81 & 1) != 0)
              {
                v82 = objc_alloc(MEMORY[0x1E0C99E20]);
                objc_msgSend(v79, "tripIDs");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = (void *)objc_msgSend(v82, "initWithSet:", v83);

                objc_msgSend(v84, "intersectSet:", v94);
                if (objc_msgSend(v84, "count"))
                {
                  v111[0] = MEMORY[0x1E0C809B0];
                  v111[1] = 3221225472;
                  v111[2] = __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke_2;
                  v111[3] = &unk_1E1C00738;
                  v111[4] = v79;
                  v112 = v84;
                  dispatch_async(v77, v111);

                }
              }
            }
          }
          v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v113, v133, 16);
        }
        while (v75);
      }

      v28 = v86;
      v25 = v88;
    }
    else
    {

      v28 = v86;
    }
    v29 = v94;
  }
  else
  {
    self->_numRetries = 0;
    os_unfair_lock_lock(&self->_processedTripIdsLock);
    -[NSMutableSet unionSet:](self->_processedTripIds, "unionSet:", v10);
    os_unfair_lock_unlock(&self->_processedTripIdsLock);
    v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v30 = v8;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v107, v132, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v108;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v108 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * k), "_transitVehiclePosition");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              GEOTransitVehiclePositionDescription(v35);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v35, "tripID");
              *(_DWORD *)buf = 138412547;
              v127 = (uint64_t)v37;
              v128 = 2049;
              v129 = v38;
              _os_log_impl(&dword_1885A9000, v36, OS_LOG_TYPE_INFO, "Received %@ for tripID %{private}lu", buf, 0x16u);

            }
            objc_msgSend(v95, "addObject:", v35);
          }

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v107, v132, 16);
      }
      while (v32);
    }

    v39 = objc_msgSend(v95, "count");
    v29 = v10;
    if (v39 != objc_msgSend(v10, "count"))
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v41 = objc_msgSend(v95, "count");
        v42 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134218499;
        v127 = v41;
        v128 = 2048;
        v129 = v42;
        v130 = 2113;
        v131 = v10;
        _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_DEBUG, "Received %lu/%lu positions from requested tripIDs %{private}@", buf, 0x20u);
      }

    }
    v105 = 0u;
    v106 = 0u;
    v104 = 0u;
    v103 = 0u;
    obj = v87;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
    v44 = 0x1E0C99000uLL;
    if (v43)
    {
      v45 = v43;
      v46 = *(_QWORD *)v104;
      v89 = *(_QWORD *)v104;
      do
      {
        v47 = 0;
        v90 = v45;
        do
        {
          if (*(_QWORD *)v104 != v46)
            objc_enumerationMutation(obj);
          v48 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v47);
          if (objc_msgSend(v48, "isActive"))
          {
            v49 = objc_alloc(*(Class *)(v44 + 3616));
            objc_msgSend(v48, "tripIDs");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = (void *)objc_msgSend(v49, "initWithSet:", v50);

            objc_msgSend(v51, "intersectSet:", v29);
            if (objc_msgSend(v51, "count"))
            {
              v92 = v48;
              v93 = v47;
              v52 = objc_msgSend(objc_alloc(*(Class *)(v44 + 3616)), "initWithCapacity:", objc_msgSend(v95, "count"));
              v99 = 0u;
              v100 = 0u;
              v101 = 0u;
              v102 = 0u;
              v53 = v95;
              v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v99, v124, 16);
              if (v54)
              {
                v55 = v54;
                v56 = *(_QWORD *)v100;
                do
                {
                  for (m = 0; m != v55; ++m)
                  {
                    if (*(_QWORD *)v100 != v56)
                      objc_enumerationMutation(v53);
                    v58 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * m);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v58, "tripID"));
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    v60 = objc_msgSend(v51, "containsObject:", v59);

                    if (v60)
                      -[NSObject addObject:](v52, "addObject:", v58);
                  }
                  v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v99, v124, 16);
                }
                while (v55);
              }

              v61 = -[NSObject count](v52, "count");
              GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
              v62 = objc_claimAutoreleasedReturnValue();
              v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG);
              if (v61)
              {
                v47 = v93;
                if (v63)
                {
                  objc_msgSend(v92, "delegate");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  v65 = objc_msgSend(v53, "count");
                  objc_msgSend(v53, "valueForKey:", CFSTR("tripID"));
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v127 = (uint64_t)v64;
                  v128 = 2048;
                  v129 = v65;
                  v130 = 2112;
                  v131 = v66;
                  _os_log_impl(&dword_1885A9000, v62, OS_LOG_TYPE_DEBUG, "Sending %@ %lu positions, tripIDs:%@", buf, 0x20u);

                }
                v96[0] = MEMORY[0x1E0C809B0];
                v96[1] = 3221225472;
                v96[2] = __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke_23;
                v96[3] = &unk_1E1C01790;
                v96[4] = v92;
                v52 = v52;
                v97 = v52;
                v98 = v51;
                dispatch_async(MEMORY[0x1E0C80D38], v96);

                v29 = v94;
                v44 = 0x1E0C99000;
                v46 = v89;
              }
              else
              {
                v44 = 0x1E0C99000;
                v46 = v89;
                v47 = v93;
                if (v63)
                {
                  objc_msgSend(v92, "delegate");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v127 = (uint64_t)v68;
                  _os_log_impl(&dword_1885A9000, v62, OS_LOG_TYPE_DEBUG, "%@ wants different tripIDs than we just received", buf, 0xCu);

                }
                v29 = v94;
              }
              v45 = v90;
            }
            else
            {
              GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v48, "delegate");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v127 = (uint64_t)v67;
                _os_log_impl(&dword_1885A9000, v52, OS_LOG_TYPE_DEBUG, "%@ did not request any of these tripIDs", buf, 0xCu);

              }
            }

          }
          ++v47;
        }
        while (v47 != v45);
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
      }
      while (v45);
    }

    -[GEOTransitVehicleUpdateRequester _scheduleUpdateTimerWithInterval:](v85, "_scheduleUpdateTimerWithInterval:", v85->_requestInterval);
    v28 = v86;
    v25 = 0;
  }
LABEL_83:

}

void __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitVehicleUpdater:didFailUpdateForTripIDs:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitVehicleUpdater:didTimeoutUpdateForTripIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke_23(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitVehicleUpdater:didUpdateVehiclePositions:forTripIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_removeTripIdsIfApplicable:(id)a3
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
  GEOTransitVehicleUpdateRequester *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_updatersLock);
    -[NSHashTable allObjects](self->_updaters, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_updatersLock);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v4);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      v23 = self;
      v24 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v12, "tripIDs", v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToSet:", v4);

          if ((v14 & 1) == 0)
          {
            objc_msgSend(v12, "tripIDs");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "allObjects");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v26;
              while (2)
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v26 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
                  if (objc_msgSend(v6, "containsObject:", v22))
                  {
                    objc_msgSend(v6, "removeObject:", v22);
                    if (!objc_msgSend(v6, "count"))
                    {

                      goto LABEL_22;
                    }
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
                if (v19)
                  continue;
                break;
              }
            }

            v10 = v24;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        self = v23;
      }
      while (v9);
    }

    os_unfair_lock_lock(&self->_processedTripIdsLock);
    -[NSMutableSet minusSet:](self->_processedTripIds, "minusSet:", v6);
    os_unfair_lock_unlock(&self->_processedTripIdsLock);
LABEL_22:

  }
}

- (NSHashTable)updaters
{
  return self->_updaters;
}

- (NSMutableSet)processedTripIds
{
  return self->_processedTripIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_inflightTripIds, 0);
  objc_storeStrong((id *)&self->_processedTripIds, 0);
  objc_storeStrong((id *)&self->_updaters, 0);
}

- (void)mockProcessedIds:(id)a3
{
  -[NSMutableSet unionSet:](self->_processedTripIds, "unionSet:", a3);
}

@end
