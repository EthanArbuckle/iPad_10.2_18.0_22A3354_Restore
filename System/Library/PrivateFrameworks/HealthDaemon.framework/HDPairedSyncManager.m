@implementation HDPairedSyncManager

- (BOOL)permitSynchronization
{
  return -[PSYSyncCoordinator syncRestriction](self->_pairedSyncCoordinator, "syncRestriction") == 0;
}

- (HDPairedSyncManager)initWithProfile:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  HDPairedSyncManager *v8;
  HDPairedSyncManager *v9;
  void *v10;
  uint64_t v11;
  PSYSyncCoordinator *pairedSyncCoordinator;
  uint64_t v13;
  NSHashTable *unfinishedSyncSessions;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDPairedSyncManager;
  v8 = -[HDPairedSyncManager init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_msgSend(v6, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pairedSyncCoordinatorWithServiceName:", CFSTR("com.apple.pairedsync.healthd"));
    v11 = objc_claimAutoreleasedReturnValue();
    pairedSyncCoordinator = v9->_pairedSyncCoordinator;
    v9->_pairedSyncCoordinator = (PSYSyncCoordinator *)v11;

    -[PSYSyncCoordinator setDelegate:queue:](v9->_pairedSyncCoordinator, "setDelegate:queue:", v9, v9->_queue);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    unfinishedSyncSessions = v9->_unfinishedSyncSessions;
    v9->_unfinishedSyncSessions = (NSHashTable *)v13;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v9);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDPairedSyncManager;
  -[HDPairedSyncManager dealloc](&v4, sel_dealloc);
}

- (PSYSyncCoordinator)syncCoordinator
{
  return self->_pairedSyncCoordinator;
}

+ (id)syncCoordinatorWithServiceName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D65240], "syncCoordinatorWithServiceName:", a3);
}

- (__CFString)_typeStringForSyncSession:(__CFString *)a1
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "syncSessionType");
    if (v5 > 2)
      a1 = 0;
    else
      a1 = off_1E6CFB358[v5];
  }

  return a1;
}

void __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_2;
  block[3] = &unk_1E6CE7FB8;
  block[4] = v5;
  v10 = v6;
  v11 = v4;
  v8 = v4;
  dispatch_async(v7, block);

}

void __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  v5 = v4;
  if (v1)
  {
    if (v3)
    {
      if (v4)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_didSendRestoreMessagesForSession_error_, v1, CFSTR("HDPairedSyncManager.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncSession != nil"));

      if (v5)
      {
LABEL_4:
        _HKInitializeLogging();
        v6 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v9 = v5;
          _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "failed to send restore messages: %{public}@", buf, 0xCu);
        }
      }
    }
    objc_msgSend(v3, "syncDidCompleteSending");
  }

}

void __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_4;
  block[3] = &unk_1E6CE7FB8;
  block[4] = v5;
  v10 = v6;
  v11 = v4;
  v8 = v4;
  dispatch_async(v7, block);

}

void __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 32), "removeObject:", v3);
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5370];
    v6 = *MEMORY[0x1E0CB5370];
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = v5;
        objc_msgSend(v3, "sessionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v12;
        v15 = 2114;
        v16 = v4;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "sync session %{public}@ failed error: %{public}@", (uint8_t *)&v13, 0x16u);

      }
      objc_msgSend(v3, "syncDidFailWithError:", v4);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v5;
        objc_msgSend(v3, "sessionIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v9;
        _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "sync session %{public}@ complete", (uint8_t *)&v13, 0xCu);

      }
      objc_msgSend(v3, "syncDidComplete");
    }
  }

}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  NSObject *queue;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _BYTE buf[24];
  void *v23;
  HDPairedSyncManager *v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  v7 = v6;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[HDPairedSyncManager _typeStringForSyncSession:]((__CFString *)self, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pairedDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hd_shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2114;
    v23 = v14;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%@ %{public}@ did start for device %{public}@", buf, 0x20u);

  }
  -[NSHashTable addObject:](self->_unfinishedSyncSessions, "addObject:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "nanoSyncManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pairedDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke;
  v23 = &unk_1E6CEB718;
  v24 = self;
  v25 = v7;
  v20[0] = v18;
  v20[1] = 3221225472;
  v20[2] = __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_3;
  v20[3] = &unk_1E6CEB718;
  v20[4] = self;
  v19 = v25;
  v21 = v19;
  objc_msgSend(v16, "pairedSyncDidBeginForDevice:messagesSentHandler:completion:", v17, buf, v20);

}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    -[HDPairedSyncManager _typeStringForSyncSession:]((__CFString *)self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_INFO, "%@ %{public}@ was invalidated", (uint8_t *)&v11, 0x16u);

  }
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  void *v4;
  PSYSyncCoordinator *pairedSyncCoordinator;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    pairedSyncCoordinator = self->_pairedSyncCoordinator;
    v6 = v4;
    v7 = -[PSYSyncCoordinator syncRestriction](pairedSyncCoordinator, "syncRestriction");
    v8 = CFSTR("limit push");
    if (v7 != 1)
      v8 = 0;
    if (!v7)
      v8 = CFSTR("none");
    v9 = v8;
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "sync restriction changed to %@", (uint8_t *)&v10, 0xCu);

  }
}

- (id)diagnosticDescription
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v4 = -[PSYSyncCoordinator syncRestriction](self->_pairedSyncCoordinator, "syncRestriction");
    v5 = CFSTR("limit push");
    if (v4 != 1)
      v5 = 0;
    if (!v4)
      v5 = CFSTR("none");
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tSync Restriction: %@"), v5);
  -[NSHashTable allObjects](self->_unfinishedSyncSessions, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tUnfinished Sync Sessions:"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = v6;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "sessionIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUIDString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDPairedSyncManager _typeStringForSyncSession:]((__CFString *)self, v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "pairedDevice");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "hd_shortDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t%@ (%@): %@"), v13, v14, v16);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    v6 = v18;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfinishedSyncSessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_pairedSyncCoordinator, 0);
}

@end
