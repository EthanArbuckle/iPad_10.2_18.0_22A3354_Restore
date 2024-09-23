@implementation EDAddDisplayDateColumnUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE messages ADD COLUMN display_date INTEGER;CREATE INDEX IF NOT EXISTS messages_mailbox_display_date_i"
         "ndex ON messages(mailbox, display_date);UPDATE messages SET display_date = date_received;",
         0,
         0,
         0);

  return v4;
}

@end
