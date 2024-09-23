@implementation EDAddThreadTablesUpgradeStep

+ (id)_schemaWithMessagesTable:(id)a3 mailboxesTable:(id)a4 conversationsTable:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(void *, void *, const __CFString *, id);
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  _QWORD aBlock[4];
  id v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v22 = a5;
  objc_msgSend(a1, "threadScopesTableSchema");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadsTableSchema");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadMailboxesTableSchema");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadSendersTableSchema");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadRecipientsTableSchema");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__EDAddThreadTablesUpgradeStep__schemaWithMessagesTable_mailboxesTable_conversationsTable___block_invoke_2;
  aBlock[3] = &unk_1E949AE18;
  v24 = &__block_literal_global_0;
  v15 = (void (**)(void *, void *, const __CFString *, id))_Block_copy(aBlock);
  v15[2](v15, v10, CFSTR("mailbox"), v9);
  v15[2](v15, v11, CFSTR("scope"), v10);
  v16 = ((uint64_t (*)(void *, void *, const __CFString *, id))v15[2])(v15, v11, CFSTR("conversation"), v22);
  __91__EDAddThreadTablesUpgradeStep__schemaWithMessagesTable_mailboxesTable_conversationsTable___block_invoke(v16, v11, (uint64_t)CFSTR("newest_read_message"), v8, 3);
  __91__EDAddThreadTablesUpgradeStep__schemaWithMessagesTable_mailboxesTable_conversationsTable___block_invoke(v17, v11, (uint64_t)CFSTR("display_message"), v8, 3);
  v15[2](v15, v12, CFSTR("thread"), v11);
  v15[2](v15, v12, CFSTR("mailbox"), v9);
  v15[2](v15, v13, CFSTR("thread"), v11);
  v15[2](v15, v14, CFSTR("thread"), v11);
  v18 = objc_alloc(MEMORY[0x1E0D1F038]);
  v25[0] = v10;
  v25[1] = v11;
  v25[2] = v12;
  v25[3] = v13;
  v25[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithTables:", v19);

  return v20;
}

void __91__EDAddThreadTablesUpgradeStep__schemaWithMessagesTable_mailboxesTable_conversationsTable___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a2, "columnForName:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAsForeignKeyForTable:onDelete:onUpdate:", v9, a5, 0);

}

uint64_t __91__EDAddThreadTablesUpgradeStep__schemaWithMessagesTable_mailboxesTable_conversationsTable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (EFSQLTableSchema)threadScopesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  const __CFString *v72;
  _QWORD v73[2];
  _QWORD v74[2];
  void *v75;
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  void *v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[7];

  v84[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("mailbox"), 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("mailbox_type"), 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "blobColumnWithName:nullable:", CFSTR("filter_predicate"), 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  v84[0] = v70;
  v84[1] = v67;
  v84[2] = v68;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("needs_update"), 0, &unk_1E94E4640);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("last_viewed"), 0, &unk_1E94E4640);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("thread_scopes"), 2, v5);

  objc_msgSend(v70, "columnExpression");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "columnExpression");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "columnExpression");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(v69, "isNotNull");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v8;
  objc_msgSend(v66, "isNull");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v7, "initWithExpressions:", v10);

  v11 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(v69, "isNull");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v12;
  objc_msgSend(v66, "isNotNull");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v11, "initWithExpressions:", v14);

  v15 = objc_alloc(MEMORY[0x1E0D1F020]);
  v81[0] = v64;
  v81[1] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v15, "initWithExpressions:", v16);

  objc_msgSend(v6, "addCheckConstraintForExpression:", v62);
  v17 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(v69, "isNotNull");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v18;
  objc_msgSend(v65, "isNull");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithExpressions:", v20);

  v22 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v6, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v22, "initWithTableName:columnNames:where:unique:", v23, v25, v21, 1);

  objc_msgSend(v6, "addIndex:", v61);
  v26 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(v69, "isNotNull");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v27;
  objc_msgSend(v65, "isNotNull");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v26, "initWithExpressions:", v29);

  v31 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v6, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "name");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v33;
  objc_msgSend(v68, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v31, "initWithTableName:columnNames:where:unique:", v32, v35, v30, 1);

  objc_msgSend(v6, "addIndex:", v36);
  v37 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(v66, "isNotNull");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v38;
  objc_msgSend(v65, "isNull");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v37, "initWithExpressions:", v40);

  v42 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v6, "name");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "name");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v42, "initWithTableName:columnNames:where:unique:", v43, v45, v41, 1);

  objc_msgSend(v6, "addIndex:", v46);
  v47 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(v66, "isNotNull");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v48;
  objc_msgSend(v65, "isNotNull");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v47, "initWithExpressions:", v50);

  v52 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v6, "name");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "name");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v54;
  objc_msgSend(v68, "name");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v52, "initWithTableName:columnNames:where:unique:", v53, v56, v51, 1);

  objc_msgSend(v6, "addIndex:", v57);
  v72 = CFSTR("needs_update");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addIndexForColumns:", v58);

  v71 = CFSTR("last_viewed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addIndexForColumns:", v59);

  return (EFSQLTableSchema *)v6;
}

+ (EFSQLTableSchema)threadsTableSchema
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[2];
  _QWORD v33[25];

  v33[23] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("scope"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v30;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("conversation"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v29;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("newest_read_message"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v28;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("display_message"), 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v27;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v26;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("read"), 0, &unk_1E94E4640);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v25;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flagged"), 0, &unk_1E94E4640);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v24;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_red_flag"), 0, &unk_1E94E4640);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v23;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_orange_flag"), 0, &unk_1E94E4640);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v22;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_yellow_flag"), 0, &unk_1E94E4640);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v21;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_green_flag"), 0, &unk_1E94E4640);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[10] = v20;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_blue_flag"), 0, &unk_1E94E4640);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v19;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_purple_flag"), 0, &unk_1E94E4640);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[12] = v18;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_gray_flag"), 0, &unk_1E94E4640);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[13] = v17;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("draft"), 0, &unk_1E94E4640);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[14] = v16;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("replied"), 0, &unk_1E94E4640);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33[15] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("forwarded"), 0, &unk_1E94E4640);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[16] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("redirected"), 0, &unk_1E94E4640);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[17] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("junk_level_set_by_user"), 0, &unk_1E94E4640);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[18] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("junk_level"), 0, &unk_1E94E4640);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[19] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_unflagged"), 0, &unk_1E94E4640);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[20] = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_attachments"), 0, &unk_1E94E4640);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[21] = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("count"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[22] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("threads"), 2, v11);

  v32[0] = CFSTR("scope");
  v32[1] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addUniquenessConstraintForColumns:conflictResolution:", v13, 1);

  v31[0] = CFSTR("scope");
  v31[1] = CFSTR("date");
  v31[2] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIndexForColumns:", v14);

  return (EFSQLTableSchema *)v12;
}

+ (EFSQLTableSchema)threadMailboxesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("thread"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("mailbox"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("thread");
  v9[1] = CFSTR("mailbox");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:", CFSTR("thread_mailboxes"), v5, v6);

  return (EFSQLTableSchema *)v7;
}

+ (EFSQLTableSchema)threadSendersTableSchema
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
  _QWORD v13[3];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("thread"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("address"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("priority"), 0, &unk_1E94E4640);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("thread");
  v15[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:", CFSTR("thread_senders"), v7, v8);

  v14[0] = CFSTR("address");
  v14[1] = CFSTR("thread");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v10);

  v13[0] = CFSTR("thread");
  v13[1] = CFSTR("priority");
  v13[2] = CFSTR("date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v11);

  return (EFSQLTableSchema *)v9;
}

+ (EFSQLTableSchema)threadRecipientsTableSchema
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
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("thread"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("address"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("type"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("priority"), 0, &unk_1E94E4640);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("thread");
  v16[1] = CFSTR("type");
  v16[2] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:", CFSTR("thread_recipients"), v8, v9);

  v15[0] = CFSTR("address");
  v15[1] = CFSTR("thread");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addIndexForColumns:", v11);

  v14[0] = CFSTR("thread");
  v14[1] = CFSTR("priority");
  v14[2] = CFSTR("date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addIndexForColumns:", v12);

  return (EFSQLTableSchema *)v10;
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
  sqlite3 *v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D1F050]);
  v6 = (void *)objc_msgSend(v5, "initWithName:rowIDType:columns:", CFSTR("messages"), 2, MEMORY[0x1E0C9AA60]);
  v7 = objc_alloc(MEMORY[0x1E0D1F050]);
  v8 = (void *)objc_msgSend(v7, "initWithName:rowIDType:columns:", CFSTR("mailboxes"), 2, MEMORY[0x1E0C9AA60]);
  v9 = objc_alloc(MEMORY[0x1E0D1F050]);
  v10 = (void *)objc_msgSend(v9, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("conversations"), 2, CFSTR("conversation_id"), MEMORY[0x1E0C9AA60]);
  objc_msgSend(a1, "_schemaWithMessagesTable:mailboxesTable:conversationsTable:", v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "definitionWithDatabaseName:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (sqlite3 *)objc_msgSend(v4, "sqlDB");
  v14 = objc_retainAutorelease(v12);
  LODWORD(v13) = sqlite3_exec(v13, (const char *)objc_msgSend(v14, "UTF8String"), 0, 0, 0);

  return (int)v13;
}

@end
