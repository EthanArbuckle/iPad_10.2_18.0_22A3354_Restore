@implementation CalDatabaseCopyOfAllAttachmentFilesInStoreWithoutLocalFilesAndDownloadAttemptsBelow

uint64_t __CalDatabaseCopyOfAllAttachmentFilesInStoreWithoutLocalFilesAndDownloadAttemptsBelow_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v4;
  BOOL v5;
  const os_unfair_lock *Context;
  sqlite3_int64 RowidForRecordID;
  int v8;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = *(sqlite3_stmt **)(a2 + 8);
    if (CDBLockingAssertionsEnabled)
      v5 = *(_QWORD *)(a1 + 40) == 0;
    else
      v5 = 1;
    if (!v5)
    {
      Context = (const os_unfair_lock *)CPRecordStoreGetContext();
      if (Context)
        os_unfair_lock_assert_owner(Context + 20);
    }
    CPRecordGetID();
    RowidForRecordID = CPRecordStoreGetRowidForRecordID();
    sqlite3_bind_int64(v4, 1, RowidForRecordID);
    v8 = 2;
  }
  else
  {
    v8 = 1;
  }
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), v8, *(_DWORD *)(a1 + 48));
}

@end
