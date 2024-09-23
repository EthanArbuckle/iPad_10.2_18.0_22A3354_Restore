@implementation MSMediaStreamDaemon

- (MSMediaStreamDaemon)init
{
  MSMediaStreamDaemon *v2;
  NSCountedSet *v3;
  NSCountedSet *retainedObjects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSMediaStreamDaemon;
  v2 = -[MSDaemon init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    retainedObjects = v2->_retainedObjects;
    v2->_retainedObjects = v3;

  }
  return v2;
}

- (id)nextActivityDate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  +[MSPublisher nextActivityDate](MSPublisher, "nextActivityDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSSubscriber nextActivityDate](MSSubscriber, "nextActivityDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (!v2 || objc_msgSend(v2, "compare:", v3) == 1))
  {
    v4 = v3;

    v2 = v4;
  }
  +[MSDeleter nextActivityDate](MSDeleter, "nextActivityDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (!v2 || objc_msgSend(v2, "compare:", v5) == 1))
  {
    v6 = v5;

    v2 = v6;
  }
  v7 = v2;

  return v7;
}

- (BOOL)hasOutstandingActivity
{
  void *v2;
  BOOL v3;

  -[MSMediaStreamDaemon nextActivityDate](self, "nextActivityDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)personIDHasOutstandingPublications:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[MSPublisher personIDsWithOutstandingActivities](MSPublisher, "personIDsWithOutstandingActivities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (BOOL)isInRetryState
{
  return +[MSPublisher isInRetryState](MSPublisher, "isInRetryState")
      || +[MSSubscriber isInRetryState](MSSubscriber, "isInRetryState")
      || +[MSDeleter isInRetryState](MSDeleter, "isInRetryState");
}

- (void)didIdle
{
  id v3;

  -[MSMediaStreamDaemon delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaStreamDaemonDidIdle:", self);

}

- (void)didUnidle
{
  id v3;

  -[MSMediaStreamDaemon delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaStreamDaemonDidUnidle:", self);

}

- (id)_boundPublisherForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MSPublisher publisherForPersonID:](MSPublisher, "publisherForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  MSPlatform();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "publisherPluginClass");

  objc_msgSend(v8, "publisherPluginForPersonID:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[NSCountedSet addObject:](self->_retainedObjects, "addObject:", v9);
    objc_msgSend(v10, "publisherWillAssignPluginAsDelegateOfPublisher:", v5);
    objc_msgSend(v5, "setDelegate:", v10);
    objc_msgSend(v5, "setDaemon:", self);

LABEL_4:
    v11 = v5;
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 134218242;
    v14 = v4;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get publisher plugin, person id %p, plugin class %{public}@", (uint8_t *)&v13, 0x16u);
  }
  v11 = 0;
LABEL_5:

  return v11;
}

- (id)_boundSubscriberForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MSSubscriber subscriberForPersonID:](MSSubscriber, "subscriberForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_6:
    v11 = v5;
    goto LABEL_7;
  }
  MSPlatform();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "subscriberPluginClass");

  objc_msgSend(v8, "subscriberPluginForPersonID:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[NSCountedSet addObject:](self->_retainedObjects, "addObject:", v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "subscriberWillAssignPluginAsDelegateOfSubscriber:", v5);
    objc_msgSend(v5, "setDelegate:", v10);
    objc_msgSend(v5, "setDaemon:", self);

    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 134218242;
    v14 = v4;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get subscriber plugin, person id %p, plugin class %{public}@", (uint8_t *)&v13, 0x16u);
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)_boundDeleterForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MSDeleter deleterForPersonID:](MSDeleter, "deleterForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    MSPlatform();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      MSPlatform();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "deletePluginClass");

      objc_msgSend(v11, "deleterPluginForPersonID:", v4);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        -[NSCountedSet addObject:](self->_retainedObjects, "addObject:", v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "deleterWillAssignPluginAsDelegateOfDeleter:", v5);
        objc_msgSend(v5, "setDelegate:", v13);
        objc_msgSend(v5, "setDaemon:", self);

        goto LABEL_2;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v15 = 134218242;
        v16 = v4;
        v17 = 2114;
        v18 = v11;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get deleter plugin, person id %p, plugin class %{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
    v7 = 0;
    goto LABEL_11;
  }
LABEL_2:
  v7 = v5;
LABEL_11:

  return v7;
}

- (id)_boundServerSideConfigManagerForPersonID:(id)a3
{
  void *v4;

  +[MSServerSideConfigManager configManagerForPersonID:](MSServerSideConfigManager, "configManagerForPersonID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDaemon:", self);
  return v4;
}

- (void)retryOutstandingActivities
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD block[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[MSDaemon retainBusy](self, "retainBusy");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  +[MSPublisher personIDsWithOutstandingActivities](MSPublisher, "personIDsWithOutstandingActivities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v43;
    v8 = MEMORY[0x1E0C80D38];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(v3);
        -[MSMediaStreamDaemon _boundPublisherForPersonID:](self, "_boundPublisherForPersonID:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke;
        block[3] = &unk_1E95BCED0;
        v41 = v10;
        v11 = v10;
        dispatch_async(v8, block);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v6);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  +[MSSubscriber personIDsWithOutstandingActivities](MSSubscriber, "personIDsWithOutstandingActivities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v37;
    v16 = MEMORY[0x1E0C80D38];
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v12);
        -[MSMediaStreamDaemon _boundSubscriberForPersonID:](self, "_boundSubscriberForPersonID:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v5;
        v34[1] = 3221225472;
        v34[2] = __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke_2;
        v34[3] = &unk_1E95BCED0;
        v35 = v18;
        v19 = v18;
        dispatch_async(v16, v34);

        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v14);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  +[MSDeleter personIDsWithOutstandingActivities](MSDeleter, "personIDsWithOutstandingActivities");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    v24 = MEMORY[0x1E0C80D38];
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        -[MSMediaStreamDaemon _boundDeleterForPersonID:](self, "_boundDeleterForPersonID:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v25));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v5;
        v28[1] = 3221225472;
        v28[2] = __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke_3;
        v28[3] = &unk_1E95BCED0;
        v29 = v26;
        v27 = v26;
        dispatch_async(v24, v28);

        ++v25;
      }
      while (v22 != v25);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    }
    while (v22);
  }

  -[MSDaemon releaseBusy](self, "releaseBusy");
}

- (void)reenqueueQuarantinedActivitiesWithReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  MSMediaStreamDaemon *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSDaemon retainBusy](self, "retainBusy");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Reenqueuing quarantined activities. Reason: %{public}@.", buf, 0x16u);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[MSPublisher personIDsWithOutstandingActivities](MSPublisher, "personIDsWithOutstandingActivities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[MSMediaStreamDaemon _boundPublisherForPersonID:](self, "_boundPublisherForPersonID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "reenqueueQuarantinedAssetCollections");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[MSDaemon releaseBusy](self, "releaseBusy");
}

- (void)abortAllActivityForPersonID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Aborting all activities for person ID %@.", (uint8_t *)&v8, 0xCu);
  }
  +[MSPublisher existingPublisherForPersonID:](MSPublisher, "existingPublisherForPersonID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "abort");

  +[MSSubscriber existingSubscriberForPersonID:](MSSubscriber, "existingSubscriberForPersonID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "abort");

  +[MSDeleter existingDeleterForPersonID:](MSDeleter, "existingDeleterForPersonID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "abort");

  +[MSServerSideConfigManager existingConfigManagerForPersonID:](MSServerSideConfigManager, "existingConfigManagerForPersonID:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "abort");

}

- (void)stopAllActivities
{
  +[MSPublisher stopAllActivities](MSPublisher, "stopAllActivities");
  +[MSSubscriber stopAllActivities](MSSubscriber, "stopAllActivities");
  +[MSDeleter stopAllActivities](MSDeleter, "stopAllActivities");
  +[MSServerSideConfigManager abortAllActivities](MSServerSideConfigManager, "abortAllActivities");
}

- (void)forgetPersonID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Forgetting everything about person ID %@...", (uint8_t *)&v12, 0xCu);
  }
  +[MSPublisher forgetPersonID:](MSPublisher, "forgetPersonID:", v3);
  +[MSSubscriber forgetPersonID:](MSSubscriber, "forgetPersonID:", v3);
  +[MSDeleter forgetPersonID:](MSDeleter, "forgetPersonID:", v3);
  +[MSServerSideConfigManager forgetPersonID:](MSServerSideConfigManager, "forgetPersonID:", v3);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MSPathPublishDirForPersonID(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v5, 0);

  MSPathPublishMMCSLibraryForPersonID(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v6, 0);

  MSPathSubscribeDirForPersonID(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v7, 0);

  MSPathSubscribeMMCSLibraryForPersonID(v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v8, 0);

  MSPathShareDirForPersonID(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v9, 0);

  MSPathDeleteDirForPersonID(v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v10, 0);

  MSPathConfigDirForPersonID(v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v11, 0);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Person ID %@ forgotten.", (uint8_t *)&v12, 0xCu);
  }

}

- (BOOL)enqueueAssetCollection:(id)a3 personID:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v14;

  v8 = a4;
  v9 = a3;
  -[MSDaemon retainBusy](self, "retainBusy");
  -[MSMediaStreamDaemon _boundPublisherForPersonID:](self, "_boundPublisherForPersonID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MSMediaStreamDaemon_enqueueAssetCollection_personID_outError___block_invoke;
  block[3] = &unk_1E95BCED0;
  v14 = v10;
  v11 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  LOBYTE(a5) = objc_msgSend(v11, "enqueueAssetCollections:outError:", v9, a5);

  -[MSDaemon releaseBusy](self, "releaseBusy");
  return (char)a5;
}

- (BOOL)dequeueAssetCollectionWithGUIDs:(id)a3 personID:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;

  v8 = a3;
  v9 = a4;
  -[MSDaemon retainBusy](self, "retainBusy");
  -[MSMediaStreamDaemon _boundPublisherForPersonID:](self, "_boundPublisherForPersonID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    LOBYTE(a5) = objc_msgSend(v10, "dequeueAssetCollectionWithGUIDs:outError:", v8, a5);
  }
  else if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISHER_MISSING"));
    objc_msgSend(v11, "MSErrorWithDomain:code:description:", CFSTR("MSPublisherErrorDomain"), 9, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }
  -[MSDaemon releaseBusy](self, "releaseBusy");

  return (char)a5;
}

- (void)pollForSubscriptionUpdatesForPersonID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[MSDaemon retainBusy](self, "retainBusy");
  -[MSMediaStreamDaemon _boundSubscriberForPersonID:](self, "_boundSubscriberForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MSMediaStreamDaemon_pollForSubscriptionUpdatesForPersonID___block_invoke;
  block[3] = &unk_1E95BCED0;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  -[MSDaemon releaseBusy](self, "releaseBusy");

}

- (void)pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  MSMediaStreamDaemon *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSDaemon retainBusy](self, "retainBusy");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Push notification received for My Photo Stream with targetPersonID %@.", (uint8_t *)&v9, 0x16u);
  }
  MSPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "subscriberPluginClass");

  objc_msgSend(v6, "personIDForPollingTriggeredByPushNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_msgSend(v7, "isEqualToString:", v4);
    if (!v4 || v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v9 = 138543362;
        v10 = self;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Serving push notification", (uint8_t *)&v9, 0xCu);
      }
      -[MSMediaStreamDaemon didReceivePushNotificationForPersonID:](self, "didReceivePushNotificationForPersonID:", v7);
      -[MSMediaStreamDaemon pollForSubscriptionUpdatesForPersonID:](self, "pollForSubscriptionUpdatesForPersonID:", v7);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "The subscription plugin class does not support push notification refreshing.", (uint8_t *)&v9, 2u);
  }
  -[MSDaemon releaseBusy](self, "releaseBusy");

}

- (void)resetSubscriberSyncForPersonID:(id)a3
{
  id v3;

  -[MSMediaStreamDaemon _boundSubscriberForPersonID:](self, "_boundSubscriberForPersonID:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetSync");

}

- (void)computeHashForAsset:(id)a3 personID:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[MSMediaStreamDaemon _boundPublisherForPersonID:](self, "_boundPublisherForPersonID:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "computeHashForAsset:", v6);

}

- (id)subscribedStreamsForPersonID:(id)a3
{
  void *v3;
  void *v4;

  -[MSMediaStreamDaemon _boundSubscriberForPersonID:](self, "_boundSubscriberForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscribedStreams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ownSubscribedStreamForPersonID:(id)a3
{
  void *v3;
  void *v4;

  -[MSMediaStreamDaemon _boundSubscriberForPersonID:](self, "_boundSubscriberForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ownSubscribedStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)serverSideConfigurationForPersonID:(id)a3
{
  void *v3;
  void *v4;

  -[MSMediaStreamDaemon _boundServerSideConfigManagerForPersonID:](self, "_boundServerSideConfigManagerForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didReceiveServerSideConfigurationVersion:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[MSMediaStreamDaemon serverSideConfigurationForPersonID:](self, "serverSideConfigurationForPersonID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("mme.streams.application.configVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
    {
      v12 = objc_msgSend(v6, "isEqualToString:", v10);

      if ((v12 & 1) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Not refreshing server-side configuration.", buf, 2u);
        }
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Server-side configuration has changed. Refreshing configuration.", buf, 2u);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__MSMediaStreamDaemon_didReceiveServerSideConfigurationVersion_forPersonID___block_invoke;
  v13[3] = &unk_1E95BCFC0;
  v13[4] = self;
  v14 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

LABEL_10:
}

- (void)refreshServerSideConfigurationForPersonID:(id)a3
{
  id v3;

  -[MSMediaStreamDaemon _boundServerSideConfigManagerForPersonID:](self, "_boundServerSideConfigManagerForPersonID:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshConfiguration");

}

- (void)didReceiveNewServerSideConfigurationForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Sending local notification about new server-side configuration for %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v4, CFSTR("personID"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MSMSDServerSideConfigurationDidChangeNotification"), self, v6);

}

- (void)deleteAssetCollections:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MSDaemon retainBusy](self, "retainBusy");
  -[MSMediaStreamDaemon _boundDeleterForPersonID:](self, "_boundDeleterForPersonID:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "deleteAssetCollections:", v7);
  -[MSDaemon releaseBusy](self, "releaseBusy");

}

- (void)start
{
  dispatch_time_t v3;
  _QWORD block[5];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Media stream daemon starting...", buf, 2u);
  }
  v3 = dispatch_time(0, 10000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MSMediaStreamDaemon_start__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

- (void)stop
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *context;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Media stream daemon stopping.", buf, 2u);
  }
  context = (void *)MEMORY[0x1D8255C20](-[MSMediaStreamDaemon stopAllActivities](self, "stopAllActivities"));
  +[MSPublisher _clearInstantiatedPublishersByPersonID](MSPublisher, "_clearInstantiatedPublishersByPersonID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "publisherWillDeassignPluginAsDelegateOfPublisher:", v8);
          objc_msgSend(v8, "setDelegate:", 0);
          -[NSCountedSet removeObject:](self->_retainedObjects, "removeObject:", v9);
        }
        objc_msgSend(v8, "deactivate");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v5);
  }
  +[MSSubscriber _clearInstantiatedSubscribersByPersonID](MSSubscriber, "_clearInstantiatedSubscribersByPersonID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "subscriberWillDeassignPluginAsDelegateOfSubscriber:", v15);
          objc_msgSend(v15, "setDelegate:", 0);
          -[NSCountedSet removeObject:](self->_retainedObjects, "removeObject:", v16);
        }
        objc_msgSend(v15, "deactivate");

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(context);
}

- (void)didReceiveAuthenticationFailureForPersonID:(id)a3
{
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = a3;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Received authentication failure for person ID %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didReceiveAuthenticationSuccessForPersonID:(id)a3
{
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = a3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Successfully authenticated person ID %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didExceedPublishQuotaForPersonID:(id)a3 retryDate:(id)a4
{
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = a3;
    v8 = 2114;
    v9 = a4;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Received quota excess failure for person ID %@. Next retry date: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)mayDownloadPersonID:(id)a3
{
  return 1;
}

- (MSMediaStreamDaemonDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSMediaStreamDaemonDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedObjects, 0);
}

void __28__MSMediaStreamDaemon_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  MSPlatform();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "subscriberPluginClass");

  objc_msgSend(v3, "personIDForPollingTriggeredByPushNotification");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "retainBusy");
    objc_msgSend(*(id *)(a1 + 32), "_boundSubscriberForPersonID:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "checkForNewAssetCollectionsIfMissingCtag");
    objc_msgSend(*(id *)(a1 + 32), "releaseBusy");
    objc_msgSend(*(id *)(a1 + 32), "retryOutstandingActivities");

  }
}

uint64_t __76__MSMediaStreamDaemon_didReceiveServerSideConfigurationVersion_forPersonID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshServerSideConfigurationForPersonID:", *(_QWORD *)(a1 + 40));
}

uint64_t __61__MSMediaStreamDaemon_pollForSubscriptionUpdatesForPersonID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkForNewAssetCollections");
}

uint64_t __64__MSMediaStreamDaemon_enqueueAssetCollection_personID_outError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

uint64_t __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

uint64_t __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkForOutstandingActivities");
}

uint64_t __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performOutstandingActivities");
}

@end
