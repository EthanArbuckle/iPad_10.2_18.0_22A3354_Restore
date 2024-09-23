@implementation CalDatabaseEnumerateUnconsumedObjectChangesForClient

void __CalDatabaseEnumerateUnconsumedObjectChangesForClient_block_invoke(uint64_t a1, uint64_t a2, CFArrayRef theArray, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  if (theArray && CFArrayGetCount(theArray) >= 1)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v12 = objc_opt_new();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_OWORD *)(a1 + 40);
    v21[0] = theArray;
    v21[1] = a4;
    v20 = *(_QWORD *)(a1 + 56);
    v21[2] = a5;
    v21[3] = a6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v18, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

  }
}

void ___CalDatabaseEnumerateUnconsumedObjectChangesForClient_block_invoke(uint64_t a1, uint64_t a2, int a3, int a4, void *a5, int a6)
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  int *v14;
  int v15;
  int v16;
  void *v17;
  uint64_t RecordStore;
  const os_unfair_lock *Context;
  _QWORD v20[4];
  id v21;
  int v22;
  int v23;

  v10 = a5;
  v11 = 40;
  if (a4)
    v11 = 32;
  v12 = *(id *)(a1 + v11);
  if (a3 == 6)
  {
    v13 = *(id *)(a1 + 48);

    v14 = (int *)(a1 + 72);
    if (*(_DWORD *)(a1 + 72))
    {
      v12 = v13;
LABEL_9:
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = ___CalDatabaseEnumerateUnconsumedObjectChangesForClient_block_invoke_2;
      v20[3] = &unk_1E4F905A0;
      v21 = v10;
      v16 = *v14;
      v22 = a6;
      v23 = v16;
      v17 = (void *)MEMORY[0x1A85B52F0](v20);

      goto LABEL_12;
    }
    v12 = v13;
  }
  else
  {
    v14 = (int *)(a1 + 72);
    v15 = *(_DWORD *)(a1 + 72);
    if (a3 == 26 && v15)
      goto LABEL_17;
    if (v15)
      goto LABEL_9;
  }
  v17 = (void *)MEMORY[0x1A85B52F0](v10);
LABEL_12:
  RecordStore = _CalDatabaseGetRecordStore(*(_QWORD *)(a1 + 64));
  if (CDBLockingAssertionsEnabled)
  {
    if (RecordStore)
    {
      Context = (const os_unfair_lock *)CPRecordStoreGetContext();
      if (Context)
        os_unfair_lock_assert_owner(Context + 20);
    }
  }
  CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithBindBlockAndProperties();

LABEL_17:
}

uint64_t ___CalDatabaseEnumerateUnconsumedObjectChangesForClient_block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
}

@end
