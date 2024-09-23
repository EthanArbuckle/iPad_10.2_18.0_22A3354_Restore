@implementation EDAddGeneratedSummaryUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("generated_summary"), CFSTR("message_global_data"), 0) & 1) != 0)
    v4 = 0;
  else
    v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE message_global_data ADD COLUMN generated_summary INTEGER;",
           0,
           0,
           0);
  if ((objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("urgent"), CFSTR("message_global_data"), 0) & 1) == 0)
    v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE message_global_data ADD COLUMN urgent INTEGER;",
           0,
           0,
           0);

  return v4;
}

@end
