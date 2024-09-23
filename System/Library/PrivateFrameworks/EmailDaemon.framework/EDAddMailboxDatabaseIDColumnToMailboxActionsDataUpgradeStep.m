@implementation EDAddMailboxDatabaseIDColumnToMailboxActionsDataUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (sqlite3_table_column_metadata((sqlite3 *)objc_msgSend(v3, "sqlDB"), 0, "mailbox_actions", "mailbox", 0, 0, 0, 0, 0))
  {
    v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE mailbox_actions ADD COLUMN mailbox INTEGER;",
           0,
           0,
           0);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
