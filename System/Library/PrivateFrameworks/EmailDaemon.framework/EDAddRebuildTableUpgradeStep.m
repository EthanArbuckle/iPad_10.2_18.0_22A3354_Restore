@implementation EDAddRebuildTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  return objc_msgSend(a3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS searchable_rebuild (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, message_id INTEGER NOT NULL)"), CFSTR("Unable to create searchable_rebuild table")) ^ 1;
}

@end
