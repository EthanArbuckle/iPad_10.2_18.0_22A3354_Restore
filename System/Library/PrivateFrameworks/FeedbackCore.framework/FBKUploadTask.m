@implementation FBKUploadTask

- (BOOL)isBugSessionBacked
{
  void *v3;
  BOOL v4;
  void *v5;

  -[FBKUploadTask fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[FBKUploadTask bugSessions](self, "bugSessions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (void)updateBytesToUploadAndUploadedAfterBugSessionUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
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
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FBKUploadTask bugSessions](self, "bugSessions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "bytesToUpload");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v11, "integerValue");

        objc_msgSend(v10, "bytesUploaded");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v12, "integerValue");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKUploadTask setBytesToUpload:](self, "setBytesToUpload:", v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKUploadTask setBytesUploaded:](self, "setBytesUploaded:", v14);

}

- (unint64_t)newSubmissionStageAfterBugSessionUpdate
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[FBKUploadTask allSessionsHaveReportedUploadSize](self, "allSessionsHaveReportedUploadSize"))
  {
    -[FBKUploadTask bytesToUpload](self, "bytesToUpload");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntValue");
    -[FBKUploadTask bytesUploaded](self, "bytesUploaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntValue");

    if (v4 == v6)
    {
      +[FBKLog ded](FBKLog, "ded");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[FBKUploadTask taskIdentifier](self, "taskIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "finished upload for all bug sessions on task %@", (uint8_t *)&v10, 0xCu);

      }
      return 6;
    }
    return 4;
  }
  if (-[FBKUploadTask allSessionsHaveState:](self, "allSessionsHaveState:", 6))
    return 4;
  if (-[FBKUploadTask allSessionsHaveState:](self, "allSessionsHaveState:", 4)
    || -[FBKUploadTask allSessionsHaveState:](self, "allSessionsHaveState:", 5))
  {
    return 2;
  }
  if (-[FBKUploadTask allSessionsHaveState:](self, "allSessionsHaveState:", 7)
    || -[FBKUploadTask allSessionsHaveState:](self, "allSessionsHaveState:", 1))
  {
    return 6;
  }
  return 8;
}

- (void)addFBKSessionsWithDEDSessions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FBKUploadTask *v9;

  v4 = a3;
  -[FBKUploadTask managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke;
  v7[3] = &unk_24E157020;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

void __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  int *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[4];
  int v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v15 = &v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext", v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[FBKBugSession bugSessionWithDEDBugSession:inContext:](FBKBugSession, "bugSessionWithDEDBugSession:inContext:", v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          +[FBKLog ded](FBKLog, "ded");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke_cold_2(v21, v8, v15, v11);

        }
        objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "setBugSessions:", v2);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v12, "save:", &v16);
  v13 = v16;

  if (v13)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke_cold_1(v13, v14);

  }
}

- (id)filerForm
{
  void *v3;

  -[FBKUploadTask formResponse](self, "formResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[FBKUploadTask formResponse](self, "formResponse");
  else
    -[FBKUploadTask feedbackFollowup](self, "feedbackFollowup");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)entityName
{
  return CFSTR("UploadTask");
}

- (id)formID
{
  void *v2;
  void *v3;

  -[FBKUploadTask filerForm](self, "filerForm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filerFormID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)taskState
{
  void *v3;
  int64_t v4;

  -[FBKUploadTask willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("taskState"));
  -[FBKUploadTask primitiveTaskState](self, "primitiveTaskState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[FBKUploadTask didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("taskState"));
  return v4;
}

- (void)setTaskState:(int64_t)a3
{
  void *v5;

  -[FBKUploadTask willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("taskState"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKUploadTask setPrimitiveTaskState:](self, "setPrimitiveTaskState:", v5);

  -[FBKUploadTask didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("taskState"));
}

- (unint64_t)localSubmissionStage
{
  void *v3;
  unint64_t v4;

  -[FBKUploadTask willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("localSubmissionStage"));
  -[FBKUploadTask primitiveLocalSubmissionStage](self, "primitiveLocalSubmissionStage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  -[FBKUploadTask didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("localSubmissionStage"));
  return v4;
}

- (void)setLocalSubmissionStage:(unint64_t)a3
{
  void *v5;

  -[FBKUploadTask willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("localSubmissionStage"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKUploadTask setPrimitiveLocalSubmissionStage:](self, "setPrimitiveLocalSubmissionStage:", v5);

  -[FBKUploadTask didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("localSubmissionStage"));
}

- (BOOL)allSessionsHaveReportedState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[FBKUploadTask bugSessions](self, "bugSessions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "state"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)allSessionsHaveReportedUploadSize
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[FBKUploadTask bugSessions](self, "bugSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredSetUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[FBKUploadTask bugSessions](self, "bugSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v7, "count") == v6;

  return (char)v3;
}

uint64_t __50__FBKUploadTask_allSessionsHaveReportedUploadSize__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasNumberOfBytesToUpload");
}

- (BOOL)allSessionsHaveState:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[FBKUploadTask bugSessions](self, "bugSessions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "state") == a3)
          ++v8;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[FBKUploadTask bugSessions](self, "bugSessions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == v8;

  return v12;
}

void __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Error saving bug sessions [%{public}@]", (uint8_t *)&v4, 0xCu);

}

void __47__FBKUploadTask_addFBKSessionsWithDEDSessions___block_invoke_cold_2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_21D9A9000, a4, OS_LOG_TYPE_ERROR, "could not create bug session for id %{public}@", a1, 0xCu);

}

@end
