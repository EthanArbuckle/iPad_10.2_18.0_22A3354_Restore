@implementation CalDatabaseCopyAttachmentFileWithExternalIDInStore

uint64_t __CalDatabaseCopyAttachmentFileWithExternalIDInStore_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v4;
  BOOL v5;
  const os_unfair_lock *Context;
  sqlite3_int64 RowidForRecordID;

  v4 = *(sqlite3_stmt **)(a2 + 8);
  if (CDBLockingAssertionsEnabled)
    v5 = *(_QWORD *)(a1 + 32) == 0;
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
  return sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
}

@end
