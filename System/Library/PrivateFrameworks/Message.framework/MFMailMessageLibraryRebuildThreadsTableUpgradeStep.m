@implementation MFMailMessageLibraryRebuildThreadsTableUpgradeStep

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
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void (**v30)(void *, const __CFString *, id);
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD aBlock[4];
  id v56;
  _QWORD v57[4];
  const __CFString *v58;
  const __CFString *v59;
  _QWORD v60[4];
  _QWORD v61[3];
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v50 = a4;
  v51 = a5;
  v7 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("scope"), 0);
  v63 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v63;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("conversation"), 0);
  v64 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v64;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("newest_read_message"), 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v47;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("display_message"), 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v46;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date"), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v45;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("read"), 0, &unk_1E4F69FE8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v44;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flagged"), 0, &unk_1E4F69FE8);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v43;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_red_flag"), 0, &unk_1E4F69FE8);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v42;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_orange_flag"), 0, &unk_1E4F69FE8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v41;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_yellow_flag"), 0, &unk_1E4F69FE8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v40;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_green_flag"), 0, &unk_1E4F69FE8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v39;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_blue_flag"), 0, &unk_1E4F69FE8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v38;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_purple_flag"), 0, &unk_1E4F69FE8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v37;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_gray_flag"), 0, &unk_1E4F69FE8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v36;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("draft"), 0, &unk_1E4F69FE8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v35;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("replied"), 0, &unk_1E4F69FE8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v34;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("forwarded"), 0, &unk_1E4F69FE8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v33;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("redirected"), 0, &unk_1E4F69FE8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("junk_level_set_by_user"), 0, &unk_1E4F69FE8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("junk_level"), 0, &unk_1E4F69FE8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v10;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_unflagged"), 0, &unk_1E4F69FE8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v11;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_attachments"), 0, &unk_1E4F69FE8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v12;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("count"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v13;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("journaled"), 0, &unk_1E4F69FE8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v7, "initWithName:rowIDType:columns:", CFSTR("threads"), 2, v15);

  v62[0] = CFSTR("scope");
  v62[1] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addUniquenessConstraintForColumns:conflictResolution:", v17, 1);

  v61[0] = CFSTR("scope");
  v61[1] = CFSTR("date");
  v61[2] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addIndexForColumns:", v18);

  v60[0] = CFSTR("journaled");
  v60[1] = CFSTR("scope");
  v60[2] = CFSTR("date");
  v60[3] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addIndexForColumns:", v19);

  v59 = CFSTR("display_message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addIndexForColumns:", v20);

  v58 = CFSTR("newest_read_message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addIndexForColumns:", v21);

  v22 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  v57[0] = CFSTR("journaled");
  v57[1] = CFSTR("date");
  v57[2] = CFSTR("scope");
  v57[3] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("journaled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "equalTo:", &unk_1E4F6A000);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v22, "initWithTableName:columnNames:where:unique:", CFSTR("threads"), v23, v25, 0);

  objc_msgSend(v16, "addIndex:", v26);
  v27 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__MFMailMessageLibraryRebuildThreadsTableUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke;
  aBlock[3] = &unk_1E4E8D4B8;
  v28 = v16;
  v56 = v28;
  v53[0] = v27;
  v53[1] = 3221225472;
  v53[2] = __128__MFMailMessageLibraryRebuildThreadsTableUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke_2;
  v53[3] = &unk_1E4E8D4E0;
  v29 = _Block_copy(aBlock);
  v54 = v29;
  v30 = (void (**)(void *, const __CFString *, id))_Block_copy(v53);
  v30[2](v30, CFSTR("scope"), v51);
  v30[2](v30, CFSTR("conversation"), v50);
  (*((void (**)(void *, const __CFString *, id, uint64_t))v29 + 2))(v29, CFSTR("newest_read_message"), v52, 3);
  (*((void (**)(void *, const __CFString *, id, uint64_t))v29 + 2))(v29, CFSTR("display_message"), v52, 3);
  v31 = v28;

  return v31;
}

void __128__MFMailMessageLibraryRebuildThreadsTableUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "columnForName:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAsForeignKeyForTable:onDelete:onUpdate:", v8, a4, 0);

}

uint64_t __128__MFMailMessageLibraryRebuildThreadsTableUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (int)runWithConnection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  v4 = a3;
  if ((objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DROP TABLE threads"), CFSTR("Dropping threads")) & 1) != 0
    && objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DELETE FROM thread_scopes"), CFSTR("Clearing thread_scopes"))&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DELETE FROM thread_mailboxes"), CFSTR("Clearing thread_mailboxes"))&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DELETE FROM thread_senders"), CFSTR("Clearing thread_senders"))&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DELETE FROM thread_recipients"), CFSTR("Clearing thread_recipients")))
  {
    v5 = objc_alloc(MEMORY[0x1E0D1F050]);
    v6 = (void *)objc_msgSend(v5, "initWithName:rowIDType:columns:", CFSTR("messages"), 2, MEMORY[0x1E0C9AA60]);
    v7 = objc_alloc(MEMORY[0x1E0D1F050]);
    v8 = (void *)objc_msgSend(v7, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("conversations"), 2, CFSTR("conversation_id"), MEMORY[0x1E0C9AA60]);
    v9 = objc_alloc(MEMORY[0x1E0D1F050]);
    v10 = (void *)objc_msgSend(v9, "initWithName:rowIDType:columns:", CFSTR("thread_scopes"), 2, MEMORY[0x1E0C9AA60]);
    objc_msgSend(a1, "_threadsTableSchemaWithMessagesTable:conversationsTable:threadScopesTable:", v6, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "definitionWithDatabaseName:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "executeStatementString:errorMessage:", v12, CFSTR("Creating new threads")) ^ 1;

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

@end
