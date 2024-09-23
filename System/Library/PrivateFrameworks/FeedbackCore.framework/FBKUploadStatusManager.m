@implementation FBKUploadStatusManager

- (void)pollDEDForSessionsStateOnTask:(id)a3 sessions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        -[FBKUploadStatusManager deviceManager](self, "deviceManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deviceFromManager:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[FBKUploadStatusManager pollDEDForSessionsStateOnActiveSession:uploadTask:isCurrentDeviceSession:](self, "pollDEDForSessionsStateOnActiveSession:uploadTask:isCurrentDeviceSession:", v12, v6, objc_msgSend(v14, "isCurrentDevice"));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)pollDEDForSessionsStateOnActiveSession:(id)a3 uploadTask:(id)a4 isCurrentDeviceSession:(BOOL)a5
{
  -[FBKUploadStatusManager pollDEDForSessionsStateOnActiveSession:uploadTask:isCurrentDeviceSession:totalQueryCount:lastState:lastInfo:](self, "pollDEDForSessionsStateOnActiveSession:uploadTask:isCurrentDeviceSession:totalQueryCount:lastState:lastInfo:", a3, a4, a5, 0, 0, 0);
}

- (void)pollDEDForSessionsStateOnActiveSession:(id)a3 uploadTask:(id)a4 isCurrentDeviceSession:(BOOL)a5 totalQueryCount:(unint64_t)a6 lastState:(int64_t)a7 lastInfo:(id)a8
{
  id v13;
  id v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  NSObject *v21;
  FBKUploadStatusManager *v22;
  id v23;
  id v24;
  unint64_t v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a8;
  -[FBKUploadStatusManager stopTrackingTaskIfDeleted:](self, "stopTrackingTaskIfDeleted:", v14);
  v16 = -[FBKUploadStatusManager isTrackingTask:](self, "isTrackingTask:", v14);
  Log_2();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v19;
      _os_log_impl(&dword_21D9A9000, v18, OS_LOG_TYPE_INFO, "Polling session [%{public}@]", buf, 0xCu);

    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke;
    v20[3] = &unk_24E157B80;
    v21 = v13;
    v22 = self;
    v23 = v14;
    v24 = v15;
    v25 = a6;
    v26 = a5;
    +[FBKDEDHelper getStateOnSession:withCompletion:](FBKDEDHelper, "getStateOnSession:withCompletion:", v21, v20);

    v18 = v21;
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    -[FBKUploadStatusManager(DEDPolling) pollDEDForSessionsStateOnActiveSession:uploadTask:isCurrentDeviceSession:totalQueryCount:lastState:lastInfo:].cold.1(v14, v18);
  }

}

void __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  id *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  int64_t v26;
  dispatch_time_t v27;
  id v28;
  id v29;
  int8x16_t v30;
  _QWORD block[4];
  int8x16_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.fbk.ded")))
    {
      v11 = objc_msgSend(v9, "code");

      if (v11 == 105)
      {
        Log_2();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_DEFAULT, "Session polling timed out. Session might be finished and gone", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BE2CA50], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "hasRecentlyFinishedSessionWithIdentifier:", v14);

        Log_2();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v17)
          {
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v39 = v18;
            _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_DEFAULT, "DED has recently finished session [%{public}@]. Will report .uploadsFinished", buf, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 40), "didGetSessionStateUpdate:uploadTask:newState:sessionInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 7, *(_QWORD *)(a1 + 56));
        }
        else
        {
          if (v17)
          {
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v39 = v23;
            _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_DEFAULT, "DED has NOT recently finished session [%{public}@]. Will report .uploadsFinished", buf, 0xCu);

          }
        }
        goto LABEL_23;
      }
    }
    else
    {

    }
    Log_2();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v9;
      _os_log_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_DEFAULT, "Error getting session state [%{public}@]", buf, 0xCu);
    }
LABEL_22:

    goto LABEL_23;
  }
  v19 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "didGetSessionStateUpdate:uploadTask:newState:sessionInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), a2, v7);
  if (*(_QWORD *)(a1 + 64) >= 0x96uLL)
  {
    Log_2();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    objc_msgSend(*v19, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v21;
    v22 = "Maxed out state polling on session [%{public}@]";
LABEL_21:
    _os_log_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);

    goto LABEL_22;
  }
  if (a2 == 1 || a2 == 7 || objc_msgSend(*(id *)(a1 + 48), "isDeleted"))
  {
    Log_2();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    objc_msgSend(*v19, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v21;
    v22 = "State polling done on session [%{public}@]";
    goto LABEL_21;
  }
  v24 = *(_QWORD *)(a1 + 64) + 1;
  Log_2();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke_cold_1((id *)(a1 + 32), v24, v25);

  if (*(_BYTE *)(a1 + 72))
    v26 = 5000000000;
  else
    v26 = 15000000000;
  v27 = dispatch_time(0, v26);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke_20;
  block[3] = &unk_24E157B58;
  v30 = *(int8x16_t *)(a1 + 32);
  v28 = (id)v30.i64[0];
  v32 = vextq_s8(v30, v30, 8uLL);
  v29 = *(id *)(a1 + 48);
  v37 = *(_BYTE *)(a1 + 72);
  v33 = v29;
  v35 = v24;
  v36 = a2;
  v34 = v7;
  dispatch_after(v27, MEMORY[0x24BDAC9B8], block);

LABEL_23:
}

uint64_t __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pollDEDForSessionsStateOnActiveSession:uploadTask:isCurrentDeviceSession:totalQueryCount:lastState:lastInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
}

- (FBKUploadStatusManager)initWithData:(id)a3 ded:(id)a4 deviceManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  FBKUploadStatusManager *v11;
  FBKUploadStatusManager *v12;
  uint64_t v13;
  NSMutableDictionary *submissionTimers;
  uint64_t v15;
  NSMutableSet *trackedTasks;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FBKUploadStatusManager;
  v11 = -[FBKUploadStatusManager init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_data, v8);
    objc_storeStrong((id *)&v12->_ded, a4);
    objc_storeStrong((id *)&v12->_deviceManager, a5);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    submissionTimers = v12->_submissionTimers;
    v12->_submissionTimers = (NSMutableDictionary *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 5);
    trackedTasks = v12->_trackedTasks;
    v12->_trackedTasks = (NSMutableSet *)v15;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_shouldLogProgress = objc_msgSend(v17, "BOOLForKey:", CFSTR("SpamLogsWithUploadProgress"));

  }
  return v12;
}

- (void)trackUploadIfNeeded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  const char *v13;
  void *v14;
  int v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uploadTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Log_4();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      objc_msgSend(v4, "filerFormID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 67109120;
      LODWORD(v17) = objc_msgSend(v11, "intValue");
      v13 = "filer form [%i] has no upload tasks";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_14;
  }
  if (v7)
  {
    objc_msgSend(v4, "filerFormID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315394;
    v17 = "-[FBKUploadStatusManager trackUploadIfNeeded:]";
    v18 = 1024;
    v19 = objc_msgSend(v8, "intValue");
    _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "%s [%i]", (uint8_t *)&v16, 0x12u);

  }
  v9 = -[FBKUploadStatusManager isTrackingTask:](self, "isTrackingTask:", v5);
  Log_4();
  v6 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      objc_msgSend(v4, "filerFormID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");
      v16 = 67109120;
      LODWORD(v17) = v12;
      v13 = "Already tracking upload task for form [%i]";
LABEL_9:
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 8u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v10)
  {
    objc_msgSend(v4, "filerFormID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");
    v16 = 67109120;
    LODWORD(v17) = v15;
    _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "Will track upload task for form [%i]", (uint8_t *)&v16, 8u);

  }
  -[FBKUploadStatusManager trackUploadTask:](self, "trackUploadTask:", v5);
LABEL_14:

}

- (void)didLogOutWithCompletion:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[FBKUploadStatusManager stopTrackingAllTasks](self, "stopTrackingAllTasks");
  v4[2]();

}

- (void)trackUploadTask:(id)a3
{
  -[FBKUploadStatusManager trackUploadTask:attempt:](self, "trackUploadTask:attempt:", a3, 0);
}

- (void)trackUploadTask:(id)a3 attempt:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  unint64_t v36;
  const char *v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 == 1)
  {
    Log_4();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "taskIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v10;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "recursive attempt to track upload task [%{public}@]", buf, 0xCu);

    }
    goto LABEL_8;
  }
  if (!a4)
  {
    Log_4();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "taskIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v8;
      _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "will track upload task [%{public}@]", buf, 0xCu);

    }
    -[FBKUploadStatusManager trackedTasks](self, "trackedTasks");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v9, "addObject:", v6);
LABEL_8:

LABEL_9:
    objc_msgSend(v6, "formResponse");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "feedbackFollowup");
    v12 = objc_claimAutoreleasedReturnValue();
    Log_4();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11 | v12)
    {
      v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        v16 = (void *)v12;
        if (v15)
        {
          objc_msgSend(v6, "taskIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "intValue");
          *(_DWORD *)buf = 67109120;
          LODWORD(v41) = v18;
          _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "tracking FFU backed task [%i]", buf, 8u);

          v16 = (void *)v12;
        }
      }
      else
      {
        v16 = (void *)v11;
        if (v15)
        {
          objc_msgSend(v6, "taskIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "intValue");
          *(_DWORD *)buf = 67109120;
          LODWORD(v41) = v28;
          _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "tracking FR backed task [%i]", buf, 8u);

          v16 = (void *)v11;
        }
      }

      v19 = v16;
      if ((objc_msgSend(v19, "isServerSideComplete") & 1) != 0
        || (objc_msgSend(v19, "promises"),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            v30 = -[FBKUploadStatusManager shouldGiveUpOnUploadWithPromises:](self, "shouldGiveUpOnUploadWithPromises:", v29), v29, v30))
      {
        Log_4();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v19, "filerFormID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "intValue");
          *(_DWORD *)buf = 67109120;
          LODWORD(v41) = v33;
          _os_log_impl(&dword_21D9A9000, v31, OS_LOG_TYPE_DEFAULT, "task.form is complete according to server data. Deleting upload task on FilerForm [%i]", buf, 8u);

        }
        -[FBKUploadStatusManager stopTrackingUploadTask:](self, "stopTrackingUploadTask:", v6);
        -[FBKUploadStatusManager reloadFilerFormForFinishedTask:](self, "reloadFilerFormForFinishedTask:", v6);
      }
      else
      {
        Log_4();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "taskIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v6, "taskState");
          if (v36 > 8)
            v37 = "Unknown";
          else
            v37 = off_24E159148[v36];
          *(_DWORD *)buf = 138543618;
          v41 = v35;
          v42 = 2082;
          v43 = v37;
          _os_log_impl(&dword_21D9A9000, v34, OS_LOG_TYPE_DEFAULT, "upload task [%{public}@ | %{public}s] is not done, will poll (and wait) for DED for updates", buf, 0x16u);

        }
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __50__FBKUploadStatusManager_trackUploadTask_attempt___block_invoke;
        v38[3] = &unk_24E158F28;
        v38[4] = self;
        v39 = v6;
        -[FBKUploadStatusManager getAllBugSessionsForTask:completion:](self, "getAllBugSessionsForTask:completion:", v39, v38);

      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[FBKUploadStatusManager trackUploadTask:attempt:].cold.2(v6, v14);

      -[FBKUploadStatusManager stopTrackingUploadTask:](self, "stopTrackingUploadTask:", v6);
      -[FBKUploadStatusManager data](self, "data");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "deleteUploadForTask:completion:", v6, 0);
    }

    goto LABEL_33;
  }
  if (a4 < 2)
    goto LABEL_9;
  Log_4();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    -[FBKUploadStatusManager trackUploadTask:attempt:].cold.1(v11, v20, v21, v22, v23, v24, v25, v26);
LABEL_33:

}

void __50__FBKUploadStatusManager_trackUploadTask_attempt___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "waitOnUpdatesForTask:withSessions:", *(_QWORD *)(a1 + 40), v5);
    objc_msgSend(*(id *)(a1 + 32), "pollDEDForSessionsStateOnTask:sessions:", *(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    Log_4();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "taskIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134217984;
      v13 = objc_msgSend(v7, "unsignedLongValue");
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "Could not get all DED sessions for upload task [%lu]", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "fallbackToServerSideUploadUpdatesForTask:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "didFailToConnectToSessionsOnTask:", *(_QWORD *)(a1 + 40));
  }
  Log_4();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "taskIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");
    v12 = 67109120;
    LODWORD(v13) = v10;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "file promises might be collecting or compressing, will set long timeout for upload task [%i]", (uint8_t *)&v12, 8u);

  }
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "configureSubmissionTimerForTask:timeout:", *(_QWORD *)(a1 + 40), 300.0);

}

- (BOOL)shouldGiveUpOnUploadWithPromises:(id)a3
{
  return -[FBKUploadStatusManager shouldGiveUpOnUploadWithPromises:stalenessDate:](self, "shouldGiveUpOnUploadWithPromises:stalenessDate:", a3, 0);
}

- (BOOL)shouldGiveUpOnUploadWithPromises:(id)a3 stalenessDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v10, "setDay:", -1);
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(MEMORY[0x24BDBCE60]);
      objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v10, v12, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[FBKUploadStatusManager workingFilePromisesFromSet:stalenessDate:](self, "workingFilePromisesFromSet:stalenessDate:", v6, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v13, "count") == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)workingFilePromisesFromSet:(id)a3 stalenessDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__FBKUploadStatusManager_workingFilePromisesFromSet_stalenessDate___block_invoke;
  v9[3] = &unk_24E158F50;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "ded_selectItemsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __67__FBKUploadStatusManager_workingFilePromisesFromSet_stalenessDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((unint64_t)(objc_msgSend(v3, "state") - 1) > 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "updatedAt");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 32)) == 1;

  }
  Log_4();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "formResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");
    objc_msgSend(v3, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "state");
    v12 = "user_canceled";
    switch(v11)
    {
      case 0:
        break;
      case 1:
        v12 = "promised";
        break;
      case 2:
        v12 = "collected";
        break;
      case 3:
        v12 = "uploading";
        break;
      case 4:
        v12 = "uploaded";
        break;
      case 5:
        v12 = "received";
        break;
      case 6:
        v12 = "virus_scanning";
        break;
      case 7:
        v12 = "analyzing:";
        break;
      case 8:
        v12 = "done";
        break;
      case 9:
      case 10:
      case 11:
      case 12:
        goto LABEL_9;
      case 13:
        v12 = "deleted";
        break;
      case 14:
        v12 = "user_delete_requested";
        break;
      case 15:
        v12 = "user_deleted";
        break;
      default:
        if (v11 == 99)
          v12 = "upload_error";
        else
LABEL_9:
          v12 = "Unknown";
        break;
    }
    v14[0] = 67109890;
    v14[1] = v9;
    v15 = 2114;
    v16 = v10;
    v17 = 2082;
    v18 = v12;
    v19 = 1024;
    v20 = !v5;
    _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_INFO, "File promise for FR [%i] [%{public}@ - %{public}s] done? [%i]", (uint8_t *)v14, 0x22u);

  }
  return v5;
}

- (void)stopTrackingTaskIfDeleted:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isDeleted"))
  {
    Log_4();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[FBKUploadStatusManager stopTrackingTaskIfDeleted:].cold.1(v4);

    -[FBKUploadStatusManager stopTrackingUploadTask:](self, "stopTrackingUploadTask:", v4);
  }

}

- (void)waitOnUpdatesForTask:(id)a3 withSessions:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setUploadDelegate:", self);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)getAllBugSessionsForTask:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FBKUploadStatusManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[FBKUploadStatusManager deviceManager](self, "deviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke;
  v11[3] = &unk_24E157138;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runAfterScan:", v11);

}

void __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  NSObject *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[4];
  uint64_t v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_group_create();
  v3 = objc_alloc(MEMORY[0x24BDBCEF0]);
  objc_msgSend(a1[4], "bugSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  Log_4();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_cold_2(a1 + 4, v5);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(a1[4], "bugSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  v8 = v27;
  if (v7)
  {
    v9 = v7;
    v30 = *(_QWORD *)v39;
    v28 = *MEMORY[0x24BE2C9B8];
    v29 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
        dispatch_group_enter(v2);
        objc_msgSend(a1[5], "ded");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sessionForIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v8, "addObject:", v14);
          dispatch_group_leave(v2);
        }
        else
        {
          objc_msgSend(a1[5], "deviceManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deviceFromManager:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v28);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "hasCapabilities:", v17);

            Log_4();
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if ((v18 & 1) != 0)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_cold_1(v42, v11, &v43, v20);

              objc_msgSend(v11, "identifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "deviceIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v35[0] = MEMORY[0x24BDAC760];
              v35[1] = 3221225472;
              v35[2] = __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_31;
              v35[3] = &unk_24E158F78;
              v35[4] = v11;
              v36 = v2;
              v37 = v27;
              +[FBKDEDHelper reconnectWithBugSessionWithIdentifier:deviceIdentifier:completion:](FBKDEDHelper, "reconnectWithBugSessionWithIdentifier:deviceIdentifier:completion:", v21, v22, v35);

              v8 = v27;
            }
            else
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v11, "identifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v45 = v25;
                _os_log_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_DEFAULT, "Device does not support session restart. Cannot poll session [%{public}@]", buf, 0xCu);

              }
              dispatch_group_leave(v2);
            }
            v6 = v29;
          }
          else
          {
            Log_4();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "identifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v45 = v24;
              _os_log_impl(&dword_21D9A9000, v23, OS_LOG_TYPE_DEFAULT, "Could not find active device. Cannot reconnect to session [%{public}@]", buf, 0xCu);

            }
            dispatch_group_leave(v2);
          }

        }
        ++v10;
      }
      while (v9 != v10);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v9);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_33;
  block[3] = &unk_24E157138;
  v32 = a1[4];
  v33 = v8;
  v34 = a1[6];
  v26 = v8;
  dispatch_group_notify(v2, MEMORY[0x24BDAC9B8], block);

}

void __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_31(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  Log_4();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "Failed to reconnect with session [%{public}@]", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "Reconnected with session [%{public}@]", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_33(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "bugSessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  v4 = v3 == objc_msgSend(*(id *)(a1 + 40), "count");

  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _BOOL8))(v5 + 16))(v5, v6, v4);

}

- (void)fallbackToServerSideUploadUpdatesForTask:(id)a3
{
  -[FBKUploadStatusManager fallbackToServerSideUploadUpdatesForTask:attempts:](self, "fallbackToServerSideUploadUpdatesForTask:attempts:", a3, 0);
}

- (void)fallbackToServerSideUploadUpdatesForTask:(id)a3 attempts:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD aBlock[4];
  id v45;
  NSObject *v46;
  id v47;
  id v48[3];
  id location;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  unint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(v6, "isDeleted") & 1) != 0
    || !-[FBKUploadStatusManager isTrackingTask:](self, "isTrackingTask:", v6))
  {
    Log_4();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBKUploadStatusManager fallbackToServerSideUploadUpdatesForTask:attempts:].cold.1(v8, v27, v28, v29, v30, v31, v32, v33);
  }
  else
  {
    if (!a4)
    {
      -[FBKUploadStatusManager data](self, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateTask:withSubmissionStage:", v6, 8);

    }
    objc_msgSend(v6, "filerForm");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v9, "setMinute:", -60);
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc_init(MEMORY[0x24BDBCE60]);
      objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v9, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject promises](v8, "promises");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKUploadStatusManager workingFilePromisesFromSet:stalenessDate:](self, "workingFilePromisesFromSet:stalenessDate:", v13, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "count");

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke;
      aBlock[3] = &unk_24E158FC8;
      v16 = v6;
      v45 = v16;
      objc_copyWeak(v48, &location);
      v8 = v8;
      v46 = v8;
      v39 = v12;
      v47 = v39;
      v48[1] = (id)a4;
      v48[2] = v15;
      v17 = _Block_copy(aBlock);
      objc_msgSend(v16, "formResponse");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      Log_4();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          objc_msgSend(v16, "formResponse");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "ID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "intValue");
          *(_DWORD *)buf = 67109376;
          v51 = v23;
          v52 = 2048;
          v53 = a4;
          _os_log_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_DEFAULT, "refreshing FR [%i] for upload tracking, attempt [%lu]", buf, 0x12u);

        }
        -[FBKUploadStatusManager data](self, "data");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "formID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_37;
        v42[3] = &unk_24E158FF0;
        v43 = v17;
        objc_msgSend(v24, "refreshFormResponseOnlyWithID:completion:", v25, v42);
        v26 = &v43;
      }
      else
      {
        if (v20)
        {
          objc_msgSend(v16, "feedbackFollowup");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "ID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "intValue");
          *(_DWORD *)buf = 67109376;
          v51 = v37;
          v52 = 2048;
          v53 = a4;
          _os_log_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_DEFAULT, "refreshing FFU [%i] for upload tracking, attempt [%lu]", buf, 0x12u);

        }
        -[FBKUploadStatusManager data](self, "data");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "feedbackFollowup");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "ID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_39;
        v40[3] = &unk_24E159018;
        v41 = v17;
        objc_msgSend(v24, "feedbackFollowupForID:completion:", v38, v40);

        v26 = &v41;
      }

      objc_destroyWeak(v48);
      objc_destroyWeak(&location);

    }
    else
    {
      Log_4();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[FBKUploadStatusManager fallbackToServerSideUploadUpdatesForTask:attempts:].cold.2(v6);

      -[FBKUploadStatusManager didFailToGetUploadUpdatesForUploadTask:shouldTryServerUpdates:](self, "didFailToGetUploadUpdatesForUploadTask:shouldTryServerUpdates:", v6, 0);
    }
  }

}

void __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  dispatch_time_t v22;
  _QWORD block[4];
  id v24;
  id v25[2];
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    Log_4();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_cold_1(a1);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "stopTrackingUploadTask:", *(_QWORD *)(a1 + 32));
    goto LABEL_11;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isServerSideComplete") & 1) != 0
    || (v6 = (id *)(a1 + 56),
        v7 = objc_loadWeakRetained((id *)(a1 + 56)),
        objc_msgSend(*(id *)(a1 + 40), "promises"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "shouldGiveUpOnUploadWithPromises:stalenessDate:", v8, *(_QWORD *)(a1 + 48)),
        v8,
        v7,
        v9))
  {
    Log_4();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "filerFormID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      v27 = objc_msgSend(v11, "intValue");
      _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "task FR/FFU is complete or stale according to server data. Deleting upload task on FilerForm [%i]", buf, 8u);

    }
    v6 = (id *)(a1 + 56);
LABEL_10:
    v12 = objc_loadWeakRetained(v6);
    objc_msgSend(v12, "stopTrackingUploadTask:", *(_QWORD *)(a1 + 32));

    WeakRetained = objc_loadWeakRetained(v6);
    objc_msgSend(WeakRetained, "reloadFilerFormForFinishedTask:", *(_QWORD *)(a1 + 32));
LABEL_11:

    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 64) >= 0x14uLL)
  {
    Log_4();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "filerFormID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109632;
      v27 = 20;
      v28 = 1024;
      v29 = 10;
      v30 = 1024;
      v31 = objc_msgSend(v14, "intValue");
      _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_DEFAULT, "FR/FFU uploads have not finished after [%d] attempts every [%d] seconds. Deleting upload task on FilerForm [%i]", buf, 0x14u);

    }
    goto LABEL_10;
  }
  v15 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "promises");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "workingFilePromisesFromSet:stalenessDate:", v16, *(_QWORD *)(a1 + 48));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (*(_QWORD *)(a1 + 72) <= v18)
  {
    v21 = *(_QWORD *)(a1 + 64) + 1;
  }
  else
  {
    Log_4();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "filerFormID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      v27 = objc_msgSend(v20, "intValue");
      _os_log_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_DEFAULT, "reseting refresh count for FR/FFU [%i]", buf, 8u);

    }
    v21 = 1;
  }
  v22 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_35;
  block[3] = &unk_24E158FA0;
  objc_copyWeak(v25, (id *)(a1 + 56));
  v24 = *(id *)(a1 + 32);
  v25[1] = (id)v21;
  dispatch_after(v22, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v25);
LABEL_12:

}

void __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_35(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "fallbackToServerSideUploadUpdatesForTask:attempts:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

uint64_t __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)configureSubmissionTimerForTask:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  FBKSubmissionTimer *v9;
  NSObject *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[FBKUploadStatusManager submissionTimers](self, "submissionTimers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (FBKSubmissionTimer *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    Log_4();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[FBKUploadStatusManager configureSubmissionTimerForTask:timeout:].cold.1(v10);

    v9 = -[FBKSubmissionTimer initWithDelegate:forTask:initialTimeout:]([FBKSubmissionTimer alloc], "initWithDelegate:forTask:initialTimeout:", self, v6, a4);
    -[FBKUploadStatusManager submissionTimers](self, "submissionTimers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v9, v12);

  }
  return v9;
}

- (void)didFailToGetUploadUpdatesForUploadTask:(id)a3 shouldTryServerUpdates:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v4)
  {
    -[FBKUploadStatusManager fallbackToServerSideUploadUpdatesForTask:](self, "fallbackToServerSideUploadUpdatesForTask:", v6);
  }
  else
  {
    Log_4();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "taskIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = 67109120;
      v9[1] = objc_msgSend(v8, "intValue");
      _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "could not get upload updates for task [%i], giving up and deleting upload task", (uint8_t *)v9, 8u);

    }
    -[FBKUploadStatusManager stopTrackingUploadTask:](self, "stopTrackingUploadTask:", v6);
    -[FBKUploadStatusManager reloadFilerFormForFinishedTask:](self, "reloadFilerFormForFinishedTask:", v6);
  }

}

- (void)didFailToGetUploadUpdatesForUploadTask:(id)a3
{
  -[FBKUploadStatusManager didFailToGetUploadUpdatesForUploadTask:shouldTryServerUpdates:](self, "didFailToGetUploadUpdatesForUploadTask:shouldTryServerUpdates:", a3, 1);
}

- (void)reloadFilerFormForFinishedTask:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  objc_msgSend(v4, "feedbackFollowup");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "feedbackFollowup"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isDeleted"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    -[FBKUploadStatusManager data](self, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "feedbackFollowup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __57__FBKUploadStatusManager_reloadFilerFormForFinishedTask___block_invoke;
    v24[3] = &unk_24E159040;
    v24[4] = self;
    v25 = v4;
    objc_msgSend(v14, "feedbackFollowupForID:completion:", v16, v24);

  }
  else
  {
    objc_msgSend(v4, "formResponse");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9
      && (v10 = (void *)v9,
          objc_msgSend(v4, "formResponse"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isDeleted"),
          v11,
          v10,
          (v12 & 1) == 0))
    {
      objc_msgSend(v4, "formResponse");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contentItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "feedback");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[FBKUploadStatusManager data](self, "data");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __57__FBKUploadStatusManager_reloadFilerFormForFinishedTask___block_invoke_2;
        v22[3] = &unk_24E159068;
        v22[4] = self;
        v23 = v4;
        objc_msgSend(v20, "getFormResponseStubForFeedback:forceRefresh:completion:", v19, 1, v22);

      }
      else
      {
        -[FBKUploadStatusManager deleteAndNotifyUploadTaskWithTask:](self, "deleteAndNotifyUploadTaskWithTask:", v4);
      }

    }
    else
    {
      Log_4();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_DEFAULT, "Upload task somehow has no FB or FFU", v21, 2u);
      }

      -[FBKUploadStatusManager deleteAndNotifyUploadTaskWithTask:](self, "deleteAndNotifyUploadTaskWithTask:", v4);
    }
  }

}

uint64_t __57__FBKUploadStatusManager_reloadFilerFormForFinishedTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteAndNotifyUploadTaskWithTask:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__FBKUploadStatusManager_reloadFilerFormForFinishedTask___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteAndNotifyUploadTaskWithTask:", *(_QWORD *)(a1 + 40));
}

- (void)deleteAndNotifyUploadTaskWithTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "filerForm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKUploadStatusManager data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__FBKUploadStatusManager_deleteAndNotifyUploadTaskWithTask___block_invoke;
  v9[3] = &unk_24E159090;
  v7 = v4;
  v10 = v7;
  objc_copyWeak(&v12, &location);
  v8 = v5;
  v11 = v8;
  objc_msgSend(v6, "deleteUploadForTask:completion:", v7, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __60__FBKUploadStatusManager_deleteAndNotifyUploadTaskWithTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v3 = a2;
  if (v3)
  {
    Log_4();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__FBKUploadStatusManager_deleteAndNotifyUploadTaskWithTask___block_invoke_cold_1(a1);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("FBKFormUploadStatusChangeNotification"), *(_QWORD *)(a1 + 40));

}

- (BOOL)isTrackingTask:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FBKUploadStatusManager trackedTasks](self, "trackedTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)stopTrackingAllTasks
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[FBKUploadStatusManager trackedTasks](self, "trackedTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[FBKUploadStatusManager stopTrackingUploadTask:](self, "stopTrackingUploadTask:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  Log_4();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "Removed all tracked tasks.", v11, 2u);
  }

}

- (void)stopTrackingUploadTask:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKUploadStatusManager trackedTasks](self, "trackedTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  Log_4();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134217984;
    v14 = objc_msgSend(v7, "unsignedIntegerValue");
    _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_INFO, "Removing tracked task [%lu] from list.", (uint8_t *)&v13, 0xCu);

  }
  -[FBKUploadStatusManager submissionTimers](self, "submissionTimers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

  Log_4();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "taskIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");
    v13 = 134217984;
    v14 = v12;
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "No longer tracking task [%lu]", (uint8_t *)&v13, 0xCu);

  }
}

- (void)timer:(id)a3 didTimeoutForTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[FBKUploadStatusManager isTrackingTask:](self, "isTrackingTask:", v7))
  {
    -[FBKUploadStatusManager data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainQueueContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectWithID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    Log_4();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "currentInterval");
      v14 = v13;
      -[NSObject taskIdentifier](v11, "taskIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218240;
      v20 = v14;
      v21 = 1024;
      v22 = objc_msgSend(v15, "intValue");
      _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_DEFAULT, "submission timer [%lf] for task id [%i] timed out", (uint8_t *)&v19, 0x12u);

    }
    if (v11)
    {
      -[FBKUploadStatusManager didFailToGetUploadUpdatesForUploadTask:](self, "didFailToGetUploadUpdatesForUploadTask:", v11);
    }
    else
    {
      Log_4();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "taskIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue");
        v19 = 67109120;
        LODWORD(v20) = v18;
        _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_DEFAULT, "timer callback with upload task [%i], but task no longer exists in context", (uint8_t *)&v19, 8u);

      }
    }
  }
  else
  {
    Log_4();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FBKUploadStatusManager timer:didTimeoutForTask:].cold.1(v7, v11);
  }

}

- (void)didFailToConnectToSessionsOnTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  dispatch_time_t v18;
  _QWORD block[4];
  id v20;
  FBKUploadStatusManager *v21;
  uint64_t v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKUploadStatusManager deviceManager](self, "deviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thisDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "bugSessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "deviceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v7);

      if (!v14)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    Log_4();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_DEFAULT, "Failed to poll one device local session. Will time out if no upload progress comes in", buf, 2u);
    }

    objc_msgSend(v4, "bytesUploaded");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntValue");

    v18 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__FBKUploadStatusManager_didFailToConnectToSessionsOnTask___block_invoke;
    block[3] = &unk_24E1590B8;
    v21 = self;
    v22 = v17;
    v20 = v4;
    dispatch_after(v18, MEMORY[0x24BDAC9B8], block);
    v8 = v20;
  }

}

void __59__FBKUploadStatusManager_didFailToConnectToSessionsOnTask___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "bytesUploaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  if (*(_QWORD *)(a1 + 48) == v3)
  {
    Log_4();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Failed to poll one device local session. Deleting upload task", v5, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "stopTrackingUploadTask:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "reloadFilerFormForFinishedTask:", *(_QWORD *)(a1 + 32));
  }
}

- (void)didGetSessionStateUpdate:(id)a3 uploadTask:(id)a4 newState:(int64_t)a5 sessionInfo:(id)a6
{
  id v10;
  id v11;
  char *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (char *)a6;
  Log_4();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a5 + 1) > 9)
      v14 = "Unknown";
    else
      v14 = off_24E159190[a5 + 1];
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "taskIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 136446722;
    v26 = v14;
    v27 = 2114;
    v28 = v15;
    v29 = 2114;
    v30 = v16;
    _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_INFO, "Session update: state: [%{public}s], session: [%{public}@], task: [%{public}@]", (uint8_t *)&v25, 0x20u);

  }
  if (-[FBKUploadStatusManager shouldLogProgress](self, "shouldLogProgress"))
  {
    Log_4();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v25 = 138543362;
      v26 = v12;
      _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_INFO, "Session update: state  info: [%{public}@]", (uint8_t *)&v25, 0xCu);
    }

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("finisher"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("bytes_uploaded"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("finisher"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("total_bytes_to_upload"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntValue");

  if (a5 == 7)
    v24 = v23;
  else
    v24 = v20;
  -[FBKUploadStatusManager updateUploadTask:withUploadProgress:uploadSize:onBugSession:state:](self, "updateUploadTask:withUploadProgress:uploadSize:onBugSession:state:", v11, v24, v23, v10, a5);

}

- (void)uploadProgress:(unint64_t)a3 total:(int64_t)a4 session:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;

  v8 = a5;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKUploadStatusManager data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainQueueContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBKUploadTask fetchRequest](FBKUploadTask, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v8, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("ANY bugSessions.identifier == %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v15);

  v20 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v12, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;
  objc_msgSend(v16, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18 || v17)
  {
    Log_4();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FBKUploadStatusManager uploadProgress:total:session:].cold.1();

    objc_msgSend(v8, "setUploadDelegate:", 0);
  }
  else
  {
    -[FBKUploadStatusManager updateUploadTask:withUploadProgress:uploadSize:onBugSession:state:](self, "updateUploadTask:withUploadProgress:uploadSize:onBugSession:state:", v18, a3, a4, v8, -2);
  }

}

- (void)updateUploadTask:(id)a3 withUploadProgress:(unint64_t)a4 uploadSize:(unint64_t)a5 onBugSession:(id)a6 state:(int64_t)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  NSObject *v27;
  char *v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  NSObject *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  if (-[FBKUploadStatusManager shouldLogProgress](self, "shouldLogProgress"))
  {
    Log_4();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v42 = "-[FBKUploadStatusManager updateUploadTask:withUploadProgress:uploadSize:onBugSession:state:]";
      v43 = 2112;
      v44 = v15;
      v45 = 2112;
      v46 = v16;
      v47 = 2112;
      v48 = v17;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_INFO, "%s %@ of %@ for %@", buf, 0x2Au);

    }
  }
  -[FBKUploadStatusManager stopTrackingTaskIfDeleted:](self, "stopTrackingTaskIfDeleted:", v12);
  if (-[FBKUploadStatusManager isTrackingTask:](self, "isTrackingTask:", v12))
  {
    objc_msgSend(v12, "bugSessions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __92__FBKUploadStatusManager_updateUploadTask_withUploadProgress_uploadSize_onBugSession_state___block_invoke;
    v39[3] = &unk_24E1590E0;
    v19 = v13;
    v40 = v19;
    objc_msgSend(v18, "ded_findWithBlock:", v39);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBytesToUpload:", v21);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBytesUploaded:", v22);

      objc_msgSend(v20, "setState:", a7);
      -[FBKUploadStatusManager configureSubmissionTimerForTask:timeout:](self, "configureSubmissionTimerForTask:timeout:", v12, 30.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateBytesToUploadAndUploadedAfterBugSessionUpdate");
      v24 = objc_msgSend(v12, "newSubmissionStageAfterBugSessionUpdate");
      if (v24 != objc_msgSend(v12, "localSubmissionStage"))
      {
        -[FBKUploadStatusManager data](self, "data");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "updateTask:withSubmissionStage:", v12, v24);

      }
      switch(v24)
      {
        case 2:
        case 8:
          v26 = 300.0;
          goto LABEL_15;
        case 4:
          v26 = 25.0;
LABEL_15:
          objc_msgSend(v23, "resetTimerWithInterval:", v26);
          break;
        case 6:
          Log_4();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "taskIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "intValue");
            *(_DWORD *)buf = 67109120;
            LODWORD(v42) = v31;
            _os_log_impl(&dword_21D9A9000, v29, OS_LOG_TYPE_DEFAULT, "Finished all uploads for upload task [%i]. Deleting upload task", buf, 8u);

          }
          objc_msgSend(v19, "setUploadDelegate:", 0);
          -[FBKUploadStatusManager stopTrackingUploadTask:](self, "stopTrackingUploadTask:", v12);
          -[FBKUploadStatusManager reloadFilerFormForFinishedTask:](self, "reloadFilerFormForFinishedTask:", v12);
          break;
        default:
          break;
      }
      -[FBKUploadStatusManager data](self, "data");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "mainQueueContext");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v33, "hasChanges"))
      {
        Log_4();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          -[FBKUploadStatusManager updateUploadTask:withUploadProgress:uploadSize:onBugSession:state:].cold.2(v19);

        v38 = 0;
        objc_msgSend(v33, "save:", &v38);
        v35 = v38;
        if (v35)
        {
          v36 = v35;
          Log_4();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[FBKUploadStatusManager updateUploadTask:withUploadProgress:uploadSize:onBugSession:state:].cold.1(v36, v37);

        }
      }

    }
    else
    {
      Log_4();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "identifier");
        v28 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v28;
        _os_log_impl(&dword_21D9A9000, v27, OS_LOG_TYPE_DEFAULT, "FBK bug session is nil for ded session [%{public}@] in upload status callback, upload must be done", buf, 0xCu);

      }
      objc_msgSend(v19, "setUploadDelegate:", 0);
    }

  }
}

uint64_t __92__FBKUploadStatusManager_updateUploadTask_withUploadProgress_uploadSize_onBugSession_state___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (FBKData)data
{
  return (FBKData *)objc_loadWeakRetained((id *)&self->_data);
}

- (void)setData:(id)a3
{
  objc_storeWeak((id *)&self->_data, a3);
}

- (DEDController)ded
{
  return (DEDController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (FBKDeviceManager)deviceManager
{
  return (FBKDeviceManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)trackedTasks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTrackedTasks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)submissionTimers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubmissionTimers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)shouldLogProgress
{
  return self->_shouldLogProgress;
}

- (void)setShouldLogProgress:(BOOL)a3
{
  self->_shouldLogProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionTimers, 0);
  objc_storeStrong((id *)&self->_trackedTasks, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_ded, 0);
  objc_destroyWeak((id *)&self->_data);
}

void __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2048;
  v9 = a2;
  _os_log_debug_impl(&dword_21D9A9000, a3, OS_LOG_TYPE_DEBUG, "Polling session [%{public}@] again, query count [%lu]", (uint8_t *)&v6, 0x16u);

}

- (void)trackUploadTask:(uint64_t)a3 attempt:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "failed to refresh stub form for upload tracking", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)trackUploadTask:(void *)a1 attempt:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "taskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "given task to track [%{public}@] has no parent: deleting", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)stopTrackingTaskIfDeleted:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "taskIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_3(&dword_21D9A9000, v2, v3, "Upload task [%{public}@] has been deleted. Will stop tracking", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl(&dword_21D9A9000, a4, OS_LOG_TYPE_DEBUG, "Will reconnect with session [%{public}@]", a1, 0xCu);

}

void __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_cold_2(id *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "taskIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongValue");
  objc_msgSend(*a1, "bugSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218242;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  _os_log_debug_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_DEBUG, "Task [%lu] has sessions [%{public}@]", (uint8_t *)&v8, 0x16u);

}

- (void)fallbackToServerSideUploadUpdatesForTask:(uint64_t)a3 attempts:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "Given task is already deleted or no longer tracked. Server-side updates not needed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)fallbackToServerSideUploadUpdatesForTask:(void *)a1 attempts:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "taskIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "intValue");
  OUTLINED_FUNCTION_4_1();
  _os_log_error_impl(v2, v3, v4, v5, v6, 8u);

  OUTLINED_FUNCTION_7();
}

void __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(*(id *)(a1 + 32), "formID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "intValue");
  OUTLINED_FUNCTION_4_1();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);

  OUTLINED_FUNCTION_5_2();
}

- (void)configureSubmissionTimerForTask:(os_log_t)log timeout:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21D9A9000, log, OS_LOG_TYPE_DEBUG, "creating new timer", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __60__FBKUploadStatusManager_deleteAndNotifyUploadTaskWithTask___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(*(id *)(a1 + 32), "taskIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);

  OUTLINED_FUNCTION_5_2();
}

- (void)timer:(void *)a1 didTimeoutForTask:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "taskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v3, "intValue");
  _os_log_debug_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_DEBUG, "Timer fired for task no longer tracked [%i], ignoring it", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_7();
}

- (void)uploadProgress:total:session:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  v3 = v0;
  _os_log_error_impl(&dword_21D9A9000, v1, OS_LOG_TYPE_ERROR, "_uploadProgress could not find Upload Task for session [%{public}@], error [%{public}@]", v2, 0x16u);
  OUTLINED_FUNCTION_7();
}

- (void)updateUploadTask:(void *)a1 withUploadProgress:(NSObject *)a2 uploadSize:onBugSession:state:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "_uploadProgress error saving [%{public}@]", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)updateUploadTask:(void *)a1 withUploadProgress:uploadSize:onBugSession:state:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_3(&dword_21D9A9000, v2, v3, "saving upload progress on session [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

@end
