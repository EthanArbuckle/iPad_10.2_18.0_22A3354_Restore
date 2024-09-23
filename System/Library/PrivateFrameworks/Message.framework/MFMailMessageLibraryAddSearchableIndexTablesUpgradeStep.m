@implementation MFMailMessageLibraryAddSearchableIndexTablesUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS searchable_messages (message_id INTEGER PRIMARY KEY, message INTEGER REFERENCES messages(ROWID) ON DELETE SET NULL, transaction_id INTEGER NOT NULL, message_body_indexed INTEGER NOT NULL, reindex_type INTEGER NOT NULL);"),
          CFSTR("Creating searchable_messages table")) & 1) != 0
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS searchable_messages_message_reindex_type_transaction_id_index ON searchable_messages(message, reindex_type, transaction_id);"),
                       CFSTR("Creating searchable_messages_message_reindex_type_transaction_id_index"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS searchable_messages_message_id_reindex_type_index ON searchable_messages(message_id, reindex_type);"),
                       CFSTR("Creating searchable_messages_message_id_reindex_type_index"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS searchable_message_tombstones (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, type INTEGER NOT NULL, identifier TEXT NOT NULL, transaction_id INTEGER, UNIQUE(type, identifier));"),
                       CFSTR("Creating searchable_message_tombstones table"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS searchable_message_tombstones_transaction_id_type_identifier_index ON searchable_message_tombstones(transaction_id, type, identifier);"),
                       CFSTR("Creating searchable_message_tombstones_transaction_id_type_identifier_index"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS attachments (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, message INTEGER NOT NULL REFERENCES messages(ROWID) ON DELETE CASCADE, attachment_id TEXT, name TEXT, UNIQUE(message, attachment_id));"),
                       CFSTR("Creating attachments table"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS searchable_attachments (attachment_id INTEGER PRIMARY KEY, attachment INTEGER REFERENCES attachments(ROWID) ON DELETE SET NULL, message_id INTEGER, transaction_id INTEGER NOT NULL);"),
                       CFSTR("Creating searchable_attachments table")))
  {
    objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS spotlight_tombstones;"),
      CFSTR("Dropping spotlight_tombstones table"));
    objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS spotlight_message_reindex;"),
      CFSTR("Dropping spotlight_message_reindex table"));
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

@end
