@implementation MFPersistenceDatabaseSchema_iOS

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  objc_super v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[11];

  v33[9] = *MEMORY[0x1E0C80C00];
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0;
  v32 = 0;
  +[MFPersistenceDatabaseSchema_iOS _messagesTableSchemaAndForeignKeysToResolve:associationsToResolve:]((uint64_t)a1, (uint64_t)&v32, (uint64_t)&v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  v9 = v31;
  objc_msgSend(v26, "addObjectsFromArray:", v8);
  objc_msgSend(v7, "addObjectsFromArray:", v9);
  v29 = v9;
  v30 = v8;
  objc_msgSend(MEMORY[0x1E0D1EB30], "recipientsTableSchemaAndForeignKeysToResolve:associationsToResolve:", &v30, &v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v30;

  v10 = v29;
  objc_msgSend(v26, "addObjectsFromArray:", v23);
  objc_msgSend(v7, "addObjectsFromArray:", v10);
  v28 = v10;
  objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataTableSchemaAndAssociationsToResolve:", &v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v28;

  objc_msgSend(v7, "addObjectsFromArray:", v21);
  v11 = objc_retainAutorelease(v26);
  *a3 = v11;
  v12 = objc_retainAutorelease(v7);
  *a4 = v12;
  v33[0] = v25;
  v33[1] = v24;
  v33[2] = v22;
  +[MFPersistenceDatabaseSchema_iOS mailboxesTableSchema]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v13;
  +[MFPersistenceDatabaseSchema_iOS messageDataTableSchema]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v14;
  +[MFPersistenceDatabaseSchema_iOS messageDataDeletedTableSchema]();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v15;
  +[MFPersistenceDatabaseSchema_iOS popUIDsTableSchema]();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v16;
  +[MFPersistenceDatabaseSchema_iOS accountsTableSchema]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v17;
  v27.receiver = a1;
  v27.super_class = (Class)&OBJC_METACLASS___MFPersistenceDatabaseSchema_iOS;
  objc_msgSendSuper2(&v27, sel_propertiesTableSchema);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)popUIDsTableSchema
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("mailbox"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("uid"), 1, 1, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v2;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date_added"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("flags"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("del"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v0, "initWithName:rowIDType:columns:", CFSTR("pop_uids"), 1, v6);

  objc_msgSend(v7, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F699A0, 1);
  objc_msgSend(v7, "addIndexForColumns:", &unk_1E4F699B8);
  return v7;
}

+ (id)messageDataTableSchema
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message_id"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("part"), 1, 1, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v2;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("partial"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("complete"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("length"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v0, "initWithName:rowIDType:columns:", CFSTR("message_data"), 2, v6);

  objc_msgSend(v7, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F69988, 1);
  return v7;
}

+ (id)messageDataDeletedTableSchema
{
  id v0;

  objc_opt_self();
  v0 = objc_alloc(MEMORY[0x1E0D1F050]);
  return (id)objc_msgSend(v0, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("message_data_deleted"), 1, CFSTR("message_data_id"), MEMORY[0x1E0C9AA60]);
}

+ (id)mailboxesTableSchema
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = (id)objc_opt_self();
  v13.super_class = (Class)&OBJC_METACLASS___MFPersistenceDatabaseSchema_iOS;
  objc_msgSendSuper2(&v13, sel_partialMailboxesTableSchema);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("sequence_identifier"), 1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v1);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flagged_count"), 0, &unk_1E4F6A420);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v2);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("attachment_count"), 0, &unk_1E4F6A420);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v3);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("to_cc_count"), 0, &unk_1E4F6A420);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v4);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("server_unread_count"), 0, &unk_1E4F6A420);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v5);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("last_sync_status_count"), 0, &unk_1E4F6A420);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v6);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("most_recent_status_count"), 0, &unk_1E4F6A420);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v7);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("reconcile"), 0, &unk_1E4F6A420);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v8);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "blobColumnWithName:nullable:", CFSTR("frecency"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v9);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "blobColumnWithName:nullable:", CFSTR("server_metadata"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v10);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "blobColumnWithName:nullable:", CFSTR("sync_info"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addColumn:", v11);

  return v0;
}

+ (id)accountsTableSchema
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("text_id"), 1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v0, "initWithName:rowIDType:columns:", CFSTR("accounts"), 2, v2);

  objc_msgSend(v3, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F699D0, 1);
  return v3;
}

+ (id)_messagesTableSchemaAndForeignKeysToResolve:(uint64_t)a3 associationsToResolve:
{
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v94[2];
  _QWORD v95[4];
  _QWORD v96[2];
  _QWORD v97[3];
  _QWORD v98[2];
  _QWORD v99[3];
  void *v100;
  _QWORD v101[6];

  v101[4] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D1EB30], "partialMessagesTableSchemaAndForeignKeysToResolve:associationsToResolve:", a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("original_mailbox"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumn:", v6);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("visible"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumn:", v7);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("sender_vip"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumn:", v8);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("encoding"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumn:", v9);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("content_type"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumn:", v10);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("sequence_identifier"), 1, &unk_1E4F6A420);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumn:", v11);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("external_id"), 1, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumn:", v12);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("unique_id"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumn:", v13);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("content_index_transaction_id"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumn:", v14);

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("journaled"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumn:", v15);

  __101__MFPersistenceDatabaseSchema_iOS__messagesTableSchemaAndForeignKeysToResolve_associationsToResolve___block_invoke(v16, &unk_1E4F697A8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("date_received"), 2);
  objc_msgSend(v17, "addObject:", v18);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("ROWID"), 2);
  objc_msgSend(v17, "addObject:", v19);

  v20 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v5, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithTableName:indexedColumns:", v21, v17);
  objc_msgSend(v5, "addIndex:", v22);

  __101__MFPersistenceDatabaseSchema_iOS__messagesTableSchemaAndForeignKeysToResolve_associationsToResolve___block_invoke(v23, &unk_1E4F697C0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("date_received"), 2);
  objc_msgSend(v24, "addObject:", v25);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("ROWID"), 2);
  objc_msgSend(v24, "addObject:", v26);

  v27 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v5, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithTableName:indexedColumns:", v28, v24);
  objc_msgSend(v5, "addIndex:", v29);

  __101__MFPersistenceDatabaseSchema_iOS__messagesTableSchemaAndForeignKeysToResolve_associationsToResolve___block_invoke(v30, &unk_1E4F697D8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("date_received"), 2);
  objc_msgSend(v31, "addObject:", v32);

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:", CFSTR("ROWID"));
  objc_msgSend(v31, "addObject:", v33);

  v34 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v5, "name");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithTableName:indexedColumns:", v35, v31);
  objc_msgSend(v5, "addIndex:", v36);

  __101__MFPersistenceDatabaseSchema_iOS__messagesTableSchemaAndForeignKeysToResolve_associationsToResolve___block_invoke(objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F697F0), &unk_1E4F69808);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:orderDirection:", CFSTR("date_received"), 1);
  objc_msgSend(v37, "addObject:", v38);

  v39 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v5, "name");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v39, "initWithTableName:indexedColumns:", v40, v37);
  objc_msgSend(v5, "addIndex:", v41);

  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F69820);
  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F69838);
  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F69850);
  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F69868);
  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F69880);
  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F69898);
  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F698B0);
  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F698C8);
  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F698E0);
  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F698F8);
  objc_msgSend(v5, "addIndexForColumns:", &unk_1E4F69910);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("sender_vip"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "equalTo:", &unk_1E4F6A438);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("journaled"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "equalTo:", &unk_1E4F6A420);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("deleted"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "equalTo:", &unk_1E4F6A420);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("read"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "equalTo:", &unk_1E4F6A420);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v101[0] = v88;
  v101[1] = v93;
  v101[2] = v92;
  v101[3] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v46, "initWithExpressions:", v47);

  v49 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v5, "name");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v49, "initWithTableName:columnNames:where:unique:", v50, &unk_1E4F69928, v48, 0);

  objc_msgSend(v5, "addIndex:", v51);
  v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:", CFSTR("mailbox"));
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:", CFSTR("date_received"));
  v52 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  v100 = v90;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v99[0] = v92;
  v99[1] = v93;
  v99[2] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v54, "initWithExpressions:", v55);
  v57 = (void *)objc_msgSend(v52, "initWithName:tableName:indexedColumns:where:unique:", CFSTR("messages_date_received_deleted0_journaled0_read0_index"), CFSTR("messages"), v53, v56, 0);

  objc_msgSend(v5, "addIndex:", v57);
  v58 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  v98[0] = v89;
  v98[1] = v90;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v97[0] = v92;
  v97[1] = v93;
  v97[2] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v60, "initWithExpressions:", v61);
  v63 = (void *)objc_msgSend(v58, "initWithName:tableName:indexedColumns:where:unique:", CFSTR("messages_mailbox_date_received_deleted0_journaled0_read0_index"), CFSTR("messages"), v59, v62, 0);

  objc_msgSend(v5, "addIndex:", v63);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("journaled"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "equalTo:", &unk_1E4F6A438);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v96[0] = v87;
  v96[1] = v92;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v65, "initWithExpressions:", v66);

  v68 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v5, "name");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v68, "initWithTableName:columnNames:where:unique:", v69, &unk_1E4F69940, v67, 0);

  objc_msgSend(v5, "addIndex:", v70);
  v71 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v5, "name");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(v71, "initWithTableName:columnNames:where:unique:", v72, &unk_1E4F69958, v93, 0);

  objc_msgSend(v5, "addIndex:", v73);
  v74 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v5, "name");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend(v74, "initWithTableName:columnNames:where:unique:", v75, &unk_1E4F69970, v93, 0);

  objc_msgSend(v5, "addIndex:", v76);
  v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:", CFSTR("read"));
  v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:", CFSTR("deleted"));
  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:", CFSTR("global_message_id"));
  v79 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  v95[0] = v86;
  v95[1] = v77;
  v95[2] = v78;
  v95[3] = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 4);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)MEMORY[0x1E0D1EF90];
  v94[0] = v91;
  v94[1] = v92;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "combined:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v79, "initWithName:tableName:indexedColumns:where:unique:", CFSTR("messages_read_deleted_global_message_id_mailbox_read0_deleted0_index"), CFSTR("messages"), v80, v83, 0);

  objc_msgSend(v5, "addIndex:", v84);
  return v5;
}

+ (id)additionalSchemaProviders
{
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
