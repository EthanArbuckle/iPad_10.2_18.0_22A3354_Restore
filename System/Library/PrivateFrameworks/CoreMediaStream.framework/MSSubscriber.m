@implementation MSSubscriber

- (id)subscribedStreams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[MSSubscriber _subscriptionsByStreamID](self, "_subscriptionsByStreamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSSubscriber _subscriptionsByStreamID](self, "_subscriptionsByStreamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
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
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)ownSubscribedStream
{
  void *v3;
  void *v4;
  void *v5;

  -[MSSubscriber _subscriptionsByStreamID](self, "_subscriptionsByStreamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCupidStateMachine personID](self, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MSSubscriber)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  MSSubscriber *v8;
  MSSubscribeStreamsProtocol *v9;
  MSSubscribeStreamsProtocol *protocol;
  MSSubscribeMMCSProtocol *v11;
  MSSubscribeStorageProtocol *storageProtocol;
  MSReauthorizationProtocol *v13;
  MSReauthorizationProtocol *reauthProtocol;
  NSMutableArray *v15;
  NSMutableArray *assetsBeingRetrieved;
  MSObjectQueue *v17;
  void *v18;
  uint64_t v19;
  MSObjectQueue *retrievalQueue;
  void *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MSSubscriber;
  v8 = -[MSCupidStateMachine initWithPersonID:](&v23, sel_initWithPersonID_, v6);
  if (v8)
  {
    v9 = -[MSSubscribeStreamsProtocol initWithPersonID:baseURL:]([MSSubscribeStreamsProtocol alloc], "initWithPersonID:baseURL:", v6, v7);
    protocol = v8->_protocol;
    v8->_protocol = v9;

    -[MSSubscribeStreamsProtocol setDelegate:](v8->_protocol, "setDelegate:", v8);
    v11 = -[MSSubscribeMMCSProtocol initWithPersonID:]([MSSubscribeMMCSProtocol alloc], "initWithPersonID:", v6);
    storageProtocol = v8->_storageProtocol;
    v8->_storageProtocol = (MSSubscribeStorageProtocol *)v11;

    -[MSSubscribeStorageProtocol setDelegate:](v8->_storageProtocol, "setDelegate:", v8);
    v13 = -[MSReauthorizationProtocol initWithPersonID:baseURL:]([MSReauthorizationProtocol alloc], "initWithPersonID:baseURL:", v6, v7);
    reauthProtocol = v8->_reauthProtocol;
    v8->_reauthProtocol = v13;

    -[MSReauthorizationProtocol setDelegate:](v8->_reauthProtocol, "setDelegate:", v8);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetsBeingRetrieved = v8->_assetsBeingRetrieved;
    v8->_assetsBeingRetrieved = v15;

    v17 = [MSObjectQueue alloc];
    MSPathSubscriberRetrievalQueueForPersonID(v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MSObjectQueue initWithPath:](v17, "initWithPath:", v18);
    retrievalQueue = v8->_retrievalQueue;
    v8->_retrievalQueue = (MSObjectQueue *)v19;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v8, sel__serverSideConfigurationDidChange_, CFSTR("MSServerSideConfigChanged"), 0);

    -[MSSubscriber _refreshServerSideConfigurationParameters](v8, "_refreshServerSideConfigurationParameters");
  }

  return v8;
}

- (void)deactivate
{
  void *v3;
  NSMutableArray *assetsBeingRetrieved;
  MSReauthorizationProtocol *reauthProtocol;
  MSSubscribeStreamsProtocol *protocol;
  MSObjectQueue *retrievalQueue;
  MSSubscribeStorageProtocol *storageProtocol;
  NSMutableDictionary *newSubscriptionsByStreamID;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[MSSubscriber stop](self, "stop");
  assetsBeingRetrieved = self->_assetsBeingRetrieved;
  self->_assetsBeingRetrieved = 0;

  reauthProtocol = self->_reauthProtocol;
  self->_reauthProtocol = 0;

  protocol = self->_protocol;
  self->_protocol = 0;

  -[MSSubscribeStorageProtocol deactivateRemoveAllFiles:](self->_storageProtocol, "deactivateRemoveAllFiles:", -[MSObjectQueue count](self->_retrievalQueue, "count") == 0);
  retrievalQueue = self->_retrievalQueue;
  self->_retrievalQueue = 0;

  storageProtocol = self->_storageProtocol;
  self->_storageProtocol = 0;

  newSubscriptionsByStreamID = self->_newSubscriptionsByStreamID;
  self->_newSubscriptionsByStreamID = 0;

  v10.receiver = self;
  v10.super_class = (Class)MSSubscriber;
  -[MSCupidStateMachine deactivate](&v10, sel_deactivate);
}

- (void)dealloc
{
  objc_super v3;

  -[MSSubscriber deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)MSSubscriber;
  -[MSCupidStateMachine dealloc](&v3, sel_dealloc);
}

- (void)_changeStateTo:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    objc_msgSend((id)objc_opt_class(), "_descriptionForState:", self->_state);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_descriptionForState:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[STATE %{public}@] %{public}@ -> %{public}@", (uint8_t *)&v9, 0x20u);

  }
  self->_state = v3;
}

- (void)_changeRetrievalStateTo:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    objc_msgSend((id)objc_opt_class(), "_descriptionForRetrievalState:", self->_retrievalState);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_descriptionForRetrievalState:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[RETRIEVALSTATE %{public}@] %{public}@ -> %{public}@", (uint8_t *)&v9, 0x20u);

  }
  self->_retrievalState = v3;
}

- (void)_refreshServerSideConfigurationParameters
{
  void *v3;
  void *v4;
  id v5;

  -[MSCupidStateMachine personID](self, "personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_targetRetrievalByteCount = +[MSServerSideConfigManager longLongValueForParameter:forPersonID:defaultValue:](MSServerSideConfigManager, "longLongValueForParameter:forPersonID:defaultValue:", CFSTR("mme.streams.client.subDownloadBatchTargetSize"), v3, 10485760);

  -[MSCupidStateMachine personID](self, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_retrievalBatchSize = +[MSServerSideConfigManager intValueForParameter:forPersonID:defaultValue:](MSServerSideConfigManager, "intValueForParameter:forPersonID:defaultValue:", CFSTR("mme.streams.client.subMaxDownloadBatchCount"), v4, 10);

  -[MSCupidStateMachine personID](self, "personID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_maxErrorCount = +[MSServerSideConfigManager intValueForParameter:forPersonID:defaultValue:](MSServerSideConfigManager, "intValueForParameter:forPersonID:defaultValue:", CFSTR("mme.streams.client.subMaxErrorRetryCount"), v5, 3);

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
      -[MSSubscriber _refreshServerSideConfigurationParameters](self, "_refreshServerSideConfigurationParameters");
    }
  }
  else
  {
    -[MSSubscriber performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__serverSideConfigurationDidChange_, v14, 0);

  }
}

- (void)_updateMasterManifest
{
  void *v3;
  id v4;
  BOOL v5;
  id v6;

  -[MSCupidStateMachine _latestNextActivityDate](self, "_latestNextActivityDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[MSSubscriber _hasOutstandingPoll](self, "_hasOutstandingPoll"))
  {
    if (-[MSObjectQueue count](self->_retrievalQueue, "count"))
      v5 = v6 == 0;
    else
      v5 = 1;
    if (!v5)
      goto LABEL_3;
LABEL_9:
    -[MSCupidStateMachine personID](self, "personID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    goto LABEL_10;
  }
  if (!v6)
    goto LABEL_9;
LABEL_3:
  -[MSCupidStateMachine personID](self, "personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
LABEL_10:
  +[MSSubscriber _setMasterNextActivityDate:forPersonID:](MSSubscriber, "_setMasterNextActivityDate:forPersonID:", v4, v3);

  _commitMasterManifest_275();
}

- (BOOL)_hasOutstandingPoll
{
  void *v2;
  void *v3;
  char v4;

  -[MSCupidStateMachine _userManifest](self, "_userManifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("poll"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)_setHasOutstandingPoll:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[MSCupidStateMachine personID](self, "personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = v3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Setting outstanding poll: %d", (uint8_t *)&v10, 0x1Cu);

  }
  -[MSCupidStateMachine _userManifest](self, "_userManifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("poll"));

  -[MSCupidStateMachine _commitUserManifest](self, "_commitUserManifest");
}

- (id)_subscriptionsByStreamID
{
  void *v3;
  void *v4;

  -[MSCupidStateMachine _userManifest](self, "_userManifest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("subs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("subs"));
    -[MSCupidStateMachine _commitUserManifest](self, "_commitUserManifest");
  }

  return v4;
}

- (void)_setSubscriptionsByStreamID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MSCupidStateMachine _userManifest](self, "_userManifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("subs"));

  -[MSCupidStateMachine _commitUserManifest](self, "_commitUserManifest");
}

- (void)resetSync
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = v3;
    -[MSCupidStateMachine personID](self, "personID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscriber sync state was reset locally.", (uint8_t *)&v7, 0x16u);

  }
  -[MSSubscriber _stopOutSubscriberState:outRetrievalState:](self, "_stopOutSubscriberState:outRetrievalState:", 0, 0);
  -[MSSubscriber _subscriptionsByStreamID](self, "_subscriptionsByStreamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[MSCupidStateMachine _commitUserManifest](self, "_commitUserManifest");
}

- (BOOL)_isAllowedToDownload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL result;
  _BOOL4 v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MSSubscriber daemon](self, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCupidStateMachine personID](self, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "mayDownloadPersonID:", v4))
    goto LABEL_6;
  MSPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "policyMayDownload") & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  -[MSCupidStateMachine _latestNextActivityDate](self, "_latestNextActivityDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (v8 != 1)
    return 1;
LABEL_7:
  v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v10)
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    -[MSCupidStateMachine personID](self, "personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not downloading at this time.", (uint8_t *)&v14, 0x16u);

    return 0;
  }
  return result;
}

- (void)checkForNewAssetCollectionsIfMissingCtag
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  MSSubscriber *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MSSubscriber _subscriptionsByStreamID](self, "_subscriptionsByStreamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = v4;
    v13 = self;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ctag");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v6 = 1;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v10;
            _os_log_impl(&dword_1D3E94000, v8, OS_LOG_TYPE_INFO, "will check for new asset collections due to missing ctag for %@", buf, 0xCu);
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
    if ((v6 & 1) != 0)
      -[MSSubscriber checkForNewAssetCollections](v13, "checkForNewAssetCollections");
  }

}

- (void)checkForNewAssetCollections
{
  uint64_t v3;
  void *v4;
  int v5;
  int state;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[MSCupidStateMachine hasDeactivated](self, "hasDeactivated"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_opt_class();
      -[MSCupidStateMachine personID](self, "personID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v3;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not checking for new asset collections because we're shutting down.", (uint8_t *)&v7, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      state = self->_state;
      v7 = 67109120;
      LODWORD(v8) = state;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "checkForNewAssetCollections called, state: %d", (uint8_t *)&v7, 8u);
    }
    v5 = self->_state;
    if (v5 == 1)
    {
      -[MSDaemon retainBusy](self->_daemon, "retainBusy");
      -[MSSubscriber _checkForNewAssetCollections](self, "_checkForNewAssetCollections");
    }
    else if (v5)
    {
      -[MSSubscriber _setHasOutstandingPoll:](self, "_setHasOutstandingPoll:", 1);
      self->_checkOneMoreTime = 1;
    }
    else
    {
      -[MSSubscriber _setHasOutstandingPoll:](self, "_setHasOutstandingPoll:", 1);
      if (-[MSSubscriber _isAllowedToDownload](self, "_isAllowedToDownload")
        && !-[MSObjectQueue count](self->_retrievalQueue, "count"))
      {
        -[MSSubscriber _changeStateTo:](self, "_changeStateTo:", 1);
        self->_checkOneMoreTime = 0;
        -[MSSubscriber checkForNewAssetCollections](self, "checkForNewAssetCollections");
      }
    }
  }
}

- (void)_checkForNewAssetCollections
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *newSubscriptionsByStreamID;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MSSubscriber _changeStateTo:](self, "_changeStateTo:", 2);
  -[MSSubscriber _subscriptionsByStreamID](self, "_subscriptionsByStreamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9), (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ctag");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "ctag");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "streamID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v12, v13);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[MSSubscriber _subscriptionsByStreamID](self, "_subscriptionsByStreamID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSMutableDictionary *)objc_msgSend(v14, "mutableCopy");
  newSubscriptionsByStreamID = self->_newSubscriptionsByStreamID;
  self->_newSubscriptionsByStreamID = v15;

  -[MSSubscribeStreamsProtocol pollForSubscriptionUpdatesWithAccountAnchors:](self->_protocol, "pollForSubscriptionUpdatesWithAccountAnchors:", v4);
}

- (void)_didFinishRetrievingSubscriptionUpdate
{
  NSMutableDictionary *newSubscriptionsByStreamID;
  _QWORD block[5];

  -[MSSubscriber _setSubscriptionsByStreamID:](self, "_setSubscriptionsByStreamID:", self->_newSubscriptionsByStreamID);
  newSubscriptionsByStreamID = self->_newSubscriptionsByStreamID;
  self->_newSubscriptionsByStreamID = 0;

  if (self->_checkOneMoreTime)
  {
    self->_checkOneMoreTime = 0;
    -[MSSubscriber _changeStateTo:](self, "_changeStateTo:", 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MSSubscriber__didFinishRetrievingSubscriptionUpdate__block_invoke;
    block[3] = &unk_1E95BCED0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[MSSubscriber _setHasOutstandingPoll:](self, "_setHasOutstandingPoll:", 0);
    -[MSSubscriber _changeStateTo:](self, "_changeStateTo:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MSSubscriberDelegate subscriberDidCompleteCheckForNewAssetCollections:](self->_delegate, "subscriberDidCompleteCheckForNewAssetCollections:", self);
  }
  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
}

- (void)subscribeStreamsProtocol:(id)a3 willReceiveUpdatesForPersonID:(id)a4 wasReset:(BOOL)a5 metadata:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v7 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_opt_class();
    v14 = v13;
    -[MSCupidStateMachine personID](self, "personID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v13;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Checking for subscription updates...", (uint8_t *)&v24, 0x16u);

  }
  if (v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_opt_class();
    v17 = v16;
    -[MSCupidStateMachine personID](self, "personID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v16;
    v26 = 2112;
    v27 = v18;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscriber state was reset by the server.", (uint8_t *)&v24, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v21 = (void *)objc_opt_class();
    v22 = v21;
    -[MSCupidStateMachine personID](self, "personID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544386;
    v25 = v21;
    v26 = 2112;
    v27 = v23;
    v28 = 2112;
    v29 = v11;
    v30 = 1024;
    v31 = v7;
    v32 = 2114;
    v33 = v12;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Beginning subscriber updates for personID: %@ wasReset: %d\nMetadata: %{public}@", (uint8_t *)&v24, 0x30u);

  }
  -[NSMutableDictionary objectForKey:](self->_newSubscriptionsByStreamID, "objectForKey:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (!v7)
      goto LABEL_13;
  }
  else
  {
    +[MSSubscribedStream subscribedStreamWithStreamID:](MSSubscribedStream, "subscribedStreamWithStreamID:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_newSubscriptionsByStreamID, "setObject:forKey:", v19, v11);
    if (!v7)
      goto LABEL_13;
  }
  -[MSSubscriber daemon](self, "daemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didReceiveGlobalResetSyncForPersonID:", v11);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MSSubscriberDelegate subscriber:didResetSyncForStreamID:](self->_delegate, "subscriber:didResetSyncForStreamID:", self, v11);
LABEL_13:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MSSubscriberDelegate subscriber:willBeginRequestingAssetRetrievalForStreamID:](self->_delegate, "subscriber:willBeginRequestingAssetRetrievalForStreamID:", self, v11);

}

- (void)subscribeStreamsProtocol:(id)a3 didReceiveAssetCollections:(id)a4 forPersonID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    -[MSCupidStateMachine personID](self, "personID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v10;
    v30 = 2112;
    v31 = v12;
    v32 = 2048;
    v33 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Found %ld new asset collections.", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v20, "wasDeleted"))
          v21 = v14;
        else
          v21 = v13;
        objc_msgSend(v21, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v13, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v13;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "New Collections: %{public}@", buf, 0xCu);
  }
  if (objc_msgSend(v14, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v14;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Deleted asset collections: %{public}@", buf, 0xCu);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MSSubscriberDelegate subscriber:didReceiveDeleteForAssetCollections:streamID:](self->_delegate, "subscriber:didReceiveDeleteForAssetCollections:streamID:", self, v14, v9);
  }
  -[MSSubscriberDelegate subscriber:didRequestAssetRetrievalForAssetCollections:streamID:](self->_delegate, "subscriber:didRequestAssetRetrievalForAssetCollections:streamID:", self, v13, v9);

}

- (void)subscribeStreamsProtocol:(id)a3 didFinishReceivingUpdatesForPersonID:(id)a4 ctag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    -[MSCupidStateMachine personID](self, "personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v11;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Finished receiving updates for personID: %@.", (uint8_t *)&v23, 0x20u);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v20 = (void *)objc_opt_class();
    v21 = v20;
    -[MSCupidStateMachine personID](self, "personID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v20;
    v25 = 2112;
    v26 = v22;
    v27 = 2114;
    v28 = v10;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ New ctag: %{public}@", (uint8_t *)&v23, 0x20u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MSSubscriberDelegate subscriber:didFinishRequestingAssetRetrievalForStreamID:](self->_delegate, "subscriber:didFinishRequestingAssetRetrievalForStreamID:", self, v9);
  -[NSMutableDictionary objectForKey:](self->_newSubscriptionsByStreamID, "objectForKey:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setCtag:", v10);
  }
  else if (v10)
  {
    +[MSSubscribedStream subscribedStreamWithStreamID:](MSSubscribedStream, "subscribedStreamWithStreamID:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCtag:", v10);
    -[NSMutableDictionary setObject:forKey:](self->_newSubscriptionsByStreamID, "setObject:forKey:", v16, v9);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_opt_class();
      v18 = v17;
      -[MSCupidStateMachine personID](self, "personID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v17;
      v25 = 2112;
      v26 = v19;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Received CTAG for new person ID %@.", (uint8_t *)&v23, 0x20u);

    }
  }

}

- (void)subscribeStreamsProtocol:(id)a3 didFindDisappearedSubscriptionForPersonID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    -[MSCupidStateMachine personID](self, "personID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscription for personID %@ is no longer available.", (uint8_t *)&v11, 0x20u);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_newSubscriptionsByStreamID, "removeObjectForKey:", v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MSSubscriberDelegate subscriber:didFindDisappearedSubscriptionforStreamID:](self->_delegate, "subscriber:didFindDisappearedSubscriptionforStreamID:", self, v7);

}

- (void)subscribeStreamsProtocol:(id)a3 didFinishError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  MSMediaStreamDaemon *daemon;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    daemon = self->_daemon;
    -[MSCupidStateMachine personID](self, "personID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMediaStreamDaemon didReceiveAuthenticationSuccessForPersonID:](daemon, "didReceiveAuthenticationSuccessForPersonID:", v12);

    -[MSCupidStateMachine _resetStreamsBackoffTimer](self, "_resetStreamsBackoffTimer");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_opt_class();
      v14 = v13;
      -[MSCupidStateMachine personID](self, "personID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v13;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Finished retrieving subscription updates.", (uint8_t *)&v23, 0x16u);

    }
    goto LABEL_13;
  }
  v9 = objc_msgSend(v7, "MSIsTemporaryNetworkError");
  v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (!v9)
  {
    if (v10)
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      -[MSCupidStateMachine personID](self, "personID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v20;
      v25 = 2112;
      v26 = v22;
      v27 = 2114;
      v28 = v8;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found error when retrieving subscription updates: %{public}@", (uint8_t *)&v23, 0x20u);

    }
    if (objc_msgSend(v8, "MSNeedsBackoff"))
      -[MSCupidStateMachine _backoffStreamsBackoffTimer](self, "_backoffStreamsBackoffTimer");
    -[MSSubscriberDelegate subscriber:didFailToRetriveSubscriptionUpdateWithError:](self->_delegate, "subscriber:didFailToRetriveSubscriptionUpdateWithError:", self, v8);
LABEL_13:
    -[MSSubscriber _didFinishRetrievingSubscriptionUpdate](self, "_didFinishRetrievingSubscriptionUpdate");
    goto LABEL_14;
  }
  if (v10)
  {
    v16 = (void *)objc_opt_class();
    v17 = v16;
    -[MSCupidStateMachine personID](self, "personID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "MSVerboseDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v16;
    v25 = 2112;
    v26 = v18;
    v27 = 2114;
    v28 = v19;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found temporary network error. Trying again later. Error: %{public}@", (uint8_t *)&v23, 0x20u);

  }
  -[MSSubscriber _changeStateTo:](self, "_changeStateTo:", 1);
  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
LABEL_14:

}

- (void)_didReceiveAuthenticationError:(id)a3
{
  MSMediaStreamDaemon *daemon;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = a3;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    -[MSCupidStateMachine personID](self, "personID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "MSVerboseDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Received authentication error: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  daemon = self->_daemon;
  -[MSCupidStateMachine personID](self, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMediaStreamDaemon didReceiveAuthenticationFailureForPersonID:](daemon, "didReceiveAuthenticationFailureForPersonID:", v6);

  -[MSSubscriber _changeStateTo:](self, "_changeStateTo:", 1);
  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
}

- (void)subscribeStreamsProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  -[MSSubscriber _didReceiveAuthenticationError:](self, "_didReceiveAuthenticationError:", a4);
}

- (void)subscribeStreamsProtocol:(id)a3 didFindTemporarilyUnavailableSubscriptionForPersonID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = a4;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[MSCupidStateMachine personID](self, "personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 138543874;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscription stream for person ID %{public}@ is temporarily unavailable.", (uint8_t *)&v10, 0x20u);

  }
}

- (void)retrieveAssets:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  MSSubscriberDelegate *delegate;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            __assert_rtn("-[MSSubscriber retrieveAssets:]", "MSSubscriber.m", 554, "[asset isKindOfClass:[MSAsset class]]");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      }
      while (v7);
    }
    v29 = v4;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      -[MSCupidStateMachine personID](self, "personID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 138543874;
      v40 = v10;
      v41 = 2112;
      v42 = v12;
      v43 = 2048;
      v44 = v13;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Scheduling retrieval of %ld assets.", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = v5;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if (objc_msgSend(v20, "_fileSize"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addMetadataValue:forKey:", v21, CFSTR("MSAssetMetadataAssetFileTransferUUID"));

            +[MSObjectWrapper wrapperWithObject:size:](MSObjectWrapper, "wrapperWithObject:size:", v20, objc_msgSend(v20, "_fileSize"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v22);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v26 = (void *)objc_opt_class();
              v27 = v26;
              -[MSCupidStateMachine personID](self, "personID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v40 = v26;
              v41 = 2112;
              v42 = v28;
              v43 = 2114;
              v44 = (uint64_t)v20;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Rejected invalid asset %{public}@.", buf, 0x20u);

            }
            delegate = self->_delegate;
            v24 = (void *)MEMORY[0x1E0CB35C8];
            v22 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_SUBSCRIBER_ASSET_INVALID"));
            objc_msgSend(v24, "MSErrorWithDomain:code:description:", CFSTR("MSSubscriberErrorDomain"), 1, v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSSubscriberDelegate subscriber:didFinishRetrievingAsset:error:](delegate, "subscriber:didFinishRetrievingAsset:error:", self, v20, v25);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v17);
    }

    -[MSObjectQueue appendObjectWrappers:](self->_retrievalQueue, "appendObjectWrappers:", v14);
    -[MSSubscriber _updateMasterManifest](self, "_updateMasterManifest");
    -[MSSubscriber _retrieveAssets](self, "_retrieveAssets");

    v4 = v29;
  }

}

- (void)checkForOutstandingActivities
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[MSCupidStateMachine hasDeactivated](self, "hasDeactivated"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_opt_class();
      -[MSCupidStateMachine personID](self, "personID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543618;
      v6 = v3;
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not checking for outstanding activities because we're shutting down.", (uint8_t *)&v5, 0x16u);

    }
  }
  else
  {
    if (-[MSObjectQueue count](self->_retrievalQueue, "count"))
      -[MSSubscriber _retrieveAssets](self, "_retrieveAssets");
    -[MSSubscriber _updateMasterManifest](self, "_updateMasterManifest");
    if (-[MSSubscriber _hasOutstandingPoll](self, "_hasOutstandingPoll"))
      -[MSSubscriber checkForNewAssetCollections](self, "checkForNewAssetCollections");
  }
}

- (void)_retrieveAssets
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int retrievalState;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[MSCupidStateMachine hasDeactivated](self, "hasDeactivated"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_opt_class();
      -[MSCupidStateMachine personID](self, "personID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not retrieving assets because we're shutting down.", (uint8_t *)&v9, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v5 = (void *)objc_opt_class();
      v6 = v5;
      -[MSCupidStateMachine personID](self, "personID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      retrievalState = self->_retrievalState;
      v9 = 138543874;
      v10 = (uint64_t)v5;
      v11 = 2112;
      v12 = v7;
      v13 = 1024;
      v14 = retrievalState;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Retrieval state: %d", (uint8_t *)&v9, 0x1Cu);

    }
    switch(self->_retrievalState)
    {
      case 0:
      case 1:
        if (-[MSSubscriber _isAllowedToDownload](self, "_isAllowedToDownload"))
        {
          -[MSDaemon retainBusy](self->_daemon, "retainBusy");
          -[MSSubscriber _changeRetrievalStateTo:](self, "_changeRetrievalStateTo:", 2);
          -[MSSubscriber _retrieveNextAssets](self, "_retrieveNextAssets");
        }
        break;
      case 2:
      case 4:
        return;
      case 3:
        if (-[MSSubscriber _isAllowedToDownload](self, "_isAllowedToDownload"))
        {
          -[MSDaemon retainBusy](self->_daemon, "retainBusy");
          -[MSSubscriber _changeRetrievalStateTo:](self, "_changeRetrievalStateTo:", 4);
          -[MSSubscriber _reauthorizeAssets](self, "_reauthorizeAssets");
        }
        break;
      default:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Unexpected state"));
        break;
    }
  }
}

- (void)_retrieveNextAssets
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  MSSubscribeStorageProtocol *storageProtocol;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[MSObjectQueue smallestObjectWrappersTargetTotalSize:maxCount:](self->_retrievalQueue, "smallestObjectWrappersTargetTotalSize:maxCount:", self->_targetRetrievalByteCount, self->_retrievalBatchSize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[NSMutableArray removeAllObjects](self->_assetsBeingRetrieved, "removeAllObjects");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v23;
      do
      {
        v9 = 0;
        v10 = v7;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v4);
          v7 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v9);

          objc_msgSend(v7, "object", (_QWORD)v22);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "MMCSAccessHeader");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            -[NSMutableArray addObject:](self->_assetsBeingRetrieved, "addObject:", v7);

          ++v9;
          v10 = v7;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      }
      while (v6);

    }
    if (-[NSMutableArray count](self->_assetsBeingRetrieved, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_opt_class();
        v14 = v13;
        -[MSCupidStateMachine personID](self, "personID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[NSMutableArray count](self->_assetsBeingRetrieved, "count");
        *(_DWORD *)buf = 138543874;
        v27 = v13;
        v28 = 2112;
        v29 = v15;
        v30 = 2048;
        v31 = v16;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Retrieving %lu assets...", buf, 0x20u);

      }
      -[MSSubscriber _changeRetrievalStateTo:](self, "_changeRetrievalStateTo:", 2, (_QWORD)v22);
      storageProtocol = self->_storageProtocol;
      +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", self->_assetsBeingRetrieved);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSSubscribeStorageProtocol retrieveAssets:](storageProtocol, "retrieveAssets:", v18);

    }
    else
    {
      -[NSMutableArray addObjectsFromArray:](self->_assetsBeingRetrieved, "addObjectsFromArray:", v4);
      -[MSSubscriber _reauthorizeAssets](self, "_reauthorizeAssets");
    }
  }
  else
  {
    -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
    -[MSSubscriber _changeRetrievalStateTo:](self, "_changeRetrievalStateTo:", 0);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_opt_class();
      v20 = v19;
      -[MSCupidStateMachine personID](self, "personID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v19;
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ No more assets to retrieve.", buf, 0x16u);

    }
    if (-[MSSubscriber _hasOutstandingPoll](self, "_hasOutstandingPoll"))
      -[MSSubscriber checkForNewAssetCollections](self, "checkForNewAssetCollections");
  }

}

- (void)_reauthorizeAssets
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  MSReauthorizationProtocol *reauthProtocol;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_assetsBeingRetrieved, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)objc_opt_class();
      v4 = v3;
      -[MSCupidStateMachine personID](self, "personID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NSMutableArray count](self->_assetsBeingRetrieved, "count");
      v9 = 138543874;
      v10 = v3;
      v11 = 2112;
      v12 = v5;
      v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Reauthorizing retrieval of %lu assets...", (uint8_t *)&v9, 0x20u);

    }
    reauthProtocol = self->_reauthProtocol;
    +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", self->_assetsBeingRetrieved);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSReauthorizationProtocol requestReauthorizationForAssets:](reauthProtocol, "requestReauthorizationForAssets:", v8);

    -[MSSubscriber _changeRetrievalStateTo:](self, "_changeRetrievalStateTo:", 4);
  }
  else
  {
    -[MSSubscriber _retrieveNextAssets](self, "_retrieveNextAssets");
  }
}

- (void)_stopOutSubscriberState:(int *)a3 outRetrievalState:(int *)a4
{
  int retrievalState;
  int *v8;
  int v9;

  if (self->_state == 2)
    -[MSSubscribeStreamsProtocol abort](self->_protocol, "abort");
  retrievalState = self->_retrievalState;
  if (retrievalState == 2)
  {
    v8 = &OBJC_IVAR___MSSubscriber__storageProtocol;
  }
  else
  {
    if (retrievalState != 4)
      goto LABEL_8;
    v8 = &OBJC_IVAR___MSSubscriber__reauthProtocol;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v8), "abort");
LABEL_8:
  if (self->_state == 2)
    -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  v9 = self->_retrievalState;
  if (v9 == 4 || v9 == 2)
    -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  if (self->_checkOneMoreTime)
  {
    -[MSSubscriber _setHasOutstandingPoll:](self, "_setHasOutstandingPoll:", 1);
    self->_checkOneMoreTime = 0;
  }
  if (a3)
    *a3 = self->_state;
  if (a4)
    *a4 = self->_retrievalState;
  -[MSSubscriber _changeStateTo:](self, "_changeStateTo:", 0);
  -[MSSubscriber _changeRetrievalStateTo:](self, "_changeRetrievalStateTo:", 0);
  -[NSMutableArray removeAllObjects](self->_assetsBeingRetrieved, "removeAllObjects");
}

- (void)stop
{
  -[MSSubscriber _stopOutSubscriberState:outRetrievalState:](self, "_stopOutSubscriberState:outRetrievalState:", 0, 0);
}

- (void)_abort
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  MSSubscriberDelegate *delegate;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  -[MSSubscriber _stopOutSubscriberState:outRetrievalState:](self, "_stopOutSubscriberState:outRetrievalState:", (char *)&v20 + 4, &v20);
  -[MSSubscriber _setHasOutstandingPoll:](self, "_setHasOutstandingPoll:", 0);
  self->_checkOneMoreTime = 0;
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_SUBSCRIBER_ABORTED"));
  objc_msgSend(v3, "MSErrorWithDomain:code:description:", CFSTR("MSSubscriberErrorDomain"), 4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (HIDWORD(v20))
  {
    -[MSSubscriberDelegate subscriber:didFailToRetriveSubscriptionUpdateWithError:](self->_delegate, "subscriber:didFailToRetriveSubscriptionUpdateWithError:", self, v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MSSubscriberDelegate subscriberDidCompleteCheckForNewAssetCollections:](self->_delegate, "subscriberDidCompleteCheckForNewAssetCollections:", self);
  }
  -[NSMutableArray removeAllObjects](self->_assetsBeingRetrieved, "removeAllObjects");
  -[MSObjectQueue allObjectWrappersMaxCount:](self->_retrievalQueue, "allObjectWrappersMaxCount:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  while (objc_msgSend(v6, "count"))
  {
    v8 = (void *)MEMORY[0x1D8255C20]();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          delegate = self->_delegate;
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "object");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSSubscriberDelegate subscriber:didFinishRetrievingAsset:error:](delegate, "subscriber:didFinishRetrievingAsset:error:", self, v15, v5);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v11);
    }

    -[MSObjectQueue removeObjectWrappersFromQueue:](self->_retrievalQueue, "removeObjectWrappersFromQueue:", v9);
    -[MSObjectQueue allObjectWrappersMaxCount:](self->_retrievalQueue, "allObjectWrappersMaxCount:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
    v6 = v7;
  }
  -[MSSubscriber _updateMasterManifest](self, "_updateMasterManifest");

}

- (void)_forget
{
  MSObjectQueue *retrievalQueue;
  MSSubscribeStorageProtocol *storageProtocol;
  MSReauthorizationProtocol *reauthProtocol;

  retrievalQueue = self->_retrievalQueue;
  self->_retrievalQueue = 0;

  storageProtocol = self->_storageProtocol;
  self->_storageProtocol = 0;

  reauthProtocol = self->_reauthProtocol;
  self->_reauthProtocol = 0;

}

- (BOOL)_isInRetryState
{
  return self->_state == 1 || ((self->_retrievalState - 1) & 0xFFFFFFFD) == 0;
}

- (void)_finishedRetrievingAsset:(id)a3
{
  int64_t v4;
  int64_t v5;
  void *v6;
  MSSubscribeStorageProtocol *storageProtocol;
  void *v8;
  MSObjectQueue *retrievalQueue;
  void *v10;
  id v11;

  v4 = +[MSObjectWrapper indexOfObject:inWrapperArray:](MSObjectWrapper, "indexOfObject:inWrapperArray:", a3, self->_assetsBeingRetrieved);
  if (v4 != -1)
  {
    v5 = v4;
    -[NSMutableArray objectAtIndex:](self->_assetsBeingRetrieved, "objectAtIndex:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    storageProtocol = self->_storageProtocol;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSubscribeStorageProtocol didFinishUsingAssets:](storageProtocol, "didFinishUsingAssets:", v8);

    retrievalQueue = self->_retrievalQueue;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSObjectQueue removeObjectWrappersFromQueue:](retrievalQueue, "removeObjectWrappersFromQueue:", v10);

    -[NSMutableArray removeObjectAtIndex:](self->_assetsBeingRetrieved, "removeObjectAtIndex:", v5);
    -[MSSubscriber _updateMasterManifest](self, "_updateMasterManifest");

  }
}

- (void)subscribeStorageProtocol:(id)a3 didFinishRetrievingAsset:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(v9, "setError:", v10);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      -[MSCupidStateMachine personID](self, "personID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Finished retrieving asset.", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(v9, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSubscriber _finishedRetrievingAsset:](self, "_finishedRetrievingAsset:", v9);
    -[MSSubscriberDelegate subscriber:didFinishRetrievingAsset:error:](self->_delegate, "subscriber:didFinishRetrievingAsset:error:", self, v9, 0);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtPath:error:", v14, 0);

  }
}

- (void)subscribeStorageProtocolDidFinishRetrievingAllAssets:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  MSSubscriberDelegate *delegate;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  MSMediaStreamDaemon *daemon;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  id v62;
  int v63;
  void *v64;
  int v65;
  char v66;
  NSMutableArray *obj;
  _QWORD block[5];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    -[MSCupidStateMachine personID](self, "personID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableArray count](self->_assetsBeingRetrieved, "count");
    *(_DWORD *)buf = 138543874;
    v80 = v4;
    v81 = 2112;
    v82 = v6;
    v83 = 2048;
    v84 = v7;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Finished retrieving assets. Checking for errors on %lu assets...", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[MSObjectQueue count](self->_retrievalQueue, "count", 120));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = self->_assetsBeingRetrieved;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
  v64 = v8;
  if (v9)
  {
    v10 = v9;
    v66 = 0;
    v63 = 0;
    v65 = 0;
    v11 = MEMORY[0x1E0C81028];
    v12 = *(_QWORD *)v74;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v74 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v14, "object");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          if (objc_msgSend(v16, "MSCanBeIgnored"))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v42 = (void *)objc_opt_class();
              v43 = v42;
              -[MSCupidStateMachine personID](self, "personID");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "MSVerboseDescription");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v80 = v42;
              v81 = 2112;
              v82 = v44;
              v83 = 2114;
              v84 = (uint64_t)v45;
              _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Ignoring error: %{public}@", buf, 0x20u);

            }
            goto LABEL_65;
          }
          if (objc_msgSend(v17, "MSIsTemporaryNetworkError"))
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v18 = (void *)objc_opt_class();
              v19 = v18;
              -[MSCupidStateMachine personID](self, "personID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v80 = v18;
              v81 = 2112;
              v82 = v20;
              _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Encountered temporary network error.", buf, 0x16u);

              v11 = MEMORY[0x1E0C81028];
            }
            v66 = 1;
          }
          else if (objc_msgSend(v17, "MSIsAuthError"))
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v21 = (void *)objc_opt_class();
              v22 = v21;
              -[MSCupidStateMachine personID](self, "personID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v80 = v21;
              v11 = MEMORY[0x1E0C81028];
              v81 = 2112;
              v82 = v23;
              _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Encountered authentication error.", buf, 0x16u);

            }
            v65 = 1;
          }
          else if (objc_msgSend(v17, "MSIsBadTokenError"))
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v24 = (void *)objc_opt_class();
              v25 = v24;
              -[MSCupidStateMachine personID](self, "personID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v80 = v24;
              v11 = MEMORY[0x1E0C81028];
              v81 = 2112;
              v82 = v26;
              _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Encountered bad asset retrieval token.", buf, 0x16u);

              v8 = v64;
            }
            objc_msgSend(v14, "setErrorCount:", objc_msgSend(v14, "errorCount") + 1);
            if (self->_maxErrorCount <= (int)objc_msgSend(v14, "errorCount"))
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                v39 = (void *)objc_opt_class();
                v40 = v39;
                -[MSCupidStateMachine personID](self, "personID");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v80 = v39;
                v81 = 2112;
                v82 = v41;
                v83 = 2114;
                v84 = (uint64_t)v15;
                _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Too many errors encountered for asset. Aborting download. %{public}@", buf, 0x20u);

              }
              delegate = self->_delegate;
              v28 = (void *)MEMORY[0x1E0CB35C8];
              v29 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_SUBSCRIBER_CANNOT_RETRIEVE"));
              objc_msgSend(v28, "MSErrorWithDomain:code:description:", CFSTR("MSSubscriberErrorDomain"), 5, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSSubscriberDelegate subscriber:didFinishRetrievingAsset:error:](delegate, "subscriber:didFinishRetrievingAsset:error:", self, v15, v30);

              v8 = v64;
              objc_msgSend(v64, "addObject:", v15);
              v63 = 1;
              v11 = MEMORY[0x1E0C81028];
            }
            else
            {
              v63 = 1;
            }
          }
          else
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v35 = (void *)objc_opt_class();
              v36 = v35;
              -[MSCupidStateMachine personID](self, "personID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "MSVerboseDescription");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v80 = v35;
              v8 = v64;
              v81 = 2112;
              v82 = v37;
              v83 = 2114;
              v84 = (uint64_t)v38;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Asset retrieval failed with error: %{public}@", buf, 0x20u);

              v11 = MEMORY[0x1E0C81028];
            }
            objc_msgSend(v8, "addObject:", v15);
            -[MSSubscriberDelegate subscriber:didFinishRetrievingAsset:error:](self->_delegate, "subscriber:didFinishRetrievingAsset:error:", self, v15, v17);
          }
          if (objc_msgSend(v17, "MSNeedsBackoff"))
            -[MSCupidStateMachine _backoffMMCSBackoffTimer](self, "_backoffMMCSBackoffTimer");
          objc_msgSend(v17, "MSMMCSRetryAfterDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            -[MSCupidStateMachine _didReceiveMMCSRetryAfterDate:](self, "_didReceiveMMCSRetryAfterDate:", v31);

        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v32 = (void *)objc_opt_class();
            v33 = v32;
            -[MSCupidStateMachine personID](self, "personID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v80 = v32;
            v8 = v64;
            v81 = 2112;
            v82 = v34;
            v83 = 2114;
            v84 = (uint64_t)v15;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found orphaned asset. Ignoring. %{public}@", buf, 0x20u);

            v11 = MEMORY[0x1E0C81028];
          }
          objc_msgSend(v8, "addObject:", v15);
        }

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v66 = 0;
    v63 = 0;
    v65 = 0;
  }

  objc_msgSend(*(id *)((char *)&self->super.super.isa + v61), "commitErrorCountsForObjectWrappers:", self->_assetsBeingRetrieved);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v46 = v8;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v70 != v49)
          objc_enumerationMutation(v46);
        -[MSSubscriber _finishedRetrievingAsset:](self, "_finishedRetrievingAsset:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v48);
  }

  if (((v63 | v65) & 1) == 0)
    -[MSCupidStateMachine _resetMMCSBackoffTimer](self, "_resetMMCSBackoffTimer");
  daemon = self->_daemon;
  -[MSCupidStateMachine personID](self, "personID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v65 & 1) != 0)
    -[MSMediaStreamDaemon didReceiveAuthenticationFailureForPersonID:](daemon, "didReceiveAuthenticationFailureForPersonID:", v52);
  else
    -[MSMediaStreamDaemon didReceiveAuthenticationSuccessForPersonID:](daemon, "didReceiveAuthenticationSuccessForPersonID:", v52);

  v8 = v64;
  if ((v63 & 1) != 0)
  {
    v53 = 3;
  }
  else
  {
    -[NSMutableArray removeAllObjects](self->_assetsBeingRetrieved, "removeAllObjects");
    v53 = 1;
  }
  -[MSSubscriber _changeRetrievalStateTo:](self, "_changeRetrievalStateTo:", v53);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v54 = (void *)objc_opt_class();
    v55 = v54;
    -[MSCupidStateMachine personID](self, "personID");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v80 = v54;
    v81 = 2112;
    v82 = v56;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ ...Finished handling errors.", buf, 0x16u);

    v8 = v64;
  }
  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  if ((v66 & 1) != 0)
  {
    v57 = v62;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v58 = (void *)objc_opt_class();
      v59 = v58;
      -[MSCupidStateMachine personID](self, "personID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v80 = v58;
      v81 = 2112;
      v82 = v60;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Found temporary network errors during asset downloading. Trying again later.", buf, 0x16u);

      v8 = v64;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MSSubscriber_subscribeStorageProtocolDidFinishRetrievingAllAssets___block_invoke;
    block[3] = &unk_1E95BCED0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_65:
    v57 = v62;
  }

}

- (void)reauthorizationProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  MSMediaStreamDaemon *daemon;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = a4;
    v9 = (void *)objc_opt_class();
    v10 = v9;
    -[MSCupidStateMachine personID](self, "personID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "MSVerboseDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 138543874;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Reauthorization protocol received authentication error: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  daemon = self->_daemon;
  -[MSCupidStateMachine personID](self, "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMediaStreamDaemon didReceiveAuthenticationFailureForPersonID:](daemon, "didReceiveAuthenticationFailureForPersonID:", v7);

  -[MSSubscriber _changeRetrievalStateTo:](self, "_changeRetrievalStateTo:", 3);
  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
}

- (void)reauthorizationProtocol:(id)a3 reauthorizedAssets:(id)a4 rejectedAssets:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  int v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  void *v19;
  MSMediaStreamDaemon *daemon;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  MSSubscribeStorageProtocol *storageProtocol;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id obj;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v10, "count");
  if (!v11 && v12)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_SUBSCRIBER_NOT_AUTH"));
    objc_msgSend(v13, "MSErrorWithDomain:code:description:", CFSTR("MSSubscriberErrorDomain"), 3, v14);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v18 = v17;
      -[MSCupidStateMachine personID](self, "personID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v55 = v17;
      v56 = 2112;
      v57 = v19;
      v58 = 2048;
      v59 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Successfully reauthorized %lu assets.", buf, 0x20u);

    }
    daemon = self->_daemon;
    -[MSCupidStateMachine personID](self, "personID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMediaStreamDaemon didReceiveAuthenticationSuccessForPersonID:](daemon, "didReceiveAuthenticationSuccessForPersonID:", v21);

LABEL_28:
    -[MSObjectQueue commitObjectsWrappers:](self->_retrievalQueue, "commitObjectsWrappers:", self->_assetsBeingRetrieved);
    -[MSSubscriber _retrieveNextAssets](self, "_retrieveNextAssets");
    goto LABEL_29;
  }
  v15 = objc_msgSend(v11, "MSIsTemporaryNetworkError");
  v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v48 = v11;
  if (!v15)
  {
    v45 = v9;
    if (v16)
    {
      v38 = (void *)objc_opt_class();
      v39 = v38;
      -[MSCupidStateMachine personID](self, "personID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v10;
      v42 = objc_msgSend(v10, "count");
      objc_msgSend(v48, "MSVerboseDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v55 = v38;
      v11 = v48;
      v56 = 2112;
      v57 = v40;
      v58 = 2048;
      v59 = v42;
      v10 = v41;
      v60 = 2114;
      v61 = v43;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Reauthorization resulted in %lu rejected assets. Error: %{public}@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v44 = v10;
    obj = v10;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v50;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v50 != v24)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v25);
          if (-[NSMutableArray count](self->_assetsBeingRetrieved, "count"))
          {
            v27 = 0;
            while (1)
            {
              -[NSMutableArray objectAtIndex:](self->_assetsBeingRetrieved, "objectAtIndex:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "object");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "isEqual:", v26);

              if (v30)
                break;

              if (++v27 >= (unint64_t)-[NSMutableArray count](self->_assetsBeingRetrieved, "count"))
                goto LABEL_25;
            }
            objc_msgSend(v46, "addObject:", v28);
            -[NSMutableArray removeObjectAtIndex:](self->_assetsBeingRetrieved, "removeObjectAtIndex:", v27);

          }
LABEL_25:
          -[MSSubscriber _finishedRetrievingAsset:](self, "_finishedRetrievingAsset:", v26);
          v11 = v48;
          -[MSSubscriberDelegate subscriber:didFinishRetrievingAsset:error:](self->_delegate, "subscriber:didFinishRetrievingAsset:error:", self, v26, v48);
          ++v25;
        }
        while (v25 != v23);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v23);
    }

    storageProtocol = self->_storageProtocol;
    +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", v46);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSubscribeStorageProtocol didFinishUsingAssets:](storageProtocol, "didFinishUsingAssets:", v32);

    -[MSObjectQueue removeObjectWrappersFromQueue:](self->_retrievalQueue, "removeObjectWrappersFromQueue:", v46);
    -[MSSubscriber _updateMasterManifest](self, "_updateMasterManifest");

    v10 = v44;
    v9 = v45;
    goto LABEL_28;
  }
  if (v16)
  {
    v33 = (void *)objc_opt_class();
    v34 = v33;
    -[MSCupidStateMachine personID](self, "personID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "MSVerboseDescription");
    v36 = v10;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v55 = v33;
    v56 = 2112;
    v57 = v35;
    v58 = 2114;
    v59 = (uint64_t)v37;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Encountered temporary network error during subscription update. Trying again later. Error :%{public}@", buf, 0x20u);

    v10 = v36;
    v11 = v48;
  }
  -[MSObjectQueue commitObjectsWrappers:](self->_retrievalQueue, "commitObjectsWrappers:", self->_assetsBeingRetrieved);
  -[MSSubscriber _changeRetrievalStateTo:](self, "_changeRetrievalStateTo:", 1);
  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
LABEL_29:

}

- (MSSubscriberDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSSubscriberDelegate *)a3;
}

- (MSMediaStreamDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  self->_daemon = (MSMediaStreamDaemon *)a3;
}

- (int64_t)targetRetrievalByteCount
{
  return self->_targetRetrievalByteCount;
}

- (void)setTargetRetrievalByteCount:(int64_t)a3
{
  self->_targetRetrievalByteCount = a3;
}

- (int)retrievalBatchSize
{
  return self->_retrievalBatchSize;
}

- (void)setRetrievalBatchSize:(int)a3
{
  self->_retrievalBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsBeingRetrieved, 0);
  objc_storeStrong((id *)&self->_retrievalQueue, 0);
  objc_storeStrong((id *)&self->_reauthProtocol, 0);
  objc_storeStrong((id *)&self->_storageProtocol, 0);
  objc_storeStrong((id *)&self->_newSubscriptionsByStreamID, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

uint64_t __69__MSSubscriber_subscribeStorageProtocolDidFinishRetrievingAllAssets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retrieveAssets");
}

uint64_t __54__MSSubscriber__didFinishRetrievingSubscriptionUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkForNewAssetCollections");
}

+ (id)subscriberForPersonID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  MSSubscriber *v7;
  MSSubscriber *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)_subscriberByID;
    if (!_subscriberByID)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = (void *)_subscriberByID;
      _subscriberByID = (uint64_t)v5;

      v4 = (void *)_subscriberByID;
    }
    objc_msgSend(v4, "objectForKey:", v3);
    v7 = (MSSubscriber *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = [MSSubscriber alloc];
      MSPlatform();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "baseURLForPersonID:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MSSubscriber initWithPersonID:baseURL:](v8, "initWithPersonID:baseURL:", v3, v10);

      objc_msgSend((id)_subscriberByID, "setObject:forKey:", v7, v3);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)existingSubscriberForPersonID:(id)a3
{
  return (id)objc_msgSend((id)_subscriberByID, "objectForKey:", a3);
}

+ (id)_clearInstantiatedSubscribersByPersonID
{
  id v2;
  void *v3;

  v2 = (id)_subscriberByID;
  v3 = (void *)_subscriberByID;
  _subscriberByID = 0;

  return v2;
}

+ (void)forgetPersonID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)_subscriberByID, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "forget");
    objc_msgSend((id)_subscriberByID, "removeObjectForKey:", v5);
  }

}

+ (void)_setMasterNextActivityDate:(id)a3 forPersonID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    _masterNextActivityDateByPersonID_302();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
      objc_msgSend(v7, "setObject:forKey:", v5, v6);
    else
      objc_msgSend(v7, "removeObjectForKey:", v6);
    _commitMasterManifest_275();
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v8 = v10;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - Found empty person ID.", (uint8_t *)&v9, 0xCu);
LABEL_8:

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
  _masterNextActivityDateByPersonID_302();
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
  _masterNextActivityDateByPersonID_302();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)personIDsWithOutstandingActivities
{
  void *v2;
  void *v3;

  _masterNextActivityDateByPersonID_302();
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
  objc_msgSend((id)_subscriberByID, "allValues", 0);
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
  objc_msgSend((id)_subscriberByID, "allValues", 0);
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

+ (id)_descriptionForState:(int)a3
{
  if (a3 > 2)
    return CFSTR("???");
  else
    return off_1E95BA930[a3];
}

+ (id)_descriptionForRetrievalState:(int)a3
{
  if (a3 > 4)
    return CFSTR("???");
  else
    return off_1E95BA948[a3];
}

@end
