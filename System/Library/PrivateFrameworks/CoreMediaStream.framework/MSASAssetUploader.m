@implementation MSASAssetUploader

- (id)_pathForPersonID:(id)a3
{
  return MSPathAlbumSharingPublishMMCSLibraryForPersonID(a3);
}

- (void)workQueueRetryOutstandingActivities
{
  int state;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  MSASAssetUploader *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state != 1)
  {
    if (state)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v10 = self;
        v11 = 1024;
        v12 = state;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unknown state: %d", buf, 0x12u);
      }
      MSPlatform();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didDetectUnrecoverableCondition");

    }
    else
    {
      MSASPlatform();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "MSASIsAllowedToUploadAssets");

      if (v5)
      {
        self->_state = 1;
        -[MSASAssetTransferer eventQueue](self, "eventQueue");
        v6 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__MSASAssetUploader_workQueueRetryOutstandingActivities__block_invoke;
        block[3] = &unk_1E95BCED0;
        block[4] = self;
        dispatch_async(v6, block);

        -[MSASAssetUploader workQueueUploadNextBatch](self, "workQueueUploadNextBatch");
      }
    }
  }
}

- (void)workQueueGoIdle
{
  NSMutableDictionary *assetToAssetCollectionMap;
  NSMutableArray *itemsInFlight;
  NSMutableDictionary *v5;
  NSMutableArray *finishedAssetCollections;
  NSMutableSet *assetCollectionsWithAuthorizationError;
  NSMutableDictionary *assetCollectionGUIDToRequestorContext;
  NSObject *v9;
  _QWORD block[5];

  if (-[MSASAssetUploader state](self, "state"))
  {
    assetToAssetCollectionMap = self->_assetToAssetCollectionMap;
    self->_assetToAssetCollectionMap = 0;

    itemsInFlight = self->_itemsInFlight;
    self->_itemsInFlight = 0;

    v5 = self->_assetToAssetCollectionMap;
    self->_assetToAssetCollectionMap = 0;

    finishedAssetCollections = self->_finishedAssetCollections;
    self->_finishedAssetCollections = 0;

    assetCollectionsWithAuthorizationError = self->_assetCollectionsWithAuthorizationError;
    self->_assetCollectionsWithAuthorizationError = 0;

    assetCollectionGUIDToRequestorContext = self->_assetCollectionGUIDToRequestorContext;
    self->_assetCollectionGUIDToRequestorContext = 0;

    self->_state = 0;
    -[MSASAssetTransferer _sendDidIdleNotification](self, "_sendDidIdleNotification");
    -[MSASAssetTransferer eventQueue](self, "eventQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__MSASAssetUploader_workQueueGoIdle__block_invoke;
    block[3] = &unk_1E95BCED0;
    block[4] = self;
    dispatch_async(v9, block);

  }
}

- (void)_workQueueStop
{
  void *v3;

  if (self->_state == 1)
  {
    -[MSASAssetTransferer engine](self, "engine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAllOperations");

    -[MSASAssetUploader workQueueGoIdle](self, "workQueueGoIdle");
  }
}

- (void)workQueueStop
{
  int v3;
  MSASAssetUploader *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_state == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138543362;
      v4 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping all uploads.", (uint8_t *)&v3, 0xCu);
    }
    -[MSASAssetUploader _workQueueStop](self, "_workQueueStop");
  }
}

- (void)workQueueShutDownCompletionBlock:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[MSASAssetUploader workQueueStop](self, "workQueueStop");
  v5.receiver = self;
  v5.super_class = (Class)MSASAssetUploader;
  -[MSASAssetTransferer workQueueShutDownCompletionBlock:](&v5, sel_workQueueShutDownCompletionBlock_, v4);

}

- (void)workQueueCancel
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  MSASAssetUploader *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_state == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling all uploads.", buf, 0xCu);
    }
    -[MSASAssetUploader _workQueueStop](self, "_workQueueStop");
  }
  -[MSASAssetTransferer model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextItemsForUploadMaxCount:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v4;
  if (objc_msgSend(v4, "count"))
  {
    do
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v5 = v16;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v21 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v10, "object");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "album");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSASAssetTransferer eventQueue](self, "eventQueue");
            v13 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __36__MSASAssetUploader_workQueueCancel__block_invoke;
            block[3] = &unk_1E95BCE30;
            block[4] = self;
            v18 = v11;
            v19 = v12;
            v14 = v12;
            v15 = v11;
            dispatch_async(v13, block);

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v7);
      }

    }
    while (objc_msgSend(v5, "count"));
  }

}

- (id)_orphanedAssetCollectionError
{
  if (_orphanedAssetCollectionError_onceToken != -1)
    dispatch_once(&_orphanedAssetCollectionError_onceToken, &__block_literal_global_5305);
  return (id)_orphanedAssetCollectionError_error;
}

- (void)workQueueUploadNextBatch
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *v12;
  NSMutableArray *itemsInFlight;
  NSMutableDictionary *v14;
  NSMutableDictionary *assetCollectionsToItemInFlightMap;
  NSMutableSet *v16;
  NSMutableSet *assetCollectionsWithAuthorizationError;
  NSMutableDictionary *v18;
  NSMutableDictionary *assetCollectionGUIDToRequestorContext;
  NSMutableDictionary *assetToAssetCollectionMap;
  NSMutableArray *v21;
  NSMutableArray *finishedAssetCollections;
  void *v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  NSMutableDictionary *v52;
  NSMutableDictionary *v53;
  uint64_t m;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t n;
  void *v62;
  void *v63;
  NSMutableDictionary *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t ii;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSMutableArray *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t jj;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id obj;
  id v93;
  NSMutableArray *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
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
  __int128 v118;
  _QWORD v119[6];
  id v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD block[5];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint8_t v138[128];
  uint8_t buf[4];
  MSASAssetUploader *v140;
  __int16 v141;
  uint64_t v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  void *v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  if (-[MSASAssetTransferer hasShutDown](self, "hasShutDown"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v140 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Not uploading because we're shutting down.", buf, 0xCu);
    }
    -[MSASAssetTransferer eventQueue](self, "eventQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__MSASAssetUploader_workQueueUploadNextBatch__block_invoke;
    block[3] = &unk_1E95BCED0;
    block[4] = self;
    dispatch_async(v3, block);

  }
  else
  {
    -[MSASAssetUploader setDidEncounterNetworkConditionError:](self, "setDidEncounterNetworkConditionError:", 0);
    -[MSASAssetTransferer model](self, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetTransferer focusAlbumGUID](self, "focusAlbumGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextItemsForUploadAlbumGUID:maxPriority:maxCount:", v5, 0, -[MSASAssetTransferer maxBatchCount](self, "maxBatchCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (!objc_msgSend(v7, "count"))
    {
      -[MSASAssetTransferer model](self, "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASAssetTransferer focusAlbumGUID](self, "focusAlbumGUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nextItemsForUploadAlbumGUID:maxPriority:maxCount:", v9, 10, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mutableCopy");

      v7 = (void *)v11;
    }
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      itemsInFlight = self->_itemsInFlight;
      self->_itemsInFlight = v12;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      assetCollectionsToItemInFlightMap = self->_assetCollectionsToItemInFlightMap;
      self->_assetCollectionsToItemInFlightMap = v14;

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
      v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      assetCollectionsWithAuthorizationError = self->_assetCollectionsWithAuthorizationError;
      self->_assetCollectionsWithAuthorizationError = v16;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      assetCollectionGUIDToRequestorContext = self->_assetCollectionGUIDToRequestorContext;
      self->_assetCollectionGUIDToRequestorContext = v18;

      assetToAssetCollectionMap = self->_assetToAssetCollectionMap;
      self->_assetToAssetCollectionMap = 0;

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      finishedAssetCollections = self->_finishedAssetCollections;
      self->_finishedAssetCollections = v21;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v90 = v7;
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = 0u;
      v131 = 0u;
      v132 = 0u;
      v133 = 0u;
      obj = v7;
      v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v149, 16);
      v23 = 0;
      if (v95)
      {
        v93 = *(id *)v131;
        do
        {
          for (i = 0; i != v95; ++i)
          {
            if (*(id *)v131 != v93)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
            objc_msgSend(v25, "object");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = 0u;
            v127 = 0u;
            v128 = 0u;
            v129 = 0u;
            v100 = v26;
            objc_msgSend(v26, "assets");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v126, v148, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v127;
              v97 = v25;
              while (2)
              {
                for (j = 0; j != v29; ++j)
                {
                  if (*(_QWORD *)v127 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
                  objc_msgSend(v32, "MMCSURL");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v33)
                  {
                    v37 = (void *)MEMORY[0x1E0C99D80];
                    -[MSASAssetTransferer _missingURLError](self, "_missingURLError");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v97, "album");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "dictionaryWithObjectsAndKeys:", v38, CFSTR("error"), v39, CFSTR("album"), 0);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v91, "setObject:forKey:", v40, v100);
LABEL_27:

                    goto LABEL_28;
                  }
                  objc_msgSend(v32, "MMCSURL");
                  v34 = objc_claimAutoreleasedReturnValue();
                  v35 = (void *)v34;
                  if (v23)
                  {
                    v36 = objc_msgSend(v23, "isEqual:", v34);

                    if (!v36)
                      goto LABEL_27;
                  }
                  else
                  {
                    v23 = (void *)v34;
                  }
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v126, v148, 16);
                v25 = v97;
                if (v29)
                  continue;
                break;
              }
            }

            -[NSMutableArray addObject:](self->_itemsInFlight, "addObject:", v25);
LABEL_28:

          }
          v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v149, 16);
        }
        while (v95);
      }

      if (objc_msgSend(v91, "count"))
      {
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        v41 = v91;
        v101 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v122, v147, 16);
        if (v101)
        {
          v98 = *(_QWORD *)v123;
          do
          {
            for (k = 0; k != v101; ++k)
            {
              if (*(_QWORD *)v123 != v98)
                objc_enumerationMutation(v41);
              v43 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * k);
              objc_msgSend(v41, "objectForKey:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "objectForKey:", CFSTR("error"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "objectForKey:", CFSTR("album"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138544130;
                v140 = self;
                v141 = 2114;
                v142 = (uint64_t)v43;
                v143 = 2114;
                v144 = (uint64_t)v46;
                v145 = 2114;
                v146 = v45;
                _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Rejecting asset collection %{public}@ from album %{public}@. Error: %{public}@", buf, 0x2Au);
              }
              -[MSASAssetTransferer eventQueue](self, "eventQueue");
              v47 = objc_claimAutoreleasedReturnValue();
              v119[0] = MEMORY[0x1E0C809B0];
              v119[1] = 3221225472;
              v119[2] = __45__MSASAssetUploader_workQueueUploadNextBatch__block_invoke_10;
              v119[3] = &unk_1E95BCE58;
              v119[4] = self;
              v119[5] = v43;
              v120 = v46;
              v121 = v45;
              v48 = v45;
              v49 = v46;
              dispatch_async(v47, v119);

            }
            v101 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v122, v147, 16);
          }
          while (v101);
        }

        -[MSASAssetTransferer model](self, "model");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "allKeys");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "removeAssetCollectionsFromUploadQueue:", v51);

      }
      if (-[NSMutableArray count](self->_itemsInFlight, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2 * -[NSMutableArray count](self->_itemsInFlight, "count"));
        v52 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v53 = self->_assetToAssetCollectionMap;
        self->_assetToAssetCollectionMap = v52;

        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        v94 = self->_itemsInFlight;
        v96 = v23;
        v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v115, v138, 16);
        if (v102)
        {
          v99 = *(_QWORD *)v116;
          do
          {
            for (m = 0; m != v102; ++m)
            {
              if (*(_QWORD *)v116 != v99)
                objc_enumerationMutation(v94);
              v55 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * m);
              objc_msgSend(v55, "object");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              if (v56)
              {
                -[NSMutableDictionary setObject:forKey:](self->_assetCollectionsToItemInFlightMap, "setObject:forKey:", v55, v56);
                v113 = 0u;
                v114 = 0u;
                v111 = 0u;
                v112 = 0u;
                objc_msgSend(v56, "assets");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v111, v137, 16);
                if (v58)
                {
                  v59 = v58;
                  v60 = *(_QWORD *)v112;
                  do
                  {
                    for (n = 0; n != v59; ++n)
                    {
                      if (*(_QWORD *)v112 != v60)
                        objc_enumerationMutation(v57);
                      v62 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * n);
                      objc_msgSend(v62, "MMCSReceipt");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v63)
                        -[NSMutableDictionary setObject:forKey:](self->_assetToAssetCollectionMap, "setObject:forKey:", v56, v62);
                    }
                    v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v111, v137, 16);
                  }
                  while (v59);
                }

                v23 = v96;
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v140 = self;
                v141 = 2114;
                v142 = (uint64_t)v55;
                _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Missing expected asset collection in person model item %{public}@.", buf, 0x16u);
              }

            }
            v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v115, v138, 16);
          }
          while (v102);
        }

        if (-[NSMutableDictionary count](self->_assetToAssetCollectionMap, "count"))
        {
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v64 = self->_assetToAssetCollectionMap;
          v65 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v107, v136, 16);
          if (v65)
          {
            v66 = v65;
            v67 = *(_QWORD *)v108;
            do
            {
              for (ii = 0; ii != v66; ++ii)
              {
                if (*(_QWORD *)v108 != v67)
                  objc_enumerationMutation(v64);
                v69 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * ii);
                -[MSASAssetTransferer engine](self, "engine");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "reregisterAssetForUpload:", v69);

              }
              v66 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v107, v136, 16);
            }
            while (v66);
          }

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v71 = -[NSMutableDictionary count](self->_assetToAssetCollectionMap, "count");
            v72 = -[NSMutableArray count](self->_itemsInFlight, "count");
            *(_DWORD *)buf = 138543874;
            v140 = self;
            v141 = 2048;
            v142 = v71;
            v143 = 2048;
            v144 = v72;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Uploading %ld assets for %ld asset collections.", buf, 0x20u);
          }
          MSASPlatform();
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_opt_respondsToSelector();

          v23 = v96;
          if ((v74 & 1) != 0)
          {
            MSASPlatform();
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSASAssetTransferer personID](self, "personID");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "MMCSUploadSocketOptionsForPersonID:", v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            if (v77)
            {
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v77, *MEMORY[0x1E0D468F0]);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v78 = 0;
            }
            v7 = v90;

          }
          else
          {
            v78 = 0;
            v7 = v90;
          }
          -[MSASAssetTransferer engine](self, "engine");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary allKeys](self->_assetToAssetCollectionMap, "allKeys");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSASAssetTransferer personID](self, "personID");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "putAssets:requestURL:DSID:options:", v87, v96, v88, v78);

        }
        else
        {
          v7 = v90;
          if (-[NSMutableArray count](self->_itemsInFlight, "count"))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v89 = -[NSMutableArray count](self->_itemsInFlight, "count");
              *(_DWORD *)buf = 138543618;
              v140 = self;
              v141 = 2048;
              v142 = v89;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: No assets to upload, but detected %ld orphaned asset collections.", buf, 0x16u);
            }
            v105 = 0u;
            v106 = 0u;
            v103 = 0u;
            v104 = 0u;
            v79 = self->_itemsInFlight;
            v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v103, v135, 16);
            if (v80)
            {
              v81 = v80;
              v82 = *(_QWORD *)v104;
              do
              {
                for (jj = 0; jj != v81; ++jj)
                {
                  if (*(_QWORD *)v104 != v82)
                    objc_enumerationMutation(v79);
                  v84 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * jj);
                  -[MSASAssetUploader _orphanedAssetCollectionError](self, "_orphanedAssetCollectionError");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MSASAssetUploader workQueueDidFinishWithItem:error:](self, "workQueueDidFinishWithItem:error:", v84, v85);

                }
                v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v103, v135, 16);
              }
              while (v81);
            }

            -[MSASAssetUploader workQueueGoIdle](self, "workQueueGoIdle");
            v7 = v90;
            v23 = v96;
          }
        }
      }
      else
      {
        v7 = v90;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v140 = self;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: No assets to upload.", buf, 0xCu);
        }
        -[MSASAssetUploader workQueueGoIdle](self, "workQueueGoIdle");
      }

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v140 = self;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Nothing to upload.", buf, 0xCu);
      }
      -[MSASAssetUploader workQueueGoIdle](self, "workQueueGoIdle");
    }

  }
}

- (void)workQueueCancelAssetCollections:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *assetCollectionGUIDToRequestorContext;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  MSASAssetUploader *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableDictionary count](self->_assetCollectionGUIDToRequestorContext, "count") == 1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = MEMORY[0x1E0C81028];
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          assetCollectionGUIDToRequestorContext = self->_assetCollectionGUIDToRequestorContext;
          objc_msgSend(v10, "GUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](assetCollectionGUIDToRequestorContext, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v14)
            {
              *(_DWORD *)buf = 138543874;
              v23 = self;
              v24 = 2114;
              v25 = v10;
              v26 = 2114;
              v27 = v13;
              _os_log_impl(&dword_1D3E94000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling in-progress upload for asset collection %{public}@ with context %{public}@", buf, 0x20u);
            }
            -[MSASAssetTransferer engine](self, "engine");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "cancelOperationsWithContext:", v13);

          }
          else if (v14)
          {
            *(_DWORD *)buf = 138543618;
            v23 = self;
            v24 = 2114;
            v25 = v10;
            _os_log_impl(&dword_1D3E94000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot cancel upload for assetCollection %{public}@ which is not in progress", buf, 0x16u);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v6);
    }

    v4 = v16;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot cancel upload for assetCollections %{public}@ which is either not in progress, or has more than one items in an upload batch", buf, 0x16u);
  }

}

- (void)workQueueRegisterAssets:(id)a3 index:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(id, _QWORD);
  unint64_t v15;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  if (objc_msgSend(v8, "count") <= a4)
  {
    v9[2](v9, 0);
  }
  else
  {
    objc_msgSend(v8, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMMCSItemID:", -[MSASAssetTransferer workQueueNextItemID](self, "workQueueNextItemID"));
    -[MSASAssetTransferer engine](self, "engine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__MSASAssetUploader_workQueueRegisterAssets_index_completionBlock___block_invoke;
    v12[3] = &unk_1E95BBEB8;
    v14 = v9;
    v12[4] = self;
    v13 = v8;
    v15 = a4;
    objc_msgSend(v11, "registerAssetForUpload:completionBlock:", v10, v12);

  }
}

- (void)workQueueRegisterAssetCollections:(id)a3 index:(unint64_t)a4 results:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  MSASAssetUploader *v17;
  id v18;
  void (**v19)(id, id);
  unint64_t v20;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, id))a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v10, "count") <= a4)
  {
    v12[2](v12, v11);
  }
  else
  {
    objc_msgSend(v10, "objectAtIndex:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__MSASAssetUploader_workQueueRegisterAssetCollections_index_results_completionBlock___block_invoke;
    v15[3] = &unk_1E95BBF08;
    v16 = v11;
    v17 = self;
    v18 = v10;
    v20 = a4;
    v19 = v12;
    -[MSASAssetUploader workQueueRegisterAssets:index:completionBlock:](self, "workQueueRegisterAssets:index:completionBlock:", v14, 0, v15);

  }
}

- (void)registerAssetCollections:(id)a3 completionBlock:(id)a4
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
  block[2] = __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke;
  block[3] = &unk_1E95BC528;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)unregisterAssetCollections:(id)a3
{
  -[MSASAssetUploader unregisterAssetCollections:completionBlock:](self, "unregisterAssetCollections:completionBlock:", a3, 0);
}

- (void)unregisterAssetCollections:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MSASAssetUploader *v13;
  id v14;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MSASAssetUploader_unregisterAssetCollections_completionBlock___block_invoke;
  block[3] = &unk_1E95BC528;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)cancelAssetCollections:(id)a3
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
  v7[2] = __44__MSASAssetUploader_cancelAssetCollections___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)workQueueStopTrackingItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](self->_itemsInFlight, "removeObject:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_assetCollectionsToItemInFlightMap, "removeObjectForKey:", v5);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v5, "assets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[NSMutableDictionary removeObjectForKey:](self->_assetToAssetCollectionMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)workQueueDidFinishWithItem:(id)a3 error:(id)a4
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
  -[MSASAssetUploader workQueueStopTrackingItem:](self, "workQueueStopTrackingItem:", v7);
  objc_msgSend(v7, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetTransferer model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAssetCollectionsFromUploadQueue:", v10);

  -[NSMutableArray addObject:](self->_finishedAssetCollections, "addObject:", v8);
  objc_msgSend(v7, "album");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASAssetTransferer eventQueue](self, "eventQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__MSASAssetUploader_workQueueDidFinishWithItem_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v16[4] = self;
  v17 = v8;
  v18 = v11;
  v19 = v6;
  v13 = v6;
  v14 = v11;
  v15 = v8;
  dispatch_async(v12, v16);

}

- (void)MMCSEngine:(id)a3 didFinishPuttingAsset:(id)a4 putReceipt:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  MSASAssetUploader *v18;
  id v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v17 = v11;
  v18 = self;
  v19 = v9;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, v16);

}

- (void)MMCSEngine:(id)a3 didCreateRequestorContext:(id)a4 forAssets:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  MSASAssetUploader *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MSASAssetUploader_MMCSEngine_didCreateRequestorContext_forAssets___block_invoke;
  block[3] = &unk_1E95BCE30;
  v13 = v8;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (void)MMCSEngine:(id)a3 didMakePutProgress:(float)a4 state:(int)a5 onAsset:(id)a6
{
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  float v14;
  int v15;

  v9 = a6;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MSASAssetUploader_MMCSEngine_didMakePutProgress_state_onAsset___block_invoke;
  block[3] = &unk_1E95BBFC0;
  v14 = a4;
  v15 = a5;
  block[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(v10, block);

}

- (void)didFinishPuttingAllAssets
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASAssetTransferer workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MSASAssetUploader_didFinishPuttingAllAssets__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)MMCSEngine:(id)a3 didFinishGettingAsset:(id)a4 path:(id)a5 error:(id)a6
{
  int v7;
  MSASAssetUploader *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback - MMCSEngine:didFinishGettingAsset:context:error:", (uint8_t *)&v7, 0xCu);
  }
}

- (void)MMCSEngine:(id)a3 didMakeGetProgress:(float)a4 state:(int)a5 onAsset:(id)a6
{
  int v7;
  MSASAssetUploader *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback - MMCSEngine:didMakeGetProgress:state:onAsset:context:", (uint8_t *)&v7, 0xCu);
  }
}

- (void)didFinishGettingAllAssets
{
  int v3;
  MSASAssetUploader *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback - MMCSEngine:didFinishGettingAllAssetsContext:", (uint8_t *)&v3, 0xCu);
  }
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

- (NSMutableDictionary)assetCollectionsToItemInFlightMap
{
  return self->_assetCollectionsToItemInFlightMap;
}

- (void)setAssetCollectionsToItemInFlightMap:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionsToItemInFlightMap, a3);
}

- (NSMutableDictionary)assetToAssetCollectionMap
{
  return self->_assetToAssetCollectionMap;
}

- (void)setAssetToAssetCollectionMap:(id)a3
{
  objc_storeStrong((id *)&self->_assetToAssetCollectionMap, a3);
}

- (NSMutableArray)finishedAssetCollections
{
  return self->_finishedAssetCollections;
}

- (void)setFinishedAssetCollections:(id)a3
{
  objc_storeStrong((id *)&self->_finishedAssetCollections, a3);
}

- (BOOL)didEncounterNetworkConditionError
{
  return self->_didEncounterNetworkConditionError;
}

- (void)setDidEncounterNetworkConditionError:(BOOL)a3
{
  self->_didEncounterNetworkConditionError = a3;
}

- (NSMutableSet)assetCollectionsWithAuthorizationError
{
  return self->_assetCollectionsWithAuthorizationError;
}

- (void)setAssetCollectionsWithAuthorizationError:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionsWithAuthorizationError, a3);
}

- (NSMutableDictionary)assetCollectionGUIDToRequestorContext
{
  return self->_assetCollectionGUIDToRequestorContext;
}

- (void)setAssetCollectionGUIDToRequestorContext:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionGUIDToRequestorContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionGUIDToRequestorContext, 0);
  objc_storeStrong((id *)&self->_assetCollectionsWithAuthorizationError, 0);
  objc_storeStrong((id *)&self->_finishedAssetCollections, 0);
  objc_storeStrong((id *)&self->_assetToAssetCollectionMap, 0);
  objc_storeStrong((id *)&self->_assetCollectionsToItemInFlightMap, 0);
  objc_storeStrong((id *)&self->_itemsInFlight, 0);
}

uint64_t __46__MSASAssetUploader_didFinishPuttingAllAssets__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = objc_msgSend(*(id *)(v2 + 144), "count");
    *(_DWORD *)buf = 138543618;
    v38 = v2;
    v39 = 2048;
    v40 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Finished uploading %ld asset collections.", buf, 0x16u);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    v8 = *MEMORY[0x1E0D46750];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v11 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v8, 14, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "workQueueDidFinishWithItem:error:", v10, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeAllObjects");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "count")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = *(_QWORD *)(a1 + 32);
    v24 = objc_msgSend(*(id *)(v23 + 136), "count");
    *(_DWORD *)buf = 138543618;
    v38 = v23;
    v39 = 2048;
    v40 = v24;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Found %ld orphaned assets. Ignoring.", buf, 0x16u);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 32);
      v26 = objc_msgSend(*(id *)(v25 + 120), "count");
      *(_DWORD *)buf = 138543618;
      v38 = v25;
      v39 = 2048;
      v40 = v26;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Found %ld orphaned asset collections.", buf, 0x16u);
    }
    v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "copy");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
          v20 = *(void **)(a1 + 32);
          objc_msgSend(v20, "_orphanedAssetCollectionError");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "workQueueDidFinishWithItem:error:", v19, v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v16);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "workQueueGoIdle");
  result = objc_msgSend(*(id *)(a1 + 32), "didEncounterNetworkConditionError");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
  return result;
}

void __65__MSASAssetUploader_MMCSEngine_didMakePutProgress_state_onAsset___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  float v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  MSASPlatform();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLogAtLevel:", 7);

  if (v3)
  {
    v4 = *(float *)(a1 + 48);
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v4 == -1.0)
    {
      if (v5)
      {
        v12 = *(_QWORD *)(a1 + 32);
        +[MMCSEngine logStringForPutItemState:](MMCSEngine, "logStringForPutItemState:", *(unsigned int *)(a1 + 52));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(a1 + 40);
        v14 = 138543874;
        v15 = v12;
        v16 = 2114;
        v17 = *(double *)&v7;
        v18 = 2048;
        v19 = v13;
        v9 = MEMORY[0x1E0C81028];
        v10 = "%{public}@: Upload progress state: %{public}@, on asset: %p";
        v11 = 32;
        goto LABEL_8;
      }
    }
    else if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      +[MMCSEngine logStringForPutItemState:](MMCSEngine, "logStringForPutItemState:", *(unsigned int *)(a1 + 52));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v14 = 138544130;
      v15 = v6;
      v16 = 2048;
      v17 = v4;
      v18 = 2114;
      v19 = v7;
      v20 = 2048;
      v21 = v8;
      v9 = MEMORY[0x1E0C81028];
      v10 = "%{public}@: Upload progress: %.2f, state: %{public}@, on asset: %p";
      v11 = 42;
LABEL_8:
      _os_log_debug_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, v11);

    }
  }
}

void __68__MSASAssetUploader_MMCSEngine_didCreateRequestorContext_forAssets___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v19;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7), "assetCollectionGUID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v5);
    }

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v2;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v11);
    }

  }
}

void __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke(uint64_t a1)
{
  id *v1;
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t j;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id obj;
  id *obja;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  _QWORD v59[5];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD block[5];
  id v65;
  uint8_t v66[128];
  uint8_t buf[4];
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v1 = (id *)a1;
  v74 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(id **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2[17], "objectForKey:", v1[6]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*((id *)v1[5] + 16), "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v1[4], "MMCSRetryAfterDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v1[5], "eventQueue");
          v7 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_2;
          block[3] = &unk_1E95BCFC0;
          block[4] = v1[5];
          v65 = v6;
          dispatch_async(v7, block);

        }
        if (objc_msgSend(v1[4], "MMCSIsCancelError"))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v8 = v1[5];
            *(_DWORD *)buf = 138543362;
            v68 = v8;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Asset upload was canceled. Ignoring.", buf, 0xCu);
          }
          objc_msgSend(v1[5], "workQueueStopTrackingItem:", v5);
        }
        else if (objc_msgSend(v1[4], "MMCSIsNetworkConditionsError"))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v26 = v1[5];
            *(_DWORD *)buf = 138543362;
            v68 = v26;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered temporary network error while uploading asset. Will retry later.", buf, 0xCu);
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v27 = v1[5];
            objc_msgSend(v1[4], "MSVerboseDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v68 = v27;
            v69 = 2114;
            v70 = v28;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Error: %{public}@", buf, 0x16u);

          }
          objc_msgSend(v1[5], "workQueueStopTrackingItem:", v5);
          objc_msgSend(v1[5], "setDidEncounterNetworkConditionError:", 1);
        }
        else if ((objc_msgSend(v1[4], "MMCSIsFatalError") & 1) != 0
               || (v32 = objc_msgSend(v5, "errorCount") + 1, v32 >= (int)objc_msgSend(v1[5], "maxRetryCount")))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v46 = v1[5];
            objc_msgSend(v1[4], "MSVerboseDescription");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v68 = v46;
            v69 = 2114;
            v70 = v4;
            v71 = 2114;
            v72 = v47;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to upload asset collection: %{public}@. Error: %{public}@. Giving up.", buf, 0x20u);

          }
          objc_msgSend(v1[5], "workQueueDidFinishWithItem:error:", v5, v1[4]);
        }
        else
        {
          objc_msgSend(v1[5], "model");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setErrorCount:forAssetCollectionInUploadQueue:", objc_msgSend(v5, "errorCount") + 1, v4);

          if (objc_msgSend(v1[4], "MMCSIsAuthorizationError"))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v34 = v1[5];
              objc_msgSend(v1[4], "MSVerboseDescription");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v68 = v34;
              v69 = 2114;
              v70 = v35;
              _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered MMCS auth error. Will reauthorize. Error: %{public}@", buf, 0x16u);

            }
            obja = v1;
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            objc_msgSend(v4, "assets");
            v51 = (id)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v61;
              while (2)
              {
                for (i = 0; i != v37; ++i)
                {
                  if (*(_QWORD *)v61 != v38)
                    objc_enumerationMutation(v51);
                  v40 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
                  objc_msgSend(v40, "GUID");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(obja[6], "GUID");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v41, "isEqualToString:", v42);

                  if (v43)
                  {
                    objc_msgSend(v40, "setMMCSAccessHeader:", 0);
                    goto LABEL_65;
                  }
                }
                v37 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
                if (v37)
                  continue;
                break;
              }
            }
LABEL_65:

            objc_msgSend(*((id *)obja[5] + 19), "addObject:", v5);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v48 = v1[5];
              objc_msgSend(v1[4], "MSVerboseDescription");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v68 = v48;
              v69 = 2114;
              v70 = v4;
              v71 = 2114;
              v72 = v49;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to upload asset collection %{public}@. Error: %{public}@. Will retry later.", buf, 0x20u);

            }
            objc_msgSend(v1[5], "workQueueStopTrackingItem:", v5);
            objc_msgSend(v1[5], "eventQueue");
            v44 = objc_claimAutoreleasedReturnValue();
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_17;
            v59[3] = &unk_1E95BCED0;
            v59[4] = v1[5];
            dispatch_async(v44, v59);

          }
        }

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v22 = v1[5];
        v23 = v1[6];
        *(_DWORD *)buf = 138543618;
        v68 = v22;
        v69 = 2114;
        v70 = v23;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Already reported error on asset %{public}@. Ignoring.", buf, 0x16u);
      }
      goto LABEL_59;
    }
  }
  else
  {
    objc_msgSend(v2, "eventQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_18;
    v58[3] = &unk_1E95BCED0;
    v58[4] = v1[5];
    dispatch_async(v9, v58);

    objc_msgSend(*((id *)v1[5] + 17), "objectForKey:", v1[6]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*((id *)v1[5] + 17), "removeObjectForKey:", v1[6]);
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v4, "assets");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      if (v11)
      {
        v12 = v11;
        v50 = v4;
        obj = v10;
        v13 = *(_QWORD *)v55;
        v14 = 1;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v55 != v13)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
            objc_msgSend(v16, "GUID", v50);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1[6], "GUID");
            v18 = v1;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v17, "isEqualToString:", v19);

            v1 = v18;
            if (v20)
              objc_msgSend(v16, "setMMCSReceipt:", v18[7]);
            objc_msgSend(*((id *)v18[5] + 17), "objectForKey:", v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v14 &= v21 == 0;
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
        }
        while (v12);

        v4 = v50;
        if ((v14 & 1) == 0)
          goto LABEL_60;
      }
      else
      {

      }
      objc_msgSend(*((id *)v1[5] + 16), "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v29 = v1[5];
          *(_DWORD *)buf = 138543618;
          v68 = v29;
          v69 = 2114;
          v70 = v4;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully uploaded asset collection: %{public}@", buf, 0x16u);
        }
        objc_msgSend(v1[5], "workQueueDidFinishWithItem:error:", v5, 0);
        v30 = (void *)*((_QWORD *)v1[5] + 20);
        objc_msgSend(v4, "GUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeObjectForKey:", v31);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v45 = v1[5];
          *(_DWORD *)buf = 138543362;
          v68 = v45;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not find upload item that matches the completed asset collection.", buf, 0xCu);
        }
        MSPlatform();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "didDetectUnrecoverableCondition");
      }

LABEL_59:
      goto LABEL_60;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v24 = v1[5];
      v25 = v1[6];
      *(_DWORD *)buf = 138543618;
      v68 = v24;
      v69 = 2114;
      v70 = v25;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Successfully uploaded asset %{public}@, but can't find matching asset collection. Ignoring.", buf, 0x16u);
    }
  }
LABEL_60:

}

void __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "backoffManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveRetryAfterDate:", *(_QWORD *)(a1 + 40));

}

void __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_17(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "backoffManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "backoff");

}

void __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_18(uint64_t a1)
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

void __54__MSASAssetUploader_workQueueDidFinishWithItem_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAssetUploader:didFinishUploadingAssetCollection:intoAlbum:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __44__MSASAssetUploader_cancelAssetCollections___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueCancelAssetCollections:", *(_QWORD *)(a1 + 40));
}

uint64_t __64__MSASAssetUploader_unregisterAssetCollections_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t result;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v5);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v6, "assets");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
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
              objc_msgSend(*(id *)(a1 + 40), "engine");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "unregisterAsset:", v12);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v3);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke_2;
  v5[3] = &unk_1E95BBF30;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "workQueueRegisterAssetCollections:index:results:completionBlock:", v3, 0, v4, v5);

}

void __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke_3;
  v7[3] = &unk_1E95BCF98;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __85__MSASAssetUploader_workQueueRegisterAssetCollections_index_results_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MSASAssetUploader_workQueueRegisterAssetCollections_index_results_completionBlock___block_invoke_2;
  block[3] = &unk_1E95BBEE0;
  v6 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  v10 = v7;
  v13 = v8;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 56);
  dispatch_async(v5, block);

}

uint64_t __85__MSASAssetUploader_workQueueRegisterAssetCollections_index_results_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueRegisterAssetCollections:index:results:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __67__MSASAssetUploader_workQueueRegisterAssets_index_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__MSASAssetUploader_workQueueRegisterAssets_index_completionBlock___block_invoke_2;
    v8[3] = &unk_1E95BC3E8;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v5 = v4;
    v7 = *(void **)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v9 = v5;
    v11 = v6;
    v10 = v7;
    dispatch_async(v3, v8);

  }
}

uint64_t __67__MSASAssetUploader_workQueueRegisterAssets_index_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueRegisterAssets:index:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

void __45__MSASAssetUploader_workQueueUploadNextBatch__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "releaseBusy");

}

void __45__MSASAssetUploader_workQueueUploadNextBatch__block_invoke_10(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAssetUploader:didFinishUploadingAssetCollection:intoAlbum:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __50__MSASAssetUploader__orphanedAssetCollectionError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_ASSET_UPLOADER_ORPHANED"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASAssetUploaderErrorDomain"), 0, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_orphanedAssetCollectionError_error;
  _orphanedAssetCollectionError_error = v1;

}

void __36__MSASAssetUploader_workQueueCancel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASAssetUploader:didFinishUploadingAssetCollection:intoAlbum:error:", v2, v3, v4, v5);

}

void __36__MSASAssetUploader_workQueueGoIdle__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "releaseBusy");

}

void __56__MSASAssetUploader_workQueueRetryOutstandingActivities__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "retainBusy");

}

@end
