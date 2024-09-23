@implementation GEOSimpleTileRequester

void __49__GEOSimpleTileRequester_removeOperationsForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  uint64_t v11;

  v10 = a2;
  v11 = objc_msgSend(v10, "key");
  v6 = *(uint64_t **)(a1 + 48);
  v8 = *v6;
  v7 = v6[1];
  if (v11 == v8 && v5 == v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }

}

- (id)removeOperationsForKey:(id *)a1
{
  id *v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  void *v14;
  uint64_t v15;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v2[9];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__GEOSimpleTileRequester_removeOperationsForKey___block_invoke;
    v12[3] = &unk_1E1BFFC40;
    v15 = a2;
    v7 = v5;
    v13 = v7;
    v14 = v4;
    v8 = v4;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
    objc_msgSend(v2[9], "removeObjectsAtIndexes:", v8);
    objc_msgSend(v2, "balancer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requester:completedOperations:", v2, objc_msgSend(v8, "count"));

    v10 = v14;
    v2 = (id *)v7;

  }
  return v2;
}

void __36__GEOSimpleTileRequester_cancelKey___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v23 = *(_OWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "balancer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requester:removeTileKey:", v1, &v23);

    -[GEOSimpleTileRequester removeOperationsForKey:]((id *)v1, (uint64_t)&v23);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "cancel");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v5);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          _recursivelyClearAllRelatedOperations(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }

    -[GEOSimpleTileRequester _generateEndSignpostEventIfNecessary:]((uint64_t)v1, v23, *((uint64_t *)&v23 + 1));
    objc_msgSend(v1, "_updateRunningCountAndCheckIfDone", (_QWORD)v13);

  }
}

- (GEOTileRequestBalancer)balancer
{
  return self->_balancer;
}

- (void)_updateRunningCountAndCheckIfDone
{
  NSMutableArray *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  os_activity_scope_state_s v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  GEOSimpleTileRequester *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v9);
  if (!self->_cancelled)
  {
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v3 = self->_running;
    v4 = 0;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v4 <= objc_msgSend(v8, "priority"))
            v4 = objc_msgSend(v8, "priority");
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __55__GEOSimpleTileRequester__updateHighestRunningPriority__block_invoke;
    v13 = &unk_1E1BFFBC8;
    v14 = self;
    v15 = v4;
    geo_isolate_sync_data();
    -[GEOSimpleTileRequester _checkIfDone]((uint64_t)self);
  }
  os_activity_scope_leave(&v9);
}

- (void)_checkIfDone
{
  void *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[5];
  _BYTE buf[24];
  __int128 v21;
  id v22[3];

  v22[2] = *(id *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(void **)(a1 + 72);
    if (objc_msgSend(v2, "count"))
      v3 = 0;
    else
      v3 = *(_BYTE *)(a1 + 125) == 0;
    GEOGetTileLoadingLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_msgSend(*(id *)(a1 + 72), "count");
      v6 = *(unsigned __int8 *)(a1 + 125);
      objc_msgSend((id)a1, "tileRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "keyList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219264;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v2 != 0;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v3;
      LOWORD(v21) = 2048;
      *(_QWORD *)((char *)&v21 + 2) = v5;
      WORD5(v21) = 1024;
      HIDWORD(v21) = v6;
      LOWORD(v22[0]) = 2048;
      *(id *)((char *)v22 + 2) = (id)objc_msgSend(v8, "count");
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "%p didStart: %{BOOL}d, didFinish: %{BOOL}d, running: %zu, remaining keys: %{BOOL}d, key count = %zu", buf, 0x32u);

    }
    v9 = !v3;
    if (!v2)
      v9 = 1;
    if ((v9 & 1) == 0)
    {
      GEOGetTileLoadingLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)a1, "tileRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "keyList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");
        v14 = objc_msgSend(*(id *)(a1 + 80), "count");
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&v21 = v14;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "%p Tile requester is done (key count = %zu, error count = %zu)", buf, 0x20u);

      }
      v15 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __38__GEOSimpleTileRequester__checkIfDone__block_invoke;
      v19[3] = &unk_1E1BFF6F8;
      v19[4] = a1;
      v16 = v19;
      GEOGetTileLoadingLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = a1;
        _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, "%p Notifying delegate done.", buf, 0xCu);
      }

      *(_QWORD *)buf = v15;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __46__GEOSimpleTileRequester__notifyDelegateDone___block_invoke;
      *(_QWORD *)&v21 = &unk_1E1BFFBF0;
      *((_QWORD *)&v21 + 1) = a1;
      v18 = v16;
      v22[0] = v18;
      GEOOnce(a1 + 116, buf);

      objc_msgSend((id)a1, "_cleanup");
    }
  }
}

- (void)_generateEndSignpostEventIfNecessary:(uint64_t)a3
{
  void *v4;
  void *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v10[0] = a2;
  v10[1] = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 128), "objectForKey:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "unsignedLongLongValue");
      GEOGetTileLoadingLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        *(_WORD *)v9 = 0;
        _os_signpost_emit_with_name_impl(&dword_1885A9000, v8, OS_SIGNPOST_INTERVAL_END, v6, "SubmittedToRequester", (const char *)&unk_189D97683, v9, 2u);
      }

      objc_msgSend(*(id *)(a1 + 128), "removeObjectForKey:", v10);
    }

  }
}

void __97__GEOSimpleTileRequester_GEOTileRequestBalancer__createAndStartOperationsForTileKeys_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "keyAtIndex:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  -[GEOSimpleTileRequester _createOperationsForTileKey:priority:](*(_QWORD *)(a1 + 40), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "start", (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    os_unfair_lock_lock_with_options();
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  }

}

uint64_t __55__GEOSimpleTileRequester__updateHighestRunningPriority__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 144) = *(_DWORD *)(result + 40);
  return result;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (GEOSimpleTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5 dataURLSession:(id)a6
{
  id v10;
  id v11;
  GEOSimpleTileRequester *v12;
  GEOSimpleTileRequester *v13;
  void *v14;
  id v15;
  uint64_t v16;
  OS_dispatch_queue *workQueue;
  uint64_t v18;
  GEOTileKeyMap *signpostIDs;
  void *v20;
  uint64_t v21;
  GEOTileKeyMap *priorities;
  uint64_t v23;
  GEOTileKeyMap *tileLoaderCreateTimes;
  uint64_t v25;
  geo_isolater *highestRunningOperationPriorityIsolation;
  objc_super v28;

  v10 = a3;
  v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)GEOSimpleTileRequester;
  v12 = -[GEOTileRequester initWithTileRequest:delegateQueue:delegate:](&v28, sel_initWithTileRequest_delegateQueue_delegate_, v10, a4, a5);
  v13 = v12;
  if (v12)
  {
    v12->_didStart.lock._os_unfair_lock_opaque = 0;
    v12->_didStart.didRun = 0;
    v12->_didCallDelegate.lock._os_unfair_lock_opaque = 0;
    v12->_didCallDelegate.didRun = 0;
    v14 = v11;
    if (!v11)
    {
      +[GEODataURLSession sharedDataURLSession](GEODataURLSession, "sharedDataURLSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v13->_dataSession, v14);
    if (!v11)

    if (qword_1EDF4FB00 != -1)
      dispatch_once(&qword_1EDF4FB00, &__block_literal_global_206);
    v15 = (id)qword_1EDF4FAF8;
    v16 = geo_dispatch_queue_create_with_target();
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v16;

    objc_msgSend(v10, "signpostIDs");
    v18 = objc_claimAutoreleasedReturnValue();
    signpostIDs = v13->_signpostIDs;
    v13->_signpostIDs = (GEOTileKeyMap *)v18;

    objc_msgSend(v10, "priorities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    priorities = v13->_priorities;
    v13->_priorities = (GEOTileKeyMap *)v21;

    objc_msgSend(v10, "createTimes");
    v23 = objc_claimAutoreleasedReturnValue();
    tileLoaderCreateTimes = v13->_tileLoaderCreateTimes;
    v13->_tileLoaderCreateTimes = (GEOTileKeyMap *)v23;

    v25 = geo_isolater_create();
    highestRunningOperationPriorityIsolation = v13->_highestRunningOperationPriorityIsolation;
    v13->_highestRunningOperationPriorityIsolation = (geo_isolater *)v25;

    v13->_includeReasonHeader = GEOConfigGetBOOL(GeoServicesConfig_IncludeTileReasonHeader, (uint64_t)off_1EDF4D178);
    v13->_allowTLSSessionTicketUse = GEOConfigGetBOOL(GeoServicesConfig_TLSSessionTicketsEnabled, (uint64_t)off_1EDF4CF88);
  }

  return v13;
}

uint64_t __31__GEOSimpleTileRequester_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  os_signpost_id_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  __CFString *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keyList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v35;
    v6 = 0x1EDF0A000uLL;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + *(int *)(v6 + 2132)), "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = objc_msgSend(v9, "unsignedLongLongValue");
          objc_msgSend(*(id *)(a1 + 32), "activeTileSetForKey:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          GEOGetTileLoadingLog();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
          {
            v15 = objc_msgSend(v12, "style");
            v16 = CFSTR("RASTER_STANDARD");
            switch((int)v15)
            {
              case 0:
                break;
              case 1:
                v16 = CFSTR("VECTOR_STANDARD");
                break;
              case 2:
                v16 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
                break;
              case 3:
                v16 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
                break;
              case 4:
                v16 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
                break;
              case 5:
                v16 = CFSTR("RASTER_STANDARD_BACKGROUND");
                break;
              case 6:
                v16 = CFSTR("RASTER_HYBRID");
                break;
              case 7:
                v16 = CFSTR("RASTER_SATELLITE");
                break;
              case 8:
                v16 = CFSTR("RASTER_TERRAIN");
                break;
              case 11:
                v16 = CFSTR("VECTOR_BUILDINGS");
                break;
              case 12:
                v16 = CFSTR("VECTOR_TRAFFIC");
                break;
              case 13:
                v16 = CFSTR("VECTOR_POI");
                break;
              case 14:
                v16 = CFSTR("SPUTNIK_METADATA");
                break;
              case 15:
                v16 = CFSTR("SPUTNIK_C3M");
                break;
              case 16:
                v16 = CFSTR("SPUTNIK_DSM");
                break;
              case 17:
                v16 = CFSTR("SPUTNIK_DSM_GLOBAL");
                break;
              case 18:
                v16 = CFSTR("VECTOR_REALISTIC");
                break;
              case 19:
                v16 = CFSTR("VECTOR_LEGACY_REALISTIC");
                break;
              case 20:
                v16 = CFSTR("VECTOR_ROADS");
                break;
              case 21:
                v16 = CFSTR("RASTER_VEGETATION");
                break;
              case 22:
                v16 = CFSTR("VECTOR_TRAFFIC_SKELETON");
                break;
              case 23:
                v16 = CFSTR("RASTER_COASTLINE_MASK");
                break;
              case 24:
                v16 = CFSTR("RASTER_HILLSHADE");
                break;
              case 25:
                v16 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
                break;
              case 26:
                v16 = CFSTR("VECTOR_TRAFFIC_STATIC");
                break;
              case 27:
                v16 = CFSTR("RASTER_COASTLINE_DROP_MASK");
                break;
              case 28:
                v16 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
                break;
              case 29:
                v16 = CFSTR("VECTOR_SPEED_PROFILES");
                break;
              case 30:
                v16 = CFSTR("VECTOR_VENUES");
                break;
              case 31:
                v16 = CFSTR("RASTER_DOWN_SAMPLED");
                break;
              case 32:
                v16 = CFSTR("RASTER_COLOR_BALANCED");
                break;
              case 33:
                v16 = CFSTR("RASTER_SATELLITE_NIGHT");
                break;
              case 34:
                v16 = CFSTR("SPUTNIK_VECTOR_BORDER");
                break;
              case 35:
                v16 = CFSTR("RASTER_SATELLITE_DIGITIZE");
                break;
              case 36:
                v16 = CFSTR("RASTER_HILLSHADE_PARKS");
                break;
              case 37:
                v16 = CFSTR("VECTOR_TRANSIT");
                break;
              case 38:
                v16 = CFSTR("RASTER_STANDARD_BASE");
                break;
              case 39:
                v16 = CFSTR("RASTER_STANDARD_LABELS");
                break;
              case 40:
                v16 = CFSTR("RASTER_HYBRID_ROADS");
                break;
              case 41:
                v16 = CFSTR("RASTER_HYBRID_LABELS");
                break;
              case 42:
                v16 = CFSTR("FLYOVER_C3M_MESH");
                break;
              case 43:
                v16 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
                break;
              case 44:
                v16 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
                break;
              case 45:
                v16 = CFSTR("RASTER_SATELLITE_ASTC");
                break;
              case 46:
                v16 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
                break;
              case 47:
                v16 = CFSTR("VECTOR_TRANSIT_SELECTION");
                break;
              case 48:
                v16 = CFSTR("VECTOR_COVERAGE");
                break;
              case 52:
                v16 = CFSTR("FLYOVER_METADATA");
                break;
              case 53:
                v16 = CFSTR("VECTOR_ROAD_NETWORK");
                break;
              case 54:
                v16 = CFSTR("VECTOR_LAND_COVER");
                break;
              case 55:
                v16 = CFSTR("VECTOR_DEBUG");
                break;
              case 56:
                v16 = CFSTR("VECTOR_STREET_POI");
                break;
              case 57:
                v16 = CFSTR("MUNIN_METADATA");
                break;
              case 58:
                v16 = CFSTR("VECTOR_SPR_MERCATOR");
                break;
              case 59:
                v16 = CFSTR("VECTOR_SPR_MODELS");
                break;
              case 60:
                v16 = CFSTR("VECTOR_SPR_MATERIALS");
                break;
              case 61:
                v16 = CFSTR("VECTOR_SPR_METADATA");
                break;
              case 62:
                v16 = CFSTR("VECTOR_TRACKS");
                break;
              case 63:
                v16 = CFSTR("VECTOR_RESERVED_2");
                break;
              case 64:
                v16 = CFSTR("VECTOR_STREET_LANDMARKS");
                break;
              case 65:
                v16 = CFSTR("COARSE_LOCATION_POLYGONS");
                break;
              case 66:
                v16 = CFSTR("VECTOR_SPR_ROADS");
                break;
              case 67:
                v16 = CFSTR("VECTOR_SPR_STANDARD");
                break;
              case 68:
                v16 = CFSTR("VECTOR_POI_V2");
                break;
              case 69:
                v16 = CFSTR("VECTOR_POLYGON_SELECTION");
                break;
              case 70:
                v16 = CFSTR("VL_METADATA");
                break;
              case 71:
                v16 = CFSTR("VL_DATA");
                break;
              case 72:
                v16 = CFSTR("PROACTIVE_APP_CLIP");
                break;
              case 73:
                v16 = CFSTR("VECTOR_BUILDINGS_V2");
                break;
              case 74:
                v16 = CFSTR("POI_BUSYNESS");
                break;
              case 75:
                v16 = CFSTR("POI_DP_BUSYNESS");
                break;
              case 76:
                v16 = CFSTR("SMART_INTERFACE_SELECTION");
                break;
              case 77:
                v16 = CFSTR("VECTOR_ASSETS");
                break;
              case 78:
                v16 = CFSTR("SPR_ASSET_METADATA");
                break;
              case 79:
                v16 = CFSTR("VECTOR_SPR_POLAR");
                break;
              case 80:
                v16 = CFSTR("SMART_DATA_MODE");
                break;
              case 81:
                v16 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
                break;
              case 82:
                v16 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
                break;
              case 83:
                v16 = CFSTR("VECTOR_TOPOGRAPHIC");
                break;
              case 84:
                v16 = CFSTR("VECTOR_POI_V2_UPDATE");
                break;
              case 85:
                v16 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
                break;
              case 86:
                v16 = CFSTR("VECTOR_TRAFFIC_V2");
                break;
              case 87:
                v16 = CFSTR("VECTOR_ROAD_SELECTION");
                break;
              case 88:
                v16 = CFSTR("VECTOR_REGION_METADATA");
                break;
              case 89:
                v16 = CFSTR("RAY_TRACING");
                break;
              case 90:
                v16 = CFSTR("VECTOR_CONTOURS");
                break;
              case 91:
                v16 = CFSTR("RASTER_SATELLITE_POLAR");
                break;
              case 92:
                v16 = CFSTR("VMAP4_ELEVATION");
                break;
              case 93:
                v16 = CFSTR("VMAP4_ELEVATION_POLAR");
                break;
              case 94:
                v16 = CFSTR("CELLULAR_COVERAGE_PLMN");
                break;
              case 95:
                v16 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
                break;
              case 96:
                v16 = CFSTR("UNUSED_96");
                break;
              case 97:
                v16 = CFSTR("UNUSED_97");
                break;
              case 98:
                v16 = CFSTR("UNUSED_98");
                break;
              case 99:
                v16 = CFSTR("UNUSED_99");
                break;
              case 100:
                v16 = CFSTR("UNUSED_100");
                break;
              case 101:
                v16 = CFSTR("UNUSED_101");
                break;
              case 102:
                v16 = CFSTR("UNUSED_102");
                break;
              case 103:
                v16 = CFSTR("UNUSED_103");
                break;
              case 104:
                v16 = CFSTR("UNUSED_104");
                break;
              case 105:
                v16 = CFSTR("UNUSED_105");
                break;
              case 106:
                v16 = CFSTR("UNUSED_106");
                break;
              case 107:
                v16 = CFSTR("UNUSED_107");
                break;
              case 108:
                v16 = CFSTR("UNUSED_108");
                break;
              case 109:
                v16 = CFSTR("UNUSED_109");
                break;
              case 110:
                v16 = CFSTR("UNUSED_110");
                break;
              case 111:
                v16 = CFSTR("UNUSED_111");
                break;
              case 112:
                v16 = CFSTR("UNUSED_112");
                break;
              case 113:
                v16 = CFSTR("UNUSED_113");
                break;
              case 114:
                v16 = CFSTR("UNUSED_114");
                break;
              case 115:
                v16 = CFSTR("UNUSED_115");
                break;
              case 116:
                v16 = CFSTR("UNUSED_116");
                break;
              case 117:
                v16 = CFSTR("UNUSED_117");
                break;
              case 118:
                v16 = CFSTR("UNUSED_118");
                break;
              case 119:
                v16 = CFSTR("UNUSED_119");
                break;
              default:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
                v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
            *(_DWORD *)buf = 138543362;
            v39 = v16;
            _os_signpost_emit_with_name_impl(&dword_1885A9000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SubmittedToRequester", "Type=%{public}@", buf, 0xCu);

            v6 = 0x1EDF0A000;
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v4);
  }

  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "tileRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "keyList");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v17, "initWithCapacity:", 2 * objc_msgSend(v19, "count"));
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 72);
  *(_QWORD *)(v21 + 72) = v20;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  v23 = voucher_copy();
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 184);
  *(_QWORD *)(v24 + 184) = v23;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 104) = *(_DWORD *)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 125) = 1;
  +[GEOTileRequestBalancer balancerForRequester:](GEOTileRequestBalancer, "balancerForRequester:", *(_QWORD *)(a1 + 32));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 64);
  *(_QWORD *)(v27 + 64) = v26;

  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 64);
  if (!v30)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _balancer != nil", buf, 2u);
    }
    __break(1u);
  }
  objc_msgSend(*(id *)(a1 + 32), "tileRequest");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "keyList");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addRequester:tileKeys:priorities:", v29, v32, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));

  return objc_msgSend(*(id *)(a1 + 32), "_updateRunningCountAndCheckIfDone");
}

- (void)start
{
  qos_class_t v3;
  os_activity_t v4;
  _QWORD v5[6];
  qos_class_t v6;

  v4 = _os_activity_create(&dword_1885A9000, "Request tiles", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v3 = qos_class_self();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__GEOSimpleTileRequester_start__block_invoke;
  v5[3] = &unk_1E1BFFBA0;
  v5[4] = self;
  v5[5] = v4;
  v6 = v3;
  GEOOnce((uint64_t)&self->_didStart, v5);

}

void __31__GEOSimpleTileRequester_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  __int128 v8;
  int v9;
  objc_super v10;
  _QWORD block[4];
  id v12;
  id v13;

  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)GEOSimpleTileRequester;
  objc_msgSendSuper2(&v10, sel_start);
  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__GEOSimpleTileRequester_start__block_invoke_2;
  v7[3] = &unk_1E1BFFBA0;
  v8 = *(_OWORD *)(a1 + 32);
  v9 = *(_DWORD *)(a1 + 48);
  v3 = (id)v8;
  v4 = v7;
  objc_msgSend(v3, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __dispatch_work_block_invoke;
  block[3] = &unk_1E1BFFBF0;
  v12 = v3;
  v13 = v4;
  v6 = v3;
  dispatch_async(v5, block);

}

- (GEOSimpleTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  return -[GEOSimpleTileRequester initWithTileRequest:delegateQueue:delegate:dataURLSession:](self, "initWithTileRequest:delegateQueue:delegate:dataURLSession:", a3, a4, a5, 0);
}

- (uint64_t)tileDataIsCacheableForTileKey:(unsigned __int8 *)a3
{
  return (*a3 >> 7) ^ 1u;
}

- (void)cancelKey:(__int128 *)a3
{
  uint64_t v3;
  id v4;
  _QWORD *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[5];
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    v12 = *a3;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__GEOSimpleTileRequester_cancelKey___block_invoke;
    v11[3] = &unk_1E1BFFD08;
    v11[4] = a1;
    v4 = a1;
    v5 = v11;
    objc_msgSend(v4, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __dispatch_work_block_invoke;
    v8[3] = &unk_1E1BFFBF0;
    v9 = v4;
    v10 = v5;
    v7 = v4;
    dispatch_async(v6, v8);

  }
}

- (id)_createOperationsForTileKey:(unsigned int)a3 priority:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  double v38;
  double v39;
  NSObject *v40;
  uint64_t v41;
  _GEOSimpleTileRequesterOperation *v42;
  void *v43;
  _GEOSimpleTileRequesterOperation *v44;
  os_activity_t v45;
  void *v46;
  void *v47;
  _GEOSimpleTileRequesterOperation *v48;
  void *v49;
  _GEOSimpleTileRequesterOperation *v50;
  os_activity_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  _BYTE buf[28];
  __int16 v70;
  _QWORD v71[4];

  *(_QWORD *)((char *)&v71[2] + 2) = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v57 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "tileRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", a2);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)a1, "tileRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedEtags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", a2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v63, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (v9)
    {
      v59 = 0;
      v60 = 0;
      v61 = 0;
      if (v58)
      {
        objc_msgSend(v63, "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0;
        v68 = 0;
        GEOTileUnpackageBaseAndLocalization(v11, &v68, &v67);
        v60 = v68;
        v59 = v67;

        v65 = 0;
        v66 = 0;
        GEOSimpleTileRequesterUnpackETag(v58, &v66, &v65);
        v61 = v66;
        v10 = v65;
      }
    }
    else
    {
      v59 = 0;
      v60 = 0;
      v61 = 0;
    }
    v12 = objc_msgSend((id)a1, "kindForTileKey:", a2);
    +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "tileRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "auditToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestCounterTicketForType:auditToken:traits:", v12, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)a1, "resourceManifestManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activeTileGroup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (GEOAuthProxyEnabledForActiveTileGroup(v18))
    {
      objc_msgSend((id)a1, "activeTileSetForKey:", a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "useAuthProxy");

    }
    else
    {
      v20 = 0;
    }

    objc_msgSend((id)a1, "urlForTileKey:", a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createSubtask:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)-[GEOSimpleTileRequester newRequestWithKind:URL:useProxyAuth:entityTag:cachedData:timeout:requestCounterTicket:]((_BYTE *)a1, v12, v21, v20, v61, v60, v22);

    GEOGetTileLoadingLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v21, "URL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218755;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 1040;
      *(_DWORD *)&buf[24] = 16;
      v70 = 2097;
      v71[0] = a2;
      _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_DEBUG, "Created data request %p with URL %p (%{private,geo:TileKey}.*P)", buf, 0x26u);

    }
    objc_msgSend((id)a1, "localizationURLForTileKey:", a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createSubtask:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)-[GEOSimpleTileRequester newRequestWithKind:URL:useProxyAuth:entityTag:cachedData:timeout:requestCounterTicket:]((_BYTE *)a1, v12, v26, v20, v10, v59, v27);

    if (v28)
    {
      GEOGetTileLoadingLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v26, "URL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218755;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 1040;
        *(_DWORD *)&buf[24] = 16;
        v70 = 2097;
        v71[0] = a2;
        _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_DEBUG, "Created data request %p with URL %p (%{private,geo:TileKey}.*P) (localization)", buf, 0x26u);

      }
    }

    v31 = objc_retainAutorelease(v23);
    v32 = objc_retainAutorelease(v28);

    v33 = v31;
    v34 = v32;
    GEOGetTileLoadingLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219011;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2097;
      *(_QWORD *)&buf[20] = a2;
      v70 = 1024;
      LODWORD(v71[0]) = a3;
      WORD2(v71[0]) = 1024;
      *(_DWORD *)((char *)v71 + 6) = v34 != 0;
      _os_log_impl(&dword_1885A9000, v35, OS_LOG_TYPE_INFO, "%p Request for tile key %{private,geo:TileKey}.*P @ %'u - localization: %{BOOL}d", buf, 0x28u);
    }

    if (v33)
    {
      objc_msgSend(*(id *)(a1 + 128), "objectForKey:", a2);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v36)
        v62 = -[NSObject unsignedLongLongValue](v36, "unsignedLongLongValue");
      else
        v62 = -1;
      objc_msgSend(*(id *)(a1 + 136), "objectForKey:", a2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "doubleValue");
      v39 = v38;
      v40 = _os_activity_create(&dword_1885A9000, "Request tile", *(os_activity_t *)(a1 + 88), OS_ACTIVITY_FLAG_DEFAULT);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      os_activity_scope_enter(v40, (os_activity_scope_state_t)buf);
      v41 = 0;
      if (!v28)
        v41 = objc_msgSend((id)a1, "downloadsDataToDisk");
      v42 = [_GEOSimpleTileRequesterOperation alloc];
      objc_msgSend((id)a1, "workQueue");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[_GEOSimpleTileRequesterOperation initWithRequest:delegateQueue:delegate:](v42, "initWithRequest:delegateQueue:delegate:", v33, v43, a1);

      -[_GEOSimpleTileRequesterOperation setKey:](v44, "setKey:", *a2, a2[1]);
      -[_GEOSimpleTileRequesterOperation setPriority:](v44, "setPriority:", a3);
      objc_msgSend(v33, "timeoutInterval");
      -[_GEOSimpleTileRequesterOperation setTimeout:](v44, "setTimeout:");
      -[_GEOSimpleTileRequesterOperation setSignpostID:](v44, "setSignpostID:", v62);
      v45 = _os_activity_create(&dword_1885A9000, "Request base tile", v40, OS_ACTIVITY_FLAG_DEFAULT);
      -[_GEOSimpleTileRequesterOperation setActivity:](v44, "setActivity:", v45);

      -[_GEOSimpleTileRequesterOperation setParentTileActivity:](v44, "setParentTileActivity:", v40);
      -[_GEOSimpleTileRequesterOperation setDataSession:](v44, "setDataSession:", *(_QWORD *)(a1 + 96));
      -[_GEOSimpleTileRequesterOperation setShouldDownloadToDisk:](v44, "setShouldDownloadToDisk:", v41);
      objc_msgSend(*(id *)(a1 + 8), "auditToken");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "bundleId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GEOSimpleTileRequesterOperation setRequestingBundleId:](v44, "setRequestingBundleId:", v47);

      -[_GEOSimpleTileRequesterOperation setTileLoaderCreateTime:](v44, "setTileLoaderCreateTime:", v39);
      objc_msgSend(v57, "addObject:", v44);
      if (v28)
      {
        v48 = [_GEOSimpleTileRequesterOperation alloc];
        objc_msgSend((id)a1, "workQueue");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = -[_GEOSimpleTileRequesterOperation initWithRequest:delegateQueue:delegate:](v48, "initWithRequest:delegateQueue:delegate:", v34, v49, a1);

        -[_GEOSimpleTileRequesterOperation setLocalizationTile:](v44, "setLocalizationTile:", v50);
        -[_GEOSimpleTileRequesterOperation setBaseTile:](v50, "setBaseTile:", v44);
        -[_GEOSimpleTileRequesterOperation setKey:](v50, "setKey:", *a2, a2[1]);
        -[_GEOSimpleTileRequesterOperation setPriority:](v50, "setPriority:", -[_GEOSimpleTileRequesterOperation priority](v44, "priority"));
        -[_GEOSimpleTileRequesterOperation timeout](v44, "timeout");
        -[_GEOSimpleTileRequesterOperation setTimeout:](v50, "setTimeout:");
        -[_GEOSimpleTileRequesterOperation setSignpostID:](v50, "setSignpostID:", v62);
        v51 = _os_activity_create(&dword_1885A9000, "Request localization tile", v40, OS_ACTIVITY_FLAG_DEFAULT);
        -[_GEOSimpleTileRequesterOperation setActivity:](v50, "setActivity:", v51);

        -[_GEOSimpleTileRequesterOperation setParentTileActivity:](v50, "setParentTileActivity:", v40);
        -[_GEOSimpleTileRequesterOperation dataSession](v44, "dataSession");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[_GEOSimpleTileRequesterOperation setDataSession:](v50, "setDataSession:", v52);

        objc_msgSend(*(id *)(a1 + 8), "auditToken");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "bundleId");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[_GEOSimpleTileRequesterOperation setRequestingBundleId:](v50, "setRequestingBundleId:", v54);

        -[_GEOSimpleTileRequesterOperation setTileLoaderCreateTime:](v50, "setTileLoaderCreateTime:", v39);
        objc_msgSend(v57, "addObject:", v50);

      }
      os_activity_scope_leave((os_activity_scope_state_t)buf);

    }
    else
    {
      GEOGetTileLoadingLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157955;
        *(_DWORD *)&buf[4] = 16;
        *(_WORD *)&buf[8] = 2097;
        *(_QWORD *)&buf[10] = a2;
        _os_log_impl(&dword_1885A9000, v37, OS_LOG_TYPE_ERROR, "Unable to create GEODataRequest for tile %{private,geo:TileKey}.*P.", buf, 0x12u);
      }
    }

  }
  else
  {
    v57 = 0;
  }
  return v57;
}

- (uint64_t)newRequestWithKind:(_BYTE *)a1 URL:(uint64_t)a2 useProxyAuth:(void *)a3 entityTag:(int)a4 cachedData:(void *)a5 timeout:(void *)a6 requestCounterTicket:(void *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  GEOURLWithHeaders *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned __int8 v26;
  __CFString *v27;
  void *v28;
  void *v29;
  GEOURLWithHeaders *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int BOOL;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  GEOURLWithHeaders *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  GEOURLWithHeaders *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  GEODataRequest *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    v60 = 0;
    v59 = 0;
    goto LABEL_26;
  }
  v67 = v16;
  v68 = v15;
  httpPragmaHeader();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v13, "headerFields");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryWithDictionary:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    httpPragmaHeader();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("Pragma"));

    v22 = [GEOURLWithHeaders alloc];
    objc_msgSend(v13, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[GEOURLWithHeaders initWithURL:headerFields:](v22, "initWithURL:headerFields:", v23, v20);

    v13 = (id)v24;
  }
  if (a1[176])
  {
    objc_msgSend(a1, "tileRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "loadReason") + 1;
    if (v26 <= 6u && ((0x59u >> v26) & 1) != 0)
    {
      v27 = off_1E1BFFD28[(char)v26];

      v28 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v13, "headerFields");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dictionaryWithDictionary:", v29);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("Maps-Tile-Reason"));
      v30 = [GEOURLWithHeaders alloc];
      objc_msgSend(v13, "URL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[GEOURLWithHeaders initWithURL:headerFields:](v30, "initWithURL:headerFields:", v31, v25);

      v13 = (id)v32;
    }

  }
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v33, "isInternalInstall"))
    goto LABEL_13;
  BOOL = GEOConfigGetBOOL(GeoServicesConfig_TileRequestsIncludeEnvironmentHeader, (uint64_t)off_1EDF4DF48);

  if (BOOL)
  {
    objc_msgSend(a1, "resourceManifestManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activeTileGroup");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "environment");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v33, "length"))
    {
      v37 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v13, "headerFields");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "dictionaryWithDictionary:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "setObject:forKeyedSubscript:", v33, CFSTR("Maps-Environment"));
      v40 = [GEOURLWithHeaders alloc];
      objc_msgSend(v13, "URL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[GEOURLWithHeaders initWithURL:headerFields:](v40, "initWithURL:headerFields:", v41, v39);

      v13 = (id)v42;
    }
LABEL_13:

  }
  if (GEOConfigGetBOOL(GeoServicesConfig_TileRequestsIncludeOSVersionHeader, (uint64_t)off_1EDF4DF58))
  {
    if (_MergedGlobals_31 != -1)
      dispatch_once(&_MergedGlobals_31, &__block_literal_global_2);
    v43 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v13, "headerFields");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryWithDictionary:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "setObject:forKeyedSubscript:", qword_1EDF4FAF0, CFSTR("Apple-OS-Version"));
    v46 = [GEOURLWithHeaders alloc];
    objc_msgSend(v13, "URL");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[GEOURLWithHeaders initWithURL:headerFields:](v46, "initWithURL:headerFields:", v47, v45);

    v13 = (id)v48;
  }
  objc_msgSend(a1, "tileRequest");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "constraints");

  if (a1[177])
    v51 = v50 | 2;
  else
    v51 = v50;
  if (a4)
    v52 = v51 | 8;
  else
    v52 = v51;
  v53 = [GEODataRequest alloc];
  objc_msgSend(v13, "URL");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tileRequest");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "auditToken");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "headerFields");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tileRequest");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "auditToken");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bundleId");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tileRequest");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "backgroundSessionIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v52;
  v15 = v68;
  v59 = -[GEODataRequest initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:backgroundSessionIdentifier:throttleToken:options:](v53, "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:backgroundSessionIdentifier:throttleToken:options:", a2, v65, v54, v55, 0, v56, 0.0, v14, v68, v67, 0, 0, v58, 0, v62);

  v16 = v67;
  v60 = v13;
LABEL_26:

  return v59;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unint64_t)kindForTileKey:(uint64_t)a3
{
  unsigned int v4;

  v4 = 0;
  GEOTileKeyStyle(a3, &v4);
  return ((unint64_t)v4 << 32) | 0x100;
}

- (BOOL)downloadsDataToDisk
{
  return 0;
}

- (uint64_t)estimatedNumberOfOperationsForTileKey:(uint64_t)a3
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a3;
  v5[1] = a4;
  if (objc_msgSend(a1, "needsLocalizationForKey:", v5))
    return 2;
  else
    return 1;
}

- (unsigned)highestRunningOperationPriority
{
  GEOSimpleTileRequester *v2;
  geo_isolater *v4;

  v2 = self;
  v4 = self->_highestRunningOperationPriorityIsolation;
  _geo_isolate_lock_data();
  LODWORD(v2) = v2->_highestRunningOperationPriority;
  _geo_isolate_unlock();

  return v2;
}

void __97__GEOSimpleTileRequester_GEOTileRequestBalancer__createAndStartOperationsForTileKeys_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  size_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[4];
  id v31;
  uint64_t v32;
  id v33;
  _BYTE *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  _BYTE buf[24];
  const char *v41;
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 184);
  voucher_adopt();
  if (objc_msgSend(*(id *)(a1 + 40), "count") == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "firstKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntValue");

    -[GEOSimpleTileRequester _createOperationsForTileKey:priority:](*(_QWORD *)(a1 + 32), (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "firstKey"), v4);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v36;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v36 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v8++), "start");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v6);
    }

  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2810000000;
    v41 = "";
    v42 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * objc_msgSend(*(id *)(a1 + 40), "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__GEOSimpleTileRequester_GEOTileRequestBalancer__createAndStartOperationsForTileKeys_completion___block_invoke_2;
    block[3] = &unk_1E1BFFC68;
    v11 = *(id *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 32);
    v31 = v11;
    v32 = v12;
    v34 = buf;
    v13 = v9;
    v33 = v13;
    dispatch_apply(v10, 0, block);
    v14 = v33;
    v5 = v13;

    _Block_object_dispose(buf, 8);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v27;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(a1 + 32);
        if (v19)
          objc_msgSend(*(id *)(v19 + 72), "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v18), (_QWORD)v26);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v16);
  }

  GEOGetTileLoadingLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = *(_QWORD *)(a1 + 32);
    v22 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v22;
    _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_INFO, "%p Started %zu operations.", buf, 0x16u);
  }

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v15, "count"));
  v23 = voucher_adopt();
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 184);
  *(_QWORD *)(v24 + 184) = v23;

  objc_msgSend(*(id *)(a1 + 32), "_updateRunningCountAndCheckIfDone");
}

void __82__GEOSimpleTileRequester_GEOTileRequestBalancer__didStartOperationsForAllTileKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    *(_BYTE *)(v1 + 125) = 0;
    -[GEOSimpleTileRequester _checkIfDone](v1);
  }
}

uint64_t __32__GEOSimpleTileRequester_cancel__block_invoke(uint64_t result)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    *(_BYTE *)(v1 + 124) = 1;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(v1 + 72);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_msgSend(v7, "cancel", (_QWORD)v10);
          v8 = objc_msgSend(v7, "key");
          -[GEOSimpleTileRequester _generateEndSignpostEventIfNecessary:](v1, v8, v9);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

    return objc_msgSend((id)v1, "_cleanup");
  }
  return result;
}

- (BOOL)shouldParticipateInBalancerScheduling
{
  void *v3;
  BOOL v4;

  -[GEOTileRequest backgroundSessionIdentifier](self->super._tileRequest, "backgroundSessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = -[GEOTileRequest shouldParticipateInBalancer](self->super._tileRequest, "shouldParticipateInBalancer");

  return v4;
}

- (void)didStartOperationsForAllTileKeys
{
  uint64_t v2;
  GEOSimpleTileRequester *v3;
  _QWORD *v4;
  NSObject *v5;
  GEOSimpleTileRequester *v6;
  _QWORD v7[5];
  _QWORD block[4];
  GEOSimpleTileRequester *v9;
  id v10;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__GEOSimpleTileRequester_GEOTileRequestBalancer__didStartOperationsForAllTileKeys__block_invoke;
  v7[3] = &unk_1E1BFF6F8;
  v7[4] = self;
  v3 = self;
  v4 = v7;
  -[GEOSimpleTileRequester workQueue](v3, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __dispatch_work_block_invoke;
  block[3] = &unk_1E1BFFBF0;
  v9 = v3;
  v10 = v4;
  v6 = v3;
  dispatch_async(v5, block);

}

- (void)createAndStartOperationsForTileKeys:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_qos_class_t qos;
  uint64_t v9;
  GEOSimpleTileRequester *v10;
  _QWORD *v11;
  id v12;
  id v13;
  NSObject *v14;
  GEOSimpleTileRequester *v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD block[4];
  GEOSimpleTileRequester *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  qos = self->_qos;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __97__GEOSimpleTileRequester_GEOTileRequestBalancer__createAndStartOperationsForTileKeys_completion___block_invoke;
  v17[3] = &unk_1E1BFFC90;
  v17[4] = self;
  v18 = v6;
  v19 = v7;
  v10 = self;
  v11 = v17;
  v12 = v7;
  v13 = v6;
  -[GEOSimpleTileRequester workQueue](v10, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_work_qos_block_invoke;
  block[3] = &unk_1E1BFFBF0;
  v21 = v10;
  v22 = v11;
  v15 = v10;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos, 0, block);
  dispatch_async(v14, v16);

}

- (void)dealloc
{
  objc_super v3;

  -[GEOSimpleTileRequester _cancelAllRunningOperations]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)GEOSimpleTileRequester;
  -[GEOSimpleTileRequester dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  NSObject *v3;
  uint64_t v4;
  GEOSimpleTileRequester *v5;
  _QWORD *v6;
  NSObject *v7;
  GEOSimpleTileRequester *v8;
  _QWORD v9[5];
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  GEOSimpleTileRequester *v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  GEOGetTileLoadingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "%p Tile requester is being cancelled.", (uint8_t *)&buf, 0xCu);
  }

  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__GEOSimpleTileRequester_cancel__block_invoke;
  v9[3] = &unk_1E1BFF6F8;
  v9[4] = self;
  v5 = self;
  v6 = v9;
  -[GEOSimpleTileRequester workQueue](v5, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = v4;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_work_block_invoke;
  v12 = &unk_1E1BFFBF0;
  v13 = v5;
  v14 = v6;
  v8 = v5;
  dispatch_async(v7, &buf);

}

- (void)_cleanup
{
  void *v3;
  GEOTileRequestBalancer *balancer;

  -[GEOSimpleTileRequester balancer](self, "balancer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeRequester:", self);

  balancer = self->_balancer;
  self->_balancer = 0;

  -[GEOSimpleTileRequester _cancelAllRunningOperations]((uint64_t)self);
}

- (void)_cancelAllRunningOperations
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 72), "copy");
    objc_msgSend(*(id *)(a1 + 72), "removeAllObjects");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(v8, "cancel", (_QWORD)v9);
          objc_msgSend(v8, "setBaseTile:", 0);
          objc_msgSend(v8, "setLocalizationTile:", 0);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_priorities, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_highestRunningOperationPriorityIsolation, 0);
  objc_storeStrong((id *)&self->_tileLoaderCreateTimes, 0);
  objc_storeStrong((id *)&self->_signpostIDs, 0);
  objc_storeStrong((id *)&self->_dataSession, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_running, 0);
  objc_storeStrong((id *)&self->_balancer, 0);
}

void __38__GEOSimpleTileRequester__checkIfDone__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tileRequesterFinished:", *(_QWORD *)(a1 + 32));

}

void __46__GEOSimpleTileRequester__notifyDelegateDone___block_invoke(uint64_t a1)
{
  _DWORD *v1;
  dispatch_qos_class_t v2;
  id v3;
  NSObject *v4;
  dispatch_block_t v5;
  _DWORD *v6;

  v1 = *(_DWORD **)(a1 + 32);
  v2 = v1[26];
  v3 = *(id *)(a1 + 40);
  v6 = v1;
  objc_msgSend(v6, "delegateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v2, 0, v3);

  dispatch_async(v4, v5);
}

void __112__GEOSimpleTileRequester_newRequestWithKind_URL_useProxyAuth_entityTag_cachedData_timeout_requestCounterTicket___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform", CFSTR("ios"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "osVersion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("/"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1EDF4FAF0;
  qword_1EDF4FAF0 = v5;

}

- (void)reprioritizeKey:(__int128 *)a3 newPriority:(int)a4
{
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD v12[5];
  int v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v14 = *a3;
    v4 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__GEOSimpleTileRequester_reprioritizeKey_newPriority___block_invoke;
    v12[3] = &unk_1E1BFFC18;
    v12[4] = a1;
    v13 = a4;
    v5 = a1;
    v6 = v12;
    objc_msgSend(v5, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __dispatch_work_block_invoke;
    block[3] = &unk_1E1BFFBF0;
    v10 = v5;
    v11 = v6;
    v8 = v5;
    dispatch_async(v7, block);

  }
}

void __54__GEOSimpleTileRequester_reprioritizeKey_newPriority___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned int *)(a1 + 40);
  v27 = *(_OWORD *)(a1 + 44);
  if (v1)
  {
    v3 = *(void **)(v1 + 168);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, &v27);

    objc_msgSend((id)v1, "balancer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requester:updatePriority:tileKey:", v1, v2, &v27);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = *(id *)(v1 + 72);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v28 = objc_msgSend(v12, "key");
          v29 = v13;
          if (v28 == (_QWORD)v27 && v13 == *((_QWORD *)&v27 + 1))
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v9);
    }

    v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "setPriority:", v2);
        }
        v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
      }
      while (v16);
    }

  }
}

- (uint64_t)_removeRunningOperation:(id *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (a1 && (v4 = objc_msgSend(a1[9], "indexOfObjectIdenticalTo:", v3), v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(a1[9], "removeObjectAtIndex:", v4);
    objc_msgSend(a1, "balancer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
    objc_msgSend(v6, "requester:completedOperations:", a1, 1);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)_shouldReportAnalyticsForTileKey:(unsigned __int8 *)a3
{
  void *v5;
  void *v6;
  int v7;
  int16x4_t v8;
  char v9;

  objc_msgSend(a1, "tileRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "loadReason") == 1)
  {

  }
  else
  {
    objc_msgSend(a1, "tileRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "loadReason");

    if (v7 != 4)
    {
      v9 = 0;
      return v9 & 1;
    }
  }
  v8 = (int16x4_t)vand_s8((int8x8_t)vdup_n_s32(*a3), (int8x8_t)0x7E0000007FLL);
  v9 = vmaxv_u16((uint16x4_t)vceq_s16(vuzp1_s16(v8, v8), (int16x4_t)0xE000C00020004)) | (v8.i32[0] == 9);
  return v9 & 1;
}

- (uint64_t)shouldReportAnalyticsOnErrorWithRetryForTileKey:
{
  return 0;
}

- (uint64_t)additionalAnalyticsStatesForKey:
{
  return 0;
}

- (uint64_t)urlForTileKey:(void *)a1
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (uint64_t)localizationURLForTileKey:
{
  return 0;
}

- (BOOL)needsLocalizationForKey:(void *)a1
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "localizationURLForTileKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)mergeBaseTileEtag:(id)a3 withLocalizationTileEtag:(id)a4
{
  return GEOSimpleTileRequesterPackETags(a3, a4);
}

- (id)mergeBaseTile:(id)a3 withLocalizationTile:(id)a4
{
  return GEOTilePackageBaseAndLocalization(a3, a4);
}

- (uint64_t)tileEditionForKey:(void *)a1
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "activeTileSetForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "version");

  return v2;
}

- (uint64_t)tileSetForKey:(void *)a1
{
  void *v1;
  void *v2;
  __int16 v3;
  char v4;
  uint64_t v5;
  uint8_t v7[16];

  objc_msgSend(a1, "activeTileSetForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "style");
    v4 = objc_msgSend(v2, "scale");
    v5 = ((v3 & 0x3FFF | ((objc_msgSend(v2, "size") & 0xF) << 14) & 0xFFC3FFFF | ((v4 & 0xF) << 18)) << 8) | 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: tileSet != ((void *)0)", v7, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (void)operationFinished:(id)a3
{
  id v4;
  NSObject *v5;
  os_activity_scope_state_s v6;

  v4 = a3;
  objc_msgSend(v4, "parentTileActivity", 0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v5, &v6);

  -[GEOSimpleTileRequester _operationFinished:](self, "_operationFinished:", v4);
  -[GEOSimpleTileRequester _updateRunningCountAndCheckIfDone](self, "_updateRunningCountAndCheckIfDone");
  os_activity_scope_leave(&v6);

}

- (void)_operationFinished:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  int v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  GEOTileData *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  GEOTileData *v37;
  void *v38;
  uint64_t v39;
  unsigned int v40;
  NSObject *v41;
  void *v42;
  GEOTileData *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  NSMutableArray *errors;
  dispatch_qos_class_t qos;
  id v50;
  id v51;
  id v52;
  id v53;
  NSObject *v54;
  dispatch_block_t v55;
  NSMutableArray *v56;
  NSMutableArray *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id obj;
  _QWORD block[4];
  id v64;
  GEOSimpleTileRequester *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  unsigned int v70;
  __int128 v71;
  _BYTE buf[12];
  __int16 v73;
  void *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  __int128 *v78;
  __int128 v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_cancelled)
  {
    if ((-[GEOSimpleTileRequester _removeRunningOperation:]((id *)&self->super.super.isa, v4) & 1) == 0)
    {
      objc_msgSend(v5, "clearAllRelatedOperations");
      goto LABEL_44;
    }
    objc_msgSend(v5, "baseTile");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
    v9 = v8;

    objc_msgSend(v9, "localizationTile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "finished") || v10 && !objc_msgSend(v10, "finished"))
    {
LABEL_43:

      goto LABEL_44;
    }
    *(_QWORD *)&v79 = objc_msgSend(v9, "key");
    *((_QWORD *)&v79 + 1) = v11;
    -[GEOTileRequester activeTileSetForKey:](self, "activeTileSetForKey:", &v79);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "responseIsCacheable")
       && (!v10 || objc_msgSend(v10, "responseIsCacheable"))
       && -[GEOSimpleTileRequester tileDataIsCacheableForTileKey:](self, "tileDataIsCacheableForTileKey:", &v79);
    v14 = objc_msgSend(v12, "hasTimeToLiveSeconds");
    v15 = v9;
    v16 = v10;
    v17 = v15;
    v60 = v12;
    v61 = v10;
    if (qword_1EDF4FB20 != -1)
      dispatch_once(&qword_1EDF4FB20, &__block_literal_global_462);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", qword_1EDF4FB18);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("tileURL"));

    objc_msgSend(v16, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("localizationURL"));

    if (objc_msgSend(v17, "contentLength") != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "contentLength"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("tileLength"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "httpResponseStatusCode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("GEOTileLoadResultHTTPStatusCode"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("TileIsCacheable"));

    if (v13 || v10 || !v17 || v14 == 1)
    {
      if (!v17)
      {
        v26 = 1;
        goto LABEL_29;
      }
    }
    else
    {
      v24 = objc_msgSend(v17, "responseMaxAge");
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("GEOTileLoadResultMaxAge"));

      }
    }
    v26 = objc_msgSend(v17, "isExistingCachedDataCurrent");
LABEL_29:
    if (v10)
    {
      v27 = objc_msgSend(v16, "isExistingCachedDataCurrent");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26 & v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("CachedDataWasCurrent"));

      objc_msgSend(v17, "data");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "data");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOSimpleTileRequester mergeBaseTile:withLocalizationTile:](self, "mergeBaseTile:withLocalizationTile:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = -[GEOTileData initWithData:]([GEOTileData alloc], "initWithData:", v31);
      objc_msgSend(v17, "responseEtag");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "responseEtag");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOSimpleTileRequester mergeBaseTileEtag:withLocalizationTileEtag:](self, "mergeBaseTileEtag:withLocalizationTileEtag:", v33, v34);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v35, CFSTR("CachedDataWasCurrent"));

      objc_msgSend(v5, "downloadedFileURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = [GEOTileData alloc];
      if (v36)
      {
        objc_msgSend(v5, "downloadedFileURL");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[GEOTileData initWithFileURL:](v37, "initWithFileURL:", v38);
      }
      else
      {
        objc_msgSend(v5, "data");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[GEOTileData initWithData:](v37, "initWithData:", v38);
      }
      v32 = (GEOTileData *)v39;

      objc_msgSend(v5, "responseEtag");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v40 = -[GEOSimpleTileRequester tileEditionForKey:](self, "tileEditionForKey:", &v79);
    GEOGetTileLoadingLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "request");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "request");
      v58 = v18;
      v43 = v32;
      v44 = v40;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "URL");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218755;
      *(_QWORD *)&buf[4] = v42;
      v73 = 2048;
      v74 = v46;
      v75 = 1040;
      v76 = 16;
      v77 = 2097;
      v78 = &v79;
      _os_log_impl(&dword_1885A9000, v41, OS_LOG_TYPE_DEBUG, "Finished data request %p with URL %p (%{private,geo:TileKey}.*P) (online)", buf, 0x26u);

      v40 = v44;
      v32 = v43;
      v18 = v58;

    }
    *(_QWORD *)buf = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      obj = 0;
      -[GEOSimpleTileRequester processTileData:forKey:error:](self, "processTileData:forKey:error:", v32, &v79, &obj);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)buf, obj);

      if (*(_QWORD *)buf)
      {
        errors = self->_errors;
        if (errors)
        {
          -[NSMutableArray addObject:](errors, "addObject:");
        }
        else
        {
          v56 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", buf, 1);
          v57 = self->_errors;
          self->_errors = v56;

        }
      }
    }
    else
    {
      v47 = v32;
    }
    -[GEOSimpleTileRequester _generateEndSignpostEventIfNecessary:]((uint64_t)self, v79, *((uint64_t *)&v79 + 1));
    qos = self->_qos;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__GEOSimpleTileRequester_OperationDelegate___operationFinished___block_invoke;
    block[3] = &unk_1E1BFFCB8;
    v64 = *(id *)buf;
    v65 = self;
    v71 = v79;
    v70 = v40;
    v66 = v47;
    v67 = v60;
    v68 = v59;
    v69 = v18;
    v50 = v18;
    v51 = v59;
    v52 = v60;
    v53 = v47;
    -[GEOTileRequester delegateQueue](self, "delegateQueue");
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos, 0, block);
    dispatch_async(v54, v55);

    -[GEOSimpleTileRequester finishedLoadingTileForKey:baseOperation:](self, "finishedLoadingTileForKey:baseOperation:", v79, v17);
    _recursivelyClearAllRelatedOperations(v17);

    v10 = v61;
    goto LABEL_43;
  }
  _recursivelyClearAllRelatedOperations(v4);
LABEL_44:

}

void __64__GEOSimpleTileRequester_OperationDelegate___operationFinished___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = v3;
  if (v2)
    objc_msgSend(v3, "tileRequester:receivedError:forKey:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 84), *(_QWORD *)(a1 + 92));
  else
    objc_msgSend(v3, "tileRequester:receivedData:tileEdition:tileSetDB:tileSet:etag:forKey:userInfo:", v4, *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 80), objc_msgSend(v4, "tileSetForKey:", a1 + 84), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 84), *(_QWORD *)(a1 + 92), *(_QWORD *)(a1 + 72));

}

- (void)operationFailed:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_activity_scope_state_s v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "parentTileActivity", 0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v8, &v9);

  -[GEOSimpleTileRequester _operationFailed:error:](self, "_operationFailed:error:", v6, v7);
  -[GEOSimpleTileRequester _updateRunningCountAndCheckIfDone](self, "_updateRunningCountAndCheckIfDone");
  os_activity_scope_leave(&v9);

}

- (void)_operationFailed:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSMutableArray *errors;
  NSMutableArray *v16;
  NSMutableArray *v17;
  dispatch_qos_class_t qos;
  NSObject *v19;
  dispatch_block_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  _QWORD v36[5];
  id v37;
  __int128 v38;
  _QWORD block[4];
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34 = v7;
  if (self->_cancelled)
  {
    _recursivelyClearAllRelatedOperations(v6);
  }
  else if ((-[GEOSimpleTileRequester _removeRunningOperation:]((id *)&self->super.super.isa, v6) & 1) != 0)
  {
    v8 = objc_msgSend(v6, "key");
    v10 = v9;
    *(_QWORD *)&v43 = v8;
    *((_QWORD *)&v43 + 1) = v9;
    objc_msgSend(v6, "activity");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__GEOSimpleTileRequester_OperationDelegate___operationFailed_error___block_invoke;
    block[3] = &unk_1E1BFFCE0;
    v13 = v6;
    v40 = v13;
    v42 = v43;
    v14 = v7;
    v41 = v14;
    os_activity_apply(v11, block);

    if (v14)
    {
      errors = self->_errors;
      if (errors)
      {
        -[NSMutableArray addObject:](errors, "addObject:", v14);
      }
      else
      {
        v16 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v34, 1);
        v17 = self->_errors;
        self->_errors = v16;

        v14 = v34;
      }
    }
    qos = self->_qos;
    v36[0] = v12;
    v36[1] = 3221225472;
    v36[2] = __68__GEOSimpleTileRequester_OperationDelegate___operationFailed_error___block_invoke_140;
    v36[3] = &unk_1E1BFFCE0;
    v36[4] = self;
    v37 = v14;
    v38 = v43;
    -[GEOTileRequester delegateQueue](self, "delegateQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos, 0, v36);
    dispatch_async(v19, v20);

    objc_msgSend(v13, "baseTile");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (id)v21;
    else
      v23 = v13;
    -[GEOSimpleTileRequester failedLoadingTileForKey:baseOperation:error:](self, "failedLoadingTileForKey:baseOperation:error:", v8, v10, v23, v34);

    -[GEOSimpleTileRequester removeOperationsForKey:]((id *)&self->super.super.isa, (uint64_t)&v43);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v29, "cancel");
          _recursivelyClearAllRelatedOperations(v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v26);
    }
    _recursivelyClearAllRelatedOperations(v13);
    -[GEOSimpleTileRequester _generateEndSignpostEventIfNecessary:]((uint64_t)self, v43, *((uint64_t *)&v43 + 1));
    -[GEOSimpleTileRequester _updateRunningCountAndCheckIfDone](self, "_updateRunningCountAndCheckIfDone");

    v7 = v34;
  }
  else
  {
    objc_msgSend(v6, "clearAllRelatedOperations");
  }

}

void __68__GEOSimpleTileRequester_OperationDelegate___operationFailed_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOGetTileLoadingLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 134219011;
    v8 = v3;
    v9 = 2048;
    v10 = v5;
    v11 = 1040;
    v12 = 16;
    v13 = 2097;
    v14 = a1 + 48;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_ERROR, "Operation failed request %p with URL %p (%{private,geo:TileKey}.*P) error: %@", (uint8_t *)&v7, 0x30u);

  }
}

void __68__GEOSimpleTileRequester_OperationDelegate___operationFailed_error___block_invoke_140(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tileRequester:receivedError:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (id)verifyDataIntegrity:(id)a3 checksumMethod:(int)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v19;
  GEOSimpleTileRequester *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "length"))
  {
    GEOGetTileLoadingLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v19 = 134217984;
      v20 = self;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "%p Got nil for a tile data", (uint8_t *)&v19, 0xCu);
    }

LABEL_10:
    v9 = v6;
    goto LABEL_17;
  }
  if (a4 != 1)
  {
    if (a4)
    {
      GEOGetTileLoadingLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v19 = 134218240;
        v20 = self;
        v21 = 1024;
        v22 = a4;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "%p Doesn't know about checksum method %d", (uint8_t *)&v19, 0x12u);
      }

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v6, "length") < 0x10)
  {
LABEL_12:
    v9 = 0;
    goto LABEL_17;
  }
  v10 = objc_msgSend(v6, "length") - 16;
  v11 = objc_alloc(MEMORY[0x1E0C99D50]);
  v12 = objc_retainAutorelease(v6);
  v13 = (void *)objc_msgSend(v11, "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v12, "bytes"), v10, 0);
  v14 = objc_alloc(MEMORY[0x1E0C99D50]);
  v15 = objc_retainAutorelease(v12);
  v16 = (void *)objc_msgSend(v14, "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v15, "bytes") + v10, 16, 0);
  objc_msgSend(v13, "_geo_MD5Hash");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToData:", v17))
  {
    objc_msgSend(v15, "subdataWithRange:", 0, v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

LABEL_17:
  return v9;
}

- (uint64_t)checksumMethodForIncomingTileDataWithKey:
{
  return 0;
}

- (uint64_t)shouldAllowEmptyDataForTileKey:
{
  return 0;
}

- (uint64_t)shouldDownloadToDiskForTileKey:estimatedDataSize:
{
  return 0;
}

@end
