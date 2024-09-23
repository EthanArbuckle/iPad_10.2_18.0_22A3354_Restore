@implementation EDAddReadLaterTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;
  int v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE threads ADD COLUMN read_later_date INTEGER;"),
         CFSTR("Unable to add read_later_date column to threads"));
  if (v4)
    v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS read_later (global_message_id INTEGER PRIMARY KEY, date INTEGER NOT NULL);"),
           CFSTR("Unable to create read_later table"));
  v5 = v4 ^ 1;

  return v5;
}

@end
