@implementation MNSessionUpdateManager

- (MNSessionUpdateManager)init
{
  MNSessionUpdateManager *v2;
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *subscribers;
  double v6;
  double etaRequestInterval;
  MNSessionUpdateManager *v8;
  __int16 v10[8];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MNSessionUpdateManager;
  v2 = -[MNSessionUpdateManager init](&v11, sel_init);
  if (v2)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Initializing.", (uint8_t *)v10, 2u);
    }

    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    subscribers = v2->_subscribers;
    v2->_subscribers = v4;

    v2->_isPaused = 1;
    GEOConfigGetDouble();
    if (v6 < 5.0)
      v6 = 5.0;
    v2->_etaRequestInterval = v6;
    GEOConfigGetDouble();
    if (etaRequestInterval <= 0.0)
      etaRequestInterval = v2->_etaRequestInterval;
    v2->_initialRequestDelay = etaRequestInterval;
    v2->_opportunisticRequestTimeWindow = 150.0;
    v2->_maxAlternateRoutesCount = 2;
    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  GEOETATrafficUpdateRequest *pendingETARequest;
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  -[NSTimer invalidate](self->_etaTimer, "invalidate");
  -[GEOTransitRouteUpdater setActive:](self->_transitUpdater, "setActive:", 0);
  pendingETARequest = self->_pendingETARequest;
  if (pendingETARequest && -[GEOETATrafficUpdateRequest hasXpcUuid](pendingETARequest, "hasXpcUuid"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D27068]);
    objc_msgSend(v4, "cancelRequest:", self->_pendingETARequest);

  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Deallocated.", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)MNSessionUpdateManager;
  -[MNSessionUpdateManager dealloc](&v6, sel_dealloc);
}

- (void)startUpdateRequestsForRoutes:(id)a3 andNavigationType:(int64_t)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  int64_t v9;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__MNSessionUpdateManager_startUpdateRequestsForRoutes_andNavigationType___block_invoke;
    v7[3] = &unk_1E61D2968;
    v9 = a4;
    v7[4] = self;
    v8 = v6;
    MNRunAsynchronouslyOnMainThread(v7);

  }
  else
  {
    -[MNSessionUpdateManager stopUpdateRequests](self, "stopUpdateRequests");
  }

}

void __73__MNSessionUpdateManager_startUpdateRequestsForRoutes_andNavigationType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) == 3)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ETA updates already started."));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = "-[MNSessionUpdateManager startUpdateRequestsForRoutes:andNavigationType:]_block_invoke";
        v41 = 2080;
        v42 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
        v43 = 1024;
        v44 = 157;
        v45 = 2080;
        v46 = "_etaTimer == nil";
        v47 = 2112;
        v48 = v31;
        _os_log_impl(&dword_1B0AD7000, v32, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = v2;

    objc_msgSend(*(id *)(a1 + 32), "_scheduleETATimerWithInterval:", *(double *)(*(_QWORD *)(a1 + 32) + 80));
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v33 = a1;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v12, "transitRouteUpdateRequest");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v12, "route");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "suggestedRoute");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "supportsRouteUpdates");

          if (v16)
          {
            if (fabs(v10) < 0.000001)
            {
              objc_msgSend(v12, "route");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "transitUpdateInitialDelay");
              v10 = v18;

            }
            objc_msgSend(v5, "addObject:", v13);
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  v19 = objc_msgSend(v5, "count");
  v20 = *(void **)(*(_QWORD *)(v33 + 32) + 48);
  if (v19)
  {
    if (!v20)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27620]), "initWithDelegate:andInitialTTL:", *(_QWORD *)(v33 + 32), v10);
      v22 = *(_QWORD *)(v33 + 32);
      v23 = *(void **)(v22 + 48);
      *(_QWORD *)(v22 + 48) = v21;

      GEOFindOrCreateLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(const char **)(*(_QWORD *)(v33 + 32) + 48);
        v26 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 138412546;
        v40 = v25;
        v41 = 2048;
        v42 = (const char *)v26;
        _os_log_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_DEFAULT, "creating transit updater %@ for %lu requests", buf, 0x16u);
      }

      v20 = *(void **)(*(_QWORD *)(v33 + 32) + 48);
    }
    objc_msgSend(v20, "setRequests:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(v33 + 32) + 48), "setActive:", *(_BYTE *)(*(_QWORD *)(v33 + 32) + 120) == 0);
  }
  else if (v20)
  {
    GEOFindOrCreateLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(const char **)(*(_QWORD *)(v33 + 32) + 48);
      *(_DWORD *)buf = 138412290;
      v40 = v28;
      _os_log_impl(&dword_1B0AD7000, v27, OS_LOG_TYPE_DEFAULT, "tearing down transit updater %@ because we have no requests", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(v33 + 32) + 48), "setActive:", 0);
    v29 = *(_QWORD *)(v33 + 32);
    v30 = *(void **)(v29 + 48);
    *(_QWORD *)(v29 + 48) = 0;

  }
}

- (void)stopUpdateRequests
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__MNSessionUpdateManager_stopUpdateRequests__block_invoke;
  v2[3] = &unk_1E61D23C8;
  v2[4] = self;
  MNRunAsynchronouslyOnMainThread(v2);
}

uint64_t __44__MNSessionUpdateManager_stopUpdateRequests__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v6[16];

  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "stopping transit/ETA updates", v6, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setActive:", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_terminateETARequests");
}

- (void)restartUpdateTimer
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__MNSessionUpdateManager_restartUpdateTimer__block_invoke;
  v2[3] = &unk_1E61D23C8;
  v2[4] = self;
  MNRunAsynchronouslyOnMainThread(v2);
}

uint64_t __44__MNSessionUpdateManager_restartUpdateTimer__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 64))
  {
    v1 = result;
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "restarting ETA updates", v5, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 64), "invalidate");
    v3 = *(_QWORD *)(v1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = 0;

    return objc_msgSend(*(id *)(v1 + 32), "_continueETARequests");
  }
  return result;
}

- (void)sendFinalETAURequestWithReason:(unint64_t)a3
{
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "wantsETAUpdates");

  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "Sending final ETA update.", v9, 2u);
    }

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setReason:", a3);
    objc_msgSend(v8, "setShouldUseConditionalRequest:", 0);
    objc_msgSend(v8, "setShouldRepeatAfterCompletion:", 0);
    objc_msgSend(v8, "setShouldRetryImmediatelyOnError:", 0);
    objc_msgSend(v8, "setShouldTrackPendingRequest:", 0);
    -[MNSessionUpdateManager _sendETARequestWithParameters:](self, "_sendETARequestWithParameters:", v8);

  }
}

- (void)requestImmediateUpdateWithReason:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__MNSessionUpdateManager_requestImmediateUpdateWithReason___block_invoke;
  v3[3] = &unk_1E61D23F0;
  v3[4] = self;
  v3[5] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

uint64_t __59__MNSessionUpdateManager_requestImmediateUpdateWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "Requesting immediate ETAU update.", v4, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_cancelPendingETARequest");
  return objc_msgSend(*(id *)(a1 + 32), "_sendETARequestWithReason:", *(_QWORD *)(a1 + 40));
}

- (void)requestUpdateForETAUPosition:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MNSessionUpdateManager_requestUpdateForETAUPosition___block_invoke;
  v6[3] = &unk_1E61D1D10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  MNRunAsynchronouslyOnMainThread(v6);

}

void __55__MNSessionUpdateManager_requestUpdateForETAUPosition___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  double v14;
  NSObject *v15;
  double v16;
  int v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isValid"))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 104))
    {
      GEOFindOrCreateLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "Last request was server-driven. Skipping server update.", (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v3 = objc_claimAutoreleasedReturnValue();
      v2 = v3;
      v4 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v4 + 96))
      {
        -[NSObject timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
        v6 = v5;
        objc_msgSend(*(id *)(a1 + 40), "timeSinceLastUpdate");
        if (v6 < v7)
        {
          GEOFindOrCreateLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "timeSinceLastUpdate");
            v17 = 134218240;
            v18 = v6;
            v19 = 2048;
            v20 = v16;
            _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_DEFAULT, "Time since last update (%f seconds ago) is within minimum (%f seconds). Skipping server update.", (uint8_t *)&v17, 0x16u);
          }

          goto LABEL_14;
        }
        v4 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*(id *)(v4 + 64), "fireDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v2);
      v10 = v9;

      v11 = v10 + *(double *)(*(_QWORD *)(a1 + 32) + 72);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setFireDate:", v12);

      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "routeCoordinate");
        GEOPolylineCoordinateAsShortString();
        v14 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v17 = 138412546;
        v18 = v14;
        v19 = 2048;
        v20 = v11;
        _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEFAULT, "Request ETA update for server provided position at [%@]. Scheduling the next update for %f seconds from now", (uint8_t *)&v17, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_sendETARequestWithReason:", 2);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 1;
    }
LABEL_14:

  }
}

- (void)pauseUpdateRequestsForSubscriber:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__MNSessionUpdateManager_pauseUpdateRequestsForSubscriber___block_invoke;
    v7[3] = &unk_1E61D1D10;
    v7[4] = self;
    v8 = v4;
    MNRunAsynchronouslyOnMainThread(v7);

  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v10 = "-[MNSessionUpdateManager pauseUpdateRequestsForSubscriber:]";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      v13 = 1024;
      v14 = 277;
      v15 = 2080;
      v16 = "subscriber != nil";
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }

  }
}

void __59__MNSessionUpdateManager_pauseUpdateRequestsForSubscriber___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v6 = v2;
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
    v3 = v6;
    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", &unk_1E620F7D0, *(_QWORD *)(a1 + 40));
      v5 = objc_msgSend(*(id *)(a1 + 32), "_hasAtLeastOneActiveSubscriber");
      v3 = v6;
      if ((v5 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 1;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setActive:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) == 0);
        v3 = v6;
      }
    }
  }

}

- (void)resumeUpdateRequestsForSubscriber:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__MNSessionUpdateManager_resumeUpdateRequestsForSubscriber___block_invoke;
    v7[3] = &unk_1E61D1D10;
    v7[4] = self;
    v8 = v4;
    MNRunAsynchronouslyOnMainThread(v7);

  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v10 = "-[MNSessionUpdateManager resumeUpdateRequestsForSubscriber:]";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      v13 = 1024;
      v14 = 300;
      v15 = 2080;
      v16 = "subscriber != nil";
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }

  }
}

void __60__MNSessionUpdateManager_resumeUpdateRequestsForSubscriber___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "unsignedIntegerValue") != 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", &unk_1E620F7E8, *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setActive:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) == 0);
  }

}

- (void)_scheduleETATimerWithInterval:(double)a3
{
  id WeakRetained;
  char v6;
  void *v7;
  NSTimer *v8;
  NSTimer *etaTimer;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  _BYTE location[12];
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[MNSessionUpdateManager _scheduleETATimerWithInterval:]";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      v17 = 1024;
      v18 = 323;
      v19 = 2080;
      v20 = "[NSThread isMainThread]";
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", location, 0x26u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "wantsETAUpdates");

  if ((v6 & 1) != 0)
  {
    -[NSTimer invalidate](self->_etaTimer, "invalidate");
    objc_initWeak((id *)location, self);
    v7 = (void *)MEMORY[0x1E0C99E88];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__MNSessionUpdateManager__scheduleETATimerWithInterval___block_invoke;
    v12[3] = &unk_1E61D82F8;
    v12[4] = self;
    objc_copyWeak(&v13, (id *)location);
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v12, a3);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    etaTimer = self->_etaTimer;
    self->_etaTimer = v8;

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
    }

  }
}

void __56__MNSessionUpdateManager__scheduleETATimerWithInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_sendETARequestWithReason:", 1);

}

- (void)_continueETARequests
{
  id WeakRetained;
  char v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "wantsETAUpdates");

  if ((v4 & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__MNSessionUpdateManager__continueETARequests__block_invoke;
    v6[3] = &unk_1E61D23C8;
    v6[4] = self;
    MNRunAsynchronouslyOnMainThread(v6);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

  }
}

uint64_t __46__MNSessionUpdateManager__continueETARequests__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleETATimerWithInterval:", *(double *)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)_terminateETARequests
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315906;
      v5 = "-[MNSessionUpdateManager _terminateETARequests]";
      v6 = 2080;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      v8 = 1024;
      v9 = 354;
      v10 = 2080;
      v11 = "[NSThread isMainThread]";
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v4, 0x26u);
    }

  }
  -[NSTimer invalidate](self->_etaTimer, "invalidate");
  -[MNSessionUpdateManager _cancelPendingETARequest](self, "_cancelPendingETARequest");
}

- (void)_cancelPendingETARequest
{
  GEOETATrafficUpdateRequest *pendingETARequest;
  id v4;
  GEOETATrafficUpdateRequest *v5;
  GEOComposedETARoute *pendingETARoute;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315906;
      v9 = "-[MNSessionUpdateManager _cancelPendingETARequest]";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      v12 = 1024;
      v13 = 362;
      v14 = 2080;
      v15 = "[NSThread isMainThread]";
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v8, 0x26u);
    }

  }
  pendingETARequest = self->_pendingETARequest;
  if (pendingETARequest)
  {
    if (-[GEOETATrafficUpdateRequest hasXpcUuid](pendingETARequest, "hasXpcUuid"))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0D27068]);
      objc_msgSend(v4, "cancelRequest:", self->_pendingETARequest);

    }
    v5 = self->_pendingETARequest;
    self->_pendingETARequest = 0;

    pendingETARoute = self->_pendingETARoute;
    self->_pendingETARoute = 0;

  }
}

- (void)_updateRouteAttributesFor:(id)a3 route:(id)a4 updatedLocation:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  void *v31;
  char v32;
  MNRouteAttributes *v33;
  MNRouteAttributes *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v37 = a6;
  objc_msgSend(v11, "_navigation_geoLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "latLng");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = v14;
  if (v13)
  {
    objc_msgSend(v14, "addObject:", v13);
  }
  else
  {
    objc_msgSend(v10, "origin");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "latLng");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

  }
  objc_msgSend(v11, "routeMatch");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "legIndex");

  objc_msgSend(v10, "legs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v19 < v21)
  {
    do
    {
      objc_msgSend(v10, "legs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "destination");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "latLng");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v25);

      ++v19;
      objc_msgSend(v10, "legs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

    }
    while (v19 < v27);
  }
  objc_msgSend(v9, "routeAttributes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v30 = v9;
  }
  else
  {
    objc_msgSend(v10, "routeAttributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = objc_opt_isKindOfClass();

    if ((v32 & 1) == 0)
    {
      v34 = [MNRouteAttributes alloc];
      objc_msgSend(v10, "routeAttributes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[MNRouteAttributes initWithAttributes:latLngs:](v34, "initWithAttributes:latLngs:", v35, v15);

      goto LABEL_12;
    }
    v30 = v10;
  }
  objc_msgSend(v30, "routeAttributes");
  v33 = (MNRouteAttributes *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __85__MNSessionUpdateManager__updateRouteAttributesFor_route_updatedLocation_completion___block_invoke;
  v38[3] = &unk_1E61D8320;
  v39 = v37;
  v36 = v37;
  -[MNRouteAttributes buildRouteAttributesForETAUpdateRequest:queue:result:](v33, "buildRouteAttributesForETAUpdateRequest:queue:result:", v9, MEMORY[0x1E0C80D38], v38);

}

void __85__MNSessionUpdateManager__updateRouteAttributesFor_route_updatedLocation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "Error updating route attributes with LPR/Vehicle info: %@. Continuing ETA update anyway", (uint8_t *)&v8, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_sendETARequestWithReason:(unint64_t)a3
{
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setReason:", a3);
  objc_msgSend(v5, "setShouldUseConditionalRequest:", self->_opportunisticRequestTimeWindow > 0.0);
  objc_msgSend(v5, "setShouldRepeatAfterCompletion:", 1);
  objc_msgSend(v5, "setShouldRetryImmediatelyOnError:", 1);
  objc_msgSend(v5, "setShouldTrackPendingRequest:", 1);
  -[MNSessionUpdateManager _sendETARequestWithParameters:](self, "_sendETARequestWithParameters:", v5);

}

- (void)_sendETARequestWithParameters:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const __CFString *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSDate *v27;
  NSDate *dateOfLastUpdate;
  NSObject *v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  int v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  const __CFString *v48;
  const __CFString *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  __CFString *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  MNSessionUpdateManager *v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t *v78;
  _QWORD *v79;
  id v80;
  _QWORD v81[4];
  id v82;
  MNSessionUpdateManager *v83;
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  uint64_t *v89;
  _QWORD *v90;
  uint64_t *v91;
  id v92[2];
  id location;
  _QWORD v94[5];
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint8_t buf[4];
  const __CFString *v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  const __CFString *v119;
  __int16 v120;
  const __CFString *v121;
  __int16 v122;
  void *v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "wantsETAUpdates");

  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      v9 = objc_msgSend(v4, "reason");
      if ((unint64_t)(v9 - 1) > 6)
        v10 = CFSTR("Unknown");
      else
        v10 = off_1E61D8430[v9 - 1];
      *(_DWORD *)buf = 138412290;
      v115 = v10;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to make ETATrafficUpdate request for reason: %@", buf, 0xCu);
    }

    if (self->_pendingETARequest)
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Not sending ETAU request because one is already in progress.", buf, 2u);
      }

      goto LABEL_53;
    }
    v108 = 0;
    v109 = &v108;
    v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__18;
    v112 = __Block_byref_object_dispose__18;
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "routeInfoForUpdateManager:reason:", self, objc_msgSend(v4, "reason"));
    v113 = (id)objc_claimAutoreleasedReturnValue();

    if (!v109[5])
    {
      GEOFindOrCreateLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v38, OS_LOG_TYPE_DEFAULT, "No route provided to ETATrafficUpdate request. Skipping update.", buf, 2u);
      }

      if (objc_msgSend(v4, "shouldRepeatAfterCompletion"))
        -[MNSessionUpdateManager _continueETARequests](self, "_continueETARequests");
      goto LABEL_52;
    }
    v102 = 0;
    v103 = &v102;
    v104 = 0x3032000000;
    v105 = __Block_byref_object_copy__18;
    v106 = __Block_byref_object_dispose__18;
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "userLocationForUpdateManager:", self);
    v107 = (id)objc_claimAutoreleasedReturnValue();

    v14 = (void *)v103[5];
    if (v14)
    {
      objc_msgSend(v14, "routeMatch");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "routeCoordinate");
      objc_msgSend((id)v109[5], "route");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = objc_msgSend(v17, "pointCount") > v16;

      if ((v16 & 1) != 0)
      {
        -[MNSessionUpdateManager _baseETARequest](self, "_baseETARequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "routeAttributes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setRouteAttributes:", v19);

        objc_msgSend(v18, "setPurpose:", -[MNSessionUpdateManager _purposeForReason:](self, "_purposeForReason:", objc_msgSend(v4, "reason")));
        v96 = 0;
        v97 = &v96;
        v98 = 0x3032000000;
        v99 = __Block_byref_object_copy__18;
        v100 = __Block_byref_object_dispose__18;
        -[MNSessionUpdateManager _updateETARequest:withRouteInfo:andUserLocation:](self, "_updateETARequest:withRouteInfo:andUserLocation:", v18, v109[5], v103[5]);
        v101 = (id)objc_claimAutoreleasedReturnValue();
        if (v97[5])
        {
          if (objc_msgSend(v4, "shouldTrackPendingRequest"))
            objc_storeStrong((id *)&self->_pendingETARequest, v18);
          v94[0] = 0;
          v94[1] = v94;
          v94[2] = 0x3032000000;
          v94[3] = __Block_byref_object_copy__18;
          v94[4] = __Block_byref_object_dispose__18;
          -[MNSessionUpdateManager _updateWaypointsForRequest:routeInfo:userLocation:etaRoute:](self, "_updateWaypointsForRequest:routeInfo:userLocation:etaRoute:", v18, v109[5], v103[5], v97[5]);
          v95 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v21 = v20;
          objc_initWeak(&location, self);
          v86[0] = MEMORY[0x1E0C809B0];
          v86[1] = 3221225472;
          v86[2] = __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke;
          v86[3] = &unk_1E61D8348;
          v22 = v4;
          v87 = v22;
          v89 = &v108;
          objc_copyWeak(v92, &location);
          v23 = v18;
          v88 = v23;
          v90 = v94;
          v92[1] = v21;
          v91 = &v96;
          v64 = (void *)MEMORY[0x1B5E0E364](v86);
          v24 = objc_alloc_init(MEMORY[0x1E0D27068]);
          if ((objc_msgSend(v22, "shouldUseConditionalRequest") & 1) != 0)
          {
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3221225472;
            v71[2] = __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_2;
            v71[3] = &unk_1E61D83C0;
            objc_copyWeak(&v80, &location);
            v63 = v24;
            v72 = v63;
            v25 = v23;
            v73 = v25;
            v76 = &v108;
            v26 = v22;
            v77 = &v102;
            v78 = &v96;
            v79 = v94;
            v74 = v26;
            v75 = self;
            v62 = (void *)MEMORY[0x1B5E0E364](v71);
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
            dateOfLastUpdate = self->_dateOfLastUpdate;
            self->_dateOfLastUpdate = v27;

            GEOFindOrCreateLog();
            v29 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v61 = v24;
              objc_msgSend((id)v103[5], "coordinate");
              v31 = v30;
              objc_msgSend((id)v103[5], "coordinate");
              v33 = v32;
              objc_msgSend((id)v103[5], "routeMatch");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "routeCoordinate");
              GEOPolylineCoordinateAsShortString();
              v35 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v26, "reason");
              if ((unint64_t)(v36 - 1) > 6)
                v37 = CFSTR("Unknown");
              else
                v37 = off_1E61D8430[v36 - 1];
              objc_msgSend((id)v109[5], "routeID");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134284547;
              v115 = v31;
              v116 = 2049;
              v117 = v33;
              v118 = 2112;
              v119 = v35;
              v120 = 2112;
              v121 = v37;
              v122 = 2112;
              v123 = v57;
              _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_DEFAULT, "Starting conditional ETATrafficUpdate request from location: %{private}f, %{private}f (%@) | reason: %@ | routeID: %@", buf, 0x34u);

              v24 = v61;
            }

            objc_msgSend((id)v109[5], "route");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v103[5];
            v65[0] = MEMORY[0x1E0C809B0];
            v65[1] = 3221225472;
            v65[2] = __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_37;
            v65[3] = &unk_1E61D83E8;
            objc_copyWeak(&v70, &location);
            v66 = v25;
            v67 = v63;
            v60 = v62;
            v68 = v60;
            v69 = v64;
            -[MNSessionUpdateManager _updateRouteAttributesFor:route:updatedLocation:completion:](self, "_updateRouteAttributesFor:route:updatedLocation:completion:", v66, v58, v59, v65);

            objc_destroyWeak(&v70);
            objc_destroyWeak(&v80);
          }
          else
          {
            v46 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v46, "updateManager:willSendETARequest:", self, v23);

            GEOFindOrCreateLog();
            v47 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend((id)v103[5], "coordinate");
              v49 = v48;
              objc_msgSend((id)v103[5], "coordinate");
              v51 = v50;
              v52 = objc_msgSend(v22, "reason");
              if ((unint64_t)(v52 - 1) > 6)
                v53 = CFSTR("Unknown");
              else
                v53 = off_1E61D8430[v52 - 1];
              objc_msgSend((id)v109[5], "routeID");
              v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134284291;
              v115 = v49;
              v116 = 2049;
              v117 = v51;
              v118 = 2112;
              v119 = v53;
              v120 = 2112;
              v121 = v54;
              _os_log_impl(&dword_1B0AD7000, v47, OS_LOG_TYPE_DEFAULT, "Sending immediate ETATrafficUpdate request from location: %{private}f, %{private}f | reason: %@ | routeID: %@", buf, 0x2Au);

            }
            objc_msgSend((id)v109[5], "route");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v103[5];
            v81[0] = MEMORY[0x1E0C809B0];
            v81[1] = 3221225472;
            v81[2] = __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_34;
            v81[3] = &unk_1E61D8370;
            v82 = v23;
            v83 = self;
            v84 = v24;
            v85 = v64;
            -[MNSessionUpdateManager _updateRouteAttributesFor:route:updatedLocation:completion:](self, "_updateRouteAttributesFor:route:updatedLocation:completion:", v82, v55, v56, v81);

          }
          objc_destroyWeak(v92);

          objc_destroyWeak(&location);
          _Block_object_dispose(v94, 8);

        }
        else
        {
          GEOFindOrCreateLog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0AD7000, v45, OS_LOG_TYPE_ERROR, "Error creating ETATrafficUpdate request.", buf, 2u);
          }

          if (objc_msgSend(v4, "shouldRepeatAfterCompletion"))
            -[MNSessionUpdateManager _continueETARequests](self, "_continueETARequests");
        }
        _Block_object_dispose(&v96, 8);

        goto LABEL_51;
      }
      GEOFindOrCreateLog();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v103[5], "routeMatch");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "routeCoordinate");
        GEOPolylineCoordinateAsShortString();
        v42 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v109[5], "route");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "pointCount");
        *(_DWORD *)buf = 138412546;
        v115 = v42;
        v116 = 1024;
        LODWORD(v117) = v44;
        _os_log_impl(&dword_1B0AD7000, v40, OS_LOG_TYPE_DEFAULT, "User location [%@] is at or past end of route (%d). Skipping update.", buf, 0x12u);

      }
      if (!objc_msgSend(v4, "shouldRepeatAfterCompletion"))
        goto LABEL_51;
    }
    else
    {
      GEOFindOrCreateLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v39, OS_LOG_TYPE_ERROR, "Error creating ETATrafficUpdate request because userLocation is nil.", buf, 2u);
      }

      if ((objc_msgSend(v4, "shouldRepeatAfterCompletion") & 1) == 0)
        goto LABEL_51;
    }
    -[MNSessionUpdateManager _continueETARequests](self, "_continueETARequests");
LABEL_51:
    _Block_object_dispose(&v102, 8);

LABEL_52:
    _Block_object_dispose(&v108, 8);

    goto LABEL_53;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
  }

LABEL_53:
}

void __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  __CFString *v18;
  _QWORD *WeakRetained;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  MNSessionUpdateResponseInfo *v27;
  void *v28;
  NSObject *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7;
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v6)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    v13 = objc_msgSend(*(id *)(a1 + 32), "reason");
    if ((unint64_t)(v13 - 1) > 6)
      v14 = CFSTR("Unknown");
    else
      v14 = off_1E61D8430[v13 - 1];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "routeID");
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v5, "status");
    if ((int)v17 <= 29)
    {
      v18 = CFSTR("STATUS_SUCCESS");
      switch((int)v17)
      {
        case 0:
          goto LABEL_28;
        case 1:
          v18 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v18 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_23;
        case 5:
          v18 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if ((_DWORD)v17 != 20)
            goto LABEL_23;
          v18 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_28;
    }
    if ((int)v17 > 49)
    {
      if ((_DWORD)v17 == 50)
      {
        v18 = CFSTR("STATUS_DEDUPED");
        goto LABEL_28;
      }
      if ((_DWORD)v17 == 60)
      {
        v18 = CFSTR("VERSION_MISMATCH");
        goto LABEL_28;
      }
    }
    else
    {
      if ((_DWORD)v17 == 30)
      {
        v18 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_28;
      }
      if ((_DWORD)v17 == 40)
      {
        v18 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_28:
        *(_DWORD *)buf = 138412802;
        v31 = (const char *)v14;
        v32 = 2112;
        v33 = v16;
        v34 = 2112;
        v35[0] = v18;
        _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEFAULT, "Received ETATrafficUpdate response for reason: %@ | route: %@ | Status: %@", buf, 0x20u);

        goto LABEL_29;
      }
    }
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "reason");
    if ((unint64_t)(v11 - 1) > 6)
      v12 = CFSTR("Unknown");
    else
      v12 = off_1E61D8430[v11 - 1];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "routeID");
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v31 = (const char *)v12;
    v32 = 2112;
    v33 = v15;
    v34 = 2112;
    v35[0] = v6;
    _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Received ETATrafficUpdate error for reason: %@ | route: %@ | Error: %@", buf, 0x20u);

  }
LABEL_29:

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v31 = "-[MNSessionUpdateManager _sendETARequestWithParameters:]_block_invoke";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      v34 = 1024;
      LODWORD(v35[0]) = 480;
      WORD2(v35[0]) = 2080;
      *(_QWORD *)((char *)v35 + 6) = "[NSThread isMainThread]";
      _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(v6, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", v21))
    {
      v22 = objc_msgSend(v6, "code");

      if (v22 == -2)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "shouldRepeatAfterCompletion"))
          objc_msgSend(WeakRetained, "_continueETARequests");
        goto LABEL_47;
      }
    }
    else
    {

    }
    if (v6
      && objc_msgSend(*(id *)(a1 + 32), "shouldRetryImmediatelyOnError")
      && (objc_msgSend(*(id *)(a1 + 40), "routeAttributes"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend(v23, "shouldRetryForError:", v6),
          v23,
          v24))
    {
      objc_msgSend(*(id *)(a1 + 32), "setShouldRetryImmediatelyOnError:", 0);
      if (objc_msgSend(*(id *)(a1 + 32), "shouldTrackPendingRequest"))
      {
        v25 = (void *)WeakRetained[16];
        WeakRetained[16] = 0;

      }
      objc_msgSend(*(id *)(a1 + 40), "routeAttributes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setRouteAttributes:", v26);

      objc_msgSend(WeakRetained, "_sendETARequestWithParameters:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v27 = objc_alloc_init(MNSessionUpdateResponseInfo);
      -[MNSessionUpdateResponseInfo setWaypoints:](v27, "setWaypoints:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      -[MNSessionUpdateResponseInfo setRequest:](v27, "setRequest:", *(_QWORD *)(a1 + 40));
      -[MNSessionUpdateResponseInfo setResponse:](v27, "setResponse:", v5);
      -[MNSessionUpdateResponseInfo setError:](v27, "setError:", v6);
      -[MNSessionUpdateResponseInfo setResponseTime:](v27, "setResponseTime:", v8 - *(double *)(a1 + 80));
      if (objc_msgSend(*(id *)(a1 + 32), "shouldTrackPendingRequest"))
      {
        v28 = (void *)WeakRetained[16];
        WeakRetained[16] = 0;

      }
      objc_msgSend(WeakRetained, "_handleETAResponse:forRouteInfo:etaRoute:reason:", v27, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), objc_msgSend(*(id *)(a1 + 32), "reason"));
      if (objc_msgSend(*(id *)(a1 + 32), "shouldRepeatAfterCompletion"))
        objc_msgSend(WeakRetained, "_continueETARequests");

    }
  }
LABEL_47:

}

uint64_t __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setRouteAttributes:", a2);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v3;

  return objc_msgSend(*(id *)(a1 + 48), "sendETATrafficUpdateRequest:auditToken:throttleToken:finishedHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(a1 + 56));
}

void __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 96));
  v8 = WeakRetained;
  if (!WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelRequest:", *(_QWORD *)(a1 + 40));
    goto LABEL_13;
  }
  v9 = objc_loadWeakRetained(WeakRetained + 1);
  objc_msgSend(v9, "routeInfoForUpdateManager:reason:", v8, objc_msgSend(*(id *)(a1 + 48), "reason"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    GEOFindOrCreateLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v32 = "No route provided to ETATrafficUpdate request. Skipping update.";
    v33 = v31;
    v34 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }
  v13 = objc_loadWeakRetained(v8 + 1);
  objc_msgSend(v13, "userLocationForUpdateManager:", v8);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_msgSend(v8, "_updateETARequest:withRouteInfo:andUserLocation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 56), "_updateWaypointsForRequest:routeInfo:userLocation:etaRoute:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    v23 = objc_loadWeakRetained(v8 + 1);
    objc_msgSend(v23, "updateManager:willSendETARequest:", v8, *(_QWORD *)(a1 + 40));

    v24 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "route");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_35;
    v35[3] = &unk_1E61D8398;
    v36 = v5;
    v39 = v6;
    v27 = *(id *)(a1 + 40);
    v28 = *(_QWORD *)(a1 + 72);
    v37 = v27;
    v40 = v28;
    v29 = *(id *)(a1 + 48);
    v30 = *(_QWORD *)(a1 + 64);
    v38 = v29;
    v41 = v30;
    objc_msgSend(v8, "_updateRouteAttributesFor:route:updatedLocation:completion:", v24, v25, v26, v35);

    goto LABEL_13;
  }
  GEOFindOrCreateLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v32 = "Error creating ETATrafficUpdate request.";
    v33 = v31;
    v34 = OS_LOG_TYPE_ERROR;
LABEL_10:
    _os_log_impl(&dword_1B0AD7000, v33, v34, v32, buf, 2u);
  }
LABEL_11:

  objc_msgSend(*(id *)(a1 + 32), "cancelRequest:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "shouldRepeatAfterCompletion"))
    objc_msgSend(v8, "_continueETARequests");
LABEL_13:

}

void __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_35(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRouteAttributes:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "coordinate");
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "coordinate");
    v8 = v7;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "routeMatch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "routeCoordinate");
    GEOPolylineCoordinateAsShortString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 48), "reason");
    if ((unint64_t)(v11 - 1) > 6)
      v12 = CFSTR("Unknown");
    else
      v12 = off_1E61D8430[v11 - 1];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "routeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134219267;
    v17 = v4;
    v18 = 2049;
    v19 = v6;
    v20 = 2049;
    v21 = v8;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Sending conditional ETATrafficUpdate request %p from location: %{private}f, %{private}f (%@) | reason: %@ | routeID: %@", (uint8_t *)&v16, 0x3Eu);

  }
  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "formattedText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138477827;
    v17 = v15;
    _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_DEBUG, "Full request: %{private}@", (uint8_t *)&v16, 0xCu);

  }
}

void __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_37(uint64_t a1, void *a2)
{
  double *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRouteAttributes:", v4);
    objc_msgSend(*(id *)(a1 + 40), "sendConditionalETATrafficUpdateRequest:timeWindowDuration:auditToken:throttleToken:willSendRequestHandler:finishedHandler:", *(_QWORD *)(a1 + 32), *((_QWORD *)WeakRetained + 3), *((_QWORD *)WeakRetained + 4), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), WeakRetained[11]);
  }

}

- (id)_baseETARequest
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  GEOLatLng *tripOrigin;
  void *v15;
  id WeakRetained;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0D27060]);
  objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsUserSessionEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sessionID");
  objc_msgSend(v3, "setSessionID:", v6, v7);

  objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mapsUserSessionEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sessionRelativeTimestamp");
  objc_msgSend(v3, "setSessionRelativeTimestamp:");

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientCapabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientCapabilities:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0D26F70]);
  objc_msgSend(v12, "setIncludeTravelTimeAggressive:", 1);
  objc_msgSend(v12, "setIncludeTravelTimeConservative:", 1);
  objc_msgSend(v12, "setIncludeTravelTimeEstimate:", 1);
  objc_msgSend(v12, "setExcludeGuidance:", 1);
  objc_msgSend(v3, "setCommonOptions:", v12);
  objc_msgSend(v3, "setRequestingAppId:", self->_requestingAppIdentifier);
  objc_msgSend(v3, "setMaxAlternateRouteCount:", LODWORD(self->_maxAlternateRoutesCount));
  v13 = objc_alloc_init(MEMORY[0x1E0D27168]);
  objc_msgSend(v3, "setTripOrigin:", v13);

  tripOrigin = self->_tripOrigin;
  objc_msgSend(v3, "tripOrigin");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLatLng:", tripOrigin);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "recentLocationHistoryForUpdateManager:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRecentLocationHistory:", v17);

  return v3;
}

- (id)_updateETARequest:(id)a3 withRouteInfo:(id)a4 andUserLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  void *v20;
  id WeakRetained;
  uint64_t v22;
  id v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  NSObject *v33;
  id v35;
  void *v36;
  uint8_t v37[16];
  uint8_t buf[16];
  uint8_t v39[2];
  __int16 v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    objc_msgSend(v9, "route");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v10);
      objc_msgSend(v8, "setCurrentUserLocation:", v12);
      objc_msgSend(v10, "routeMatch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v9, "route");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "route");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 != v15)
        {
          GEOFindOrCreateLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "Route match's route does not match route parameter.", buf, 2u);
          }
          v17 = 0;
LABEL_23:

          goto LABEL_24;
        }
        objc_msgSend(v13, "routeCoordinate");
      }
      v35 = v10;
      v16 = objc_alloc_init(MEMORY[0x1E0D26F98]);
      objc_msgSend(v9, "route");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v22 = objc_msgSend(WeakRetained, "targetLegIndex");
      v23 = objc_loadWeakRetained((id *)&self->_delegate);
      v36 = v13;
      v24 = -[NSObject prepareForRequest:route:routeMatch:targetLegIndex:state:](v16, "prepareForRequest:route:routeMatch:targetLegIndex:state:", v8, v20, v13, v22, objc_msgSend(v23, "state"));

      if ((v24 & 1) != 0)
      {
        objc_storeStrong((id *)&self->_pendingETARoute, v16);
        objc_msgSend(v9, "route");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "directionsResponseID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setDirectionsResponseID:", v26);

        objc_msgSend(v8, "setEtauResponseID:", 0);
        objc_msgSend(v8, "directionsResponseID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          objc_msgSend(v9, "route");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "etauResponseID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setEtauResponseID:", v29);

        }
        objc_msgSend(v9, "displayETAInfo", v35);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "displayETAToEndOfLeg");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "timeIntervalSinceReferenceDate");
        objc_msgSend(v8, "setDisplayedEta:", v32);

        v16 = v16;
        v17 = v16;
      }
      else
      {
        GEOFindOrCreateLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl(&dword_1B0AD7000, v33, OS_LOG_TYPE_ERROR, "Unable to create ETA route for ETATrafficUpdateRequest.", v37, 2u);
        }

        v17 = 0;
      }
      v10 = v35;
      v13 = v36;
      goto LABEL_23;
    }
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v39 = 0;
      v18 = "Unable to create ETATrafficUpdateRequest because routeInfo has no route.";
      v19 = v39;
      goto LABEL_12;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v40 = 0;
      v18 = "Unable to create ETATrafficUpdateRequest because routeInfo is nil.";
      v19 = (uint8_t *)&v40;
LABEL_12:
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, v18, v19, 2u);
    }
  }
  v17 = 0;
LABEL_24:

  return v17;
}

- (id)_updateWaypointsForRequest:(id)a3 routeInfo:(id)a4 userLocation:(id)a5 etaRoute:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v10);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26FF8]), "initWithLocation:isCurrentLocation:", v12, 1);
  objc_msgSend(v11, "addObject:", v13);
  if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes())
  {
    v42 = v12;
    v43 = v10;
    v44 = v11;
    objc_msgSend(v8, "clearWaypointTypeds");
    objc_msgSend(v9, "route");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "waypoints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "count");
    objc_msgSend(v8, "waypointRoute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "routeLegs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16 - objc_msgSend(v18, "count");

    v41 = v15;
    v20 = objc_msgSend(v15, "count") - v19;
    v45 = v9;
    objc_msgSend(v9, "route");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "waypoints");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "subarrayWithRange:", v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v19, v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v52 = v25;
      _os_log_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_DEFAULT, "Creating ETAU request using waypoints from index set: %@.", buf, 0xCu);

    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v26 = v23;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v47 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v31, "geoWaypointTyped");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            objc_msgSend(v8, "addWaypointTyped:", v32);
          }
          else
          {
            objc_msgSend(v31, "chargingInfo");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              GEOFindOrCreateLog();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v52 = v31;
                _os_log_impl(&dword_1B0AD7000, v34, OS_LOG_TYPE_FAULT, "Unable to create GEOWaypointTyped from GEOComposedWaypoint for a non-EV waypoint. %@", buf, 0xCu);
              }

            }
          }

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v28);
    }

    v11 = v44;
    objc_msgSend(v44, "addObjectsFromArray:", v26);

    v9 = v45;
    v12 = v42;
    v10 = v43;
  }
  else
  {
    objc_msgSend(v8, "clearDestinationWaypointTypeds");
    objc_msgSend(v9, "route");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "destination");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "geoWaypointTyped");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addDestinationWaypointTyped:", v37);
    objc_msgSend(v9, "route");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "destination");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v39);

  }
  return v11;
}

- (int)_purposeForReason:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 0;
  else
    return dword_1B0BF3764[a3 - 1];
}

- (void)_handleETAResponse:(id)a3 forRouteInfo:(id)a4 etaRoute:(id)a5 reason:(unint64_t)a6
{
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  MNSoundEffectResourceController *sfxController;
  MNSoundEffectResourceController *v16;
  MNSoundEffectResourceController *v17;
  MNSessionUpdateManagerDelegate **p_delegate;
  id WeakRetained;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  __CFString *v35;
  MNSessionUpdateManagerDelegate **v36;
  MNSessionUpdateManager *v37;
  id v38;
  __CFString *v39;
  void *v40;
  MNSessionUpdateManager *v41;
  void *v42;
  char v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  id v49;
  MNSessionUpdateManager *v50;
  void *v51;
  uint8_t buf[4];
  __CFString *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  objc_msgSend(v10, "error");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v13;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "Error in ETATrafficUpdate response: %@", buf, 0xCu);
    }

    if (GEOConfigGetBOOL())
    {
      sfxController = self->_sfxController;
      if (!sfxController)
      {
        v16 = objc_alloc_init(MNSoundEffectResourceController);
        v17 = self->_sfxController;
        self->_sfxController = v16;

        sfxController = self->_sfxController;
      }
      -[MNSoundEffectResourceController playSound:andReport:](sfxController, "playSound:andReport:", 0, 0);
    }
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "routeInfoForUpdateManager:reason:", self, a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "route");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_loadWeakRetained((id *)&self->_delegate);
    v50 = self;
    objc_msgSend(v21, "userLocationForUpdateManager:", self);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    GEOFindOrCreateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v10, "request");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "waypointRoute");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "routeLegs");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v12;
      v24 = v11;
      v25 = objc_msgSend(v45, "count");
      objc_msgSend(v22, "routeMatch");
      v49 = v10;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "waypointsFromRouteCoordinate:", objc_msgSend(v26, "routeCoordinate"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");
      v29 = objc_msgSend(v51, "isEVRoute");
      *(_DWORD *)buf = 138413058;
      v53 = v13;
      v54 = 2048;
      v55 = v25;
      v11 = v24;
      v12 = v48;
      v56 = 2048;
      v57 = v28;
      v58 = 1024;
      v59 = v29;
      _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_DEBUG, "ETA Update failed. error: %@ | etaRequestLegsCount: %lu | remainingWaypointsCount: %lu | isEVRoute: %d", buf, 0x26u);

      v10 = v49;
    }

    objc_msgSend(v11, "etaRoute");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "invalidateServerDisplayETA");

    v31 = objc_loadWeakRetained((id *)p_delegate);
    -[NSObject updateManager:didReceiveETAResponse:](v31, "updateManager:didReceiveETAResponse:", v50, v10);
    v32 = v51;
    goto LABEL_11;
  }
  objc_msgSend(v10, "response");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "status"))
  {
    GEOFindOrCreateLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
LABEL_32:

      goto LABEL_33;
    }
    v34 = objc_msgSend(v32, "status");
    if ((int)v34 <= 29)
    {
      v35 = CFSTR("STATUS_SUCCESS");
      switch((int)v34)
      {
        case 0:
          goto LABEL_31;
        case 1:
          v35 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v35 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_26;
        case 5:
          v35 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if ((_DWORD)v34 != 20)
            goto LABEL_26;
          v35 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_31;
    }
    if ((int)v34 > 49)
    {
      if ((_DWORD)v34 == 50)
      {
        v35 = CFSTR("STATUS_DEDUPED");
        goto LABEL_31;
      }
      if ((_DWORD)v34 == 60)
      {
        v35 = CFSTR("VERSION_MISMATCH");
        goto LABEL_31;
      }
    }
    else
    {
      if ((_DWORD)v34 == 30)
      {
        v35 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_31;
      }
      if ((_DWORD)v34 == 40)
      {
        v35 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_31:
        *(_DWORD *)buf = 138412290;
        v53 = v35;
        _os_log_impl(&dword_1B0AD7000, v33, OS_LOG_TYPE_ERROR, "Error in ETATrafficUpdate response but attempting to continue: %@", buf, 0xCu);

        goto LABEL_32;
      }
    }
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v34);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
LABEL_33:
  v36 = &self->_delegate;
  v37 = self;
  v38 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v38, "routeInfoForUpdateManager:reason:", v37, a6);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22 == v11)
  {
    v41 = v37;
    objc_msgSend(v11, "route");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[__CFString updateForResponse:route:](v12, "updateForResponse:route:", v32, v42);

    GEOFindOrCreateLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v53 = v12;
      _os_log_impl(&dword_1B0AD7000, v44, OS_LOG_TYPE_DEFAULT, "ETA route: %{private}@", buf, 0xCu);
    }

    if ((v43 & 1) != 0)
    {
      -[MNSessionUpdateManager _updateForETARoute:](v41, "_updateForETARoute:", v12);
      objc_msgSend(v11, "setEtaRoute:", v12);
      v31 = objc_loadWeakRetained((id *)v36);
      -[NSObject updateManager:didReceiveETAResponse:](v31, "updateManager:didReceiveETAResponse:", v41, v10);
    }
    else
    {
      GEOFindOrCreateLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v31, OS_LOG_TYPE_ERROR, "Error updating GEOComposedETARoute with ETAU response.", buf, 2u);
      }
    }
    v22 = v11;
  }
  else
  {
    GEOFindOrCreateLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "routeID");
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "routeID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = v39;
      v54 = 2112;
      v55 = (uint64_t)v40;
      _os_log_impl(&dword_1B0AD7000, v31, OS_LOG_TYPE_DEFAULT, "ETA request was made for route %@, but current route is now %@. Ignoring response.", buf, 0x16u);

    }
  }
LABEL_11:

}

- (void)transitRouteUpdater:(id)a3 willSendRequests:(id)a4
{
  MNSessionUpdateManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  if (!self->_isPaused)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "updateManager:willSendTransitUpdateRequests:", self, v6);

  }
}

- (void)transitRouteUpdater:(id)a3 didReceiveResponse:(id)a4
{
  MNSessionUpdateManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  if (!self->_isPaused)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "updateManager:didReceiveTransitUpdateResponse:", self, v6);

  }
}

- (void)transitRouteUpdater:(id)a3 willUpdateTransitForRouteIDs:(id)a4
{
  MNSessionUpdateManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  if (!self->_isPaused)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "updateManager:willSendTransitUpdateRequestForRouteIDs:", self, v6);

  }
}

- (void)transitRouteUpdater:(id)a3 didUpdateTransitRoutes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MNRealtimeTransitUpdate *v13;
  MNRealtimeTransitUpdate *v14;
  id WeakRetained;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!self->_isPaused)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v13 = [MNRealtimeTransitUpdate alloc];
          v14 = -[MNRealtimeTransitUpdate initWithTransitRouteUpdate:](v13, "initWithTransitRouteUpdate:", v12, (_QWORD)v16);
          objc_msgSend(v6, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "updateManager:didReceiveTransitUpdates:", self, v6);

  }
}

- (void)transitRouteUpdater:(id)a3 didFailUpdateForRouteIDs:(id)a4 withError:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = v6;
  if (!self->_isPaused)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v12)
      {
        objc_msgSend(v7, "code");
        GEOStringForError();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        GEOErrorReasonKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v13;
        v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Received error from transit route updater: (%@) \"%@\", (uint8_t *)&v18, 0x16u);

      }
    }
    else if (v12)
    {
      v18 = 138412290;
      v19 = v7;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Received error from transit route updater: %@", (uint8_t *)&v18, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "updateManager:didReceiveTransitError:", self, v7);

  }
}

- (BOOL)_hasAtLeastOneActiveSubscriber
{
  NSMutableDictionary *subscribers;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  subscribers = self->_subscribers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__MNSessionUpdateManager__hasAtLeastOneActiveSubscriber__block_invoke;
  v5[3] = &unk_1E61D8410;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subscribers, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__MNSessionUpdateManager__hasAtLeastOneActiveSubscriber__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "unsignedIntegerValue");
  if (result == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (MNSessionUpdateManagerDelegate)delegate
{
  return (MNSessionUpdateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (GEODataRequestThrottlerToken)throttleToken
{
  return self->_throttleToken;
}

- (void)setThrottleToken:(id)a3
{
  objc_storeStrong((id *)&self->_throttleToken, a3);
}

- (unint64_t)maxAlternateRoutesCount
{
  return self->_maxAlternateRoutesCount;
}

- (void)setMaxAlternateRoutesCount:(unint64_t)a3
{
  self->_maxAlternateRoutesCount = a3;
}

- (GEOLatLng)tripOrigin
{
  return self->_tripOrigin;
}

- (void)setTripOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_tripOrigin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfxController, 0);
  objc_storeStrong((id *)&self->_pendingETARoute, 0);
  objc_storeStrong((id *)&self->_pendingETARequest, 0);
  objc_storeStrong((id *)&self->_dateOfLastUpdate, 0);
  objc_storeStrong((id *)&self->_etaTimer, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_transitUpdater, 0);
  objc_storeStrong((id *)&self->_tripOrigin, 0);
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
