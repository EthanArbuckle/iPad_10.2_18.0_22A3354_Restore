@implementation CalDatabaseRemoveNaturalLanguageSuggestionsCalendar

uint64_t __CalDatabaseRemoveNaturalLanguageSuggestionsCalendar_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  CFStringRef v2;
  CFStringRef v3;
  CFStringRef v4;
  CFStringRef v5;
  CFStringRef v6;
  CFStringRef v7;
  const os_unfair_lock *Context;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = CFStringCreateWithFormat(0, 0, CFSTR("DELETE FROM Notification WHERE calendar_id IN (SELECT ROWID FROM Calendar WHERE (flags & %d));"),
         0x80000);
  if (v2)
  {
    v3 = v2;
    CalPerformSQLWithConnection(v1, (uint64_t)v2);
    CFRelease(v3);
  }
  v4 = CFStringCreateWithFormat(0, 0, CFSTR("DELETE FROM NotificationChanges WHERE calendar_id IN (SELECT ROWID FROM Calendar WHERE (flags & %d));"),
         0x80000);
  if (v4)
  {
    v5 = v4;
    CalPerformSQLWithConnection(v1, (uint64_t)v4);
    CFRelease(v5);
  }
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("DELETE FROM Calendar WHERE ROWID IN (SELECT ROWID FROM Calendar WHERE (flags & %d));"),
         0x80000);
  if (v6)
  {
    v7 = v6;
    CalPerformSQLWithConnection(v1, (uint64_t)v6);
    CFRelease(v7);
  }
  if (v1)
  {
    if (CDBLockingAssertionsEnabled)
    {
      if (*v1)
      {
        if (*(_QWORD *)(*v1 + 104))
        {
          Context = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (Context)
            os_unfair_lock_assert_owner(Context + 20);
        }
      }
    }
  }
  return CPSqliteConnectionRemoveProperty();
}

@end
