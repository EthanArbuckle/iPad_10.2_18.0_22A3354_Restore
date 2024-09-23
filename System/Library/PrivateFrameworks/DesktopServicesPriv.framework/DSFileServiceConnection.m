@implementation DSFileServiceConnection

void __31__DSFileServiceConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadCurrentOperations");

}

- (void)setDidUpdateInProgressOperationsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)requestInProgressOperationsWithResponseBlock:(id)a3
{
  void *v4;
  void (**v5)(id, void *, _QWORD);

  v5 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)-[NSMutableArray copy](self->_fileOperations, "copy");
  v5[2](v5, v4, 0);

}

- (DSFileServiceConnection)init
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  dispatch_source_t v10;
  void *v11;
  NSObject *v12;
  __CFNotificationCenter *DistributedCenter;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)DSFileServiceConnection;
  v2 = -[DSFileServiceConnection init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    v5 = objc_opt_new();
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = objc_opt_new();
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v7;

    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_source_create(MEMORY[0x1E0C80D70], 0, 0, v9);
    v11 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v10;

    objc_initWeak(&location, v2);
    v12 = *((_QWORD *)v2 + 1);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __31__DSFileServiceConnection_init__block_invoke;
    v18 = &unk_1E87514D8;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v12, &v15);
    dispatch_resume(*((dispatch_object_t *)v2 + 1));
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)OperationsUpdatedHandler, CFSTR("com.apple.DesktopServicesHelper.FileService.Update"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(v2, "_triggerReloadCurrentOperations", v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return (DSFileServiceConnection *)v2;
}

- (void)_triggerReloadCurrentOperations
{
  dispatch_source_merge_data((dispatch_source_t)self->_updateCurrentOperationsSource, 1uLL);
}

- (void)_reloadCurrentOperations
{
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.DesktopServicesHelper.FileService"), 4096);
  DSFileServiceXPCInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_42);
  objc_msgSend(v3, "resume");
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__DSFileServiceConnection__reloadCurrentOperations__block_invoke;
  v12[3] = &unk_1E8751598;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __51__DSFileServiceConnection__reloadCurrentOperations__block_invoke_12;
  v10[3] = &unk_1E87515C0;
  v10[4] = self;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "inProgressOperationsWithReply:", v10);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v3, "invalidate");

}

- (void)dealloc
{
  __CFNotificationCenter *DistributedCenter;
  objc_super v4;

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, CFSTR("com.apple.DesktopServicesHelper.FileService.Update"), 0);
  dispatch_source_cancel((dispatch_source_t)self->_updateCurrentOperationsSource);
  v4.receiver = self;
  v4.super_class = (Class)DSFileServiceConnection;
  -[DSFileServiceConnection dealloc](&v4, sel_dealloc);
}

- (BOOL)_addOperationForProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  DSFileOperationID *v8;
  void *v9;
  void *v10;
  DSFileOperationID *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DSFileOperationUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v8 = [DSFileOperationID alloc];
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DSFileOperationUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[DSFileOperationID initWithUUID:](v8, "initWithUUID:", v10);
    objc_msgSend(v7, "setOperationID:", v11);

    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DSFileOperationDateStarted"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateStarted:", v13);

    v14 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v4, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DSFileOperationIconUTTypeIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "typeWithIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUtType:", v17);

    objc_msgSend(v7, "setProgress:", v4);
    -[NSMutableArray addObject:](self->_fileOperations, "addObject:", v7);

  }
  return v6 != 0;
}

- (void)_removeOperationForProgress:(id)a3
{
  DSFileOperationID *v4;
  void *v5;
  void *v6;
  DSFileOperationID *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = [DSFileOperationID alloc];
  objc_msgSend(v9, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DSFileOperationUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DSFileOperationID initWithUUID:](v4, "initWithUUID:", v6);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setOperationID:", v7);
  -[NSMutableArray removeObject:](self->_fileOperations, "removeObject:", v8);

}

- (void)_subscribeToProgressIfNeeded:(id)a3
{
  NSURL *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSURL *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  NSURL *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (NSURL *)a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_progressTokenMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    LogObj(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      SanitizedURL(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v7;
      _os_log_impl(&dword_1CBC4A000, v6, OS_LOG_TYPE_DEBUG, "Already subscribed to progress for %{public}@", buf, 0xCu);

    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke;
    v14 = &unk_1E8751570;
    objc_copyWeak(&v16, (id *)buf);
    v8 = v4;
    v15 = v8;
    v9 = (void *)MEMORY[0x1D17A5A30](&v11);
    if (-[NSURL startAccessingSecurityScopedResource](v8, "startAccessingSecurityScopedResource", v11, v12, v13, v14))
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "addSubscriberForFileURL:withPublishingHandler:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_progressTokenMap, "setObject:forKeyedSubscript:", v10, v8);

    }
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

id __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id *v17;
  id v18;
  id v19;
  _QWORD block[4];
  id *v21;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "_addOperationForProgress:", v3) & 1) != 0)
    {
      objc_msgSend(v5[2], "addObject:", v3);
      objc_msgSend(v5, "didUpdateInProgressOperationsHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = MEMORY[0x1E0C809B0];
      if (v6)
      {
        dispatch_get_global_queue(0, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_4;
        block[3] = &unk_1E8751520;
        v21 = v5;
        dispatch_async(v8, block);

      }
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_5;
      v16[3] = &unk_1E8751548;
      v17 = v5;
      v18 = v3;
      v19 = *(id *)(a1 + 32);
      v9 = (void *)MEMORY[0x1D17A5A30](v16);
      v13 = (void *)MEMORY[0x1D17A5A30](v9, v10, v11, v12);

    }
    else
    {
      objc_msgSend(v5[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB38A8], "removeSubscriber:", v14);
        objc_msgSend(v5[3], "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
      }
      objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");

      v13 = &__block_literal_global_9;
    }
  }
  else
  {
    v13 = &__block_literal_global_0;
  }

  return v13;
}

void __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_4(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "didUpdateInProgressOperationsHandler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

void __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_removeOperationForProgress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "removeSubscriber:", v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 48), "stopAccessingSecurityScopedResource");
  objc_msgSend(*(id *)(a1 + 32), "didUpdateInProgressOperationsHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_6;
    block[3] = &unk_1E8751520;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);

  }
}

void __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_6(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "didUpdateInProgressOperationsHandler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

void __51__DSFileServiceConnection__reloadCurrentOperations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogObj(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CBC4A000, v4, OS_LOG_TYPE_ERROR, "Error calling DSFileService: %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__DSFileServiceConnection__reloadCurrentOperations__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogObj(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1CBC4A000, v7, OS_LOG_TYPE_ERROR, "Error fetching in-progress operations: %@", buf, 0xCu);
    }
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v5;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "url", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_subscribeToProgressIfNeeded:", v12);

        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)didUpdateInProgressOperationsHandler
{
  return self->_didUpdateInProgressOperationsHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didUpdateInProgressOperationsHandler, 0);
  objc_storeStrong((id *)&self->_fileOperations, 0);
  objc_storeStrong((id *)&self->_progressTokenMap, 0);
  objc_storeStrong((id *)&self->_progresses, 0);
  objc_storeStrong((id *)&self->_updateCurrentOperationsSource, 0);
}

@end
