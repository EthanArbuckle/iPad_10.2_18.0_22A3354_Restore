@implementation MSPublisher

- (MSPublisher)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  MSPublisher *v8;
  MSObjectQueue *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MSObjectQueue *uploadQueue;
  MSObjectQueue *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MSObjectQueue *derivativesQueue;
  MSObjectQueue *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MSObjectQueue *quarantinedQueue;
  NSMutableArray *v24;
  NSMutableArray *sendingQueue;
  NSMutableArray *v26;
  NSMutableArray *requestAuthQueue;
  NSMutableDictionary *v28;
  NSMutableDictionary *fileHashToAssetMap;
  MSPublishStreamsProtocol *v30;
  MSPublishStreamsProtocol *protocol;
  NSMutableArray *v32;
  NSMutableArray *tempFiles;
  MSPublishMMCSProtocol *v34;
  MSPublishStorageProtocol *storageProtocol;
  void *v36;
  NSMutableDictionary *v37;
  NSMutableDictionary *maxSizeByUTI;
  void *v39;
  id v40;
  void *v41;
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)MSPublisher;
  v8 = -[MSCupidStateMachine initWithPersonID:](&v43, sel_initWithPersonID_, v6);
  if (v8)
  {
    v9 = [MSObjectQueue alloc];
    -[MSCupidStateMachine personID](v8, "personID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathPublishQueueForPersonID(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MSObjectQueue initWithPath:](v9, "initWithPath:", v11);
    uploadQueue = v8->_uploadQueue;
    v8->_uploadQueue = (MSObjectQueue *)v12;

    v14 = [MSObjectQueue alloc];
    -[MSCupidStateMachine personID](v8, "personID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathPublishDerivativesQueueForPersonID(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MSObjectQueue initWithPath:](v14, "initWithPath:", v16);
    derivativesQueue = v8->_derivativesQueue;
    v8->_derivativesQueue = (MSObjectQueue *)v17;

    v19 = [MSObjectQueue alloc];
    -[MSCupidStateMachine personID](v8, "personID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathPublishDiscardedQueueForPersonID(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[MSObjectQueue initWithPath:](v19, "initWithPath:", v21);
    quarantinedQueue = v8->_quarantinedQueue;
    v8->_quarantinedQueue = (MSObjectQueue *)v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sendingQueue = v8->_sendingQueue;
    v8->_sendingQueue = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestAuthQueue = v8->_requestAuthQueue;
    v8->_requestAuthQueue = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fileHashToAssetMap = v8->_fileHashToAssetMap;
    v8->_fileHashToAssetMap = v28;

    v30 = -[MSPublishStreamsProtocol initWithPersonID:baseURL:]([MSPublishStreamsProtocol alloc], "initWithPersonID:baseURL:", v6, v7);
    protocol = v8->_protocol;
    v8->_protocol = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tempFiles = v8->_tempFiles;
    v8->_tempFiles = v32;

    -[MSPublishStreamsProtocol setDelegate:](v8->_protocol, "setDelegate:", v8);
    v34 = -[MSPublishMMCSProtocol initWithPersonID:]([MSPublishMMCSProtocol alloc], "initWithPersonID:", v6);
    storageProtocol = v8->_storageProtocol;
    v8->_storageProtocol = (MSPublishStorageProtocol *)v34;

    -[MSPublishStorageProtocol setDelegate:](v8->_storageProtocol, "setDelegate:", v8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v8, sel__serverSideConfigurationDidChange_, CFSTR("MSServerSideConfigChanged"), 0);

    v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    maxSizeByUTI = v8->_maxSizeByUTI;
    v8->_maxSizeByUTI = v37;

    -[MSPublisher _refreshServerSideConfiguredParameters](v8, "_refreshServerSideConfiguredParameters");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v39 = (void *)objc_opt_class();
      v40 = v39;
      objc_msgSend((id)objc_opt_class(), "nextActivityDateForPersonID:", v6);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v39;
      v46 = 2114;
      v47 = v41;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: next activity date is %{public}@", buf, 0x16u);

    }
  }

  return v8;
}

- (void)deactivate
{
  void *v3;
  NSMutableArray *tempFiles;
  NSURL *storageProtocolURL;
  MSPublishStorageProtocol *storageProtocol;
  MSPublishStreamsProtocol *protocol;
  NSMutableDictionary *fileHashToAssetMap;
  NSMutableArray *sendingQueue;
  NSMutableArray *requestAuthQueue;
  NSArray *pendingDerivativesQueue;
  MSObjectQueue *uploadQueue;
  MSObjectQueue *derivativesQueue;
  MSObjectQueue *quarantinedQueue;
  NSMutableDictionary *maxSizeByUTI;
  objc_super v16;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[MSPublisher stop](self, "stop");
  tempFiles = self->_tempFiles;
  self->_tempFiles = 0;

  storageProtocolURL = self->_storageProtocolURL;
  self->_storageProtocolURL = 0;

  -[MSPublishStorageProtocol deactivateRemoveAllFiles:](self->_storageProtocol, "deactivateRemoveAllFiles:", -[MSObjectQueue count](self->_uploadQueue, "count") == 0);
  storageProtocol = self->_storageProtocol;
  self->_storageProtocol = 0;

  protocol = self->_protocol;
  self->_protocol = 0;

  fileHashToAssetMap = self->_fileHashToAssetMap;
  self->_fileHashToAssetMap = 0;

  sendingQueue = self->_sendingQueue;
  self->_sendingQueue = 0;

  requestAuthQueue = self->_requestAuthQueue;
  self->_requestAuthQueue = 0;

  pendingDerivativesQueue = self->_pendingDerivativesQueue;
  self->_pendingDerivativesQueue = 0;

  uploadQueue = self->_uploadQueue;
  self->_uploadQueue = 0;

  derivativesQueue = self->_derivativesQueue;
  self->_derivativesQueue = 0;

  quarantinedQueue = self->_quarantinedQueue;
  self->_quarantinedQueue = 0;

  maxSizeByUTI = self->_maxSizeByUTI;
  self->_maxSizeByUTI = 0;

  v16.receiver = self;
  v16.super_class = (Class)MSPublisher;
  -[MSCupidStateMachine deactivate](&v16, sel_deactivate);
}

- (void)dealloc
{
  objc_super v3;

  -[MSPublisher deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)MSPublisher;
  -[MSCupidStateMachine dealloc](&v3, sel_dealloc);
}

- (void)_updateMasterManifest
{
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  id v7;

  -[MSCupidStateMachine _latestNextActivityDate](self, "_latestNextActivityDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[MSObjectQueue count](self->_uploadQueue, "count"))
  {
    if (v7)
    {
LABEL_3:
      -[MSCupidStateMachine personID](self, "personID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v7;
LABEL_12:
      +[MSPublisher _setMasterNextActivityDate:forPersonID:](MSPublisher, "_setMasterNextActivityDate:forPersonID:", v4, v3);
      goto LABEL_13;
    }
  }
  else
  {
    if (-[MSObjectQueue count](self->_derivativesQueue, "count"))
      v5 = v7 == 0;
    else
      v5 = 1;
    if (!v5)
      goto LABEL_3;
  }
  if (!-[MSObjectQueue count](self->_quarantinedQueue, "count"))
  {
    -[MSCupidStateMachine personID](self, "personID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 604800.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCupidStateMachine personID](self, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSPublisher _setMasterNextActivityDate:forPersonID:](MSPublisher, "_setMasterNextActivityDate:forPersonID:", v3, v6);

LABEL_13:
  _commitMasterManifest();

}

- (BOOL)enqueueAssetCollections:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    -[MSCupidStateMachine personID](self, "personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v6;
    v28 = 2112;
    v29 = v8;
    v30 = 2114;
    v31 = v5;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ enqueuing asset collections: %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "assetCollectionID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setAssetCollectionID:", v17);

        }
        +[MSObjectWrapper wrapperWithObject:size:](MSObjectWrapper, "wrapperWithObject:size:", v15, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  -[MSObjectQueue appendObjectWrappers:](self->_uploadQueue, "appendObjectWrappers:", v9);
  -[MSPublisher _updateMasterManifest](self, "_updateMasterManifest");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MSPublisher_enqueueAssetCollections_outError___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  return 1;
}

- (BOOL)dequeueAssetCollectionWithGUIDs:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  MSPublisher *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    -[MSCupidStateMachine personID](self, "personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v6;
    v33 = 2112;
    v34 = v8;
    v35 = 2114;
    v36 = (uint64_t)v5;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ dequeuing asset collections: %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self;
  -[MSObjectQueue allObjectWrappersMaxCount:](self->_uploadQueue, "allObjectWrappersMaxCount:", 0x7FFFFFFFFFFFFFFFLL);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v16, "object");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "assetCollectionID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (objc_msgSend(v9, "containsObject:", v18))
          {
            objc_msgSend(v10, "addObject:", v16);
            objc_msgSend(v9, "removeObject:", v18);
            if (!objc_msgSend(v9, "count"))
            {

              goto LABEL_15;
            }
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_15:

  if (objc_msgSend(v10, "count"))
  {
    -[MSObjectQueue removeObjectWrappersFromQueue:](v24->_uploadQueue, "removeObjectWrappersFromQueue:", v10);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_opt_class();
      v20 = v19;
      -[MSCupidStateMachine personID](v24, "personID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138543874;
      v32 = v19;
      v33 = 2112;
      v34 = v21;
      v35 = 2048;
      v36 = v22;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ removed %lu asset collections from upload queue", buf, 0x20u);

    }
  }

  return 1;
}

- (void)computeHashForAsset:(id)a3
{
  -[MSPublishStorageProtocol computeHashForAsset:](self->_storageProtocol, "computeHashForAsset:", a3);
}

- (void)_refreshServerSideConfiguredParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *maxSizeByUTI;
  unint64_t v19;
  const __CFString *v20;
  void *v21;
  NSMutableDictionary *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  MSPublisher *v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  NSMutableDictionary *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[MSCupidStateMachine personID](self, "personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_publishTargetByteCount = +[MSServerSideConfigManager longLongValueForParameter:forPersonID:defaultValue:](MSServerSideConfigManager, "longLongValueForParameter:forPersonID:defaultValue:", CFSTR("mme.streams.client.pubUploadBatchTargetSize"), v3, 5242880);

  -[MSCupidStateMachine personID](self, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_publishBatchSize = +[MSServerSideConfigManager intValueForParameter:forPersonID:defaultValue:](MSServerSideConfigManager, "intValueForParameter:forPersonID:defaultValue:", CFSTR("mme.streams.client.pubMaxUploadBatchCount"), v4, 1);

  -[MSCupidStateMachine personID](self, "personID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self;
  self->_maxErrorCount = +[MSServerSideConfigManager intValueForParameter:forPersonID:defaultValue:](MSServerSideConfigManager, "intValueForParameter:forPersonID:defaultValue:", CFSTR("mme.streams.client.pubMaxErrorRetryCount"), v5, 3);

  if (_refreshServerSideConfiguredParameters_once != -1)
    dispatch_once(&_refreshServerSideConfiguredParameters_once, &__block_literal_global);
  -[MSCupidStateMachine personID](self, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSServerSideConfigManager objectForKey:forPersonID:defaultValue:](MSServerSideConfigManager, "objectForKey:forPersonID:defaultValue:", CFSTR("supportedAssets"), v6, _refreshServerSideConfiguredParameters_defaultSupportedAssetTypes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeAllObjects](v28->_maxSizeByUTI, "removeAllObjects");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v27 = v7;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      v11 = CFSTR("assetType");
      v12 = 0x1E0CB3000uLL;
      do
      {
        v13 = 0;
        v29 = v9;
        do
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "objectForKey:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "objectForKey:", CFSTR("maxFileSizeMB"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v17 = objc_msgSend(v16, "longLongValue");
                maxSizeByUTI = v28->_maxSizeByUTI;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17 << 20);
                v19 = v12;
                v20 = v11;
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = maxSizeByUTI;
                v9 = v29;
                -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v21, v15);

                v11 = v20;
                v12 = v19;
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v36 = CFSTR("maxFileSizeMB");
                _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Server-side configuration key %{public}@ cannot be parsed as a number.", buf, 0xCu);
              }

            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v36 = v11;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Server-side configuration key %{public}@ is not a string.", buf, 0xCu);
            }

          }
          ++v13;
        }
        while (v9 != v13);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v9);
    }

    v7 = v27;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v36 = CFSTR("supportedAssets");
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Server-side configuration key %{public}@ does not contain an array.", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v23 = (__CFString *)objc_opt_class();
    v24 = v23;
    -[MSCupidStateMachine personID](v28, "personID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v28->_maxSizeByUTI;
    *(_DWORD *)buf = 138543874;
    v36 = v23;
    v37 = 2112;
    v38 = v25;
    v39 = 2114;
    v40 = v26;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ _maxSizeByUTI: %{public}@", buf, 0x20u);

  }
}

- (void)_serverSideConfigurationDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3978];
  v14 = a3;
  objc_msgSend(v4, "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v14, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", CFSTR("personID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCupidStateMachine personID](self, "personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_opt_class();
        v12 = v11;
        -[MSCupidStateMachine personID](self, "personID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v11;
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Server-side configuration has changed. Reading new values.", buf, 0x16u);

      }
      -[MSPublisher _refreshServerSideConfiguredParameters](self, "_refreshServerSideConfiguredParameters");
    }
  }
  else
  {
    -[MSPublisher performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__serverSideConfigurationDidChange_, v14, 0);

  }
}

- (void)_registerAsset:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setFileHash:", 0);
  objc_msgSend(v4, "setProtocolFileSize:", 0);
  -[MSPublishStorageProtocol computeHashForAsset:](self->_storageProtocol, "computeHashForAsset:", v4);

}

- (void)_registerAllAssetsForWrapper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPublisher _didFinishUsingAssetCollections:](self, "_didFinishUsingAssetCollections:", v5);

  objc_msgSend(v4, "masterAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPublisher _registerAsset:](self, "_registerAsset:", v6);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v4, "derivedAssets", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[MSPublisher _registerAsset:](self, "_registerAsset:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_quarantineOrDiscardWrappers:(id)a3 withError:(id)a4
{
  id v5;
  double Current;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const char *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    v11 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v13, "object");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "initialFailureDate");
        if (v15 >= 1 && (unint64_t)((uint64_t)Current - v15) >= 0x93A81)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v23 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v34 = v23;
            v35 = 2114;
            v36 = v14;
            v24 = v23;
            _os_log_error_impl(&dword_1D3E94000, v11, OS_LOG_TYPE_ERROR, "%{public}@ - quarantine for %{public}@ has been there for too long. Better to just abandon", buf, 0x16u);

          }
          v21 = v27;
          v22 = v14;
        }
        else
        {
          v17 = v15;
          if (!v15)
            objc_msgSend(v14, "setInitialFailureDate:", (uint64_t)Current);
          objc_msgSend(v13, "setErrorCount:", 0);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v18 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v19 = ", again";
            if (!v17)
              v19 = " for the first time";
            v34 = v18;
            v35 = 2114;
            v36 = v14;
            v37 = 2082;
            v38 = v19;
            v20 = v18;
            _os_log_impl(&dword_1D3E94000, v11, OS_LOG_TYPE_INFO, "%{public}@ - putting %{public}@ in quarantine%{public}s.", buf, 0x20u);

          }
          v21 = v7;
          v22 = v13;
        }
        objc_msgSend(v21, "addObject:", v22);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "count"))
    -[MSObjectQueue appendObjectWrappers:](self->_quarantinedQueue, "appendObjectWrappers:", v7);
  if (objc_msgSend(v27, "count"))
  {
    -[MSPublisher _didFinishUsingAssetCollections:](self, "_didFinishUsingAssetCollections:", v27);
    -[MSPublisherDelegate publisher:didEncounterError:publishingAssetCollections:](self->_delegate, "publisher:didEncounterError:publishingAssetCollections:", self, v25, v27);
  }

}

- (BOOL)_verifyAssetFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = 0;
LABEL_4:
    v6 = 1;
    goto LABEL_5;
  }
  if (!v4)
  {
    v6 = 1;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, 0);
LABEL_5:

LABEL_6:
  return v6;
}

- (id)_collectionWithNoDerivatives:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "masterAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSAssetCollection collectionWithMasterAsset:fileName:](MSAssetCollection, "collectionWithMasterAsset:fileName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "assetCollectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setAssetCollectionID:", v7);

  return v6;
}

- (id)_checkAssetCollectionFiles:(id)a3
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
  id v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "masterAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MSPublisher _verifyAssetFile:](self, "_verifyAssetFile:", v5))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v4;
      v14 = v23;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %{public}@ has disappeared.", buf, 0x16u);

    }
    v13 = 0;
LABEL_21:
    v7 = v4;
    goto LABEL_22;
  }
  objc_msgSend(v4, "assetCollectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v4;
      v7 = v23;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %{public}@ has lost his collection ID.", buf, 0x16u);
LABEL_19:

    }
    -[MSPublisher _collectionWithNoDerivatives:](self, "_collectionWithNoDerivatives:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "derivedAssets", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (!-[MSPublisher _verifyAssetFile:](self, "_verifyAssetFile:", v12))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v15 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v23 = v15;
            v24 = 2114;
            v25 = v12;
            v26 = 2114;
            v27 = v4;
            v16 = v15;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %{public}@ for %{public}@ has disappeared. Will have to recompute derivatives.", buf, 0x20u);

          }
          goto LABEL_19;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = v4;
LABEL_22:

  return v13;
}

- (id)_checkObjectWrappers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "object", (_QWORD)v20);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "size"))
        {
          -[MSPublisher _checkAssetCollectionFiles:](self, "_checkAssetCollectionFiles:", v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = v13;
        }
        v15 = v14;
        if (!v14)
          goto LABEL_12;
        if (v14 != v13)
        {
          +[MSObjectWrapper wrapperWithObject:size:](MSObjectWrapper, "wrapperWithObject:size:", v14, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

LABEL_12:
          v9 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v5, "addObject:", v12);
LABEL_14:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (!v8)
      {

        v17 = v5;
        if ((v9 & 1) != 0)
          goto LABEL_20;
        goto LABEL_19;
      }
    }
  }

LABEL_19:
  v17 = v6;
LABEL_20:
  v18 = v17;

  return v18;
}

- (void)reenqueueQuarantinedAssetCollections
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  char v20;
  void *context;
  MSPublisher *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[MSObjectQueue allObjectWrappersMaxCount:](self->_quarantinedQueue, "allObjectWrappersMaxCount:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v3, "count"))
  {
    v20 = 0;
    v5 = MEMORY[0x1E0C81028];
    v22 = self;
    do
    {
      context = (void *)MEMORY[0x1D8255C20]();
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v7 = v3;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
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
            objc_msgSend(v12, "object");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "assetCollectionID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              if (objc_msgSend(v4, "containsObject:", v14))
              {
                if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
                {
                  v15 = (void *)objc_opt_class();
                  *(_DWORD *)buf = 138543618;
                  v28 = v15;
                  v29 = 2114;
                  v30 = (uint64_t)v14;
                  v16 = v15;
                  _os_log_error_impl(&dword_1D3E94000, v5, OS_LOG_TYPE_ERROR, "%{public}@ - discarding a collection with identifier %{public}@ that was quarantined too many times.", buf, 0x16u);

                }
              }
              else
              {
                objc_msgSend(v4, "addObject:", v14);
                objc_msgSend(v6, "addObject:", v12);
              }
            }

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v9);
      }

      -[MSObjectQueue removeObjectWrappersFromQueue:](v22->_quarantinedQueue, "removeObjectWrappersFromQueue:", v7);
      if (objc_msgSend(v6, "count"))
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)objc_opt_class();
          v18 = v17;
          v19 = objc_msgSend(v6, "count");
          *(_DWORD *)buf = 138543618;
          v28 = v17;
          v29 = 2048;
          v30 = v19;
          _os_log_impl(&dword_1D3E94000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - reenqueuing %ld quarantined collections.", buf, 0x16u);

        }
        -[MSObjectQueue appendObjectWrappers:](v22->_uploadQueue, "appendObjectWrappers:", v6);
        v20 = 1;
      }
      -[MSObjectQueue allObjectWrappersMaxCount:](v22->_quarantinedQueue, "allObjectWrappersMaxCount:", 10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(context);
    }
    while (objc_msgSend(v3, "count"));
    if ((v20 & 1) != 0)
      -[MSPublisher _updateMasterManifest](v22, "_updateMasterManifest");
  }

}

- (BOOL)_isAllowedToUpload
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL result;
  _BOOL4 v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MSPlatform();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "policyMayUpload") & 1) != 0)
  {
    -[MSCupidStateMachine _latestNextActivityDate](self, "_latestNextActivityDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "compare:", v5);

    if (v6 != 1)
      return 1;
  }
  else
  {

  }
  v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v8)
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    -[MSCupidStateMachine personID](self, "personID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not uploading at this time.", (uint8_t *)&v12, 0x16u);

    return 0;
  }
  return result;
}

- (void)publish
{
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[MSCupidStateMachine hasDeactivated](self, "hasDeactivated"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_opt_class();
      -[MSCupidStateMachine personID](self, "personID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543618;
      v7 = v3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not publishing because we're shutting down.", (uint8_t *)&v6, 0x16u);

    }
  }
  else
  {
    switch(self->_state)
    {
      case 0:
      case 1:
        if (-[MSPublisher _isAllowedToUpload](self, "_isAllowedToUpload"))
        {
          -[MSDaemon retainBusy](self->_daemon, "retainBusy");
          v5 = 2;
          goto LABEL_17;
        }
        break;
      case 2:
        -[MSPublisher _requestDerivatives](self, "_requestDerivatives");
        break;
      case 4:
        if (-[MSPublisher _isAllowedToUpload](self, "_isAllowedToUpload"))
        {
          -[MSDaemon retainBusy](self->_daemon, "retainBusy");
          v5 = 5;
          goto LABEL_17;
        }
        break;
      case 5:
        -[MSPublisher _sendMetadataToStreams](self, "_sendMetadataToStreams");
        break;
      case 7:
        if (-[MSPublisher _isAllowedToUpload](self, "_isAllowedToUpload"))
        {
          -[MSDaemon retainBusy](self->_daemon, "retainBusy");
          v5 = 8;
          goto LABEL_17;
        }
        break;
      case 8:
        -[MSPublisher _sendFilesToMMCS](self, "_sendFilesToMMCS");
        break;
      case 0xA:
        if (-[MSPublisher _isAllowedToUpload](self, "_isAllowedToUpload"))
        {
          -[MSDaemon retainBusy](self->_daemon, "retainBusy");
          v5 = 11;
LABEL_17:
          self->_state = v5;
          -[MSPublisher publish](self, "publish");
        }
        break;
      case 0xB:
        -[MSPublisher _sendUploadComplete](self, "_sendUploadComplete");
        break;
      default:
        return;
    }
  }
}

- (void)_requestDerivatives
{
  MSPublisher *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  MSObjectQueue *derivativesQueue;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSArray *pendingDerivativesQueue;
  void *v42;
  MSPublisher *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  MSPublisher *v50;
  _QWORD block[5];
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v2 = self;
  v59 = *MEMORY[0x1E0C80C00];
  -[MSObjectQueue smallestObjectWrappersTargetTotalSize:maxCount:](self->_uploadQueue, "smallestObjectWrappersTargetTotalSize:maxCount:", 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v2->_state = 4;
    -[MSDaemon releaseBusy](v2->_daemon, "releaseBusy");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__MSPublisher__requestDerivatives__block_invoke;
    block[3] = &unk_1E95BCED0;
    block[4] = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[MSObjectQueue objectWrappersWithZeroSizeMaxCount:](v2->_uploadQueue, "objectWrappersWithZeroSizeMaxCount:", v2->_publishBatchSize);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_opt_class();
        v8 = v7;
        -[MSCupidStateMachine personID](v2, "personID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v7;
        v55 = 2112;
        v56 = v9;
        v57 = 2048;
        v58 = objc_msgSend(v5, "count");
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Requesting derivatives for %ld files.", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __34__MSPublisher__requestDerivatives__block_invoke_44;
      v48[3] = &unk_1E95BA910;
      v11 = v10;
      v49 = v11;
      v50 = v2;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v48);
      -[MSObjectQueue removeObjectWrappersFromQueue:](v2->_uploadQueue, "removeObjectWrappersFromQueue:", v5);
      if (objc_msgSend(v11, "count"))
      {
        v12 = (void *)objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v12, "removeObjectsAtIndexes:", v11);

        v13 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v13, "removeObjectsAtIndexes:", v11);

        v6 = v13;
        v5 = v12;
      }
      -[MSObjectQueue appendObjectWrappers:](v2->_derivativesQueue, "appendObjectWrappers:", v5);
      objc_storeStrong((id *)&v2->_pendingDerivativesQueue, v5);

      v14 = v5;
    }
    else
    {
      v42 = v6;
      -[MSObjectQueue allObjectWrappersOrderedByDescendingErrorCountMaxCount:](v2->_derivativesQueue, "allObjectWrappersOrderedByDescendingErrorCountMaxCount:", 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "count"))
      {
        v15 = MEMORY[0x1E0C81028];
        v43 = v2;
        while (1)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v17 = v14;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v45;
            while (2)
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v45 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
                v23 = objc_msgSend(v22, "errorCount");
                if (v23 <= 2)
                {
                  v28 = v23;
                  objc_msgSend(v22, "setErrorCount:", (v23 + 1));
                  v2 = v43;
                  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                  {
                    v29 = (void *)objc_opt_class();
                    v30 = v29;
                    objc_msgSend(v22, "object");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v54 = v29;
                    v55 = 2114;
                    v56 = v31;
                    v57 = 1024;
                    LODWORD(v58) = v28;
                    _os_log_impl(&dword_1D3E94000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Retrying to get derivative for %{public}@ (error count: %i)", buf, 0x1Cu);

                  }
                  derivativesQueue = v43->_derivativesQueue;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v22);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MSObjectQueue commitErrorCountsForObjectWrappers:](derivativesQueue, "commitErrorCountsForObjectWrappers:", v33);

                  v27 = v22;
                  goto LABEL_26;
                }
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  v24 = (void *)objc_opt_class();
                  v25 = v24;
                  objc_msgSend(v22, "object");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v54 = v24;
                  v55 = 2114;
                  v56 = v26;
                  _os_log_error_impl(&dword_1D3E94000, v15, OS_LOG_TYPE_ERROR, "%{public}@ - unable to generate derivatives for %{public}@ safely.", buf, 0x16u);

                }
                objc_msgSend(v16, "addObject:", v22);
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              if (v19)
                continue;
              break;
            }
            v27 = 0;
            v2 = v43;
          }
          else
          {
            v27 = 0;
          }
LABEL_26:

          if (objc_msgSend(v16, "count"))
            -[MSObjectQueue removeObjectWrappersFromQueue:](v2->_derivativesQueue, "removeObjectWrappersFromQueue:", v16);
          if (v27)
            break;
          -[MSObjectQueue allObjectWrappersOrderedByDescendingErrorCountMaxCount:](v2->_derivativesQueue, "allObjectWrappersOrderedByDescendingErrorCountMaxCount:", 5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v14, "count"))
            goto LABEL_30;
        }

        v37 = (void *)MEMORY[0x1E0C99D20];
        objc_msgSend(v27, "object");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "arrayWithObject:", v38);
        v39 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v27);
        v40 = objc_claimAutoreleasedReturnValue();
        pendingDerivativesQueue = v2->_pendingDerivativesQueue;
        v2->_pendingDerivativesQueue = (NSArray *)v40;

        v6 = (void *)v39;
        v14 = v17;
      }
      else
      {
LABEL_30:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v34 = (void *)objc_opt_class();
          v35 = v34;
          -[MSCupidStateMachine personID](v2, "personID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v34;
          v55 = 2112;
          v56 = v36;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ No more derivatives to request.", buf, 0x16u);

        }
        v6 = v42;
      }
    }
    -[MSPublisher _updateMasterManifest](v2, "_updateMasterManifest");
    if (objc_msgSend(v6, "count"))
    {
      v2->_state = 3;
      -[MSPublisherDelegate publisher:didRequestSubmissionOfAssetCollections:](v2->_delegate, "publisher:didRequestSubmissionOfAssetCollections:", v2, v6);
    }
    else
    {
      v2->_state = 0;
      -[MSDaemon releaseBusy](v2->_daemon, "releaseBusy");
    }

  }
}

- (void)_addAssetToFileHashMap:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *fileHashToAssetMap;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "fileHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    fileHashToAssetMap = self->_fileHashToAssetMap;
    objc_msgSend(v4, "fileHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](fileHashToAssetMap, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_fileHashToAssetMap;
      objc_msgSend(v4, "fileHash");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v8, v10);

    }
    objc_msgSend(v8, "addObject:", v4);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    -[MSCupidStateMachine personID](self, "personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ No file hash for asset %{public}@", (uint8_t *)&v14, 0x20u);

  }
}

- (void)_removeAssetFromFileHashMap:(id)a3
{
  id v4;
  NSMutableDictionary *fileHashToAssetMap;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = a3;
  fileHashToAssetMap = self->_fileHashToAssetMap;
  v10 = v4;
  objc_msgSend(v4, "fileHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](fileHashToAssetMap, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "MSRemoveOneObjectByPointerComparison:", v10);
    if (!objc_msgSend(v7, "count"))
    {
      v8 = self->_fileHashToAssetMap;
      objc_msgSend(v10, "fileHash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

    }
  }

}

- (void)_removeAssetsInAssetCollectionWrappersFromAssetMap:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v4), "object");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "masterAsset");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fileHash");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          -[NSMutableDictionary removeObjectForKey:](self->_fileHashToAssetMap, "removeObjectForKey:", v7);
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v5, "derivedAssets");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "fileHash");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13)
                -[NSMutableDictionary removeObjectForKey:](self->_fileHashToAssetMap, "removeObjectForKey:", v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v10);
        }

        ++v4;
      }
      while (v4 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

}

- (void)_didFinishUsingAssetCollections:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "masterAsset", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        objc_msgSend(v11, "derivedAssets");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[MSPublishStorageProtocol didFinishUsingAssets:](self->_storageProtocol, "didFinishUsingAssets:", v5);
}

- (void)submitAssetCollectionsForPublication:(id)a3 skipAssetCollections:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  MSPublisherDelegate *delegate;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t i;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  uint64_t v83;
  NSArray *pendingDerivativesQueue;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  id obj;
  MSPublisher *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  _QWORD block[5];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t v110[128];
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  void *v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v89 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[MSCupidStateMachine personID](self, "personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v112 = v7;
    v113 = 2112;
    v114 = v9;
    v115 = 2048;
    v116 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Submitting %ld asset collections for publication.", buf, 0x20u);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v85 = (void *)objc_opt_class();
    v86 = v85;
    -[MSCupidStateMachine personID](self, "personID");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v89, "count");
    *(_DWORD *)buf = 138543874;
    v112 = v85;
    v113 = 2112;
    v114 = v87;
    v115 = 2048;
    v116 = v88;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ ...skipping %ld asset collections.", buf, 0x20u);

  }
  -[MSPublisher _didFinishUsingAssetCollections:](self, "_didFinishUsingAssetCollections:", v89);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  obj = v6;
  v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
  if (v99)
  {
    v10 = MEMORY[0x1E0C81028];
    v98 = *(_QWORD *)v107;
    v97 = self;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v107 != v98)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v11);
        objc_msgSend(v12, "masterAsset");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v12;
        if (!v14
          || (-[NSMutableDictionary objectForKey:](self->_maxSizeByUTI, "objectForKey:", v14),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              !v15))
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v55 = (void *)objc_opt_class();
            v56 = v55;
            -[MSCupidStateMachine personID](self, "personID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v112 = v55;
            v113 = 2112;
            v114 = v57;
            v115 = 2114;
            v116 = (uint64_t)v14;
            v117 = 2114;
            v118 = (uint64_t)v12;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The UTI for “%{public}@” is not accepted by the server. Asset collection: %{public}@", buf, 0x2Au);

            v10 = MEMORY[0x1E0C81028];
          }
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v26 = (void *)MEMORY[0x1E0CB3940];
          v22 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_UTI_REJECTED_P_UTI"));
          objc_msgSend(v26, "stringWithFormat:", v22, v14);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "MSErrorWithDomain:code:description:", CFSTR("MSPublisherErrorDomain"), 4, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_24;
        }
        -[NSMutableDictionary objectForKey:](self->_maxSizeByUTI, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "longLongValue");

        v18 = objc_msgSend(v13, "_fileSize");
        v19 = -[MSPublisher publishStorageProtocol:didRequestFDForAsset:](self, "publishStorageProtocol:didRequestFDForAsset:", 0, v13);
        v20 = objc_msgSend(v13, "_fileSizeOnDisk");
        -[MSPublisher publishStorageProtocol:didFinishUsingFD:forAsset:](self, "publishStorageProtocol:didFinishUsingFD:forAsset:", 0, v19, v13);
        if (!v20)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v60 = (void *)objc_opt_class();
            v61 = v60;
            -[MSCupidStateMachine personID](self, "personID");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v112 = v60;
            v113 = 2112;
            v114 = v62;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The master asset has zero size. Rejecting upload.", buf, 0x16u);

            v10 = MEMORY[0x1E0C81028];
          }
          v29 = (void *)MEMORY[0x1E0CB35C8];
          v22 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_ASSET_ZERO_SIZE"));
          v23 = v29;
          v24 = 5;
          goto LABEL_23;
        }
        if (v18 > v17)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v66 = (void *)objc_opt_class();
            v67 = v66;
            -[MSCupidStateMachine personID](self, "personID");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "masterAsset");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v112 = v66;
            v113 = 2112;
            v114 = v68;
            v115 = 2048;
            v116 = v18;
            v117 = 2048;
            v118 = v17;
            v119 = 2114;
            v120 = v69;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The master asset has size %lld, which is larger than the maximum allowed %lld. %{public}@", buf, 0x34u);

            self = v97;
            v10 = MEMORY[0x1E0C81028];

          }
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_ASSET_TOO_LARGE"));
          v23 = v21;
          v24 = 6;
LABEL_23:
          objc_msgSend(v23, "MSErrorWithDomain:code:description:", CFSTR("MSPublisherErrorDomain"), v24, v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
          v30 = 0;
          goto LABEL_25;
        }
        objc_msgSend(v13, "fileHash");
        v34 = objc_claimAutoreleasedReturnValue();
        if (!v34)
          goto LABEL_49;
        v35 = (void *)v34;
        objc_msgSend(v13, "metadata");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKey:", CFSTR("MSAssetMetadataSHA1HashKey"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          objc_msgSend(v12, "derivedAssets");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
          if (v94)
          {
            v93 = *(_QWORD *)v103;
            v90 = v18;
            v30 = v18;
            v91 = v17;
            while (2)
            {
              for (i = 0; i != v94; ++i)
              {
                if (*(_QWORD *)v103 != v93)
                  objc_enumerationMutation(v22);
                v39 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
                objc_msgSend(v39, "fileHash");
                v40 = objc_claimAutoreleasedReturnValue();
                if (!v40)
                  goto LABEL_41;
                v41 = (void *)v40;
                objc_msgSend(v39, "metadata");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "objectForKey:", CFSTR("MSAssetMetadataSHA1HashKey"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v43)
                {
LABEL_41:
                  self = v97;
                  -[MSPublishStorageProtocol computeHashForAsset:](v97->_storageProtocol, "computeHashForAsset:", v39);
                  objc_msgSend(v39, "fileHash");
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (!v44)
                    goto LABEL_69;
                  v45 = (void *)v44;
                  objc_msgSend(v39, "metadata");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "objectForKey:", CFSTR("MSAssetMetadataSHA1HashKey"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  self = v97;
                  if (!v47)
                  {
LABEL_69:
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      v74 = (void *)objc_opt_class();
                      v75 = v74;
                      -[MSCupidStateMachine personID](v97, "personID");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v112 = v74;
                      v113 = 2112;
                      v114 = v76;
                      v115 = 2114;
                      v116 = (uint64_t)v39;
                      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Could not compute hash for derived asset %{public}@. Rejecting asset from publication.", buf, 0x20u);

                      self = v97;
                    }
                    v58 = (void *)MEMORY[0x1E0CB35C8];
                    v59 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_CANNOT_COMPUTE_HASH"));
                    objc_msgSend(v58, "MSErrorWithDomain:code:description:", CFSTR("MSPublisherErrorDomain"), 3, v59);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_63;
                  }
                  v48 = objc_msgSend(v39, "_fileSize");
                  v95 = -[MSPublisher publishStorageProtocol:didRequestFDForAsset:](v97, "publishStorageProtocol:didRequestFDForAsset:", 0, v39);
                  v49 = objc_msgSend(v39, "_fileSizeOnDisk");
                  -[MSPublisher publishStorageProtocol:didFinishUsingFD:forAsset:](v97, "publishStorageProtocol:didFinishUsingFD:forAsset:", 0, v95, v39);
                  if (!v49)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      v77 = (void *)objc_opt_class();
                      v78 = v77;
                      -[MSCupidStateMachine personID](v97, "personID");
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v112 = v77;
                      v113 = 2112;
                      v114 = v79;
                      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The asset has zero size. Rejecting upload.", buf, 0x16u);

                    }
                    v63 = (void *)MEMORY[0x1E0CB35C8];
                    v59 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_ASSET_ZERO_SIZE"));
                    v64 = v63;
                    v65 = 5;
                    goto LABEL_62;
                  }
                  if (v48 > v91)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      v80 = (void *)objc_opt_class();
                      v81 = v80;
                      -[MSCupidStateMachine personID](v97, "personID");
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544386;
                      v112 = v80;
                      v113 = 2112;
                      v114 = v82;
                      v115 = 2048;
                      v116 = v90;
                      v117 = 2048;
                      v118 = v91;
                      v119 = 2114;
                      v120 = v39;
                      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The asset has size %lld, which is larger than the maximum allowed %lld. %{public}@", buf, 0x34u);

                    }
                    v70 = (void *)MEMORY[0x1E0CB35C8];
                    v59 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_ASSET_TOO_LARGE"));
                    v64 = v70;
                    v65 = 6;
LABEL_62:
                    objc_msgSend(v64, "MSErrorWithDomain:code:description:", CFSTR("MSPublisherErrorDomain"), v65, v59);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    self = v97;
LABEL_63:

                    goto LABEL_64;
                  }
                  v30 += objc_msgSend(v39, "_fileSize");
                }
              }
              v94 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
              if (v94)
                continue;
              break;
            }
            v28 = 0;
            self = v97;
          }
          else
          {
            v28 = 0;
            v30 = v18;
          }
LABEL_64:
          v10 = MEMORY[0x1E0C81028];
        }
        else
        {
LABEL_49:
          v10 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v71 = (void *)objc_opt_class();
            v72 = v71;
            -[MSCupidStateMachine personID](self, "personID");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v112 = v71;
            v113 = 2112;
            v114 = v73;
            v115 = 2114;
            v116 = (uint64_t)v13;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The master asset in the collection does not have a hash. Rejecting from publication: %{public}@", buf, 0x20u);

            v10 = MEMORY[0x1E0C81028];
          }
          v50 = (void *)MEMORY[0x1E0CB35C8];
          v22 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_MISSING_HASH"));
          objc_msgSend(v50, "MSErrorWithDomain:code:description:", CFSTR("MSPublisherErrorDomain"), 2, v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v18;
        }
LABEL_25:

        if (v28)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v51 = (void *)objc_opt_class();
            v52 = v51;
            -[MSCupidStateMachine personID](self, "personID");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "MSVerboseDescription");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v112 = v51;
            v113 = 2112;
            v114 = v53;
            v115 = 2114;
            v116 = (uint64_t)v100;
            v117 = 2114;
            v118 = (uint64_t)v54;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Rejecting asset collection %{public}@\nError: %{public}@", buf, 0x2Au);

            self = v97;
            v10 = MEMORY[0x1E0C81028];

          }
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v100);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSPublisher _didFinishUsingAssetCollections:](self, "_didFinishUsingAssetCollections:", v31);

          delegate = self->_delegate;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v100);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSPublisherDelegate publisher:didEncounterError:publishingAssetCollections:](delegate, "publisher:didEncounterError:publishingAssetCollections:", self, v28, v33);
        }
        else
        {
          +[MSObjectWrapper wrapperWithObject:size:](MSObjectWrapper, "wrapperWithObject:size:", v100, v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "addObject:", v33);
        }

        ++v11;
      }
      while (v11 != v99);
      v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
      v99 = v83;
    }
    while (v83);
  }

  -[MSObjectQueue appendObjectWrappers:](self->_uploadQueue, "appendObjectWrappers:", v92);
  -[MSObjectQueue removeObjectWrappersFromQueue:](self->_derivativesQueue, "removeObjectWrappersFromQueue:", self->_pendingDerivativesQueue);
  pendingDerivativesQueue = self->_pendingDerivativesQueue;
  self->_pendingDerivativesQueue = 0;

  -[MSPublisher _updateMasterManifest](self, "_updateMasterManifest");
  self->_state = 4;
  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MSPublisher_submitAssetCollectionsForPublication_skipAssetCollections___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_sendMetadataToStreams
{
  void *v3;
  id v4;
  void *v5;
  int state;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  _QWORD *v39;
  void *v40;
  id v41;
  int64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD block[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  _BYTE v63[10];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  int64_t v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = v3;
    -[MSCupidStateMachine personID](self, "personID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v63 = v3;
    *(_WORD *)&v63[8] = 2112;
    v64 = (uint64_t)v5;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Sending metadata...", buf, 0x16u);

  }
  state = self->_state;
  if (state == 5)
  {
    -[MSPublisher _removeAssetsInAssetCollectionWrappersFromAssetMap:](self, "_removeAssetsInAssetCollectionWrappersFromAssetMap:", self->_requestAuthQueue);
    -[NSMutableArray removeAllObjects](self->_requestAuthQueue, "removeAllObjects");
    -[MSObjectQueue smallestObjectWrappersTargetTotalSize:maxCount:](self->_uploadQueue, "smallestObjectWrappersTargetTotalSize:maxCount:", self->_publishTargetByteCount, self->_publishBatchSize);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPublisher _checkObjectWrappers:](self, "_checkObjectWrappers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v7)
    {
      -[NSMutableArray addObjectsFromArray:](self->_requestAuthQueue, "addObjectsFromArray:", v7);
      if (-[NSMutableArray count](self->_requestAuthQueue, "count"))
      {
        v45 = v8;
        -[NSMutableDictionary removeAllObjects](self->_fileHashToAssetMap, "removeAllObjects");
        +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", self->_requestAuthQueue);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v52 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_msgSend(v23, "masterAsset");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSPublisher _addAssetToFileHashMap:](self, "_addAssetToFileHashMap:", v24);

              v49 = 0u;
              v50 = 0u;
              v47 = 0u;
              v48 = 0u;
              objc_msgSend(v23, "derivedAssets");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v48;
                do
                {
                  for (j = 0; j != v27; ++j)
                  {
                    if (*(_QWORD *)v48 != v28)
                      objc_enumerationMutation(v25);
                    -[MSPublisher _addAssetToFileHashMap:](self, "_addAssetToFileHashMap:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j));
                  }
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
                }
                while (v27);
              }

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          }
          while (v20);
        }
        self->_state = 6;
        -[MSPublishStreamsProtocol sendMetadataForAssetCollections:](self->_protocol, "sendMetadataForAssetCollections:", v18);

        v8 = v45;
        goto LABEL_48;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v35 = (void *)objc_opt_class();
        v36 = v35;
        -[MSCupidStateMachine personID](self, "personID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v63 = v35;
        *(_WORD *)&v63[8] = 2112;
        v64 = (uint64_t)v37;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ nothing to send.", buf, 0x16u);

      }
      self->_state = 0;
      -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __37__MSPublisher__sendMetadataToStreams__block_invoke_62;
      v46[3] = &unk_1E95BCED0;
      v46[4] = self;
      v38 = MEMORY[0x1E0C80D38];
      v39 = v46;
    }
    else
    {
      v9 = -[MSObjectQueue count](self->_uploadQueue, "count");
      -[MSObjectQueue removeObjectWrappersFromQueue:](self->_uploadQueue, "removeObjectWrappersFromQueue:", v7);
      if (objc_msgSend(v8, "count"))
        -[MSObjectQueue appendObjectWrappers:](self->_uploadQueue, "appendObjectWrappers:", v8);
      v10 = -[MSObjectQueue count](self->_uploadQueue, "count");
      v11 = objc_msgSend(v7, "count") + v10;
      if (v11 <= objc_msgSend(v8, "count") + v9)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v30 = (void *)objc_opt_class();
          v44 = v30;
          v43 = objc_msgSend(v7, "count");
          v31 = objc_msgSend(v8, "count");
          v32 = objc_msgSend(v7, "count");
          v33 = v32 - objc_msgSend(v8, "count");
          v34 = -[MSObjectQueue count](self->_uploadQueue, "count");
          *(_DWORD *)buf = 138544386;
          *(_QWORD *)v63 = v30;
          *(_WORD *)&v63[8] = 2048;
          v64 = v43;
          v65 = 2048;
          v66 = v31;
          v67 = 2048;
          v68 = v33;
          v69 = 2048;
          v70 = v34;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %lu collections changed (kept %lu / lost %ld - total collections in queue after cleaning: %lld).", buf, 0x34u);

        }
      }
      else
      {
        v42 = v10;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v12 = v7;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          v16 = *(_QWORD *)v57;
          do
          {
            for (k = 0; k != v14; ++k)
            {
              if (*(_QWORD *)v57 != v16)
                objc_enumerationMutation(v12);
              if (v15)
                objc_msgSend(v15, "appendFormat:", CFSTR(", %lld"), objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "uniqueID"));
              else
                v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%lld"), objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "uniqueID"));
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
          }
          while (v14);
        }
        else
        {
          v15 = 0;
        }

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v40 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)v63 = v40;
          *(_WORD *)&v63[8] = 2048;
          v64 = v9;
          v65 = 2048;
          v66 = v42;
          v67 = 2114;
          v68 = (uint64_t)v15;
          v41 = v40;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - failed to properly clean up wrappers from queue (before/after count: %lld/%lld). Wrapper ids that were supposed to be removed: (%{public}@)", buf, 0x2Au);

        }
      }
      self->_state = 0;
      -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__MSPublisher__sendMetadataToStreams__block_invoke;
      block[3] = &unk_1E95BCED0;
      block[4] = self;
      v38 = MEMORY[0x1E0C80D38];
      v39 = block;
    }
    dispatch_async(v38, v39);
LABEL_48:

    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v63 = 5;
    *(_WORD *)&v63[4] = 1024;
    *(_DWORD *)&v63[6] = state;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Wrong state detected. Expected %d, actually %d. Not serving message.", buf, 0xEu);
  }
}

- (id)_invalidStreamsResponseErrorUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUT_CONNECTION_INVALID_STREAMS_RESPONSE"));
  if (v3)
    objc_msgSend(v4, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSStreamsPutConnectionErrorDomain"), 1, v5, v3);
  else
    objc_msgSend(v4, "MSErrorWithDomain:code:description:", CFSTR("MSStreamsPutConnectionErrorDomain"), 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)publishStreamsProtocol:(id)a3 didFinishUploadingMetadataResponse:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  int state;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSMutableDictionary *fileHashToAssetMap;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *sendingQueue;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t j;
  void *v50;
  BOOL v51;
  __CFString *v52;
  void *v53;
  MSPublisherDelegate *delegate;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  _BOOL4 v65;
  void *v66;
  int v67;
  void *v68;
  NSMutableArray *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t k;
  void *v74;
  MSMediaStreamDaemon *daemon;
  void *v76;
  int v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  MSMediaStreamDaemon *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t n;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t ii;
  void *v107;
  int v108;
  void *v109;
  id v110;
  void *v111;
  NSMutableArray *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t m;
  void *v117;
  int v118;
  void *v119;
  id v120;
  void *v121;
  uint64_t v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  id v137;
  void *v138;
  id v139;
  id v140;
  uint64_t v141;
  id v142;
  void *v143;
  uint64_t v144;
  MSPublisher *v145;
  id v146;
  void *v147;
  void *v148;
  id v149;
  CFStringRef v150;
  NSMutableArray *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSMutableArray *obj;
  uint64_t obja;
  _QWORD block[5];
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  uint8_t v202[128];
  uint8_t buf[4];
  _BYTE v204[10];
  void *v205;
  __int16 v206;
  uint64_t v207;
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  state = self->_state;
  if (state != 6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v204 = 6;
      *(_WORD *)&v204[4] = 1024;
      *(_DWORD *)&v204[6] = state;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Wrong state detected. Expected %d, actually %d. Not serving message.", buf, 0xEu);
    }
    goto LABEL_150;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v59 = (void *)objc_opt_class();
    v60 = v59;
    -[MSCupidStateMachine personID](self, "personID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v204 = v59;
    *(_WORD *)&v204[8] = 2112;
    v205 = v61;
    v206 = 2114;
    v207 = (uint64_t)v9;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ received metadata upload response: %{public}@", buf, 0x20u);

  }
  v145 = self;
  if (v10)
    goto LABEL_55;
  objc_msgSend(v9, "objectForKey:", CFSTR("assets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v58 = (void *)MEMORY[0x1E0CB35C8];
    v30 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_PUT_CONNECTION_INVALID_ASSET_HASH"));
    objc_msgSend(v58, "MSErrorWithDomain:code:description:", CFSTR("MSStreamsPutConnectionErrorDomain"), 3, v30);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[MSPublisher _invalidStreamsResponseErrorUnderlyingError:](self, "_invalidStreamsResponseErrorUnderlyingError:", v33);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  v136 = v9;
  v139 = v8;
  v192 = 0u;
  v193 = 0u;
  v190 = 0u;
  v191 = 0u;
  v143 = v12;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v190, v202, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v191;
    v17 = MEMORY[0x1E0C81028];
    v146 = v13;
    v144 = *(_QWORD *)v191;
    do
    {
      v18 = 0;
      v149 = (id)v15;
      do
      {
        if (*(_QWORD *)v191 != v16)
          objc_enumerationMutation(v13);
        v152 = v18;
        v19 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * v18);
        objc_msgSend(v13, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          fileHashToAssetMap = v145->_fileHashToAssetMap;
          objc_msgSend(v19, "MSHexData");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](fileHashToAssetMap, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v188 = 0u;
          v189 = 0u;
          v186 = 0u;
          v187 = 0u;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v186, v201, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v187;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v187 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * i);
                objc_msgSend(v29, "setMMCSAccessHeader:", v20);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)v204 = v29;
                  _os_log_debug_impl(&dword_1D3E94000, v17, OS_LOG_TYPE_DEBUG, "Setting MMCS header in asset %{public}@", buf, 0xCu);
                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v186, v201, 16);
            }
            while (v26);
          }

          v13 = v146;
          v15 = (uint64_t)v149;
          v16 = v144;
        }

        v18 = v152 + 1;
      }
      while (v152 + 1 != v15);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v190, v202, 16);
    }
    while (v15);
  }

  objc_msgSend(v9, "objectForKey:", CFSTR("mmcsurl"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  self = v145;
  if (v30)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      v62 = (void *)MEMORY[0x1E0CB35C8];
      v150 = MSCFCopyLocalizedString(CFSTR("ERROR_PUT_CONNECTION_INVALID_STORAGE_URL"));
      objc_msgSend(v62, "MSErrorWithDomain:code:description:", CFSTR("MSStreamsPutConnectionErrorDomain"), 4);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSPublisher _invalidStreamsResponseErrorUnderlyingError:](v145, "_invalidStreamsResponseErrorUnderlyingError:", v53);
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

      v12 = v143;
      v33 = (__CFString *)v150;
      goto LABEL_54;
    }
    v32 = (void *)v31;
    -[MSPublisher setStorageProtocolURL:](v145, "setStorageProtocolURL:", v31);

  }
  v147 = v30;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  obj = v145->_requestAuthQueue;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v182, v200, 16);
  v150 = v33;
  if (!v34)
    goto LABEL_46;
  v35 = v34;
  v36 = *(_QWORD *)v183;
  do
  {
    v37 = 0;
    v153 = v35;
    do
    {
      if (*(_QWORD *)v183 != v36)
        objc_enumerationMutation(obj);
      v38 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * v37);
      objc_msgSend(v38, "object");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "masterAsset");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "MMCSAccessHeader");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      sendingQueue = v33;
      if (v41)
      {
        objc_msgSend(v39, "derivedAssets");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = 0u;
        v179 = 0u;
        v180 = 0u;
        v181 = 0u;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v178, v199, 16);
        if (!v44)
        {

LABEL_43:
          sendingQueue = v145->_sendingQueue;
          goto LABEL_44;
        }
        v45 = v44;
        v46 = v36;
        v47 = *(_QWORD *)v179;
        v48 = 1;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v179 != v47)
              objc_enumerationMutation(v43);
            objc_msgSend(*(id *)(*((_QWORD *)&v178 + 1) + 8 * j), "MMCSAccessHeader");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v50 != 0;

            v48 &= v51;
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v178, v199, 16);
        }
        while (v45);

        v33 = (__CFString *)v150;
        sendingQueue = (void *)v150;
        v36 = v46;
        v35 = v153;
        if ((v48 & 1) != 0)
          goto LABEL_43;
      }
LABEL_44:
      objc_msgSend(sendingQueue, "addObject:", v38);

      ++v37;
    }
    while (v37 != v35);
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v182, v200, 16);
  }
  while (v35);
LABEL_46:

  if (-[__CFString count](v33, "count"))
  {
    self = v145;
    -[MSPublisher _removeAssetsInAssetCollectionWrappersFromAssetMap:](v145, "_removeAssetsInAssetCollectionWrappersFromAssetMap:", v33);
    +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", v33);
    v52 = v33;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPublisher _didFinishUsingAssetCollections:](v145, "_didFinishUsingAssetCollections:", v53);
    delegate = v145->_delegate;
    v55 = (void *)MEMORY[0x1E0CB35C8];
    v56 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_ASSET_REJECTED"));
    objc_msgSend(v55, "MSErrorWithDomain:code:description:", CFSTR("MSPublisherErrorDomain"), 1, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPublisherDelegate publisher:didEncounterError:publishingAssetCollections:](delegate, "publisher:didEncounterError:publishingAssetCollections:", v145, v57, v53);

    -[MSObjectQueue removeObjectWrappersFromQueue:](v145->_uploadQueue, "removeObjectWrappersFromQueue:", v52);
    -[MSPublisher _updateMasterManifest](v145, "_updateMasterManifest");
    v10 = 0;
    v8 = v139;
    v9 = v136;
    v30 = v147;
    goto LABEL_53;
  }
  v10 = 0;
  v8 = v139;
  v9 = v136;
  self = v145;
  v30 = v147;
  v12 = v143;
LABEL_54:

  if (!v10)
  {
    daemon = self->_daemon;
    -[MSCupidStateMachine personID](self, "personID");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMediaStreamDaemon didReceiveAuthenticationSuccessForPersonID:](daemon, "didReceiveAuthenticationSuccessForPersonID:", v76);

    -[MSCupidStateMachine _resetStreamsBackoffTimer](self, "_resetStreamsBackoffTimer");
    -[MSPublisher _removeAssetsInAssetCollectionWrappersFromAssetMap:](self, "_removeAssetsInAssetCollectionWrappersFromAssetMap:", self->_requestAuthQueue);
    if (-[NSMutableArray count](self->_sendingQueue, "count"))
    {
      v77 = 7;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v129 = (void *)objc_opt_class();
        v130 = v129;
        -[MSCupidStateMachine personID](self, "personID");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v204 = v129;
        *(_WORD *)&v204[8] = 2112;
        v205 = v131;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Nothing to upload.", buf, 0x16u);

      }
      v77 = 0;
    }
    self->_state = v77;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__MSPublisher_publishStreamsProtocol_didFinishUploadingMetadataResponse_error___block_invoke;
    block[3] = &unk_1E95BCED0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v10 = 0;
    goto LABEL_149;
  }
LABEL_55:
  if (objc_msgSend(v10, "MSIsTemporaryNetworkError"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v78 = (void *)objc_opt_class();
      v79 = v78;
      -[MSCupidStateMachine personID](self, "personID");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v204 = v78;
      *(_WORD *)&v204[8] = 2112;
      v205 = v80;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Encountered network issues during upload. Will try again later...", buf, 0x16u);

    }
    self->_state = 4;
    goto LABEL_149;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_requestAuthQueue, "count"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v10, "MSIsQuotaError");
  v65 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (!v64)
  {
    if (v65)
    {
      v84 = (void *)objc_opt_class();
      v85 = v84;
      -[MSCupidStateMachine personID](self, "personID");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "MSVerboseDescription");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v204 = v84;
      *(_WORD *)&v204[8] = 2112;
      v205 = v86;
      v206 = 2114;
      v207 = (uint64_t)v87;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Error uploading metadata to Streams server: %{public}@", buf, 0x20u);

    }
    if (objc_msgSend(v10, "MSNeedsBackoff"))
      -[MSCupidStateMachine _backoffStreamsBackoffTimer](self, "_backoffStreamsBackoffTimer");
    if (objc_msgSend(v10, "MSIsCounted"))
    {
      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      v69 = self->_requestAuthQueue;
      v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v158, v194, 16);
      if (v70)
      {
        v71 = v70;
        v72 = *(_QWORD *)v159;
        do
        {
          for (k = 0; k != v71; ++k)
          {
            if (*(_QWORD *)v159 != v72)
              objc_enumerationMutation(v69);
            v74 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * k);
            objc_msgSend(v74, "setErrorCount:", objc_msgSend(v74, "errorCount") + 1);
            if ((int)objc_msgSend(v74, "errorCount") >= self->_maxErrorCount)
              objc_msgSend(v63, "addObject:", v74);
          }
          v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v158, v194, 16);
        }
        while (v71);
      }

      -[MSObjectQueue commitErrorCountsForObjectWrappers:](self->_uploadQueue, "commitErrorCountsForObjectWrappers:", self->_requestAuthQueue);
    }
    goto LABEL_141;
  }
  if (v65)
  {
    v81 = (void *)objc_opt_class();
    v82 = v81;
    -[MSCupidStateMachine personID](self, "personID");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v204 = v81;
    *(_WORD *)&v204[8] = 2112;
    v205 = v83;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Received a quota error.", buf, 0x16u);

  }
  objc_msgSend(v9, "objectForKey:", CFSTR("code"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v138 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_128:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v123 = (void *)objc_opt_class();
      v124 = v123;
      -[MSCupidStateMachine personID](self, "personID");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v204 = v123;
      *(_WORD *)&v204[8] = 2112;
      v205 = v125;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Could not parse the server's response.", buf, 0x16u);

    }
    v164 = 0u;
    v165 = 0u;
    v162 = 0u;
    v163 = 0u;
    v112 = self->_requestAuthQueue;
    v113 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v112, "countByEnumeratingWithState:objects:count:", &v162, v195, 16);
    if (v113)
    {
      v114 = v113;
      v115 = *(_QWORD *)v163;
      do
      {
        for (m = 0; m != v114; ++m)
        {
          if (*(_QWORD *)v163 != v115)
            objc_enumerationMutation(v112);
          v117 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * m);
          objc_msgSend(v117, "setErrorCount:", objc_msgSend(v117, "errorCount") + 1);
          if ((int)objc_msgSend(v117, "errorCount") >= self->_maxErrorCount)
            objc_msgSend(v63, "addObject:", v117);
        }
        v114 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v112, "countByEnumeratingWithState:objects:count:", &v162, v195, 16);
      }
      while (v114);
    }

    -[MSCupidStateMachine _backoffStreamsBackoffTimer](self, "_backoffStreamsBackoffTimer");
    goto LABEL_140;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v126 = (void *)objc_opt_class();
    v127 = v126;
    -[MSCupidStateMachine personID](self, "personID");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v204 = v126;
    *(_WORD *)&v204[8] = 2112;
    v205 = v128;
    v206 = 2114;
    v207 = (uint64_t)v138;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Quota error code: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "objectForKey:", CFSTR("retryafter"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v132 = v66;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = objc_msgSend(v66, "intValue");
    if (v67 < 1)
    {
      -[MSCupidStateMachine _backoffStreamsBackoffTimer](self, "_backoffStreamsBackoffTimer");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSCupidStateMachine _didReceiveStreamsRetryAfterDate:](self, "_didReceiveStreamsRetryAfterDate:", v68);

    }
    v88 = self->_daemon;
    -[MSCupidStateMachine personID](self, "personID");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCupidStateMachine personID](self, "personID");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSPublisher nextActivityDateForPersonID:](MSPublisher, "nextActivityDateForPersonID:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMediaStreamDaemon didExceedPublishQuotaForPersonID:retryDate:](v88, "didExceedPublishQuotaForPersonID:retryDate:", v89, v91);

  }
  if ((objc_msgSend(v138, "isEqualToString:", CFSTR("4034")) & 1) == 0)
  {

    goto LABEL_140;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("assets"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_127:

      goto LABEL_128;
    }
  }
  v137 = v9;
  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v133 = v92;
  v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v174, v198, 16);
  if (v135)
  {
    v134 = *(_QWORD *)v175;
    v140 = v8;
    v142 = v10;
    v148 = v63;
    while (2)
    {
      v93 = 0;
      do
      {
        if (*(_QWORD *)v175 != v134)
          objc_enumerationMutation(v133);
        v94 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v93);
        objc_opt_class();
        self = v145;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v92 = v133;

          v9 = v137;
          goto LABEL_127;
        }
        v141 = v93;
        objc_msgSend(v94, "MSHexData");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = 0u;
        v171 = 0u;
        v172 = 0u;
        v173 = 0u;
        v151 = v145->_requestAuthQueue;
        obja = -[NSMutableArray countByEnumeratingWithState:objects:count:](v151, "countByEnumeratingWithState:objects:count:", &v170, v197, 16);
        if (obja)
        {
          v154 = *(_QWORD *)v171;
          do
          {
            for (n = 0; n != obja; ++n)
            {
              if (*(_QWORD *)v171 != v154)
                objc_enumerationMutation(v151);
              v97 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * n);
              objc_msgSend(v97, "object");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "masterAsset");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "fileHash");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = objc_msgSend(v100, "isEqualToData:", v95);

              if (v101)
              {
                objc_msgSend(v63, "addObject:", v97);
LABEL_118:
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  v109 = (void *)objc_opt_class();
                  v110 = v109;
                  -[MSCupidStateMachine personID](v145, "personID");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)v204 = v109;
                  *(_WORD *)&v204[8] = 2112;
                  v205 = v111;
                  v206 = 2114;
                  v207 = (uint64_t)v98;
                  _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Server reject asset collection because it is too large: %{public}@", buf, 0x20u);

                }
              }
              else
              {
                v168 = 0u;
                v169 = 0u;
                v166 = 0u;
                v167 = 0u;
                objc_msgSend(v98, "derivedAssets");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v166, v196, 16);
                if (v103)
                {
                  v104 = v103;
                  v105 = *(_QWORD *)v167;
                  while (2)
                  {
                    for (ii = 0; ii != v104; ++ii)
                    {
                      if (*(_QWORD *)v167 != v105)
                        objc_enumerationMutation(v102);
                      objc_msgSend(*(id *)(*((_QWORD *)&v166 + 1) + 8 * ii), "fileHash");
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      v108 = objc_msgSend(v107, "isEqualToData:", v95);

                      if (v108)
                      {
                        v63 = v148;
                        objc_msgSend(v148, "addObject:", v97);

                        goto LABEL_118;
                      }
                    }
                    v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v166, v196, 16);
                    if (v104)
                      continue;
                    break;
                  }
                }

                v63 = v148;
              }

            }
            obja = -[NSMutableArray countByEnumeratingWithState:objects:count:](v151, "countByEnumeratingWithState:objects:count:", &v170, v197, 16);
          }
          while (obja);
        }

        v8 = v140;
        v93 = v141 + 1;
        v10 = v142;
      }
      while (v141 + 1 != v135);
      v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v174, v198, 16);
      if (v135)
        continue;
      break;
    }
  }

  v9 = v137;
  self = v145;
LABEL_140:

LABEL_141:
  if (objc_msgSend(v63, "count"))
  {
    -[NSMutableArray removeObjectsInArray:](self->_requestAuthQueue, "removeObjectsInArray:", v63);
    -[MSObjectQueue removeObjectWrappersFromQueue:](self->_uploadQueue, "removeObjectWrappersFromQueue:", v63);
    -[MSObjectQueue commitErrorCountsForObjectWrappers:](self->_uploadQueue, "commitErrorCountsForObjectWrappers:", self->_requestAuthQueue);
    -[MSPublisher _updateMasterManifest](self, "_updateMasterManifest");
    -[MSPublisher _removeAssetsInAssetCollectionWrappersFromAssetMap:](self, "_removeAssetsInAssetCollectionWrappersFromAssetMap:", v63);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v119 = (void *)objc_opt_class();
      v120 = v119;
      -[MSCupidStateMachine personID](self, "personID");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = objc_msgSend(v63, "count");
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v204 = v119;
      *(_WORD *)&v204[8] = 2112;
      v205 = v121;
      v206 = 2048;
      v207 = v122;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Too many errors encountered while uploading %ld asset collections. Aborting.", buf, 0x20u);

    }
    -[MSPublisher _quarantineOrDiscardWrappers:withError:](self, "_quarantineOrDiscardWrappers:withError:", v63, v10);
  }
  if (-[NSMutableArray count](self->_requestAuthQueue, "count"))
    v118 = 4;
  else
    v118 = 1;
  self->_state = v118;

LABEL_149:
  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
LABEL_150:

}

- (void)publishStreamsProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  MSMediaStreamDaemon *daemon;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[MSCupidStateMachine personID](self, "personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found authentication error. Will try again later...", (uint8_t *)&v10, 0x16u);

  }
  -[MSCupidStateMachine _resetStreamsBackoffTimer](self, "_resetStreamsBackoffTimer");
  self->_state = 4;
  daemon = self->_daemon;
  -[MSCupidStateMachine personID](self, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMediaStreamDaemon didReceiveAuthenticationFailureForPersonID:](daemon, "didReceiveAuthenticationFailureForPersonID:", v6);

  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
}

- (void)_sendFilesToMMCS
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  int state;
  MSPublisherDelegate *delegate;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  NSURL *v26;
  void *v27;
  id v28;
  void *v29;
  NSMutableArray *obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  _BYTE v47[10];
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = v3;
    -[MSCupidStateMachine personID](self, "personID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSMutableArray count](self->_sendingQueue, "count");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v47 = v3;
    *(_WORD *)&v47[8] = 2112;
    v48 = v5;
    v49 = 2048;
    v50 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ uploading %ld assets...", buf, 0x20u);

  }
  state = self->_state;
  if (state == 8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      delegate = self->_delegate;
      +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", self->_sendingQueue);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSPublisherDelegate publisher:willPublishAssetCollections:](delegate, "publisher:willPublishAssetCollections:", self, v9);

    }
    self->_sendingQueueCount = -[NSMutableArray count](self->_sendingQueue, "count");
    -[NSMutableDictionary removeAllObjects](self->_fileHashToAssetMap, "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = self->_sendingQueue;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v41;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v41 != v31)
            objc_enumerationMutation(obj);
          v35 = v11;
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v11), "object");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "masterAsset");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addMetadataValue:forKey:", v14, CFSTR("MSAssetMetadataAssetFileTransferUUID"));

          objc_msgSend(v10, "addObject:", v13);
          v33 = v13;
          -[MSPublisher _addAssetToFileHashMap:](self, "_addAssetToFileHashMap:", v13);
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v34 = v12;
          objc_msgSend(v12, "derivedAssets");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v37 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addMetadataValue:forKey:", v21, CFSTR("MSAssetMetadataAssetFileTransferUUID"));

                objc_msgSend(v10, "addObject:", v20);
                -[MSPublisher _addAssetToFileHashMap:](self, "_addAssetToFileHashMap:", v20);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v17);
          }

          v11 = v35 + 1;
        }
        while (v35 + 1 != v32);
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v32);
    }

    self->_state = 9;
    MSPlatform();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      MSPlatform();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSCupidStateMachine personID](self, "personID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "contentURLForPersonID:", v25);
      v26 = (NSURL *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v27 = (void *)objc_opt_class();
          v28 = v27;
          -[MSCupidStateMachine personID](self, "personID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)v47 = v27;
          *(_WORD *)&v47[8] = 2112;
          v48 = v29;
          v49 = 2114;
          v50 = (uint64_t)v26;
          _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Using contentURL %{public}@ from MSPlatform for upload.", buf, 0x20u);

        }
        goto LABEL_29;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get contentURL from MSPlatform. Using URL from metadata for upload", buf, 2u);
      }
    }
    v26 = self->_storageProtocolURL;
LABEL_29:
    -[MSPublishStorageProtocol publishAssets:URL:](self->_storageProtocol, "publishAssets:URL:", v10, v26);

    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v47 = 8;
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = state;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Wrong state detected. Expected %d, actually %d. Not serving message.", buf, 0xEu);
  }
}

- (void)publishStorageProtocol:(id)a3 didFinishUploadingAsset:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
    objc_msgSend(v9, "setError:", v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MSPublisherDelegate publisher:didRequestCloseFileDescriptor:forAsset:](self->_delegate, "publisher:didRequestCloseFileDescriptor:forAsset:", self, 0xFFFFFFFFLL, v9);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    -[MSCupidStateMachine personID](self, "personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSVerboseDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v11;
    v17 = 2112;
    v18 = v13;
    v19 = 2114;
    v20 = v14;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Finished uploading asset. Error: %{public}@", (uint8_t *)&v15, 0x20u);

  }
}

- (int)publishStorageProtocol:(id)a3 didRequestFDForAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "fileData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "fileData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "MSTempFileOutFileName:", &v33);
    v11 = v33;
    if ((_DWORD)v10 == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_opt_class();
        v15 = v14;
        -[MSCupidStateMachine personID](self, "personID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v14;
        v36 = 2112;
        v37 = v16;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Failed to create temp file.", buf, 0x16u);

      }
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v10, 0);
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "writeData:", v9);
        -[NSMutableArray addObject:](self->_tempFiles, "addObject:", v11);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_opt_class();
        v23 = v22;
        -[MSCupidStateMachine personID](self, "personID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v22;
        v36 = 2112;
        v37 = v24;
        v38 = 2112;
        v39 = v11;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Failed to write temp file at path %@.", buf, 0x20u);

      }
    }

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LODWORD(v10) = -[MSPublisherDelegate publisher:didRequestOpenFileDescriptorForAsset:](self->_delegate, "publisher:didRequestOpenFileDescriptorForAsset:", self, v7);
  }
  else
  {
    objc_msgSend(v7, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v26 = (void *)objc_opt_class();
        v27 = v26;
        -[MSCupidStateMachine personID](self, "personID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v26;
        v36 = 2112;
        v37 = v28;
        v38 = 2112;
        v39 = v29;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Opening asset file at path %@...", buf, 0x20u);

      }
      objc_msgSend(v7, "path");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LODWORD(v10) = open((const char *)objc_msgSend(v18, "fileSystemRepresentation"), 0);

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v19 = (void *)objc_opt_class();
        v20 = v19;
        -[MSCupidStateMachine personID](self, "personID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v19;
        v36 = 2112;
        v37 = v21;
        v38 = 1024;
        LODWORD(v39) = v10;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ ... got FD %d.", buf, 0x1Cu);

      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v30 = (void *)objc_opt_class();
        v31 = v30;
        -[MSCupidStateMachine personID](self, "personID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v30;
        v36 = 2112;
        v37 = v32;
        v38 = 2114;
        v39 = v7;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Cannot retrieve file descriptor for asset: %{public}@", buf, 0x20u);

      }
      LODWORD(v10) = -1;
    }
  }

  return v10;
}

- (void)publishStorageProtocol:(id)a3 didFinishUsingFD:(int)a4 forAsset:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v6 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    -[MSCupidStateMachine personID](self, "personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    v18 = 1024;
    v19 = v6;
    v20 = 2114;
    v21 = v9;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Closing FD %d for asset %{public}@", (uint8_t *)&v14, 0x26u);

  }
  objc_msgSend(v9, "fileData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 || (objc_opt_respondsToSelector() & 1) == 0)
    close(v6);
  else
    -[MSPublisherDelegate publisher:didRequestCloseFileDescriptor:forAsset:](self->_delegate, "publisher:didRequestCloseFileDescriptor:forAsset:", self, v6, v9);

}

- (void)_categorizeError:(id)a3 setOutIsIgnorable:(BOOL *)a4 setOutIsCounted:(BOOL *)a5 setOutIsFatal:(BOOL *)a6 setOutNeedsBackoff:(BOOL *)a7 setOutIsTemporary:(BOOL *)a8 setOutIsTokenAuth:(BOOL *)a9 setOutIsAuthError:(BOOL *)a10
{
  id v15;
  int v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  BOOL *v29;
  id v30;

  v15 = a3;
  if (v15)
  {
    v29 = a8;
    v30 = v15;
    v16 = objc_msgSend(v15, "MSCanBeIgnored");
    v17 = objc_msgSend(v30, "MSIsCounted");
    v18 = objc_msgSend(v30, "MSIsFatal");
    v19 = objc_msgSend(v30, "MSNeedsBackoff");
    v20 = objc_msgSend(v30, "MSIsTemporaryNetworkError");
    v21 = objc_msgSend(v30, "MSIsBadTokenError");
    v22 = objc_msgSend(v30, "MSIsAuthError");
    if (a4 && v16)
      *a4 = 1;
    v23 = v17 ^ 1;
    if (!a5)
      v23 = 1;
    if ((v23 & 1) == 0)
      *a5 = 1;
    v24 = v18 ^ 1;
    if (!a6)
      v24 = 1;
    if ((v24 & 1) == 0)
      *a6 = 1;
    v25 = v19 ^ 1;
    if (!a7)
      v25 = 1;
    if ((v25 & 1) == 0)
      *a7 = 1;
    v26 = v20 ^ 1;
    if (!v29)
      v26 = 1;
    if ((v26 & 1) == 0)
      *v29 = 1;
    v27 = v21 ^ 1;
    if (!a9)
      v27 = 1;
    if ((v27 & 1) == 0)
      *a9 = 1;
    v28 = v22 ^ 1;
    if (!a10)
      v28 = 1;
    v15 = v30;
    if ((v28 & 1) == 0)
      *a10 = 1;
  }

}

- (void)publishStorageProtocolDidFinishPublishingAllAssets:(id)a3
{
  int v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t sendingQueueCount;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  char v63;
  void *v64;
  MSMediaStreamDaemon **p_daemon;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  MSMediaStreamDaemon *daemon;
  void *v71;
  MSMediaStreamDaemon *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  unint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  NSMutableArray *obj;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  id v113;
  char *v114;
  NSMutableArray *v115;
  id v116;
  _QWORD block[5];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
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
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int16 v138;
  __int16 v139;
  __int16 v140;
  uint8_t v141[128];
  uint8_t buf[4];
  void *v143;
  __int16 v144;
  uint64_t v145;
  __int16 v146;
  unint64_t v147;
  __int16 v148;
  uint64_t v149;
  __int16 v150;
  uint64_t v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v140 = 0;
  v139 = 0;
  v138 = 0;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  obj = self->_sendingQueue;
  v107 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v134, v155, 16);
  v4 = 0;
  v5 = 0;
  if (v107)
  {
    v105 = *(_QWORD *)v135;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v135 != v105)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)v6), "object");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "masterAsset");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[MSPublisher _categorizeError:setOutIsIgnorable:setOutIsCounted:setOutIsFatal:setOutNeedsBackoff:setOutIsTemporary:setOutIsTokenAuth:setOutIsAuthError:](self, "_categorizeError:setOutIsIgnorable:setOutIsCounted:setOutIsFatal:setOutNeedsBackoff:setOutIsTemporary:setOutIsTokenAuth:setOutIsAuthError:", v9, (char *)&v140 + 1, &v140, (char *)&v139 + 1, &v139, (char *)&v138 + 1, 0, &v138);
        objc_msgSend(v9, "MSMMCSRetryAfterDate");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
          -[MSCupidStateMachine _didReceiveMMCSRetryAfterDate:](self, "_didReceiveMMCSRetryAfterDate:", v10);
        v109 = (void *)v10;
        v111 = v7;
        v114 = v6;
        v4 |= v9 != 0;
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        objc_msgSend(v7, "derivedAssets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v130, v154, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v131;
          v5 = v9;
          do
          {
            v15 = 0;
            v16 = v5;
            do
            {
              if (*(_QWORD *)v131 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * v15), "error");
              v5 = (void *)objc_claimAutoreleasedReturnValue();

              -[MSPublisher _categorizeError:setOutIsIgnorable:setOutIsCounted:setOutIsFatal:setOutNeedsBackoff:setOutIsTemporary:setOutIsTokenAuth:setOutIsAuthError:](self, "_categorizeError:setOutIsIgnorable:setOutIsCounted:setOutIsFatal:setOutNeedsBackoff:setOutIsTemporary:setOutIsTokenAuth:setOutIsAuthError:", v5, (char *)&v140 + 1, &v140, (char *)&v139 + 1, &v139, (char *)&v138 + 1, 0, &v138);
              objc_msgSend(v5, "MSMMCSRetryAfterDate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                -[MSCupidStateMachine _didReceiveMMCSRetryAfterDate:](self, "_didReceiveMMCSRetryAfterDate:", v17);
              v4 |= v5 != 0;

              ++v15;
              v16 = v5;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v130, v154, 16);
          }
          while (v13);
        }
        else
        {
          v5 = v9;
        }

        v6 = v114 + 1;
      }
      while (v114 + 1 != (char *)v107);
      v107 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v134, v155, 16);
    }
    while (v107);
  }

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v18 = self->_tempFiles;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v126, v153, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v127;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v127 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeItemAtPath:error:", v23, 0);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v126, v153, 16);
    }
    while (v20);
  }

  -[NSMutableArray removeAllObjects](self->_tempFiles, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_fileHashToAssetMap, "removeAllObjects");
  v25 = -[NSMutableArray count](self->_sendingQueue, "count");
  sendingQueueCount = self->_sendingQueueCount;
  if (v25 != sendingQueueCount)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v78 = (void *)objc_opt_class();
      v79 = v78;
      -[MSCupidStateMachine personID](self, "personID");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = self->_sendingQueueCount;
      v82 = -[NSMutableArray count](self->_sendingQueue, "count");
      *(_DWORD *)buf = 138544130;
      v143 = v78;
      v144 = 2112;
      v145 = (uint64_t)v80;
      v146 = 2048;
      v147 = v81;
      v148 = 2048;
      v149 = v82;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found mismatch between expecting sending queue count and actual count. Expected %lu, actually %lu.", buf, 0x2Au);

    }
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_SEND_QUEUE_MISMATCH"));
    objc_msgSend(v31, "MSErrorWithDomain:code:description:", CFSTR("MSPublisherErrorDomain"), 8, v32);
    v33 = objc_claimAutoreleasedReturnValue();

    v138 = 0;
    LOBYTE(v139) = 0;
    v5 = (void *)v33;
    v140 = 1;
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v74 = (void *)objc_opt_class();
      v75 = v74;
      -[MSCupidStateMachine personID](self, "personID");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = -[NSMutableArray count](self->_sendingQueue, "count");
      *(_DWORD *)buf = 138543874;
      v143 = v74;
      v144 = 2112;
      v145 = (uint64_t)v76;
      v146 = 2048;
      v147 = v77;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Error uploading %lu asset collections.", buf, 0x20u);

    }
    if ((_BYTE)v140)
    {
      v102 = sendingQueueCount;
      v103 = v25;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_sendingQueue, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_sendingQueue, "count"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      v125 = 0u;
      v115 = self->_sendingQueue;
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v122, v152, 16);
      v106 = v34;
      if (!v35)
        goto LABEL_56;
      v36 = v35;
      v37 = *(_QWORD *)v123;
      while (1)
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v123 != v37)
            objc_enumerationMutation(v115);
          v39 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * j);
          objc_msgSend(v39, "object");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "masterAsset");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "error");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v45 = (void *)objc_opt_class();
            v112 = v45;
            -[MSCupidStateMachine personID](self, "personID");
            v46 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "domain");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v42, "code");
            *(_DWORD *)buf = 138544386;
            v143 = v45;
            v144 = 2112;
            v145 = v46;
            v48 = (void *)v46;
            v146 = 2114;
            v147 = (unint64_t)v40;
            v148 = 2114;
            v149 = (uint64_t)v110;
            v150 = 2048;
            v151 = v47;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ error uploading %{public}@: %{public}@ %ld.", buf, 0x34u);

            v34 = v106;
          }
          if (HIBYTE(v139))
          {
            objc_msgSend(v39, "setErrorCount:", self->_maxErrorCount);
            v43 = v34;
          }
          else
          {
            objc_msgSend(v39, "setErrorCount:", objc_msgSend(v39, "errorCount") + 1);
            v44 = objc_msgSend(v39, "errorCount");
            v43 = v34;
            if (v44 < self->_maxErrorCount)
            {
              if (!objc_msgSend(v42, "MSIsRegistrationError"))
                goto LABEL_54;
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                v49 = (void *)objc_opt_class();
                v113 = v49;
                -[MSCupidStateMachine personID](self, "personID");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v143 = v49;
                v144 = 2112;
                v145 = (uint64_t)v50;
                v146 = 2114;
                v147 = (unint64_t)v40;
                _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ needs to re-register %{public}@.", buf, 0x20u);

                v34 = v106;
              }
              -[MSPublisher _registerAllAssetsForWrapper:](self, "_registerAllAssetsForWrapper:", v39);
              v43 = v108;
            }
          }
          objc_msgSend(v43, "addObject:", v39);
LABEL_54:

        }
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v122, v152, 16);
        if (!v36)
        {
LABEL_56:

          v51 = v108;
          if (objc_msgSend(v108, "count"))
            -[MSObjectQueue commitObjectsWrappers:](self->_uploadQueue, "commitObjectsWrappers:", v108);
          -[MSObjectQueue commitErrorCountsForObjectWrappers:](self->_uploadQueue, "commitErrorCountsForObjectWrappers:", self->_sendingQueue);
          if (objc_msgSend(v34, "count"))
          {
            -[MSObjectQueue removeObjectWrappersFromQueue:](self->_uploadQueue, "removeObjectWrappersFromQueue:", v34);
            -[MSPublisher _updateMasterManifest](self, "_updateMasterManifest");
            v120 = 0u;
            v121 = 0u;
            v118 = 0u;
            v119 = 0u;
            v116 = v34;
            v52 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v118, v141, 16);
            if (v52)
            {
              v53 = v52;
              v54 = *(_QWORD *)v119;
              do
              {
                for (k = 0; k != v53; ++k)
                {
                  if (*(_QWORD *)v119 != v54)
                    objc_enumerationMutation(v116);
                  v56 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * k);
                  objc_msgSend(v56, "object");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "masterAsset");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "error");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v56);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MSPublisher _quarantineOrDiscardWrappers:withError:](self, "_quarantineOrDiscardWrappers:withError:", v60, v59);

                }
                v53 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v118, v141, 16);
              }
              while (v53);
            }

            v34 = v106;
            v51 = v108;
          }
          if (objc_msgSend(v34, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v86 = (void *)objc_opt_class();
            v87 = v86;
            -[MSCupidStateMachine personID](self, "personID");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = objc_msgSend(v34, "count");
            *(_DWORD *)buf = 138543874;
            v143 = v86;
            v144 = 2112;
            v145 = (uint64_t)v88;
            v146 = 2048;
            v147 = v89;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Gave up uploading %lu asset collections.", buf, 0x20u);

          }
          v61 = -[NSMutableArray count](self->_sendingQueue, "count");
          sendingQueueCount = v102;
          v25 = v103;
          if (v61 != objc_msgSend(v34, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v90 = (void *)objc_opt_class();
            v91 = v90;
            -[MSCupidStateMachine personID](self, "personID");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = -[NSMutableArray count](self->_sendingQueue, "count");
            v94 = v93 - objc_msgSend(v106, "count");
            v34 = v106;
            *(_DWORD *)buf = 138543874;
            v143 = v90;
            v144 = 2112;
            v145 = (uint64_t)v92;
            v146 = 2048;
            v147 = v94;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Will retry uploading %ld asset collections.", buf, 0x20u);

          }
          break;
        }
      }
    }
    self->_state = 4;
    -[NSMutableArray removeAllObjects](self->_sendingQueue, "removeAllObjects");
    if (v25 != sendingQueueCount)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v83 = (void *)objc_opt_class();
        v84 = v83;
        -[MSCupidStateMachine personID](self, "personID");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v143 = v83;
        v144 = 2112;
        v145 = (uint64_t)v85;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Detected an inconsistent state.", buf, 0x16u);

      }
      MSPlatform();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_opt_respondsToSelector();

      if ((v63 & 1) != 0)
      {
        MSPlatform();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "didDetectUnrecoverableCondition");

      }
    }
    p_daemon = &self->_daemon;
LABEL_83:
    -[MSDaemon releaseBusy](*p_daemon, "releaseBusy");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__MSPublisher_publishStorageProtocolDidFinishPublishingAllAssets___block_invoke;
    block[3] = &unk_1E95BCED0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_84;
  }
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v66 = (void *)objc_opt_class();
      v67 = v66;
      -[MSCupidStateMachine personID](self, "personID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[NSMutableArray count](self->_sendingQueue, "count");
      *(_DWORD *)buf = 138543874;
      v143 = v66;
      v144 = 2112;
      v145 = (uint64_t)v68;
      v146 = 2048;
      v147 = v69;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Successfully uploaded %lu asset collections.", buf, 0x20u);

    }
    p_daemon = &self->_daemon;
    daemon = self->_daemon;
    -[MSCupidStateMachine personID](self, "personID");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMediaStreamDaemon didReceiveAuthenticationSuccessForPersonID:](daemon, "didReceiveAuthenticationSuccessForPersonID:", v71);

    -[MSCupidStateMachine _resetMMCSBackoffTimer](self, "_resetMMCSBackoffTimer");
    self->_state = 10;
    goto LABEL_83;
  }
  if (!HIBYTE(v140))
  {
    if (HIBYTE(v138))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v95 = (void *)objc_opt_class();
        v96 = v95;
        -[MSCupidStateMachine personID](self, "personID");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v143 = v95;
        v144 = 2112;
        v145 = (uint64_t)v97;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Encountered temporary network issues during upload. Will try again later...", buf, 0x16u);

      }
      self->_state = 7;
LABEL_93:
      -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
      goto LABEL_84;
    }
    if ((_BYTE)v138)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v98 = (void *)objc_opt_class();
        v99 = v98;
        -[MSCupidStateMachine personID](self, "personID");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = -[NSMutableArray count](self->_sendingQueue, "count");
        *(_DWORD *)buf = 138543874;
        v143 = v98;
        v144 = 2112;
        v145 = (uint64_t)v100;
        v146 = 2048;
        v147 = v101;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Received auth error. Resending metadata for %lu asset collections.", buf, 0x20u);

      }
      -[NSMutableArray removeAllObjects](self->_sendingQueue, "removeAllObjects");
      self->_state = 4;
      v72 = self->_daemon;
      -[MSCupidStateMachine personID](self, "personID");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSMediaStreamDaemon didReceiveAuthenticationFailureForPersonID:](v72, "didReceiveAuthenticationFailureForPersonID:", v73);

      goto LABEL_93;
    }
    if ((_BYTE)v139)
      -[MSCupidStateMachine _backoffMMCSBackoffTimer](self, "_backoffMMCSBackoffTimer");
    goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_opt_class();
    v28 = v27;
    -[MSCupidStateMachine personID](self, "personID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[NSMutableArray count](self->_sendingQueue, "count");
    *(_DWORD *)buf = 138543874;
    v143 = v27;
    v144 = 2112;
    v145 = (uint64_t)v29;
    v146 = 2048;
    v147 = v30;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Ignoring errors for %lu asset collections.", buf, 0x20u);

  }
LABEL_84:

}

- (void)_sendUploadComplete
{
  MSPublishStreamsProtocol *protocol;
  id v3;

  self->_state = 12;
  protocol = self->_protocol;
  +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", self->_sendingQueue);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPublishStreamsProtocol sendUploadCompleteForAssetCollections:](protocol, "sendUploadCompleteForAssetCollections:", v3);

}

- (void)publishStreamsProtocol:(id)a3 didFinishSendingUploadCompleteError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int state;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  MSMediaStreamDaemon *daemon;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  _QWORD block[5];
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  _BYTE v44[10];
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  state = self->_state;
  if (state == 12)
  {
    v10 = 0x1EFE31000uLL;
    if (v7)
    {
      if (objc_msgSend(v7, "MSIsTemporaryNetworkError"))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_opt_class();
          v12 = v11;
          -[MSCupidStateMachine personID](self, "personID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)v44 = v11;
          *(_WORD *)&v44[8] = 2112;
          v45 = v13;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Encountered temporary error. Will try again later...", buf, 0x16u);

        }
        self->_state = 10;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v27 = (void *)objc_opt_class();
          v28 = v27;
          -[MSCupidStateMachine personID](self, "personID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "MSVerboseDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)v44 = v27;
          *(_WORD *)&v44[8] = 2112;
          v45 = v29;
          v46 = 2114;
          v47 = (uint64_t)v30;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Error sending upload complete: %{public}@", buf, 0x20u);

          v10 = 0x1EFE31000uLL;
        }
        if (objc_msgSend(v8, "MSNeedsBackoff"))
          -[MSCupidStateMachine _backoffStreamsBackoffTimer](self, "_backoffStreamsBackoffTimer");
        if ((objc_msgSend(v8, "MSIsCounted") & 1) != 0)
        {
          v36 = v6;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_sendingQueue, "count"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v21 = self->_sendingQueue;
          v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v40 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v26, "setErrorCount:", objc_msgSend(v26, "errorCount") + 1);
                if ((int)objc_msgSend(v26, "errorCount") >= self->_maxErrorCount)
                  objc_msgSend(v20, "addObject:", v26);
              }
              v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
            }
            while (v23);
          }

          -[MSObjectQueue commitErrorCountsForObjectWrappers:](self->_uploadQueue, "commitErrorCountsForObjectWrappers:", self->_sendingQueue);
          v6 = v36;
          v10 = 0x1EFE31000uLL;
          if (objc_msgSend(v20, "count"))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v31 = (void *)objc_opt_class();
              v35 = v31;
              -[MSCupidStateMachine personID](self, "personID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v20, "count");
              objc_msgSend(v8, "MSVerboseDescription");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)v44 = v31;
              *(_WORD *)&v44[8] = 2112;
              v45 = v32;
              v46 = 2048;
              v47 = v34;
              v48 = 2114;
              v49 = v33;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed to send upload complete for %lu asset collections. Error: %{public}@", buf, 0x2Au);

              v10 = 0x1EFE31000;
            }
            -[MSObjectQueue removeObjectWrappersFromQueue:](self->_uploadQueue, "removeObjectWrappersFromQueue:", v20);
            -[MSPublisher _updateMasterManifest](self, "_updateMasterManifest");
            -[MSPublisher _quarantineOrDiscardWrappers:withError:](self, "_quarantineOrDiscardWrappers:withError:", v20, v8);
          }

        }
        -[NSMutableArray removeAllObjects](self->_sendingQueue, "removeAllObjects");
        self->_state = 4;
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __74__MSPublisher_publishStreamsProtocol_didFinishSendingUploadCompleteError___block_invoke;
        v38[3] = &unk_1E95BCED0;
        v38[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v38);
      }
    }
    else
    {
      daemon = self->_daemon;
      -[MSCupidStateMachine personID](self, "personID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSMediaStreamDaemon didReceiveAuthenticationSuccessForPersonID:](daemon, "didReceiveAuthenticationSuccessForPersonID:", v15);

      -[MSCupidStateMachine _resetStreamsBackoffTimer](self, "_resetStreamsBackoffTimer");
      +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", self->_sendingQueue);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[MSPublisherDelegate publisher:didFinishPublishingAssetCollections:](self->_delegate, "publisher:didFinishPublishingAssetCollections:", self, v16);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_opt_class();
        v18 = v17;
        -[MSCupidStateMachine personID](self, "personID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v44 = v17;
        *(_WORD *)&v44[8] = 2112;
        v45 = v19;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Finished sending upload complete.", buf, 0x16u);

        v10 = 0x1EFE31000uLL;
      }
      -[MSPublisher _didFinishUsingAssetCollections:](self, "_didFinishUsingAssetCollections:", v16);
      -[MSObjectQueue removeObjectWrappersFromQueue:](self->_uploadQueue, "removeObjectWrappersFromQueue:", self->_sendingQueue);
      -[MSPublisher _updateMasterManifest](self, "_updateMasterManifest");
      -[NSMutableArray removeAllObjects](self->_sendingQueue, "removeAllObjects");
      self->_state = 4;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__MSPublisher_publishStreamsProtocol_didFinishSendingUploadCompleteError___block_invoke_93;
      block[3] = &unk_1E95BCED0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v10 + 2716)), "releaseBusy");
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v44 = 12;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = state;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Wrong state detected. Expected %d, actually %d. Not serving message.", buf, 0xEu);
  }

}

- (int)_stop
{
  unsigned int state;
  int *v5;
  BOOL v6;
  int v7;
  int result;

  state = self->_state;
  if (state == 6 || state == 12)
  {
    v5 = &OBJC_IVAR___MSPublisher__protocol;
  }
  else
  {
    if (state != 9)
      goto LABEL_10;
    v5 = &OBJC_IVAR___MSPublisher__storageProtocol;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v5), "abort");
  state = self->_state;
LABEL_10:
  v6 = state > 0xC;
  v7 = (1 << state) & 0x1B6C;
  if (!v6 && v7 != 0)
    -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  -[NSMutableArray removeAllObjects](self->_requestAuthQueue, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_sendingQueue, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_fileHashToAssetMap, "removeAllObjects");
  result = self->_state;
  self->_state = 0;
  return result;
}

- (id)_abortedError
{
  void *v2;
  __CFString *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_ABORTED"));
  objc_msgSend(v2, "MSErrorWithDomain:code:description:", CFSTR("MSPublisherErrorDomain"), 7, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_abort
{
  void *v3;
  void *v4;
  MSPublisherDelegate *delegate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MSPublisherDelegate *v10;
  void *v11;
  void *v12;
  id v13;

  -[MSPublisher _stop](self, "_stop");
  -[MSPublisher _abortedError](self, "_abortedError");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MSObjectQueue allObjectWrappersMaxCount:](self->_uploadQueue, "allObjectWrappersMaxCount:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    do
    {
      v4 = (void *)MEMORY[0x1D8255C20]();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        delegate = self->_delegate;
        +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSPublisherDelegate publisher:didEncounterError:publishingAssetCollections:](delegate, "publisher:didEncounterError:publishingAssetCollections:", self, v13, v6);

      }
      -[MSObjectQueue removeObjectWrappersFromQueue:](self->_uploadQueue, "removeObjectWrappersFromQueue:", v3);
      -[MSObjectQueue allObjectWrappersMaxCount:](self->_uploadQueue, "allObjectWrappersMaxCount:", 5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v4);
      v3 = v7;
    }
    while (objc_msgSend(v7, "count"));
  }
  else
  {
    v7 = v3;
  }
  -[MSObjectQueue allObjectWrappersMaxCount:](self->_quarantinedQueue, "allObjectWrappersMaxCount:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    do
    {
      v9 = (void *)MEMORY[0x1D8255C20]();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = self->_delegate;
        +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSPublisherDelegate publisher:didEncounterError:publishingAssetCollections:](v10, "publisher:didEncounterError:publishingAssetCollections:", self, v13, v11);

      }
      -[MSObjectQueue removeObjectWrappersFromQueue:](self->_quarantinedQueue, "removeObjectWrappersFromQueue:", v8);
      -[MSObjectQueue allObjectWrappersMaxCount:](self->_quarantinedQueue, "allObjectWrappersMaxCount:", 5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v9);
      v8 = v12;
    }
    while (objc_msgSend(v12, "count"));
  }
  else
  {
    v12 = v8;
  }
  -[MSPublisher _updateMasterManifest](self, "_updateMasterManifest");

}

- (void)_forget
{
  MSObjectQueue *uploadQueue;
  MSPublishStorageProtocol *storageProtocol;

  uploadQueue = self->_uploadQueue;
  self->_uploadQueue = 0;

  storageProtocol = self->_storageProtocol;
  self->_storageProtocol = 0;

}

- (BOOL)_isInRetryState
{
  return (self->_state < 0xBu) & (0x492u >> self->_state);
}

- (MSPublisherDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSPublisherDelegate *)a3;
}

- (MSMediaStreamDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  self->_daemon = (MSMediaStreamDaemon *)a3;
}

- (NSURL)storageProtocolURL
{
  return self->_storageProtocolURL;
}

- (void)setStorageProtocolURL:(id)a3
{
  objc_storeStrong((id *)&self->_storageProtocolURL, a3);
}

- (int64_t)publishTargetByteCount
{
  return self->_publishTargetByteCount;
}

- (void)setPublishTargetByteCount:(int64_t)a3
{
  self->_publishTargetByteCount = a3;
}

- (int)publishBatchSize
{
  return self->_publishBatchSize;
}

- (void)setPublishBatchSize:(int)a3
{
  self->_publishBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSizeByUTI, 0);
  objc_storeStrong((id *)&self->_tempFiles, 0);
  objc_storeStrong((id *)&self->_storageProtocolURL, 0);
  objc_storeStrong((id *)&self->_storageProtocol, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_fileHashToAssetMap, 0);
  objc_storeStrong((id *)&self->_sendingQueue, 0);
  objc_storeStrong((id *)&self->_requestAuthQueue, 0);
  objc_storeStrong((id *)&self->_pendingDerivativesQueue, 0);
  objc_storeStrong((id *)&self->_quarantinedQueue, 0);
  objc_storeStrong((id *)&self->_derivativesQueue, 0);
  objc_storeStrong((id *)&self->_uploadQueue, 0);
}

uint64_t __74__MSPublisher_publishStreamsProtocol_didFinishSendingUploadCompleteError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

uint64_t __74__MSPublisher_publishStreamsProtocol_didFinishSendingUploadCompleteError___block_invoke_93(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

uint64_t __66__MSPublisher_publishStorageProtocolDidFinishPublishingAllAssets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

uint64_t __79__MSPublisher_publishStreamsProtocol_didFinishUploadingMetadataResponse_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

uint64_t __37__MSPublisher__sendMetadataToStreams__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

uint64_t __37__MSPublisher__sendMetadataToStreams__block_invoke_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

uint64_t __73__MSPublisher_submitAssetCollectionsForPublication_skipAssetCollections___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

uint64_t __34__MSPublisher__requestDerivatives__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

void __34__MSPublisher__requestDerivatives__block_invoke_44(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "masterAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "masterAssetHash");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_4;
    v8 = (void *)v7;
    objc_msgSend(v6, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("MSAssetMetadataSHA1HashKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
LABEL_4:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "computeHashForAsset:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "masterAsset unavailable for asset collection %@, unable to request derivatives", (uint8_t *)&v11, 0xCu);
    }
  }

}

void __53__MSPublisher__refreshServerSideConfiguredParameters__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("public.tiff"), CFSTR("assetType"), CFSTR("100"), CFSTR("maxFileSizeMB"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("public.jpeg"), CFSTR("assetType"), CFSTR("50"), CFSTR("maxFileSizeMB"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("public.camera-raw-image"), CFSTR("assetType"), CFSTR("100"), CFSTR("maxFileSizeMB"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("public.png"), CFSTR("assetType"), CFSTR("50"), CFSTR("maxFileSizeMB"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v0, "initWithObjects:", v6, v1, v2, v3, 0);
  v5 = (void *)_refreshServerSideConfiguredParameters_defaultSupportedAssetTypes;
  _refreshServerSideConfiguredParameters_defaultSupportedAssetTypes = v4;

}

uint64_t __48__MSPublisher_enqueueAssetCollections_outError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

+ (id)publisherForPersonID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  MSPublisher *v7;
  MSPublisher *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)_publisherByID;
    if (!_publisherByID)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = (void *)_publisherByID;
      _publisherByID = (uint64_t)v5;

      v4 = (void *)_publisherByID;
    }
    objc_msgSend(v4, "objectForKey:", v3);
    v7 = (MSPublisher *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = [MSPublisher alloc];
      MSPlatform();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "baseURLForPersonID:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MSPublisher initWithPersonID:baseURL:](v8, "initWithPersonID:baseURL:", v3, v10);

      objc_msgSend((id)_publisherByID, "setObject:forKey:", v7, v3);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)existingPublisherForPersonID:(id)a3
{
  return (id)objc_msgSend((id)_publisherByID, "objectForKey:", a3);
}

+ (id)_clearInstantiatedPublishersByPersonID
{
  id v2;
  void *v3;

  v2 = (id)_publisherByID;
  v3 = (void *)_publisherByID;
  _publisherByID = 0;

  return v2;
}

+ (void)forgetPersonID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)_publisherByID, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "forget");
    objc_msgSend((id)_publisherByID, "removeObjectForKey:", v5);
  }

}

+ (void)_setMasterNextActivityDate:(id)a3 forPersonID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _BYTE v10[24];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    _masterNextActivityDateByPersonID();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v10 = 138543874;
        *(_QWORD *)&v10[4] = objc_opt_class();
        *(_WORD *)&v10[12] = 2112;
        *(_QWORD *)&v10[14] = v6;
        *(_WORD *)&v10[22] = 2114;
        v11 = v5;
        v9 = *(id *)&v10[4];
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - setting next activity date for %@ to %{public}@.", v10, 0x20u);

      }
      objc_msgSend(v8, "setObject:forKey:", v5, v6, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
    }
    else
    {
      objc_msgSend(v7, "removeObjectForKey:", v6);
    }
    _commitMasterManifest();
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v10 = 138543362;
    *(_QWORD *)&v10[4] = objc_opt_class();
    v8 = *(id *)&v10[4];
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - Found empty person ID.", v10, 0xCu);
LABEL_10:

  }
}

+ (id)nextActivityDate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _masterNextActivityDateByPersonID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v5 || objc_msgSend(v8, "compare:", v5) == -1)
        {
          v10 = v9;

          v5 = v10;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)nextActivityDateForPersonID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  _masterNextActivityDateByPersonID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)personIDsWithOutstandingActivities
{
  void *v2;
  void *v3;

  _masterNextActivityDateByPersonID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)stopAllActivities
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend((id)_publisherByID, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "stop");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (BOOL)isInRetryState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend((id)_publisherByID, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "_isInRetryState") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

@end
