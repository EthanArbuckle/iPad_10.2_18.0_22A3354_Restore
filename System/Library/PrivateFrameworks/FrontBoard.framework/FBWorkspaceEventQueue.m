@implementation FBWorkspaceEventQueue

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_15);
  return (id)sharedInstance___instance_1;
}

- (void)_noteQueueDidLock
{
  OUTLINED_FUNCTION_0_1(&dword_1A359A000, a1, a3, "Queue locked.", a5, a6, a7, a8, 0);
}

- (void)executeOrAppendEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BSEventQueue executeOrInsertEvents:atPosition:](self, "executeOrInsertEvents:atPosition:", v6, 1, v7, v8);
}

- (void)_noteQueueDidUnlock
{
  OUTLINED_FUNCTION_0_1(&dword_1A359A000, a1, a3, "Queue unlocked.", a5, a6, a7, a8, 0);
}

- (void)_noteWillPendEvents:(id)a3 atPosition:(int)a4
{
  id v5;
  NSObject *v6;

  v5 = a3;
  FBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FBWorkspaceEventQueue _noteWillPendEvents:atPosition:].cold.1(v5, a4, v6);

}

- (void)_noteWillExecuteEvent:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  FBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[FBWorkspaceEventQueue _noteWillExecuteEvent:].cold.1((uint64_t)v3, v4);

}

- (BOOL)_shouldProcessEvent:(id)a3 enqueuedDuringExecutionOfEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "name"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "name"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        v10))
  {
    FBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventQueue _shouldProcessEvent:enqueuedDuringExecutionOfEvent:].cold.1(v7, v11);

    v12 = 0;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

void __39__FBWorkspaceEventQueue_sharedInstance__block_invoke()
{
  FBWorkspaceEventQueue *v0;
  uint64_t v1;
  void *v2;

  v0 = [FBWorkspaceEventQueue alloc];
  v1 = -[BSEventQueue initWithName:onQueue:](v0, "initWithName:onQueue:", CFSTR("FBWorkspaceEventQueue"), MEMORY[0x1E0C80D38]);
  v2 = (void *)sharedInstance___instance_1;
  sharedInstance___instance_1 = v1;

}

- (void)executeOrPrependEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBWorkspaceEventQueue executeOrPrependEvents:](self, "executeOrPrependEvents:", v6, v7, v8);
}

- (void)executeOrPrependEvents:(id)a3
{
  -[BSEventQueue executeOrInsertEvents:atPosition:](self, "executeOrInsertEvents:atPosition:", a3, 0);
}

- (void)_noteWillCancelEventsWithName:(id)a3 count:(unint64_t)a4
{
  id v5;
  NSObject *v6;

  v5 = a3;
  FBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FBWorkspaceEventQueue _noteWillCancelEventsWithName:count:].cold.1((uint64_t)v5, a4, v6);

}

- (void)_shouldProcessEvent:(void *)a1 enqueuedDuringExecutionOfEvent:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1A359A000, a2, OS_LOG_TYPE_ERROR, "Event \"%{public}@\" queued an identically named event while still executing. Dropping it.", (uint8_t *)&v4, 0xCu);

}

- (void)_noteWillPendEvents:(NSObject *)a3 atPosition:.cold.1(void *a1, int a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v5 = a1;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a1, "count");
  if (v7 == 1)
  {
    objc_msgSend(v5, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = CFSTR("front");
  if (a2 == 1)
    v8 = CFSTR("back");
  v9 = 138543618;
  v10 = v5;
  v11 = 2112;
  v12 = v8;
  OUTLINED_FUNCTION_1_2(&dword_1A359A000, a3, v6, "Pending: %{public}@; queue position: %@", (uint8_t *)&v9);
  if (v7 == 1)

}

- (void)_noteWillCancelEventsWithName:(NSObject *)a3 count:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1A359A000, a3, (uint64_t)a3, "Removing %lu event(s) named \"%{public}@\", (uint8_t *)&v3);
}

- (void)_noteWillExecuteEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1A359A000, a2, OS_LOG_TYPE_DEBUG, "Executing: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
