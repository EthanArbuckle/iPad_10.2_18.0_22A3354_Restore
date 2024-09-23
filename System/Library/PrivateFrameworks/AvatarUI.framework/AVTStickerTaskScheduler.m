@implementation AVTStickerTaskScheduler

+ (AVTStickerTaskScheduler)schedulerWithRecordDataSource:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithEnvironment:recordDataSource:", v5, v3);

  return (AVTStickerTaskScheduler *)v6;
}

- (AVTStickerTaskScheduler)initWithEnvironment:(id)a3 recordDataSource:(id)a4
{
  id v6;
  id v7;
  AVTStickerTaskScheduler *v8;
  uint64_t v9;
  NSMutableDictionary *stickerPickerTasks;
  uint64_t v11;
  NSMutableDictionary *stickerPickerBacklogTasks;
  uint64_t v13;
  NSMutableDictionary *stickerSheetPlaceholderTasks;
  uint64_t v15;
  NSMutableDictionary *stickerSheetsTasks;
  void (**v17)(_QWORD, _QWORD);
  uint64_t v18;
  OS_dispatch_queue *stateLock;
  uint64_t v20;
  AVTUILogger *logger;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AVTStickerTaskScheduler;
  v8 = -[AVTStickerTaskScheduler init](&v23, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    stickerPickerTasks = v8->_stickerPickerTasks;
    v8->_stickerPickerTasks = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    stickerPickerBacklogTasks = v8->_stickerPickerBacklogTasks;
    v8->_stickerPickerBacklogTasks = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    stickerSheetPlaceholderTasks = v8->_stickerSheetPlaceholderTasks;
    v8->_stickerSheetPlaceholderTasks = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    stickerSheetsTasks = v8->_stickerSheetsTasks;
    v8->_stickerSheetsTasks = (NSMutableDictionary *)v15;

    objc_msgSend(v6, "lockProvider");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v17)[2](v17, "com.apple.AvatarUI.AVTStickerScheduler.stateLock");
    v18 = objc_claimAutoreleasedReturnValue();
    stateLock = v8->_stateLock;
    v8->_stateLock = (OS_dispatch_queue *)v18;

    objc_msgSend(v6, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    logger = v8->_logger;
    v8->_logger = (AVTUILogger *)v20;

    objc_storeStrong((id *)&v8->_recordDataSource, a4);
    -[AVTStickerTaskScheduler reloadData](v8, "reloadData");
  }

  return v8;
}

- (void)performStateWork:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AVTStickerTaskScheduler stateLock](self, "stateLock");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVTStickerTaskScheduler_performStateWork___block_invoke;
  block[3] = &unk_1EA51D058;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __44__AVTStickerTaskScheduler_performStateWork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "stickerPickerTasks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stickerPickerBacklogTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stickerSheetPlaceholderTasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stickerSheetsTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *, void *))(v2 + 16))(v2, v6, v3, v4, v5);

}

- (void)scheduleStickerTask:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  AVTStickerTaskScheduler *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__AVTStickerTaskScheduler_scheduleStickerTask___block_invoke;
  v8[3] = &unk_1EA51F5A0;
  v5 = v4;
  v10 = self;
  v11 = &v12;
  v9 = v5;
  -[AVTStickerTaskScheduler performStateWork:](self, "performStateWork:", v8);
  if (*((_BYTE *)v13 + 24))
  {
    -[AVTStickerTaskScheduler logger](self, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logStickerSchedulerStartedTask:forSchedulerRule:", v7, CFSTR("first task to run"));

    -[AVTStickerTaskScheduler startTask:](self, "startTask:", v5);
  }

  _Block_object_dispose(&v12, 8);
}

void __47__AVTStickerTaskScheduler_scheduleStickerTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(*(id *)(a1 + 32), "avatarRecordIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "stickerType");
  switch(v14)
  {
    case 2:
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v13);
      }
      objc_msgSend(v17, "addObject:", *(_QWORD *)(a1 + 32));

      break;
    case 1:
      v15 = *(_QWORD *)(a1 + 32);
      v16 = v11;
      goto LABEL_9;
    case 0:
      v15 = *(_QWORD *)(a1 + 32);
      v16 = v9;
LABEL_9:
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v13);
      break;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = objc_msgSend(v9, "count");
  v25 = objc_msgSend(v11, "count") + v18;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__AVTStickerTaskScheduler_scheduleStickerTask___block_invoke_2;
  v21[3] = &unk_1EA51F578;
  v21[4] = &v22;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v21);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v23[3] == 1;
  objc_msgSend(*(id *)(a1 + 40), "logger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logStickerSchedulerAddedTask:taskCount:", v20, v23[3]);

  _Block_object_dispose(&v22, 8);
}

uint64_t __47__AVTStickerTaskScheduler_scheduleStickerTask___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result + v4;
  return result;
}

- (void)lowerStickerPickerTaskPriority:(id)a3 avatarRecordIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__AVTStickerTaskScheduler_lowerStickerPickerTaskPriority_avatarRecordIdentifier___block_invoke;
  v10[3] = &unk_1EA51F5C8;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[AVTStickerTaskScheduler performStateWork:](self, "performStateWork:", v10);

}

void __81__AVTStickerTaskScheduler_lowerStickerPickerTaskPriority_avatarRecordIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "task");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);

  if (v7 == v8)
  {
    objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
  }

}

- (void)startTask:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "task");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__AVTStickerTaskScheduler_startTask___block_invoke;
  v7[3] = &unk_1EA51D160;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  ((void (**)(_QWORD, _QWORD *))v5)[2](v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __37__AVTStickerTaskScheduler_startTask___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didCompleteTask:", *(_QWORD *)(a1 + 32));

}

- (void)didCompleteTask:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AVTStickerTaskScheduler *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__15;
  v15 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__AVTStickerTaskScheduler_didCompleteTask___block_invoke;
  v6[3] = &unk_1EA51F5A0;
  v5 = v4;
  v8 = self;
  v9 = &v10;
  v7 = v5;
  -[AVTStickerTaskScheduler performStateWork:](self, "performStateWork:", v6);
  if (v11[5])
    -[AVTStickerTaskScheduler startTask:](self, "startTask:");

  _Block_object_dispose(&v10, 8);
}

void __43__AVTStickerTaskScheduler_didCompleteTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(*(id *)(a1 + 32), "avatarRecordIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __43__AVTStickerTaskScheduler_didCompleteTask___block_invoke_2;
  v25 = &unk_1EA51F5F0;
  v14 = v13;
  v26 = v14;
  v27 = *(id *)(a1 + 32);
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF0D0754](&v22);
  v16 = objc_msgSend(*(id *)(a1 + 32), "stickerType", v22, v23, v24, v25);
  switch(v16)
  {
    case 2:
      objc_msgSend(v12, "objectForKeyedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "indexOfObject:", *(_QWORD *)(a1 + 32));
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v17, "removeObjectAtIndex:", v18);

      break;
    case 1:
      ((void (**)(_QWORD, id))v15)[2](v15, v11);
      break;
    case 0:
      ((void (**)(_QWORD, id))v15)[2](v15, v9);
      ((void (**)(_QWORD, id))v15)[2](v15, v10);
      break;
  }
  objc_msgSend(*(id *)(a1 + 40), "nextTaskToRunFromStickerPickerTasks:stickerPickerBacklogStorage:stickerSheetPlaceholderTasks:stickerSheetsTasks:", v9, v10, v11, v12);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

void __43__AVTStickerTaskScheduler_didCompleteTask___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == *(void **)(a1 + 40))
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (void)cancelPickerTask:(id)a3 avatarRecordIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  AVTStickerTaskScheduler *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__AVTStickerTaskScheduler_cancelPickerTask_avatarRecordIdentifier___block_invoke;
  v10[3] = &unk_1EA51F618;
  v12 = self;
  v13 = v6;
  v11 = v7;
  v8 = v6;
  v9 = v7;
  -[AVTStickerTaskScheduler performStateWork:](self, "performStateWork:", v10);

}

void __67__AVTStickerTaskScheduler_cancelPickerTask_avatarRecordIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = objc_msgSend(v17, "count");
  if (v6 + objc_msgSend(v5, "count"))
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "task");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 48);

      if (v9 == v10)
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = v17;
LABEL_7:
        objc_msgSend(v12, "removeObjectForKey:", v11);
        objc_msgSend(*(id *)(a1 + 40), "logger");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logStickerSchedulerCancelledTask:", v16);

      }
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "task");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 48);

      if (v13 == v14)
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = v5;
        goto LABEL_7;
      }
    }

  }
}

- (void)cancelStickerSheetTasksForAvatarRecordIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AVTStickerTaskScheduler *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__AVTStickerTaskScheduler_cancelStickerSheetTasksForAvatarRecordIdentifier___block_invoke;
  v6[3] = &unk_1EA51F640;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[AVTStickerTaskScheduler performStateWork:](self, "performStateWork:", v6);

}

void __76__AVTStickerTaskScheduler_cancelStickerSheetTasksForAvatarRecordIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logStickerSchedulerCancelledStickerSheetTasksForIdentifier:", *(_QWORD *)(a1 + 32));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_msgSend(*(id *)(a1 + 40), "logger", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logStickerSchedulerCancelledTask:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)cancelAllTasks
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__AVTStickerTaskScheduler_cancelAllTasks__block_invoke;
  v2[3] = &unk_1EA51F668;
  v2[4] = self;
  -[AVTStickerTaskScheduler performStateWork:](self, "performStateWork:", v2);
}

void __41__AVTStickerTaskScheduler_cancelAllTasks__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(a2, "removeAllObjects");
  objc_msgSend(v11, "removeAllObjects");

  objc_msgSend(v10, "removeAllObjects");
  objc_msgSend(v9, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logStickerSchedulerCancelledAllTasks");

}

- (void)reloadData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTStickerTaskScheduler recordDataSource](self, "recordDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[AVTStickerTaskScheduler recordDataSource](self, "recordDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRecords");

  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      -[AVTStickerTaskScheduler recordDataSource](self, "recordDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recordAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v9);

    }
  }
  objc_sync_exit(v3);

  -[AVTStickerTaskScheduler allAvatarRecordIdentifiers](self, "allAvatarRecordIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  v11 = (void *)objc_msgSend(v12, "copy");
  -[AVTStickerTaskScheduler setAllAvatarRecordIdentifiers:](self, "setAllAvatarRecordIdentifiers:", v11);

  objc_sync_exit(v10);
}

- (void)setVisibleIndexPaths:(id)a3
{
  id v4;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_22);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTStickerTaskScheduler setSortedVisibleIndexPaths:](self, "setSortedVisibleIndexPaths:", v4);

}

uint64_t __48__AVTStickerTaskScheduler_setVisibleIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)nextTaskToRunFromStickerPickerTasks:(id)a3 stickerPickerBacklogStorage:(id)a4 stickerSheetPlaceholderTasks:(id)a5 stickerSheetsTasks:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[AVTStickerTaskScheduler selectedAvatarRecordIdentifier](self, "selectedAvatarRecordIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  -[AVTStickerTaskScheduler allAvatarRecordIdentifiers](self, "allAvatarRecordIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  -[AVTStickerTaskScheduler sortedVisibleIndexPaths](self, "sortedVisibleIndexPaths");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  -[AVTStickerTaskScheduler selectedPickerThumbnailFromTasksStorage:selectedAvatarRecordIdentifier:](self, "selectedPickerThumbnailFromTasksStorage:selectedAvatarRecordIdentifier:", v10, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    -[AVTStickerTaskScheduler selectedSheetPlaceholderFromTasksStorage:selectedAvatarRecordIdentifier:](self, "selectedSheetPlaceholderFromTasksStorage:selectedAvatarRecordIdentifier:", v12, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      -[AVTStickerTaskScheduler nextVisibleSelectedSheetStickerFromTasksStorage:selectedAvatarRecordIdentifier:visibleIndexPaths:](self, "nextVisibleSelectedSheetStickerFromTasksStorage:selectedAvatarRecordIdentifier:visibleIndexPaths:", v13, v15, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        -[AVTStickerTaskScheduler nextPickerThumbnailFromTasksStorage:allAvatarRecordIdentifiers:](self, "nextPickerThumbnailFromTasksStorage:allAvatarRecordIdentifiers:", v10, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          -[AVTStickerTaskScheduler nextSelectedSheetStickerFromTasksStorage:selectedAvatarRecordIdentifier:](self, "nextSelectedSheetStickerFromTasksStorage:selectedAvatarRecordIdentifier:", v13, v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            -[AVTStickerTaskScheduler nextPickerThumbnailFromTasksBacklogStorage:allAvatarRecordIdentifiers:](self, "nextPickerThumbnailFromTasksBacklogStorage:allAvatarRecordIdentifiers:", v11, v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v20)
            {
              -[AVTStickerTaskScheduler nextSheetPlaceHolderFromTasksStorage:allAvatarRecordIdentifiers:](self, "nextSheetPlaceHolderFromTasksStorage:allAvatarRecordIdentifiers:", v12, v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v20)
              {
                -[AVTStickerTaskScheduler nextSheetStickerFromTasksStorage:allAvatarRecordIdentifiers:](self, "nextSheetStickerFromTasksStorage:allAvatarRecordIdentifiers:", v13, v17);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
          }
        }
      }
    }
  }
  v21 = v20;

  return v21;
}

- (id)nextPickerThumbnailFromTasksStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12), (_QWORD)v18);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            -[AVTStickerTaskScheduler logger](self, "logger");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "description");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "logStickerSchedulerStartedTask:forSchedulerRule:", v16, CFSTR("next picker thumbnail"));

            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)nextPickerThumbnailFromTasksBacklogStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12), (_QWORD)v18);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            -[AVTStickerTaskScheduler logger](self, "logger");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "description");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "logStickerSchedulerStartedTask:forSchedulerRule:", v16, CFSTR("next picker thumbnail"));

            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)selectedPickerThumbnailFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[AVTStickerTaskScheduler logger](self, "logger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logStickerSchedulerStartedTask:forSchedulerRule:", v10, CFSTR("selected picker thumbnail"));

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)selectedSheetPlaceholderFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[AVTStickerTaskScheduler logger](self, "logger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logStickerSchedulerStartedTask:forSchedulerRule:", v10, CFSTR("selected sheet placeholder"));

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)nextVisibleSelectedSheetStickerFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4 visibleIndexPaths:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  AVTStickerTaskScheduler *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") && objc_msgSend(v10, "count"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v12 = v10;
      v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v30)
      {
        v29 = self;
        v13 = *(_QWORD *)v40;
        v33 = v11;
        v34 = v9;
        v32 = v12;
        v28 = *(_QWORD *)v40;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v40 != v13)
              objc_enumerationMutation(v12);
            v31 = v14;
            v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v14);
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v16 = v11;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v36;
              while (2)
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v36 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                  objc_msgSend(v21, "indexPath");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqual:", v15);

                  if ((v23 & 1) != 0)
                  {
                    -[AVTStickerTaskScheduler logger](v29, "logger");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "description");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "logStickerSchedulerStartedTask:forSchedulerRule:", v26, CFSTR("next visible selected sheet sticker"));

                    v24 = v21;
                    v11 = v33;
                    v9 = v34;
                    v12 = v32;
                    goto LABEL_24;
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                if (v18)
                  continue;
                break;
              }
            }

            v14 = v31 + 1;
            v11 = v33;
            v9 = v34;
            v12 = v32;
            v13 = v28;
          }
          while (v31 + 1 != v30);
          v24 = 0;
          v30 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v30);
      }
      else
      {
        v24 = 0;
      }
LABEL_24:

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)nextSelectedSheetStickerFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[AVTStickerTaskScheduler logger](self, "logger");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logStickerSchedulerStartedTask:forSchedulerRule:", v11, CFSTR("next selected sheet sticker"));

      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)nextSheetPlaceHolderFromTasksStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12), (_QWORD)v18);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            -[AVTStickerTaskScheduler logger](self, "logger");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "description");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "logStickerSchedulerStartedTask:forSchedulerRule:", v16, CFSTR("next sheet placeholder"));

            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)nextSheetStickerFromTasksStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12), (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count"))
          {
            objc_msgSend(v13, "firstObject");
            v14 = objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = (void *)v14;
              -[AVTStickerTaskScheduler logger](self, "logger");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "description");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "logStickerSchedulerStartedTask:forSchedulerRule:", v17, CFSTR("next sheet sticker"));

              goto LABEL_14;
            }
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_14:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (NSMutableDictionary)stickerPickerTasks
{
  return self->_stickerPickerTasks;
}

- (NSMutableDictionary)stickerPickerBacklogTasks
{
  return self->_stickerPickerBacklogTasks;
}

- (NSMutableDictionary)stickerSheetPlaceholderTasks
{
  return self->_stickerSheetPlaceholderTasks;
}

- (NSMutableDictionary)stickerSheetsTasks
{
  return self->_stickerSheetsTasks;
}

- (AVTAvatarRecordDataSource)recordDataSource
{
  return self->_recordDataSource;
}

- (NSArray)allAvatarRecordIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAllAvatarRecordIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)selectedAvatarRecordIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSelectedAvatarRecordIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)sortedVisibleIndexPaths
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSortedVisibleIndexPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_sortedVisibleIndexPaths, 0);
  objc_storeStrong((id *)&self->_selectedAvatarRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_allAvatarRecordIdentifiers, 0);
  objc_storeStrong((id *)&self->_recordDataSource, 0);
  objc_storeStrong((id *)&self->_stickerSheetsTasks, 0);
  objc_storeStrong((id *)&self->_stickerSheetPlaceholderTasks, 0);
  objc_storeStrong((id *)&self->_stickerPickerBacklogTasks, 0);
  objc_storeStrong((id *)&self->_stickerPickerTasks, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end
