@implementation IMDMessagePTaskXPCStore

- (BOOL)_networkCall_InsertRowGuid:(id)a3 taskFlags:(int64_t)a4
{
  IMDMessagePTaskInsertRow();
  return 1;
}

- (id)_networkCall_IMDMessagePTaskSelectWithLimit:(int64_t)a3
{
  return (id)IMDMessagePTaskSelectWithLimit();
}

- (BOOL)_networkCall_IMDMessagePTaskUpdateTaskFlagsForGUID:(id)a3 taskFlags:(int64_t)a4
{
  IMDMessagePTaskUpdateTaskFlagsForGUID();
  return 1;
}

- (BOOL)_networkCall_IMDMessagePTaskDeleteAllCompletedTask
{
  IMDMessagePTaskDeleteAllCompletedTask();
  return 1;
}

- (BOOL)storePTask:(id)a3
{
  _BOOL4 v3;

  if (a3)
  {
    v3 = -[IMDMessagePTaskXPCStore _networkCall_InsertRowGuid:taskFlags:](self, "_networkCall_InsertRowGuid:taskFlags:", objc_msgSend(a3, "guid"), objc_msgSend(a3, "taskFlags"));
    if (v3)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "__mainThreadPostNotificationName:object:", CFSTR("IMDMessagePTaskStoreAddedProcessingTask"), 0);
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)loadMostRecentMessagePTasks
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  IMDMessagePTask *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = -[IMDMessagePTaskXPCStore _networkCall_IMDMessagePTaskSelectWithLimit:](self, "_networkCall_IMDMessagePTaskSelectWithLimit:", 100);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = -[IMDMessagePTask initWithStoreDictionary:]([IMDMessagePTask alloc], "initWithStoreDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  if (v2)
    return v3;
  else
    return 0;
}

- (BOOL)deleteAllCompletedTasks
{
  return MEMORY[0x1E0DE7D20](self, sel__networkCall_IMDMessagePTaskDeleteAllCompletedTask);
}

- (BOOL)updateTaskFlagsForPTask:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(a3, "guid");
  objc_msgSend(a3, "taskFlags");
  return MEMORY[0x1E0DE7D20](self, sel__networkCall_IMDMessagePTaskUpdateTaskFlagsForGUID_taskFlags_);
}

@end
