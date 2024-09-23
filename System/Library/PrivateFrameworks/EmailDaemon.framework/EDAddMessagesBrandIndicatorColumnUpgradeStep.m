@implementation EDAddMessagesBrandIndicatorColumnUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("brand_indicator"), CFSTR("messages"), 0) & 1) != 0)
    v4 = 0;
  else
    v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE messages ADD COLUMN brand_indicator INTEGER;CREATE INDEX IF NOT EXISTS messages_brand_indicator_i"
           "ndex ON messages(brand_indicator);",
           0,
           0,
           0);

  return v4;
}

@end
