@implementation EDAddSendLaterTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  return objc_msgSend(a3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS send_later (global_message_id INTEGER PRIMARY KEY REFERENCES message_global_data(ROWID) ON DELETE CASCADE ON UPDATE CASCADE, date INTEGER NOT NULL);"),
           CFSTR("Unable to create send_later table")) ^ 1;
}

@end
