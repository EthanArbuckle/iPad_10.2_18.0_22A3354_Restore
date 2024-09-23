@implementation GEOResourceManifestServerLocalProxy

- (id)configuration
{
  return self->_configuration;
}

- (id)authToken
{
  os_unfair_lock_s *p_authTokenLock;
  NSString *v4;

  p_authTokenLock = &self->_authTokenLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_authToken;
  os_unfair_lock_unlock(p_authTokenLock);
  return v4;
}

- (void)_updateManifest:(id)a3
{
  id v4;
  NSObject *v5;
  GEOResourceManifestDownloadTask *manifestDownloadTask;
  GEOResourceManifestDownloadTask *v7;
  NSProgress *v8;
  NSProgress *currentUpdateProgress;
  void *v10;
  int v11;
  int64_t currentManifestUpdateType;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  double Current;
  double lastManifestRetryTimestamp;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  GEOResourceManifestDownloadTask *v32;
  GEOResourceManifestDownloadTask *v33;
  void *v34;
  GEOResourceManifestDownloadTask *v35;
  _QWORD v36[4];
  GEOResourceManifestDownloadTask *v37;
  GEOResourceManifestServerLocalProxy *v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Updating resource manifest", buf, 2u);
  }

  self->_wantsManifestUpdateOnReachabilityChange = 0;
  -[GEOResourceManifestServerLocalProxy _addManifestUpdateCompletionHandler:](self, "_addManifestUpdateCompletionHandler:", v4);
  manifestDownloadTask = self->_manifestDownloadTask;
  if (manifestDownloadTask)
  {
    -[GEOResourceManifestDownloadTask cancel](manifestDownloadTask, "cancel");
    v7 = self->_manifestDownloadTask;
    self->_manifestDownloadTask = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
  v8 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  currentUpdateProgress = self->_currentUpdateProgress;
  self->_currentUpdateProgress = v8;

  +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry](GEOResourceManifestUpdateAssertionRegistry, "sharedRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasActiveAssertions");

  if (!v11)
    goto LABEL_14;
  currentManifestUpdateType = self->_currentManifestUpdateType;
  if ((unint64_t)(currentManifestUpdateType - 1) < 2)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry](GEOResourceManifestUpdateAssertionRegistry, "sharedRegistry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "activeAssertionsDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v15;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "Allowing manifest update despite active assertions: %{public}@", buf, 0xCu);

    }
    goto LABEL_14;
  }
  if (currentManifestUpdateType)
  {
LABEL_14:
    if (self->_currentManifestUpdateType == 2)
      -[NSProgress _geo_mirroredProgressReplaceObservedProgressWith:](self->_updateProgress, "_geo_mirroredProgressReplaceObservedProgressWith:", self->_currentUpdateProgress);
    objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB38A8], "_geo_progressMirroringProgress:", self->_currentUpdateProgress);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addChild:withPendingUnitCount:", v25, 1);

    }
    Current = CFAbsoluteTimeGetCurrent();
    lastManifestRetryTimestamp = self->_lastManifestRetryTimestamp;
    if (Current - lastManifestRetryTimestamp > GEOConfigGetDouble(GeoServicesConfig_TileGroupRetryCountResetInterval, (uint64_t)off_1EDF4D2A8))self->_manifestRetryCount = 0;
    -[GEOResourceManifestServerLocalProxy _manifestURL](self, "_manifestURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "hasEtag"))
    {
      -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "etag");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = 0;
    }

    v32 = -[GEOResourceManifestDownloadTask initWithURL:eTag:]([GEOResourceManifestDownloadTask alloc], "initWithURL:eTag:", v28, v31);
    v33 = self->_manifestDownloadTask;
    self->_manifestDownloadTask = v32;

    objc_initWeak((id *)buf, self);
    -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __55__GEOResourceManifestServerLocalProxy__updateManifest___block_invoke;
    v36[3] = &unk_1E1C0AE08;
    objc_copyWeak(&v41, (id *)buf);
    v35 = v32;
    v37 = v35;
    v38 = self;
    v20 = v28;
    v39 = v20;
    v21 = v31;
    v40 = v21;
    -[GEOResourceManifestDownloadTask startWithQueue:completionHandler:](v35, "startWithQueue:completionHandler:", v34, v36);

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);

    goto LABEL_24;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry](GEOResourceManifestUpdateAssertionRegistry, "sharedRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activeAssertionsDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v18;
    _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_INFO, "Blocking manifest update due to active assertions: %{public}@", buf, 0xCu);

  }
  -[GEOResourceManifestServerLocalProxy _scheduleUpdateTimerWithTimeInterval:](self, "_scheduleUpdateTimerWithTimeInterval:", (double)GEOConfigGetInteger(GeoServicesConfig_ResourceManifestUpdateTimeInterval, (uint64_t)off_1EDF4CC98));
  v19 = (void *)MEMORY[0x1E0CB35C8];
  GEOStringForError(-27);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "GEOErrorWithCode:reason:", -27, v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManifestServerLocalProxy _notifyManifestUpdateCompletionHandlers:](self, "_notifyManifestUpdateCompletionHandlers:", v21);
LABEL_24:

}

- (void)_considerChangingActiveTileGroup
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  GEOActiveTileGroup *activeTileGroup;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  unsigned int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  char v40;
  char v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  self->_wantsTileGroupUpdateOnReachabilityChange = 0;
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Considering changing active tile group", buf, 2u);
  }

  -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tileGroupsCount");

  if (v5)
  {
    -[GEOResourceManifestServerLocalProxy _idealTileGroupToUse](self, "_idealTileGroupToUse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v52 = CFSTR("Did not find a usable tile group");
        _os_log_impl(&dword_1885A9000, v43, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Did not find a usable tile group"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOResourceManifestServerLocalProxy _notifyManifestUpdateCompletionHandlers:](self, "_notifyManifestUpdateCompletionHandlers:", v9);
      goto LABEL_54;
    }
    activeTileGroup = self->_activeTileGroup;
    -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredDataSetForMapsABClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceFiltersManager activeScales](self->_filtersManager, "activeScales");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceFiltersManager activeScenarios](self->_filtersManager, "activeScenarios");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uniqueIdentifierForTileGroup(v6, v11, v12, v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOActiveTileGroup uniqueIdentifier](self->_activeTileGroup, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v14) ^ 1;
    if (activeTileGroup)
      v17 = v16;
    else
      v17 = 1;

    v18 = -[GEOActiveTileGroup identifier](self->_activeTileGroup, "identifier");
    if (v18 != objc_msgSend(v6, "identifier"))
      v17 = 1;
    if (-[GEOActiveTileGroup modelVersion](self->_activeTileGroup, "modelVersion") != 13)
      v17 = 1;
    if (-[GEOActiveTileGroup staleResourcesCount](self->_activeTileGroup, "staleResourcesCount"))
      v17 = 1;
    if (v9 || -[GEOActiveTileGroup hasDataSet](self->_activeTileGroup, "hasDataSet"))
    {
      -[GEOActiveTileGroup dataSet](self->_activeTileGroup, "dataSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "identifier");
      if (v20 != objc_msgSend(v9, "identifier"))
        v17 = 1;

      if ((v17 & 1) != 0)
        goto LABEL_44;
    }
    else if ((v17 & 1) != 0)
    {
      goto LABEL_44;
    }
    -[GEOResourceFiltersManager activeScales](self->_filtersManager, "activeScales");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[GEOActiveTileGroup activeScalesCount](self->_activeTileGroup, "activeScalesCount"))
    {
      v23 = 0;
      do
      {
        v24 = -[GEOActiveTileGroup activeScaleAtIndex:](self->_activeTileGroup, "activeScaleAtIndex:", v23);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v25);

        ++v23;
      }
      while (v23 < -[GEOActiveTileGroup activeScalesCount](self->_activeTileGroup, "activeScalesCount"));
    }
    v26 = objc_msgSend(v22, "isEqualToSet:", v21);

    if (v26)
    {
      -[GEOResourceFiltersManager activeScenarios](self->_filtersManager, "activeScenarios");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[GEOActiveTileGroup activeScenariosCount](self->_activeTileGroup, "activeScenariosCount"))
      {
        v29 = 0;
        do
        {
          v30 = -[GEOActiveTileGroup activeScenarioAtIndex:](self->_activeTileGroup, "activeScenarioAtIndex:", v29);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v31);

          ++v29;
        }
        while (v29 < -[GEOActiveTileGroup activeScenariosCount](self->_activeTileGroup, "activeScenariosCount"));
      }
      v32 = objc_msgSend(v28, "isEqualToSet:", v27);

      if (v32)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v33 = self->_tileGroupMigrators;
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v34)
        {
          v35 = v34;
          v45 = v14;
          v36 = *(_QWORD *)v47;
          while (2)
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v47 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v38, "needsMigrationForNewTileGroup:inResourceManifest:oldTileGroup:dataSet:", v6, v39, self->_activeTileGroup, v9);

                if ((v40 & 1) != 0)
                {
                  v41 = 1;
                  goto LABEL_57;
                }
              }
            }
            v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
            if (v35)
              continue;
            break;
          }
          v41 = 0;
LABEL_57:
          v14 = v45;
        }
        else
        {
          v41 = 0;
        }

LABEL_45:
        if (self->_activeTileGroup
          && GEOConfigGetBOOL(GeoServicesConfig_DisableUpdatingActiveTileGroup, (uint64_t)off_1EDF4D548))
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v44, OS_LOG_TYPE_INFO, "Not changing active tile group because GEODisableUpdatingActiveTileGroup is set", buf, 2u);
          }

        }
        else if ((v41 & 1) != 0)
        {
          -[GEOResourceManifestServerLocalProxy _forceChangeActiveTileGroup:flushTileCache:](self, "_forceChangeActiveTileGroup:flushTileCache:", v6, 0);
LABEL_53:

LABEL_54:
          goto LABEL_55;
        }
        -[GEOResourceManifestServerLocalProxy _notifyManifestUpdateCompletionHandlers:](self, "_notifyManifestUpdateCompletionHandlers:", 0);
        goto LABEL_53;
      }
    }
LABEL_44:
    v41 = 1;
    goto LABEL_45;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v52 = CFSTR("No tile groups available");
    _os_log_impl(&dword_1885A9000, v42, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("No tile groups available"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManifestServerLocalProxy _notifyManifestUpdateCompletionHandlers:](self, "_notifyManifestUpdateCompletionHandlers:", v6);
LABEL_55:

}

void __55__GEOResourceManifestServerLocalProxy__updateManifest___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  GEOResourceManifestDownload *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = *(void **)(a1 + 32);
    if (v14 == *((void **)WeakRetained + 2))
    {
      *((_QWORD *)WeakRetained + 2) = 0;

      v15 = *(_QWORD **)(a1 + 40);
      if (v11)
      {
        objc_msgSend(v15, "_handleManifestUpdateError:", v11);
        goto LABEL_21;
      }
      v15[13] = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "Existing manifest is current. Updating timestamp on-disk", buf, 2u);
        }

        v19 = *(void **)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        v21 = *(_QWORD *)(a1 + 56);
        v40 = 0;
        v22 = objc_msgSend(v19, "_writeManifestToDiskWithUpdatedMetadataForURL:eTag:error:", v20, v21, &v40);
        v23 = v40;
        if ((v22 & 1) == 0)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v42 = v23;
            _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Error writing manifest to disk: %{public}@", buf, 0xCu);
          }

          v25 = *(void **)(a1 + 40);
          v26 = 0;
LABEL_19:
          objc_msgSend(v25, "_handleManifestUpdateError:", v26);
          goto LABEL_20;
        }
      }
      else
      {
        v27 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
        if (!v27)
        {
          v28 = objc_alloc_init(GEOResourceManifestDownload);
          v29 = *(_QWORD *)(a1 + 40);
          v30 = *(void **)(v29 + 80);
          *(_QWORD *)(v29 + 80) = v28;

          v27 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
        }
        objc_msgSend(v27, "setResources:", v9);
        os_unfair_lock_lock_with_options();
        objc_msgSend(v9, "authToken");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(a1 + 40);
        v33 = *(void **)(v32 + 136);
        *(_QWORD *)(v32 + 136) = v31;

        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 144));
        v34 = *(void **)(a1 + 40);
        v35 = *(_QWORD *)(a1 + 48);
        v39 = 0;
        v36 = objc_msgSend(v34, "_writeManifestToDiskWithUpdatedMetadataForURL:eTag:error:", v35, v10, &v39);
        v23 = v39;
        if ((v36 & 1) == 0)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v42 = v23;
            _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_ERROR, "Error writing manifest to disk: %{public}@", buf, 0xCu);
          }

          v25 = *(void **)(a1 + 40);
          v26 = v23;
          goto LABEL_19;
        }
      }

      objc_msgSend(*(id *)(a1 + 40), "_scheduleUpdateTimerWithTimeInterval:", (double)GEOConfigGetInteger(GeoServicesConfig_ResourceManifestUpdateTimeInterval, (uint64_t)off_1EDF4CC98));
      v37 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "absoluteString");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_changeActiveTileGroupIfNeededForManifestURL:oldURL:", v23, v17);
LABEL_20:

    }
  }
LABEL_21:

}

- (BOOL)_writeManifestToDiskWithUpdatedMetadataForURL:(id)a3 eTag:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  BOOL v30;
  GEODownloadMetadata *v32;
  id *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (self->_resourceManifest)
  {
    v33 = a5;
    v32 = objc_alloc_init(GEODownloadMetadata);
    -[GEOResourceManifestDownload setMetadata:](self->_resourceManifest, "setMetadata:");
    objc_msgSend(v8, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUrl:", v10);

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v13 = v12 + 978307200.0;
    -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTimestamp:", v13);

    -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v9;
    objc_msgSend(v15, "setEtag:", v9);

    v35 = v8;
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v16, "queryItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v22, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("environment"));

          if (v24)
          {
            objc_msgSend(v22, "value");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setEnvironment:", v25);

            goto LABEL_12;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v19)
          continue;
        break;
      }
    }
LABEL_12:

    -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "hasEnvironment");

    if ((v28 & 1) == 0)
    {
      -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setEnvironment:", CFSTR("prod"));

    }
    v30 = -[GEOResourceManifestServerLocalProxy _writeManifestToDisk:error:](self, "_writeManifestToDisk:error:", self->_resourceManifest, v33);

    v9 = v34;
    v8 = v35;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _resourceManifest", buf, 2u);
    }
    v30 = 0;
  }

  return v30;
}

- (void)_scheduleUpdateTimerWithTimeInterval:(double)a3
{
  NSObject *v5;
  NSObject *manifestUpdateTimer;
  OS_dispatch_source *v7;
  NSObject *v8;
  dispatch_source_t v9;
  dispatch_object_t *p_manifestUpdateTimer;
  OS_dispatch_source *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD handler[4];
  id v16;
  uint8_t buf[4];
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v18 = a3;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Scheduling manifest update in %f seconds", buf, 0xCu);
  }

  manifestUpdateTimer = self->_manifestUpdateTimer;
  if (manifestUpdateTimer)
  {
    dispatch_source_cancel(manifestUpdateTimer);
    v7 = self->_manifestUpdateTimer;
    self->_manifestUpdateTimer = 0;

  }
  objc_initWeak((id *)buf, self);
  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);
  v11 = self->_manifestUpdateTimer;
  p_manifestUpdateTimer = (dispatch_object_t *)&self->_manifestUpdateTimer;
  *p_manifestUpdateTimer = v9;

  v12 = *p_manifestUpdateTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __76__GEOResourceManifestServerLocalProxy__scheduleUpdateTimerWithTimeInterval___block_invoke;
  handler[3] = &unk_1E1BFF8B0;
  objc_copyWeak(&v16, (id *)buf);
  dispatch_source_set_event_handler(v12, handler);
  v13 = *p_manifestUpdateTimer;
  v14 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  dispatch_activate(*p_manifestUpdateTimer);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (id)serverQueue
{
  return self->_workQueue;
}

- (void)_notifyManifestUpdateCompletionHandlers:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResourceManifestServerLocalProxy _resetCurrentUpdateState](self, "_resetCurrentUpdateState");
  -[GEOResourceManifestServerLocalProxy _notifyImmediateManifestUpdateCompletionHandlers:](self, "_notifyImmediateManifestUpdateCompletionHandlers:", v4);
  -[GEOResourceManifestServerLocalProxy _notifyOpportunisticManifestUpdateCompletionHandlers:](self, "_notifyOpportunisticManifestUpdateCompletionHandlers:", v4);

}

- (void)_resetCurrentUpdateState
{
  int64_t v3;
  NSProgress *v4;
  NSProgress *currentUpdateProgress;

  self->_currentManifestUpdateType = 0;
  if (-[NSProgress totalUnitCount](self->_currentUpdateProgress, "totalUnitCount") < 1)
    v3 = 1;
  else
    v3 = -[NSProgress totalUnitCount](self->_currentUpdateProgress, "totalUnitCount");
  -[NSProgress setTotalUnitCount:](self->_currentUpdateProgress, "setTotalUnitCount:", v3);
  -[NSProgress setCompletedUnitCount:](self->_currentUpdateProgress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_currentUpdateProgress, "totalUnitCount"));
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v4 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  currentUpdateProgress = self->_currentUpdateProgress;
  self->_currentUpdateProgress = v4;

  -[NSProgress setCompletedUnitCount:](self->_currentUpdateProgress, "setCompletedUnitCount:", 1);
  -[NSProgress _geo_mirroredProgressReplaceObservedProgressWith:](self->_updateProgress, "_geo_mirroredProgressReplaceObservedProgressWith:", self->_currentUpdateProgress);
}

- (void)_notifyOpportunisticManifestUpdateCompletionHandlers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_opportunisticManifestUpdateCompletionHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_opportunisticManifestUpdateCompletionHandlers, "removeAllObjects");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_notifyImmediateManifestUpdateCompletionHandlers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_manifestUpdateCompletionHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_manifestUpdateCompletionHandlers, "removeAllObjects");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)_idealTileGroupToUse
{
  void *v3;
  uint64_t v4;
  unsigned int UInteger;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tileGroupsCount");

  if (!v4)
    return 0;
  if (_GEOConfigHasValue(GeoServicesConfig_OverrideTileGroup, (uint64_t)off_1EDF4D2E8)
    || -[GEOResourceManifestConfiguration tileGroupIdentifier](self->_configuration, "tileGroupIdentifier"))
  {
    UInteger = GEOConfigGetUInteger(GeoServicesConfig_OverrideTileGroup, (uint64_t)off_1EDF4D2E8);
    if (-[GEOResourceManifestConfiguration tileGroupIdentifier](self->_configuration, "tileGroupIdentifier"))
      UInteger = -[GEOResourceManifestConfiguration tileGroupIdentifier](self->_configuration, "tileGroupIdentifier");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tileGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v12, "identifier") == UInteger)
          {
            v14 = v12;
            goto LABEL_18;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }

    return 0;
  }
  -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tileGroupAtIndex:", 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v15 = v14;

  return v15;
}

- (void)_changeActiveTileGroupIfNeededForManifestURL:(id)a3 oldURL:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6 && (objc_msgSend(v10, "isEqualToString:", v6) & 1) != 0)
  {
    -[GEOResourceManifestServerLocalProxy _considerChangingActiveTileGroup](self, "_considerChangingActiveTileGroup");
  }
  else
  {
    if (-[GEOResourceManifestConfiguration isDefaultConfiguration](self->_configuration, "isDefaultConfiguration"))
      _setValue(GeoServicesConfig_LastResourceManifestURL, (uint64_t)off_1EDF4CC38, v10, 1, 0);
    -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "tileGroupsCount");

    if (v8)
    {
      -[GEOResourceManifestServerLocalProxy _idealTileGroupToUse](self, "_idealTileGroupToUse");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOResourceManifestServerLocalProxy _forceChangeActiveTileGroup:flushTileCache:](self, "_forceChangeActiveTileGroup:flushTileCache:", v9, v6 != 0);

    }
  }

}

- (BOOL)_writeManifestToDisk:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v32 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v32, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  GEOResourceManifestPath(self->_configuration);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CB2AA8];
  v43 = *MEMORY[0x1E0CB2AA8];
  v44[0] = &unk_1E1E81268;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  LOBYTE(v8) = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, v13, &v36);
  v14 = v36;
  v31 = v6;
  if ((v8 & 1) != 0)
  {
    v35 = 0;
    v15 = objc_msgSend(v6, "writeToURL:options:error:", v9, 268435457, &v35);
    v16 = v35;
    v17 = v16;
    if ((v15 & 1) == 0)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      goto LABEL_14;
    }
    v29 = v16;
    objc_msgSend(v9, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v11, "attributesOfItemAtPath:error:", v18, &v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v34;

    if (!v19)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToNumber:", &unk_1E1E81280);

      if ((v21 & 1) == 0)
      {
        v25 = *MEMORY[0x1E0CB2AE0];
        v41[0] = *MEMORY[0x1E0CB2AD8];
        v41[1] = v12;
        v42[0] = v25;
        v42[1] = &unk_1E1E81280;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v11, "setAttributes:ofItemAtPath:error:", v22, v26, &v33);
        v19 = v33;

        if (v19)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = v28;
            v39 = 2114;
            v40 = v19;
            _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_ERROR, "Couldn't set permissions for resource manifest %{public}@: %{public}@", buf, 0x16u);

          }
        }
        goto LABEL_7;
      }
      v19 = 0;
    }
    v22 = v30;
LABEL_7:

    v17 = v29;
LABEL_14:

    goto LABEL_15;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v14;
    _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "Unable to create manifest directory: %@", buf, 0xCu);
  }

  v15 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v14);
LABEL_15:

  return v15;
}

uint64_t __77__GEOResourceManifestServerLocalProxy__setCurrentUpdateType_completionBlock___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  *(_QWORD *)(a1[4] + 176) = a1[6];
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __77__GEOResourceManifestServerLocalProxy__setCurrentUpdateType_completionBlock___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[22];
  v4 = *(_QWORD *)(a1 + 48);
  if (v3 <= v4)
    v5 = *(_QWORD *)(a1 + 48);
  else
    v5 = v2[22];
  if (v3 < v4 || (v4 == 2 ? (v6 = v5 == 2) : (v6 = 0), v6))
  {
    objc_msgSend(v2, "_cancelManifestUpdate");
    objc_msgSend(*(id *)(a1 + 32), "_cancelMigrationTasks");
    v2 = *(_QWORD **)(a1 + 32);
  }
  if (v2[2])
    v7 = 1;
  else
    v7 = v2[28] != 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__GEOResourceManifestServerLocalProxy__setCurrentUpdateType_completionBlock___block_invoke_2;
  v10[3] = &unk_1E1C0AE30;
  v10[4] = v2;
  v12 = v5;
  v11 = *(id *)(a1 + 40);
  v8 = MEMORY[0x18D765024](v10);
  v9 = (void *)v8;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "_addOpportunisticManifestUpdateCompletionHandler:", v8);
  else
    (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

}

uint64_t __69__GEOResourceManifestServerLocalProxy_forceUpdate_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateManifest:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "resignCurrent");
}

- (void)forceUpdate:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__GEOResourceManifestServerLocalProxy_forceUpdate_completionHandler___block_invoke;
  v10[3] = &unk_1E1C0AE80;
  v8 = v7;
  v11 = v8;
  objc_copyWeak(&v13, &location);
  v9 = v6;
  v12 = v9;
  -[GEOResourceManifestServerLocalProxy _setCurrentUpdateType:completionBlock:](self, "_setCurrentUpdateType:completionBlock:", a3, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)activateResourceScale:(int)a3
{
  -[GEOResourceFiltersManager activateScale:](self->_filtersManager, "activateScale:", *(_QWORD *)&a3);
}

- (void)_setCurrentUpdateType:(int64_t)a3 completionBlock:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__GEOResourceManifestServerLocalProxy__setCurrentUpdateType_completionBlock___block_invoke;
  block[3] = &unk_1E1C0AE58;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (id)_manifestURL
{
  return GEOResourceManifestURLForConfiguration(self->_configuration);
}

- (void)_addManifestUpdateCompletionHandler:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *manifestUpdateCompletionHandlers;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    if (!self->_manifestUpdateCompletionHandlers)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      manifestUpdateCompletionHandlers = self->_manifestUpdateCompletionHandlers;
      self->_manifestUpdateCompletionHandlers = v5;

    }
    v7 = (void *)objc_msgSend(v10, "copy");
    v8 = self->_manifestUpdateCompletionHandlers;
    v9 = (void *)MEMORY[0x18D765024]();
    -[NSMutableArray addObject:](v8, "addObject:", v9);

    v4 = v10;
  }

}

- (id)serverOperationQueue
{
  return self->_workOperationQueue;
}

- (GEOResourceManifestServerLocalProxy)initWithDelegate:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  GEOResourceManifestServerLocalProxy *v8;
  uint64_t v9;
  OS_dispatch_queue *workQueue;
  uint64_t v11;
  geo_isolater *activeTileGroupIsolater;
  NSOperationQueue *v13;
  NSOperationQueue *workOperationQueue;
  GEOResourceManifestConfiguration *v15;
  GEOResourceManifestConfiguration *configuration;
  GEOResourceFiltersManager *v17;
  GEOResourceFiltersManager *filtersManager;
  void *v19;
  uint64_t v20;
  NSProgress *updateProgress;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  GEOResourceManifestServerLocalProxy *v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)GEOResourceManifestServerLocalProxy;
  v8 = -[GEOResourceManifestServerLocalProxy init](&v27, sel_init);
  if (v8)
  {
    v9 = geo_dispatch_queue_create();
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v9;

    v11 = geo_isolater_create();
    activeTileGroupIsolater = v8->_activeTileGroupIsolater;
    v8->_activeTileGroupIsolater = (geo_isolater *)v11;

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    workOperationQueue = v8->_workOperationQueue;
    v8->_workOperationQueue = v13;

    -[NSOperationQueue setName:](v8->_workOperationQueue, "setName:", CFSTR("com.apple.geo.ResourceManifest.LocalProxy"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_workOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setUnderlyingQueue:](v8->_workOperationQueue, "setUnderlyingQueue:", v8->_workQueue);
    objc_storeWeak((id *)&v8->_delegate, v6);
    if (v7)
      v15 = (GEOResourceManifestConfiguration *)v7;
    else
      v15 = objc_alloc_init(GEOResourceManifestConfiguration);
    configuration = v8->_configuration;
    v8->_configuration = v15;

    v8->_authTokenLock._os_unfair_lock_opaque = 0;
    v17 = -[GEOResourceFiltersManager initWithConfiguration:]([GEOResourceFiltersManager alloc], "initWithConfiguration:", v8->_configuration);
    filtersManager = v8->_filtersManager;
    v8->_filtersManager = v17;

    -[GEOResourceFiltersManager setDelegate:](v8->_filtersManager, "setDelegate:", v8);
    -[GEOResourceManifestServerLocalProxy _createMigrators](v8, "_createMigrators");
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38A8], "_geo_progressMirroringProgress:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    updateProgress = v8->_updateProgress;
    v8->_updateProgress = (NSProgress *)v20;

    -[GEOResourceManifestServerLocalProxy serverQueue](v8, "serverQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    GEORegisterPListStateCaptureLegacy();

    v23 = v8->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__GEOResourceManifestServerLocalProxy_initWithDelegate_configuration___block_invoke;
    block[3] = &unk_1E1BFF6F8;
    v26 = v8;
    dispatch_async(v23, block);

  }
  return v8;
}

uint64_t __70__GEOResourceManifestServerLocalProxy_initWithDelegate_configuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadFromDisk");
}

- (void)_createMigrators
{
  void *v3;
  NSArray *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSArray *tileGroupMigrators;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
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
        v10 = objc_alloc(*(Class *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v11 = (void *)objc_msgSend(v10, "initWithManifestConfiguration:mapLayerDataManager:", self->_configuration, 0, (_QWORD)v13);
        if (v11)
          -[NSArray addObject:](v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  tileGroupMigrators = self->_tileGroupMigrators;
  self->_tileGroupMigrators = v4;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *manifestUpdateTimer;
  NSObject *tileGroupUpdateTimer;
  objc_super v7;

  GEOUnregisterStateCaptureLegacy();
  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNetworkReachableObserver:", self);

  -[GEOResourceManifestServerLocalProxy _cancelManifestUpdate](self, "_cancelManifestUpdate");
  -[GEOResourceManifestServerLocalProxy _cancelMigrationTasks](self, "_cancelMigrationTasks");
  manifestUpdateTimer = self->_manifestUpdateTimer;
  if (manifestUpdateTimer)
    dispatch_source_cancel(manifestUpdateTimer);
  tileGroupUpdateTimer = self->_tileGroupUpdateTimer;
  if (tileGroupUpdateTimer)
    dispatch_source_cancel(tileGroupUpdateTimer);
  -[GEOResourceFiltersManager setDelegate:](self->_filtersManager, "setDelegate:", 0);
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestServerLocalProxy;
  -[GEOResourceManifestServerLocalProxy dealloc](&v7, sel_dealloc);
}

- (void)_startServer
{
  NSObject *v3;
  _QWORD block[5];

  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__GEOResourceManifestServerLocalProxy__startServer__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __51__GEOResourceManifestServerLocalProxy__startServer__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t result;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[96])
  {
    objc_msgSend(v2, "serverQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), v3, *(void **)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "serverQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88, v4, *(void **)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "serverQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1EDF4E858, v5, *(void **)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "serverQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_AdditionalTransitMarkets, (uint64_t)off_1EDF4DB58, v6, *(void **)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "serverQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ActiveTileGroupOverrides, (uint64_t)off_1EDF4D538, v7, *(void **)(a1 + 32));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__countryProvidersDidChange_, CFSTR("GEOCountryConfigurationProvidersDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__networkDefaultsDidChange_, CFSTR("GEONetworkDefaultsDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__terminationRequested_, CFSTR("GEODaemonShouldTerminateNotification"), 0);

    +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addNetworkReachableObserver:selector:", *(_QWORD *)(a1 + 32), sel__reachabilityChanged_);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
    v2 = *(_BYTE **)(a1 + 32);
  }
  result = objc_msgSend(v2, "_updateManifestIfNecessary:", 0);
  if ((result & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v14 = v13 + 978307200.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timestamp");
    v17 = v16;

    objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdateTimerWithTimeInterval:", v17- v14+ (double)GEOConfigGetInteger(GeoServicesConfig_ResourceManifestUpdateTimeInterval, (uint64_t)off_1EDF4CC98));
    return objc_msgSend(*(id *)(a1 + 32), "_considerChangingActiveTileGroup");
  }
  return result;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == (_DWORD)GeoServicesConfig_AdditionalTransitMarkets && a3.var1 == off_1EDF4DB58)
  {
    -[GEOResourceManifestServerLocalProxy _manifestURLDidChange:](self, "_manifestURLDidChange:", 0, a3.var1);
    notify_post("com.apple.GeoServices.additionalEnabledMarketsChanged");
  }
  else if (a3.var0 == (_DWORD)GeoServicesConfig_ActiveTileGroupOverrides && a3.var1 == off_1EDF4D538)
  {
    -[GEOResourceManifestServerLocalProxy _activeTileGroupOverridesChanged:](self, "_activeTileGroupOverridesChanged:", 0, a3.var1);
  }
  else
  {
    -[GEOResourceManifestServerLocalProxy _manifestURLDidChange:](self, "_manifestURLDidChange:", 0, a3.var1);
  }
}

- (void)_loadFromDisk
{
  GEOResourceManifestDownload *resourceManifest;
  void *v4;
  void *v5;
  GEOResourceManifestDownload *v6;
  GEOResourceManifestDownload *v7;
  void *v8;
  char v9;
  NSObject *v10;
  GEOResourceManifestDownload *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  NSString *authToken;
  void *v18;
  uint64_t v19;
  void *v20;
  GEOActiveTileGroup *v21;
  id WeakRetained;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  resourceManifest = self->_resourceManifest;
  self->_resourceManifest = 0;

  -[GEOResourceManifestServerLocalProxy setActiveTileGroup:](self, "setActiveTileGroup:", 0);
  GEOResourceManifestPath(self->_configuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[GEOResourceManifestDownload initWithData:]([GEOResourceManifestDownload alloc], "initWithData:", v5);
      v7 = self->_resourceManifest;
      self->_resourceManifest = v6;

      -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isValid");

      if ((v9 & 1) == 0)
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Invalid manifest on-disk. Removing...", buf, 2u);
        }

        v11 = self->_resourceManifest;
        self->_resourceManifest = 0;

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        objc_msgSend(v12, "removeItemAtPath:error:", v4, &v23);
        v13 = v23;

        if (v13)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v25 = v13;
            _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Error removing corrupt resource manifest: %{public}@", buf, 0xCu);
          }

        }
      }
    }
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_lock_with_options();
  -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "authToken");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  authToken = self->_authToken;
  self->_authToken = v16;

  os_unfair_lock_unlock(&self->_authTokenLock);
  GEOActiveTileGroupPath(self->_configuration);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      v21 = -[GEOActiveTileGroup initWithData:]([GEOActiveTileGroup alloc], "initWithData:", v19);
      -[GEOResourceManifestServerLocalProxy setActiveTileGroup:](self, "setActiveTileGroup:", v21);
      if (v21)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "serverProxy:didLoadActiveTileGroup:", self, v21);

      }
    }
  }

}

- (GEOActiveTileGroup)activeTileGroup
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__40;
  v8 = __Block_byref_object_dispose__40;
  v9 = 0;
  geo_isolate_sync_data();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (GEOActiveTileGroup *)v2;
}

void __54__GEOResourceManifestServerLocalProxy_activeTileGroup__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)setActiveTileGroup:(id)a3
{
  GEOActiveTileGroup *v4;
  GEOActiveTileGroup *v5;
  GEOActiveTileGroup *v6;

  v4 = (GEOActiveTileGroup *)a3;
  if (self->_activeTileGroup != v4)
  {
    v5 = v4;
    v6 = v4;
    geo_isolate_sync_data();

    v4 = v5;
  }

}

void __58__GEOResourceManifestServerLocalProxy_setActiveTileGroup___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

- (void)_scheduleTileGroupUpdateTimerWithTimeInterval:(double)a3
{
  NSObject *v5;
  NSObject *tileGroupUpdateTimer;
  OS_dispatch_source *v7;
  NSObject *v8;
  dispatch_source_t v9;
  dispatch_object_t *p_tileGroupUpdateTimer;
  OS_dispatch_source *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD handler[4];
  id v16;
  uint8_t buf[4];
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v18 = a3;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Scheduling tile group update in %f seconds", buf, 0xCu);
  }

  tileGroupUpdateTimer = self->_tileGroupUpdateTimer;
  if (tileGroupUpdateTimer)
  {
    dispatch_source_cancel(tileGroupUpdateTimer);
    v7 = self->_tileGroupUpdateTimer;
    self->_tileGroupUpdateTimer = 0;

  }
  objc_initWeak((id *)buf, self);
  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);
  v11 = self->_tileGroupUpdateTimer;
  p_tileGroupUpdateTimer = (dispatch_object_t *)&self->_tileGroupUpdateTimer;
  *p_tileGroupUpdateTimer = v9;

  v12 = *p_tileGroupUpdateTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __85__GEOResourceManifestServerLocalProxy__scheduleTileGroupUpdateTimerWithTimeInterval___block_invoke;
  handler[3] = &unk_1E1BFF8B0;
  objc_copyWeak(&v16, (id *)buf);
  dispatch_source_set_event_handler(v12, handler);
  v13 = *p_tileGroupUpdateTimer;
  v14 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  dispatch_activate(*p_tileGroupUpdateTimer);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __85__GEOResourceManifestServerLocalProxy__scheduleTileGroupUpdateTimerWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tileGroupTimerFired");

}

- (void)_tileGroupTimerFired
{
  NSObject *tileGroupUpdateTimer;
  OS_dispatch_source *v4;

  tileGroupUpdateTimer = self->_tileGroupUpdateTimer;
  if (tileGroupUpdateTimer)
  {
    dispatch_source_cancel(tileGroupUpdateTimer);
    v4 = self->_tileGroupUpdateTimer;
    self->_tileGroupUpdateTimer = 0;

  }
  -[GEOResourceManifestServerLocalProxy _considerChangingActiveTileGroup](self, "_considerChangingActiveTileGroup");
}

- (void)performOpportunisticResourceLoading
{
  NSObject *v3;
  _QWORD block[5];

  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__GEOResourceManifestServerLocalProxy_performOpportunisticResourceLoading__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __74__GEOResourceManifestServerLocalProxy_performOpportunisticResourceLoading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_considerChangingActiveTileGroup");
}

- (void)_forceChangeActiveTileGroup:(id)a3 flushTileCache:(BOOL)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  GEOTileGroupActivationSession *tileGroupActivationSession;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  GEOTileGroupActivationSession *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  GEOActiveTileGroup *activeTileGroup;
  NSArray *tileGroupMigrators;
  int64_t currentManifestUpdateType;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  GEOTileGroupActivationSession *v35;
  GEOTileGroupActivationSession *v36;
  NSProgress *currentUpdateProgress;
  void *v38;
  double v39;
  NSObject *v40;
  __CFString *v41;
  NSArray *v42;
  int64_t v43;
  GEOResourceManifestConfiguration *configuration;
  __CFString *v45;
  __CFString *v46;
  id v47;
  void *v48;
  void *v49;
  uint8_t buf[4];
  const __CFString *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[GEOResourceFiltersManager activeScales](self->_filtersManager, "activeScales");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceFiltersManager activeScenarios](self->_filtersManager, "activeScenarios");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceFiltersManager activeNames](self->_filtersManager, "activeNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredDataSetForMapsABClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uniqueIdentifierForTileGroup(v5, v13, v6, v7, v10);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v52 = v14;
    _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Trying to change to new tile group: %{private}@", buf, 0xCu);

  }
  if (v5)
  {
    -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uniqueIdentifierForTileGroup(v5, v16, v6, v7, v10);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    tileGroupActivationSession = self->_tileGroupActivationSession;
    if (tileGroupActivationSession
      && (-[GEOTileGroupActivationSession uniqueIdentifier](tileGroupActivationSession, "uniqueIdentifier"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = -[__CFString isEqualToString:](v17, "isEqualToString:", v19),
          v19,
          v20))
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v52 = v17;
        _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "Already attempting to change to tile group '%{private}@'", buf, 0xCu);
      }

    }
    else
    {
      v45 = v17;
      v48 = v10;
      v49 = v8;
      v47 = v5;
      -[GEOResourceManifestServerLocalProxy _cancelMigrationTasks](self, "_cancelMigrationTasks");
      GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v52 = v6;
        v53 = 2113;
        v54 = v7;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_DEBUG, "Active scales: %{private}@. Active Scenarios: %{private}@", buf, 0x16u);
      }

      v23 = [GEOTileGroupActivationSession alloc];
      configuration = self->_configuration;
      -[GEOResourceManifestDownload resources](self->_resourceManifest, "resources");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "environment");
      v26 = v6;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      activeTileGroup = self->_activeTileGroup;
      tileGroupMigrators = self->_tileGroupMigrators;
      currentManifestUpdateType = self->_currentManifestUpdateType;
      -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v7;
      v33 = (void *)v31;
      v42 = tileGroupMigrators;
      v43 = currentManifestUpdateType;
      v5 = v47;
      v34 = v32;
      v41 = v26;
      v46 = v26;
      v17 = v45;
      v35 = -[GEOTileGroupActivationSession initWithIdentifier:configuration:tileGroup:inResourceManifest:environmentName:oldTileGroup:activeScales:activeScenarios:activeNames:dataSet:migrators:updateType:delegate:delegateQueue:](v23, "initWithIdentifier:configuration:tileGroup:inResourceManifest:environmentName:oldTileGroup:activeScales:activeScenarios:activeNames:dataSet:migrators:updateType:delegate:delegateQueue:", v45, configuration, v47, v24, v27, activeTileGroup, v41, v32, v49, v48, v42, v43, self, v31);
      v36 = self->_tileGroupActivationSession;
      self->_tileGroupActivationSession = v35;

      self->_tileGroupActivationSessionHasFinishedFirstTileGroupChange = 0;
      self->_tileGroupActivationShouldFlushTileCache = a4;
      -[NSProgress setTotalUnitCount:](self->_currentUpdateProgress, "setTotalUnitCount:", 1);
      currentUpdateProgress = self->_currentUpdateProgress;
      -[GEOTileGroupActivationSession progress](self->_tileGroupActivationSession, "progress");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSProgress addChild:withPendingUnitCount:](currentUpdateProgress, "addChild:withPendingUnitCount:", v38, 1);

      v39 = CFAbsoluteTimeGetCurrent() - self->_lastTileGroupRetryTimestamp;
      if (v39 > GEOConfigGetDouble(GeoServicesConfig_TileGroupRetryCountResetInterval, (uint64_t)off_1EDF4D2A8))
        self->_tileGroupRetryCount = 0;
      -[GEOTileGroupActivationSession start](self->_tileGroupActivationSession, "start");
      v6 = v46;
      v7 = v34;
      v10 = v48;
      v8 = v49;
    }
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v52 = CFSTR("Tried to change to nil tile group. Ignoring...");
      _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Tried to change to nil tile group. Ignoring..."));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceManifestServerLocalProxy _notifyManifestUpdateCompletionHandlers:](self, "_notifyManifestUpdateCompletionHandlers:", v17);
  }

}

- (id)migrationTaskOptions
{
  return 0;
}

- (void)_cancelMigrationTasks
{
  GEOTileGroupActivationSession *tileGroupActivationSession;

  -[GEOTileGroupActivationSession cancel](self->_tileGroupActivationSession, "cancel");
  tileGroupActivationSession = self->_tileGroupActivationSession;
  self->_tileGroupActivationSession = 0;

}

- (void)_cancelManifestUpdate
{
  GEOResourceManifestDownloadTask *manifestDownloadTask;
  GEOResourceManifestDownloadTask *v4;

  manifestDownloadTask = self->_manifestDownloadTask;
  if (manifestDownloadTask)
  {
    -[GEOResourceManifestDownloadTask cancel](manifestDownloadTask, "cancel");
    v4 = self->_manifestDownloadTask;
    self->_manifestDownloadTask = 0;

  }
}

- (void)setActiveTileGroupIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  GEOResourceManifestServerLocalProxy *v9;

  v4 = a3;
  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier___block_invoke;
  v7[3] = &unk_1E1C00738;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __68__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "resources", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tileGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "identifier") == v2)
        {
          objc_msgSend(*(id *)(a1 + 40), "_forceChangeActiveTileGroup:flushTileCache:", v9, 0);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)setActiveTileGroupIdentifier:(id)a3 updateType:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  GEOResourceManifestServerLocalProxy *v17;
  id v18;
  id v19;
  int64_t v20;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke;
  block[3] = &unk_1E1C0ADC0;
  v16 = v8;
  v17 = self;
  v19 = v9;
  v20 = a4;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

}

void __97__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue");
  if (v2)
  {
    v3 = v2;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "resources");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tileGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v9, "identifier") == v3)
          {
            v10 = v9;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_12:

    if (v10)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_idealTileGroupToUse");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
LABEL_13:
      objc_initWeak(&location, *(id *)(a1 + 40));
      v11 = *(void **)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 64);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __97__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke_2;
      v15[3] = &unk_1E1C0AD98;
      objc_copyWeak(&v19, &location);
      v16 = *(id *)(a1 + 48);
      v18 = *(id *)(a1 + 56);
      v17 = v10;
      objc_msgSend(v11, "_setCurrentUpdateType:completionBlock:", v12, v15);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      goto LABEL_17;
    }
  }
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("No matching tile group"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
LABEL_17:

}

void __97__GEOResourceManifestServerLocalProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)*((_QWORD *)WeakRetained + 27);
    *((_QWORD *)WeakRetained + 27) = v2;

    objc_msgSend(*((id *)WeakRetained + 26), "_geo_mirroredProgressReplaceObservedProgressWith:", *((_QWORD *)WeakRetained + 27));
    objc_msgSend(*(id *)(a1 + 32), "addChild:withPendingUnitCount:", *((_QWORD *)WeakRetained + 27), 1);
    objc_msgSend(WeakRetained, "_addOpportunisticManifestUpdateCompletionHandler:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "_forceChangeActiveTileGroup:flushTileCache:", *(_QWORD *)(a1 + 40), 0);
  }

}

- (void)resetActiveTileGroup
{
  NSObject *v3;
  _QWORD block[5];

  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__GEOResourceManifestServerLocalProxy_resetActiveTileGroup__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __59__GEOResourceManifestServerLocalProxy_resetActiveTileGroup__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "resources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tileGroupsCount");

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_idealTileGroupToUse");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_forceChangeActiveTileGroup:flushTileCache:", v5, 0);

  }
}

- (void)_activeTileGroupOverridesChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__GEOResourceManifestServerLocalProxy__activeTileGroupOverridesChanged___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __72__GEOResourceManifestServerLocalProxy__activeTileGroupOverridesChanged___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_idealTileGroupToUse");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_forceChangeActiveTileGroup:flushTileCache:", v2, 0);

}

- (BOOL)_writeActiveTileGroupToDisk:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GEOActiveTileGroupPath(self->_configuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  if (objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, &v26))
    v10 = v26 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v33 = *MEMORY[0x1E0CB2AA8];
    v34[0] = &unk_1E1E81268;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, v11, 0);

  }
  v12 = objc_msgSend(v6, "writeToFile:options:error:", v7, 268435457, a4);
  if (v12)
  {
    v25 = 0;
    objc_msgSend(v9, "attributesOfItemAtPath:error:", v7, &v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    if (v14)
    {
      v15 = v14;
    }
    else
    {
      v16 = *MEMORY[0x1E0CB2AA8];
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AA8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToNumber:", &unk_1E1E81280);

      if ((v18 & 1) == 0)
      {
        v21 = *MEMORY[0x1E0CB2AE0];
        v31[0] = *MEMORY[0x1E0CB2AD8];
        v31[1] = v16;
        v32[0] = v21;
        v32[1] = &unk_1E1E81280;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0;
        objc_msgSend(v9, "setAttributes:ofItemAtPath:error:", v19, v7, &v24);
        v15 = v24;
        if (v15)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v15, "localizedDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478083;
            v28 = v7;
            v29 = 2113;
            v30 = v23;
            _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_DEBUG, "Couldn't set permissions for active tile group %{private}@\n%{private}@", buf, 0x16u);

          }
        }
        goto LABEL_13;
      }
      v15 = 0;
    }
    v19 = v13;
LABEL_13:

  }
  return v12;
}

- (void)_countryProvidersDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GEOResourceManifestServerLocalProxy__countryProvidersDidChange___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __66__GEOResourceManifestServerLocalProxy__countryProvidersDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceUpdate:completionHandler:", 1, 0);
}

- (void)_networkDefaultsDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__GEOResourceManifestServerLocalProxy__networkDefaultsDidChange___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __65__GEOResourceManifestServerLocalProxy__networkDefaultsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateManifestIfNecessary:", 0);
}

- (void)_terminationRequested:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Process termination requested. Canceling in-progress manifest update (if one exists)", v5, 2u);
  }

  -[GEOResourceManifestServerLocalProxy cancelCurrentManifestUpdate](self, "cancelCurrentManifestUpdate");
}

- (void)_reachabilityChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  GEOResourceManifestServerLocalProxy *v9;

  v4 = a3;
  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__GEOResourceManifestServerLocalProxy__reachabilityChanged___block_invoke;
  v7[3] = &unk_1E1C00738;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__GEOResourceManifestServerLocalProxy__reachabilityChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("GEONetworkObserverReachable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Reachability changed to become reachable", v7, 2u);
    }

    v6 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v6 + 48))
    {
      *(_QWORD *)(v6 + 104) = 0;
      objc_msgSend(*(id *)(a1 + 40), "forceUpdate:completionHandler:", 0, 0);
      v6 = *(_QWORD *)(a1 + 40);
    }
    if (*(_BYTE *)(v6 + 64))
    {
      *(_QWORD *)(v6 + 120) = 0;
      objc_msgSend(*(id *)(a1 + 40), "_considerChangingActiveTileGroup");
    }
  }
}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Device unlocked, attempting tile group change", buf, 2u);
  }

  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__GEOResourceManifestServerLocalProxy_protectedDataDidBecomeAvailable___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __71__GEOResourceManifestServerLocalProxy_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_considerChangingActiveTileGroup");
}

- (void)_manifestURLDidChange:(id)a3
{
  -[GEOResourceManifestServerLocalProxy forceUpdate:completionHandler:](self, "forceUpdate:completionHandler:", 1, 0);
}

- (BOOL)_updateManifestIfNecessary:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  const __CFString *v20;
  BOOL v21;
  int v23;
  void *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  self->_wantsManifestUpdateOnReachabilityChange = 0;
  -[GEOResourceManifestServerLocalProxy _manifestURL](self, "_manifestURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  v12 = objc_msgSend(v5, "isEqual:", v11);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  v15 = v14;

  -[GEOResourceManifestDownload metadata](self->_resourceManifest, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timestamp");
  v18 = v15 - v17;

  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = CFSTR("Manifest URL has changed");
    v23 = 138478339;
    v24 = v5;
    if (v12)
      v20 = CFSTR("Manifest URL has not changed");
    v25 = 2113;
    v26 = v20;
    v27 = 2048;
    v28 = v18;
    _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "Considering updating manifest from URL: %{private}@. %{private}@. Time since last update: %f.", (uint8_t *)&v23, 0x20u);
  }

  if ((v12 & 1) != 0)
  {
    if (v18 >= (double)GEOConfigGetInteger(GeoServicesConfig_ResourceManifestUpdateTimeInterval, (uint64_t)off_1EDF4CC98))
    {
      -[GEOResourceManifestServerLocalProxy forceUpdate:completionHandler:](self, "forceUpdate:completionHandler:", 0, v4);
      v21 = 1;
    }
    else
    {
      if (v4)
        v4[2](v4, 0);
      v21 = 0;
    }
  }
  else
  {
    v21 = 1;
    -[GEOResourceManifestServerLocalProxy forceUpdate:completionHandler:](self, "forceUpdate:completionHandler:", 1, v4);
  }

  return v21;
}

- (void)updateIfNecessary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__GEOResourceManifestServerLocalProxy_updateIfNecessary___block_invoke;
  v7[3] = &unk_1E1BFFBF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__GEOResourceManifestServerLocalProxy_updateIfNecessary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateManifestIfNecessary:", *(_QWORD *)(a1 + 40));
}

- (void)cancelCurrentManifestUpdate
{
  NSObject *v3;
  _QWORD block[5];

  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GEOResourceManifestServerLocalProxy_cancelCurrentManifestUpdate__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __66__GEOResourceManifestServerLocalProxy_cancelCurrentManifestUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "totalUnitCount") < 1)
    v2 = 1;
  else
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "totalUnitCount");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setTotalUnitCount:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "totalUnitCount"));
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 216);
  *(_QWORD *)(v4 + 216) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setCompletedUnitCount:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "_geo_mirroredProgressReplaceObservedProgressWith:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(*(id *)(a1 + 32), "_cancelManifestUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "_cancelMigrationTasks");
}

- (id)updateProgress
{
  return self->_updateProgress;
}

- (void)getResourceManifestWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__GEOResourceManifestServerLocalProxy_getResourceManifestWithHandler___block_invoke;
  v7[3] = &unk_1E1BFF970;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __70__GEOResourceManifestServerLocalProxy_getResourceManifestWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 80))
    {
      v3 = 0;
    }
    else
    {
      if (*(_QWORD *)(v2 + 16))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -20);
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = *(id *)(v2 + 152);
      }
      v3 = v4;
    }
    v5 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)deactivateResourceScale:(int)a3
{
  -[GEOResourceFiltersManager deactivateScale:](self->_filtersManager, "deactivateScale:", *(_QWORD *)&a3);
}

- (void)activateResourceScenario:(int)a3
{
  -[GEOResourceFiltersManager activateScenario:](self->_filtersManager, "activateScenario:", *(_QWORD *)&a3);
}

- (void)deactivateResourceScenario:(int)a3
{
  -[GEOResourceFiltersManager deactivateScenario:](self->_filtersManager, "deactivateScenario:", *(_QWORD *)&a3);
}

- (void)activateResourceName:(id)a3
{
  -[GEOResourceFiltersManager activateName:](self->_filtersManager, "activateName:", a3);
}

- (void)deactivateResourceName:(id)a3
{
  -[GEOResourceFiltersManager deactivateName:](self->_filtersManager, "deactivateName:", a3);
}

- (unsigned)maximumZoomLevelForStyle:(int)a3 scale:(int)a4 outSize:(int *)a5
{
  NSObject *workQueue;
  _QWORD v11[7];
  int v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__GEOResourceManifestServerLocalProxy_maximumZoomLevelForStyle_scale_outSize___block_invoke;
  v11[3] = &unk_1E1C0AEA8;
  v12 = a3;
  v13 = a4;
  v11[4] = self;
  v11[5] = &v14;
  v11[6] = a5;
  dispatch_sync(workQueue, v11);
  LODWORD(a5) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return a5;
}

void __78__GEOResourceManifestServerLocalProxy_maximumZoomLevelForStyle_scale_outSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  int v6;
  int *v7;
  void *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "activeTileSetForTileType:scale:", *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v8 = v2;
    v4 = objc_msgSend(v2, "maximumZoomLevelInRect:", 0.0, 0.0, 268435456.0, 268435456.0);
    v3 = v8;
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
    if (v5)
    {
      v6 = objc_msgSend(v8, "size");
      v3 = v8;
      v7 = *(int **)(a1 + 48);
LABEL_5:
      *v7 = v6;
    }
  }
  else
  {
    v7 = *(int **)(a1 + 48);
    v6 = -1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
    if (v7)
      goto LABEL_5;
  }

}

void __76__GEOResourceManifestServerLocalProxy__scheduleUpdateTimerWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTimerFired");

}

- (void)_updateTimerFired
{
  NSObject *manifestUpdateTimer;
  OS_dispatch_source *v4;

  manifestUpdateTimer = self->_manifestUpdateTimer;
  if (manifestUpdateTimer)
  {
    dispatch_source_cancel(manifestUpdateTimer);
    v4 = self->_manifestUpdateTimer;
    self->_manifestUpdateTimer = 0;

  }
  -[GEOResourceManifestServerLocalProxy forceUpdate:completionHandler:](self, "forceUpdate:completionHandler:", 0, 0);
}

- (void)setManifestToken:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  GEOResourceManifestServerLocalProxy *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__GEOResourceManifestServerLocalProxy_setManifestToken_completionHandler___block_invoke;
  block[3] = &unk_1E1BFFC90;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __74__GEOResourceManifestServerLocalProxy_setManifestToken_completionHandler___block_invoke(uint64_t a1)
{
  _setValue(GeoServicesConfig_ResourceManifestRequestToken, (uint64_t)off_1EDF4D558, *(void **)(a1 + 32), 1, 0);
  CFAbsoluteTimeGetCurrent();
  GEOConfigSetDouble(GeoServicesConfig_ResourceManifestRequestTokenTimestamp, (uint64_t)off_1EDF4D568);
  return objc_msgSend(*(id *)(a1 + 40), "forceUpdate:completionHandler:", 1, *(_QWORD *)(a1 + 48));
}

- (void)_handleManifestUpdateError:(id)a3
{
  __CFString *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t manifestRetryCount;
  double Integer;
  GEOResourceManifestServerLocalProxy *v18;
  double v19;
  NSObject *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v24 = 138543362;
    v25 = v5;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "Error loading resource manifest: %{public}@", (uint8_t *)&v24, 0xCu);
  }

  objc_storeStrong((id *)&self->_lastResourceManifestLoadError, a3);
  -[GEOResourceManifestServerLocalProxy _notifyManifestUpdateCompletionHandlers:](self, "_notifyManifestUpdateCompletionHandlers:", v5);
  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isNetworkReachable");

  if ((v8 & 1) != 0)
  {
    -[__CFString domain](v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v10) && -[__CFString code](v5, "code") == -11)
    {

      goto LABEL_12;
    }
    -[__CFString domain](v5, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)*MEMORY[0x1E0CB32E8];
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0)
    {
      v14 = -[__CFString code](v5, "code");

      if (v14 != -1001)
      {
LABEL_12:
        GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "Network is supposedly reachable, but manifest loading encountered network-related issues. Will manifest update when reachability changes", (uint8_t *)&v24, 2u);
        }
        goto LABEL_19;
      }
    }
    else
    {

    }
    ++self->_manifestRetryCount;
    self->_lastManifestRetryTimestamp = CFAbsoluteTimeGetCurrent();
    manifestRetryCount = self->_manifestRetryCount;
    if (manifestRetryCount <= GEOConfigGetUInteger(GeoServicesConfig_MaxManifestUpdateRetries, (uint64_t)off_1EDF4D278))
    {
      v19 = GEOConfigGetDouble(GeoServicesConfig_ManifestUpdateRetryBaseInterval, (uint64_t)off_1EDF4D288)
          * (double)(1 << LODWORD(self->_manifestRetryCount));
      GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        -[__CFString domain](v5, "domain");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", v13) && -[__CFString code](v5, "code") == -1001)
        {
          v22 = 0;
          v23 = CFSTR("Timed out");
        }
        else
        {
          -[__CFString domain](v5, "domain");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          GEOErrorDomain();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = CFSTR("Encountered non-network-related error");
          if (objc_msgSend(v13, "isEqualToString:", v12) && -[__CFString code](v5, "code") == -19)
            v23 = CFSTR("Timed out");
          v22 = 1;
        }
        v24 = 138478083;
        v25 = v23;
        v26 = 2048;
        v27 = v19;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_INFO, "%{private}@. Retrying manifest update in %f seconds.", (uint8_t *)&v24, 0x16u);
        if (v22)
        {

        }
      }

      v18 = self;
      Integer = v19;
      goto LABEL_32;
    }
    GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Retried manifest update too many times. Giving up. Will retry when reachability changes.", (uint8_t *)&v24, 2u);
    }
LABEL_19:

    self->_wantsManifestUpdateOnReachabilityChange = 1;
    Integer = (double)GEOConfigGetInteger(GeoServicesConfig_ResourceManifestUpdateTimeInterval, (uint64_t)off_1EDF4CC98);
    v18 = self;
LABEL_32:
    -[GEOResourceManifestServerLocalProxy _scheduleUpdateTimerWithTimeInterval:](v18, "_scheduleUpdateTimerWithTimeInterval:", Integer);
    goto LABEL_33;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "Network is not reachable. Will retry manifest update when reachability changes.", (uint8_t *)&v24, 2u);
  }

  self->_wantsManifestUpdateOnReachabilityChange = 1;
LABEL_33:

}

- (void)filtersManagerDidChangeActiveFilters:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[GEOResourceManifestServerLocalProxy serverQueue](self, "serverQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__GEOResourceManifestServerLocalProxy_filtersManagerDidChangeActiveFilters___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __76__GEOResourceManifestServerLocalProxy_filtersManagerDidChangeActiveFilters___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_considerChangingActiveTileGroup");
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  void *v4;
  void *v5;
  GEOTileGroupActivationSession *tileGroupActivationSession;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GEOActiveTileGroup hasUniqueIdentifier](self->_activeTileGroup, "hasUniqueIdentifier"))
  {
    -[GEOActiveTileGroup uniqueIdentifier](self->_activeTileGroup, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("TileGroup"));

  }
  tileGroupActivationSession = self->_tileGroupActivationSession;
  if (tileGroupActivationSession)
  {
    -[GEOTileGroupActivationSession uniqueIdentifier](tileGroupActivationSession, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("MigrationTileGroup"));

  }
  return v4;
}

- (void)_addOpportunisticManifestUpdateCompletionHandler:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *opportunisticManifestUpdateCompletionHandlers;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    if (!self->_opportunisticManifestUpdateCompletionHandlers)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      opportunisticManifestUpdateCompletionHandlers = self->_opportunisticManifestUpdateCompletionHandlers;
      self->_opportunisticManifestUpdateCompletionHandlers = v5;

    }
    v7 = (void *)objc_msgSend(v10, "copy");
    v8 = self->_opportunisticManifestUpdateCompletionHandlers;
    v9 = (void *)MEMORY[0x18D765024]();
    -[NSMutableArray addObject:](v8, "addObject:", v9);

    v4 = v10;
  }

}

- (void)activationSession:(id)a3 didChangeActiveTileGroup:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void (**v12)(_QWORD, _QWORD);
  GEOActiveTileGroup *v13;
  GEOActiveTileGroup *activeTileGroup;
  BOOL v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  _BOOL8 v20;
  NSObject *v21;
  void *v22;
  GEOTileEditionUpdate *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id WeakRetained;
  GEOActiveTileGroup *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  GEOResourceManifestServerLocalProxy *v35;
  void (**v36)(_QWORD, _QWORD);
  id v37;
  _QWORD v38[5];
  id v39;
  BOOL v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (self->_tileGroupActivationSession == a3)
  {
    v11 = !self->_tileGroupActivationSessionHasFinishedFirstTileGroupChange;
    self->_tileGroupActivationSessionHasFinishedFirstTileGroupChange = 1;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke;
    v38[3] = &unk_1E1C0AED0;
    v40 = v11;
    v38[4] = self;
    v39 = v9;
    v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v38);
    v13 = self->_activeTileGroup;
    -[GEOResourceManifestServerLocalProxy setActiveTileGroup:](self, "setActiveTileGroup:", v8);
    activeTileGroup = self->_activeTileGroup;
    v37 = 0;
    v15 = -[GEOResourceManifestServerLocalProxy _writeActiveTileGroupToDisk:error:](self, "_writeActiveTileGroupToDisk:error:", activeTileGroup, &v37);
    v16 = v37;
    if (v15)
    {
      if (-[GEOActiveTileGroup hasDataSet](v13, "hasDataSet") || objc_msgSend(v8, "hasDataSet"))
      {
        -[GEOActiveTileGroup dataSet](v13, "dataSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "identifier");
        objc_msgSend(v8, "dataSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v18 != objc_msgSend(v19, "identifier");

      }
      else
      {
        v20 = 0;
      }
      v23 = -[GEOTileEditionUpdate initWithActiveTileGroup:oldActiveTileGroup:dataSetDiffers:flushEverything:]([GEOTileEditionUpdate alloc], "initWithActiveTileGroup:oldActiveTileGroup:dataSetDiffers:flushEverything:", v8, v13, v20, self->_tileGroupActivationShouldFlushTileCache);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v23, CFSTR("GEOTileEditionUpdateKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("GEOTileEditionUpdateNotification"), 0, v25);

      GEOGetResourceManifestLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        -[GEOActiveTileGroup uniqueIdentifier](self->_activeTileGroup, "uniqueIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v42 = v27;
        _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_INFO, "Successfully changed active tile group (%{private}@). Informing clients.", buf, 0xCu);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v29 = self->_activeTileGroup;
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke_93;
      v34 = &unk_1E1BFFBF0;
      v35 = self;
      v36 = v12;
      objc_msgSend(WeakRetained, "serverProxy:didChangeActiveTileGroup:finishedCallback:", self, v29, &v31);

      if (-[GEOActiveTileGroup staleResourcesCount](self->_activeTileGroup, "staleResourcesCount", v31, v32, v33, v34, v35))
      {
        v30 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v30, "serverProxyNeedsWiFiResourceActivity:", self);

      }
    }
    else
    {
      GEOGetResourceManifestLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[GEOActiveTileGroup uniqueIdentifier](self->_activeTileGroup, "uniqueIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v22;
        v43 = 2114;
        v44 = v16;
        _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "Failed to write new active tile group (%{public}@) to disk: %{public}@", buf, 0x16u);

      }
      -[GEOResourceManifestServerLocalProxy setActiveTileGroup:](self, "setActiveTileGroup:", v13);
      ((void (**)(_QWORD, id))v12)[2](v12, v16);
    }

  }
}

void __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyImmediateManifestUpdateCompletionHandlers:", v3);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

void __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke_93(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[16];

  GEOGetResourceManifestLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Finished informing clients of tile group change", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke_94;
  block[3] = &unk_1E1C01F48;
  v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);

}

uint64_t __100__GEOResourceManifestServerLocalProxy_activationSession_didChangeActiveTileGroup_completionHandler___block_invoke_94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)activationSession:(id)a3 didCompleteWithErrors:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  char v21;
  uint64_t v22;
  GEOTileGroupActivationSession *tileGroupActivationSession;
  void *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t tileGroupRetryCount;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  double v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id obj;
  GEOResourceManifestServerLocalProxy *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  double v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (self->_tileGroupActivationSession == a3)
  {
    v47 = self;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v53;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v12);
        objc_msgSend(v13, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        GEOErrorDomain();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15) && objc_msgSend(v13, "code") == -2;

        objc_msgSend(v13, "domain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        GEOErrorDomain();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqualToString:", v18) && objc_msgSend(v13, "code") == -26;

        if (v16 || v19)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_16;
        }
      }

      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, CFSTR("Canceled"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 1;
        goto LABEL_23;
      }
      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -26, CFSTR("Device never unlocked"));
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
    }
    else
    {
LABEL_16:

    }
    objc_msgSend(v8, "firstObject");
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v20 = (void *)v22;
    v21 = 0;
LABEL_23:
    tileGroupActivationSession = v47->_tileGroupActivationSession;
    v47->_tileGroupActivationSession = 0;

    -[GEOResourceManifestServerLocalProxy _notifyManifestUpdateCompletionHandlers:](v47, "_notifyManifestUpdateCompletionHandlers:", v20);
    if ((v21 & 1) == 0 && objc_msgSend(v8, "count"))
    {
      +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isNetworkReachable");

      if ((v25 & 1) != 0)
      {
        v44 = v20;
        v45 = v7;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        obj = v8;
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v49;
          v29 = *MEMORY[0x1E0CB32E8];
          while (2)
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v49 != v28)
                objc_enumerationMutation(obj);
              v31 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v31, "domain", v44, v45);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              GEOErrorDomain();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v32, "isEqualToString:", v33) && objc_msgSend(v31, "code") == -11)
                goto LABEL_49;
              objc_msgSend(v31, "domain");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v34, "isEqualToString:", v29) && objc_msgSend(v31, "code") != -1001)
              {

LABEL_49:
LABEL_50:

                GEOGetResourceManifestLog();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1885A9000, v41, OS_LOG_TYPE_INFO, "Network is supposedly reachable, but migration encountered network-related issues. Will retry tile group change when reachability changes", buf, 2u);
                }

                v47->_wantsTileGroupUpdateOnReachabilityChange = 1;
                v20 = v44;
                v7 = v45;
                goto LABEL_56;
              }
              objc_msgSend(v31, "domain");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              GEOErrorDomain();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v35, "isEqualToString:", v36))
              {
                v37 = objc_msgSend(v31, "code");

                if (v37 == -19)
                  goto LABEL_50;
              }
              else
              {

              }
            }
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
            if (v27)
              continue;
            break;
          }
        }

        ++v47->_tileGroupRetryCount;
        v47->_lastTileGroupRetryTimestamp = CFAbsoluteTimeGetCurrent();
        tileGroupRetryCount = v47->_tileGroupRetryCount;
        if (tileGroupRetryCount <= GEOConfigGetUInteger(GeoServicesConfig_MaxTileGroupChangeRetries, (uint64_t)off_1EDF4D2B8))
        {
          v42 = GEOConfigGetDouble(GeoServicesConfig_TileGroupChangeRetryBaseInterval, (uint64_t)off_1EDF4D298)
              * (double)(1 << LODWORD(v47->_tileGroupRetryCount));
          GEOGetResourceManifestLog();
          v43 = objc_claimAutoreleasedReturnValue();
          v20 = v44;
          v7 = v45;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v57 = v42;
            _os_log_impl(&dword_1885A9000, v43, OS_LOG_TYPE_INFO, "Encountered non-network-related error. Retrying tile group change in %f seconds.", buf, 0xCu);
          }

          -[GEOResourceManifestServerLocalProxy _scheduleTileGroupUpdateTimerWithTimeInterval:](v47, "_scheduleTileGroupUpdateTimerWithTimeInterval:", v42);
        }
        else
        {
          GEOGetResourceManifestLog();
          v39 = objc_claimAutoreleasedReturnValue();
          v20 = v44;
          v7 = v45;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v39, OS_LOG_TYPE_ERROR, "Retried tile group change too many times. Giving up. Will retry when reachability changes.", buf, 2u);
          }

          v47->_wantsTileGroupUpdateOnReachabilityChange = 1;
        }
      }
      else
      {
        GEOGetResourceManifestLog();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_INFO, "Network is not reachable. Will retry tile group change when reachability changes.", buf, 2u);
        }

        v47->_wantsTileGroupUpdateOnReachabilityChange = 1;
      }
    }
LABEL_56:

  }
}

- (GEOResourceManifestServerProxyDelegate)delegate
{
  return (GEOResourceManifestServerProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTileGroupIsolater, 0);
  objc_storeStrong((id *)&self->_tileGroupActivationSession, 0);
  objc_storeStrong((id *)&self->_currentUpdateProgress, 0);
  objc_storeStrong((id *)&self->_updateProgress, 0);
  objc_storeStrong((id *)&self->_tileGroupMigrators, 0);
  objc_storeStrong((id *)&self->_filtersManager, 0);
  objc_storeStrong((id *)&self->_opportunisticManifestUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_manifestUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_lastResourceManifestLoadError, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_activeTileGroup, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_tileGroupUpdateTimer, 0);
  objc_storeStrong((id *)&self->_manifestUpdateTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_workOperationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_manifestDownloadTask, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
