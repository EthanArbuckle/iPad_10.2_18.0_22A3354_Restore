@implementation MFMailMessageLibraryAddJournaledConversationIDDateReceivedUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS messages_journaled_conversation_id_date_received_index ON messages(journaled, conversation_id, date_received);"),
          CFSTR("Creating messages_journaled_conversation_id_date_received_index")) & 1) != 0
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DROP INDEX IF EXISTS messages_journaled_conversation_id_index;"),
                       CFSTR("Dropping messages_journaled_conversation_id_index"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DROP TABLE attachments"), CFSTR("Dropping attachments"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE attachments (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, message INTEGER NOT NULL REFERENCES messages(ROWID) ON DELETE CASCADE, attachment_id TEXT COLLATE BINARY, name TEXT COLLATE BINARY, UNIQUE(message, attachment_id) ON CONFLICT ABORT);"),
                       CFSTR("Creating attachments"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS attachments_message_attachment_id_index ON attachments(message, attachment_id);"),
                       CFSTR("Creating attachments_message_attachment_id_index"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS attachments_message_name_index ON attachments(message, name);"),
                       CFSTR("Creating attachments_message_name_index"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS searchable_attachments_attachment_index ON searchable_attachments(attachment);"),
                       CFSTR("Creating searchable_attachments_attachment_index"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS searchable_attachments_message_id_index ON searchable_attachments(message_id);"),
                       CFSTR("Creating searchable_attachments_message_id_index"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE searchable_message_tombstones RENAME TO searchable_message_tombstones_old;"),
                       CFSTR("Renaming searchable_message_tombstones"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE searchable_message_tombstones (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, type INTEGER NOT NULL, identifier TEXT COLLATE BINARY NOT NULL, transaction_id INTEGER, UNIQUE(type, identifier) ON CONFLICT ABORT);"),
                       CFSTR("Creating searchable_message_tombstones_new"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("INSERT INTO searchable_message_tombstones SELECT * FROM searchable_message_tombstones_old;"),
                       CFSTR("Copying searchable_message_tombstones to new table"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DROP TABLE searchable_message_tombstones_old;"),
                       CFSTR("Dropping searchable_message_tombstones_old")))
  {
    v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS searchable_message_tombstones_transaction_id_type_identifier_index ON searchable_message_tombstones(transaction_id, type, identifier);"),
           CFSTR("Creating searchable_message_tombstones_transaction_id_type_identifier_index")) ^ 1;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

@end
