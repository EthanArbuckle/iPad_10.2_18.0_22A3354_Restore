@implementation EDAddDownloadStateToMessageGlobalDataUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (sqlite3_table_column_metadata((sqlite3 *)objc_msgSend(v3, "sqlDB"), 0, "message_global_data", "download_state", 0, 0, 0, 0, 0))
  {
    v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE message_global_data ADD COLUMN download_state INTEGER NOT NULL DEFAULT 0;",
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
