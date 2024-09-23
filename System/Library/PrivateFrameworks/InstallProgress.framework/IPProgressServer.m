@implementation IPProgressServer

+ (id)defaultBehavior
{
  if (defaultBehavior_onceToken != -1)
    dispatch_once(&defaultBehavior_onceToken, &__block_literal_global_4);
  return (id)defaultBehavior_sharedBehavior;
}

void __35__IPProgressServer_defaultBehavior__block_invoke()
{
  IPXPCEventStateUpdateStream *v0;
  void *v1;
  IPXPCEventStateUpdateStream *v2;
  IPProgressServerDefaultBehavior *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  IPProgressStubBehavior *v8;
  void *v9;

  if (_os_feature_enabled_impl())
  {
    +[IPServerXPCTransport defaultXPCTransport](IPServerXPCTransport, "defaultXPCTransport");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v0 = [IPXPCEventStateUpdateStream alloc];
    objc_msgSend(v9, "serviceQueue");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[IPXPCEventStateUpdateStream initWithStreamName:queue:](v0, "initWithStreamName:queue:", CFSTR("com.apple.InstallProgress.events"), v1);

    v3 = [IPProgressServerDefaultBehavior alloc];
    -[IPXPCEventStateUpdateStream sink](v2, "sink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[IPProgressServerDefaultBehavior initWithTransport:stateUpdateSink:](v3, "initWithTransport:stateUpdateSink:", v9, v4);
    v6 = (void *)defaultBehavior_sharedBehavior;
    defaultBehavior_sharedBehavior = v5;

    v7 = v9;
  }
  else
  {
    v8 = -[IPProgressStubBehavior initWithEventStreamName:]([IPProgressStubBehavior alloc], "initWithEventStreamName:", CFSTR("com.apple.InstallProgress.events"));
    v7 = (void *)defaultBehavior_sharedBehavior;
    defaultBehavior_sharedBehavior = (uint64_t)v8;
  }

}

+ (id)defaultAccessAdjudicator
{
  if (defaultAccessAdjudicator_onceToken != -1)
    dispatch_once(&defaultAccessAdjudicator_onceToken, &__block_literal_global_54);
  return (id)defaultAccessAdjudicator_sharedAdjudicator;
}

void __44__IPProgressServer_defaultAccessAdjudicator__block_invoke()
{
  IPProductionAccessAdjudicator *v0;
  void *v1;

  v0 = objc_alloc_init(IPProductionAccessAdjudicator);
  v1 = (void *)defaultAccessAdjudicator_sharedAdjudicator;
  defaultAccessAdjudicator_sharedAdjudicator = (uint64_t)v0;

}

- (IPProgressServer)initWithDelegate:(id)a3 delegateQueue:(id)a4 accessAdjudicator:(id)a5 behavior:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IPProgressServer *v14;
  uint64_t v15;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v17;
  NSMutableDictionary *activeProgresses;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)IPProgressServer;
  v14 = -[IPProgressServer init](&v20, sel_init);
  if (v14)
  {
    objc_msgSend(v13, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    activeProgresses = v14->_activeProgresses;
    v14->_activeProgresses = v17;

    -[IPProgressServer setDelegate:](v14, "setDelegate:", v10);
    -[IPProgressServer setDelegateQueue:](v14, "setDelegateQueue:", v11);
    objc_storeStrong((id *)&v14->_behavior, a6);
    -[IPProgressServerBehavior setDelegate:](v14->_behavior, "setDelegate:", v14);
    objc_storeStrong((id *)&v14->_accessAdjudicator, a5);
  }

  return v14;
}

- (IPProgressServer)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  IPProgressServer *v10;

  v6 = a4;
  v7 = a3;
  +[IPProgressServer defaultAccessAdjudicator](IPProgressServer, "defaultAccessAdjudicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPProgressServer defaultBehavior](IPProgressServer, "defaultBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IPProgressServer initWithDelegate:delegateQueue:accessAdjudicator:behavior:](self, "initWithDelegate:delegateQueue:accessAdjudicator:behavior:", v7, v6, v8, v9);

  return v10;
}

- (id)_queue_progressForIdentity:(id)a3 createIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  IPPublishedIdentityProgress *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_activeProgresses, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v9 = -[IPPublishedIdentityProgress initWithAppIdentity:observer:]([IPPublishedIdentityProgress alloc], "initWithAppIdentity:observer:", v6, self);
    -[NSMutableDictionary setObject:forKey:](self->_activeProgresses, "setObject:forKey:", v9, v6);

  }
  -[NSMutableDictionary objectForKey:](self->_activeProgresses, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_queue_removePublishedProgress:(id)a3
{
  NSObject *queue;
  id v5;
  NSMutableDictionary *activeProgresses;
  id v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  activeProgresses = self->_activeProgresses;
  objc_msgSend(v5, "miIdentity");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](activeProgresses, "removeObjectForKey:", v7);
}

- (id)_progressForIdentity:(id)a3 createIfMissing:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__IPProgressServer__progressForIdentity_createIfMissing___block_invoke;
  v11[3] = &unk_250FA41C8;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __57__IPProgressServer__progressForIdentity_createIfMissing___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_progressForIdentity:createIfMissing:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)initiateProgressForIdentity:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _IPServerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_23F108000, v5, OS_LOG_TYPE_DEFAULT, "initiating progress for %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__IPProgressServer_initiateProgressForIdentity___block_invoke;
  block[3] = &unk_250FA3F90;
  v11 = v4;
  p_buf = &buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __48__IPProgressServer_initiateProgressForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(*(id *)(a1 + 32), "_queue_progressForIdentity:createIfMissing:", *(_QWORD *)(a1 + 40), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "lsIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "progressForIdentityInitiated:", v5);
  }
  else
  {
    _IPServerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __48__IPProgressServer_initiateProgressForIdentity___block_invoke_cold_1();

  }
}

- (id)resumeProgressForIdentity:(id)a3
{
  return -[IPProgressServer _progressForIdentity:createIfMissing:](self, "_progressForIdentity:createIfMissing:", a3, 1);
}

- (void)identityWasUninstalled:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  IPProgressServer *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__IPProgressServer_identityWasUninstalled___block_invoke;
  block[3] = &unk_250FA3B50;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __43__IPProgressServer_identityWasUninstalled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  IPLSIdentityFromMIIdentity(v2, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "identityWasUninstalled:", v3);
  }
  else
  {
    _IPDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __43__IPProgressServer_identityWasUninstalled___block_invoke_cold_1();

  }
}

- (void)resume
{
  NSObject *v3;
  IPProgressServerBehavior *behavior;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  IPProgressServerBehavior *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _IPServerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    behavior = self->_behavior;
    *(_DWORD *)buf = 138412290;
    v8 = behavior;
    _os_log_impl(&dword_23F108000, v3, OS_LOG_TYPE_DEFAULT, "Starting progress server with behavior %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__IPProgressServer_resume__block_invoke;
  block[3] = &unk_250FA3EA0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __26__IPProgressServer_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
}

- (BOOL)serverBehavior:(id)a3 shouldAcceptConnection:(id)a4
{
  return -[IPAccessAdjudicator progressServer:shouldAcceptConnection:](self->_accessAdjudicator, "progressServer:shouldAcceptConnection:", self, a4);
}

- (void)serverBehavior:(id)a3 acceptedClient:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  _IPServerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_23F108000, v5, OS_LOG_TYPE_DEFAULT, "new client %@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)activeInstallationsForBehavior:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  IPInstallableStateData *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_activeProgresses;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v18 = 0;
        IPLSIdentityFromMIIdentity(v10, &v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v18;
        if (v10)
        {
          v13 = -[IPInstallableStateData initWithIdentity:isInstalling:]([IPInstallableStateData alloc], "initWithIdentity:isInstalling:", v11, 1);
          objc_msgSend(v4, "addObject:", v13);
        }
        else
        {
          _IPDefaultLog();
          v13 = (IPInstallableStateData *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(0, "bundleID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(0, "personaUniqueString");
            v14 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v24 = v17;
            v25 = 2112;
            v26 = v14;
            v15 = (void *)v14;
            v27 = 2112;
            v28 = v12;
            _os_log_error_impl(&dword_23F108000, &v13->super, OS_LOG_TYPE_ERROR, "could not find identity for %@/%@: %@", buf, 0x20u);

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)serverBehavior:(id)a3 progressForIdentity:(id)a4 error:(id *)a5
{
  id v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  IPInstallableProgressData *v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint8_t buf[4];
  id v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = self->_activeProgresses;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      IPLSIdentityFromMIIdentity(v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqual:", v7) & 1) != 0)
        break;

      if (v10 == ++v12)
      {
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    -[NSMutableDictionary objectForKey:](self->_activeProgresses, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentProgress");
    v16 = (IPInstallableProgressData *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_12;
    v17 = 0;
  }
  else
  {
LABEL_9:

LABEL_12:
    v25 = 0;
    objc_msgSend(v7, "findApplicationRecordFetchingPlaceholder:error:", 2, &v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v25;
    if (v18 && (objc_msgSend(v18, "isPlaceholder") & 1) == 0)
    {
      v16 = objc_alloc_init(IPInstallableProgressData);
      -[IPInstallableProgressData setInstallPhase:](v16, "setInstallPhase:", 6);
      -[IPInstallableProgressData setFinalPhase:](v16, "setFinalPhase:", 3);
      v34[0] = &unk_250FA80E0;
      v34[1] = &unk_250FA8110;
      v35[0] = &unk_250FA80F8;
      v35[1] = &unk_250FA80F8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPInstallableProgressData setTotalUnitCountsForPhases:](v16, "setTotalUnitCountsForPhases:", v23);

      -[IPInstallableProgressData setCompletedUnitCount:forPhase:](v16, "setCompletedUnitCount:forPhase:", 10, 2);
      -[IPInstallableProgressData setCompletedUnitCount:forPhase:](v16, "setCompletedUnitCount:forPhase:", 10, 3);
    }
    else
    {
      v19 = objc_msgSend(v18, "isPlaceholder");
      _IPServerLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v7;
          _os_log_impl(&dword_23F108000, v21, OS_LOG_TYPE_DEFAULT, "asked for progress for identity %@ for which we do not have active progress but a placeholder exists. Returning a resonable ersatz progress.", buf, 0xCu);
        }

        v16 = objc_alloc_init(IPInstallableProgressData);
        -[IPInstallableProgressData setInstallPhase:](v16, "setInstallPhase:", 2);
        -[IPInstallableProgressData setFinalPhase:](v16, "setFinalPhase:", 3);
        v30[0] = &unk_250FA80E0;
        v30[1] = &unk_250FA8110;
        v31[0] = &unk_250FA80F8;
        v31[1] = &unk_250FA80F8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[IPInstallableProgressData setTotalUnitCountsForPhases:](v16, "setTotalUnitCountsForPhases:", v22);

      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[IPProgressServer serverBehavior:progressForIdentity:error:].cold.1((uint64_t)v7, (uint64_t)v17, v21);

        v16 = 0;
      }
    }

    if (a5 && !v16)
    {
      v17 = objc_retainAutorelease(v17);
      *a5 = v17;
    }
  }

  return v16;
}

- (void)identityProgress:(id)a3 didChangeProgressData:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  IPProgressServer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__IPProgressServer_identityProgress_didChangeProgressData___block_invoke;
  block[3] = &unk_250FA4048;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __59__IPProgressServer_identityProgress_didChangeProgressData___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "lsIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "progressForIdentity:changed:", v2, *(_QWORD *)(a1 + 48));
  }
  else
  {
    _IPServerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__IPProgressServer_identityProgress_didChangeProgressData___block_invoke_cold_1();

  }
}

- (void)identityProgress:(id)a3 didFinishWithState:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__IPProgressServer_identityProgress_didFinishWithState___block_invoke;
  block[3] = &unk_250FA4070;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(queue, block);

}

void __56__IPProgressServer_identityProgress_didFinishWithState___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;

  v2 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_queue_removePublishedProgress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*v2, "lsIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "progressForIdentity:finishedWithState:", v3, *(_QWORD *)(a1 + 48));
  }
  else
  {
    _IPServerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__IPProgressServer_identityProgress_didFinishWithState___block_invoke_cold_1();

  }
}

- (IPProgressServerDelegate)delegate
{
  return (IPProgressServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessAdjudicator, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_activeProgresses, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__IPProgressServer_initiateProgressForIdentity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  v3 = "-[IPProgressServer initiateProgressForIdentity:]_block_invoke";
  OUTLINED_FUNCTION_0_2(&dword_23F108000, v0, v1, "published progress %@ had no identity in %s", v2);
  OUTLINED_FUNCTION_1_0();
}

void __43__IPProgressServer_identityWasUninstalled___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x24BDAC8D0]);
  v3 = 138412546;
  v4 = v0;
  v5 = 2112;
  v6 = v1;
  _os_log_fault_impl(&dword_23F108000, v2, OS_LOG_TYPE_FAULT, "could not make LS identity from MI identity %@: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)serverBehavior:(uint64_t)a1 progressForIdentity:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_2(&dword_23F108000, a3, (uint64_t)a3, "asked for progress for totally unknown identity %@: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __59__IPProgressServer_identityProgress_didChangeProgressData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  v3 = "-[IPProgressServer identityProgress:didChangeProgressData:]_block_invoke";
  OUTLINED_FUNCTION_0_2(&dword_23F108000, v0, v1, "published progress %@ had no identity in %s", v2);
  OUTLINED_FUNCTION_1_0();
}

void __56__IPProgressServer_identityProgress_didFinishWithState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  v3 = "-[IPProgressServer identityProgress:didFinishWithState:]_block_invoke";
  OUTLINED_FUNCTION_0_2(&dword_23F108000, v0, v1, "published progress %@ had no identity in %s", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
