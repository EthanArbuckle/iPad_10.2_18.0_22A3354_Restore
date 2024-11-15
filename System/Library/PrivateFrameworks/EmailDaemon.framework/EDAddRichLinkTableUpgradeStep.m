@implementation EDAddRichLinkTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;
  int v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS rich_links (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT COLLATE BINARY, url TEXT COLLATE BINARY NOT NULL, hash TEXT COLLATE BINARY NOT NULL, UNIQUE(hash) ON CONFLICT ABORT);"),
         CFSTR("Creating rich_links table"));
  if (v4)
  {
    v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS message_rich_links (global_message_id INTEGER NOT NULL REFERENCES message_global_data(ROWID) ON DELETE CASCADE, rich_link INTEGER NOT NULL REFERENCES rich_links(ROWID) ON DELETE CASCADE, PRIMARY KEY(global_message_id, rich_link)) WITHOUT ROWID;"),
           CFSTR("Creating message_rich_links table"));
    if (v4)
    {
      v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS searchable_rich_links (rich_link_id INTEGER PRIMARY KEY, rich_link INTEGER REFERENCES rich_links(ROWID) ON DELETE SET NULL, message_id INTEGER, transaction_id INTEGER NOT NULL);"),
             CFSTR("Creating searchable_rich_links table"));
      if (v4)
        v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS searchable_rich_links_message_id_index ON searchable_rich_links(message_id); CREATE INDEX IF NOT EXISTS searchable_rich_links_rich_link_index ON searchable_rich_links(rich_link);"),
               CFSTR("Creating searchable_data_detection_results_message_index"));
    }
  }
  v5 = v4 ^ 1;

  return v5;
}

@end
