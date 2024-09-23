@implementation EDAddMessagesSearchableMessageColumnUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;
  int v5;

  v3 = a3;
  if ((objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("searchable_message"), CFSTR("messages"), 0) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE messages ADD COLUMN searchable_message INTEGER REFERENCES searchable_messages(message_id) ON DELETE SET NULL;"),
           CFSTR("Unable to add searchable_message column to messages"));
    if (v5)
    {
      v5 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("UPDATE OR IGNORE messages SET searchable_message = (SELECT searchable_messages.ROWID FROM searchable_messages WHERE searchable_messages.ROWID = messages.ROWID);"),
             CFSTR("Unable to populate searchable_message"));
      if (v5)
      {
        v5 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS messages_searchable_message_deleted_index ON messages(searchable_message, deleted);"),
               CFSTR("Unable to add messages_searchable_message_deleted_index"));
        if (v5)
          v5 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS searchable_messages_transaction_id_message_id_index ON searchable_messages(transaction_id, message_id);"),
                 CFSTR("Unable to add searchable_messages_transaction_id_message_id_index"));
      }
    }
    v4 = v5 ^ 1;
  }

  return v4;
}

@end
