@implementation MFMailMessageLibraryThreadFlagColorsUpgradeStep

+ (id)_threadsTableSchemaWithMessagesTable:(id)a3 conversationsTable:(id)a4 threadScopesTable:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void (**v23)(void *, const __CFString *, id);
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD aBlock[4];
  id v47;
  _QWORD v48[3];
  _QWORD v49[2];
  _QWORD v50[25];

  v50[23] = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v41 = a4;
  v42 = a5;
  v7 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("scope"), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v40;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("conversation"), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v39;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("newest_read_message"), 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v38;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("display_message"), 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v37;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date"), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v36;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("read"), 0, &unk_1E4F6A030);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v35;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flagged"), 0, &unk_1E4F6A030);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v34;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_red_flag"), 0, &unk_1E4F6A030);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v33;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_orange_flag"), 0, &unk_1E4F6A030);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v32;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_yellow_flag"), 0, &unk_1E4F6A030);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v31;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_green_flag"), 0, &unk_1E4F6A030);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50[10] = v30;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_blue_flag"), 0, &unk_1E4F6A030);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50[11] = v29;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_purple_flag"), 0, &unk_1E4F6A030);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[12] = v28;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_gray_flag"), 0, &unk_1E4F6A030);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50[13] = v27;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("draft"), 0, &unk_1E4F6A030);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[14] = v26;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("replied"), 0, &unk_1E4F6A030);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[15] = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("forwarded"), 0, &unk_1E4F6A030);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50[16] = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("redirected"), 0, &unk_1E4F6A030);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[17] = v10;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("junk_level_set_by_user"), 0, &unk_1E4F6A030);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[18] = v11;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("junk_level"), 0, &unk_1E4F6A030);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[19] = v12;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_unflagged"), 0, &unk_1E4F6A030);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50[20] = v13;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_attachments"), 0, &unk_1E4F6A030);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50[21] = v14;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("count"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[22] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v7, "initWithName:rowIDType:columns:", CFSTR("threads"), 2, v16);

  v49[0] = CFSTR("scope");
  v49[1] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addUniquenessConstraintForColumns:conflictResolution:", v18, 1);

  v48[0] = CFSTR("scope");
  v48[1] = CFSTR("date");
  v48[2] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addIndexForColumns:", v19);

  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __125__MFMailMessageLibraryThreadFlagColorsUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke;
  aBlock[3] = &unk_1E4E8D4B8;
  v21 = v17;
  v47 = v21;
  v44[0] = v20;
  v44[1] = 3221225472;
  v44[2] = __125__MFMailMessageLibraryThreadFlagColorsUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke_2;
  v44[3] = &unk_1E4E8D4E0;
  v22 = _Block_copy(aBlock);
  v45 = v22;
  v23 = (void (**)(void *, const __CFString *, id))_Block_copy(v44);
  v23[2](v23, CFSTR("scope"), v42);
  v23[2](v23, CFSTR("conversation"), v41);
  (*((void (**)(void *, const __CFString *, id, uint64_t))v22 + 2))(v22, CFSTR("newest_read_message"), v43, 3);
  (*((void (**)(void *, const __CFString *, id, uint64_t))v22 + 2))(v22, CFSTR("display_message"), v43, 3);
  v24 = v21;

  return v24;
}

void __125__MFMailMessageLibraryThreadFlagColorsUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "columnForName:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAsForeignKeyForTable:onDelete:onUpdate:", v8, a4, 0);

}

uint64_t __125__MFMailMessageLibraryThreadFlagColorsUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (int)runWithConnection:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  if ((objc_msgSend(v4, "columnExists:inTable:type:", CFSTR("flag_color"), CFSTR("messages"), 0) & 1) == 0
    && ((objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE messages ADD COLUMN flag_color INTEGER"), CFSTR("Adding messages.flag_color")) & 1) == 0|| !objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS messages_mailbox_conversation_id_flag_color_date_received_index ON messages(mailbox, conversation_id, flag_color, date_received)"), CFSTR("Creating messages_mailbox_conversation_id_flag_color_date_received_index"))|| !objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("UPDATE messages SET flag_color = ((flags & (7 << 41)) >> 41) WHERE (flags & 16) != 0"), CFSTR("Setting flag_color"))))
  {
    goto LABEL_17;
  }
  if ((objc_msgSend(v4, "columnExists:inTable:type:", CFSTR("has_red_flag"), CFSTR("threads"), 0) & 1) == 0)
  {
    if ((objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DROP TABLE threads"), CFSTR("Dropping threads")) & 1) != 0&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DROP TABLE thread_flag_colors"), CFSTR("Dropping thread_flag_colors"))&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DELETE FROM thread_mailboxes"), CFSTR("Clearing thread_mailboxes"))&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DELETE FROM thread_senders"), CFSTR("Clearing thread_senders"))
      && objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DELETE FROM thread_recipients"), CFSTR("Clearing thread_recipients")))
    {
      v6 = objc_alloc(MEMORY[0x1E0D1F050]);
      v7 = (void *)objc_msgSend(v6, "initWithName:rowIDType:columns:", CFSTR("messages"), 2, MEMORY[0x1E0C9AA60]);
      v8 = objc_alloc(MEMORY[0x1E0D1F050]);
      v9 = (void *)objc_msgSend(v8, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("conversations"), 2, CFSTR("conversation_id"), MEMORY[0x1E0C9AA60]);
      v10 = objc_alloc(MEMORY[0x1E0D1F050]);
      v11 = (void *)objc_msgSend(v10, "initWithName:rowIDType:columns:", CFSTR("thread_scopes"), 2, MEMORY[0x1E0C9AA60]);
      objc_msgSend(a1, "_threadsTableSchemaWithMessagesTable:conversationsTable:threadScopesTable:", v7, v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "definitionWithDatabaseName:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "executeStatementString:errorMessage:", v13, CFSTR("Creating new threads")) & 1) != 0)
      {
        v14 = objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("UPDATE thread_scopes SET needs_update = 1"), CFSTR("Resetting thread_scopes"));

        if ((v14 & 1) != 0)
          goto LABEL_3;
      }
      else
      {

      }
    }
LABEL_17:
    v5 = 1;
    goto LABEL_18;
  }
LABEL_3:
  v5 = 0;
LABEL_18:

  return v5;
}

@end
