@implementation CalCalendarDatabaseReminderMigrationContext

+ (id)reminderMigrationContextWithReminderKitProvider:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_initWithReminderKitProvider:", v4);

  if (v5)
  {
    v6 = objc_opt_new();
    v7 = (void *)v5[14];
    v5[14] = v6;

    v8 = objc_opt_new();
    v9 = (void *)v5[15];
    v5[15] = v8;

    v10 = objc_opt_new();
    v11 = (void *)v5[16];
    v5[16] = v10;

    v12 = objc_opt_new();
    v13 = (void *)v5[17];
    v5[17] = v12;

    v14 = objc_opt_new();
    v15 = (void *)v5[19];
    v5[19] = v14;

    v16 = objc_opt_new();
    v17 = (void *)v5[18];
    v5[18] = v16;

    if ((objc_msgSend(v5, "_tryBeginMigration") & 1) == 0)
    {

      v5 = 0;
    }
  }
  return v5;
}

- (NSArray)storesToDisableReminders
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_storesToDisableReminders, "copy");
}

- (void)addStoreToDisableReminders:(void *)a3
{
  -[NSMutableArray addObject:](self->_storesToDisableReminders, "addObject:", a3);
}

- (NSArray)storesToDelete
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_storesToDelete, "copy");
}

- (void)addStoreToDelete:(void *)a3
{
  -[NSMutableArray addObject:](self->_storesToDelete, "addObject:");
  -[CalCalendarDatabaseReminderMigrationContext _removeCalendarsToDeleteInStore:](self, "_removeCalendarsToDeleteInStore:", a3);
  -[NSMutableArray removeObject:](self->_storesToSetWasMigrated, "removeObject:", a3);
}

- (NSArray)storesToSetWasMigrated
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_storesToSetWasMigrated, "copy");
}

- (void)addStoreToSetWasMigrated:(void *)a3
{
  if ((-[NSMutableArray containsObject:](self->_storesToDelete, "containsObject:") & 1) == 0)
    -[NSMutableArray addObject:](self->_storesToSetWasMigrated, "addObject:", a3);
}

- (NSArray)calendarsToDisableReminders
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_calendarsToDisableReminders, "copy");
}

- (void)addCalendarToDisableReminders:(void *)a3
{
  -[NSMutableArray addObject:](self->_calendarsToDisableReminders, "addObject:", a3);
}

- (NSArray)calendarsToClearSyncToken
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_calendarsToClearSyncToken, "copy");
}

- (void)addCalendarToClearSyncToken:(void *)a3
{
  -[NSMutableArray addObject:](self->_calendarsToClearSyncToken, "addObject:", a3);
}

- (NSArray)calendarsToDelete
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_calendarsToDelete, "copy");
}

- (void)addCalendarToDelete:(void *)a3
{
  if (!-[CalCalendarDatabaseReminderMigrationContext _isCalendarOwnedByExistingStoreToDelete:](self, "_isCalendarOwnedByExistingStoreToDelete:"))-[NSMutableArray addObject:](self->_calendarsToDelete, "addObject:", a3);
}

- (void)_removeCalendarsToDeleteInStore:(void *)a3
{
  void *v5;
  NSMutableArray *calendarsToDelete;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  _QWORD v10[4];
  NSMutableArray *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_calendarsToDelete, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  calendarsToDelete = self->_calendarsToDelete;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__CalCalendarDatabaseReminderMigrationContext__removeCalendarsToDeleteInStore___block_invoke;
  v10[3] = &unk_24D3F4B30;
  v12 = a3;
  v7 = v5;
  v11 = v7;
  -[NSMutableArray enumerateCalCalendarRefsUsingBlock:](calendarsToDelete, "enumerateCalCalendarRefsUsingBlock:", v10);
  v8 = self->_calendarsToDelete;
  self->_calendarsToDelete = v7;
  v9 = v7;

}

void __79__CalCalendarDatabaseReminderMigrationContext__removeCalendarsToDeleteInStore___block_invoke(uint64_t a1, void *a2)
{
  const void *v3;
  id v4;

  v4 = a2;
  v3 = (const void *)CalCalendarCopyStore();
  if (v3 != *(const void **)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  if (v3)
    CFRelease(v3);

}

- (BOOL)_isCalendarOwnedByExistingStoreToDelete:(void *)a3
{
  uint64_t v4;
  const void *v5;
  char v6;

  v4 = CalCalendarCopyStore();
  if (!v4)
    return 0;
  v5 = (const void *)v4;
  v6 = -[NSMutableArray containsObject:](self->_storesToDelete, "containsObject:", v4);
  CFRelease(v5);
  return v6;
}

- (id)privacySafePathForURLInCalendarDirectory:(id)a3
{
  return (id)objc_msgSend(a3, "path");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarsToDelete, 0);
  objc_storeStrong((id *)&self->_calendarsToClearSyncToken, 0);
  objc_storeStrong((id *)&self->_calendarsToDisableReminders, 0);
  objc_storeStrong((id *)&self->_storesToSetWasMigrated, 0);
  objc_storeStrong((id *)&self->_storesToDelete, 0);
  objc_storeStrong((id *)&self->_storesToDisableReminders, 0);
}

@end
