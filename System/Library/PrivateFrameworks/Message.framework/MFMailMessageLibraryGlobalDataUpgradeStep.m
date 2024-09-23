@implementation MFMailMessageLibraryGlobalDataUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  int v9;

  v4 = a3;
  if ((objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE message_global_data (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,\nmessage_id INTEGER,\nUNIQUE(message_id) ON CONFLICT ABORT)"), CFSTR("Creating message_global_data")) & 1) == 0)goto LABEL_11;
  if (!objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("INSERT INTO message_global_data (message_id) SELECT DISTINCT message_id FROM messages"), CFSTR("Populating message_global_data table")))goto LABEL_11;
  if (!objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DROP TRIGGER IF EXISTS after_delete_message;\n"),
                        CFSTR("Dropping trigger")))
    goto LABEL_11;
  if (!objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE messages RENAME TO messages_old"), CFSTR("Moving messages table aside")))goto LABEL_11;
  objc_msgSend(a1, "_messagesTableDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "executeStatementString:errorMessage:", v5, CFSTR("Adding new messages table"));

  if ((v6 & 1) == 0)
    goto LABEL_11;
  if (objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("INSERT INTO messages (ROWID, message_id, global_message_id, remote_id, document_id, sender, subject_prefix, subject, summary, date_sent, date_received, mailbox, remote_mailbox, flags, read, flagged, deleted, size, conversation_id, date_last_viewed, original_mailbox, visible, sender_vip, encoding, content_type, sequence_identifier, external_id, unique_id, content_index_transaction_id, list_id_hash, journaled, flag_color, searchable_message) SELECT messages_old.ROWID, messages_old.message_id, message_global_data.ROWID, remote_id, document_id, sender, subject_prefix, subject, summary, date_sent, date_received, mailbox, remote_mailbox, flags, read, flagged, deleted, size, conversation_id, date_last_viewed, original_mailbox, visible, sender_vip, encoding, content_type, sequence_identifier, external_id, unique_id, content_index_transaction_id, list_id_hash, journaled, flag_color, searchable_message FROM messages_old JOIN message_global_data ON messages_old.message_id = message_global_data.message_id"), CFSTR("Copying messages to new table"))&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DROP TABLE messages_old"), CFSTR("Dropping old messages table"))&& objc_msgSend(a1, "_recreateMessagesIndices:", v4)&& (objc_msgSend(a1, "_triggerDefinition"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v4, "executeStatementString:errorMessage:", v7, CFSTR("Adding trigger")), v7, (v8 & 1) != 0))
  {
    objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("INSERT INTO properties  (key, value) VALUES (\"NeedToMigrateFiles\",1)"), CFSTR("Setting need to upgrade property"));
    v9 = 0;
  }
  else
  {
LABEL_11:
    v9 = 1;
  }

  return v9;
}

+ (id)_messagesTableDefinition
{
  return CFSTR("CREATE TABLE messages (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,\nmessage_id INTEGER NOT NULL DEFAULT 0,\nglobal_message_id INTEGER NOT NULL REFERENCES message_global_data(ROWID) ON DELETE CASCADE,\nremote_id INTEGER,\ndocument_id TEXT COLLATE BINARY,\nsender INTEGER,\nsubject_prefix TEXT COLLATE BINARY,\nsubject INTEGER NOT NULL,\nsummary INTEGER,\ndate_sent INTEGER,\ndate_received INTEGER,\nmailbox INTEGER NOT NULL,\nremote_mailbox INTEGER,\nflags INTEGER NOT NULL DEFAULT 0,\nread INTEGER NOT NULL DEFAULT 0,\nflagged INTEGER NOT NULL DEFAULT 0,\ndeleted INTEGER NOT NULL DEFAULT 0,\nsize INTEGER NOT NULL DEFAULT 0,\nconversation_id INTEGER NOT NULL DEFAULT 0,\ndate_last_viewed INTEGER,\noriginal_mailbox INTEGER,\nvisible INTEGER,\nsender_vip INTEGER,\nencoding INTEGER,\ncontent_type INTEGER,\nsequence_identifier INTEGER DEFAULT 0,\nexternal_id TEXT COLLATE BINARY,\nunique_id INTEGER,\ncontent_index_transaction_id INTEGER,\nlist_id_hash INTEGER,\njournaled INTEGER,\nflag_color INTEGER,\nsearchable_message INTEGER REFERENCES searchable_messages(message_id) ON DELETE SET NULL);");
}

+ (BOOL)_recreateMessagesIndices:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(&unk_1E4F694C0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(&unk_1E4F694C0);
        if ((objc_msgSend(v3, "executeStatementString:errorMessage:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), CFSTR("Adding index")) & 1) == 0)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(&unk_1E4F694C0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

+ (id)_triggerDefinition
{
  return CFSTR("CREATE TRIGGER after_delete_message AFTER DELETE ON messages\n    BEGIN\n        DELETE FROM message_data WHERE message_id = OLD.ROWID;\n    END;\n");
}

@end
