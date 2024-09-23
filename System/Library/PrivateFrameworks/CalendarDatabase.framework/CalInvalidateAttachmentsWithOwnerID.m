@implementation CalInvalidateAttachmentsWithOwnerID

BOOL ___CalInvalidateAttachmentsWithOwnerID_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  const os_unfair_lock *Context;
  int Property;
  void *v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 32);
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
  Property = CPRecordGetProperty();
  if (v2 == Property)
  {
    v5 = (void *)CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v6 = v5;
      v8[0] = 67109120;
      v8[1] = CPRecordGetID();
      _os_log_impl(&dword_1A5CCB000, v6, OS_LOG_TYPE_DEBUG, "INV: Invalidating attachment %d", (uint8_t *)v8, 8u);

    }
  }
  return v2 == Property;
}

@end
