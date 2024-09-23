@implementation MFMailMessageLibraryAdoptSharedSchemaMigrationStep

+ (void)cleanUpAfterMigrationWithConnection:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "databaseIsAttached:", CFSTR("ssms_mem")))
    objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DETACH DATABASE ssms_mem"), CFSTR("Detaching ssms_mem database"));

}

- (MFMailMessageLibraryAdoptSharedSchemaMigrationStep)initWithSQLiteConnection:(id)a3 protectedDatabaseName:(id)a4
{
  id v7;
  id v8;
  MFMailMessageLibraryAdoptSharedSchemaMigrationStep *v9;
  MFMailMessageLibraryAdoptSharedSchemaMigrationStep *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFMailMessageLibraryAdoptSharedSchemaMigrationStep;
  v9 = -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_protectedDatabaseName, a4);
  }

  return v10;
}

- (EFSQLSchema)schema
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[15];

  v24[13] = *MEMORY[0x1E0C80C00];
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _messagesTableSchema](self, "_messagesTableSchema");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _recipientsTableSchema](self, "_recipientsTableSchema");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _messageReferencesTableSchema](self, "_messageReferencesTableSchema");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _conversationsTableSchema](self, "_conversationsTableSchema");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _conversationIDMessageIDTableSchema](self, "_conversationIDMessageIDTableSchema");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _spotlightMessageReindexTableSchema](self, "_spotlightMessageReindexTableSchema");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "columnForName:", CFSTR("message"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAsForeignKeyForTable:onDelete:onUpdate:", v23, 2, 0);

  objc_msgSend(v20, "columnForName:", CFSTR("message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsForeignKeyForTable:onDelete:onUpdate:", v23, 2, 0);

  objc_msgSend(v21, "columnForName:", CFSTR("conversation_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAsForeignKeyForTable:onDelete:onUpdate:", v19, 2, 2);

  objc_msgSend(v18, "columnForName:", CFSTR("message_id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAsForeignKeyForTable:onDelete:onUpdate:", v23, 2, 0);

  v7 = objc_alloc(MEMORY[0x1E0D1F038]);
  v24[0] = v23;
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _mailboxesTableSchema](self, "_mailboxesTableSchema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  v24[2] = v22;
  v24[3] = v20;
  v24[4] = v19;
  v24[5] = v21;
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _propertiesTableSchema](self, "_propertiesTableSchema");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v9;
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _messageDataTableSchema](self, "_messageDataTableSchema");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v10;
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _messageDataDeletedTableSchema](self, "_messageDataDeletedTableSchema");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v11;
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _popUIDsTableSchema](self, "_popUIDsTableSchema");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v12;
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _accountsTableSchema](self, "_accountsTableSchema");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v13;
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _spotlightTombstonesTableSchema](self, "_spotlightTombstonesTableSchema");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v14;
  v24[12] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v7, "initWithTables:", v15);

  return (EFSQLSchema *)v16;
}

- (id)_messagesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[32];

  v61[30] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("message_id"), 0, &unk_1E4F69CE8);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v60;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("remote_id"), 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v59;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("document_id"), 1, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v58;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("sender"), 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v57;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("subject_prefix"), 1, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v56;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("subject"), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v61[5] = v55;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("summary"), 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v61[6] = v54;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date_sent"), 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v61[7] = v53;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date_received"), 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v61[8] = v52;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("mailbox"), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v61[9] = v51;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("remote_mailbox"), 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v61[10] = v50;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flags"), 0, &unk_1E4F69CE8);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v61[11] = v49;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("read"), 0, &unk_1E4F69CE8);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v61[12] = v48;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flagged"), 0, &unk_1E4F69CE8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61[13] = v47;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("deleted"), 0, &unk_1E4F69CE8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v61[14] = v46;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("size"), 0, &unk_1E4F69CE8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v61[15] = v45;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("conversation_id"), 0, &unk_1E4F69CE8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v61[16] = v44;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date_last_viewed"), 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v61[17] = v43;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("original_mailbox"), 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61[18] = v42;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("visible"), 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v61[19] = v41;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("sender_vip"), 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v61[20] = v40;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("encoding"), 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v61[21] = v39;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("content_type"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v61[22] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("sequence_identifier"), 1, &unk_1E4F69CE8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v61[23] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("external_id"), 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v61[24] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("unique_id"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v61[25] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("content_index_transaction_id"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v61[26] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("list_id_hash"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v61[27] = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("journaled"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v61[28] = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("flag_color"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61[29] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("messages"), 2, v11);

  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F69088);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F690A0);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F690B8);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F690D0);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F690E8);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F69100);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F69118);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F69130);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F69148);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F69160);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F69178);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F69190);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F691A8);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F691C0);
  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F691D8);
  __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke(objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F691F0), &unk_1E4F69208);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("date_received"), 2);
  objc_msgSend(v13, "addObject:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("ROWID"), 2);
  objc_msgSend(v13, "addObject:", v15);

  v16 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v12, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTableName:indexedColumns:", v17, v13);
  objc_msgSend(v12, "addIndex:", v18);

  __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke(v19, &unk_1E4F69220);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("date_received"), 2);
  objc_msgSend(v20, "addObject:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("ROWID"), 2);
  objc_msgSend(v20, "addObject:", v22);

  v23 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v12, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithTableName:indexedColumns:", v24, v20);
  objc_msgSend(v12, "addIndex:", v25);

  __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke(v26, &unk_1E4F69238);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("date_received"), 2);
  objc_msgSend(v27, "addObject:", v28);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:", CFSTR("ROWID"));
  objc_msgSend(v27, "addObject:", v29);

  v30 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v12, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithTableName:indexedColumns:", v31, v27);
  objc_msgSend(v12, "addIndex:", v32);

  __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke(objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F69250), &unk_1E4F69268);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("date_received"), 1);
  objc_msgSend(v33, "addObject:", v34);

  v35 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v12, "name");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v35, "initWithTableName:indexedColumns:", v36, v33);
  objc_msgSend(v12, "addIndex:", v37);

  objc_msgSend(v12, "addIndexForColumns:", &unk_1E4F69280);
  return v12;
}

id __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ef_map:", &__block_literal_global_79);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

id __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:", v2);

  return v3;
}

- (id)_mailboxesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[13];

  v18[12] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("url"), 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("total_count"), 0, &unk_1E4F69CE8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("unread_count"), 0, &unk_1E4F69CE8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v15;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("deleted_count"), 0, &unk_1E4F69CE8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("sequence_identifier"), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flagged_count"), 0, &unk_1E4F69CE8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("attachment_count"), 0, &unk_1E4F69CE8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("to_cc_count"), 0, &unk_1E4F69CE8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("server_unread_count"), 0, &unk_1E4F69CE8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("last_sync_status_count"), 0, &unk_1E4F69CE8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("most_recent_status_count"), 0, &unk_1E4F69CE8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("reconcile"), 0, &unk_1E4F69CE8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("mailboxes"), 2, v11);

  objc_msgSend(v12, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F69298, 1);
  return v12;
}

- (id)_recipientsTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("address"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("type"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("position"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("recipients"), 1, v7);

  objc_msgSend(v8, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F692B0, 1);
  objc_msgSend(v8, "addIndexForColumns:", &unk_1E4F692C8);
  objc_msgSend(v8, "addIndexForColumns:", &unk_1E4F692E0);
  return v8;
}

- (id)_messageReferencesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("reference"), 0, &unk_1E4F69CE8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("is_originator"), 0, &unk_1E4F69CE8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("message_references"), 1, v6);

  objc_msgSend(v7, "addIndexForColumns:", &unk_1E4F692F8);
  objc_msgSend(v7, "addIndexForColumns:", &unk_1E4F69310);
  return v7;
}

- (id)_conversationsTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flags"), 0, &unk_1E4F69CE8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("sync_key"), 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("conversations"), 2, CFSTR("conversation_id"), v5);

  return v6;
}

- (id)_conversationIDMessageIDTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("conversation_id"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("message_id"), 0, &unk_1E4F69CE8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("date_sent"), 0, &unk_1E4F69CE8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:", CFSTR("conversation_id_message_id"), v6, &unk_1E4F69328);

  objc_msgSend(v7, "addIndexForColumns:", &unk_1E4F69340);
  return v7;
}

- (id)_propertiesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("key"), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "blobColumnWithName:nullable:", CFSTR("value"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("properties"), 1, v5);

  objc_msgSend(v6, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F69358, 1);
  return v6;
}

- (id)_messageDataTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message_id"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("part"), 1, 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("partial"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("complete"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("length"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("message_data"), 2, v8);

  objc_msgSend(v9, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F69370, 1);
  return v9;
}

- (id)_messageDataDeletedTableSchema
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  return (id)objc_msgSend(v2, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("message_data_deleted"), 1, CFSTR("message_data_id"), MEMORY[0x1E0C9AA60]);
}

- (id)_popUIDsTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("mailbox"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("uid"), 1, 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date_added"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("flags"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("del"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("pop_uids"), 1, v8);

  objc_msgSend(v9, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F69388, 1);
  objc_msgSend(v9, "addIndexForColumns:", &unk_1E4F693A0);
  return v9;
}

- (id)_accountsTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("text_id"), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("accounts"), 2, v4);

  objc_msgSend(v5, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F693B8, 1);
  return v5;
}

- (id)_spotlightTombstonesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("type"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("identifier"), 1, 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("transaction_id"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("spotlight_tombstones"), 2, v6);

  objc_msgSend(v7, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F693D0, 1);
  objc_msgSend(v7, "addIndexForColumns:", &unk_1E4F693E8);
  return v7;
}

- (id)_spotlightMessageReindexTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message_id"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("type"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("spotlight_message_reindex"), 1, v5);

  objc_msgSend(v6, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F69400, 1);
  objc_msgSend(v6, "addIndexForColumns:", &unk_1E4F69418);
  return v6;
}

- (EFSQLSchema)protectedSchema
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D1F038]);
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _addressesTableSchema](self, "_addressesTableSchema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _subjectsTableSchema](self, "_subjectsTableSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _summariesTableSchema](self, "_summariesTableSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _protectedMessageDataTableSchema](self, "_protectedMessageDataTableSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithTables:", v8);

  return (EFSQLSchema *)v9;
}

- (id)_addressesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("address"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("comment"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("addresses"), 2, v5);

  objc_msgSend(v6, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F69430, 1);
  return v6;
}

- (id)_subjectsTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("subject"), 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("subjects"), 2, v4);

  objc_msgSend(v5, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F69448, 1);
  return v5;
}

- (id)_summariesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("summary"), 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("summaries"), 2, v4);

  objc_msgSend(v5, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F69460, 1);
  return v5;
}

- (id)_protectedMessageDataTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("data"), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("protected_message_data"), 1, v4);

  return v5;
}

- (BOOL)performMigrationStep
{
  void *v4;
  BOOL v5;
  void *v7;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "protectedDatabaseAttached") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailMessageLibraryAdoptSharedSchemaMigrationStep.m"), 412, CFSTR("Protected database must be attached"));

  }
  v5 = !+[MFDbJournal mergeAllJournalsUsingConnection:](MFDbJournal, "mergeAllJournalsUsingConnection:", v4)&& -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _initializeOldProtectedSchema](self, "_initializeOldProtectedSchema")&& -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _transformSchema](self, "_transformSchema")&& -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _transformProtectedSchema](self, "_transformProtectedSchema")&& -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _createTemporaryTables](self, "_createTemporaryTables")&& -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _migrateData](self, "_migrateData")&& -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _dropTemporaryTables](self, "_dropTemporaryTables")&& -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _createIndexes](self, "_createIndexes")&& -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _cleanupOldSchema](self, "_cleanupOldSchema");

  return v5;
}

- (BOOL)_initializeOldProtectedSchema
{
  void *v2;
  char v3;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS protected.messages (message_id INTEGER PRIMARY KEY, sender, subject, _to, cc, bcc)"), CFSTR("Creating protected messages")))v3 = objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS protected.message_data (message_data_id INTEGER PRIMARY KEY, data)"), CFSTR("Creating protected message_data"));
  else
    v3 = 0;

  return v3;
}

- (BOOL)_transformSchema
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE main.messages RENAME TO messages_old"), CFSTR("Moving messages table aside"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE mailboxes RENAME TO mailboxes_old"), CFSTR("Moving mailboxes table aside"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE conversations RENAME TO conversations_old"), CFSTR("Moving conversations table aside"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE conversation_id_message_id RENAME TO conversation_id_message_id_old"), CFSTR("Moving conversation_id_message_id table aside"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE properties RENAME TO properties_old"), CFSTR("Moving properties table aside"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE main.message_data RENAME TO message_data_old"), CFSTR("Moving message_data table aside"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE message_data_deleted RENAME TO message_data_deleted_old"), CFSTR("Moving message_data_deleted_old table aside"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE pop_uids RENAME TO pop_uids_old"), CFSTR("Moving pop_uids table aside"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE accounts RENAME TO accounts_old"), CFSTR("Moving accounts table aside"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE spotlight_tombstones RENAME TO spotlight_tombstones_old"), CFSTR("Moving spotlight_tombstones table aside"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE spotlight_message_reindex RENAME TO spotlight_message_reindex_old"), CFSTR("Moving spotlight_message_reindex table aside")))
  {
    -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep schema](self, "schema");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "definitionWithDatabaseName:includeIndexes:", 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "executeStatementString:errorMessage:", v5, CFSTR("Unable to create new tables"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_transformProtectedSchema
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep protectedSchema](self, "protectedSchema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep protectedDatabaseName](self, "protectedDatabaseName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "definitionWithDatabaseName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "executeStatementString:errorMessage:", v6, CFSTR("Unable to create new protected tables"));

  return v7;
}

- (BOOL)_createTemporaryTables
{
  void *v2;
  char v3;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("ATTACH DATABASE ':memory:' AS ssms_mem"), CFSTR("Unable to create in-memory database"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE ssms_mem.parsed_subjects(original PRIMARY KEY ON CONFLICT IGNORE, prefix TEXT COLLATE BINARY, unprefixed TEXT COLLATE RTRIM) WITHOUT ROWID"), CFSTR("Creating ssms_mem.parsed_subjects table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE ssms_mem.summary_id_by_message(message INTEGER PRIMARY KEY, summary_id INTEGER)"), CFSTR("Creating ssms_mem.summary_id_by_message table")))
  {
    v3 = objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE ssms_mem.parsed_addresses(fullAddress TEXT NOT NULL PRIMARY KEY ON CONFLICT IGNORE, address TEXT, comment TEXT) WITHOUT ROWID"), CFSTR("Creating ssms_mem.parsed_addresses table"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_dropTemporaryTables
{
  void *v2;
  char v3;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE ssms_mem.parsed_subjects"), CFSTR("Dropping ssms_mem.subject_prefixes table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE ssms_mem.parsed_addresses"), CFSTR("Dropping ssms_mem.parsed_addresses table")))
  {
    v3 = objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE ssms_mem.summary_id_by_message"), CFSTR("Dropping ssms_mem.summary_id_by_message table"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_migrateData
{
  return -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _migrateNonMessages](self, "_migrateNonMessages")
      && -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _migrateSubjects](self, "_migrateSubjects")
      && -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _migrateSummaries](self, "_migrateSummaries")
      && -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _migrateSendersAndRecipients](self, "_migrateSendersAndRecipients")&& -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep _migrateMessages](self, "_migrateMessages");
}

- (BOOL)_migrateNonMessages
{
  void *v2;
  char v3;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO message_references (message, reference, is_originator) SELECT message_id, ifnull(reference, 0), ifnull(is_originator, 0) FROM threads"), CFSTR("Populating message_references"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO mailboxes (ROWID, url, total_count, unread_count, deleted_count, sequence_identifier, flagged_count, to_cc_count, server_unread_count, last_sync_status_count, most_recent_status_count, reconcile) SELECT ROWID, url, ifnull(total_count, 0), ifnull(unread_count, 0), ifnull(deleted_count, 0), sequence_identifier, ifnull(flagged_count, 0), ifnull(to_cc_count, 0), ifnull(server_unread_count, 0), ifnull(last_sync_status_count, 0), ifnull(most_recent_status_count, 0), ifnull(reconcile, 0) FROM mailboxes_old"), CFSTR("Populating mailboxes"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO conversations (conversation_id, flags, sync_key) SELECT conversation_id, (ifnull(flags, 0) & ~0x2) | ((ifnull(flags, 0) & 0x2) << 1), sync_key FROM conversations_old "), CFSTR("Populating conversations"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO conversation_id_message_id (conversation_id, message_id, date_sent) SELECT conversation_id, message_id, ifnull(date_sent, 0) FROM conversation_id_message_id_old"), CFSTR("Populating conversation_id_message_id"))
    && objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO properties (key, value) SELECT key, value FROM properties_old"), CFSTR("Populating properties"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO main.message_data (ROWID, message_id, part, partial, complete, length) SELECT ROWID, message_id, part, partial, complete, length FROM message_data_old WHERE part != 'summary' "), CFSTR("Populating message_data"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO message_data_deleted (message_data_id) SELECT message_data_id FROM message_data_deleted_old"), CFSTR("Populating message_data_deleted"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO pop_uids (mailbox, uid, date_added, flags, del) SELECT mailbox, uid, date_added, flags, del FROM pop_uids_old"), CFSTR("Populating pop_uids"))
    && objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO accounts (ROWID, text_id) SELECT ROWID, text_id FROM accounts_old"), CFSTR("Populating accounts"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO spotlight_tombstones (ROWID, type, identifier, transaction_id) SELECT ROWID, type, identifier, transaction_id FROM spotlight_tombstones_old"), CFSTR("Populating spotlight_tombstones")))
  {
    v3 = objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO spotlight_message_reindex (message_id, type) SELECT message_id, type FROM spotlight_message_reindex_old"), CFSTR("Populating spotlight_message_reindex"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_migrateSubjects
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  int v10;
  id v11;
  char v12;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preparedStatementForQueryString:", CFSTR("SELECT DISTINCT subject FROM protected.messages JOIN main.messages_old ON main.messages_old.ROWID = protected.messages.message_id "));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "compiled");
  objc_msgSend(v2, "preparedStatementForQueryString:", CFSTR("INSERT INTO ssms_mem.parsed_subjects (original, prefix, unprefixed) VALUES (?1, ?2, ?3)"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "compiled");
  objc_msgSend(v2, "preparedStatementForQueryString:", CFSTR("INSERT INTO ssms_mem.parsed_subjects (original, prefix, unprefixed) VALUES (?1, NULL, ?1)"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "compiled");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSubjects__block_invoke;
  v15[3] = &unk_1E4E8CFD8;
  v17 = &v21;
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v9 = v2;
  v16 = v9;
  v14 = 0;
  v10 = objc_msgSend(v3, "executeUsingBlock:error:", v15, &v14);
  v11 = v14;
  if (v11)
    v12 = v10;
  else
    v12 = 1;
  if ((v12 & 1) == 0)
    objc_msgSend(v9, "handleError:message:", v11, CFSTR("Populating ssms_mem.parsed_subjects"));
  if (v10)
  {
    if (*((_BYTE *)v22 + 24))
      LOBYTE(v10) = objc_msgSend(v9, "executeStatementString:errorMessage:", CFSTR("INSERT OR IGNORE INTO protected.subjects (subject) SELECT unprefixed FROM ssms_mem.parsed_subjects"), CFSTR("Populating protected.subjects table"));
    else
      LOBYTE(v10) = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __70__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSubjects__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  const unsigned __int8 *v6;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  sqlite3_stmt *v17;
  id v18;
  sqlite3_stmt *v19;
  uint64_t v20;
  id v21;
  id v22;

  v6 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 48), 0);
  if (v6)
    v7 = (const char *)v6;
  else
    v7 = "";
  v8 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 48), 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v8, 4, 0);
  v10 = objc_msgSend(MEMORY[0x1E0D1E7B0], "prefixLengthForSubject:", v9);
  if (v10)
  {
    objc_msgSend(v9, "substringToIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringFromIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 56), 1, v7, v8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v13 = *(sqlite3_stmt **)(a1 + 56);
    v14 = objc_retainAutorelease(v11);
    sqlite3_bind_text(v13, 2, (const char *)objc_msgSend(v14, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v15 = *(sqlite3_stmt **)(a1 + 56);
    v16 = objc_retainAutorelease(v12);
    sqlite3_bind_text(v15, 3, (const char *)objc_msgSend(v16, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v17 = *(sqlite3_stmt **)(a1 + 56);
    v22 = 0;
    LOBYTE(v15) = performInsert(v17, &v22);
    v18 = v22;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v15;

  }
  else
  {
    sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 64), 1, v7, v8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v19 = *(sqlite3_stmt **)(a1 + 64);
    v21 = 0;
    v20 = performInsert(v19, &v21);
    v18 = v21;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v20;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 32), "handleError:message:", v18, CFSTR("Inserting into ssms_mem.parsed_subjects"));
  }

}

- (BOOL)_migrateSummaries
{
  void *v2;
  char v3;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE ssms_mem.temp_summaries(message INTEGER PRIMARY KEY, summary TEXT NOT NULL)"), CFSTR("Creating ssms_mem.temp_summaries table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO ssms_mem.temp_summaries (message, summary) SELECT main.message_data_old.message_id, protected.message_data.data FROM main.message_data_old JOIN protected.message_data ON protected.message_data.message_data_id = main.message_data_old.ROWID WHERE main.message_data_old.part = 'summary' AND protected.message_data.data IS NOT NULL "), CFSTR("Populating ssms_mem.temp_summaries"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT OR IGNORE INTO protected.summaries (summary) SELECT summary FROM ssms_mem.temp_summaries "), CFSTR("Populating protected.summaries"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("INSERT INTO ssms_mem.summary_id_by_message (message, summary_id) SELECT ssms_mem.temp_summaries.message, protected.summaries.ROWID FROM ssms_mem.temp_summaries JOIN protected.summaries ON protected.summaries.summary = ssms_mem.temp_summaries.summary "), CFSTR("Populating ssms_mem.summary_id_by_message")))
  {
    v3 = objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE ssms_mem.temp_summaries"), CFSTR("Dropping ssms_mem.temp_summaries table"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_migrateSendersAndRecipients
{
  void *v2;
  sqlite3 *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  char v17;
  id *v19;
  id v20;
  _QWORD v21[4];
  _QWORD v22[3];
  _QWORD aBlock[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (sqlite3 *)objc_msgSend(v2, "sqlDB");
  objc_msgSend(v2, "handleSQLResult:message:", sqlite3_create_function(v3, "rawAddress", 1, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))rawAddress, 0, 0), CFSTR("error creating user function rawAddress"));
  objc_msgSend(v2, "handleSQLResult:message:", sqlite3_create_function(v3, "displayName", 1, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))displayName, 0, 0), CFSTR("error creating user function displayName"));
  v4 = objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE ssms_mem.temp_recipients(message INTEGER NOT NULL, fullAddress TEXT NOT NULL, type INTEGER NOT NULL, position INTEGER NOT NULL)"), CFSTR("Creating ssms_mem.temp_recipients table"));
  objc_msgSend(v2, "preparedStatementForQueryString:", CFSTR("INSERT INTO ssms_mem.temp_recipients (message, fullAddress, type, position) VALUES (?, ?, ?, ?)"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "compiled");
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke;
  aBlock[3] = &unk_1E4E8D028;
  v25 = &v27;
  v26 = v6;
  v8 = v2;
  v24 = v8;
  v9 = _Block_copy(aBlock);
  objc_msgSend(v8, "preparedStatementForQueryString:", CFSTR("SELECT protected.messages.message_id, protected.messages._to, protected.messages.cc, protected.messages.bcc FROM protected.messages JOIN main.messages_old ON main.messages_old.ROWID = protected.messages.message_id "));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (id)objc_msgSend(v10, "compiled");
  if (!v4)
  {
    v13 = 0;
LABEL_12:
    v16 = (void *)MEMORY[0x1A85B0E24](v11);
    v15 = 0;
    goto LABEL_13;
  }
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke_3;
  v21[3] = &unk_1E4E8D050;
  v22[1] = v11;
  v22[2] = v6;
  v19 = (id *)v22;
  v22[0] = v9;
  v20 = 0;
  v12 = objc_msgSend(v10, "executeUsingBlock:error:", v21, &v20);
  v11 = v20;
  v13 = v11;
  if (v11)
    v14 = v12;
  else
    v14 = 1;
  if ((v14 & 1) == 0)
    v11 = (id)objc_msgSend(v8, "handleError:message:", v11, CFSTR("Populating ssms_mem.temp_recipients"));
  if (!v12 || !*((_BYTE *)v28 + 24))
    goto LABEL_12;
  v15 = objc_msgSend(v8, "executeStatementString:errorMessage:", CFSTR("INSERT INTO ssms_mem.parsed_addresses (fullAddress) SELECT sender FROM protected.messages JOIN main.messages_old ON main.messages_old.ROWID = protected.messages.message_id WHERE sender IS NOT NULL UNION ALL SELECT fullAddress FROM ssms_mem.temp_recipients WHERE fullAddress IS NOT NULL "), CFSTR("Populating ssms_mem.parsed_addresses"));
  v16 = (void *)MEMORY[0x1A85B0E24]();
  if (v15)
    v15 = objc_msgSend(v8, "executeStatementString:errorMessage:", CFSTR("UPDATE ssms_mem.parsed_addresses SET address = rawAddress(fullAddress), comment = displayName(fullAddress)"), CFSTR("Parsing addresses in ssms_mem.parsed_addresses"));
LABEL_13:
  objc_autoreleasePoolPop(v16);
  if (v15
    && objc_msgSend(v8, "executeStatementString:errorMessage:", CFSTR("INSERT OR IGNORE INTO protected.addresses (address, comment) SELECT address, comment FROM ssms_mem.parsed_addresses"), CFSTR("Populating protected.addresses"))&& objc_msgSend(v8, "executeStatementString:errorMessage:", CFSTR("INSERT INTO main.recipients (message, address, type, position) SELECT ssms_mem.temp_recipients.message, protected.addresses.ROWID, ssms_mem.temp_recipients.type, ssms_mem.temp_recipients.position FROM ssms_mem.temp_recipients JOIN ssms_mem.parsed_addresses ON ssms_mem.parsed_addresses.fullAddress = ssms_mem.temp_recipients.fullAddress JOIN protected.addresses ON protected.addresses.address = ssms_mem.parsed_addresses.address AND protected.addresses.comment = ssms_mem.parsed_addresses.comment "), CFSTR("Populating main.recipients")))
  {
    v17 = objc_msgSend(v8, "executeStatementString:errorMessage:", CFSTR("DROP TABLE ssms_mem.temp_recipients"), CFSTR("Dropping ssms_mem.temp_recipients table"));
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v8, "handleSQLResult:message:", sqlite3_create_function(v3, "rawAddress", 1, 1, 0, 0, 0, 0), CFSTR("error deleting user function rawAddress"));
  objc_msgSend(v8, "handleSQLResult:message:", sqlite3_create_function(v3, "displayName", 1, 1, 0, 0, 0, 0), CFSTR("error deleting user function displayName"));
  if (v4)

  _Block_object_dispose(&v27, 8);
  return v17;
}

BOOL __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke(uint64_t a1, sqlite3_int64 a2, uint64_t a3, unint64_t a4)
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  _QWORD v19[2];
  BOOL (*v20)(uint64_t, int, const char *, int);
  void *v21;
  __int128 v22;
  uint64_t v23;

  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 48), 3, a2);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v20 = __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke_2;
  v21 = &unk_1E4E8D000;
  v23 = *(_QWORD *)(a1 + 48);
  v18 = *(_OWORD *)(a1 + 32);
  v7 = (id)v18;
  v22 = v18;
  v8 = v19;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = (unint64_t)&v11[v10];
    if ((unint64_t)&v11[v10] >= a4)
      break;
    v10 = v12 ? v12 + 3 : 0;
    v13 = (char *)memmem((const void *)(a3 + v10), a4 - v10, "\r\r\n", 3uLL);
    v14 = &v13[-a3];
    if (!v13)
      v14 = (char *)a4;
    v11 = &v14[-v10];
    v15 = (void *)MEMORY[0x1A85B0E24]();
    v16 = v20((uint64_t)v8, v9, (const char *)(a3 + v10), (int)v11);
    objc_autoreleasePoolPop(v15);
    v9 = (v9 + 1);
  }
  while (v16);

  return v12 >= a4;
}

BOOL __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke_2(uint64_t a1, int a2, const char *a3, int a4)
{
  sqlite3_stmt *v6;
  char v7;
  id v8;
  uint64_t v9;
  int v10;
  id v12;

  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 48), 2, a3, a4, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 48), 4, a2);
  v6 = *(sqlite3_stmt **)(a1 + 48);
  v12 = 0;
  v7 = performInsert(v6, &v12);
  v8 = v12;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(unsigned __int8 *)(v9 + 24);
  if (!*(_BYTE *)(v9 + 24))
    objc_msgSend(*(id *)(a1 + 32), "handleError:message:", v8, CFSTR("Inserting recipient into ssms_mem.temp_recipients"));

  return v10 != 0;
}

uint64_t __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  sqlite3_int64 v6;
  char v7;
  uint64_t v8;
  const unsigned __int8 *v9;
  int v10;
  uint64_t result;
  uint64_t v12;
  const unsigned __int8 *v13;
  int v14;
  uint64_t v15;
  const unsigned __int8 *v16;
  int v17;

  v6 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 40), 0);
  v7 = 1;
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 48), 1, v6);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 40), 1);
  v10 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 40), 1);
  result = (*(uint64_t (**)(uint64_t, uint64_t, const unsigned __int8 *, _QWORD))(v8 + 16))(v8, 1, v9, v10);
  if ((_DWORD)result)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 40), 2);
    v14 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 40), 2);
    result = (*(uint64_t (**)(uint64_t, uint64_t, const unsigned __int8 *, _QWORD))(v12 + 16))(v12, 2, v13, v14);
    if ((_DWORD)result)
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 40), 3);
      v17 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 40), 3);
      result = (*(uint64_t (**)(uint64_t, uint64_t, const unsigned __int8 *, _QWORD))(v15 + 16))(v15, 3, v16, v17);
      v7 = result ^ 1;
    }
    else
    {
      v7 = 1;
    }
  }
  *a4 = v7;
  return result;
}

- (BOOL)_migrateMessages
{
  void *v2;
  int v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[31];
  _QWORD v19[32];

  v19[31] = *MEMORY[0x1E0C80C00];
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DELETE FROM protected.messages WHERE ROWID IN (SELECT message_id FROM messages_deleted)"), CFSTR("Deleting rows from protected.messages"));
  v18[0] = CFSTR("ROWID");
  v18[1] = CFSTR("message_id");
  v19[0] = CFSTR("messages_old.ROWID");
  v19[1] = CFSTR("ifnull(messages_old.message_id, 0)");
  v18[2] = CFSTR("remote_id");
  v18[3] = CFSTR("document_id");
  if (objc_msgSend(v2, "columnExists:inTable:type:", CFSTR("document_id"), CFSTR("messages_old"), 0))
    v4 = CFSTR("document_id");
  else
    v4 = CFSTR("null");
  v19[2] = CFSTR("remote_id");
  v19[3] = v4;
  v18[4] = CFSTR("sender");
  v18[5] = CFSTR("subject_prefix");
  v19[4] = CFSTR("protected.addresses.ROWID");
  v19[5] = CFSTR("ssms_mem.parsed_subjects.prefix");
  v18[6] = CFSTR("subject");
  v18[7] = CFSTR("summary");
  v19[6] = CFSTR("protected.subjects.ROWID");
  v19[7] = CFSTR("ssms_mem.summary_id_by_message.summary_id");
  v18[8] = CFSTR("date_sent");
  v18[9] = CFSTR("date_received");
  v19[8] = CFSTR("date_sent");
  v19[9] = CFSTR("date_received");
  v18[10] = CFSTR("mailbox");
  v18[11] = CFSTR("remote_mailbox");
  v19[10] = CFSTR("mailbox");
  v19[11] = CFSTR("remote_mailbox");
  v18[12] = CFSTR("flags");
  v18[13] = CFSTR("read");
  v19[12] = CFSTR("ifnull(flags, 0)");
  v19[13] = CFSTR("ifnull(read, 0)");
  v18[14] = CFSTR("flagged");
  v18[15] = CFSTR("deleted");
  v19[14] = CFSTR("ifnull(flagged, 0)");
  v19[15] = CFSTR("ifnull(deleted, 0)");
  v18[16] = CFSTR("size");
  v18[17] = CFSTR("conversation_id");
  v19[16] = CFSTR("ifnull(size, 0)");
  v19[17] = CFSTR("ifnull(conversation_id, 0)");
  v18[18] = CFSTR("date_last_viewed");
  v18[19] = CFSTR("original_mailbox");
  v19[18] = CFSTR("null");
  v19[19] = CFSTR("original_mailbox");
  v18[20] = CFSTR("visible");
  v18[21] = CFSTR("sender_vip");
  v19[20] = CFSTR("visible");
  v19[21] = CFSTR("sender_vip");
  v18[22] = CFSTR("encoding");
  v18[23] = CFSTR("content_type");
  v19[22] = CFSTR("encoding");
  v19[23] = CFSTR("content_type");
  v18[24] = CFSTR("sequence_identifier");
  v18[25] = CFSTR("external_id");
  v19[24] = CFSTR("0");
  v19[25] = CFSTR("external_id");
  v18[26] = CFSTR("unique_id");
  v18[27] = CFSTR("content_index_transaction_id");
  v19[26] = CFSTR("unique_id");
  v19[27] = CFSTR("content_index_transaction_id");
  v18[28] = CFSTR("list_id_hash");
  v18[29] = CFSTR("journaled");
  v19[28] = CFSTR("list_id_hash");
  v19[29] = CFSTR("journaled");
  v18[30] = CFSTR("flag_color");
  v19[30] = CFSTR("CASE WHEN messages_old.flags & 16 THEN ((messages_old.flags & (7 << 41)) >> 41) ELSE NULL END");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateMessages__block_invoke;
  v15[3] = &unk_1E4E890B0;
  v8 = v6;
  v16 = v8;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("INSERT INTO main.messages (%@) SELECT %@ FROM messages_old JOIN protected.messages ON messages_old.ROWID = protected.messages.message_id JOIN ssms_mem.parsed_subjects ON ssms_mem.parsed_subjects.original = ifnull(protected.messages.subject, '') JOIN protected.subjects ON protected.subjects.subject = ssms_mem.parsed_subjects.unprefixed LEFT OUTER JOIN ssms_mem.parsed_addresses ON ssms_mem.parsed_addresses.fullAddress = protected.messages.sender LEFT OUTER JOIN protected.addresses ON protected.addresses.address = ssms_mem.parsed_addresses.address AND protected.addresses.comment = ssms_mem.parsed_addresses.comment LEFT OUTER JOIN ssms_mem.summary_id_by_message ON ssms_mem.summary_id_by_message.message = messages_old.ROWID "), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    LOBYTE(v3) = objc_msgSend(v2, "executeStatementString:errorMessage:", v13, CFSTR("Populating messages"));

  return v3;
}

void __70__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateMessages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (BOOL)_createIndexes
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexDefinitionsWithDatabaseName:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeStatementString:errorMessage:", v5, CFSTR("Unable to create new indexes"));

  return v6;
}

- (BOOL)_cleanupOldSchema
{
  void *v2;
  char v3;

  -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS messages_old"), CFSTR("Dropping old messages table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS mailboxes_old"), CFSTR("Dropping old mailboxes table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS threads"), CFSTR("Dropping threads table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS conversations_old"), CFSTR("Dropping old conversations table"))
    && objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS conversation_id_message_id_old"), CFSTR("Dropping old conversation_id_message_id table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS properties_old"), CFSTR("Dropping old properties table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS message_data_old"), CFSTR("Dropping old message_data table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS message_data_deleted_old"), CFSTR("Dropping old message_data_deleted table"))
    && objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS pop_uids_old"), CFSTR("Dropping old pop_uids table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS accounts_old"), CFSTR("Dropping old accounts table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS spotlight_tombstones_old"), CFSTR("Dropping spotlight_tombstones table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS spotlight_message_reindex_old"), CFSTR("Dropping spotlight_message_reindex table"))
    && objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS messages_deleted"), CFSTR("Dropping messages_deleted table"))&& objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS protected.messages"), CFSTR("Dropping protected.messages")))
  {
    v3 = objc_msgSend(v2, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS protected.message_data"), CFSTR("Dropping protected.message_data"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (EDPersistenceDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)protectedDatabaseName
{
  return self->_protectedDatabaseName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedDatabaseName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
