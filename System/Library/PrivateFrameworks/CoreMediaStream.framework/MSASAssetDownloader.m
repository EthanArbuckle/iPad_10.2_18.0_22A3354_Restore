@implementation MSASAssetDownloader

- (id)_pathForPersonID:(id)a3
{
  return MSPathAlbumSharingSubscribeMMCSLibraryForPersonID(a3);
}

- (void)workQueueRetryOutstandingActivities
{
  unsigned int state;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  MSASAssetDownloader *v9;
  __int16 v10;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state > 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138543618;
      v9 = self;
      v10 = 1024;
      v11 = state;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unknown state: %d", (uint8_t *)&v8, 0x12u);
    }
    MSPlatform();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didDetectUnrecoverableCondition");

  }
  else
  {
    MSASPlatform();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetTransferer personID](self, "personID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "MSASPersonIDIsAllowedToDownloadAssets:", v5);

    if (v6)
    {
      -[MSASAssetDownloader workQueueDownloadNextBatch](self, "workQueueDownloadNextBatch");
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Not allowed to download assets at this time.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)workQueueObjectGUID
{
  NSString *objectGUID;
  NSString *v4;
  NSString *v5;

  objectGUID = self->_objectGUID;
  if (!objectGUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_objectGUID;
    self->_objectGUID = v4;

    objectGUID = self->_objectGUID;
  }
  return objectGUID;
}

- (void)workQueueStop
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  MSASAssetDownloader *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_state == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping all downloads.", (uint8_t *)&v10, 0xCu);
    }
    -[MSASAssetTransferer engine](self, "engine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAllOperations");

    -[MSASAssetDownloader _workQueueGoIdle](self, "_workQueueGoIdle");
    MSPlatform();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      MSPlatform();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isPerformanceLoggingEnabled");

      if (!v6)
        return;
      -[MSASAssetDownloader setIsWaitingForFirstDownloadEvent:](self, "setIsWaitingForFirstDownloadEvent:", 0);
      +[MSPerformanceLogger sharedLogger](MSPerformanceLogger, "sharedLogger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASAssetDownloader workQueueObjectGUID](self, "workQueueObjectGUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopOperation:itemGUID:", CFSTR("MSASAssetDownloader.downloadLatency"), v8);

      +[MSPerformanceLogger sharedLogger](MSPerformanceLogger, "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASAssetDownloader downloadBatchPerfGUID](self, "downloadBatchPerfGUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopOperation:itemGUID:", CFSTR("MSASAssetDownloader.downloadRate"), v9);

    }
  }
}

- (void)workQueueShutDownCompletionBlock:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[MSASAssetDownloader workQueueStop](self, "workQueueStop");
  v5.receiver = self;
  v5.super_class = (Class)MSASAssetDownloader;
  -[MSASAssetTransferer workQueueShutDownCompletionBlock:](&v5, sel_workQueueShutDownCompletionBlock_, v4);

}

- (void)workQueueCancel
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *context;
  _QWORD block[5];
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  MSASAssetDownloader *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (self->_state == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling all downloads.", buf, 0xCu);
    }
    -[MSASAssetTransferer engine](self, "engine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAllOperations");

    MSPlatform();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      MSPlatform();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isPerformanceLoggingEnabled");

      if (!v6)
        goto LABEL_8;
      -[MSASAssetDownloader setIsWaitingForFirstDownloadEvent:](self, "setIsWaitingForFirstDownloadEvent:", 0);
      +[MSPerformanceLogger sharedLogger](MSPerformanceLogger, "sharedLogger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASAssetDownloader workQueueObjectGUID](self, "workQueueObjectGUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "discardOperation:itemGUID:", CFSTR("MSASAssetDownloader.downloadLatency"), v8);

      +[MSPerformanceLogger sharedLogger](MSPerformanceLogger, "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASAssetDownloader downloadBatchPerfGUID](self, "downloadBatchPerfGUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "discardOperation:itemGUID:", CFSTR("MSASAssetDownloader.downloadRate"), v9);

    }
  }
LABEL_8:
  -[MSASAssetTransferer model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:maxCount:", 0, 0, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  while (objc_msgSend(v11, "count"))
  {
    context = (void *)MEMORY[0x1D8255C20]();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v18, "object");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSASAssetTransferer eventQueue](self, "eventQueue");
          v20 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __38__MSASAssetDownloader_workQueueCancel__block_invoke;
          block[3] = &unk_1E95BCE30;
          block[4] = self;
          v26 = v19;
          v27 = v18;
          v21 = v19;
          dispatch_async(v20, block);

          objc_msgSend(v12, "addObject:", v21);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }

    -[MSASAssetTransferer model](self, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeAssetsFromDownloadQueue:", v12);

    -[MSASAssetTransferer model](self, "model");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:maxCount:", 0, 0, 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(context);
  }

}

- (void)_workQueueGoIdle
{
  NSObject *v3;
  NSMutableArray *itemsInFlight;
  NSMutableDictionary *assetToItemInFlightMap;
  NSMutableArray *finishedAssets;
  _QWORD block[5];
  uint8_t buf[4];
  MSASAssetDownloader *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Work queue go idle.", buf, 0xCu);
  }
  -[MSASAssetTransferer eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MSASAssetDownloader__workQueueGoIdle__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

  if (-[MSASAssetDownloader state](self, "state") && !-[NSMutableArray count](self->_itemsInFlight, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v9 = self;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Setting idle state.", buf, 0xCu);
    }
    itemsInFlight = self->_itemsInFlight;
    self->_itemsInFlight = 0;

    assetToItemInFlightMap = self->_assetToItemInFlightMap;
    self->_assetToItemInFlightMap = 0;

    finishedAssets = self->_finishedAssets;
    self->_finishedAssets = 0;

    self->_state = 0;
    -[MSASAssetTransferer _sendDidIdleNotification](self, "_sendDidIdleNotification");
  }
}

- (void)workQueueDownloadNextBatch
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *itemsInFlight;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  NSMutableArray *v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *assetToItemInFlightMap;
  NSMutableArray *v34;
  NSMutableArray *finishedAssets;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t j;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  id v89;
  id v90;
  NSObject *v91;
  id v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t m;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  id v122;
  NSObject *v123;
  id v124;
  void *v125;
  void *v126;
  int v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  char v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  uint64_t v143;
  uint64_t n;
  NSObject *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  NSObject *v151;
  void *v152;
  void *v153;
  void *v154;
  NSObject *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  id obj;
  id v160;
  void *v161;
  id v162;
  void *v163;
  _QWORD v164[5];
  _QWORD v165[5];
  _QWORD v166[5];
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _QWORD v171[5];
  id v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _QWORD v177[5];
  _QWORD v178[6];
  id v179;
  id v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _QWORD v185[6];
  id v186;
  id v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  _QWORD v192[6];
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _QWORD block[5];
  _BYTE v202[128];
  _BYTE v203[128];
  uint8_t v204[128];
  uint8_t buf[4];
  MSASAssetDownloader *v206;
  __int16 v207;
  uint64_t v208;
  __int16 v209;
  void *v210;
  __int16 v211;
  void *v212;
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  uint64_t v216;

  v216 = *MEMORY[0x1E0C80C00];
  if (-[MSASAssetTransferer hasShutDown](self, "hasShutDown"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v206 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Not downloading any more assets because we're shutting down.", buf, 0xCu);
    }
    return;
  }
  -[MSASAssetDownloader setDidEncounterNetworkConditionError:](self, "setDidEncounterNetworkConditionError:", 0);
  -[MSASAssetDownloader setCurrentFocusAssetCollectionGUID:](self, "setCurrentFocusAssetCollectionGUID:", 0);
  -[MSASAssetDownloader setCurrentFocusAlbumGUID:](self, "setCurrentFocusAlbumGUID:", 0);
  -[MSASAssetDownloader setIsDownloadingThumbnails:](self, "setIsDownloadingThumbnails:", 0);
  -[MSASAssetTransferer eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

  -[MSASAssetTransferer focusAssetCollectionGUID](self, "focusAssetCollectionGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSASAssetTransferer model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetTransferer focusAssetCollectionGUID](self, "focusAssetCollectionGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", 0, v6, 1, 100, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      v9 = v7;
LABEL_9:
      -[MSASAssetDownloader setIsDownloadingThumbnails:](self, "setIsDownloadingThumbnails:", v8 != 0);
      -[MSASAssetTransferer focusAssetCollectionGUID](self, "focusAssetCollectionGUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASAssetDownloader setCurrentFocusAssetCollectionGUID:](self, "setCurrentFocusAssetCollectionGUID:", v12);

      goto LABEL_10;
    }
    -[MSASAssetTransferer model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetTransferer focusAssetCollectionGUID](self, "focusAssetCollectionGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", 0, v11, 0, 100, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
      goto LABEL_9;
  }
  else
  {
    v9 = 0;
  }
LABEL_10:
  if (!objc_msgSend(v9, "count"))
  {
    -[MSASAssetTransferer focusAlbumGUID](self, "focusAlbumGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[MSASAssetTransferer model](self, "model");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASAssetTransferer focusAlbumGUID](self, "focusAlbumGUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", v15, 0, 1, 100, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "count");
      if (v17)
      {
        v9 = v16;
      }
      else
      {
        -[MSASAssetTransferer model](self, "model");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSASAssetTransferer focusAlbumGUID](self, "focusAlbumGUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", v19, 0, 0, 100, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v9, "count"))
          goto LABEL_16;
      }
      -[MSASAssetDownloader setIsDownloadingThumbnails:](self, "setIsDownloadingThumbnails:", v17 != 0);
      -[MSASAssetTransferer focusAlbumGUID](self, "focusAlbumGUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASAssetDownloader setCurrentFocusAlbumGUID:](self, "setCurrentFocusAlbumGUID:", v20);

    }
  }
LABEL_16:
  if (objc_msgSend(v9, "count"))
    goto LABEL_21;
  -[MSASAssetTransferer model](self, "model");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", 0, 0, 1, 100, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "count");
  if (v23)
  {
    v9 = v22;
  }
  else
  {
    -[MSASAssetTransferer model](self, "model");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", 0, 0, 0, 100, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "count"))
      goto LABEL_21;
  }
  -[MSASAssetDownloader setIsDownloadingThumbnails:](self, "setIsDownloadingThumbnails:", v23 != 0);
LABEL_21:
  if (!objc_msgSend(v9, "count"))
  {
    itemsInFlight = self->_itemsInFlight;
    if (!itemsInFlight || !-[NSMutableArray count](itemsInFlight, "count"))
    {
      -[MSASAssetTransferer model](self, "model");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", 0, 0, 1, 100, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_msgSend(v27, "count");
      if (v28)
      {
        v9 = v27;
      }
      else
      {
        -[MSASAssetTransferer model](self, "model");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", 0, 0, 0, 100, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v9, "count"))
          goto LABEL_28;
      }
      -[MSASAssetDownloader setIsDownloadingThumbnails:](self, "setIsDownloadingThumbnails:", v28 != 0);
    }
LABEL_28:
    if (!objc_msgSend(v9, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v206 = self;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Nothing to download.", buf, 0xCu);
      }
      -[MSASAssetDownloader _workQueueGoIdle](self, "_workQueueGoIdle");
      goto LABEL_126;
    }
  }
  self->_state = 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_itemsInFlight)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v30 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v31 = self->_itemsInFlight;
    self->_itemsInFlight = v30;

  }
  if (!self->_assetToItemInFlightMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    v32 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    assetToItemInFlightMap = self->_assetToItemInFlightMap;
    self->_assetToItemInFlightMap = v32;

  }
  if (!self->_finishedAssets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    finishedAssets = self->_finishedAssets;
    self->_finishedAssets = v34;

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  v37 = v9;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v197, v215, 16);
  obj = v37;
  if (!v38)
  {
    v163 = 0;
    goto LABEL_51;
  }
  v39 = v38;
  v163 = 0;
  v40 = *(_QWORD *)v198;
  do
  {
    for (i = 0; i != v39; ++i)
    {
      if (*(_QWORD *)v198 != v40)
        objc_enumerationMutation(obj);
      v42 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * i);
      objc_msgSend(v42, "object");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "MMCSURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        v47 = (void *)MEMORY[0x1E0C99D80];
        -[MSASAssetTransferer _missingURLError](self, "_missingURLError");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "albumGUID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "dictionaryWithObjectsAndKeys:", v48, CFSTR("error"), v49, CFSTR("albumGUID"), 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v161, "setObject:forKey:", v50, v43);
        goto LABEL_47;
      }
      objc_msgSend(v43, "MMCSURL");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v163)
      {
        v163 = v45;
LABEL_46:
        objc_msgSend(v36, "addObject:", v42);
        goto LABEL_47;
      }
      v46 = objc_msgSend(v163, "isEqual:", v45);

      if (v46)
        goto LABEL_46;
LABEL_47:

    }
    v37 = obj;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v215, 16);
  }
  while (v39);
LABEL_51:

  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v160 = v36;
  v51 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v193, v214, 16);
  if (!v51)
    goto LABEL_65;
  v52 = v51;
  v53 = *(_QWORD *)v194;
  while (2)
  {
    v54 = 0;
    while (2)
    {
      if (*(_QWORD *)v194 != v53)
        objc_enumerationMutation(v160);
      v55 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * v54);
      objc_msgSend(v55, "object");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "MMCSAccessHeader");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        objc_msgSend(v56, "MMCSAccessHeaderTimeStamp");
        v58 = objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          v59 = (void *)v58;
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "MMCSAccessHeaderTimeStamp");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "timeIntervalSinceDate:", v61);
          v63 = v62;
          -[MSASAssetTransferer workQueueMaxMMCSTokenValidityTimeInterval](self, "workQueueMaxMMCSTokenValidityTimeInterval");
          v65 = v64;

          if (v63 > v65)
          {
            v66 = (void *)MEMORY[0x1E0C99D80];
            -[MSASAssetTransferer _MMCSTokenTooOldError](self, "_MMCSTokenTooOldError");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "albumGUID");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "dictionaryWithObjectsAndKeys:", v67, CFSTR("error"), v68, CFSTR("albumGUID"), 0);
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            v70 = v161;
            goto LABEL_62;
          }
        }
        objc_msgSend(v158, "addObject:", v55);
      }
      else
      {
        v71 = (void *)MEMORY[0x1E0C99D80];
        -[MSASAssetTransferer _missingMMCSTokenError](self, "_missingMMCSTokenError");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "albumGUID");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "dictionaryWithObjectsAndKeys:", v72, CFSTR("error"), v73, CFSTR("albumGUID"), 0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        v70 = v157;
LABEL_62:
        objc_msgSend(v70, "setObject:forKey:", v69, v56);

      }
      if (v52 != ++v54)
        continue;
      break;
    }
    v52 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v193, v214, 16);
    if (v52)
      continue;
    break;
  }
LABEL_65:

  v74 = objc_msgSend(v161, "count");
  v75 = objc_msgSend(v157, "count") + v74;
  v76 = MEMORY[0x1E0C809B0];
  if (v75)
  {
    -[MSASAssetTransferer eventQueue](self, "eventQueue");
    v77 = objc_claimAutoreleasedReturnValue();
    v192[0] = v76;
    v192[1] = 3221225472;
    v192[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_15;
    v192[3] = &unk_1E95BCF48;
    v192[4] = self;
    v192[5] = v75;
    dispatch_async(v77, v192);

    v190 = 0u;
    v191 = 0u;
    v188 = 0u;
    v189 = 0u;
    v162 = v161;
    v78 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v188, v213, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v189;
      v81 = MEMORY[0x1E0C81028];
      do
      {
        for (j = 0; j != v79; ++j)
        {
          if (*(_QWORD *)v189 != v80)
            objc_enumerationMutation(v162);
          v83 = *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * j);
          objc_msgSend(v162, "objectForKey:", v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKey:", CFSTR("error"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKey:", CFSTR("albumGUID"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v81;
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            v206 = self;
            v207 = 2114;
            v208 = v83;
            v209 = 2114;
            v210 = v86;
            v211 = 2114;
            v212 = v85;
            _os_log_error_impl(&dword_1D3E94000, v81, OS_LOG_TYPE_ERROR, "%{public}@: Rejecting asset %{public}@ from albumGUID %{public}@. Error: %{public}@", buf, 0x2Au);
          }

          -[MSASAssetTransferer eventQueue](self, "eventQueue");
          v88 = objc_claimAutoreleasedReturnValue();
          v185[0] = MEMORY[0x1E0C809B0];
          v185[1] = 3221225472;
          v185[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_16;
          v185[3] = &unk_1E95BCE58;
          v185[4] = self;
          v185[5] = v83;
          v89 = v86;
          v186 = v89;
          v90 = v85;
          v187 = v90;
          dispatch_async(v88, v185);

        }
        v79 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v188, v213, 16);
      }
      while (v79);
    }

    if (objc_msgSend(v157, "count"))
    {
      v91 = MEMORY[0x1E0C81028];
      v92 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        v93 = objc_msgSend(v157, "count");
        *(_DWORD *)buf = 138543618;
        v206 = self;
        v207 = 2048;
        v208 = v93;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Needing to get auth token for %lu assets", buf, 0x16u);
      }

      v183 = 0u;
      v184 = 0u;
      v181 = 0u;
      v182 = 0u;
      v94 = v157;
      v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v181, v204, 16);
      if (v95)
      {
        v96 = v95;
        v97 = *(_QWORD *)v182;
        do
        {
          for (k = 0; k != v96; ++k)
          {
            if (*(_QWORD *)v182 != v97)
              objc_enumerationMutation(v94);
            v99 = *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * k);
            objc_msgSend(v94, "objectForKey:", v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "objectForKey:", CFSTR("error"));
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "objectForKey:", CFSTR("albumGUID"));
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSASAssetTransferer eventQueue](self, "eventQueue");
            v103 = objc_claimAutoreleasedReturnValue();
            v178[0] = MEMORY[0x1E0C809B0];
            v178[1] = 3221225472;
            v178[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_17;
            v178[3] = &unk_1E95BCE58;
            v178[4] = self;
            v178[5] = v99;
            v104 = v102;
            v179 = v104;
            v105 = v101;
            v180 = v105;
            dispatch_async(v103, v178);

          }
          v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v181, v204, 16);
        }
        while (v96);
      }

    }
    -[MSASAssetTransferer model](self, "model");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "allKeys");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "removeAssetsFromDownloadQueue:", v107);

    -[MSASAssetTransferer model](self, "model");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "allKeys");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "removeAssetsFromDownloadQueue:", v109);

    -[MSASAssetTransferer eventQueue](self, "eventQueue");
    v110 = objc_claimAutoreleasedReturnValue();
    v76 = MEMORY[0x1E0C809B0];
    v177[0] = MEMORY[0x1E0C809B0];
    v177[1] = 3221225472;
    v177[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_2;
    v177[3] = &unk_1E95BCED0;
    v177[4] = self;
    dispatch_async(v110, v177);

  }
  v111 = v158;
  if (objc_msgSend(v158, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v158, "count"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v113 = v158;
    v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v173, v203, 16);
    if (v114)
    {
      v115 = v114;
      v116 = *(_QWORD *)v174;
      do
      {
        for (m = 0; m != v115; ++m)
        {
          if (*(_QWORD *)v174 != v116)
            objc_enumerationMutation(v113);
          v118 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * m);
          objc_msgSend(v118, "object");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "addObject:", v119);
          -[NSMutableArray addObject:](self->_itemsInFlight, "addObject:", v118);
          -[NSMutableDictionary setObject:forKey:](self->_assetToItemInFlightMap, "setObject:forKey:", v118, v119);
          -[MSASAssetTransferer engine](self, "engine");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "reregisterAssetForDownload:", v119);

        }
        v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v173, v203, 16);
      }
      while (v115);
    }

    v121 = MEMORY[0x1E0C81028];
    v122 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
    {
      v156 = objc_msgSend(v112, "count");
      *(_DWORD *)buf = 138543618;
      v206 = self;
      v207 = 2048;
      v208 = v156;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Downloading %ld assets.", buf, 0x16u);
    }

    -[MSASAssetTransferer eventQueue](self, "eventQueue");
    v123 = objc_claimAutoreleasedReturnValue();
    v171[0] = v76;
    v171[1] = 3221225472;
    v171[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_18;
    v171[3] = &unk_1E95BCFC0;
    v171[4] = self;
    v124 = v112;
    v172 = v124;
    dispatch_async(v123, v171);

    MSPlatform();
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      MSPlatform();
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = objc_msgSend(v126, "isPerformanceLoggingEnabled");

      if (v127)
      {
        -[MSASAssetDownloader setIsWaitingForFirstDownloadEvent:](self, "setIsWaitingForFirstDownloadEvent:", 1);
        +[MSPerformanceLogger sharedLogger](MSPerformanceLogger, "sharedLogger");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSASAssetDownloader workQueueObjectGUID](self, "workQueueObjectGUID");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "startOperation:itemGUID:", CFSTR("MSASAssetDownloader.downloadLatency"), v129);

        objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSASAssetDownloader setDownloadBatchPerfGUID:](self, "setDownloadBatchPerfGUID:", v130);

        +[MSPerformanceLogger sharedLogger](MSPerformanceLogger, "sharedLogger");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSASAssetDownloader downloadBatchPerfGUID](self, "downloadBatchPerfGUID");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "startOperation:itemGUID:", CFSTR("MSASAssetDownloader.downloadRate"), v131);

        goto LABEL_100;
      }
    }
    else
    {
LABEL_100:

    }
    MSASPlatform();
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_opt_respondsToSelector();

    if ((v133 & 1) != 0)
    {
      MSASPlatform();
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASAssetTransferer personID](self, "personID");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "MMCSDownloadSocketOptionsForPersonID:", v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();

      if (v136)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v136, *MEMORY[0x1E0D468F0]);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v137 = 0;
      }

    }
    else
    {
      v137 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v139 = v124;
    v140 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v167, v202, 16);
    if (v140)
    {
      v141 = v140;
      v142 = 0;
      v143 = *(_QWORD *)v168;
      do
      {
        for (n = 0; n != v141; ++n)
        {
          if (*(_QWORD *)v168 != v143)
            objc_enumerationMutation(v139);
          objc_msgSend(v138, "addObject:", *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * n));
          if (++v142 == -[MSASAssetTransferer maxBatchCount](self, "maxBatchCount"))
          {
            -[MSASAssetTransferer eventQueue](self, "eventQueue");
            v145 = objc_claimAutoreleasedReturnValue();
            v166[0] = MEMORY[0x1E0C809B0];
            v166[1] = 3221225472;
            v166[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_2_21;
            v166[3] = &unk_1E95BCED0;
            v166[4] = self;
            dispatch_async(v145, v166);

            -[MSASAssetTransferer engine](self, "engine");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = (void *)objc_msgSend(v138, "copy");
            -[MSASAssetTransferer personID](self, "personID");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "getAssets:requestURL:DSID:options:", v147, v163, v148, v137);

            objc_msgSend(v138, "removeAllObjects");
            v142 = 0;
          }
        }
        v141 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v167, v202, 16);
      }
      while (v141);
    }

    v149 = objc_msgSend(v138, "count");
    v150 = MEMORY[0x1E0C809B0];
    if (v149)
    {
      -[MSASAssetTransferer eventQueue](self, "eventQueue");
      v151 = objc_claimAutoreleasedReturnValue();
      v165[0] = v150;
      v165[1] = 3221225472;
      v165[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_3;
      v165[3] = &unk_1E95BCED0;
      v165[4] = self;
      dispatch_async(v151, v165);

      -[MSASAssetTransferer engine](self, "engine");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASAssetTransferer personID](self, "personID");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "getAssets:requestURL:DSID:options:", v138, v163, v153, v137);

    }
    -[MSASAssetTransferer model](self, "model");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "setInFlightAssets:", v139);

    -[MSASAssetTransferer eventQueue](self, "eventQueue");
    v155 = objc_claimAutoreleasedReturnValue();
    v164[0] = v150;
    v164[1] = 3221225472;
    v164[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_4;
    v164[3] = &unk_1E95BCED0;
    v164[4] = self;
    dispatch_async(v155, v164);

    v111 = v158;
    v9 = obj;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v206 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: No assets to download.", buf, 0xCu);
    }
    -[MSASAssetDownloader _workQueueGoIdle](self, "_workQueueGoIdle");
    v9 = obj;
  }

LABEL_126:
}

- (void)registerAssets:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MSASAssetDownloader_registerAssets_completionBlock___block_invoke;
  block[3] = &unk_1E95BC528;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)workQueueRegisterAssets:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11++), "setMMCSItemID:", -[MSASAssetTransferer workQueueNextItemID](self, "workQueueNextItemID"));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  -[MSASAssetTransferer engine](self, "engine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__MSASAssetDownloader_workQueueRegisterAssets_completionBlock___block_invoke;
  v14[3] = &unk_1E95BCF98;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v12, "registerAssets:forDownloadCompletionBlock:", v6, v14);

}

- (void)unregisterAssets:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MSASAssetDownloader_unregisterAssets___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)workQueueUnregisterAssets:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[MSASAssetTransferer engine](self, "engine");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unregisterAsset:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_workQueueStopTrackingItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](self->_itemsInFlight, "removeObject:", v4);

  -[NSMutableDictionary removeObjectForKey:](self->_assetToItemInFlightMap, "removeObjectForKey:", v5);
}

- (void)_workQueueDidFinishWithItem:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a4;
  v7 = a3;
  -[MSASAssetDownloader _workQueueStopTrackingItem:](self, "_workQueueStopTrackingItem:", v7);
  objc_msgSend(v7, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "albumGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASAssetTransferer model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAssetsFromDownloadQueue:", v11);

  -[MSASAssetTransferer eventQueue](self, "eventQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__MSASAssetDownloader__workQueueDidFinishWithItem_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v6;
  v13 = v6;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

}

- (void)MMCSEngine:(id)a3 didFinishPuttingAsset:(id)a4 error:(id)a5
{
  int v6;
  MSASAssetDownloader *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback: MMCSEngine:didFinishPuttingAsset:context:error:", (uint8_t *)&v6, 0xCu);
  }
}

- (void)MMCSEngine:(id)a3 didCreateRequestorContext:(id)a4 forAssets:(id)a5
{
  int v6;
  MSASAssetDownloader *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback: MMCSEngine:didCreateRequestorContext:context:error:", (uint8_t *)&v6, 0xCu);
  }
}

- (void)MMCSEngine:(id)a3 didMakePutProgress:(float)a4 state:(int)a5 onAsset:(id)a6
{
  int v7;
  MSASAssetDownloader *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback: MMCSEngine:didMakePutProgress:state:context:", (uint8_t *)&v7, 0xCu);
  }
}

- (void)didFinishPuttingAllAssets
{
  int v3;
  MSASAssetDownloader *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback: MMCSEngine:didFinishPuttingAllAssetsContext:", (uint8_t *)&v3, 0xCu);
  }
}

- (void)MMCSEngine:(id)a3 didFinishGettingAsset:(id)a4 path:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v16[4] = self;
  v17 = v9;
  v18 = v11;
  v19 = v10;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (id)_orphanedAssetError
{
  if (_orphanedAssetError_onceToken != -1)
    dispatch_once(&_orphanedAssetError_onceToken, &__block_literal_global_5420);
  return (id)_orphanedAssetError_error;
}

- (void)MMCSEngine:(id)a3 didMakeGetProgress:(float)a4 state:(int)a5 onAsset:(id)a6
{
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  int v14;
  float v15;

  v9 = a6;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MSASAssetDownloader_MMCSEngine_didMakeGetProgress_state_onAsset___block_invoke;
  block[3] = &unk_1E95BBFC0;
  v14 = a5;
  v15 = a4;
  block[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(v10, block);

}

- (void)didFinishGettingAllAssets
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASAssetTransferer workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSMutableArray)itemsInFlight
{
  return self->_itemsInFlight;
}

- (void)setItemsInFlight:(id)a3
{
  objc_storeStrong((id *)&self->_itemsInFlight, a3);
}

- (NSMutableDictionary)assetToItemInFlightMap
{
  return self->_assetToItemInFlightMap;
}

- (void)setAssetToItemInFlightMap:(id)a3
{
  objc_storeStrong((id *)&self->_assetToItemInFlightMap, a3);
}

- (NSMutableArray)finishedAssets
{
  return self->_finishedAssets;
}

- (void)setFinishedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_finishedAssets, a3);
}

- (BOOL)didEncounterNetworkConditionError
{
  return self->_didEncounterNetworkConditionError;
}

- (void)setDidEncounterNetworkConditionError:(BOOL)a3
{
  self->_didEncounterNetworkConditionError = a3;
}

- (BOOL)isDownloadingThumbnails
{
  return self->_isDownloadingThumbnails;
}

- (void)setIsDownloadingThumbnails:(BOOL)a3
{
  self->_isDownloadingThumbnails = a3;
}

- (NSString)currentFocusAlbumGUID
{
  return self->_currentFocusAlbumGUID;
}

- (void)setCurrentFocusAlbumGUID:(id)a3
{
  objc_storeStrong((id *)&self->_currentFocusAlbumGUID, a3);
}

- (NSString)currentFocusAssetCollectionGUID
{
  return self->_currentFocusAssetCollectionGUID;
}

- (void)setCurrentFocusAssetCollectionGUID:(id)a3
{
  objc_storeStrong((id *)&self->_currentFocusAssetCollectionGUID, a3);
}

- (BOOL)isWaitingForFirstDownloadEvent
{
  return self->_isWaitingForFirstDownloadEvent;
}

- (void)setIsWaitingForFirstDownloadEvent:(BOOL)a3
{
  self->_isWaitingForFirstDownloadEvent = a3;
}

- (NSString)objectGUID
{
  return self->_objectGUID;
}

- (void)setObjectGUID:(id)a3
{
  objc_storeStrong((id *)&self->_objectGUID, a3);
}

- (NSString)downloadBatchPerfGUID
{
  return self->_downloadBatchPerfGUID;
}

- (void)setDownloadBatchPerfGUID:(id)a3
{
  objc_storeStrong((id *)&self->_downloadBatchPerfGUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadBatchPerfGUID, 0);
  objc_storeStrong((id *)&self->_objectGUID, 0);
  objc_storeStrong((id *)&self->_currentFocusAssetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_currentFocusAlbumGUID, 0);
  objc_storeStrong((id *)&self->_finishedAssets, 0);
  objc_storeStrong((id *)&self->_assetToItemInFlightMap, 0);
  objc_storeStrong((id *)&self->_itemsInFlight, 0);
}

uint64_t __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  char **__ptr32 *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t result;
  _QWORD block[5];
  _QWORD v24[7];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v2 = *(_QWORD *)(a1 + 32);
      v3 = objc_msgSend(*(id *)(v2 + 136), "count");
      *(_DWORD *)buf = 138543618;
      v31 = v2;
      v32 = 2048;
      v33 = v3;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Finished downloading %ld assets.", buf, 0x16u);
    }
    MSPlatform();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();
    v6 = MEMORY[0x1E0C809B0];
    v7 = &off_1D3F4D000;
    if ((v5 & 1) != 0)
    {
      MSPlatform();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isPerformanceLoggingEnabled");

      if (v9)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "metadata");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", CFSTR("MSAssetMetadataFileSize"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v13 += objc_msgSend(v17, "longLongValue");

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v12);
        }
        else
        {
          v13 = 0;
        }

        v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "count");
        +[MSPerformanceLogger sharedLogger](MSPerformanceLogger, "sharedLogger");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "downloadBatchPerfGUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = MEMORY[0x1E0C809B0];
        v24[0] = MEMORY[0x1E0C809B0];
        v7 = &off_1D3F4D000;
        v24[1] = 3221225472;
        v24[2] = __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke_31;
        v24[3] = &unk_1E95BBFE8;
        v24[4] = *(_QWORD *)(a1 + 32);
        v24[5] = v18;
        v24[6] = v13;
        objc_msgSend(v19, "summarizeOperation:itemGUID:formatBlock:", CFSTR("MSASAssetDownloader.downloadRate"), v20, v24);

      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = *((_QWORD *)v7 + 508);
    block[2] = __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke_32;
    block[3] = &unk_1E95BCED0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v21, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_workQueueGoIdle");
  result = objc_msgSend(*(id *)(a1 + 32), "didEncounterNetworkConditionError");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
  return result;
}

void __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke_31(_QWORD *a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = a1[4];
    v5 = a1[5];
    v6 = a1[6];
    v7 = 138544386;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2048;
    v14 = a2;
    v15 = 2048;
    v16 = (double)v6 * 8.0 / a2 / 1000.0;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Finished downloading batch of %lu files, for a total of %lld bytes, in %0.3f seconds. Effective download rate: %0.3f kbps.", (uint8_t *)&v7, 0x34u);
  }
}

void __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke_32(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAssetDownloaderDidFinishBatch:", *(_QWORD *)(a1 + 32));

}

void __67__MSASAssetDownloader_MMCSEngine_didMakeGetProgress_state_onAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  float v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  MSPlatform();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_6;
  MSPlatform();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPerformanceLoggingEnabled");

  if (v4 && *(_DWORD *)(a1 + 48) == 3 && objc_msgSend(*(id *)(a1 + 32), "isWaitingForFirstDownloadEvent"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsWaitingForFirstDownloadEvent:", 0);
    +[MSPerformanceLogger sharedLogger](MSPerformanceLogger, "sharedLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "workQueueObjectGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "summarizeOperation:itemGUID:formatBlock:", CFSTR("MSASAssetDownloader.downloadLatency"), v5, &__block_literal_global_29);

LABEL_6:
  }
  MSASPlatform();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldLogAtLevel:", 7);

  if (v7)
  {
    v8 = *(float *)(a1 + 52);
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v8 == -1.0)
    {
      if (v9)
      {
        v16 = *(_QWORD *)(a1 + 32);
        +[MMCSEngine logStringForGetItemState:](MMCSEngine, "logStringForGetItemState:", *(unsigned int *)(a1 + 48));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(a1 + 40);
        v18 = 138543874;
        v19 = v16;
        v20 = 2114;
        v21 = *(double *)&v11;
        v22 = 2048;
        v23 = v17;
        v13 = MEMORY[0x1E0C81028];
        v14 = "%{public}@: Download progress state: %{public}@, on asset: %p";
        v15 = 32;
        goto LABEL_14;
      }
    }
    else if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      +[MMCSEngine logStringForGetItemState:](MMCSEngine, "logStringForGetItemState:", *(unsigned int *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v18 = 138544130;
      v19 = v10;
      v20 = 2048;
      v21 = v8;
      v22 = 2114;
      v23 = v11;
      v24 = 2048;
      v25 = v12;
      v13 = MEMORY[0x1E0C81028];
      v14 = "%{public}@: Download progress: %.2f, state: %{public}@, on asset: %p";
      v15 = 42;
LABEL_14:
      _os_log_debug_impl(&dword_1D3E94000, v13, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v18, v15);

    }
  }
}

void __67__MSASAssetDownloader_MMCSEngine_didMakeGetProgress_state_onAsset___block_invoke_2(double a1)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v2 = 134217984;
    v3 = a1;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Download Latency: %0.3f seconds.", (uint8_t *)&v2, 0xCu);
  }
}

void __42__MSASAssetDownloader__orphanedAssetError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_ASSET_DOWNLOADER_ORPHANED"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASAssetDownloaderErrorDomain"), 0, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_orphanedAssetError_error;
  _orphanedAssetError_error = v1;

}

void __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD block[5];
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    if (v2)
    {
      objc_msgSend(v3, "MMCSRetryAfterDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "eventQueue");
        v5 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_2;
        block[3] = &unk_1E95BCFC0;
        block[4] = *(_QWORD *)(a1 + 32);
        v34 = v4;
        dispatch_async(v5, block);

      }
      if (objc_msgSend(*(id *)(a1 + 48), "MMCSIsCancelError"))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v6 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v36 = v6;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Asset download was canceled. Ignoring.", buf, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 32), "_workQueueStopTrackingItem:", v2);
        goto LABEL_32;
      }
      if (objc_msgSend(*(id *)(a1 + 48), "MMCSIsNetworkConditionsError"))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v36 = v14;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered temporary network error while downloading asset. Will retry later.", buf, 0xCu);
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v15 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "MSVerboseDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v15;
          v37 = 2114;
          v38 = v16;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Error: %{public}@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "_workQueueStopTrackingItem:", v2);
        objc_msgSend(*(id *)(a1 + 32), "setDidEncounterNetworkConditionError:", 1);
        goto LABEL_32;
      }
      if ((objc_msgSend(*(id *)(a1 + 48), "MMCSIsFatalError") & 1) != 0
        || (v19 = objc_msgSend(v2, "errorCount") + 1, v19 >= (int)objc_msgSend(*(id *)(a1 + 32), "maxRetryCount")))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v25 = *(_QWORD *)(a1 + 32);
          v26 = *(void **)(a1 + 40);
          v27 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          v36 = v25;
          v37 = 2114;
          v38 = v26;
          v39 = 2114;
          v40 = v27;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to download asset: %{public}@. Error: %{public}@. Giving up.", buf, 0x20u);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "model");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setErrorCount:forAssetInDownloadQueue:", objc_msgSend(v2, "errorCount") + 1, *(_QWORD *)(a1 + 40));

        if (!objc_msgSend(*(id *)(a1 + 48), "MMCSIsAuthorizationError"))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v28 = *(_QWORD *)(a1 + 32);
            v29 = *(void **)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 48), "MSVerboseDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v36 = v28;
            v37 = 2114;
            v38 = v29;
            v39 = 2114;
            v40 = v30;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to download asset: %{public}@. Error: %{public}@. Will retry later.", buf, 0x20u);

          }
          objc_msgSend(*(id *)(a1 + 32), "_workQueueStopTrackingItem:", v2);
          objc_msgSend(*(id *)(a1 + 32), "eventQueue");
          v24 = objc_claimAutoreleasedReturnValue();
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_23;
          v32[3] = &unk_1E95BCED0;
          v32[4] = *(_QWORD *)(a1 + 32);
          dispatch_async(v24, v32);

          goto LABEL_32;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 32);
          v22 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 48), "MSVerboseDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v36 = v21;
          v37 = 2114;
          v38 = v22;
          v39 = 2114;
          v40 = v23;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to download asset: %{public}@ due to MMCS auth error: %{public}@. Will reauthorize now.", buf, 0x20u);

        }
      }
      v9 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 48);
      v10 = v2;
LABEL_31:
      objc_msgSend(v9, "_workQueueDidFinishWithItem:error:", v10, v11);
LABEL_32:

      goto LABEL_33;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v36 = v12;
      v37 = 2114;
      v38 = v13;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Already reported on asset %{public}@. Ignoring.", buf, 0x16u);
    }
  }
  else
  {
    if (v2)
    {
      objc_msgSend(v2, "object");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPath:", *(_QWORD *)(a1 + 56));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v36 = v7;
        v37 = 2114;
        v38 = v4;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully downloaded asset %{public}@.", buf, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 32), "eventQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_24;
      v31[3] = &unk_1E95BCED0;
      v31[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v8, v31);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "addObject:", v4);
      v9 = *(void **)(a1 + 32);
      v10 = v2;
      v11 = 0;
      goto LABEL_31;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v36 = v17;
      v37 = 2114;
      v38 = v18;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: We aren't expecting an event for asset %{public}@. Ignoring.", buf, 0x16u);
    }
  }
LABEL_33:

}

void __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "backoffManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveRetryAfterDate:", *(_QWORD *)(a1 + 40));

}

void __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_23(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "backoffManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "backoff");

}

void __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_24(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "backoffManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v3);

}

void __57__MSASAssetDownloader__workQueueDidFinishWithItem_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAssetDownloader:didFinishDownloadingAsset:inAlbumGUID:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __40__MSASAssetDownloader_unregisterAssets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueUnregisterAssets:", *(_QWORD *)(a1 + 40));
}

void __63__MSASAssetDownloader_workQueueRegisterAssets_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

  }
}

void __54__MSASAssetDownloader_registerAssets_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MSASAssetDownloader_registerAssets_completionBlock___block_invoke_2;
  v5[3] = &unk_1E95BCF98;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "workQueueRegisterAssets:completionBlock:", v3, v5);

}

void __54__MSASAssetDownloader_registerAssets_completionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

  }
}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "retainBusy");

}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_15(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAssetDownloader:willBeginBatchCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_16(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAssetDownloader:didFinishDownloadingAsset:inAlbumGUID:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_17(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAssetDownloader:didFinishDownloadingAsset:inAlbumGUID:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAssetDownloaderDidFinishBatch:", *(_QWORD *)(a1 + 32));

}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_18(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAssetDownloader:willBeginBatchCount:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "count"));

}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_2_21(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "retainBusy");

}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "retainBusy");

}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "releaseBusy");

}

void __39__MSASAssetDownloader__workQueueGoIdle__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "releaseBusy");

}

void __38__MSASAssetDownloader_workQueueCancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "albumGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASAssetDownloader:didFinishDownloadingAsset:inAlbumGUID:error:", v2, v3, v4, v5);

}

@end
