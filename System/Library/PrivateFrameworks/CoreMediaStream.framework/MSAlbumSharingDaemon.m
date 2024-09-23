@implementation MSAlbumSharingDaemon

- (MSAlbumSharingDaemon)init
{
  MSAlbumSharingDaemon *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *mapQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *personIDToStateMachineMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *personIDToDelegateMap;
  MSASDaemonModel *v11;
  MSASDaemonModel *daemonModel;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MSAlbumSharingDaemon;
  v2 = -[MSDaemon init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MSAlbumSharingDaemon map queue", MEMORY[0x1E0C80D50]);
    mapQueue = v2->_mapQueue;
    v2->_mapQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("MSAlbumSharingDaemon work queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    personIDToStateMachineMap = v2->_personIDToStateMachineMap;
    v2->_personIDToStateMachineMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    personIDToDelegateMap = v2->_personIDToDelegateMap;
    v2->_personIDToDelegateMap = v9;

    v11 = objc_alloc_init(MSASDaemonModel);
    daemonModel = v2->_daemonModel;
    v2->_daemonModel = v11;

  }
  return v2;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__MSAlbumSharingDaemon_start__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)shutDown
{
  NSObject *v3;
  _QWORD block[5];

  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MSAlbumSharingDaemon_shutDown__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)mapQueueShutDownStateMachineInMap:(id)a3 personIDs:(id)a4 index:(unint64_t)a5 forDestruction:(BOOL)a6 completionBlock:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  void (**v20)(_QWORD);
  unint64_t v21;
  BOOL v22;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(_QWORD))a7;
  if (objc_msgSend(v13, "count") <= a5)
  {
    if (v14)
      v14[2](v14);
  }
  else
  {
    objc_msgSend(v13, "objectAtIndex:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __105__MSAlbumSharingDaemon_mapQueueShutDownStateMachineInMap_personIDs_index_forDestruction_completionBlock___block_invoke;
    v17[3] = &unk_1E95BAF40;
    v17[4] = self;
    v18 = v12;
    v19 = v13;
    v21 = a5;
    v22 = v8;
    v20 = v14;
    -[MSAlbumSharingDaemon shutDownStateMachine:forDestruction:completionBlock:](self, "shutDownStateMachine:forDestruction:completionBlock:", v16, v8, v17);

  }
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)nextActivityDate
{
  return -[MSASDaemonModel earliestNextActivityDate](self->_daemonModel, "earliestNextActivityDate");
}

- (void)didIdle
{
  id WeakRetained;
  objc_super v4;
  uint8_t buf[4];
  MSAlbumSharingDaemon *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Idled.", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "MSAlbumSharingDaemonDidIdle:", self);

  v4.receiver = self;
  v4.super_class = (Class)MSAlbumSharingDaemon;
  -[MSDaemon didIdle](&v4, sel_didIdle);
}

- (void)didUnidle
{
  id WeakRetained;
  objc_super v4;
  uint8_t buf[4];
  MSAlbumSharingDaemon *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Unidled.", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)MSAlbumSharingDaemon;
  -[MSDaemon didUnidle](&v4, sel_didUnidle);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "MSAlbumSharingDaemonDidUnidle:", self);

}

- (void)setFocusAlbumGUID:(id)a3 forPersonID:(id)a4
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
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MSAlbumSharingDaemon_setFocusAlbumGUID_forPersonID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)setFocusAssetCollectionGUID:(id)a3 forPersonID:(id)a4
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
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MSAlbumSharingDaemon_setFocusAssetCollectionGUID_forPersonID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (BOOL)isInRetryState
{
  MSAlbumSharingDaemon *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSAlbumSharingDaemon mapQueue](self, "mapQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MSAlbumSharingDaemon_isInRetryState__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isWaitingForAuth
{
  return 0;
}

- (BOOL)hasCommandsInGroupedCommandQueue
{
  MSAlbumSharingDaemon *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSAlbumSharingDaemon mapQueue](self, "mapQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__MSAlbumSharingDaemon_hasCommandsInGroupedCommandQueue__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)retryOutstandingActivities
{
  NSObject *v3;
  _QWORD block[5];

  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MSAlbumSharingDaemon_retryOutstandingActivities__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)retryOutstandingActivitiesForPersonID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__MSAlbumSharingDaemon_retryOutstandingActivitiesForPersonID___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)stopAssetDownloadsForPersonID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)cancelActivitiesForPersonID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__MSAlbumSharingDaemon_cancelActivitiesForPersonID___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)addAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  void *v14;

  v4 = a3;
  -[MSAlbumSharingDaemon updateOwnerReputationScoreForAlbum:](self, "updateOwnerReputationScoreForAlbum:", v4);
  MSASPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "pluginClass");

  objc_msgSend(v6, "MSASPersonIDForPollingTriggeredByPushNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__MSAlbumSharingDaemon_addAlbum___block_invoke;
  v11[3] = &unk_1E95BAF90;
  v11[4] = self;
  v12 = v7;
  v13 = v4;
  v14 = v6;
  v9 = v4;
  v10 = v7;
  dispatch_async(v8, v11);

}

- (void)deleteAlbumWithGUID:(id)a3 inviterAddress:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a3;
  MSASPlatform();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "pluginClass");

  objc_msgSend(v7, "didFindDeletedAlbumWithGUID:inviterAddress:", v8, v5);
}

- (id)personIDListeningToPushNotification
{
  void *v2;
  void *v3;

  MSASPlatform();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "pluginClass");

  return (id)objc_msgSend(v3, "MSASPersonIDForPollingTriggeredByPushNotification");
}

- (void)pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__MSAlbumSharingDaemon_pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setNextActivityDate:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  MSAlbumSharingDaemon *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MSAlbumSharingDaemon mapQueue](self, "mapQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MSAlbumSharingDaemon_setNextActivityDate_forPersonID___block_invoke;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v10 = v7;
    v11 = v6;
    dispatch_barrier_async(v8, block);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Not setting next activity date for a nil person ID.", buf, 0xCu);
  }

}

- (void)sendServerSideConfigurationDidChangeNotificationForPersonID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MSAlbumSharingDaemon *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__MSAlbumSharingDaemon_sendServerSideConfigurationDidChangeNotificationForPersonID___block_invoke;
  v6[3] = &unk_1E95BCFC0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (id)existingModelForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MSAlbumSharingDaemon existingStateMachineForPersonID:](self, "existingStateMachineForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EFE40490) & 1) == 0)
      __assert_rtn("-[MSAlbumSharingDaemon existingModelForPersonID:]", "MSAlbumSharingDaemon.m", 354, "[delegate conformsToProtocol:@protocol(MSASModel)]");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)modelForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MSAlbumSharingDaemon boundStateMachineForPersonID:](self, "boundStateMachineForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "conformsToProtocol:", &unk_1EFE40490) & 1) == 0)
    __assert_rtn("-[MSAlbumSharingDaemon modelForPersonID:]", "MSAlbumSharingDaemon.m", 365, "[delegate conformsToProtocol:@protocol(MSASModel)]");

  return v7;
}

- (void)refreshResetSync:(BOOL)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon refreshResetSync:personID:info:](self, "refreshResetSync:personID:info:", a3, a4, 0);
}

- (void)refreshResetSync:(BOOL)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__MSAlbumSharingDaemon_refreshResetSync_personID_info___block_invoke;
  v13[3] = &unk_1E95BC438;
  v13[4] = self;
  v14 = v8;
  v16 = a3;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5
{
  -[MSAlbumSharingDaemon refreshContentOfAlbumWithGUID:resetSync:personID:info:](self, "refreshContentOfAlbumWithGUID:resetSync:personID:info:", a3, a4, a5, 0);
}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MSAlbumSharingDaemon_refreshContentOfAlbumWithGUID_resetSync_personID_info___block_invoke;
  block[3] = &unk_1E95BC698;
  block[4] = self;
  v18 = v11;
  v21 = a4;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(v13, block);

}

- (void)refreshAccessControlListOfAlbumWithGUID:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon refreshAccessControlListOfAlbumWithGUID:personID:info:](self, "refreshAccessControlListOfAlbumWithGUID:personID:info:", a3, a4, 0);
}

- (void)refreshAccessControlListOfAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__MSAlbumSharingDaemon_refreshAccessControlListOfAlbumWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5
{
  -[MSAlbumSharingDaemon refreshCommentsForAssetCollectionWithGUID:resetSync:personID:info:](self, "refreshCommentsForAssetCollectionWithGUID:resetSync:personID:info:", a3, a4, a5, 0);
}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__MSAlbumSharingDaemon_refreshCommentsForAssetCollectionWithGUID_resetSync_personID_info___block_invoke;
  block[3] = &unk_1E95BC698;
  block[4] = self;
  v18 = v11;
  v21 = a4;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(v13, block);

}

- (void)addAlbum:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon addAlbum:personID:info:](self, "addAlbum:personID:info:", a3, a4, 0);
}

- (void)addAlbum:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__MSAlbumSharingDaemon_addAlbum_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon modifyAlbumMetadata:personID:info:](self, "modifyAlbumMetadata:personID:info:", a3, a4, 0);
}

- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__MSAlbumSharingDaemon_modifyAlbumMetadata_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon deleteAlbumWithGUID:personID:info:](self, "deleteAlbumWithGUID:personID:info:", a3, a4, 0);
}

- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__MSAlbumSharingDaemon_deleteAlbumWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon markAlbumGUIDAsViewed:personID:info:](self, "markAlbumGUIDAsViewed:personID:info:", a3, a4, 0);
}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 info:(id)a5
{
  -[MSAlbumSharingDaemon markAlbumGUIDAsViewed:personID:moveLastViewedAssetCollectionMarker:info:](self, "markAlbumGUIDAsViewed:personID:moveLastViewedAssetCollectionMarker:info:", a3, a4, 1, a5);
}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 moveLastViewedAssetCollectionMarker:(BOOL)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__MSAlbumSharingDaemon_markAlbumGUIDAsViewed_personID_moveLastViewedAssetCollectionMarker_info___block_invoke;
  block[3] = &unk_1E95BC698;
  block[4] = self;
  v18 = v11;
  v21 = a5;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(v13, block);

}

- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon subscribeToAlbumWithGUID:personID:info:](self, "subscribeToAlbumWithGUID:personID:info:", a3, a4, 0);
}

- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__MSAlbumSharingDaemon_subscribeToAlbumWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon unsubscribeFromAlbumWithGUID:personID:info:](self, "unsubscribeFromAlbumWithGUID:personID:info:", a3, a4, 0);
}

- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__MSAlbumSharingDaemon_unsubscribeFromAlbumWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)markAsSpamAlbumWithGUID:(id)a3 personID:(id)a4
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
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MSAlbumSharingDaemon_markAsSpamAlbumWithGUID_personID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)markAsSpamInvitationWithGUID:(id)a3 personID:(id)a4
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
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MSAlbumSharingDaemon_markAsSpamInvitationWithGUID_personID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)markAsSpamInvitationWithToken:(id)a3 personID:(id)a4
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
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MSAlbumSharingDaemon_markAsSpamInvitationWithToken_personID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__MSAlbumSharingDaemon_acceptInvitationWithToken_personID_completionBlock___block_invoke;
  v10[3] = &unk_1E95BC4B0;
  v11 = v8;
  v9 = v8;
  -[MSAlbumSharingDaemon acceptInvitationWithToken:personID:info:completionBlock:](self, "acceptInvitationWithToken:personID:info:completionBlock:", a3, a4, 0, v10);

}

- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MSAlbumSharingDaemon_acceptInvitationWithToken_personID_info_completionBlock___block_invoke;
  block[3] = &unk_1E95BC900;
  block[4] = self;
  v20 = v11;
  v21 = v10;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  dispatch_async(v14, block);

}

- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon acceptInvitationWithGUID:personID:info:](self, "acceptInvitationWithGUID:personID:info:", a3, a4, 0);
}

- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__MSAlbumSharingDaemon_acceptInvitationWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon rejectInvitationWithGUID:personID:info:](self, "rejectInvitationWithGUID:personID:info:", a3, a4, 0);
}

- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__MSAlbumSharingDaemon_rejectInvitationWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5
{
  -[MSAlbumSharingDaemon addAccessControlEntries:toAlbumWithGUID:personID:info:](self, "addAccessControlEntries:toAlbumWithGUID:personID:info:", a3, a4, a5, 0);
}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MSAlbumSharingDaemon_addAccessControlEntries_toAlbumWithGUID_personID_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  dispatch_async(v14, block);

}

- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon removeAccessControlEntryWithGUID:personID:info:](self, "removeAccessControlEntryWithGUID:personID:info:", a3, a4, 0);
}

- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__MSAlbumSharingDaemon_removeAccessControlEntryWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__MSAlbumSharingDaemon_setPublicAccessEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke;
  v12[3] = &unk_1E95BC4B0;
  v13 = v10;
  v11 = v10;
  -[MSAlbumSharingDaemon setPublicAccessEnabled:forAlbumWithGUID:personID:info:completionBlock:](self, "setPublicAccessEnabled:forAlbumWithGUID:personID:info:completionBlock:", v8, a4, a5, 0, v12);

}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v11 = a4;
  v12 = a5;
  v13 = a7;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__MSAlbumSharingDaemon_setPublicAccessEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke;
  block[3] = &unk_1E95BC5A8;
  block[4] = self;
  v19 = v12;
  v22 = a3;
  v20 = v11;
  v21 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v12;
  dispatch_async(v14, block);

}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__MSAlbumSharingDaemon_setMultipleContributorsEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke;
  v12[3] = &unk_1E95BC4B0;
  v13 = v10;
  v11 = v10;
  -[MSAlbumSharingDaemon setMultipleContributorsEnabled:forAlbumWithGUID:personID:info:completionBlock:](self, "setMultipleContributorsEnabled:forAlbumWithGUID:personID:info:completionBlock:", v8, a4, a5, 0, v12);

}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __102__MSAlbumSharingDaemon_setMultipleContributorsEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke;
  v21[3] = &unk_1E95BC9E0;
  v21[4] = self;
  v22 = v13;
  v26 = a3;
  v23 = v12;
  v24 = v14;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  dispatch_async(v16, v21);

}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5
{
  -[MSAlbumSharingDaemon addAssetCollections:toAlbumWithGUID:personID:info:](self, "addAssetCollections:toAlbumWithGUID:personID:info:", a3, a4, a5, 0);
}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MSAlbumSharingDaemon_addAssetCollections_toAlbumWithGUID_personID_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  dispatch_async(v14, block);

}

- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon deleteAssetCollectionWithGUID:personID:info:](self, "deleteAssetCollectionWithGUID:personID:info:", a3, a4, 0);
}

- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__MSAlbumSharingDaemon_deleteAssetCollectionWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)deleteAssetCollectionsWithGUIDs:(id)a3 personID:(id)a4
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
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MSAlbumSharingDaemon_deleteAssetCollectionsWithGUIDs_personID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5
{
  -[MSAlbumSharingDaemon markCommentsForAssetCollectionWithGUID:asViewedWithLastViewedDate:personID:info:](self, "markCommentsForAssetCollectionWithGUID:asViewedWithLastViewedDate:personID:info:", a3, a4, a5, 0);
}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__MSAlbumSharingDaemon_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_personID_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  dispatch_async(v14, block);

}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5
{
  -[MSAlbumSharingDaemon addComments:toAssetCollectionWithGUID:personID:info:](self, "addComments:toAssetCollectionWithGUID:personID:info:", a3, a4, a5, 0);
}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MSAlbumSharingDaemon_addComments_toAssetCollectionWithGUID_personID_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  dispatch_async(v14, block);

}

- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4
{
  -[MSAlbumSharingDaemon deleteCommentWithGUID:personID:info:](self, "deleteCommentWithGUID:personID:info:", a3, a4, 0);
}

- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__MSAlbumSharingDaemon_deleteCommentWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4 personID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__MSAlbumSharingDaemon_retrieveAssets_inAlbumWithGUID_personID___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (void)retrieveAssetsInAssetCollectionsWithGUIDs:(id)a3 assetTypeFlags:(int)a4 personID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a5;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__MSAlbumSharingDaemon_retrieveAssetsInAssetCollectionsWithGUIDs_assetTypeFlags_personID___block_invoke;
  v13[3] = &unk_1E95BC488;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

- (void)forgetEverythingAboutPersonID:(id)a3
{
  -[MSAlbumSharingDaemon forgetEverythingAboutPersonID:completionBlock:](self, "forgetEverythingAboutPersonID:completionBlock:", a3, 0);
}

- (void)_postModelShutdownForPersonID:(id)a3 completionBlock:(id)a4
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
  -[MSAlbumSharingDaemon mapQueue](self, "mapQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MSAlbumSharingDaemon__postModelShutdownForPersonID_completionBlock___block_invoke;
  block[3] = &unk_1E95BC528;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, block);

}

- (void)shutDownStateMachine:(id)a3 forDestruction:(BOOL)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  MSAlbumSharingDaemon *v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke;
  block[3] = &unk_1E95BC5A8;
  v15 = v8;
  v16 = self;
  v19 = a4;
  v17 = v10;
  v18 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)workQueueForgetEverythingAboutPersonID:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _BYTE *v18;
  _QWORD block[5];
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Forgetting everything about person ID %@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__3481;
  v24 = __Block_byref_object_dispose__3482;
  v25 = 0;
  -[MSAlbumSharingDaemon mapQueue](self, "mapQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke;
  block[3] = &unk_1E95BC2F0;
  v21 = buf;
  block[4] = self;
  v10 = v6;
  v20 = v10;
  dispatch_sync(v8, block);

  v11 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v11)
  {
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_2;
    v14[3] = &unk_1E95BAFE0;
    v14[4] = self;
    v18 = buf;
    v15 = v10;
    v16 = v12;
    v17 = v7;
    v13 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
  else
  {
    -[MSAlbumSharingDaemon _postModelShutdownForPersonID:completionBlock:](self, "_postModelShutdownForPersonID:completionBlock:", v10, v7);
  }

  _Block_object_dispose(buf, 8);
}

- (void)forgetEverythingAboutPersonID:(id)a3 completionBlock:(id)a4
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
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke;
  block[3] = &unk_1E95BC528;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)workQueueForgetEverythingAboutPersonIDs:(id)a3 index:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  _QWORD v11[5];
  id v12;
  void (**v13)(_QWORD);
  unint64_t v14;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "count") <= a4)
  {
    if (v9)
      v9[2](v9);
  }
  else
  {
    objc_msgSend(v8, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonIDs_index_completionBlock___block_invoke;
    v11[3] = &unk_1E95BC3E8;
    v11[4] = self;
    v12 = v8;
    v14 = a4;
    v13 = v9;
    -[MSAlbumSharingDaemon workQueueForgetEverythingAboutPersonID:completionBlock:](self, "workQueueForgetEverythingAboutPersonID:completionBlock:", v10, v11);

  }
}

- (void)forgetEverythingCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSAlbumSharingDaemon workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)serverSideConfigurationForPersonID:(id)a3
{
  void *v3;
  void *v4;

  -[MSAlbumSharingDaemon boundStateMachineForPersonID:](self, "boundStateMachineForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverSideConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)refreshServerSideConfigurationForPersonID:(id)a3
{
  id v3;

  -[MSAlbumSharingDaemon boundStateMachineForPersonID:](self, "boundStateMachineForPersonID:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshServerSideConfig");

}

- (id)persistentObjectForKey:(id)a3 personID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[MSAlbumSharingDaemon boundStateMachineForPersonID:](self, "boundStateMachineForPersonID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentObjectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setPersistentObject:(id)a3 forKey:(id)a4 personID:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[MSAlbumSharingDaemon boundStateMachineForPersonID:](self, "boundStateMachineForPersonID:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPersistentObject:forKey:", v9, v8);

}

- (id)_delegateForPersonID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  v3 = a3;
  MSASPlatform();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "pluginClass");

  objc_msgSend(v5, "delegatePluginForPersonID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EFE412A8) & 1) == 0)
  {

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Plugin does not conform to MSASStateMachineDelegate protocol.", v8, 2u);
    }
    v6 = 0;
  }
  return v6;
}

- (id)existingStateMachineForPersonID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3481;
  v16 = __Block_byref_object_dispose__3482;
  v17 = 0;
  -[MSAlbumSharingDaemon mapQueue](self, "mapQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MSAlbumSharingDaemon_existingStateMachineForPersonID___block_invoke;
  block[3] = &unk_1E95BC2F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)boundStateMachineForPersonID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  MSAlbumSharingDaemon *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3481;
  v17 = __Block_byref_object_dispose__3482;
  v18 = 0;
  -[MSAlbumSharingDaemon mapQueue](self, "mapQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MSAlbumSharingDaemon_boundStateMachineForPersonID___block_invoke;
  block[3] = &unk_1E95BC2F0;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)didReceiveTooManyAlbumsError:(id)a3 personID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MSAlbumSharingDaemon_didReceiveTooManyAlbumsError_personID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)didReceiveTooManyPhotosError:(id)a3 forAlbum:(id)a4 personID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__MSAlbumSharingDaemon_didReceiveTooManyPhotosError_forAlbum_personID___block_invoke;
  v14[3] = &unk_1E95BCE58;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

- (void)didReceiveTooManySubscriptionsError:(id)a3 personID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MSAlbumSharingDaemon_didReceiveTooManySubscriptionsError_personID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)didReceiveTooManyCommentsError:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5 personID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__MSAlbumSharingDaemon_didReceiveTooManyCommentsError_forAssetCollection_inAlbum_personID___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)didReceiveCommentTooLongError:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5 personID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__MSAlbumSharingDaemon_didReceiveCommentTooLongError_forAssetCollection_inAlbum_personID___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)updateOwnerReputationScoreForAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  MSAlbumSharingDaemon *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ownerEmail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C973C0];
    objc_msgSend(v4, "ownerEmail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleWithEmailAddress:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_opt_new();
    v12 = 0;
    objc_msgSend(v9, "reputationForHandle:timeout:error:", v8, &v12, 10.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;

    if (v10)
    {
      objc_msgSend(v4, "setOwnerIsWhitelisted:", objc_msgSend(v10, "score") == 1);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v11;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unable to query contacts reputation score: %{public}@", buf, 0x16u);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected nil album owner email", buf, 0xCu);
  }

}

- (MSAlbumSharingDaemonDelegate)delegate
{
  return (MSAlbumSharingDaemonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)personIDToStateMachineMap
{
  return self->_personIDToStateMachineMap;
}

- (void)setPersonIDToStateMachineMap:(id)a3
{
  objc_storeStrong((id *)&self->_personIDToStateMachineMap, a3);
}

- (NSMutableDictionary)personIDToDelegateMap
{
  return self->_personIDToDelegateMap;
}

- (void)setPersonIDToDelegateMap:(id)a3
{
  objc_storeStrong((id *)&self->_personIDToDelegateMap, a3);
}

- (MSASDaemonModel)daemonModel
{
  return self->_daemonModel;
}

- (void)setDaemonModel:(id)a3
{
  objc_storeStrong((id *)&self->_daemonModel, a3);
}

- (int)busyCount
{
  return self->_busyCount;
}

- (void)setBusyCount:(int)a3
{
  self->_busyCount = a3;
}

- (BOOL)isRetryingOutstandingActivities
{
  return self->_isRetryingOutstandingActivities;
}

- (void)setIsRetryingOutstandingActivities:(BOOL)a3
{
  self->_isRetryingOutstandingActivities = a3;
}

- (OS_dispatch_queue)mapQueue
{
  return self->_mapQueue;
}

- (void)setMapQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mapQueue, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSMutableDictionary)nextUpdateDateByPersonID
{
  return self->_nextUpdateDateByPersonID;
}

- (void)setNextUpdateDateByPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_nextUpdateDateByPersonID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextUpdateDateByPersonID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_mapQueue, 0);
  objc_storeStrong((id *)&self->_daemonModel, 0);
  objc_storeStrong((id *)&self->_personIDToDelegateMap, 0);
  objc_storeStrong((id *)&self->_personIDToStateMachineMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __90__MSAlbumSharingDaemon_didReceiveCommentTooLongError_forAssetCollection_inAlbum_personID___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSAlbumSharingDaemon:didReceiveCommentTooLongError:forAssetCollection:inAlbum:personID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

void __91__MSAlbumSharingDaemon_didReceiveTooManyCommentsError_forAssetCollection_inAlbum_personID___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSAlbumSharingDaemon:didReceiveTooManyCommentsError:forAssetCollection:inAlbum:personID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

void __69__MSAlbumSharingDaemon_didReceiveTooManySubscriptionsError_personID___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSAlbumSharingDaemon:didReceiveTooManySubscriptionsError:personID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void __71__MSAlbumSharingDaemon_didReceiveTooManyPhotosError_forAlbum_personID___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSAlbumSharingDaemon:didReceiveTooManyPhotosError:forAlbum:personID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

void __62__MSAlbumSharingDaemon_didReceiveTooManyAlbumsError_personID___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSAlbumSharingDaemon:didReceiveTooManyAlbumsError:personID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void __53__MSAlbumSharingDaemon_boundStateMachineForPersonID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  MSASStateMachine *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int8x16_t v23;
  _QWORD block[4];
  int8x16_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "objectForKey:");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      MSASPlatform();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      MSASPlatform();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 & 1) != 0)
      {
        v9 = objc_msgSend(v7, "personIDEnabledForAlbumSharing:", *(_QWORD *)(a1 + 32));

        if ((v9 & 1) == 0)
          goto LABEL_5;
      }
      else
      {
        objc_msgSend(v7, "personIDsEnabledForAlbumSharing");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", *(_QWORD *)(a1 + 32));

        if (!v13)
        {
LABEL_5:
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v11 = *(_QWORD *)(a1 + 32);
            v10 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v27 = v10;
            v28 = 2112;
            v29 = v11;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Shared Photo Stream is disabled for person ID %@. Not instantiating state machine.", buf, 0x16u);
          }
          return;
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "_delegateForPersonID:", *(_QWORD *)(a1 + 32));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = -[MSASStateMachine initWithPersonID:]([MSASStateMachine alloc], "initWithPersonID:", *(_QWORD *)(a1 + 32));
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v18)
        {
          objc_msgSend(v18, "setDelegate:", v14);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDaemon:", *(_QWORD *)(a1 + 40));
          objc_msgSend(v14, "setMSASCounterpartInstance:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          objc_msgSend(v14, "setDaemon:", *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setObject:forKey:", v14, *(_QWORD *)(a1 + 32));
          if (objc_msgSend(v14, "dbWasRecreated"))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v22 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = 138543362;
              v27 = v22;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Forcing model reset sync.", buf, 0xCu);
            }
            objc_msgSend(v14, "reconstruct");
          }
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "start");
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __53__MSAlbumSharingDaemon_boundStateMachineForPersonID___block_invoke_340;
          block[3] = &unk_1E95BCFC0;
          v23 = *(int8x16_t *)(a1 + 32);
          v19 = (id)v23.i64[0];
          v25 = vextq_s8(v23, v23, 8uLL);
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(a1 + 32);
        v20 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v27 = v20;
        v28 = 2112;
        v29 = v21;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not create delegate for person ID %@.", buf, 0x16u);
      }

    }
  }
}

uint64_t __53__MSAlbumSharingDaemon_boundStateMachineForPersonID___block_invoke_340(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCreateStateMachineForPersonID:", *(_QWORD *)(a1 + 40));
}

void __56__MSAlbumSharingDaemon_existingStateMachineForPersonID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[6];
  __int128 buf;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Forgetting everything.", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3481;
  v14 = __Block_byref_object_dispose__3482;
  v15 = 0;
  objc_msgSend(*(id *)(a1 + 32), "mapQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_247;
  block[3] = &unk_1E95BCEF8;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &buf;
  dispatch_sync(v4, block);

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E95BCF98;
  v8[4] = v6;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "workQueueForgetEverythingAboutPersonIDs:index:completionBlock:", v7, 0, v8);

  _Block_object_dispose(&buf, 8);
}

void __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_247(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MSPathAlbumSharingDir();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, &v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v28;

  if (v4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          buf[0] = 0;
          MSPathAlbumSharingDir();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v13, buf))
            v14 = buf[0] == 0;
          else
            v14 = 1;
          if (!v14)
            objc_msgSend(v2, "removeItemAtPath:error:", v13, 0);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v8);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "MSVerboseDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v20;
    v31 = 2114;
    v32 = v21;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not enumerate contents of Shared Photo Stream directory. Error: %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "daemonModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clearAllNextActivityDates");

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v30 = v16;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Forgotten everything.", buf, 0xCu);
  }
  v17 = *(void **)(a1 + 40);
  if (v17)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_248;
    v22[3] = &unk_1E95BCF98;
    v18 = v17;
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = v18;
    dispatch_async(MEMORY[0x1E0C80D38], v22);
    v19 = v23;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v19);
  }

}

void __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_248(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v2);

}

uint64_t __86__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonIDs_index_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueForgetEverythingAboutPersonIDs:index:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

void __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke_2;
  v6[3] = &unk_1E95BCF98;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v3, "workQueueForgetEverythingAboutPersonID:completionBlock:", v4, v6);

}

void __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke_3;
    block[3] = &unk_1E95BCF98;
    v3 = v2;
    block[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v4);

  }
}

void __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v2);

}

void __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "nextUpdateDateByPersonID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "willDestroyStateMachineForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_3;
  v7[3] = &unk_1E95BBB58;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v2, "shutDownStateMachine:forDestruction:completionBlock:", v3, 1, v7);

}

void __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_4;
    v8[3] = &unk_1E95BBB58;
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v9 = v3;
    v10 = v4;
    v11 = v5;
    v12 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Model not found for person ID %@.", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_postModelShutdownForPersonID:completionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

void __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_5;
  v3[3] = &unk_1E95BC528;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "forgetEverythingInfo:completionBlock:", 0, v3);

}

uint64_t __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postModelShutdownForPersonID:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "willDestroyStateMachineForPersonID:", v2);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v13 = v3;
    v14 = 2112;
    v15 = v2;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Shutting down state machine for personID %@.", buf, 0x16u);
  }
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_245;
  v7[3] = &unk_1E95BAFB8;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  v11 = *(_BYTE *)(a1 + 64);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v4, "shutDownCompletionBlock:", v7);

}

void __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_245(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  char v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_2;
  v5[3] = &unk_1E95BAFB8;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v9 = *(_BYTE *)(a1 + 56);
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v10 = v3;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Shutting down model.", buf, 0xCu);
      v2 = *(void **)(a1 + 32);
    }
    v4 = *(unsigned __int8 *)(a1 + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_246;
    v7[3] = &unk_1E95BCF98;
    v5 = *(void **)(a1 + 48);
    v7[4] = *(_QWORD *)(a1 + 40);
    v8 = v5;
    objc_msgSend(v2, "shutDownForDestruction:completionBlock:", v4, v7);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }
}

uint64_t __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_246(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Model has shut down.", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __70__MSAlbumSharingDaemon__postModelShutdownForPersonID_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setNextActivityDate:forPersonID:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MSPathAlbumSharingDirForPersonID(*(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MSAlbumSharingDaemon__postModelShutdownForPersonID_completionBlock___block_invoke_2;
  block[3] = &unk_1E95BC528;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __70__MSAlbumSharingDaemon__postModelShutdownForPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "didDestroyStateMachineForPersonID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSAlbumSharingDaemon:didForgetPersonID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Completed forgetting personID %@.", (uint8_t *)&v8, 0x16u);
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __90__MSAlbumSharingDaemon_retrieveAssetsInAssetCollectionsWithGUIDs_assetTypeFlags_personID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retrieveAssetsFromAssetCollectionsWithGUIDs:assetTypeFlags:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));

}

void __64__MSAlbumSharingDaemon_retrieveAssets_inAlbumWithGUID_personID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retrieveAssets:inAlbumWithGUID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __60__MSAlbumSharingDaemon_deleteCommentWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteCommentWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __76__MSAlbumSharingDaemon_addComments_toAssetCollectionWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addComments:toAssetCollectionWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __104__MSAlbumSharingDaemon_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markCommentsForAssetCollectionWithGUID:asViewedWithLastViewedDate:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __65__MSAlbumSharingDaemon_deleteAssetCollectionsWithGUIDs_personID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteAssetCollectionsWithGUIDs:", *(_QWORD *)(a1 + 48));

}

void __68__MSAlbumSharingDaemon_deleteAssetCollectionWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteAssetCollectionWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __74__MSAlbumSharingDaemon_addAssetCollections_toAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAssetCollections:toAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __102__MSAlbumSharingDaemon_setMultipleContributorsEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMultipleContributorsEnabled:forAlbumWithGUID:info:completionBlock:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __97__MSAlbumSharingDaemon_setMultipleContributorsEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__MSAlbumSharingDaemon_setPublicAccessEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPublicAccessEnabled:forAlbumWithGUID:info:completionBlock:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));

}

uint64_t __89__MSAlbumSharingDaemon_setPublicAccessEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__MSAlbumSharingDaemon_removeAccessControlEntryWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAccessControlEntryWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __78__MSAlbumSharingDaemon_addAccessControlEntries_toAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAccessControlEntries:toAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __63__MSAlbumSharingDaemon_rejectInvitationWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rejectInvitationWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __63__MSAlbumSharingDaemon_acceptInvitationWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptInvitationWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __80__MSAlbumSharingDaemon_acceptInvitationWithToken_personID_info_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptInvitationWithToken:info:completionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __75__MSAlbumSharingDaemon_acceptInvitationWithToken_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MSAlbumSharingDaemon_markAsSpamInvitationWithToken_personID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markAsSpamInvitationWithToken:info:", *(_QWORD *)(a1 + 48), 0);

}

void __62__MSAlbumSharingDaemon_markAsSpamInvitationWithGUID_personID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markAsSpamInvitationWithGUID:info:", *(_QWORD *)(a1 + 48), 0);

}

void __57__MSAlbumSharingDaemon_markAsSpamAlbumWithGUID_personID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markAsSpamAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), 0);

}

void __67__MSAlbumSharingDaemon_unsubscribeFromAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsubscribeFromAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __63__MSAlbumSharingDaemon_subscribeToAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscribeToAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __96__MSAlbumSharingDaemon_markAlbumGUIDAsViewed_personID_moveLastViewedAssetCollectionMarker_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markAlbumGUIDAsViewed:moveLastViewedAssetCollectionMarker:info:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

void __58__MSAlbumSharingDaemon_deleteAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __58__MSAlbumSharingDaemon_modifyAlbumMetadata_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modifyAlbumMetadata:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __47__MSAlbumSharingDaemon_addAlbum_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAlbum:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __90__MSAlbumSharingDaemon_refreshCommentsForAssetCollectionWithGUID_resetSync_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshCommentsForAssetCollectionWithGUID:resetSync:info:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

void __78__MSAlbumSharingDaemon_refreshAccessControlListOfAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAccessControlListForAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __78__MSAlbumSharingDaemon_refreshContentOfAlbumWithGUID_resetSync_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshContentOfAlbumWithGUID:resetSync:info:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

void __55__MSAlbumSharingDaemon_refreshResetSync_personID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshResetSync:info:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __84__MSAlbumSharingDaemon_sendServerSideConfigurationDidChangeNotificationForPersonID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *(_QWORD *)(a1 + 32), CFSTR("personID"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MSASServerSideConfigDidChangeNotification"), *(_QWORD *)(a1 + 40), v3);

}

void __56__MSAlbumSharingDaemon_setNextActivityDate_forPersonID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "nextUpdateDateByPersonID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setNextUpdateDateByPersonID:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "nextUpdateDateByPersonID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v6 = *(_QWORD *)(a1 + 48);
    if (v11 == v5)
    {
      if (!v6)
        goto LABEL_12;
    }
    else if ((objc_msgSend(v11, "isEqualToDate:", v6) & 1) != 0)
    {
      goto LABEL_12;
    }
  }
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "nextUpdateDateByPersonID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = objc_msgSend(*(id *)(a1 + 48), "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  objc_msgSend(v8, "setObject:forKey:", v9, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setNextActivityDate:forPersonID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
LABEL_12:

}

void __89__MSAlbumSharingDaemon_pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "personIDListeningToPushNotification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v2;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Push notification received for Shared Photo Stream with targetPersonID %@. Listener personID %@.", (uint8_t *)&v7, 0x20u);
  }
  if (objc_msgSend(v2, "length")
    && ((objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0 || !*(_QWORD *)(a1 + 40)))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Serving push notification", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "boundStateMachineForPersonID:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "checkForChangesResetSync:info:", 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "didReceivePushNotificationForPersonID:", v2);
  }

}

void __33__MSAlbumSharingDaemon_addAlbum___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "modelForPersonID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__MSAlbumSharingDaemon_addAlbum___block_invoke_2;
  v6[3] = &unk_1E95BAF68;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "validateInvitationForAlbum:completionBlock:", v4, v6);

}

void __33__MSAlbumSharingDaemon_addAlbum___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "GUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v5;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to validate invitationToken for album %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
LABEL_10:

    }
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
    if (a2)
    {
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "GUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v8;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Validated invitationToken for album %{public}@", (uint8_t *)&v9, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 40), "didFindNewAlbum:", *(_QWORD *)(a1 + 32));
    }
    else if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "GUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "invitationToken for album %{public}@ is invalid", (uint8_t *)&v9, 0xCu);
      goto LABEL_10;
    }
  }

}

void __52__MSAlbumSharingDaemon_cancelActivitiesForPersonID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  objc_msgSend(*(id *)(a1 + 32), "boundStateMachineForPersonID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling all activities for personID %@", buf, 0x16u);
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__MSAlbumSharingDaemon_cancelActivitiesForPersonID___block_invoke_11;
    v7[3] = &unk_1E95BCED0;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "cancelCompletionBlock:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v6);

  }
}

void __52__MSAlbumSharingDaemon_cancelActivitiesForPersonID___block_invoke_11(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v1);

}

void __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3481;
  v20 = __Block_byref_object_dispose__3482;
  v21 = 0;
  objc_msgSend(*v2, "mapQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke_9;
  block[3] = &unk_1E95BC2F0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v15 = &v16;
  block[4] = v6;
  v14 = v7;
  dispatch_sync(v4, block);

  v8 = (void *)v17[5];
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping downloads for personID %@.", buf, 0x16u);
      v8 = (void *)v17[5];
    }
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke_10;
    v12[3] = &unk_1E95BCED0;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "stopAssetDownloadsCompletionBlock:", v12);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v11);

  }
  _Block_object_dispose(&v16, 8);

}

void __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke_9(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke_10(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v1);

}

uint64_t __62__MSAlbumSharingDaemon_retryOutstandingActivitiesForPersonID___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isRetryingOutstandingActivities");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsRetryingOutstandingActivities:", 1);
    objc_msgSend(*(id *)(a1 + 32), "boundStateMachineForPersonID:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "retryOutstandingActivities");

    return objc_msgSend(*(id *)(a1 + 32), "setIsRetryingOutstandingActivities:", 0);
  }
  return result;
}

void __50__MSAlbumSharingDaemon_retryOutstandingActivities__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isRetryingOutstandingActivities") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsRetryingOutstandingActivities:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "nextActivityDateByPersonID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(a1 + 32), "boundStateMachineForPersonID:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "retryOutstandingActivities");

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }
    objc_msgSend(*(id *)(a1 + 32), "setIsRetryingOutstandingActivities:", 0);

  }
}

void __56__MSAlbumSharingDaemon_hasCommandsInGroupedCommandQueue__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "hasCommandsInGroupedCommandQueue"))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

void __38__MSAlbumSharingDaemon_isInRetryState__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isInRetryState"))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

void __64__MSAlbumSharingDaemon_setFocusAssetCollectionGUID_forPersonID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "mapQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MSAlbumSharingDaemon_setFocusAssetCollectionGUID_forPersonID___block_invoke_2;
  block[3] = &unk_1E95BCE30;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __64__MSAlbumSharingDaemon_setFocusAssetCollectionGUID_forPersonID___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFocusAssetCollectionGUID:", a1[6]);

}

void __54__MSAlbumSharingDaemon_setFocusAlbumGUID_forPersonID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "mapQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MSAlbumSharingDaemon_setFocusAlbumGUID_forPersonID___block_invoke_2;
  block[3] = &unk_1E95BCE30;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __54__MSAlbumSharingDaemon_setFocusAlbumGUID_forPersonID___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFocusAlbumGUID:", a1[6]);

}

void __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  objc_msgSend(*(id *)(a1 + 32), "mapQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E95BCF98;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_barrier_async(v3, v5);

}

void __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[5];
  id v13;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allKeys");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v4[7];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_3;
    v12[3] = &unk_1E95BCF98;
    v6 = v3;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v6;
    objc_msgSend(v4, "mapQueueShutDownStateMachineInMap:personIDs:index:forDestruction:completionBlock:", v5, v2, 0, 0, v12);

  }
  else
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_5;
      block[3] = &unk_1E95BCF98;
      v8 = v7;
      block[4] = *(_QWORD *)(a1 + 32);
      v11 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_resume(v9);

    }
  }
}

void __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_4;
    block[3] = &unk_1E95BCF98;
    v3 = v2;
    block[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v4);

  }
}

void __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_5(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v2);

}

void __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_4(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v2);

}

void __105__MSAlbumSharingDaemon_mapQueueShutDownStateMachineInMap_personIDs_index_forDestruction_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  objc_msgSend(*(id *)(a1 + 32), "mapQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __105__MSAlbumSharingDaemon_mapQueueShutDownStateMachineInMap_personIDs_index_forDestruction_completionBlock___block_invoke_2;
  v7[3] = &unk_1E95BAF40;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v4 = *(id *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = v4;
  v11 = v5;
  v12 = *(_BYTE *)(a1 + 72);
  v10 = v6;
  dispatch_async(v2, v7);

}

uint64_t __105__MSAlbumSharingDaemon_mapQueueShutDownStateMachineInMap_personIDs_index_forDestruction_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mapQueueShutDownStateMachineInMap:personIDs:index:forDestruction:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64) + 1, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));
}

uint64_t __32__MSAlbumSharingDaemon_shutDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shutDownCompletionBlock:", 0);
}

void __29__MSAlbumSharingDaemon_start__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "personIDListeningToPushNotification");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "boundStateMachineForPersonID:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "checkForChangesIfMissingRootCtag");

    objc_msgSend(*(id *)(a1 + 32), "retryOutstandingActivities");
  }

}

@end
