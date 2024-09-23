@implementation CalDatabaseCopyAttachmentFileInStoreWithURL

uint64_t __CalDatabaseCopyAttachmentFileInStoreWithURL_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_bind_int64(*(sqlite3_stmt **)(a2 + 8), 1, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

void __CalDatabaseCopyAttachmentFileInStoreWithURL_block_invoke_2(uint64_t a1, const void *a2, _BYTE *a3)
{
  const os_unfair_lock *Context;
  void *v7;
  int v8;
  int StoreID;
  CFTypeRef v10;
  void *v11;

  if (a2)
  {
    if (CDBLockingAssertionsEnabled)
    {
      if (CPRecordGetStore())
      {
        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (Context)
          os_unfair_lock_assert_owner(Context + 20);
      }
    }
  }
  CPRecordGetProperty();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11 = v7;
    v8 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v7);
    v7 = v11;
    if (v8)
    {
      StoreID = _CalAttachmentFileGetStoreID((uint64_t)a2);
      v7 = v11;
      if (*(_QWORD *)(a1 + 48) == StoreID)
      {
        v10 = CFRetain(a2);
        v7 = v11;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
        *a3 = 1;
      }
    }
  }

}

@end
