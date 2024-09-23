@implementation CalMigrationToolCalendarMigrationDefaultsProvider

- (CalMigrationToolCalendarMigrationDefaultsProvider)initWithToolOptions:(id)a3 defaultProvider:(id)a4
{
  id v7;
  id v8;
  CalMigrationToolCalendarMigrationDefaultsProvider *v9;
  CalMigrationToolCalendarMigrationDefaultsProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalMigrationToolCalendarMigrationDefaultsProvider;
  v9 = -[CalMigrationToolCalendarMigrationDefaultsProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_toolOptions, a3);
    objc_storeStrong((id *)&v10->_defaultProvider, a4);
  }

  return v10;
}

- (BOOL)shouldPerformMigrationWithDestinationDirectory:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[CalMigrationToolCalendarMigrationDefaultsProvider toolOptions](self, "toolOptions", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "performCalendarMigration");

  if (v5 == 1)
    return 1;
  if (v5 != -1)
    return 0;
  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalMigrationToolCalendarMigrationDefaultsProvider toolOptions](self, "toolOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "destinationDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "shouldPerformMigrationWithDestinationDirectory:", v8);

  return v9;
}

- (BOOL)shouldBackupBeforeMigration
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  -[CalMigrationToolCalendarMigrationDefaultsProvider toolOptions](self, "toolOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "backupBeforeCalendarMigration");

  if (v4 == 1)
    return 1;
  if (v4 != -1)
    return 0;
  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldBackupBeforeMigration");

  return v6;
}

- (BOOL)shouldDeleteMigratedData
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  -[CalMigrationToolCalendarMigrationDefaultsProvider toolOptions](self, "toolOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deleteMigratedData");

  if (v4 == 1)
    return 1;
  if (v4 != -1)
    return 0;
  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDeleteMigratedData");

  return v6;
}

- (BOOL)needsMigrationCleanupWithDestinationDirectory:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "needsMigrationCleanupWithDestinationDirectory:", v4);

  return v6;
}

- (BOOL)isHolidayCalendarEnabled
{
  void *v2;
  char v3;

  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHolidayCalendarEnabled");

  return v3;
}

- (void)migrateLegacyDefaults
{
  id v2;

  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "migrateLegacyDefaults");

}

- (void)clearLegacyDefaults
{
  id v2;

  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearLegacyDefaults");

}

- (void)recordMigrationDidBeginWithDestinationDirectory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordMigrationDidBeginWithDestinationDirectory:", v4);

}

- (void)recordMigrationDidEndWithReason:(unint64_t)a3
{
  id v4;

  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordMigrationDidEndWithReason:", a3);

}

- (void)setDefaultTimedAlarmOffset:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultTimedAlarmOffset:", v4);

}

- (void)setDefaultAllDayAlarmOffset:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultAllDayAlarmOffset:", v4);

}

- (NSString)defaultCalendarUUID
{
  void *v2;
  void *v3;

  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultCalendarUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDefaultCalendarExternalIDOrUUID:(id)a3 storeID:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CalMigrationToolCalendarMigrationDefaultsProvider defaultProvider](self, "defaultProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultCalendarExternalIDOrUUID:storeID:", v6, v4);

}

- (CalMigrationToolOptions)toolOptions
{
  return self->_toolOptions;
}

- (CalCalendarMigrationDefaultsProvider)defaultProvider
{
  return self->_defaultProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultProvider, 0);
  objc_storeStrong((id *)&self->_toolOptions, 0);
}

@end
