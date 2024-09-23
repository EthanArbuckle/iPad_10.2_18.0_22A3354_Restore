@implementation MSASServerSideModelGroupedCommandQueue

- (BOOL)hasEnqueuedItems
{
  void *v2;
  BOOL v3;

  -[MSASGroupedQueue model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "commandCount") > 0;

  return v3;
}

- (void)flushQueue
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASGroupedQueue workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MSASServerSideModelGroupedCommandQueue_flushQueue__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)workQueueFlushQueue
{
  void *v3;
  id v4;
  NSObject *v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  int v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  MSASServerSideModelGroupedCommandQueue *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!-[MSASGroupedQueue isShuttingDown](self, "isShuttingDown"))
  {
    -[MSASServerSideModelGroupedCommandQueue setLastEnqueuedCommand:](self, "setLastEnqueuedCommand:", 0);
    v3 = 0;
    v4 = 0;
    v18 = 0;
    v5 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v6 = 138544130;
    v16 = v6;
    while (1)
    {
      v7 = v4;
      v8 = v3;
      -[MSASGroupedQueue model](self, "model", v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[MSASGroupedQueue maxGroupedCallbackEventBatchCount](self, "maxGroupedCallbackEventBatchCount");
      v17 = v4;
      objc_msgSend(v9, "nextCommandGroupMaxCount:outCommand:outLastCommandIndex:", v10, &v17, &v18);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v17;

      if (!v3)
        break;
      +[MSASServerSideModelGroupedCommandQueue calloutBlockForCommand:](MSASServerSideModelGroupedCommandQueue, "calloutBlockForCommand:", v4);
      v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, MSASServerSideModelGroupedCommandQueue *, void *))v11)[2](v11, self, v3);

      if (v12)
      {
        objc_msgSend(v3, "objectAtIndex:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "invariantParam");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v16;
          v20 = self;
          v21 = 1024;
          v22 = v12;
          v23 = 2114;
          v24 = v4;
          v25 = 2114;
          v26 = v14;
          _os_log_debug_impl(&dword_1D3E94000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Flushing %d events with command %{public}@. Invariant:%{public}@", buf, 0x26u);
        }

      }
      -[MSASGroupedQueue model](self, "model");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeCommandsUpToCommandIndex:", v18);

    }
  }
}

- (void)workQueueEnqueueCommand:(id)a3 variantParam:(id)a4 invariantParam:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  MSASEnqueuedCommand *lastEnqueuedCommand;
  void *v16;
  void *v17;
  int v18;
  MSASServerSideModelGroupedCommandQueue *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MSASGroupedQueue isShuttingDown](self, "isShuttingDown"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v18 = 138543618;
      v19 = self;
      v20 = 2114;
      v21 = v8;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Not enqueueing command %{public}@ because we're shutting down.", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_16;
  }
  -[MSASGroupedQueue model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    __assert_rtn("-[MSASServerSideModelGroupedCommandQueue workQueueEnqueueCommand:variantParam:invariantParam:]", "MSASServerSideModelGroupedCommandQueue.m", 128, "self.model");

  -[MSASGroupedQueue model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "commandCount");

  +[MSASEnqueuedCommand commandwithCommand:variantParam:invariantParam:](MSASEnqueuedCommand, "commandwithCommand:variantParam:invariantParam:", v8, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  lastEnqueuedCommand = self->_lastEnqueuedCommand;
  if (lastEnqueuedCommand
    && !-[MSASEnqueuedCommand canBeGroupedWithCommand:](lastEnqueuedCommand, "canBeGroupedWithCommand:", v14))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[MSASEnqueuedCommand command](self->_lastEnqueuedCommand, "command");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = self;
      v20 = 2114;
      v21 = v8;
      v22 = 2114;
      v23 = v17;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: New command %{public}@ cannot be grouped with command %{public}@. Flushing.", (uint8_t *)&v18, 0x20u);

    }
    goto LABEL_12;
  }
  if (v13 >= -[MSASGroupedQueue maxGroupedCallbackEventBatchCount](self, "maxGroupedCallbackEventBatchCount"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v18 = 138543618;
      v19 = self;
      v20 = 1024;
      LODWORD(v21) = v13;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: There are already %d commands in the queue. Flushing.", (uint8_t *)&v18, 0x12u);
    }
LABEL_12:
    -[MSASServerSideModelGroupedCommandQueue workQueueFlushQueue](self, "workQueueFlushQueue");
    v13 = 0;
  }
  -[MSASGroupedQueue model](self, "model");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enqueueCommand:", v14);

  if (!v13)
    -[MSASGroupedQueue workQueueDidEnqueueFirstItem](self, "workQueueDidEnqueueFirstItem");
  -[MSASGroupedQueue workQueueDidEnqueueSubsequentItem](self, "workQueueDidEnqueueSubsequentItem");

LABEL_16:
}

- (void)MSASModel:(id)a3 didFindNewAlbum:(id)a4 info:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  MSASServerSideModelGroupedCommandQueue *v15;

  v7 = a4;
  v8 = a5;
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v13 = v7;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)MSASModel:(id)a3 didFindDeletedAlbum:(id)a4 info:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  MSASServerSideModelGroupedCommandQueue *v15;

  v7 = a4;
  v8 = a5;
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v13 = v7;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)MSASModel:(id)a3 didFindNewAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6
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
  id v18;
  id v19;
  MSASServerSideModelGroupedCommandQueue *v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAssetCollection_inAlbum_info___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = self;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)MSASModel:(id)a3 didFindDeletedAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6
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
  id v18;
  id v19;
  MSASServerSideModelGroupedCommandQueue *v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAssetCollection_inAlbum_info___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = self;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)MSASModel:(id)a3 didFindNewAccessControl:(id)a4 inAlbum:(id)a5 info:(id)a6
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
  id v18;
  id v19;
  MSASServerSideModelGroupedCommandQueue *v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAccessControl_inAlbum_info___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = self;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)MSASModel:(id)a3 didFindDeletedAccessControl:(id)a4 inAlbum:(id)a5 info:(id)a6
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
  id v18;
  id v19;
  MSASServerSideModelGroupedCommandQueue *v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAccessControl_inAlbum_info___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = self;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)MSASModel:(id)a3 didFindNewInvitation:(id)a4 info:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  MSASServerSideModelGroupedCommandQueue *v15;

  v7 = a4;
  v8 = a5;
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewInvitation_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v13 = v7;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)MSASModel:(id)a3 didFindDeletedInvitation:(id)a4 info:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  MSASServerSideModelGroupedCommandQueue *v15;

  v7 = a4;
  v8 = a5;
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedInvitation_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v13 = v7;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)MSASModel:(id)a3 didFindNewComment:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  MSASServerSideModelGroupedCommandQueue *v25;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewComment_forAssetCollection_inAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = self;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  dispatch_async(v15, block);

}

- (void)MSASModel:(id)a3 didDeleteComment:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  MSASServerSideModelGroupedCommandQueue *v25;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__MSASServerSideModelGroupedCommandQueue_MSASModel_didDeleteComment_forAssetCollection_inAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = self;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  dispatch_async(v15, block);

}

- (MSASEnqueuedCommand)lastEnqueuedCommand
{
  return self->_lastEnqueuedCommand;
}

- (void)setLastEnqueuedCommand:(id)a3
{
  objc_storeStrong((id *)&self->_lastEnqueuedCommand, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEnqueuedCommand, 0);
}

void __101__MSASServerSideModelGroupedCommandQueue_MSASModel_didDeleteComment_forAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v9 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("comment"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("assetCollection"));
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("album"));
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 64), "workQueueEnqueueCommand:variantParam:invariantParam:", CFSTR("deleteComment"), v9, v5);

}

void __102__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewComment_forAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v9 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("comment"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("assetCollection"));
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("album"));
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 64), "workQueueEnqueueCommand:variantParam:invariantParam:", CFSTR("newComment"), v9, v5);

}

void __82__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedInvitation_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("sharingRelationship"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 48), "workQueueEnqueueCommand:variantParam:invariantParam:", CFSTR("deleteInvitation"), v7, v5);

}

void __78__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewInvitation_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("sharingRelationship"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 48), "workQueueEnqueueCommand:variantParam:invariantParam:", CFSTR("newInvitation"), v7, v5);

}

void __93__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAccessControl_inAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v8 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("sharingRelationship"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("album"));
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 56), "workQueueEnqueueCommand:variantParam:invariantParam:", CFSTR("deleteACL"), v8, v5);

}

void __89__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAccessControl_inAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v8 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("sharingRelationship"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("album"));
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 56), "workQueueEnqueueCommand:variantParam:invariantParam:", CFSTR("newACL"), v8, v5);

}

void __95__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v8 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("assetCollection"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("album"));
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 56), "workQueueEnqueueCommand:variantParam:invariantParam:", CFSTR("deleteAssetCollection"), v8, v5);

}

void __91__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v8 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("assetCollection"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("album"));
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 56), "workQueueEnqueueCommand:variantParam:invariantParam:", CFSTR("newAssetCollection"), v8, v5);

}

void __77__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("album"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 48), "workQueueEnqueueCommand:variantParam:invariantParam:", CFSTR("deleteAlbum"), v7, v5);

}

void __73__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("album"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 48), "workQueueEnqueueCommand:variantParam:invariantParam:", CFSTR("newAlbum"), v7, v5);

}

uint64_t __52__MSASServerSideModelGroupedCommandQueue_flushQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueFlushQueue");
}

+ (id)calloutBlockForCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (calloutBlockForCommand__onceToken != -1)
    dispatch_once(&calloutBlockForCommand__onceToken, &__block_literal_global_7352);
  objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138543618;
      v9 = a1;
      v10 = 2114;
      v11 = v4;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot find callout block for command: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    v5 = &__block_literal_global_104;
  }
  v6 = (void *)MEMORY[0x1D8255DD0](v5);

  return v6;
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_103(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "count");
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)calloutBlockForCommand__commandToCalloutBlockMap;
  calloutBlockForCommand__commandToCalloutBlockMap = v0;

  objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "setObject:forKey:", &__block_literal_global_71, CFSTR("newAlbum"));
  objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "setObject:forKey:", &__block_literal_global_76, CFSTR("deleteAlbum"));
  objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "setObject:forKey:", &__block_literal_global_79, CFSTR("newAssetCollection"));
  objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "setObject:forKey:", &__block_literal_global_82, CFSTR("deleteAssetCollection"));
  objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "setObject:forKey:", &__block_literal_global_85, CFSTR("newACL"));
  objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "setObject:forKey:", &__block_literal_global_88, CFSTR("deleteACL"));
  objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "setObject:forKey:", &__block_literal_global_91, CFSTR("newInvitation"));
  objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "setObject:forKey:", &__block_literal_global_94, CFSTR("deleteInvitation"));
  objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "setObject:forKey:", &__block_literal_global_97, CFSTR("newComment"));
  return objc_msgSend((id)calloutBlockForCommand__commandToCalloutBlockMap, "setObject:forKey:", &__block_literal_global_100, CFSTR("deleteComment"));
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v7)
  {
    v11 = 0;
    v26 = 0;
    v10 = 0;
    v9 = 0;
    v22 = v6;
LABEL_20:

    goto LABEL_22;
  }
  v8 = v7;
  v24 = v4;
  v9 = 0;
  v10 = 0;
  v26 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v34;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v34 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
      objc_msgSend(v14, "variantParam", v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("comment"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (v26)
        {
          if (v9)
            goto LABEL_9;
LABEL_14:
          objc_msgSend(v14, "invariantParam");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", CFSTR("album"));
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (!v10)
            goto LABEL_15;
        }
        else
        {
          objc_msgSend(v14, "invariantParam");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", CFSTR("assetCollection"));
          v26 = (id)objc_claimAutoreleasedReturnValue();

          if (!v9)
            goto LABEL_14;
LABEL_9:
          if (!v10)
          {
LABEL_15:
            objc_msgSend(v14, "invariantParam");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", CFSTR("info"));
            v10 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        objc_msgSend(v25, "addObject:", v16);
        v11 = (v11 + 1);
      }

      ++v13;
    }
    while (v8 != v13);
    v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v8 = v20;
  }
  while (v20);

  if ((_DWORD)v11)
  {
    v4 = v24;
    objc_msgSend(v24, "model");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_21;
    v27[3] = &unk_1E95BCDE8;
    v28 = v24;
    v29 = v25;
    v26 = v26;
    v30 = v26;
    v9 = v9;
    v31 = v9;
    v10 = v10;
    v32 = v10;
    objc_msgSend(v21, "performBlockOnObservers:", v27);

    v22 = v28;
    goto LABEL_20;
  }
  v4 = v24;
LABEL_22:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSASModel:didFindDeletedComments:forAssetCollection:inAlbum:info:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v7)
  {
    v11 = 0;
    v26 = 0;
    v10 = 0;
    v9 = 0;
    v22 = v6;
LABEL_20:

    goto LABEL_22;
  }
  v8 = v7;
  v24 = v4;
  v9 = 0;
  v10 = 0;
  v26 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v34;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v34 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
      objc_msgSend(v14, "variantParam", v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("comment"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (v26)
        {
          if (v9)
            goto LABEL_9;
LABEL_14:
          objc_msgSend(v14, "invariantParam");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", CFSTR("album"));
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (!v10)
            goto LABEL_15;
        }
        else
        {
          objc_msgSend(v14, "invariantParam");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", CFSTR("assetCollection"));
          v26 = (id)objc_claimAutoreleasedReturnValue();

          if (!v9)
            goto LABEL_14;
LABEL_9:
          if (!v10)
          {
LABEL_15:
            objc_msgSend(v14, "invariantParam");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", CFSTR("info"));
            v10 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        objc_msgSend(v25, "addObject:", v16);
        v11 = (v11 + 1);
      }

      ++v13;
    }
    while (v8 != v13);
    v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v8 = v20;
  }
  while (v20);

  if ((_DWORD)v11)
  {
    v4 = v24;
    objc_msgSend(v24, "model");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_19;
    v27[3] = &unk_1E95BCDE8;
    v28 = v24;
    v29 = v25;
    v26 = v26;
    v30 = v26;
    v9 = v9;
    v31 = v9;
    v10 = v10;
    v32 = v10;
    objc_msgSend(v21, "performBlockOnObservers:", v27);

    v22 = v28;
    goto LABEL_20;
  }
  v4 = v24;
LABEL_22:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_19(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSASModel:didFindNewComments:forAssetCollection:inAlbum:info:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v7)
  {
    v10 = 0;
    v9 = 0;
    v18 = v6;
    goto LABEL_15;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v13, "variantParam");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("sharingRelationship"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (!v9)
        {
          objc_msgSend(v13, "invariantParam");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("info"));
          v9 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v20, "addObject:", v15);
        v10 = (v10 + 1);
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v8);

  if ((_DWORD)v10)
  {
    objc_msgSend(v4, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_17;
    v21[3] = &unk_1E95BCD00;
    v22 = v4;
    v23 = v20;
    v9 = v9;
    v24 = v9;
    objc_msgSend(v17, "performBlockOnObservers:", v21);

    v18 = v22;
LABEL_15:

  }
  return v10;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_17(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSASModel:didFindDeletedInvitations:info:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v7)
  {
    v10 = 0;
    v9 = 0;
    v18 = v6;
    goto LABEL_15;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v13, "variantParam");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("sharingRelationship"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (!v9)
        {
          objc_msgSend(v13, "invariantParam");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("info"));
          v9 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v20, "addObject:", v15);
        v10 = (v10 + 1);
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v8);

  if ((_DWORD)v10)
  {
    objc_msgSend(v4, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_15;
    v21[3] = &unk_1E95BCD00;
    v22 = v4;
    v23 = v20;
    v9 = v9;
    v24 = v9;
    objc_msgSend(v17, "performBlockOnObservers:", v21);

    v18 = v22;
LABEL_15:

  }
  return v10;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSASModel:didFindNewInvitations:info:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v7)
  {
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v21 = v6;
LABEL_18:

    goto LABEL_20;
  }
  v8 = v7;
  v23 = v4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v31;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
      objc_msgSend(v14, "variantParam", v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("sharingRelationship"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (v10)
        {
          if (v9)
          {
LABEL_9:
            objc_msgSend(v24, "addObject:", v16);
            v11 = (v11 + 1);
            goto LABEL_10;
          }
        }
        else
        {
          objc_msgSend(v14, "invariantParam");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", CFSTR("album"));
          v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v9)
            goto LABEL_9;
        }
        objc_msgSend(v14, "invariantParam");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("info"));
        v9 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
LABEL_10:

      ++v13;
    }
    while (v8 != v13);
    v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v8 = v19;
  }
  while (v19);

  if ((_DWORD)v11)
  {
    v4 = v23;
    objc_msgSend(v23, "model");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_13;
    v25[3] = &unk_1E95BCD70;
    v26 = v23;
    v27 = v24;
    v10 = v10;
    v28 = v10;
    v9 = v9;
    v29 = v9;
    objc_msgSend(v20, "performBlockOnObservers:", v25);

    v21 = v26;
    goto LABEL_18;
  }
  v4 = v23;
LABEL_20:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSASModel:didFindDeletedAccessControls:inAlbum:info:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v7)
  {
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v21 = v6;
LABEL_18:

    goto LABEL_20;
  }
  v8 = v7;
  v23 = v4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v31;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
      objc_msgSend(v14, "variantParam", v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("sharingRelationship"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (v10)
        {
          if (v9)
          {
LABEL_9:
            objc_msgSend(v24, "addObject:", v16);
            v11 = (v11 + 1);
            goto LABEL_10;
          }
        }
        else
        {
          objc_msgSend(v14, "invariantParam");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", CFSTR("album"));
          v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v9)
            goto LABEL_9;
        }
        objc_msgSend(v14, "invariantParam");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("info"));
        v9 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
LABEL_10:

      ++v13;
    }
    while (v8 != v13);
    v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v8 = v19;
  }
  while (v19);

  if ((_DWORD)v11)
  {
    v4 = v23;
    objc_msgSend(v23, "model");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_11;
    v25[3] = &unk_1E95BCD70;
    v26 = v23;
    v27 = v24;
    v10 = v10;
    v28 = v10;
    v9 = v9;
    v29 = v9;
    objc_msgSend(v20, "performBlockOnObservers:", v25);

    v21 = v26;
    goto LABEL_18;
  }
  v4 = v23;
LABEL_20:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSASModel:didFindNewAccessControls:inAlbum:info:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v7)
  {
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v21 = v6;
LABEL_18:

    goto LABEL_20;
  }
  v8 = v7;
  v23 = v4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v31;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
      objc_msgSend(v14, "variantParam", v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("assetCollection"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (v10)
        {
          if (v9)
          {
LABEL_9:
            objc_msgSend(v24, "addObject:", v16);
            v11 = (v11 + 1);
            goto LABEL_10;
          }
        }
        else
        {
          objc_msgSend(v14, "invariantParam");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", CFSTR("album"));
          v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v9)
            goto LABEL_9;
        }
        objc_msgSend(v14, "invariantParam");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("info"));
        v9 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
LABEL_10:

      ++v13;
    }
    while (v8 != v13);
    v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v8 = v19;
  }
  while (v19);

  if ((_DWORD)v11)
  {
    v4 = v23;
    objc_msgSend(v23, "model");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_9;
    v25[3] = &unk_1E95BCD70;
    v26 = v23;
    v27 = v24;
    v10 = v10;
    v28 = v10;
    v9 = v9;
    v29 = v9;
    objc_msgSend(v20, "performBlockOnObservers:", v25);

    v21 = v26;
    goto LABEL_18;
  }
  v4 = v23;
LABEL_20:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSASModel:didFindDeletedAssetCollections:inAlbum:info:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v7)
  {
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v21 = v6;
LABEL_18:

    goto LABEL_20;
  }
  v8 = v7;
  v23 = v4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v31;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
      objc_msgSend(v14, "variantParam", v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("assetCollection"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (v10)
        {
          if (v9)
          {
LABEL_9:
            objc_msgSend(v24, "addObject:", v16);
            v11 = (v11 + 1);
            goto LABEL_10;
          }
        }
        else
        {
          objc_msgSend(v14, "invariantParam");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", CFSTR("album"));
          v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v9)
            goto LABEL_9;
        }
        objc_msgSend(v14, "invariantParam");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("info"));
        v9 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
LABEL_10:

      ++v13;
    }
    while (v8 != v13);
    v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v8 = v19;
  }
  while (v19);

  if ((_DWORD)v11)
  {
    v4 = v23;
    objc_msgSend(v23, "model");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_7;
    v25[3] = &unk_1E95BCD70;
    v26 = v23;
    v27 = v24;
    v10 = v10;
    v28 = v10;
    v9 = v9;
    v29 = v9;
    objc_msgSend(v20, "performBlockOnObservers:", v25);

    v21 = v26;
    goto LABEL_18;
  }
  v4 = v23;
LABEL_20:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSASModel:didFindNewAssetCollections:inAlbum:info:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v7)
  {
    v10 = 0;
    v9 = 0;
    v18 = v6;
    goto LABEL_15;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v13, "variantParam");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("album"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (!v9)
        {
          objc_msgSend(v13, "invariantParam");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("info"));
          v9 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v20, "addObject:", v15);
        v10 = (v10 + 1);
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v8);

  if ((_DWORD)v10)
  {
    objc_msgSend(v4, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_5;
    v21[3] = &unk_1E95BCD00;
    v22 = v4;
    v23 = v20;
    v9 = v9;
    v24 = v9;
    objc_msgSend(v17, "performBlockOnObservers:", v21);

    v18 = v22;
LABEL_15:

  }
  return v10;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSASModel:didFindDeletedAlbums:info:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v7)
  {
    v10 = 0;
    v9 = 0;
    v18 = v6;
    goto LABEL_15;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v13, "variantParam");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("album"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (!v9)
        {
          objc_msgSend(v13, "invariantParam");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("info"));
          v9 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v20, "addObject:", v15);
        v10 = (v10 + 1);
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v8);

  if ((_DWORD)v10)
  {
    objc_msgSend(v4, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_3;
    v21[3] = &unk_1E95BCD00;
    v22 = v4;
    v23 = v20;
    v9 = v9;
    v24 = v9;
    objc_msgSend(v17, "performBlockOnObservers:", v21);

    v18 = v22;
LABEL_15:

  }
  return v10;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSASModel:didFindNewAlbums:info:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

@end
