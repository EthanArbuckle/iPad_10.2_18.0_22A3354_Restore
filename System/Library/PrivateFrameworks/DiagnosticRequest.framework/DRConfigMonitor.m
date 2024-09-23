@implementation DRConfigMonitor

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (DRConfigMonitor)initWithTeamID:(id)a3 targetQueue:(id)a4 configProcessingBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  DRConfigMonitor *v12;
  DRConfigMonitor *v13;
  uint64_t v14;
  id processingBlock;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *accessQueue;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)DRConfigMonitor;
  v12 = -[DRConfigMonitor init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_teamID, a3);
    v14 = MEMORY[0x1D8251214](v11);
    processingBlock = v13->_processingBlock;
    v13->_processingBlock = (id)v14;

    objc_storeStrong((id *)&v13->_targetQueue, a4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DRConfigMonitor %@"), v9);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    accessQueue = v13->_accessQueue;
    v13->_accessQueue = (OS_dispatch_queue *)v17;

  }
  return v13;
}

- (id)currentConfigSnapshotWithErrorOut:(id *)a3
{
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[DRConfigMonitor accessQueue](self, "accessQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__DRConfigMonitor_currentConfigSnapshotWithErrorOut___block_invoke;
  v7[3] = &unk_1E95530F8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_notifyClientOfConfig:(id)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[DRConfigMonitor setCurrentConfig:](self, "setCurrentConfig:", a3);
  -[DRConfigMonitor targetQueue](self, "targetQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__DRConfigMonitor__notifyClientOfConfig_error___block_invoke;
  v9[3] = &unk_1E9553828;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (DRConfig)currentConfig
{
  return self->_currentConfig;
}

void __47__DRConfigMonitor__notifyClientOfConfig_error___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "processingBlock");
  v3 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2, *(_QWORD *)(a1 + 40));

}

- (void)startMonitoring
{
  id v3;

  +[DRSubscriptionManager sharedInstance](DRSubscriptionManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addMonitor:", self);

}

- (void)stopMonitoring
{
  id v3;

  +[DRSubscriptionManager sharedInstance](DRSubscriptionManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeMonitor:", self);

}

- (void)dealloc
{
  objc_super v3;

  -[DRConfigMonitor stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)DRConfigMonitor;
  -[DRConfigMonitor dealloc](&v3, sel_dealloc);
}

- (void)_handleCurrentConfig:(id)a3 error:(id)a4 forceBroadcast:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  -[DRConfigMonitor accessQueue](self, "accessQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__DRConfigMonitor__handleCurrentConfig_error_forceBroadcast___block_invoke;
  block[3] = &unk_1E9553850;
  v16 = a5;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

}

void __61__DRConfigMonitor__handleCurrentConfig_error_forceBroadcast___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[24];
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    DPLogHandle_ConfigMonitor();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v2))
    {
      objc_msgSend(*(id *)(a1 + 32), "teamID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "configUUID");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v7 = *(const __CFString **)(a1 + 48);
      *(_DWORD *)v31 = 138544130;
      if (v5)
        v8 = (const __CFString *)v5;
      else
        v8 = CFSTR("None");
      *(_QWORD *)&v31[4] = v3;
      if (!v7)
        v7 = CFSTR("None");
      *(_WORD *)&v31[12] = 2050;
      *(_QWORD *)&v31[14] = v4;
      *(_WORD *)&v31[22] = 2114;
      v32 = v8;
      v33 = 2114;
      v34 = v7;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ForcedNotify", "Monitor %{public}@ (%{public}p) notifying client about config %{public}@ (FORCED, error: %{public}@)", v31, 0x2Au);

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    goto LABEL_25;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    DPLogHandle_ConfigMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(*(id *)(a1 + 32), "teamID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(const __CFString **)(a1 + 48);
      *(_DWORD *)v31 = 138543874;
      *(_QWORD *)&v31[4] = v13;
      *(_WORD *)&v31[12] = 2050;
      *(_QWORD *)&v31[14] = v14;
      *(_WORD *)&v31[22] = 2114;
      v32 = v15;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NotifyOfError", "Monitor %{public}@ (%{public}p) notifying client about error: %{public}@", v31, 0x20u);

    }
    v9 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 48);
    v10 = 0;
    goto LABEL_25;
  }
  objc_msgSend(*(id *)(a1 + 32), "currentConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToConfig:", *(_QWORD *)(a1 + 40));

    DPLogHandle_ConfigMonitor();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_enabled(v19);
    if (v18)
    {
      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 32), "teamID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v31 = 138543618;
        *(_QWORD *)&v31[4] = v21;
        *(_WORD *)&v31[12] = 2050;
        *(_QWORD *)&v31[14] = v22;
        v23 = "Monitor %{public}@ (%{public}p) notifying client (non-nil current vs. equal new config)";
LABEL_29:
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoNotification", v23, v31, 0x16u);

        goto LABEL_30;
      }
      goto LABEL_30;
    }
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "teamID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v31 = 138543618;
      *(_QWORD *)&v31[4] = v26;
      *(_WORD *)&v31[12] = 2050;
      *(_QWORD *)&v31[14] = v29;
      v28 = "Monitor %{public}@ (%{public}p) notifying client (non-nil current vs. non-equal new config)";
      goto LABEL_23;
    }
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 40);
    DPLogHandle_ConfigMonitor();
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = os_signpost_enabled(v19);
    if (!v24)
    {
      if (v25)
      {
        objc_msgSend(*(id *)(a1 + 32), "teamID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v31 = 138543618;
        *(_QWORD *)&v31[4] = v21;
        *(_WORD *)&v31[12] = 2050;
        *(_QWORD *)&v31[14] = v30;
        v23 = "Monitor %{public}@ (%{public}p) not notifying client (nil current vs. nil new config)";
        goto LABEL_29;
      }
LABEL_30:

      return;
    }
    if (v25)
    {
      objc_msgSend(*(id *)(a1 + 32), "teamID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v31 = 138543618;
      *(_QWORD *)&v31[4] = v26;
      *(_WORD *)&v31[12] = 2050;
      *(_QWORD *)&v31[14] = v27;
      v28 = "Monitor %{public}@ (%{public}p) notifying client (nil current vs. non-nil new config)";
LABEL_23:
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientNotification", v28, v31, 0x16u);

    }
  }

  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = 0;
LABEL_25:
  objc_msgSend(v9, "_notifyClientOfConfig:error:", v10, v11, *(_OWORD *)v31, *(_QWORD *)&v31[16]);
}

- (BOOL)_markConfigUUID:(id)a3 isRejected:(BOOL)a4 errorOut:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  char v11;
  _QWORD block[4];
  id v14;
  DRConfigMonitor *v15;
  uint64_t *v16;
  id *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[DRConfigMonitor accessQueue](self, "accessQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__DRConfigMonitor__markConfigUUID_isRejected_errorOut___block_invoke;
  block[3] = &unk_1E9553878;
  v14 = v8;
  v15 = self;
  v18 = a4;
  v16 = &v19;
  v17 = a5;
  v10 = v8;
  dispatch_sync(v9, block);

  v11 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v11;
}

void __55__DRConfigMonitor__markConfigUUID_isRejected_errorOut___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v4);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 40), "setCurrentConfig:", 0);
  objc_msgSend(*(id *)(a1 + 40), "teamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = *(unsigned __int8 *)(a1 + 64);
  v10 = 0;
  v8 = _DPCMarkConfigUUIDCompletedOrRejected(v5, v6, v7, &v10);
  v9 = v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && *(_QWORD *)(a1 + 56))
    **(_QWORD **)(a1 + 56) = objc_retainAutorelease(v9);

}

- (BOOL)markCompletedConfigUUID:(id)a3 errorOut:(id *)a4
{
  return -[DRConfigMonitor _markConfigUUID:isRejected:errorOut:](self, "_markConfigUUID:isRejected:errorOut:", a3, 0, a4);
}

- (BOOL)rejectConfigUUID:(id)a3 errorOut:(id *)a4
{
  return -[DRConfigMonitor _markConfigUUID:isRejected:errorOut:](self, "_markConfigUUID:isRejected:errorOut:", a3, 1, a4);
}

void __53__DRConfigMonitor_currentConfigSnapshotWithErrorOut___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "currentConfig");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setCurrentConfig:(id)a3
{
  objc_storeStrong((id *)&self->_currentConfig, a3);
}

- (id)processingBlock
{
  return self->_processingBlock;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong(&self->_processingBlock, 0);
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
}

@end
