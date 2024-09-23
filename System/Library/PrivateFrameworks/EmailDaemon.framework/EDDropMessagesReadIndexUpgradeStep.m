@implementation EDDropMessagesReadIndexUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "DROP INDEX IF EXISTS messages_read_index;", 0, 0, 0);

  return v4;
}

@end
