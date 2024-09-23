@implementation EDThreadPersistence

void __75__EDThreadPersistence__addressesFromSelectStatement_additionalRowHandling___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("address"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("comment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v8);
  objc_msgSend(v11, "setDisplayName:", v10);
  objc_msgSend(v11, "emailAddressValue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v8;
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v16 + 16))(v16, v17, a3, a4);

}

void __103__EDThreadPersistence__enumerateThreadObjectIDsForThreadScope_filterClause_sortDescriptors_batchBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "databaseIDValue");

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E380]), "initWithConversationID:threadScope:", v3, *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v5 + 16))(v5, v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, a3);

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  }

}

uint64_t __75__EDThreadPersistence__addressesFromSelectStatement_additionalRowHandling___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__EDThreadPersistence__addressesFromSelectStatement_additionalRowHandling___block_invoke_2;
  v7[3] = &unk_1E94A2228;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v5 = objc_msgSend(a2, "executeSelectStatement:withBlock:error:", v4, v7, 0);

  return v5;
}

uint64_t __52__EDThreadPersistence__databaseIDForThreadObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_threadDatabaseIDExpressionForThreadScopeDatabaseID:conversation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__EDThreadPersistence__databaseIDForThreadObjectID___block_invoke_2;
  v7[3] = &unk_1E949B090;
  v7[4] = *(_QWORD *)(a1 + 40);
  v5 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v7, 0);

  return v5;
}

- (id)_threadDatabaseIDExpressionForThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;

  v7 = objc_alloc(MEMORY[0x1E0D1F040]);
  v8 = (void *)objc_msgSend(v7, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("threads"));
  -[EDThreadPersistence _threadExpressionForThreadScopeDatabaseID:conversation:](self, "_threadExpressionForThreadScopeDatabaseID:conversation:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhere:", v9);

  objc_msgSend(v8, "setLimit:", 1);
  return v8;
}

- (id)_threadExpressionForThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("threads"), CFSTR("scope"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("threads"), CFSTR("conversation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "equalTo:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "initWithExpressions:", v13);

  return v14;
}

- (id)_recipientsOfType:(unint64_t)a3 forThreadDatabaseID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("address"), CFSTR("addresses"));
  objc_msgSend(v7, "addResultColumn:", CFSTR("comment"));
  objc_msgSend(v7, "join:sourceColumn:targetColumn:", CFSTR("thread_recipients"), *MEMORY[0x1E0D1EE00], CFSTR("address"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("thread_recipients"), CFSTR("thread"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "equalTo:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("thread_recipients"), CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v19[0] = v10;
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithExpressions:", v15);
  objc_msgSend(v7, "setWhere:", v16);

  objc_msgSend(v8, "orderByColumn:ascending:", CFSTR("priority"), 0);
  objc_msgSend(v8, "orderByColumn:ascending:", CFSTR("date"), 0);
  -[EDThreadPersistence _addressesFromSelectStatement:additionalRowHandling:](self, "_addressesFromSelectStatement:additionalRowHandling:", v7, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_addressesFromSelectStatement:(id)a3 additionalRowHandling:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDThreadPersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _addressesFromSelectStatement:additionalRowHandling:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__EDThreadPersistence__addressesFromSelectStatement_additionalRowHandling___block_invoke;
  v17[3] = &unk_1E94A1B78;
  v11 = v6;
  v18 = v11;
  v12 = v8;
  v19 = v12;
  v13 = v7;
  v20 = v13;
  objc_msgSend(v9, "__performReadWithCaller:usingBlock:", v10, v17);

  v14 = v20;
  v15 = v12;

  return v15;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

uint64_t __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v45;
  void *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  __CFString *v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  _QWORD v69[4];
  id v70;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_databaseIDForThreadObjectID:", *(_QWORD *)(a1 + 40));
  if (v4 == *MEMORY[0x1E0D1DC08])
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_cold_1((uint64_t *)(a1 + 40), v5, v6);

    objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v7;
    v16 = 1;
    goto LABEL_27;
  }
  if ((objc_msgSend(v3, "protectedDatabaseAttached") & 1) == 0)
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_cold_2((uint64_t *)(a1 + 40), v12, v13);

    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 1025, 0);
    goto LABEL_11;
  }
  v53 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_mailboxesForThreadDatabaseID:", v8);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sendersForThreadDatabaseID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v54 = v9;
    v10 = 0;
    v11 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendersFromMessagesForThreadObjectID:", *(_QWORD *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "count");
    v11 = v18 == 0;
    if (v18)
      v10 = CFSTR("no senders");
    else
      v10 = 0;
    v54 = v17;
  }
  objc_msgSend(*(id *)(a1 + 32), "_recipientsOfType:forThreadDatabaseID:", 1, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_recipientsOfType:forThreadDatabaseID:", 2, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") || objc_msgSend(v20, "count"))
  {
    v21 = v19;
    v22 = v20;
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 32), "_recipientsOfType:fromMessagesForThreadObjectID:", 1, *(_QWORD *)(a1 + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_recipientsOfType:fromMessagesForThreadObjectID:", 2, *(_QWORD *)(a1 + 40));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v21, "count") && !objc_msgSend(v22, "count"))
  {
LABEL_19:
    if (!v10)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (!v11)
  {
    -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR(" and no recipients"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v10 = CFSTR("no recipients");
LABEL_20:
  objc_msgSend(*(id *)(a1 + 32), "_scheduleRecomputationForThread:reason:", *(_QWORD *)(a1 + 40), v10);
LABEL_21:
  v47 = v21;
  v48 = v10;
  v46 = v22;
  objc_msgSend(*(id *)(a1 + 32), "vipManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_145;
  v69[3] = &unk_1E94A1988;
  v45 = v23;
  v70 = v45;
  v24 = objc_msgSend(v54, "ef_any:", v69);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("date"), CFSTR("threads"));
  v26 = *MEMORY[0x1E0D1EE00];
  objc_msgSend(v25, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("conversations"), CFSTR("conversation"), *MEMORY[0x1E0D1EE00]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftOuterJoin:sourceColumn:targetColumn:", v55, CFSTR("display_message"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("message_global_data"), CFSTR("global_message_id"), v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("subjects"), CFSTR("subject"), v26);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("summaries"), CFSTR("summary"), v26);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addResultColumn:", CFSTR("subject_prefix"));
  objc_msgSend(v27, "addResultColumn:", CFSTR("unsubscribe_type"));
  objc_msgSend(v52, "addResultColumn:", CFSTR("subject"));
  objc_msgSend(v51, "addResultColumn:", CFSTR("summary"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("display_message"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("newest_message"));
  objc_msgSend(v27, "addResultColumn:", CFSTR("global_message_id"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("date"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("display_date"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("read_later_date"));
  objc_msgSend(v28, "addResultColumn:", CFSTR("follow_up_start_date"));
  objc_msgSend(v28, "addResultColumn:", CFSTR("follow_up_end_date"));
  objc_msgSend(v28, "addResultColumn:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("read"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("flagged"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("has_red_flag"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("has_orange_flag"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("has_yellow_flag"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("has_green_flag"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("has_blue_flag"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("has_purple_flag"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("has_gray_flag"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("draft"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("replied"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("forwarded"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("redirected"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("junk_level_set_by_user"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("junk_level"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("has_unflagged"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("has_attachments"));
  objc_msgSend(v50, "addResultColumn:", CFSTR("flags"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("count"));
  objc_msgSend(v25, "addResultColumn:", CFSTR("journaled"));
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    objc_msgSend(v25, "leftOuterJoin:alias:sourceColumn:targetColumn:", v55, CFSTR("newest_message"), CFSTR("newest_message"), v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leftOuterJoin:alias:sourceColumn:targetColumn:", CFSTR("message_global_data"), CFSTR("newest_message_global_data"), CFSTR("global_message_id"), v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addResultColumn:alias:", CFSTR("rowid"), CFSTR("newest_message_global_message_id"));
    objc_msgSend(v30, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("generated_summaries"), CFSTR("generated_summary"), v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addResultColumn:alias:", CFSTR("summary"), CFSTR("generated_summary"));
    objc_msgSend(v30, "addResultColumn:", CFSTR("urgent"));

  }
  if (_os_feature_enabled_impl())
  {
    +[EDCategoryPersistence addCategoryColumnsToMessagesSelectComponent:globalMessagesSelectComponent:](EDCategoryPersistence, "addCategoryColumnsToMessagesSelectComponent:globalMessagesSelectComponent:", v27, v28);
    +[EDMessagePersistence messageGlobalDataValidationState](EDMessagePersistence, "messageGlobalDataValidationState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addResultColumn:", v32);

  }
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("threads"), v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "equalTo:", v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWhere:", v34);

  objc_msgSend(v25, "setLimit:", 1);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_2;
  v56[3] = &unk_1E94A22A0;
  v35 = *(id *)(a1 + 40);
  v37 = *(void **)(a1 + 48);
  v36 = *(_QWORD *)(a1 + 56);
  v57 = v35;
  v66 = v36;
  v38 = v37;
  v67 = *(_QWORD *)(a1 + 64);
  v39 = *(_QWORD *)(a1 + 32);
  v58 = v38;
  v59 = v39;
  v60 = v53;
  v40 = v54;
  v61 = v40;
  v41 = v47;
  v62 = v41;
  v42 = v46;
  v63 = v42;
  v68 = v24;
  v43 = v49;
  v64 = v43;
  v65 = CFSTR("newest_message_global_message_id");
  v16 = objc_msgSend(v60, "executeSelectStatement:withBlock:error:", v25, v56, 0);

  v3 = v53;
LABEL_27:

  return v16;
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (int64_t)_databaseIDForThreadObjectID:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int64_t v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "conversationID");
  v6 = *MEMORY[0x1E0D1DC08];
  if (v5 == *MEMORY[0x1E0D1DC08])
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[EDThreadPersistence _databaseIDForThreadObjectID:].cold.1();

  }
  else
  {
    -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadScope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "databaseIDForThreadScope:", v9);

    if (v10 == v6)
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[EDThreadPersistence _databaseIDForThreadObjectID:].cold.2();

      v5 = v6;
    }
    else
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = v6;
      -[EDThreadPersistence database](self, "database");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _databaseIDForThreadObjectID:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __52__EDThreadPersistence__databaseIDForThreadObjectID___block_invoke;
      v15[3] = &unk_1E94A23F8;
      v15[6] = v10;
      v15[7] = v5;
      v15[4] = self;
      v15[5] = &v16;
      objc_msgSend(v12, "__performReadWithCaller:usingBlock:", v13, v15);

      v5 = v17[3];
      _Block_object_dispose(&v16, 8);
    }
  }

  return v5;
}

- (EDThreadScopeManager)threadScopeManager
{
  return self->_threadScopeManager;
}

uint64_t __72__EDThreadPersistence_threadScopeManager_populateThreadScopesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v12;
  _QWORD v13[5];
  __int128 v14;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  v5 = *MEMORY[0x1E0D1EE00];
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("thread_scopes"));
  +[EDPersistenceDatabaseSchema mailboxesTableName](EDPersistenceDatabaseSchema, "mailboxesTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftOuterJoin:sourceColumn:targetColumn:", v7, CFSTR("mailbox"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addResultColumn:", CFSTR("needs_update"));
  objc_msgSend(v8, "addResultColumn:", CFSTR("url"));
  objc_msgSend(v6, "addResultColumn:", CFSTR("mailbox_type"));
  objc_msgSend(v6, "addResultColumn:", CFSTR("filter_predicate"));
  objc_msgSend(v6, "addResultColumn:", CFSTR("last_viewed"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__EDThreadPersistence_threadScopeManager_populateThreadScopesWithBlock___block_invoke_2;
  v13[3] = &unk_1E94A2AD0;
  v13[4] = *(_QWORD *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v14 = v12;
  v10 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v13, 0);

  return v10;
}

- (void)threadScopeManager:(id)a3 populateThreadScopesWithBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v6 = a4;
  -[EDThreadPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence threadScopeManager:populateThreadScopesWithBlock:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__EDThreadPersistence_threadScopeManager_populateThreadScopesWithBlock___block_invoke;
  v10[3] = &unk_1E94A2AF8;
  v12 = a2;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v10);

}

void __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v4);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

uint64_t __58__EDThreadPersistence_updateLastViewedDateForThreadScope___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "threadScopeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "databaseIDForThreadScope:", *(_QWORD *)(a1 + 40));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:conflictResolution:", CFSTR("thread_scopes"), 4);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("last_viewed"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhereClause:", v9);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "executeUpdateStatement:error:", v6, 0);
  v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v10;
}

- (id)_mailboxesForThreadDatabaseID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDThreadPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _mailboxesForThreadDatabaseID:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke;
  v19[3] = &unk_1E949AFA0;
  v9 = v4;
  v20 = v9;
  v10 = v5;
  v21 = v10;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v19);

  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mailboxPersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mailboxProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke_3;
  v17[3] = &unk_1E94A2318;
  v18 = v13;
  v14 = v13;
  objc_msgSend(v10, "ef_compactMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (id)_flagColorsFromRow:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("has_red_flag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    objc_msgSend(v4, "addIndex:", 0);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("has_orange_flag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
    objc_msgSend(v4, "addIndex:", 1);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("has_yellow_flag"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
    objc_msgSend(v4, "addIndex:", 2);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("has_green_flag"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
    objc_msgSend(v4, "addIndex:", 3);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("has_blue_flag"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
    objc_msgSend(v4, "addIndex:", 4);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("has_purple_flag"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
    objc_msgSend(v4, "addIndex:", 5);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("has_gray_flag"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (v18)
    objc_msgSend(v4, "addIndex:", 6);
  if (!objc_msgSend(v4, "count"))
    objc_msgSend(v4, "addIndex:", 0);

  return v4;
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("read"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRead:", objc_msgSend(v3, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("flagged"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFlagged:", objc_msgSend(v4, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("draft"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDraft:", objc_msgSend(v5, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("replied"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReplied:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("forwarded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setForwarded:", objc_msgSend(v7, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("redirected"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRedirected:", objc_msgSend(v8, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("junk_level_set_by_user"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setJunkLevelSetByUser:", objc_msgSend(v9, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("junk_level"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setJunkLevel:", objc_msgSend(v11, "unsignedIntegerValue"));

}

- (void)updateLastViewedDateForThreadScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  EDThreadPersistence *v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[EDThreadPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence updateLastViewedDateForThreadScope:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __58__EDThreadPersistence_updateLastViewedDateForThreadScope___block_invoke;
  v14 = &unk_1E949C9A8;
  v15 = self;
  v8 = v4;
  v16 = v8;
  v9 = v5;
  v17 = v9;
  v18 = &v19;
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, &v11);

  if (*((_BYTE *)v20 + 24))
  {
    -[EDThreadPersistence threadScopeManager](self, "threadScopeManager", v11, v12, v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLastViewedDate:forThreadScope:", v9, v8);

  }
  _Block_object_dispose(&v19, 8);

}

- (id)threadForObjectID:(id)a3 originatingQuery:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, void *);
  void *v35;
  EDThreadPersistence *v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__37;
  v51 = __Block_byref_object_dispose__37;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__37;
  v45 = __Block_byref_object_dispose__37;
  v46 = 0;
  -[EDThreadPersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence threadForObjectID:originatingQuery:error:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke;
  v35 = &unk_1E94A22C8;
  v36 = self;
  v12 = v8;
  v37 = v12;
  v39 = &v41;
  v13 = v9;
  v38 = v13;
  v40 = &v47;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, &v32);

  if (a5)
  {
    v14 = v42;
    if (!v48[5] && !v42[5])
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "ef_publicDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Failed to get thread with objectID: %@"), v17, v32, v33, v34, v35, v36, v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "em_internalErrorWithReason:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v42[5];
      v42[5] = v19;

      v14 = v42;
    }
    *a5 = objc_retainAutorelease((id)v14[5]);
  }
  v21 = (void *)v48[5];
  if (v21)
  {
    objc_msgSend(v21, "subject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

    if (v23)
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v48[5], "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDThreadPersistence threadForObjectID:originatingQuery:error:].cold.2();
      }

      EFSaveTailspin();
    }
    objc_msgSend((id)v48[5], "senderList");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count") == 0;

    if (v26)
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v48[5], "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDThreadPersistence threadForObjectID:originatingQuery:error:].cold.1();
      }

      EFSaveTailspin();
    }
  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v42[5], "ef_publicDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v12;
      v55 = 2114;
      v56 = v29;
      _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEFAULT, "Unable to return thread for objectID %{public}@ due to error: %{public}@", buf, 0x16u);

    }
  }
  v30 = (id)v48[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v30;
}

- (unint64_t)persistenceStateForThreadScope:(id)a3
{
  return -[EDThreadPersistence persistenceStateForThreadScope:wantsPrecomputed:](self, "persistenceStateForThreadScope:wantsPrecomputed:", a3, 0);
}

- (BOOL)_isThreadScopePrecomputed:(id)a3 shouldMigrate:(BOOL *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 2))
  {
    v7 = 0;
    *a4 = 0;
  }
  else
  {
    -[EDThreadPersistence messagePersistence](self, "messagePersistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mailboxPersistence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mailboxProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "isThreadScopePrecomputed:mailboxProvider:shouldMigrate:", v6, v10, a4);

  }
  return v7;
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_194(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
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
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  uint64_t v61;
  _BOOL8 v62;
  unsigned int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDate:", v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("display_date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayDate:", v7);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("read_later_date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateValue");
  v9 = objc_claimAutoreleasedReturnValue();

  v66 = (void *)v9;
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2C8]), "initWithDate:", v9);
    objc_msgSend(v3, "setReadLater:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("subject_prefix"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("subject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("journaled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v13)
    v16 = 0;
  else
    v16 = v15;
  if (v16 == 1)
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v69 = v18;
      v70 = 2114;
      v71 = v19;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Unable to find subject from display message %{public}@ for journaled thread %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "_nonJournaledSubjectForThreadWithObjectID:connection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E7A0]), "initWithPrefix:subjectWithoutPrefix:", v67, v13);
  objc_msgSend(v3, "setSubject:", v20);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("summary"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSummary:", v22);

  v23 = MEMORY[0x1E0C9AA60];
  if (*(_QWORD *)(a1 + 72))
    v24 = *(_QWORD *)(a1 + 72);
  else
    v24 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v3, "setSenderList:", v24);
  if (*(_QWORD *)(a1 + 80))
    v25 = *(_QWORD *)(a1 + 80);
  else
    v25 = v23;
  objc_msgSend(v3, "setToList:", v25);
  if (*(_QWORD *)(a1 + 88))
    v26 = *(_QWORD *)(a1 + 88);
  else
    v26 = v23;
  objc_msgSend(v3, "setCcList:", v26);
  objc_msgSend(v3, "setFlags:", *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("has_unflagged"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHasUnflagged:", objc_msgSend(v27, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 56), "_flagColorsFromRow:", *(_QWORD *)(a1 + 32));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlagColors:", v28);

  objc_msgSend(v3, "setIsVIP:", *(unsigned __int8 *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 56), "blockedSenderManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "areAnyEmailAddressesBlocked:", *(_QWORD *)(a1 + 72));

  objc_msgSend(v3, "setIsBlocked:", v30);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("unsubscribe_type"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUnsubscribeType:", objc_msgSend(v31, "integerValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("has_attachments"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHasAttachments:", objc_msgSend(v32, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("flags"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "numberValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = +[EDConversationPersistence conversationNotificationLevelForConversationFlags:](EDConversationPersistence, "conversationNotificationLevelForConversationFlags:", objc_msgSend(v34, "unsignedLongLongValue"));

  objc_msgSend(v3, "setConversationNotificationLevel:", v35);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "numberValue");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCount:", objc_msgSend(v37, "unsignedIntegerValue"));

  objc_msgSend(v3, "setMailboxes:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v3, "setDisplayMessageItemID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 56), "messagePersistence");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "mailboxPersistence");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMailboxTypeResolver:", v39);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("follow_up_start_date"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dateValue");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("follow_up_end_date"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "dateValue");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringValue");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41 && v43)
  {
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E178]), "initWithStartDate:endDate:jsonStringForModelEvaluationForSuggestions:", v41, v43, v45);
    objc_msgSend(v3, "setFollowUp:", v46);

  }
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("generated_summary"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "dataValue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v48, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("urgent"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v49, "BOOLValue");

      v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v48, 0);
      objc_msgSend(v65, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D1DDB0]);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D1DDA8]);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 112));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "int64Value");

        if (v52)
          v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1F0]), "initWithGlobalMessageID:", v52);
        else
          v53 = 0;
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E188]), "initWithTopLine:synopsis:urgent:messageItemID:", v50, v64, v63, v53);
        objc_msgSend(v3, "setGeneratedSummary:", v54);

      }
    }

  }
  if (_os_feature_enabled_impl())
  {
    +[EDCategoryPersistence categoryForResultRow:](EDCategoryPersistence, "categoryForResultRow:", *(_QWORD *)(a1 + 32));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCategory:", v55);

    v56 = *(void **)(a1 + 32);
    +[EDMessagePersistence messageGlobalDataValidationState](EDMessagePersistence, "messageGlobalDataValidationState");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "numberValue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "integerValue");
    if ((v60 & 0x10000) == 0)
    {
      v61 = (v60 >> 9) & 7;
      if ((v60 & 8) != 0 && v61 == 2)
      {
        if ((v60 & 0x34) == 0x14)
        {
LABEL_37:
          v62 = v61 == 0;
LABEL_40:
          objc_msgSend(v3, "setIsAuthenticated:", v62);

          goto LABEL_41;
        }
      }
      else if ((v60 & 4) != 0)
      {
        goto LABEL_37;
      }
    }
    v62 = 1;
    goto LABEL_40;
  }
LABEL_41:

}

void __72__EDThreadPersistence_threadScopeManager_populateThreadScopesWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v4, "databaseIDValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mailbox_type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("filter_predicate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("needs_update"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("last_viewed"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 != 0) == (v28 != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("EDThreadPersistence.m"), 3531, CFSTR("Pre-computed thread scope should have exactly one mailbox or mailbox type"));

    if (v6)
      goto LABEL_3;
LABEL_5:
    v20 = (void *)MEMORY[0x1E0D1E1E0];
    v29 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1, v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mailboxScopeForMailboxTypes:forExclusion:", v14, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v14);
  v16 = (void *)MEMORY[0x1E0D1E1E0];
  v30[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mailboxScopeForMailboxObjectIDs:forExclusion:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "threadScopeManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mailboxPersistence");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "mailboxProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "threadScopeFromPrecomputedMailboxScope:predicates:mailboxProvider:", v18, v10, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  char v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v31 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D1E780]);
  v4 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_3;
  v46[3] = &unk_1E94A1AB0;
  v5 = v31;
  v47 = v5;
  v32 = (void *)objc_msgSend(v3, "initWithBuilder:", v46);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("global_message_id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "int64Value");

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1F0]), "initWithGlobalMessageID:", v7);
    v9 = *(id *)(a1 + 40);
    if (!*(_QWORD *)(a1 + 40))
    {
      v30 = v8;
      objc_msgSend(*(id *)(a1 + 32), "threadScope");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithThreadScope:", v29);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc(MEMORY[0x1E0D1E2C0]);
      v13 = objc_opt_class();
      v48[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "initWithTargetClass:predicate:sortDescriptors:", v13, v10, v14);

      v9 = (id)v15;
      v8 = v30;
    }
    v16 = objc_alloc(MEMORY[0x1E0D1E378]);
    v17 = *(_QWORD *)(a1 + 32);
    v33[0] = v4;
    v33[1] = 3221225472;
    v33[2] = __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_194;
    v33[3] = &unk_1E94A2278;
    v34 = v5;
    v18 = v8;
    v35 = v18;
    v19 = *(id *)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 48);
    v21 = *(void **)(a1 + 56);
    v36 = v19;
    v37 = v20;
    v38 = v21;
    v39 = *(id *)(a1 + 64);
    v40 = *(id *)(a1 + 72);
    v41 = *(id *)(a1 + 80);
    v42 = v32;
    v45 = *(_BYTE *)(a1 + 120);
    v43 = *(id *)(a1 + 88);
    v44 = *(id *)(a1 + 96);
    v22 = objc_msgSend(v16, "initWithObjectID:originatingQuery:builder:", v17, v9, v33);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_2_cold_1(a1, v25, v26);

    objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", *(_QWORD *)(a1 + 32));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v18 = *(id *)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;
  }

}

id __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "mailboxForObjectID:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __52__EDThreadPersistence__databaseIDForThreadObjectID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "databaseIDValue");

  *a4 = 1;
}

uint64_t __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  +[EDPersistenceDatabaseSchema mailboxesTableName](EDPersistenceDatabaseSchema, "mailboxesTableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("url"), v4);
  v6 = (id)objc_msgSend(v5, "join:sourceColumn:targetColumn:", CFSTR("thread_mailboxes"), *MEMORY[0x1E0D1EE00], CFSTR("mailbox"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("thread_mailboxes"), CFSTR("thread"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhere:", v8);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke_2;
  v11[3] = &unk_1E949AF78;
  v12 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v5, v11, 0);

  return v9;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  _QWORD v49[4];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[2];
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("scope"), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v44;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("conversation"), 0);
  v54 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v54;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("newest_read_message"), 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v42;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("newest_message"), 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v41;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("display_message"), 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v40;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date"), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v39;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("display_date"), 0, &unk_1E94E4C40);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v38;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("read_later_date"), 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v37;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("read"), 0, &unk_1E94E4C40);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v36;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flagged"), 0, &unk_1E94E4C40);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v35;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_red_flag"), 0, &unk_1E94E4C40);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v34;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_orange_flag"), 0, &unk_1E94E4C40);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v33;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_yellow_flag"), 0, &unk_1E94E4C40);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v32;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_green_flag"), 0, &unk_1E94E4C40);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v31;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_blue_flag"), 0, &unk_1E94E4C40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v30;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_purple_flag"), 0, &unk_1E94E4C40);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v29;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_gray_flag"), 0, &unk_1E94E4C40);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v28;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("draft"), 0, &unk_1E94E4C40);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v27;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("replied"), 0, &unk_1E94E4C40);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v26;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("forwarded"), 0, &unk_1E94E4C40);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v25;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("redirected"), 0, &unk_1E94E4C40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("junk_level_set_by_user"), 0, &unk_1E94E4C40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("junk_level"), 0, &unk_1E94E4C40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_unflagged"), 0, &unk_1E94E4C40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("has_attachments"), 0, &unk_1E94E4C40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("count"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("journaled"), 0, &unk_1E94E4C40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("threads"), 2, v10);

  v52[0] = CFSTR("scope");
  v52[1] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addUniquenessConstraintForColumns:conflictResolution:", v12, 1);

  v51[0] = CFSTR("scope");
  v51[1] = CFSTR("date");
  v51[2] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addIndexForColumns:", v13);

  v50[0] = CFSTR("scope");
  v50[1] = CFSTR("display_date");
  v50[2] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addIndexForColumns:", v14);

  v49[0] = CFSTR("journaled");
  v49[1] = CFSTR("scope");
  v49[2] = CFSTR("date");
  v49[3] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addIndexForColumns:", v15);

  v48 = CFSTR("newest_read_message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addIndexForColumns:", v16);

  v47 = CFSTR("newest_message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addIndexForColumns:", v17);

  v46 = CFSTR("display_message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addIndexForColumns:", v18);

  v19 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  v45[0] = CFSTR("journaled");
  v45[1] = CFSTR("date");
  v45[2] = CFSTR("scope");
  v45[3] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("journaled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "equalTo:", &unk_1E94E4C58);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithTableName:columnNames:where:unique:", CFSTR("threads"), v20, v22, 0);

  objc_msgSend(v11, "addIndex:", v23);
  return (EFSQLTableSchema *)v11;
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("needs_update"), 0, &unk_1E94E4C40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("last_viewed"), 0, &unk_1E94E4C40);
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

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  void *v5;
  uint64_t v6;
  void (**v7)(void *, void *, const __CFString *, void *);
  void (**v8)(void *, void *, const __CFString *, void *);
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
  void *v22;
  void *v23;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD aBlock[4];
  id v36;
  _QWORD v37[5];
  _QWORD v38[2];
  _QWORD v39[8];

  v39[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "threadScopesTableSchema");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadsTableSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadMailboxesTableSchema");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadSendersTableSchema");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadRecipientsTableSchema");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_2;
  aBlock[3] = &unk_1E949AE18;
  v36 = &__block_literal_global_78;
  v7 = (void (**)(void *, void *, const __CFString *, void *))_Block_copy(aBlock);
  v7[2](v7, v5, CFSTR("scope"), v32);
  v7[2](v7, v31, CFSTR("thread"), v5);
  v7[2](v7, v30, CFSTR("thread"), v5);
  v7[2](v7, v29, CFSTR("thread"), v5);
  v33[0] = v6;
  v33[1] = 3221225472;
  v33[2] = __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_4;
  v33[3] = &unk_1E94A2160;
  v34 = &__block_literal_global_87;
  v8 = (void (**)(void *, void *, const __CFString *, void *))_Block_copy(v33);
  +[EDPersistenceDatabaseSchema mailboxesTableName](EDPersistenceDatabaseSchema, "mailboxesTableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v32, CFSTR("mailbox"), v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDConversationPersistence conversationsTableName](EDConversationPersistence, "conversationsTableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v5, CFSTR("conversation"), v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_3((uint64_t)v11, v5, (uint64_t)CFSTR("newest_read_message"), v11, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_3((uint64_t)v13, v5, (uint64_t)CFSTR("newest_message"), v13, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_3((uint64_t)v15, v5, (uint64_t)CFSTR("display_message"), v15, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDPersistenceDatabaseSchema mailboxesTableName](EDPersistenceDatabaseSchema, "mailboxesTableName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v31, CFSTR("mailbox"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDMessagePersistence addressesTableName](EDMessagePersistence, "addressesTableName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_5((uint64_t)v19, v30, (uint64_t)CFSTR("address"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDMessagePersistence addressesTableName](EDMessagePersistence, "addressesTableName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_5((uint64_t)v21, v29, (uint64_t)CFSTR("address"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = v28;
  v39[1] = v27;
  v39[2] = v12;
  v39[3] = v14;
  v39[4] = v16;
  v39[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 6);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  v38[0] = v20;
  v38[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v37[0] = v32;
  v37[1] = v5;
  v37[2] = v31;
  v37[3] = v30;
  v37[4] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

uint64_t __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a2, "columnForName:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAsForeignKeyForTable:onDelete:onUpdate:", v9, a5, 0);

}

id __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (id)objc_claimAutoreleasedReturnValue();
}

EDPersistenceForeignKeyPlaceholder *__75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  void *v9;
  EDPersistenceForeignKeyPlaceholder *v10;

  v8 = a4;
  objc_msgSend(a2, "columnForName:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:]([EDPersistenceForeignKeyPlaceholder alloc], "initWithColumn:tableName:onDelete:onUpdate:", v9, v8, a5, 0);

  return v10;
}

EDPersistenceAssociationPlaceholder *__75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  EDPersistenceAssociationPlaceholder *v8;

  v6 = a4;
  objc_msgSend(a2, "columnForName:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:]([EDPersistenceAssociationPlaceholder alloc], "initWithColumn:tableName:", v7, v6);

  return v8;
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("priority"), 0, &unk_1E94E4C40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("thread");
  v15[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:conflictResolution:", CFSTR("thread_senders"), v7, v8, 5);

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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("priority"), 0, &unk_1E94E4C40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("thread");
  v16[1] = CFSTR("type");
  v16[2] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:conflictResolution:", CFSTR("thread_recipients"), v8, v9, 5);

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

  objc_msgSend(v7, "addIndexForColumns:", &unk_1E94E5680);
  return (EFSQLTableSchema *)v7;
}

BOOL __103__EDThreadPersistence__enumerateThreadObjectIDsForThreadScope_filterClause_sortDescriptors_batchBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "threadScopeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "databaseIDForThreadScope:", *(_QWORD *)(a1 + 40));

  if (v5 == *MEMORY[0x1E0D1DC08])
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("conversation"), CFSTR("threads"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("scope"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "equalTo:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(a1 + 48))
    {
      v11 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v12 = *(_QWORD *)(a1 + 48);
      v19[0] = v10;
      v19[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithExpressions:", v13);
      objc_msgSend(v7, "setWhere:", v14);

    }
    else
    {
      objc_msgSend(v7, "setWhere:", v10);
    }
    objc_msgSend(*(id *)(a1 + 32), "_addOrderByToThreadSelect:forSortDescriptors:", v7, *(_QWORD *)(a1 + 56));
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __103__EDThreadPersistence__enumerateThreadObjectIDsForThreadScope_filterClause_sortDescriptors_batchBlock___block_invoke_2;
    v16[3] = &unk_1E94A2228;
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 64);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v7, v16, 0);
    v6 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) != 0;

  }
  return v6;
}

- (void)_addOrderByToThreadSelect:(id)a3 forSortDescriptors:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  int v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    v8 = *MEMORY[0x1E0D1DD60];
    v9 = *MEMORY[0x1E0D1DD68];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v8);

        if (v13)
        {
          v14 = objc_msgSend(v11, "ascending");
          v15 = CFSTR("date");
        }
        else
        {
          objc_msgSend(v11, "key");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v9);

          if (!v17)
            continue;
          v14 = objc_msgSend(v11, "ascending");
          v15 = CFSTR("display_date");
        }
        objc_msgSend(v5, "orderByColumn:fromTable:ascending:", v15, CFSTR("threads"), v14);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  objc_msgSend(v5, "orderByColumn:fromTable:ascending:", CFSTR("conversation"), CFSTR("threads"), 1);
}

uint64_t __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  char v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;

  objc_msgSend(*(id *)(a1 + 32), "threadScopeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "databaseIDForThreadScope:", *(_QWORD *)(a1 + 40));

  if (v3 == *MEMORY[0x1E0D1DC08])
    return 1;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("journaled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "equalTo:", &unk_1E94E4C40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke_2;
  v25[3] = &unk_1E94A21B0;
  v12 = v5;
  v26 = v12;
  v21 = *(_OWORD *)(a1 + 64);
  v13 = (id)v21;
  v27 = v21;
  v14 = objc_msgSend(v8, "_enumerateThreadObjectIDsForThreadScope:filterClause:sortDescriptors:batchBlock:", v9, v7, v10, v25);
  v24 = 0;
  if (objc_msgSend(v12, "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("journaled"), v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "equalTo:", &unk_1E94E4C58);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(void **)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke_3;
  v22[3] = &unk_1E94A21D8;
  v19 = *(_QWORD *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v4 = v14 & objc_msgSend(v17, "_enumerateThreadObjectIDsForThreadScope:filterClause:sortDescriptors:batchBlock:", v18, v16, v19, v22);

  return v4;
}

- (BOOL)_enumerateThreadObjectIDsForThreadScope:(id)a3 filterClause:(id)a4 sortDescriptors:(id)a5 batchBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  -[EDThreadPersistence database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _enumerateThreadObjectIDsForThreadScope:filterClause:sortDescriptors:batchBlock:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __103__EDThreadPersistence__enumerateThreadObjectIDsForThreadScope_filterClause_sortDescriptors_batchBlock___block_invoke;
  v21[3] = &unk_1E94A2250;
  v21[4] = self;
  v16 = v10;
  v22 = v16;
  v17 = v11;
  v23 = v17;
  v18 = v12;
  v24 = v18;
  v26 = &v27;
  v19 = v13;
  v25 = v19;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v21);

  LOBYTE(v10) = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v27, 8);

  return (char)v10;
}

- (void)threadObjectIDsForThreadScope:(id)a3 sortDescriptors:(id)a4 initialBatchSize:(unint64_t)a5 journaledObjectIDs:(id)a6 batchBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[4];

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = a5;
  -[EDThreadPersistence database](self, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence threadObjectIDsForThreadScope:sortDescriptors:initialBatchSize:journaledObjectIDs:batchBlock:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke;
  v22[3] = &unk_1E94A2200;
  v22[4] = self;
  v18 = v12;
  v23 = v18;
  v19 = v13;
  v24 = v19;
  v27 = v28;
  v20 = v15;
  v26 = v20;
  v21 = v14;
  v25 = v21;
  objc_msgSend(v16, "__performReadWithCaller:usingBlock:", v17, v22);

  _Block_object_dispose(v28, 8);
}

- (id)threadScopesByDatabaseID
{
  void *v2;
  void *v3;

  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadScopesByDatabaseID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EDThreadPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_90 != -1)
    dispatch_once(&log_onceToken_90, block);
  return (OS_os_log *)(id)log_log_90;
}

void __26__EDThreadPersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_90;
  log_log_90 = (uint64_t)v1;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__EDThreadPersistence_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_10 != -1)
    dispatch_once(&signpostLog_onceToken_10, block);
  return (OS_os_log *)(id)signpostLog_log_10;
}

void __34__EDThreadPersistence_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_10;
  signpostLog_log_10 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (EDThreadPersistence)initWithMessagePersistence:(id)a3 categoryPersistence:(id)a4 database:(id)a5 hookRegistry:(id)a6 vipManager:(id)a7 blockedSenderManager:(id)a8
{
  id v15;
  id v16;
  EDThreadPersistence *v17;
  EDThreadPersistence *v18;
  NSMutableSet *v19;
  NSMutableSet *threadObjectIDsToRecompute;
  EDThreadScopeManager *v21;
  EDThreadScopeManager *threadScopeManager;
  NSMutableArray *v23;
  NSMutableArray *migratingThreadScopes;
  NSMutableDictionary *v25;
  NSMutableDictionary *backgroundProcessingAssertionsByMigratingThreadScope;
  uint64_t v27;
  EFScheduler *consistencyCheckScheduler;
  uint64_t v29;
  EFScheduler *threadRecomputationScheduler;
  id v31;
  EFScheduler *v32;
  uint64_t v33;
  EFDebouncer *threadRecomputationDebouncer;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;

  v39 = a3;
  v38 = a4;
  v37 = a5;
  v15 = a6;
  v36 = a7;
  v16 = a8;
  v43.receiver = self;
  v43.super_class = (Class)EDThreadPersistence;
  v17 = -[EDThreadPersistence init](&v43, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_messagePersistence, a3);
    objc_storeStrong((id *)&v18->_database, a5);
    objc_storeStrong((id *)&v18->_hookRegistry, a6);
    objc_storeStrong((id *)&v18->_vipManager, a7);
    objc_storeStrong((id *)&v18->_blockedSenderManager, a8);
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    threadObjectIDsToRecompute = v18->_threadObjectIDsToRecompute;
    v18->_threadObjectIDsToRecompute = v19;

    v18->_threadRecomputationLock._os_unfair_lock_opaque = 0;
    v21 = -[EDThreadScopeManager initWithDataSource:]([EDThreadScopeManager alloc], "initWithDataSource:", v18, v36, v37, v38, v39);
    threadScopeManager = v18->_threadScopeManager;
    v18->_threadScopeManager = v21;

    v18->_migratingThreadScopesLock._os_unfair_lock_opaque = 0;
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    migratingThreadScopes = v18->_migratingThreadScopes;
    v18->_migratingThreadScopes = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backgroundProcessingAssertionsByMigratingThreadScope = v18->_backgroundProcessingAssertionsByMigratingThreadScope;
    v18->_backgroundProcessingAssertionsByMigratingThreadScope = v25;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.EmailDaemon.EDThreadPersistence.consistencyCheckScheduler"), 9);
    v27 = objc_claimAutoreleasedReturnValue();
    consistencyCheckScheduler = v18->_consistencyCheckScheduler;
    v18->_consistencyCheckScheduler = (EFScheduler *)v27;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.EmailDaemon.EDThreadPersistence.threadRecomputationScheduler"), 9);
    v29 = objc_claimAutoreleasedReturnValue();
    threadRecomputationScheduler = v18->_threadRecomputationScheduler;
    v18->_threadRecomputationScheduler = (EFScheduler *)v29;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v18);
    v31 = objc_alloc(MEMORY[0x1E0D1EEA0]);
    v32 = v18->_threadRecomputationScheduler;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __124__EDThreadPersistence_initWithMessagePersistence_categoryPersistence_database_hookRegistry_vipManager_blockedSenderManager___block_invoke;
    v40[3] = &unk_1E94A0710;
    objc_copyWeak(&v41, &location);
    v33 = objc_msgSend(v31, "initWithTimeInterval:scheduler:startAfter:block:", v32, 0, v40, 10.0);
    threadRecomputationDebouncer = v18->_threadRecomputationDebouncer;
    v18->_threadRecomputationDebouncer = (EFDebouncer *)v33;

    objc_msgSend(v15, "registerDatabaseChangeHookResponder:", v18);
    objc_msgSend(v15, "registerMailboxChangeHookResponder:", v18);
    objc_msgSend(v15, "registerMessageChangeHookResponder:", v18);
    objc_storeStrong((id *)&v18->_categoryPersistence, a4);
    objc_msgSend(v15, "registerCategoryChangeHookResponder:", v18);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __124__EDThreadPersistence_initWithMessagePersistence_categoryPersistence_database_hookRegistry_vipManager_blockedSenderManager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_recomputeThreads");

}

- (void)_enumerateThreadScopesUsingBlock:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;

  v5 = a3;
  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadScopesByDatabaseID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxPersistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mailboxProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__EDThreadPersistence__enumerateThreadScopesUsingBlock___block_invoke;
  v13[3] = &unk_1E94A2188;
  v16 = a2;
  v13[4] = self;
  v14 = v10;
  v12 = v5;
  v15 = v12;
  v11 = v10;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);

}

void __56__EDThreadPersistence__enumerateThreadScopesUsingBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(v5, "mailboxScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
  {
    objc_msgSend(v5, "filterPredicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("EDThreadPersistence.m"), 396, CFSTR("Thread scope with \"all mailboxes\" mailbox scope must have filter predicate"));

    }
    v10 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v5, "filterPredicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mailboxScopeForPredicate:withMailboxTypeResolver:", v11, a1[5]);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)test_tearDown
{
  id v4;
  id v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDThreadPersistence.m"), 405, CFSTR("%s can only be called from unit tests"), "-[EDThreadPersistence test_tearDown]");

  }
  -[EDThreadPersistence consistencyCheckScheduler](self, "consistencyCheckScheduler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSyncBlock:", &__block_literal_global_125_0);

}

- (unint64_t)persistenceStateForThreadScope:(id)a3 wantsPrecomputed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  int v8;
  NSObject *v9;
  os_unfair_lock_s *p_migratingThreadScopesLock;
  NSObject *v11;
  NSObject *v12;
  unsigned __int8 v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0;
  if (-[EDThreadPersistence _isThreadScopePrecomputed:shouldMigrate:](self, "_isThreadScopePrecomputed:shouldMigrate:", v6, &v14))
  {
    v7 = 1;
  }
  else
  {
    v8 = v14;
    if (v4 && !v14)
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[EDThreadPersistence persistenceStateForThreadScope:wantsPrecomputed:].cold.1();

      v8 = v14;
    }
    if (v8)
    {
      p_migratingThreadScopesLock = &self->_migratingThreadScopesLock;
      os_unfair_lock_lock(&self->_migratingThreadScopesLock);
      if (-[NSMutableArray containsObject:](self->_migratingThreadScopes, "containsObject:", v6))
      {
        +[EDThreadPersistence log](EDThreadPersistence, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v6;
          _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Migration in progress for threadscope: %{public}@", buf, 0xCu);
        }

        v14 = 0;
      }
      else
      {
        +[EDThreadPersistence log](EDThreadPersistence, "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v6;
          _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Migration requested for threadscope: %{public}@", buf, 0xCu);
        }

        -[NSMutableArray addObject:](self->_migratingThreadScopes, "addObject:", v6);
      }
      os_unfair_lock_unlock(p_migratingThreadScopesLock);
      v7 = 2 * v14;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)resetThreadScopesForMailboxScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  EDThreadPersistence *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  -[EDThreadPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence resetThreadScopesForMailboxScope:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__EDThreadPersistence_resetThreadScopesForMailboxScope___block_invoke;
  v9[3] = &unk_1E949AF00;
  v7 = v4;
  v10 = v7;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  if (*((_BYTE *)v14 + 24))
  {
    -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v8, "removeThreadScopesForMailboxScope:", v7);
    else
      objc_msgSend(v8, "removeAllThreadScopes");

  }
  _Block_object_dispose(&v13, 8);

}

BOOL __56__EDThreadPersistence_resetThreadScopesForMailboxScope___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "mailboxTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mailbox_type"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "in:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "mailboxObjectIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "messagePersistence");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mailboxPersistence");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v6, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mailbox"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "in:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("thread_scopes"), v7);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "executeDeleteStatement:error:", v12, 0);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v13 = 1;
    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:", CFSTR("threads"));

      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_BYTE *)(v15 + 24))
      {
        v16 = objc_msgSend(v3, "executeDeleteStatement:error:", v14, 0);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      }
      else
      {
        v16 = 0;
      }
      *(_BYTE *)(v15 + 24) = v16;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:", CFSTR("thread_mailboxes"));

      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_BYTE *)(v18 + 24))
      {
        v19 = objc_msgSend(v3, "executeDeleteStatement:error:", v17, 0);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      }
      else
      {
        v19 = 0;
      }
      *(_BYTE *)(v18 + 24) = v19;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:", CFSTR("thread_senders"));

      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_BYTE *)(v21 + 24))
      {
        v22 = objc_msgSend(v3, "executeDeleteStatement:error:", v20, 0);
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      }
      else
      {
        v22 = 0;
      }
      *(_BYTE *)(v21 + 24) = v22;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:", CFSTR("thread_recipients"));

      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_BYTE *)(v23 + 24))
      {
        v24 = objc_msgSend(v3, "executeDeleteStatement:error:", v12, 0);
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      }
      else
      {
        v24 = 0;
      }
      *(_BYTE *)(v23 + 24) = v24;
      v13 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_145(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isVIPAddress:", v3);

  return v4;
}

- (id)_nonJournaledSubjectForThreadWithObjectID:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDThreadPersistence _messageThreadExpressionForThreadObjectID:](self, "_messageThreadExpressionForThreadObjectID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("journaled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "equalTo:", &unk_1E94E4C40);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithResultColumn:table:", CFSTR("subject"), v12);

  v14 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v30[0] = v8;
  v30[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithExpressions:", v15);
  objc_msgSend(v13, "setWhere:", v16);

  +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orderByColumn:ascending:", v17, 0);

  objc_msgSend(v13, "setLimit:", 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("subject"), CFSTR("subjects"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "in:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWhere:", v20);

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__37;
  v28 = __Block_byref_object_dispose__37;
  v29 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __76__EDThreadPersistence__nonJournaledSubjectForThreadWithObjectID_connection___block_invoke;
  v23[3] = &unk_1E949B090;
  v23[4] = &v24;
  objc_msgSend(v7, "executeSelectStatement:withBlock:error:", v18, v23, 0);
  v21 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v21;
}

void __76__EDThreadPersistence__nonJournaledSubjectForThreadWithObjectID_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)changeForThreadWithObjectID:(id)a3 changedKeyPaths:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__37;
  v22 = __Block_byref_object_dispose__37;
  v23 = 0;
  -[EDThreadPersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence changeForThreadWithObjectID:changedKeyPaths:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke;
  v14[3] = &unk_1E949C9A8;
  v14[4] = self;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v17 = &v18;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v14);

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  char v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_databaseIDForThreadObjectID:", *(_QWORD *)(a1 + 40));
  if (v4 == *MEMORY[0x1E0D1DC08])
  {
    v5 = 1;
    goto LABEL_60;
  }
  v40 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v6;
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DDF0]) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DE08]))
  {
    objc_msgSend(*(id *)(a1 + 32), "_mailboxesForThreadDatabaseID:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v3, "protectedDatabaseAttached");
  v38 = (void *)v7;
  v9 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DE60]);
  if ((v8 & v9) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendersForThreadDatabaseID:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
      objc_msgSend(*(id *)(a1 + 32), "_scheduleRecomputationForThread:reason:", *(_QWORD *)(a1 + 40), CFSTR("no sender on change"));
  }
  else
  {
    v10 = 0;
  }
  v37 = v10;
  if (!v8)
  {
    v36 = 0;
LABEL_18:
    v11 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DE90]))
  {
    objc_msgSend(*(id *)(a1 + 32), "_recipientsOfType:forThreadDatabaseID:", 1, v6);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DD20]))
    goto LABEL_18;
  objc_msgSend(*(id *)(a1 + 32), "_recipientsOfType:forThreadDatabaseID:", 2, v6);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_19:
  v47 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DD70]);
  if (v8)
  {
    v12 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DE70]);
    v13 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DE78]);
    v8 = v12;
  }
  else
  {
    LOBYTE(v12) = 0;
    v13 = 0;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DD60]) & 1) != 0)
    v46 = 1;
  else
    v46 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DD68]);
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DE28]) & 1) != 0)
    v45 = 1;
  else
    v45 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DE30]);
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DD98]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DD88]) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    v14 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DD90]);
  }
  v44 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DD80]);
  v43 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DDC8]);
  v42 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DD78]);
  v32 = v12;
  v33 = v9;
  v41 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DDC0]);
  v15 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D1DD58]);
  v35 = (void *)v11;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("date"), CFSTR("threads"));
  v17 = *MEMORY[0x1E0D1EE00];
  v18 = (id)objc_msgSend(v16, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("conversations"), CFSTR("conversation"), *MEMORY[0x1E0D1EE00]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v19 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v19;
  if (((v47 | v8) & 1) != 0 || (v13 & 1) != 0 || v14)
  {
    objc_msgSend(v16, "leftOuterJoin:sourceColumn:targetColumn:", v19, CFSTR("display_message"), v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  if (v47)
  {
    objc_msgSend(v16, "addResultColumn:", CFSTR("display_message"));
    objc_msgSend(v20, "addResultColumn:", CFSTR("global_message_id"));
  }
  if (v8)
  {
    objc_msgSend(v20, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("subjects"), CFSTR("subject"), v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addResultColumn:", CFSTR("subject_prefix"));
    objc_msgSend(v21, "addResultColumn:", CFSTR("subject"));

  }
  if (v13)
  {
    objc_msgSend(v20, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("summaries"), CFSTR("summary"), v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addResultColumn:", CFSTR("summary"));

  }
  if (v46)
  {
    objc_msgSend(v16, "addResultColumn:", CFSTR("date"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("display_date"));
  }
  if (v45)
    objc_msgSend(v16, "addResultColumn:", CFSTR("read_later_date"));
  if (v14)
  {
    objc_msgSend(v20, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("message_global_data"), CFSTR("global_message_id"), v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addResultColumn:", CFSTR("follow_up_start_date"));
    objc_msgSend(v23, "addResultColumn:", CFSTR("follow_up_end_date"));
    objc_msgSend(v23, "addResultColumn:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));

  }
  if (v44)
  {
    objc_msgSend(v16, "addResultColumn:", CFSTR("read"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("flagged"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("draft"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("replied"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("forwarded"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("redirected"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("junk_level_set_by_user"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("junk_level"));
  }
  if (v43)
    objc_msgSend(v16, "addResultColumn:", CFSTR("has_unflagged"));
  if (v42)
  {
    objc_msgSend(v16, "addResultColumn:", CFSTR("has_red_flag"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("has_orange_flag"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("has_yellow_flag"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("has_green_flag"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("has_blue_flag"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("has_purple_flag"));
    objc_msgSend(v16, "addResultColumn:", CFSTR("has_gray_flag"));
  }
  if (v41)
    objc_msgSend(v16, "addResultColumn:", CFSTR("has_attachments"));
  if (v15)
    objc_msgSend(v16, "addResultColumn:", CFSTR("count"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("threads"), v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "equalTo:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWhere:", v25);

  objc_msgSend(v16, "setLimit:", 1);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke_2;
  v48[3] = &unk_1E94A22F0;
  v54 = *(_QWORD *)(a1 + 56);
  v55 = v33;
  v26 = v37;
  v49 = v26;
  v27 = v36;
  v50 = v27;
  v28 = v35;
  v51 = v28;
  v29 = v38;
  v56 = v47;
  v57 = v32;
  v58 = v13;
  v59 = v46;
  v60 = v45;
  v61 = v14;
  v62 = v44;
  v63 = v43;
  v64 = v42;
  v30 = *(_QWORD *)(a1 + 32);
  v52 = v29;
  v53 = v30;
  v65 = v41;
  v66 = v15;
  v3 = v40;
  v5 = objc_msgSend(v40, "executeSelectStatement:withBlock:error:", v16, v48, 0);

LABEL_60:
  return v5;
}

void __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
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
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;

  v47 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0D1E240]);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSenderList:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setToList:", *(_QWORD *)(a1 + 40), v47);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCcList:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setMailboxes:", *(_QWORD *)(a1 + 56));
  if (*(_BYTE *)(a1 + 81))
  {
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("global_message_id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "int64Value");

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1F0]), "initWithGlobalMessageID:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDisplayMessageItemID:", v8);

  }
  if (*(_BYTE *)(a1 + 82))
  {
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("subject_prefix"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("subject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E7A0]), "initWithPrefix:subjectWithoutPrefix:", v10, v12);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSubject:", v13);

  }
  if (*(_BYTE *)(a1 + 83))
  {
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("summary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSummary:", v16);
    if (!v15)

  }
  if (*(_BYTE *)(a1 + 84))
  {
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("date"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDate:", v18);

    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("display_date"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDisplayDate:", v20);

  }
  if (*(_BYTE *)(a1 + 85))
  {
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("read_later_date"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2C8]), "initWithDate:", v22);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v23;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setReadLater:", v23);

  }
  if (*(_BYTE *)(a1 + 86))
  {
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("follow_up_start_date"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dateValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("follow_up_end_date"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dateValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 && v28)
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E178]), "initWithStartDate:endDate:jsonStringForModelEvaluationForSuggestions:", v26, v28, v30);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFollowUp:", v31);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFollowUp:", v31);
    }

  }
  if (*(_BYTE *)(a1 + 87))
  {
    v32 = objc_alloc(MEMORY[0x1E0D1E780]);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke_3;
    v49[3] = &unk_1E94A1AB0;
    v50 = v48;
    v33 = (void *)objc_msgSend(v32, "initWithBuilder:", v49);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFlags:", v33);

  }
  if (*(_BYTE *)(a1 + 88))
  {
    v34 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("has_unflagged"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "numberValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "numberWithBool:", objc_msgSend(v36, "BOOLValue"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setHasUnflagged:", v37);

  }
  if (*(_BYTE *)(a1 + 89))
  {
    objc_msgSend(*(id *)(a1 + 64), "_flagColorsFromRow:", v48);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFlagColors:", v38);

  }
  if (*(_BYTE *)(a1 + 90))
  {
    v39 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("has_attachments"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "numberValue");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "numberWithBool:", objc_msgSend(v41, "BOOLValue"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setHasAttachments:", v42);

  }
  if (*(_BYTE *)(a1 + 91))
  {
    v43 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("count"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "numberValue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "numberWithUnsignedInteger:", objc_msgSend(v45, "unsignedIntegerValue"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCount:", v46);

  }
}

void __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("read"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRead:", objc_msgSend(v3, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("flagged"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFlagged:", objc_msgSend(v4, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("draft"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDraft:", objc_msgSend(v5, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("replied"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReplied:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("forwarded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setForwarded:", objc_msgSend(v7, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("redirected"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRedirected:", objc_msgSend(v8, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("junk_level_set_by_user"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setJunkLevelSetByUser:", objc_msgSend(v9, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("junk_level"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setJunkLevel:", objc_msgSend(v11, "unsignedIntegerValue"));

}

- (id)newestMessageItemIDForThreadWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__37;
  v17 = __Block_byref_object_dispose__37;
  v18 = 0;
  -[EDThreadPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence newestMessageItemIDForThreadWithObjectID:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__EDThreadPersistence_newestMessageItemIDForThreadWithObjectID___block_invoke;
  v10[3] = &unk_1E949AF00;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __64__EDThreadPersistence_newestMessageItemIDForThreadWithObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_databaseIDForThreadObjectID:", *(_QWORD *)(a1 + 40));
  if (v4 == *MEMORY[0x1E0D1DC08])
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithTable:", CFSTR("threads"));
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D1EE00];
    objc_msgSend(v7, "leftOuterJoin:sourceColumn:targetColumn:", v8, CFSTR("newest_message"), *MEMORY[0x1E0D1EE00]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addResultColumn:", CFSTR("global_message_id"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("threads"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "equalTo:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWhere:", v12);

    objc_msgSend(v7, "setLimit:", 1);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__EDThreadPersistence_newestMessageItemIDForThreadWithObjectID___block_invoke_2;
    v14[3] = &unk_1E949B090;
    v14[4] = *(_QWORD *)(a1 + 48);
    v5 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v7, v14, 0);

  }
  return v5;
}

void __64__EDThreadPersistence_newestMessageItemIDForThreadWithObjectID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("global_message_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64Value");

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1F0]), "initWithGlobalMessageID:", v4);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_sendersForThreadDatabaseID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("address"), CFSTR("addresses"));
  objc_msgSend(v5, "addResultColumn:", CFSTR("comment"));
  objc_msgSend(v5, "join:sourceColumn:targetColumn:", CFSTR("thread_senders"), *MEMORY[0x1E0D1EE00], CFSTR("address"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("thread_senders"), CFSTR("thread"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhere:", v8);

  objc_msgSend(v6, "orderByColumn:ascending:", CFSTR("priority"), 0);
  objc_msgSend(v6, "orderByColumn:ascending:", CFSTR("date"), 0);
  -[EDThreadPersistence _addressesFromSelectStatement:additionalRowHandling:](self, "_addressesFromSelectStatement:additionalRowHandling:", v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_sendersFromMessagesForThreadObjectID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[EDThreadPersistence _messageThreadExpressionForThreadObjectID:](self, "_messageThreadExpressionForThreadObjectID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _senderAddressesExpressionForMessages:](self, "_senderAddressesExpressionForMessages:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _addressesFromMessageAddressesStatement:](self, "_addressesFromMessageAddressesStatement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_recipientsOfType:(unint64_t)a3 fromMessagesForThreadObjectID:(id)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[EDThreadPersistence _messageThreadExpressionForThreadObjectID:](self, "_messageThreadExpressionForThreadObjectID:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _recipientAddressesExpressionForRecipientType:messages:](self, "_recipientAddressesExpressionForRecipientType:messages:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _addressesFromMessageAddressesStatement:](self, "_addressesFromMessageAddressesStatement:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_addressesFromMessageAddressesStatement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderByColumn:fromTable:ascending:", v5, v6, 0);

  objc_msgSend(v4, "setDistinct:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("address"), CFSTR("addresses"));
  objc_msgSend(v7, "addResultColumn:", CFSTR("comment"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "in:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWhere:", v9);

  -[EDThreadPersistence _addressesFromSelectStatement:additionalRowHandling:](self, "_addressesFromSelectStatement:additionalRowHandling:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)nextExistingThreadObjectIDForThreadObjectID:(id)a3 forSortDescriptors:(id)a4 journaledThreadsToCheck:(id)a5 excluding:(id)a6
{
  id v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  id v25;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  _BYTE *v34;
  uint64_t v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v10 = a4;
  v11 = (uint64_t (*)(uint64_t, uint64_t))a5;
  v12 = a6;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2114;
    v37 = v11;
    LOWORD(v38) = 2114;
    *(_QWORD *)((char *)&v38 + 2) = v12;
    _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Looking up thread before thread: %{public}@, sort descriptors: %{public}@, journaled threads: %{public}@, excluding: %{public}@", buf, 0x2Au);
  }

  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "threadScope");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "databaseIDForThreadScope:", v15);

  -[EDThreadPersistence _threadExpressionForThreadScopeDatabaseID:conversation:](self, "_threadExpressionForThreadScopeDatabaseID:conversation:", v16, objc_msgSend(v27, "conversationID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__37;
  *(_QWORD *)&v38 = __Block_byref_object_dispose__37;
  *((_QWORD *)&v38 + 1) = 0;
  -[EDThreadPersistence database](self, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence nextExistingThreadObjectIDForThreadObjectID:forSortDescriptors:journaledThreadsToCheck:excluding:]");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke;
  v28[3] = &unk_1E94A2380;
  v28[4] = self;
  v20 = v10;
  v29 = v20;
  v21 = v27;
  v30 = v21;
  v22 = v17;
  v31 = v22;
  v35 = v16;
  v23 = v12;
  v32 = v23;
  v24 = v11;
  v33 = v24;
  v34 = buf;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v28);

  v25 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v25;
}

uint64_t __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v55;
  _QWORD v56[5];
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[3];
  uint8_t buf[4];
  uint64_t v64;
  _QWORD v65[3];
  _QWORD v66[7];

  v66[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("conversation"), CFSTR("threads"));
  objc_msgSend(*(id *)(a1 + 32), "_comparisonExpressionForSortDescriptors:conversationID:threadExpression:threadScopeDatabaseID:connection:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "conversationID"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("scope"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 88));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "equalTo:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("journaled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "equalTo:", &unk_1E94E4C40);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 64), "count"))
    {
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("conversation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "ef_compactMap:", &__block_literal_global_225);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "notIn:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v66[0] = v8;
      v66[1] = v12;
      v66[2] = v55;
      v66[3] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v65[0] = v8;
      v65[1] = v55;
      v65[2] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EF90]), "initWithExpressions:", v13);
    objc_msgSend(v4, "setWhere:", v22);

    objc_msgSend(*(id *)(a1 + 32), "_addOrderByToThreadSelect:forSortDescriptors:", v4, *(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "setLimit:", 1);
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_2;
    v57[3] = &unk_1E949B090;
    v57[4] = &v58;
    if (!objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v57, 0))
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_3(v27, v39, v40, v41, v42, v43, v44, v45);
      v21 = 0;
      goto LABEL_24;
    }
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v59[3];
      *(_DWORD *)buf = 134217984;
      v64 = v24;
      _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_DEFAULT, "Found next unjournaled conversation ID: %lld", buf, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      objc_msgSend(*(id *)(a1 + 72), "ef_compactMap:", &__block_literal_global_227);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v59[3]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "arrayByAddingObject:", v26);
      v27 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("conversation"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "in:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v62[0] = v8;
      v62[1] = v29;
      v62[2] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
      v30 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EF90]), "initWithExpressions:", v30);
      objc_msgSend(v4, "setWhere:", v31);

      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_2_228;
      v56[3] = &unk_1E949B090;
      v56[4] = &v58;
      if (!objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v56, 0))
      {
        +[EDThreadPersistence log](EDThreadPersistence, "log");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_2(v46, v47, v48, v49, v50, v51, v52, v53);

        v21 = 0;
        v13 = (void *)v30;
        goto LABEL_24;
      }
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v59[3];
        *(_DWORD *)buf = 134217984;
        v64 = v33;
        _os_log_impl(&dword_1D2F2C000, v32, OS_LOG_TYPE_DEFAULT, "Found next conversation ID, including journaled: %lld", buf, 0xCu);
      }

      v13 = (void *)v30;
    }
    if (!v59[3])
    {
      v21 = 1;
      goto LABEL_25;
    }
    v34 = objc_alloc(MEMORY[0x1E0D1E380]);
    v35 = v59[3];
    objc_msgSend(*(id *)(a1 + 48), "threadScope");
    v27 = objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "initWithConversationID:threadScope:", v35, v27);
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v36;

    v21 = 1;
LABEL_24:

LABEL_25:
    _Block_object_dispose(&v58, 8);

    goto LABEL_26;
  }
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_1(v8, v14, v15, v16, v17, v18, v19, v20);
  v21 = 1;
LABEL_26:

  return v21;
}

id __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_223(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "conversationID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

id __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_226(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "conversationID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_2_228(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (id)threadObjectIDsByNextExistingForThreadObjectIDs:(id)a3 forSortDescriptors:(id)a4 journaledThreadsToCheck:(id)a5
{
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t (**v18)(void *, void *, uint64_t, _QWORD);
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v47;
  id v48;
  _QWORD v49[5];
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  _QWORD aBlock[4];
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  void *v68;
  id v69;
  char v70[32];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v47 = a4;
  v48 = a5;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[EDThreadPersistence threadObjectIDsByNextExistingForThreadObjectIDs:forSortDescriptors:journaledThreadsToCheck:].cold.1((uint64_t)v45, (uint64_t)v70, objc_msgSend(v45, "count"));

  if (objc_msgSend(v45, "count"))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v45, "count"));
    v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v45, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDThreadPersistence nextExistingThreadObjectIDForThreadObjectID:forSortDescriptors:journaledThreadsToCheck:excluding:](self, "nextExistingThreadObjectIDForThreadObjectID:forSortDescriptors:journaledThreadsToCheck:excluding:", v8, v47, v48, v45);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v9, &unk_1E94E4C40);
      v62 = 0;
      v63 = &v62;
      v64 = 0x3032000000;
      v65 = __Block_byref_object_copy__37;
      v66 = __Block_byref_object_dispose__37;
      v67 = (id)0xAAAAAAAAAAAAAAAALL;
      v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v45, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (id)objc_msgSend(v10, "initWithObjects:", v11, 0);

      objc_msgSend(v42, "removeIndex:", 0);
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v63[5], v9);
      if (objc_msgSend(v45, "count") == 1)
      {
        v12 = v44;
      }
      else
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke;
        aBlock[3] = &unk_1E94A23A8;
        v15 = v43;
        v57 = v15;
        v16 = v42;
        v58 = v16;
        v61 = &v62;
        v41 = v44;
        v59 = v41;
        v17 = v45;
        v60 = v17;
        v18 = (uint64_t (**)(void *, void *, uint64_t, _QWORD))_Block_copy(aBlock);
        objc_msgSend(v17, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDThreadPersistence nextExistingThreadObjectIDForThreadObjectID:forSortDescriptors:journaledThreadsToCheck:excluding:](self, "nextExistingThreadObjectIDForThreadObjectID:forSortDescriptors:journaledThreadsToCheck:excluding:", v19, v47, v48, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          v22 = v20;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        v23 = v22;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count") - 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v24);

        if ((v18[2](v18, v23, objc_msgSend(v17, "count") - 1, 0) & 1) == 0)
        {
          objc_msgSend(v16, "removeIndex:", objc_msgSend(v17, "count") - 1);
          v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v17, "lastObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "initWithObjects:", v26, 0);
          v28 = (void *)v63[5];
          v63[5] = v27;

          objc_msgSend(v41, "setObject:forKeyedSubscript:", v63[5], v23);
        }
        v51 = 0;
        v52 = &v51;
        v53 = 0x3010000000;
        v54 = &unk_1D31C0AC1;
        v55 = xmmword_1D317A9A0;
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke_2;
        v50[3] = &unk_1E94A23D0;
        v50[4] = &v51;
        objc_msgSend(v16, "enumerateRangesUsingBlock:", v50);
        v29 = v52;
        v30 = v52[4];
        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = v23;
        }
        else
        {
          do
          {
            v31 = v30 + ((unint64_t)v29[5] >> 1);
            objc_msgSend(v17, "objectAtIndexedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[EDThreadPersistence nextExistingThreadObjectIDForThreadObjectID:forSortDescriptors:journaledThreadsToCheck:excluding:](self, "nextExistingThreadObjectIDForThreadObjectID:forSortDescriptors:journaledThreadsToCheck:excluding:", v32, v47, v48, v17);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (v33)
            {
              v35 = v33;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v35 = (id)objc_claimAutoreleasedReturnValue();
            }
            v9 = v35;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, v36);

            if ((v18[2](v18, v9, v31, v52[4] - 1) & 1) == 0 && (v18[2](v18, v9, v31, v52[5] + v52[4]) & 1) == 0)
            {
              objc_msgSend(v16, "removeIndex:", v31);
              v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v32, 0);
              v38 = (void *)v63[5];
              v63[5] = v37;

              objc_msgSend(v41, "setObject:forKeyedSubscript:", v63[5], v9);
            }
            *((_OWORD *)v52 + 2) = xmmword_1D317A9A0;
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke_3;
            v49[3] = &unk_1E94A23D0;
            v49[4] = &v51;
            objc_msgSend(v16, "enumerateRangesUsingBlock:", v49);

            v29 = v52;
            v30 = v52[4];
            v23 = v9;
          }
          while (v30 != 0x7FFFFFFFFFFFFFFFLL);
        }
        v39 = v41;
        _Block_object_dispose(&v51, 8);

      }
      _Block_object_dispose(&v62, 8);

      v14 = v9;
      v13 = v44;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v14;
      v69 = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v13;
}

uint64_t __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEqual:", v7);
  if ((v11 & 1) != 0)
  {
    v12 = a4 - a3;
    if (a4 >= a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "removeIndexesInRange:", a3, a4 - a3);
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, a4 - a3);
      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 56), "subarrayWithRange:", a3, v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "insertObjects:atIndexes:", v24, v19);

    }
    else
    {
      v13 = a3 - a4;
      objc_msgSend(*(id *)(a1 + 40), "removeIndexesInRange:", a4 + 1, v13);
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v17 = *(void **)(a1 + 56);
      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(v17, "subarrayWithRange:", a4 + 1, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObjectsFromArray:", v19);
    }

  }
  return v11;
}

uint64_t __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

uint64_t __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

- (id)_comparisonExpressionForSortDescriptors:(id)a3 conversationID:(int64_t)a4 threadExpression:(id)a5 threadScopeDatabaseID:(int64_t)a6 connection:(id)a7
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id obj;
  id v43;
  EDThreadPersistence *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v38 = a5;
  v39 = a7;
  v37 = v10;
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _columnForSortDescriptor:](self, "_columnForSortDescriptor:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v40 = (void *)v12;
  if (v12)
  {
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", v12, CFSTR("threads"));
    -[NSObject setWhere:](v36, "setWhere:", v38);
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__37;
    v54 = __Block_byref_object_dispose__37;
    v55 = 0;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __128__EDThreadPersistence__comparisonExpressionForSortDescriptors_conversationID_threadExpression_threadScopeDatabaseID_connection___block_invoke;
    v49[3] = &unk_1E949B090;
    v49[4] = &v50;
    objc_msgSend(v39, "executeSelectStatement:withBlock:error:", v36, v49, 0);
    if (v51[5])
    {
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v44 = self;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      obj = v10;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v46 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            -[EDThreadPersistence _columnForSortDescriptor:](v44, "_columnForSortDescriptor:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("threads"), v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v16, "ascending");
              v20 = objc_alloc(MEMORY[0x1E0D1EFA0]);
              if (v19)
                v21 = 2;
              else
                v21 = 4;
              v22 = (void *)objc_msgSend(v20, "initWithLeft:operator:right:", v18, v21, v51[5]);
              objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("threads"), CFSTR("conversation"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "greaterThan:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v26 = objc_alloc(MEMORY[0x1E0D1EF90]);
              objc_msgSend(v18, "equalTo:", v51[5]);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v57[0] = v27;
              v57[1] = v25;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = (void *)objc_msgSend(v26, "initWithExpressions:", v28);

              v30 = objc_alloc(MEMORY[0x1E0D1F020]);
              v56[0] = v22;
              v56[1] = v29;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (void *)objc_msgSend(v30, "initWithExpressions:", v31);

              objc_msgSend(v43, "addObject:", v32);
            }

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
        }
        while (v13);
      }

      if ((unint64_t)objc_msgSend(v43, "count") < 2)
      {
        objc_msgSend(v43, "firstObject");
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EF90]), "initWithExpressions:", v43);
      }
      v34 = (void *)v33;

    }
    else
    {
      v34 = 0;
    }
    _Block_object_dispose(&v50, 8);

  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      -[EDThreadPersistence _comparisonExpressionForSortDescriptors:conversationID:threadExpression:threadScopeDatabaseID:connection:].cold.1();
    v34 = (void *)MEMORY[0x1E0C9AAB0];
  }

  return v34;
}

void __128__EDThreadPersistence__comparisonExpressionForSortDescriptors_conversationID_threadExpression_threadScopeDatabaseID_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_columnForSortDescriptor:(id)a3
{
  id v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  int v8;

  v3 = a3;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D1DD60]);

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("date");
  }
  else
  {
    objc_msgSend(v3, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D1DD68]);

    if (v8)
      v6 = CFSTR("display_date");
    else
      v6 = 0;
  }

  return (id)v6;
}

- (void)_scheduleRecomputationForThread:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling recomputation for %{public}@: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  os_unfair_lock_lock(&self->_threadRecomputationLock);
  -[NSMutableSet addObject:](self->_threadObjectIDsToRecompute, "addObject:", v6);
  os_unfair_lock_unlock(&self->_threadRecomputationLock);
  -[EDThreadPersistence threadRecomputationDebouncer](self, "threadRecomputationDebouncer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debounceResult:", 0);

  objc_msgSend(CFSTR("Precomputed thread (recoverable) - "), "stringByAppendingString:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  EFSaveTailspin();

}

- (void)_recomputeThreads
{
  os_unfair_lock_s *p_threadRecomputationLock;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_threadRecomputationLock = &self->_threadRecomputationLock;
  os_unfair_lock_lock(&self->_threadRecomputationLock);
  v4 = (void *)-[NSMutableSet copy](self->_threadObjectIDsToRecompute, "copy");
  -[NSMutableSet removeAllObjects](self->_threadObjectIDsToRecompute, "removeAllObjects");
  os_unfair_lock_unlock(p_threadRecomputationLock);
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v10 = objc_msgSend(v4, "count");
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Recomputing %lu threads: %{public}@", buf, 0x16u);
  }

  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_groupBy:", &__block_literal_global_238);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__EDThreadPersistence__recomputeThreads__block_invoke_2;
  v8[3] = &unk_1E94A2468;
  v8[4] = self;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

}

id __40__EDThreadPersistence__recomputeThreads__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "threadScope");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __40__EDThreadPersistence__recomputeThreads__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__EDThreadPersistence__recomputeThreads__block_invoke_3;
  v7[3] = &unk_1E94A1A38;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "ef_enumerateObjectsInBatchesOfSize:block:", 100, v7);

}

void __40__EDThreadPersistence__recomputeThreads__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _recomputeThreads]_block_invoke_3");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__EDThreadPersistence__recomputeThreads__block_invoke_4;
  v11[3] = &unk_1E949B0B8;
  v6 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v7 = v3;
  v13 = v7;
  v8 = objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v11);

  if (v8)
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134218242;
      v15 = v10;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Successfully recomputed %lu threads: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __40__EDThreadPersistence__recomputeThreads__block_invoke_3_cold_1((uint64_t)v7, (uint64_t)buf, objc_msgSend(v7, "count"));
  }

}

uint64_t __40__EDThreadPersistence__recomputeThreads__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (!objc_msgSend(a2, "protectedDatabaseAttached"))
    return 1;
  objc_msgSend(*(id *)(a1 + 32), "_messageThreadExpressionForThreadScope:objectIDs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "mailboxScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_persistedMessagesForMailboxScope:messageExpression:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 1;
  if (objc_msgSend(v6, "count"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 1;
    v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__EDThreadPersistence__recomputeThreads__block_invoke_5;
    v10[3] = &unk_1E94A2440;
    v10[4] = &v11;
    objc_msgSend(v8, "_iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:", v6, 0, v10);
    v7 = *((_BYTE *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }

  return v7;
}

void __40__EDThreadPersistence__recomputeThreads__block_invoke_5(uint64_t a1, void *a2)
{
  char v3;
  uint64_t v4;
  char v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "addThreadReplacingExisting:journaled:", 1, 0);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = v3;
  else
    v5 = 0;
  *(_BYTE *)(v4 + 24) = v5;

}

- (id)_persistedMessagesForMailboxScope:(id)a3 messageExpression:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDThreadPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _persistedMessagesForMailboxScope:messageExpression:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__EDThreadPersistence__persistedMessagesForMailboxScope_messageExpression___block_invoke;
  v18[3] = &unk_1E949AFA0;
  v9 = v5;
  v19 = v9;
  v10 = v6;
  v20 = v10;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v18);

  if (objc_msgSend(v10, "count"))
  {
    -[EDThreadPersistence messagePersistence](self, "messagePersistence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v11, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v10, 1, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;

    v14 = objc_msgSend(v13, "count");
    if (v14)
      v15 = 0;
    else
      v15 = v12;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __75__EDThreadPersistence__persistedMessagesForMailboxScope_messageExpression___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], v5);

  objc_msgSend(v6, "setWhere:", *(_QWORD *)(a1 + 32));
  +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderByColumn:ascending:", v7, 0);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__EDThreadPersistence__persistedMessagesForMailboxScope_messageExpression___block_invoke_2;
  v10[3] = &unk_1E949AF78;
  v11 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v10, 0);

  return v8;
}

void __75__EDThreadPersistence__persistedMessagesForMailboxScope_messageExpression___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)persistenceIsInitializingDatabaseWithConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EDThreadPersistence _addThreadScopeToDatabaseWithMailboxType:filterPredicate:needsUpdate:lastViewedDate:connection:](self, "_addThreadScopeToDatabaseWithMailboxType:filterPredicate:needsUpdate:lastViewedDate:connection:", &unk_1E94E4C70, 7, 0, v4, v8))
  {
    objc_msgSend(MEMORY[0x1E0D1E1E0], "mailboxScopeForMailboxTypes:forExclusion:", &unk_1E94E5698, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E390]), "initWithMailboxScope:filterPredicate:", v5, 0);
    -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addThreadScope:withDatabaseID:needsUpdate:lastViewedDate:", v6, objc_msgSend(v8, "lastInsertedDatabaseID"), 0, v4);

  }
}

- (void)setNeedsUpdateForThreadScope:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdate:forThreadScope:", 1, v5);

}

- (id)resetThreadScopesForAccount:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = 0;
  -[EDThreadPersistence _getIndividualMailboxScopes:unifiedMailboxThreadScopes:forAccount:](self, "_getIndividualMailboxScopes:unifiedMailboxThreadScopes:forAccount:", &v18, &v17, a3);
  v4 = v18;
  v5 = v17;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        -[EDThreadPersistence resetThreadScopesForMailboxScope:](self, "resetThreadScopesForMailboxScope:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__EDThreadPersistence_resetThreadScopesForAccount___block_invoke;
  v12[3] = &unk_1E94A2490;
  v12[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);
  objc_msgSend(v5, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __51__EDThreadPersistence_resetThreadScopesForAccount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetThreadScope:withDatabaseID:", a2, a3);
}

- (void)_getIndividualMailboxScopes:(id *)a3 unifiedMailboxThreadScopes:(id *)a4 forAccount:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  SEL v19;

  v9 = a5;
  v10 = objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0C99E10]));
  *a3 = v10;
  v11 = objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0C99E08]));
  *a4 = v11;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__EDThreadPersistence__getIndividualMailboxScopes_unifiedMailboxThreadScopes_forAccount___block_invoke;
  v15[3] = &unk_1E94A24B8;
  v19 = a2;
  v15[4] = self;
  v16 = v11;
  v14 = v9;
  v17 = v14;
  v12 = v10;
  v18 = v12;
  v13 = v11;
  -[EDThreadPersistence _enumerateThreadScopesUsingBlock:](self, "_enumerateThreadScopesUsingBlock:", v15);

}

void __89__EDThreadPersistence__getIndividualMailboxScopes_unifiedMailboxThreadScopes_forAccount___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 != v11)
    {
      objc_msgSend(v11, "mailboxTypes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        objc_msgSend(v11, "mailboxObjectIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("EDThreadPersistence.m"), 1595, CFSTR("Mailbox scope should not have both types and objects"));

          if (a5)
          {
LABEL_6:
            objc_msgSend(v11, "mailboxTypes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "count");

            if (v17 != 2)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("EDThreadPersistence.m"), 1597, CFSTR("Mailbox scope should have exactly two types"));
LABEL_25:

              goto LABEL_17;
            }
            goto LABEL_17;
          }
        }
        else if (a5)
        {
          goto LABEL_6;
        }
        objc_msgSend(v11, "mailboxTypes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v26 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("EDThreadPersistence.m"), 1599, CFSTR("Mailbox scope should have exactly one type"));
          goto LABEL_25;
        }
LABEL_17:
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v10);
        goto LABEL_23;
      }
      objc_msgSend(v11, "mailboxTypes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("EDThreadPersistence.m"), 1603, CFSTR("Mailbox scope should not have both types and objects"));

        if (a5)
        {
LABEL_13:
          objc_msgSend(v11, "mailboxObjectIDs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          if (v22 != 2)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("EDThreadPersistence.m"), 1605, CFSTR("Mailbox scope should have exactly two mailboxes"));
LABEL_27:

            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
      else if (a5)
      {
        goto LABEL_13;
      }
      objc_msgSend(v11, "mailboxObjectIDs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (v29 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("EDThreadPersistence.m"), 1607, CFSTR("Mailbox scope should have exactly two mailbox"));
        goto LABEL_27;
      }
LABEL_20:
      objc_msgSend(v11, "mailboxObjectIDs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "anyObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "url");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 48), "containsMailboxWithURL:", v32))
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);

      goto LABEL_23;
    }
  }
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    __89__EDThreadPersistence__getIndividualMailboxScopes_unifiedMailboxThreadScopes_forAccount___block_invoke_cold_1();

LABEL_23:
}

- (void)persistenceIsAddingMailboxWithDatabaseID:(int64_t)a3 objectID:(id)a4 generationWindow:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  EDThreadPersistence *v16;
  int64_t v17;

  v13 = a4;
  if ((objc_msgSend(v13, "isEphemeral") & 1) == 0)
  {
    -[EDThreadPersistence messagePersistence](self, "messagePersistence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mailboxPersistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "legacyMailboxForMailboxURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "type") == 7)
    {
      -[EDThreadPersistence database](self, "database");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence persistenceIsAddingMailboxWithDatabaseID:objectID:generationWindow:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __90__EDThreadPersistence_persistenceIsAddingMailboxWithDatabaseID_objectID_generationWindow___block_invoke;
      v14[3] = &unk_1E949AF28;
      v15 = v13;
      v16 = self;
      v17 = a3;
      objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v14);

    }
  }

}

uint64_t __90__EDThreadPersistence_persistenceIsAddingMailboxWithDatabaseID_objectID_generationWindow___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D1E1E0];
  v13[0] = a1[4];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxScopeForMailboxObjectIDs:forExclusion:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E390]), "initWithMailboxScope:filterPredicate:", v6, 0);
  v9 = (void *)a1[5];
  v8 = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "_addThreadScopeToDatabase:withMailboxDatabaseID:filterPredicate:needsUpdate:lastViewedDate:updateThreadScopeManager:connection:", v7, v8, 7, 0, v10, 1, v3);

  return v11;
}

- (void)persistenceIsAddingMessages:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Persistence is adding %lu messages", (uint8_t *)&v11, 0xCu);
  }

  -[EDThreadPersistence _addPersistedMessages:journaled:generationWindow:](self, "_addPersistedMessages:journaled:generationWindow:", v8, v6, v9);
}

- (void)_addPersistedMessages:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v8 = a3;
  v9 = a5;
  -[EDThreadPersistence _filteredPersistedMessagesForPersistedMessages:](self, "_filteredPersistedMessagesForPersistedMessages:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__EDThreadPersistence__addPersistedMessages_journaled_generationWindow___block_invoke;
  v12[3] = &unk_1E94A24E0;
  v12[4] = self;
  v14 = a4;
  v10 = v9;
  v13 = v10;
  -[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:](self, "_iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:", v11, 0, v12);

}

uint64_t __72__EDThreadPersistence__addPersistedMessages_journaled_generationWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeThreadedMessages:withChangedKeyPaths:journaled:generationWindow:", a2, 0, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_writeThreadedMessages:(id)a3 withChangedKeyPaths:(id)a4 journaled:(BOOL)a5 generationWindow:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  _BYTE v27[12];
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v7 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "thread");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "addThreadReplacingExisting:journaled:", 0, v7))
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = &stru_1E94A4508;
      if (v7)
        v16 = CFSTR("journaled ");
      *(_DWORD *)v27 = 138412546;
      *(_QWORD *)&v27[4] = v16;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Adding %@thread (new messages): %{public}@", v27, 0x16u);
    }

    objc_msgSend(v10, "threadObjectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "persistenceIsAddingThreadWithObjectID:journaled:generationWindow:", v17, v7, v12);
  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = &stru_1E94A4508;
      if (v7)
        v19 = CFSTR("journaled ");
      *(_DWORD *)v27 = 138412546;
      *(_QWORD *)&v27[4] = v19;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_DEFAULT, "Updating %@thread (new messages): %{public}@", v27, 0x16u);
    }

    objc_msgSend(v10, "updateThreadTableWithJournaled:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "threadObjectID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[EDThreadPersistence _recalculateNewestMessageForThreadObjectID:threadScopeDatabaseID:](self, "_recalculateNewestMessageForThreadObjectID:threadScopeDatabaseID:", v20, objc_msgSend(v10, "threadScopeDatabaseID"));

    if (v21)
      objc_msgSend(v17, "addObject:", *MEMORY[0x1E0D1DDA0]);
    if (v17)
    {
      if (objc_msgSend(v11, "count"))
        objc_msgSend(v17, "ef_addAbsentObjectsFromArrayAccordingToEquals:", v11);
      v22 = v17;

      v11 = v22;
    }
    if (objc_msgSend(v11, "count"))
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = &stru_1E94A4508;
        *(_DWORD *)v27 = 138412802;
        if (v7)
          v24 = CFSTR("journaled ");
        *(_QWORD *)&v27[4] = v24;
        v28 = 2114;
        v29 = v13;
        v30 = 2114;
        v31 = v11;
        _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_DEFAULT, "Changing %@thread (new messages): %{public}@\nkey paths: %{public}@", v27, 0x20u);
      }

      if (v7)
      {
        objc_msgSend(v10, "threadObjectID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "persistenceIsMarkingThreadAsJournaledWithObjectID:generationWindow:", v25, v12);

      }
      objc_msgSend(v10, "threadObjectID", *(_QWORD *)v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "persistenceIsChangingThreadWithObjectID:changedKeyPaths:generationWindow:", v26, v11, v12);

    }
  }

}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 67109120;
    v11 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v5, "count"));
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Persistence did add %u messages", (uint8_t *)&v10, 8u);
  }

  EFFetchSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    v8 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v5, "count"));
    v10 = 67109120;
    v11 = v8;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ThreadPersistenceDidAddMessages", "count=%u ", (uint8_t *)&v10, 8u);
  }

  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistenceDidFinishThreadUpdates");

}

- (void)persistenceIsChangingFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "deletedChanged"))
  {
    if (objc_msgSend(v8, "deleted"))
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134218242;
        v15 = objc_msgSend(v9, "count");
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Persistence is setting deleted flag for %lu messages: %{public}@", (uint8_t *)&v14, 0x16u);
      }

      -[EDThreadPersistence _persistenceIsDeletingMessages:generationWindow:](self, "_persistenceIsDeletingMessages:generationWindow:", v9, v10);
    }
    else
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134218242;
        v15 = objc_msgSend(v9, "count");
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Persistence is unsetting deleted flag for %lu messages: %{public}@", (uint8_t *)&v14, 0x16u);
      }

      -[EDThreadPersistence _addPersistedMessages:journaled:generationWindow:](self, "_addPersistedMessages:journaled:generationWindow:", v9, 0, v10);
    }
  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218242;
      v15 = objc_msgSend(v9, "count");
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Persistence is changing flags for %lu messages: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    -[EDThreadPersistence _persistenceIsChangingFlags:messages:generationWindow:](self, "_persistenceIsChangingFlags:messages:generationWindow:", v8, v9, v10);
  }

}

- (void)_persistenceIsChangingFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EDThreadPersistence _filteredPersistedMessagesForPersistedMessages:](self, "_filteredPersistedMessagesForPersistedMessages:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__EDThreadPersistence__persistenceIsChangingFlags_messages_generationWindow___block_invoke;
  v16[3] = &unk_1E94A2508;
  v16[4] = self;
  v15 = v8;
  v17 = v15;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v14 = v12;
  -[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:block:](self, "_iterateWrappedMessagesByConversationForPersistedMessages:block:", v11, v16);

}

void __77__EDThreadPersistence__persistenceIsChangingFlags_messages_generationWindow___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_persistenceIsChangingFlags:wrappedMessages:threadObjectID:threadScopeDatabaseID:", *(_QWORD *)(a1 + 40), v8, v7, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v7;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Changing thread (flag change): %{public}@\nkey paths: %{public}@\n updated flags: %{public}@", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "persistenceIsChangingThreadWithObjectID:changedKeyPaths:generationWindow:", v7, v9, *(_QWORD *)(a1 + 56));
  }

}

- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v8, "count");
    objc_msgSend(v7, "ef_publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Persistence did change flags for %lu messages: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistenceDidFinishThreadUpdates");

}

- (id)_persistenceIsChangingFlags:(id)a3 wrappedMessages:(id)a4 threadObjectID:(id)a5 threadScopeDatabaseID:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[EDThreadPersistence _threadExpressionForThreadScopeDatabaseID:conversation:](self, "_threadExpressionForThreadScopeDatabaseID:conversation:", a6, objc_msgSend(v12, "conversationID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDThreadPersistence database](self, "database");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _persistenceIsChangingFlags:wrappedMessages:threadObjectID:threadScopeDatabaseID:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __104__EDThreadPersistence__persistenceIsChangingFlags_wrappedMessages_threadObjectID_threadScopeDatabaseID___block_invoke;
  v26[3] = &unk_1E949D6F8;
  v26[4] = self;
  v16 = v12;
  v27 = v16;
  v17 = v10;
  v28 = v17;
  v24 = v12;
  v18 = v13;
  v29 = v18;
  v19 = v14;
  v30 = v19;
  v20 = v11;
  v31 = v20;
  v32 = a6;
  objc_msgSend(v25, "__performWriteWithCaller:usingBlock:", v15, v26, v14, v24);

  v21 = v31;
  v22 = v19;

  return v22;
}

uint64_t __104__EDThreadPersistence__persistenceIsChangingFlags_wrappedMessages_threadObjectID_threadScopeDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  void *v174;
  int v175;
  void *v176;
  void *v177;
  int v178;
  void *v179;
  id v181;
  void *v182;
  void *v183;
  uint64_t v184;
  _QWORD v185[3];
  _QWORD v186[2];
  _QWORD v187[2];
  _QWORD v188[2];
  _QWORD v189[2];
  _QWORD v190[2];
  _QWORD v191[2];
  _QWORD v192[2];
  _QWORD v193[2];
  _QWORD v194[2];
  _QWORD v195[2];
  _QWORD v196[2];
  _QWORD v197[2];
  _QWORD v198[2];
  _QWORD v199[2];
  _QWORD v200[2];
  _QWORD v201[4];

  v201[2] = *MEMORY[0x1E0C80C00];
  v181 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("threads"));
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "_messageThreadExpressionForThreadObjectID:", *(_QWORD *)(a1 + 40));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "readChanged"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("read"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "read"))
    {
      v6 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithResult:table:", &unk_1E94E4C40, v7);

      v9 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v201[0] = v183;
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("read"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "equalTo:", &unk_1E94E4C40);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v201[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v201, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v9, "initWithExpressions:", v12);
      objc_msgSend(v8, "setWhere:", v13);

      objc_msgSend(v8, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v8, &unk_1E94E4C58);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("read"));

      objc_msgSend(v5, "equalTo:", &unk_1E94E4C40);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v15);

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C40, CFSTR("read"));
      objc_msgSend(v5, "notEqualTo:", &unk_1E94E4C40);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "flaggedChanged", v181))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flagged"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "flagged"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("flagged"));
      objc_msgSend(v17, "equalTo:", &unk_1E94E4C40);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);
    }
    else
    {
      v19 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v19, "initWithResult:table:", &unk_1E94E4C58, v20);

      v21 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v200[0] = v183;
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flagged"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "equalTo:", &unk_1E94E4C58);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v200[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v200, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v21, "initWithExpressions:", v24);
      objc_msgSend(v18, "setWhere:", v25);

      objc_msgSend(v18, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v18, &unk_1E94E4C40);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("flagged"));

      objc_msgSend(v17, "notEqualTo:", &unk_1E94E4C40);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v27);

    }
  }
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flags"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "draftChanged"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("draft"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "draft"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("draft"));
      objc_msgSend(v29, "equalTo:", &unk_1E94E4C40);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v30);
    }
    else
    {
      v31 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v31, "initWithResult:table:", &unk_1E94E4C58, v32);

      v33 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v199[0] = v183;
      objc_msgSend(v28, "matchesMask:", &unk_1E94E4C88);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v199[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v199, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v33, "initWithExpressions:", v35);
      objc_msgSend(v30, "setWhere:", v36);

      objc_msgSend(v30, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v30, &unk_1E94E4C40);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("draft"));

      objc_msgSend(v29, "notEqualTo:", &unk_1E94E4C40);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v38);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "repliedChanged"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("replied"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "replied"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("replied"));
      objc_msgSend(v39, "equalTo:", &unk_1E94E4C40);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v40);
    }
    else
    {
      v41 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v41, "initWithResult:table:", &unk_1E94E4C58, v42);

      v43 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v198[0] = v183;
      objc_msgSend(v28, "matchesMask:", &unk_1E94E4CA0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v198[1] = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v198, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v43, "initWithExpressions:", v45);
      objc_msgSend(v40, "setWhere:", v46);

      objc_msgSend(v40, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v40, &unk_1E94E4C40);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("replied"));

      objc_msgSend(v39, "notEqualTo:", &unk_1E94E4C40);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v48);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "forwardedChanged"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("forwarded"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "forwarded"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("forwarded"));
      objc_msgSend(v49, "equalTo:", &unk_1E94E4C40);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v50);
    }
    else
    {
      v51 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(v51, "initWithResult:table:", &unk_1E94E4C58, v52);

      v53 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v197[0] = v183;
      objc_msgSend(v28, "matchesMask:", &unk_1E94E4CB8);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v197[1] = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v197, 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(v53, "initWithExpressions:", v55);
      objc_msgSend(v50, "setWhere:", v56);

      objc_msgSend(v50, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v50, &unk_1E94E4C40);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("forwarded"));

      objc_msgSend(v49, "notEqualTo:", &unk_1E94E4C40);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v58);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "redirectedChanged"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("redirected"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "redirected"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("redirected"));
      objc_msgSend(v59, "equalTo:", &unk_1E94E4C40);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v60);
    }
    else
    {
      v61 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend(v61, "initWithResult:table:", &unk_1E94E4C58, v62);

      v63 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v196[0] = v183;
      objc_msgSend(v28, "matchesMask:", &unk_1E94E4CD0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v196[1] = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 2);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend(v63, "initWithExpressions:", v65);
      objc_msgSend(v60, "setWhere:", v66);

      objc_msgSend(v60, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v60, &unk_1E94E4C40);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("redirected"));

      objc_msgSend(v59, "notEqualTo:", &unk_1E94E4C40);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v68);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "flagColorChanged"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("has_red_flag"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "flaggedChanged")
      && !objc_msgSend(*(id *)(a1 + 48), "flagged")
      || objc_msgSend(*(id *)(a1 + 48), "flagColor"))
    {
      v70 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (void *)objc_msgSend(v70, "initWithResult:table:", &unk_1E94E4C58, v71);

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "equalTo:", &unk_1E94E4CE8);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      v75 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v195[0] = v183;
      v195[1] = v74;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 2);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (void *)objc_msgSend(v75, "initWithExpressions:", v76);
      objc_msgSend(v72, "setWhere:", v77);

      objc_msgSend(v72, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v72, &unk_1E94E4C40);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("has_red_flag"));

      objc_msgSend(v69, "notEqualTo:", &unk_1E94E4C40);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v79);

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("has_red_flag"));
      objc_msgSend(v69, "equalTo:", &unk_1E94E4C40);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v72);
    }

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("has_orange_flag"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!objc_msgSend(*(id *)(a1 + 48), "flaggedChanged")
       || objc_msgSend(*(id *)(a1 + 48), "flagged"))
      && objc_msgSend(*(id *)(a1 + 48), "flagColor") == 1)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("has_orange_flag"));
      objc_msgSend(v80, "equalTo:", &unk_1E94E4C40);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v81);
    }
    else
    {
      v82 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (void *)objc_msgSend(v82, "initWithResult:table:", &unk_1E94E4C58, v83);

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "equalTo:", &unk_1E94E4D00);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      v86 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v194[0] = v183;
      v194[1] = v85;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 2);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (void *)objc_msgSend(v86, "initWithExpressions:", v87);
      objc_msgSend(v81, "setWhere:", v88);

      objc_msgSend(v81, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v81, &unk_1E94E4C40);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("has_orange_flag"));

      objc_msgSend(v80, "notEqualTo:", &unk_1E94E4C40);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v90);

    }
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("has_yellow_flag"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!objc_msgSend(*(id *)(a1 + 48), "flaggedChanged")
       || objc_msgSend(*(id *)(a1 + 48), "flagged"))
      && objc_msgSend(*(id *)(a1 + 48), "flagColor") == 2)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("has_yellow_flag"));
      objc_msgSend(v91, "equalTo:", &unk_1E94E4C40);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v92);
    }
    else
    {
      v93 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = (void *)objc_msgSend(v93, "initWithResult:table:", &unk_1E94E4C58, v94);

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "equalTo:", &unk_1E94E4D18);
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      v97 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v193[0] = v183;
      v193[1] = v96;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 2);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = (void *)objc_msgSend(v97, "initWithExpressions:", v98);
      objc_msgSend(v92, "setWhere:", v99);

      objc_msgSend(v92, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v92, &unk_1E94E4C40);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("has_yellow_flag"));

      objc_msgSend(v91, "notEqualTo:", &unk_1E94E4C40);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v101);

    }
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("has_green_flag"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!objc_msgSend(*(id *)(a1 + 48), "flaggedChanged")
       || objc_msgSend(*(id *)(a1 + 48), "flagged"))
      && objc_msgSend(*(id *)(a1 + 48), "flagColor") == 3)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("has_green_flag"));
      objc_msgSend(v102, "equalTo:", &unk_1E94E4C40);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v103);
    }
    else
    {
      v104 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (void *)objc_msgSend(v104, "initWithResult:table:", &unk_1E94E4C58, v105);

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "equalTo:", &unk_1E94E4D30);
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      v108 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v192[0] = v183;
      v192[1] = v107;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 2);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = (void *)objc_msgSend(v108, "initWithExpressions:", v109);
      objc_msgSend(v103, "setWhere:", v110);

      objc_msgSend(v103, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v103, &unk_1E94E4C40);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v111, CFSTR("has_green_flag"));

      objc_msgSend(v102, "notEqualTo:", &unk_1E94E4C40);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v112);

    }
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("has_blue_flag"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!objc_msgSend(*(id *)(a1 + 48), "flaggedChanged")
       || objc_msgSend(*(id *)(a1 + 48), "flagged"))
      && objc_msgSend(*(id *)(a1 + 48), "flagColor") == 4)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("has_blue_flag"));
      objc_msgSend(v113, "equalTo:", &unk_1E94E4C40);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v114);
    }
    else
    {
      v115 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = (void *)objc_msgSend(v115, "initWithResult:table:", &unk_1E94E4C58, v116);

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "equalTo:", &unk_1E94E4D48);
      v118 = (void *)objc_claimAutoreleasedReturnValue();

      v119 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v191[0] = v183;
      v191[1] = v118;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 2);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = (void *)objc_msgSend(v119, "initWithExpressions:", v120);
      objc_msgSend(v114, "setWhere:", v121);

      objc_msgSend(v114, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v114, &unk_1E94E4C40);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("has_blue_flag"));

      objc_msgSend(v113, "notEqualTo:", &unk_1E94E4C40);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v123);

    }
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("has_purple_flag"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!objc_msgSend(*(id *)(a1 + 48), "flaggedChanged")
       || objc_msgSend(*(id *)(a1 + 48), "flagged"))
      && objc_msgSend(*(id *)(a1 + 48), "flagColor") == 5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("has_purple_flag"));
      objc_msgSend(v124, "equalTo:", &unk_1E94E4C40);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v125);
    }
    else
    {
      v126 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = (void *)objc_msgSend(v126, "initWithResult:table:", &unk_1E94E4C58, v127);

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "equalTo:", &unk_1E94E4D60);
      v129 = (void *)objc_claimAutoreleasedReturnValue();

      v130 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v190[0] = v183;
      v190[1] = v129;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 2);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = (void *)objc_msgSend(v130, "initWithExpressions:", v131);
      objc_msgSend(v125, "setWhere:", v132);

      objc_msgSend(v125, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v125, &unk_1E94E4C40);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v133, CFSTR("has_purple_flag"));

      objc_msgSend(v124, "notEqualTo:", &unk_1E94E4C40);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v134);

    }
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("has_gray_flag"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!objc_msgSend(*(id *)(a1 + 48), "flaggedChanged")
       || objc_msgSend(*(id *)(a1 + 48), "flagged"))
      && objc_msgSend(*(id *)(a1 + 48), "flagColor") == 6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("has_gray_flag"));
      objc_msgSend(v135, "equalTo:", &unk_1E94E4C40);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v136);
    }
    else
    {
      v137 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = (void *)objc_msgSend(v137, "initWithResult:table:", &unk_1E94E4C58, v138);

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "equalTo:", &unk_1E94E4D78);
      v140 = (void *)objc_claimAutoreleasedReturnValue();

      v141 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v189[0] = v183;
      v189[1] = v140;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 2);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = (void *)objc_msgSend(v141, "initWithExpressions:", v142);
      objc_msgSend(v136, "setWhere:", v143);

      objc_msgSend(v136, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v136, &unk_1E94E4C40);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v144, CFSTR("has_gray_flag"));

      objc_msgSend(v135, "notEqualTo:", &unk_1E94E4C40);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v145);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "junkLevelChanged"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("junk_level"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "junkLevel") == 1)
    {
      v147 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = (void *)objc_msgSend(v147, "initWithResult:table:", &unk_1E94E4D18, v148);

      objc_msgSend(v28, "matchesMask:", &unk_1E94E4D90);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v188[0] = v183;
      v188[1] = v150;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 2);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = (void *)objc_msgSend(v151, "initWithExpressions:", v152);
      objc_msgSend(v149, "setWhere:", v153);

      objc_msgSend(v149, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v149, &unk_1E94E4D00);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v154, CFSTR("junk_level"));

      objc_msgSend(v146, "equalTo:", &unk_1E94E4D18);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v155);

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4D18, CFSTR("junk_level"));
      objc_msgSend(v146, "notEqualTo:", &unk_1E94E4D18);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v149);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 48), "flaggedChanged"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("has_unflagged"));
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "flagged"))
    {
      v157 = objc_alloc(MEMORY[0x1E0D1F040]);
      +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = (void *)objc_msgSend(v157, "initWithResult:table:", &unk_1E94E4C58, v158);

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flagged"));
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "equalTo:", &unk_1E94E4C40);
      v161 = (void *)objc_claimAutoreleasedReturnValue();

      v162 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v187[0] = v183;
      v187[1] = v161;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 2);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = (void *)objc_msgSend(v162, "initWithExpressions:", v163);
      objc_msgSend(v159, "setWhere:", v164);

      objc_msgSend(v159, "setLimit:", 1);
      objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v159, &unk_1E94E4C40);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v165, CFSTR("has_unflagged"));

      objc_msgSend(v156, "notEqualTo:", &unk_1E94E4C40);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v166);

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("has_unflagged"));
      objc_msgSend(v156, "equalTo:", &unk_1E94E4C40);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v159);
    }

  }
  if (objc_msgSend(v4, "count"))
  {
    v167 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v186[0] = *(_QWORD *)(a1 + 56);
    v168 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F020]), "initWithExpressions:", v4);
    v186[1] = v168;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 2);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = (void *)objc_msgSend(v167, "initWithExpressions:", v169);
    objc_msgSend(v3, "setWhereClause:", v170);

    v184 = 0;
    v171 = objc_msgSend(v182, "executeUpdateStatement:rowsChanged:", v3, &v184);
    if (v184)
    {
      v172 = *(void **)(a1 + 64);
      v173 = *MEMORY[0x1E0D1DD78];
      v185[0] = *MEMORY[0x1E0D1DD80];
      v185[1] = v173;
      v185[2] = *MEMORY[0x1E0D1DDC8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v185, 3);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "addObjectsFromArray:", v174);

    }
  }
  else
  {
    v171 = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "readChanged"))
  {
    v175 = objc_msgSend(*(id *)(a1 + 48), "read");
    v176 = *(void **)(a1 + 32);
    if (v175)
    {
      objc_msgSend(*(id *)(a1 + 72), "firstObject");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = objc_msgSend(v176, "_updateNewestReadMessageWithWrappedMessage:threadExpression:", v177, *(_QWORD *)(a1 + 56));

      if (!v178)
      {
        v179 = 0;
LABEL_88:
        if (objc_msgSend(v179, "count"))
          objc_msgSend(*(id *)(a1 + 64), "ef_addAbsentObjectsFromArrayAccordingToEquals:", v179);

        goto LABEL_91;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_recalculateNewestReadMessageForThreadObjectID:threadScopeDatabaseID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));
    }
    objc_msgSend(*(id *)(a1 + 32), "_recalculateDisplayMessageForThreadObjectID:threadScopeDatabaseID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_88;
  }
LABEL_91:

  return v171;
}

- (void)persistenceIsDeletingMessages:(id)a3 generationWindow:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Persistence is deleting %lu messages", (uint8_t *)&v10, 0xCu);
  }

  -[EDThreadPersistence _filteredPersistedMessagesForPersistedMessages:](self, "_filteredPersistedMessagesForPersistedMessages:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence _persistenceIsDeletingMessages:generationWindow:](self, "_persistenceIsDeletingMessages:generationWindow:", v9, v7);
}

- (void)_persistenceIsDeletingMessages:(id)a3 generationWindow:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v10 = a3;
  v6 = a4;
  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__EDThreadPersistence__persistenceIsDeletingMessages_generationWindow___block_invoke;
  v11[3] = &unk_1E94A2530;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  -[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:block:](self, "_iterateWrappedMessagesByConversationForPersistedMessages:block:", v10, v11);

}

void __71__EDThreadPersistence__persistenceIsDeletingMessages_generationWindow___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_deleteWrappedMessages:fromThreadWithObjectID:threadScopeDatabaseID:generationWindow:", v8, v7, a2, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Changing thread (deleted messages): %{public}@\nkey paths: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "persistenceIsChangingThreadWithObjectID:changedKeyPaths:generationWindow:", v7, v9, *(_QWORD *)(a1 + 40));
  }

}

- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Persistence did delete %lu messages", (uint8_t *)&v8, 0xCu);
  }

  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistenceDidFinishThreadUpdates");

}

- (id)_deleteWrappedMessages:(id)a3 fromThreadWithObjectID:(id)a4 threadScopeDatabaseID:(int64_t)a5 generationWindow:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v10 = a3;
  v11 = a4;
  -[EDThreadPersistence _updateThreadForDeleteWithObjectID:threadScopeDatabaseID:generationWindow:](self, "_updateThreadForDeleteWithObjectID:threadScopeDatabaseID:generationWindow:", v11, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[EDThreadPersistence _databaseIDForThreadObjectID:](self, "_databaseIDForThreadObjectID:", v11);
    v14 = v12;
    if (v13 != *MEMORY[0x1E0D1DC08])
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDThreadPersistence _messageThreadExpressionForThreadObjectID:](self, "_messageThreadExpressionForThreadObjectID:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[EDThreadPersistence _deleteMailboxesFromWrappedMessages:fromThreadWithDatabaseID:messageThreadExpression:](self, "_deleteMailboxesFromWrappedMessages:fromThreadWithDatabaseID:messageThreadExpression:", v10, v15, v16))
      {
        objc_msgSend(v12, "addObject:", *MEMORY[0x1E0D1DE08]);
      }

      v14 = v12;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  v17 = v14;

  return v17;
}

- (id)_updateThreadForDeleteWithObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  v10 = objc_msgSend(v8, "conversationID");
  -[EDThreadPersistence _messageThreadExpressionForThreadObjectID:](self, "_messageThreadExpressionForThreadObjectID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _updateThreadForDeleteWithObjectID:threadScopeDatabaseID:generationWindow:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__EDThreadPersistence__updateThreadForDeleteWithObjectID_threadScopeDatabaseID_generationWindow___block_invoke;
  v19[3] = &unk_1E94A2558;
  v19[4] = self;
  v14 = v8;
  v20 = v14;
  v15 = v9;
  v21 = v15;
  v16 = v11;
  v22 = v16;
  v23 = &v26;
  v24 = a4;
  v25 = v10;
  objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v19);

  v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

uint64_t __97__EDThreadPersistence__updateThreadForDeleteWithObjectID_threadScopeDatabaseID_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[5];
  uint8_t v22[4];
  uint64_t v23;
  __int128 buf;
  uint64_t v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_databaseIDForThreadObjectID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  if (v4 == *MEMORY[0x1E0D1DC08])
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "No thread database ID: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithResult:table:", &unk_1E94E4C58, v9);

    objc_msgSend(v10, "setWhere:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v10, "setLimit:", 1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v25 = 0x2020000000;
    v26 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __97__EDThreadPersistence__updateThreadForDeleteWithObjectID_threadScopeDatabaseID_generationWindow___block_invoke_282;
    v21[3] = &unk_1E949B090;
    v21[4] = &buf;
    if ((objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v10, v21, 0) & 1) != 0)
    {
      v11 = *(void **)(a1 + 32);
      if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      {
        objc_msgSend(v11, "_updateBasicPropertiesAfterDeleteForThreadObjectID:threadScopeDatabaseID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        objc_msgSend(*(id *)(a1 + 32), "_recalculateNewestReadMessageForThreadObjectID:threadScopeDatabaseID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
        objc_msgSend(*(id *)(a1 + 32), "_recalculateDisplayMessageForThreadObjectID:threadScopeDatabaseID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "ef_addAbsentObjectsFromArrayAccordingToEquals:", v15);
        if (objc_msgSend(*(id *)(a1 + 32), "_recalculateNewestMessageForThreadObjectID:threadScopeDatabaseID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72)))objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", *MEMORY[0x1E0D1DDA0]);
        if (objc_msgSend(*(id *)(a1 + 32), "_deleteSendersFromThreadWithDatabaseID:messageThreadExpression:", v5, *(_QWORD *)(a1 + 56)))objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", *MEMORY[0x1E0D1DE60]);
        if (objc_msgSend(*(id *)(a1 + 32), "_deleteRecipientsOfType:fromThreadWithDatabaseID:messageThreadExpression:", 1, v5, *(_QWORD *)(a1 + 56)))objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", *MEMORY[0x1E0D1DE90]);
        if (objc_msgSend(*(id *)(a1 + 32), "_deleteRecipientsOfType:fromThreadWithDatabaseID:messageThreadExpression:", 2, v5, *(_QWORD *)(a1 + 56)))objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", *MEMORY[0x1E0D1DD20]);
        v7 = 1;
      }
      else
      {
        objc_msgSend(v11, "_threadExpressionForThreadScopeDatabaseID:conversation:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("threads"), v15);
        v7 = objc_msgSend(v3, "executeDeleteStatement:error:", v16, 0);
        +[EDThreadPersistence log](EDThreadPersistence, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)v22 = 138543362;
          v23 = v18;
          _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Deleting thread: %{public}@", v22, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "hookRegistry");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "persistenceIsDeletingThreadWithObjectID:generationWindow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      }
    }
    else
    {
      v7 = 0;
    }
    _Block_object_dispose(&buf, 8);

  }
  return v7;
}

uint64_t __97__EDThreadPersistence__updateThreadForDeleteWithObjectID_threadScopeDatabaseID_generationWindow___block_invoke_282(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (id)_updateBasicPropertiesAfterDeleteForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = objc_msgSend(v6, "conversationID");
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDThreadPersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _updateBasicPropertiesAfterDeleteForThreadObjectID:threadScopeDatabaseID:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__EDThreadPersistence__updateBasicPropertiesAfterDeleteForThreadObjectID_threadScopeDatabaseID___block_invoke;
  v16[3] = &unk_1E94A25A8;
  v16[4] = self;
  v11 = v6;
  v17 = v11;
  v19 = a4;
  v20 = v7;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v16);

  v13 = v18;
  v14 = v12;

  return v14;
}

uint64_t __96__EDThreadPersistence__updateBasicPropertiesAfterDeleteForThreadObjectID_threadScopeDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  uint64_t v132;
  _QWORD v133[10];
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  id v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, uint64_t);
  void (*v150)(uint64_t);
  id v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t (*v155)(uint64_t, uint64_t);
  void (*v156)(uint64_t);
  id v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  void (*v162)(uint64_t);
  id v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t (*v167)(uint64_t, uint64_t);
  void (*v168)(uint64_t);
  id v169;
  _QWORD v170[2];
  _QWORD v171[2];
  _QWORD v172[2];
  _QWORD v173[2];
  _QWORD v174[2];
  _QWORD v175[2];
  _QWORD v176[2];
  _QWORD v177[2];
  _QWORD v178[2];
  _QWORD v179[4];

  v179[2] = *MEMORY[0x1E0C80C00];
  v131 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_messageThreadExpressionForThreadObjectID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = 0;
  v165 = &v164;
  v166 = 0x3032000000;
  v167 = __Block_byref_object_copy__37;
  v168 = __Block_byref_object_dispose__37;
  v169 = 0;
  v158 = 0;
  v159 = &v158;
  v160 = 0x3032000000;
  v161 = __Block_byref_object_copy__37;
  v162 = __Block_byref_object_dispose__37;
  v163 = 0;
  v152 = 0;
  v153 = &v152;
  v154 = 0x3032000000;
  v155 = __Block_byref_object_copy__37;
  v156 = __Block_byref_object_dispose__37;
  v157 = 0;
  v146 = 0;
  v147 = &v146;
  v148 = 0x3032000000;
  v149 = __Block_byref_object_copy__37;
  v150 = __Block_byref_object_dispose__37;
  v151 = 0;
  v140 = 0;
  v141 = &v140;
  v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__37;
  v144 = __Block_byref_object_dispose__37;
  v145 = 0;
  v134 = 0;
  v135 = &v134;
  v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__37;
  v138 = __Block_byref_object_dispose__37;
  v139 = 0;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", CFSTR("flags"), v5);

  objc_msgSend(v130, "setWhere:", v3);
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __96__EDThreadPersistence__updateBasicPropertiesAfterDeleteForThreadObjectID_threadScopeDatabaseID___block_invoke_2;
  v133[3] = &unk_1E94A2580;
  v133[4] = &v164;
  v133[5] = &v158;
  v133[6] = &v152;
  v133[7] = &v146;
  v133[8] = &v140;
  v133[9] = &v134;
  if ((objc_msgSend(v131, "executeSelectStatement:withBlock:error:", v130, v133, 0) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateForThreadsWithThreadScopeDatabaseID:conversation:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D1EF88];
    v8 = (void *)MEMORY[0x1E0D1EFC0];
    +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "column:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "max:", v10);
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = (void *)objc_msgSend(v11, "initWithResult:table:", v128, v12);

    objc_msgSend(v127, "setWhere:", v3);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v127, CFSTR("date"));
    v13 = (void *)MEMORY[0x1E0D1EF88];
    v14 = (void *)MEMORY[0x1E0D1EFC0];
    +[EDMessagePersistence messagesDisplayDateColumnName](EDMessagePersistence, "messagesDisplayDateColumnName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "column:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "max:", v16);
    v124 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = (void *)objc_msgSend(v17, "initWithResult:table:", v124, v18);

    objc_msgSend(v125, "setWhere:", v3);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v125, CFSTR("display_date"));
    v19 = (void *)MEMORY[0x1E0D1EF88];
    objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("message_global_data"), CFSTR("read_later_date"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "min:", v20);
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    v129 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResult:table:", v126, CFSTR("message_global_data"));
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v129, "join:sourceColumn:targetColumn:", v21, *MEMORY[0x1E0D1EE00], CFSTR("global_message_id"));

    objc_msgSend(v129, "setWhere:", v3);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v129, CFSTR("read_later_date"));
    v23 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithResult:table:", MEMORY[0x1E0C9AAA0], v24);

    v26 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v179[0] = v3;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("read"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "equalTo:", &unk_1E94E4C40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v179[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v26, "initWithExpressions:", v29);
    objc_msgSend(v25, "setWhere:", v30);

    objc_msgSend(v25, "setLimit:", 1);
    objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v25, &unk_1E94E4C58);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("read"));

    v32 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithResult:table:", MEMORY[0x1E0C9AAB0], v33);

    v35 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v178[0] = v3;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flagged"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "equalTo:", &unk_1E94E4C58);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v178[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v35, "initWithExpressions:", v38);
    objc_msgSend(v34, "setWhere:", v39);

    objc_msgSend(v34, "setLimit:", 1);
    objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v34, &unk_1E94E4C40);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("flagged"));

    v41 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v41, "initWithResult:table:", MEMORY[0x1E0C9AAB0], v42);

    v44 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v177[0] = v3;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "equalTo:", &unk_1E94E4CE8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v177[1] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v44, "initWithExpressions:", v47);
    objc_msgSend(v43, "setWhere:", v48);

    objc_msgSend(v43, "setLimit:", 1);
    objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v43, &unk_1E94E4C40);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("has_red_flag"));

    v50 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v50, "initWithResult:table:", MEMORY[0x1E0C9AAB0], v51);

    v53 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v176[0] = v3;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "equalTo:", &unk_1E94E4D00);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v176[1] = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v53, "initWithExpressions:", v56);
    objc_msgSend(v52, "setWhere:", v57);

    objc_msgSend(v52, "setLimit:", 1);
    objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v52, &unk_1E94E4C40);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, CFSTR("has_orange_flag"));

    v59 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v59, "initWithResult:table:", MEMORY[0x1E0C9AAB0], v60);

    v62 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v175[0] = v3;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "equalTo:", &unk_1E94E4D18);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v175[1] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v175, 2);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v62, "initWithExpressions:", v65);
    objc_msgSend(v61, "setWhere:", v66);

    objc_msgSend(v61, "setLimit:", 1);
    objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v61, &unk_1E94E4C40);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v67, CFSTR("has_yellow_flag"));

    v68 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)objc_msgSend(v68, "initWithResult:table:", MEMORY[0x1E0C9AAB0], v69);

    v71 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v174[0] = v3;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "equalTo:", &unk_1E94E4D30);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v174[1] = v73;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v174, 2);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v71, "initWithExpressions:", v74);
    objc_msgSend(v70, "setWhere:", v75);

    objc_msgSend(v70, "setLimit:", 1);
    objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v70, &unk_1E94E4C40);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v76, CFSTR("has_green_flag"));

    v77 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend(v77, "initWithResult:table:", MEMORY[0x1E0C9AAB0], v78);

    v80 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v173[0] = v3;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "equalTo:", &unk_1E94E4D48);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v173[1] = v82;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 2);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (void *)objc_msgSend(v80, "initWithExpressions:", v83);
    objc_msgSend(v79, "setWhere:", v84);

    objc_msgSend(v79, "setLimit:", 1);
    objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v79, &unk_1E94E4C40);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v85, CFSTR("has_blue_flag"));

    v86 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)objc_msgSend(v86, "initWithResult:table:", MEMORY[0x1E0C9AAB0], v87);

    v89 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v172[0] = v3;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "equalTo:", &unk_1E94E4D60);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v172[1] = v91;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 2);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_msgSend(v89, "initWithExpressions:", v92);
    objc_msgSend(v88, "setWhere:", v93);

    objc_msgSend(v88, "setLimit:", 1);
    objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v88, &unk_1E94E4C40);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v94, CFSTR("has_purple_flag"));

    v95 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = (void *)objc_msgSend(v95, "initWithResult:table:", MEMORY[0x1E0C9AAB0], v96);

    v98 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v171[0] = v3;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flag_color"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "equalTo:", &unk_1E94E4D78);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v171[1] = v100;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v171, 2);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)objc_msgSend(v98, "initWithExpressions:", v101);
    objc_msgSend(v97, "setWhere:", v102);

    objc_msgSend(v97, "setLimit:", 1);
    objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v97, &unk_1E94E4C40);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v103, CFSTR("has_gray_flag"));

    v104 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = (void *)objc_msgSend(v104, "initWithResult:table:", MEMORY[0x1E0C9AAB0], v105);

    v107 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v170[0] = v3;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flagged"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "equalTo:", &unk_1E94E4C40);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v170[1] = v109;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 2);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = (void *)objc_msgSend(v107, "initWithExpressions:", v110);
    objc_msgSend(v106, "setWhere:", v111);

    objc_msgSend(v106, "setLimit:", 1);
    objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v106, &unk_1E94E4C40);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v112, CFSTR("has_unflagged"));

    v113 = MEMORY[0x1E0C9AAA0];
    if (v165[5])
      v114 = v165[5];
    else
      v114 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v114, CFSTR("draft"));
    if (v159[5])
      v115 = v159[5];
    else
      v115 = v113;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v115, CFSTR("replied"));
    if (v153[5])
      v116 = v153[5];
    else
      v116 = v113;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v116, CFSTR("forwarded"));
    if (v147[5])
      v117 = v147[5];
    else
      v117 = v113;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v117, CFSTR("redirected"));
    if (v141[5])
      v118 = v141[5];
    else
      v118 = v113;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v118, CFSTR("has_attachments"));
    if (v135[5])
      v119 = (void *)v135[5];
    else
      v119 = &unk_1E94E4D00;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v119, CFSTR("junk_level"));
    objc_msgSend(*(id *)(a1 + 32), "_messageThreadExpressionForThreadObjectID:", *(_QWORD *)(a1 + 40));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_countMessagesForExpression:", v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v121, CFSTR("count"));

    v132 = 0;
    v122 = objc_msgSend(v131, "executeUpdateStatement:rowsChanged:", v6, &v132);
    if (v132)
      objc_msgSend(*(id *)(a1 + 32), "_addKeyPathsForBasicPropertiesChangeToKeyPaths:", *(_QWORD *)(a1 + 48));

  }
  else
  {
    v122 = 0;
  }

  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(&v140, 8);

  _Block_object_dispose(&v146, 8);
  _Block_object_dispose(&v152, 8);

  _Block_object_dispose(&v158, 8);
  _Block_object_dispose(&v164, 8);

  return v122;
}

void __96__EDThreadPersistence__updateBasicPropertiesAfterDeleteForThreadObjectID_threadScopeDatabaseID___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  v8 = MEMORY[0x1E0C9AAB0];
  if ((v7 & 0x40) != 0)
  {
    v15 = *(_QWORD *)(a1[4] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = MEMORY[0x1E0C9AAB0];

    if ((v7 & 4) == 0)
    {
LABEL_3:
      if ((v7 & 0x100) == 0)
        goto LABEL_4;
LABEL_21:
      v19 = *(_QWORD *)(a1[6] + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v8;

      if ((v7 & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_3;
  }
  v17 = *(_QWORD *)(a1[5] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v8;

  if ((v7 & 0x100) != 0)
    goto LABEL_21;
LABEL_4:
  if ((v7 & 0x200) != 0)
  {
LABEL_5:
    v9 = *(_QWORD *)(a1[7] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
LABEL_6:
  if ((v7 & 0xFC00) != 0 && (v7 & 0xFC00) != 0xFC00)
  {
    v11 = *(_QWORD *)(a1[8] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v8;

  }
  if (v7 >> 31)
  {
    v13 = *(_QWORD *)(a1[9] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = &unk_1E94E4D18;

  }
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40))
      *a4 = 1;
  }
}

- (BOOL)_deleteMailboxesFromWrappedMessages:(id)a3 fromThreadWithDatabaseID:(id)a4 messageThreadExpression:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  EDThreadPersistence *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  -[EDThreadPersistence database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _deleteMailboxesFromWrappedMessages:fromThreadWithDatabaseID:messageThreadExpression:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __108__EDThreadPersistence__deleteMailboxesFromWrappedMessages_fromThreadWithDatabaseID_messageThreadExpression___block_invoke;
  v17[3] = &unk_1E94A25D0;
  v13 = v10;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  v20 = self;
  v15 = v8;
  v21 = v15;
  v22 = &v23;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v17);

  LOBYTE(v8) = v24[3] != 0;
  _Block_object_dispose(&v23, 8);

  return (char)v8;
}

uint64_t __108__EDThreadPersistence__deleteMailboxesFromWrappedMessages_fromThreadWithDatabaseID_messageThreadExpression___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
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
  void *v18;
  id v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithResultColumn:table:", CFSTR("mailbox"), v4);

  objc_msgSend(v5, "setDistinct:", 1);
  objc_msgSend(v5, "setWhere:", *(_QWORD *)(a1 + 32));
  v6 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("thread"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "equalTo:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mailbox"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_mailboxDatabaseIDsForWrappedMessages:", *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "in:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mailbox"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notIn:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v6, "initWithExpressions:", v13);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("thread_mailboxes"), v14);
  v16 = objc_msgSend(v19, "executeDeleteStatement:rowsChanged:", v15, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

  return v16;
}

- (BOOL)_deleteSendersFromThreadWithDatabaseID:(id)a3 messageThreadExpression:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[EDThreadPersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _deleteSendersFromThreadWithDatabaseID:messageThreadExpression:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__EDThreadPersistence__deleteSendersFromThreadWithDatabaseID_messageThreadExpression___block_invoke;
  v13[3] = &unk_1E949C9A8;
  v13[4] = self;
  v10 = v7;
  v14 = v10;
  v11 = v6;
  v15 = v11;
  v16 = &v17;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v13);

  LOBYTE(v6) = v18[3] != 0;
  _Block_object_dispose(&v17, 8);

  return (char)v6;
}

uint64_t __86__EDThreadPersistence__deleteSendersFromThreadWithDatabaseID_messageThreadExpression___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_senderAddressesExpressionForMessages:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("thread"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "equalTo:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notIn:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithExpressions:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("thread_senders"), v11);
  v13 = objc_msgSend(v3, "executeDeleteStatement:rowsChanged:", v12, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v13;
}

- (BOOL)_deleteRecipientsOfType:(unint64_t)a3 fromThreadWithDatabaseID:(id)a4 messageThreadExpression:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a4;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[EDThreadPersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _deleteRecipientsOfType:fromThreadWithDatabaseID:messageThreadExpression:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__EDThreadPersistence__deleteRecipientsOfType_fromThreadWithDatabaseID_messageThreadExpression___block_invoke;
  v15[3] = &unk_1E94A25F8;
  v15[4] = self;
  v19 = a3;
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v17 = v13;
  v18 = &v20;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v15);

  LOBYTE(v8) = v21[3] != 0;
  _Block_object_dispose(&v20, 8);

  return (char)v8;
}

uint64_t __96__EDThreadPersistence__deleteRecipientsOfType_fromThreadWithDatabaseID_messageThreadExpression___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  uint64_t v14;
  id v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_recipientAddressesExpressionForRecipientType:messages:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("thread"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "equalTo:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "equalTo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notIn:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithExpressions:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("thread_recipients"), v12);
  v14 = objc_msgSend(v16, "executeDeleteStatement:rowsChanged:", v13, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v14;
}

- (void)persistenceIsDeletingAllMessagesInMailboxWithURL:(id)a3 generationWindow:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  EDThreadPersistence *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "ec_redactedStringForMailboxURL:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v7;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Persistence is deleting all messages in mailbox %{public}@", buf, 0xCu);

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v5);
  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mailboxPersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__EDThreadPersistence_persistenceIsDeletingAllMessagesInMailboxWithURL_generationWindow___block_invoke;
  v13[3] = &unk_1E94A2620;
  v11 = v8;
  v14 = v11;
  v15 = v10;
  v16 = self;
  v12 = v10;
  -[EDThreadPersistence _enumerateThreadScopesUsingBlock:](self, "_enumerateThreadScopesUsingBlock:", v13);

}

void __89__EDThreadPersistence_persistenceIsDeletingAllMessagesInMailboxWithURL_generationWindow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "scopeContainsMailboxObjectID:mailboxTypeResolver:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) & 1) != 0)objc_msgSend(*(id *)(a1 + 48), "_resetThreadScope:withDatabaseID:", v7, v9);

}

- (void)_resetThreadScope:(id)a3 withDatabaseID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDThreadPersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _resetThreadScope:withDatabaseID:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__EDThreadPersistence__resetThreadScope_withDatabaseID___block_invoke;
  v15[3] = &unk_1E949B7F0;
  v10 = v7;
  v16 = v10;
  v11 = objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v15);

  if (v11)
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Successfully reset thread scope: %{public}@", buf, 0xCu);
    }

    -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeThreadScope:", v6);

    -[EDThreadPersistence hookRegistry](self, "hookRegistry");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject persistenceDidResetThreadScope:](v14, "persistenceDidResetThreadScope:", v6);
  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Failed to reset thread scope: %{public}@", buf, 0xCu);
    }
  }

}

uint64_t __56__EDThreadPersistence__resetThreadScope_withDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "equalTo:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("thread_scopes"), v5);
  v7 = objc_msgSend(v3, "executeDeleteStatement:error:", v6, 0);

  return v7;
}

- (void)persistenceDidDeleteAllMessagesInMailboxesWithURLs:(id)a3 generationWindow:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "ef_map:", &__block_literal_global_285);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Persistence did delete all messages in mailbox %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistenceDidFinishThreadUpdates");

}

id __91__EDThreadPersistence_persistenceDidDeleteAllMessagesInMailboxesWithURLs_generationWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0D1EF48], "ec_redactedStringForMailboxURL:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)persistenceIsChangingConversationID:(int64_t)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v20 = objc_msgSend(v8, "count");
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Persistence is changing conversation ID for %lu messages from %lld", buf, 0x16u);
  }

  -[EDThreadPersistence _filteredPersistedMessagesForPersistedMessages:](self, "_filteredPersistedMessagesForPersistedMessages:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__EDThreadPersistence_persistenceIsChangingConversationID_messages_generationWindow___block_invoke;
  v15[3] = &unk_1E94A2648;
  v18 = a3;
  v15[4] = self;
  v13 = v9;
  v16 = v13;
  v17 = v12;
  v14 = v12;
  -[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:](self, "_iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:", v11, 0, v15);

}

void __85__EDThreadPersistence_persistenceIsChangingConversationID_messages_generationWindow___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
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
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  int v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1E380]);
  v5 = a1[7];
  objc_msgSend(v3, "threadObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithConversationID:threadScope:", v5, v7);

  v9 = (void *)a1[4];
  objc_msgSend(v3, "wrappedMessages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_deleteWrappedMessages:fromThreadWithObjectID:threadScopeDatabaseID:generationWindow:", v10, v8, objc_msgSend(v3, "threadScopeDatabaseID"), a1[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)a1[4];
  objc_msgSend(v3, "wrappedMessages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadObjectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_threadForWrappedMessages:objectID:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)a1[4];
  objc_msgSend(v15, "objectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "_messagesAreJournaledForThreadWithObjectID:", v17);

  if (objc_msgSend(v3, "addThreadReplacingExisting:journaled:", 0, v18))
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = &stru_1E94A4508;
      if ((_DWORD)v18)
        v20 = CFSTR("journaled ");
      v30 = 138412546;
      v31 = v20;
      v32 = 2114;
      v33 = v15;
      _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "Adding %@thread (conversation change): %{public}@", (uint8_t *)&v30, 0x16u);
    }

    v21 = (void *)a1[6];
    objc_msgSend(v3, "threadObjectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "persistenceIsAddingThreadWithObjectID:journaled:generationWindow:", v22, v18, a1[5]);
  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = &stru_1E94A4508;
      if ((_DWORD)v18)
        v24 = CFSTR("journaled ");
      v30 = 138412546;
      v31 = v24;
      v32 = 2114;
      v33 = v15;
      _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_DEFAULT, "Updating %@thread (conversation change): %{public}@", (uint8_t *)&v30, 0x16u);
    }

    objc_msgSend(v3, "updateThreadTableWithJournaled:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v22);
    v25 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v25;
  }

  if (objc_msgSend(v11, "count"))
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "threadObjectID");
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v27;
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_DEFAULT, "Changing thread (conversation change): %{public}@\nkey paths: %{public}@", (uint8_t *)&v30, 0x16u);

    }
    v28 = (void *)a1[6];
    objc_msgSend(v3, "threadObjectID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "persistenceIsChangingThreadWithObjectID:changedKeyPaths:generationWindow:", v29, v11, a1[5]);

  }
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  +[EDThreadPersistence log](EDThreadPersistence, "log", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Persistence did change global-message-id for message", v9, 2u);
  }

  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistenceDidFinishThreadUpdates");

}

- (BOOL)_messagesAreJournaledForThreadWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[EDThreadPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _messagesAreJournaledForThreadWithObjectID:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__EDThreadPersistence__messagesAreJournaledForThreadWithObjectID___block_invoke;
  v9[3] = &unk_1E949AF00;
  v9[4] = self;
  v7 = v4;
  v10 = v7;
  v11 = &v12;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

uint64_t __66__EDThreadPersistence__messagesAreJournaledForThreadWithObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResult:table:", &unk_1E94E4C58, v5);

  objc_msgSend(*(id *)(a1 + 32), "_messageThreadExpressionForThreadObjectID:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("journaled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "equalTo:", &unk_1E94E4C58);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v16[0] = v7;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithExpressions:", v11);
  objc_msgSend(v6, "setWhere:", v12);

  objc_msgSend(v6, "setLimit:", 1);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__EDThreadPersistence__messagesAreJournaledForThreadWithObjectID___block_invoke_2;
  v15[3] = &unk_1E949B090;
  v15[4] = *(_QWORD *)(a1 + 48);
  v13 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v15, 0);

  return v13;
}

uint64_t __66__EDThreadPersistence__messagesAreJournaledForThreadWithObjectID___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v14;
    _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  -[EDThreadPersistence _persistenceDidUpdateReadLaterForMessages:generationWindow:](self, "_persistenceDidUpdateReadLaterForMessages:generationWindow:", v11, v12);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __98__EDThreadPersistence_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke;
  v20[3] = &unk_1E94A2530;
  v20[4] = self;
  v15 = v12;
  v21 = v15;
  v16 = v10;
  v22 = v16;
  -[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:block:](self, "_iterateWrappedMessagesByConversationForPersistedMessages:block:", v11, v20);
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v11, "count"));
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = v18;
    _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Persistence did update read later date for %u messages", buf, 8u);
  }

  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "persistenceDidFinishThreadUpdates");

}

void __98__EDThreadPersistence_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1[4], "_threadExpressionForThreadScopeDatabaseID:conversation:", a2, objc_msgSend(v5, "conversationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(a1[4], "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence persistenceDidChangeReadLaterDate:messages:changeIsRemote:generationWindow:]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__EDThreadPersistence_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke_2;
  v13[3] = &unk_1E949C9A8;
  v14 = a1[5];
  v15 = a1[6];
  v9 = v6;
  v16 = v9;
  v17 = &v18;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v13);

  if (v19[3])
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v5;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Changing thread (readLaterDate change): %{public}@", buf, 0xCu);
    }

    objc_msgSend(a1[4], "hookRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0D1DE28];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistenceIsChangingThreadWithObjectID:changedKeyPaths:generationWindow:", v5, v12, a1[5]);

  }
  _Block_object_dispose(&v18, 8);

}

uint64_t __98__EDThreadPersistence_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("threads"));
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  v5 = *(void **)(a1 + 40);
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("read_later_date"));
  if (!v5)

  objc_msgSend(v4, "setWhereClause:", *(_QWORD *)(a1 + 48));
  v7 = objc_msgSend(v3, "executeUpdateStatement:rowsChanged:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v7;
}

- (void)_persistenceDidUpdateReadLaterForMessages:(id)a3 generationWindow:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D1DE30];
  v11[0] = *MEMORY[0x1E0D1DE28];
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForFiredReadLaterMessages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _persistenceDidUpdateMessages:forFilterPredicate:changedKeyPaths:predicateToIgnore:loggingString:generationWindow:messageTest:](self, "_persistenceDidUpdateMessages:forFilterPredicate:changedKeyPaths:predicateToIgnore:loggingString:generationWindow:messageTest:", v6, 2, v9, v10, CFSTR("read later"), v7, &__block_literal_global_289_0);

}

uint64_t __82__EDThreadPersistence__persistenceDidUpdateReadLaterForMessages_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "readLater");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (void)persistenceDidUpdateFollowUpForMessages:(id)a3 generationWindow:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D1DD88];
  v11[0] = *MEMORY[0x1E0D1DD98];
  v11[1] = v8;
  v11[2] = *MEMORY[0x1E0D1DD90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithActiveFollowUp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _persistenceDidUpdateMessages:forFilterPredicate:changedKeyPaths:predicateToIgnore:loggingString:generationWindow:messageTest:](self, "_persistenceDidUpdateMessages:forFilterPredicate:changedKeyPaths:predicateToIgnore:loggingString:generationWindow:messageTest:", v6, 1, v9, v10, CFSTR("follow up"), v7, &__block_literal_global_292);

}

uint64_t __80__EDThreadPersistence_persistenceDidUpdateFollowUpForMessages_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "followUp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (void)persistenceIsUpdatingDisplayDateForMessage:(id)a3 fromDate:(id)a4 generation:(int64_t)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v12;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(v9, "displayDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke;
  v17[3] = &unk_1E94A26E0;
  v17[4] = self;
  v15 = v10;
  v18 = v15;
  v16 = v13;
  v19 = v16;
  v20 = a5;
  -[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:block:](self, "_iterateWrappedMessagesByConversationForPersistedMessages:block:", v14, v17);

}

void __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  EDPersistenceDatabaseGenerationWindow *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_threadExpressionForThreadScopeDatabaseID:conversation:", a2, objc_msgSend(v7, "conversationID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke_2;
  v35[3] = &unk_1E94A2690;
  v36 = *(id *)(a1 + 40);
  v37 = *(id *)(a1 + 48);
  v11 = objc_msgSend(v8, "ef_all:", v35);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence persistenceIsUpdatingDisplayDateForMessage:fromDate:generation:]_block_invoke");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke_3;
  v22[3] = &unk_1E94A26B8;
  v30 = v11;
  v23 = *(id *)(a1 + 48);
  v15 = v9;
  v16 = *(_QWORD *)(a1 + 32);
  v24 = v15;
  v25 = v16;
  v17 = v7;
  v26 = v17;
  v28 = &v31;
  v18 = v12;
  v27 = v18;
  v29 = a2;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, v22);

  if (v32[3])
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v17;
      _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "Changing thread (displayDate change): %{public}@", buf, 0xCu);
    }

    v20 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    -[EDPersistenceDatabaseGenerationWindow insertGeneration:](v20, "insertGeneration:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "hookRegistry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "persistenceIsChangingThreadWithObjectID:changedKeyPaths:generationWindow:", v17, v18, v20);

  }
  _Block_object_dispose(&v31, 8);

}

uint64_t __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ef_isEarlierThanOrEqualDate:", *(_QWORD *)(a1 + 40));
}

uint64_t __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("threads"));
  v5 = v4;
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("display_date"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("display_date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lessThan:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v23[0] = *(_QWORD *)(a1 + 40);
    v23[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithExpressions:", v9);
    objc_msgSend(v5, "setWhereClause:", v10);

  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0D1F040]);
    v12 = (void *)MEMORY[0x1E0D1EF88];
    v13 = (void *)MEMORY[0x1E0D1EFC0];
    +[EDMessagePersistence messagesDisplayDateColumnName](EDMessagePersistence, "messagesDisplayDateColumnName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "column:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "max:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v11, "initWithResult:table:", v16, v17);

    objc_msgSend(*(id *)(a1 + 48), "_messageThreadExpressionForThreadObjectID:", *(_QWORD *)(a1 + 56));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWhere:", v19);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("display_date"));
    objc_msgSend(v5, "setWhereClause:", *(_QWORD *)(a1 + 40));

  }
  v20 = objc_msgSend(v3, "executeUpdateStatement:rowsChanged:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if ((_DWORD)v20 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:", *MEMORY[0x1E0D1DD68]);
    objc_msgSend(*(id *)(a1 + 48), "_recalculateNewestReadMessageForThreadObjectID:threadScopeDatabaseID:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 48), "_recalculateDisplayMessageForThreadObjectID:threadScopeDatabaseID:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
      objc_msgSend(*(id *)(a1 + 64), "ef_addAbsentObjectsFromArrayAccordingToEquals:", v21);

  }
  return v20;
}

- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v6, "count"));
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Persistence did update display date for %u messages", (uint8_t *)v9, 8u);
  }

  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistenceDidFinishThreadUpdates");

}

- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  EDThreadPersistence *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "flags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "deleted");

  if ((v12 & 1) == 0
    && objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0D1E640])
    && objc_msgSend(v9, "numberOfAttachments"))
  {
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __79__EDThreadPersistence_persistenceDidUpdateProperties_message_generationWindow___block_invoke;
    v19 = &unk_1E94A2708;
    v20 = self;
    v21 = v10;
    -[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:block:](self, "_iterateWrappedMessagesByConversationForPersistedMessages:block:", v13, &v16);

    +[EDThreadPersistence log](EDThreadPersistence, "log", v16, v17, v18, v19, v20);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v8;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Persistence did update properties for message: %{public}@", buf, 0xCu);
    }

    -[EDThreadPersistence hookRegistry](self, "hookRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "persistenceDidFinishThreadUpdates");

  }
}

void __79__EDThreadPersistence_persistenceDidUpdateProperties_message_generationWindow___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_threadExpressionForThreadScopeDatabaseID:conversation:", a2, objc_msgSend(v5, "conversationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence persistenceDidUpdateProperties:message:generationWindow:]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __79__EDThreadPersistence_persistenceDidUpdateProperties_message_generationWindow___block_invoke_2;
  v16 = &unk_1E949AF00;
  v17 = *(id *)(a1 + 40);
  v9 = v6;
  v18 = v9;
  v19 = &v20;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, &v13);

  if (v21[3])
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log", v13, v14, v15, v16, v17);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v5;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Changing thread (hasAttachments change): %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "hookRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0D1DDC0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistenceIsChangingThreadWithObjectID:changedKeyPaths:generationWindow:", v5, v12, *(_QWORD *)(a1 + 40));

  }
  _Block_object_dispose(&v20, 8);

}

uint64_t __79__EDThreadPersistence_persistenceDidUpdateProperties_message_generationWindow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("threads"));
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E94E4C58, CFSTR("has_attachments"));
  objc_msgSend(v4, "setWhereClause:", *(_QWORD *)(a1 + 40));
  v5 = objc_msgSend(v3, "executeUpdateStatement:rowsChanged:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  return v5;
}

- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D1DD28];
  v11[0] = *MEMORY[0x1E0D1DD30];
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForPrimaryMessages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _persistenceDidUpdateMessages:forFilterPredicate:changedKeyPaths:predicateToIgnore:loggingString:generationWindow:messageTest:](self, "_persistenceDidUpdateMessages:forFilterPredicate:changedKeyPaths:predicateToIgnore:loggingString:generationWindow:messageTest:", v6, 4, v9, v10, CFSTR("categorization"), v7, &__block_literal_global_297);

}

uint64_t __86__EDThreadPersistence_persistenceDidChangeCategorizationForMessages_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrimary");

  return v3;
}

- (void)persistenceDidChangeCategoryForBusiness:(int64_t)a3
{
  void *v5;
  EDPersistenceDatabaseGenerationWindow *v6;
  id v7;

  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistedMessagesForBusinessID:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDThreadPersistence persistenceDidChangeCategorizationForMessages:generationWindow:](self, "persistenceDidChangeCategorizationForMessages:generationWindow:", v7, v6);

}

- (void)persistenceDidChangeCategoryForAddressIDs:(id)a3
{
  void *v4;
  void *v5;
  EDPersistenceDatabaseGenerationWindow *v6;
  id v7;

  v7 = a3;
  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistedMessagesFromSendersWithAddressIDs:temporarilyUnavailableMessageObjectIDs:", v7, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDThreadPersistence persistenceDidChangeCategorizationForMessages:generationWindow:](self, "persistenceDidChangeCategorizationForMessages:generationWindow:", v5, v6);

}

- (void)_persistenceDidUpdateMessages:(id)a3 forFilterPredicate:(unint64_t)a4 changedKeyPaths:(id)a5 predicateToIgnore:(id)a6 loggingString:(id)a7 generationWindow:(id)a8 messageTest:(id)a9
{
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  int v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  unint64_t v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  unint64_t v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v40 = a5;
  v38 = a6;
  v42 = a7;
  v41 = a8;
  v43 = a9;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v63 = v17;
    v64 = 2112;
    v65 = v42;
    _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - %{publiC}@", buf, 0x16u);

  }
  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "ef_partition:", v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mailboxPersistence");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mailboxProvider");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "first");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke;
  v55[3] = &unk_1E94A2750;
  v55[4] = self;
  v22 = v37;
  v56 = v22;
  v61 = a4;
  v23 = v40;
  v57 = v23;
  v24 = v41;
  v58 = v24;
  v25 = v42;
  v59 = v25;
  v26 = v39;
  v60 = v26;
  -[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:](self, "_iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:", v20, 0, v55);

  objc_msgSend(v45, "second");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v21;
  v53[1] = 3221225472;
  v53[2] = __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke_298;
  v53[3] = &unk_1E94A2778;
  v36 = v38;
  v54 = v36;
  v46[0] = v21;
  v46[1] = 3221225472;
  v46[2] = __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke_2;
  v46[3] = &unk_1E94A2750;
  v46[4] = self;
  v28 = v22;
  v47 = v28;
  v52 = a4;
  v29 = v24;
  v48 = v29;
  v30 = v23;
  v49 = v30;
  v31 = v25;
  v50 = v31;
  v32 = v26;
  v51 = v32;
  -[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:](self, "_iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:", v27, v53, v46);

  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v44, "count"));
    *(_DWORD *)buf = 138543618;
    v63 = v31;
    v64 = 1024;
    LODWORD(v65) = v34;
    _os_log_impl(&dword_1D2F2C000, v33, OS_LOG_TYPE_DEFAULT, "Persistence did update (%{public}@) for %u messages", buf, 0x12u);
  }

  -[EDThreadPersistence hookRegistry](self, "hookRegistry");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "persistenceDidFinishThreadUpdates");

}

void __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "thread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(*(id *)(a1 + 32), "threadScopeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "precomputedMailboxScopeForThreadScope:mailboxTypeResolver:foundPredicates:", v6, *(_QWORD *)(a1 + 40), &v14);

  if ((*(_QWORD *)(a1 + 80) & v14) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_writeThreadedMessages:withChangedKeyPaths:journaled:generationWindow:", v3, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 64);
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2114;
      v18 = v4;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Changing thread (%{public}@): %{public}@\nkey paths: %{public}@", buf, 0x20u);
    }

    v12 = *(void **)(a1 + 72);
    objc_msgSend(v3, "threadObjectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistenceIsChangingThreadWithObjectID:changedKeyPaths:generationWindow:", v13, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke_298(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D1E248];
  v12[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateFromPredicate:ignoringPredicates:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "evaluateWithObject:", v6);
  return v10;
}

void __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "thread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(*(id *)(a1 + 32), "threadScopeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "precomputedMailboxScopeForThreadScope:mailboxTypeResolver:foundPredicates:", v6, *(_QWORD *)(a1 + 40), &v23);

  if ((*(_QWORD *)(a1 + 80) & v23) != 0)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v3, "wrappedMessages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadObjectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_deleteWrappedMessages:fromThreadWithObjectID:threadScopeDatabaseID:generationWindow:", v10, v11, objc_msgSend(v3, "threadScopeDatabaseID"), *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v13, "ef_addAbsentObjectsFromArrayAccordingToEquals:", *(_QWORD *)(a1 + 56));
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 64);
        objc_msgSend(v3, "threadObjectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v15;
        v26 = 2114;
        v27 = v16;
        v28 = 2114;
        v29 = v13;
        _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Changing thread (%{public}@): %{public}@\nkey paths: %{public}@", buf, 0x20u);

      }
      v17 = *(void **)(a1 + 72);
      objc_msgSend(v3, "threadObjectID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "persistenceIsChangingThreadWithObjectID:changedKeyPaths:generationWindow:", v18, v13, *(_QWORD *)(a1 + 48));

    }
  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(void **)(a1 + 56);
      v20 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      v25 = v20;
      v26 = 2114;
      v27 = v4;
      v28 = 2114;
      v29 = v21;
      _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "Changing thread (%{public}@): %{public}@\nkey paths: %{public}@", buf, 0x20u);
    }

    v22 = *(void **)(a1 + 72);
    objc_msgSend(v3, "threadObjectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "persistenceIsChangingThreadWithObjectID:changedKeyPaths:generationWindow:", v12, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }

}

- (id)_filteredPersistedMessagesForPersistedMessages:(id)a3
{
  objc_msgSend(a3, "ef_filter:", &__block_literal_global_300);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __70__EDThreadPersistence__filteredPersistedMessagesForPersistedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "flags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "deleted") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "isServerSearchResult");
  v5 = v4 ^ 1u;

  return v5;
}

- (void)_iterateWrappedMessagesByConversationForPersistedMessages:(id)a3 messageFilter:(id)a4 writeBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateReceived"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke;
  v19[3] = &unk_1E94A2810;
  v19[4] = self;
  v16 = v13;
  v20 = v16;
  v17 = v9;
  v21 = v17;
  v18 = v10;
  v22 = v18;
  objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, v19);

}

uint64_t __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _EDThreadPersistence_StatementCache *v4;
  void *v5;
  _EDThreadPersistence_StatementCache *v6;
  _QWORD v8[5];
  _EDThreadPersistence_StatementCache *v9;
  id v10;

  v3 = a2;
  v4 = -[_EDThreadPersistence_StatementCache initWithConnection:]([_EDThreadPersistence_StatementCache alloc], "initWithConnection:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_wrappedMessagesByThreadScopeForPersistedMessages:messageFilter:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke_2;
  v8[3] = &unk_1E94A27E8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v9 = v6;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return 1;
}

void __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _EDThreadPersistence_ThreadScope *v8;
  uint64_t v9;
  void *v10;
  _EDThreadPersistence_ThreadScope *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v22 = a3;
  v25 = v5;
  objc_msgSend(*(id *)(a1 + 32), "threadScopeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "databaseIDForThreadScope:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_expressionForThreadScope:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [_EDThreadPersistence_ThreadScope alloc];
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_EDThreadPersistence_ThreadScope initWithCache:messagePersistence:threadScopeDatabaseID:threadScopeExpression:](v8, "initWithCache:messagePersistence:threadScopeDatabaseID:threadScopeExpression:", v9, v10, v7, v23);

  v12 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke_3;
  v30[3] = &unk_1E94A27C0;
  v13 = v12;
  v31 = v13;
  objc_msgSend(v22, "ef_groupBy:", v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E380]), "initWithConversationID:threadScope:", objc_msgSend(v18, "longLongValue"), v25);
        -[_EDThreadPersistence_ThreadScope createMessagesWithThreadObjectID:wrappedMessages:](v11, "createMessagesWithThreadObjectID:wrappedMessages:", v20, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v15);
  }

}

id __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  return v5;
}

- (void)_iterateWrappedMessagesByConversationForPersistedMessages:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateReceived"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence _wrappedMessagesByThreadScopeForPersistedMessages:messageFilter:](self, "_wrappedMessagesByThreadScopeForPersistedMessages:messageFilter:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_block___block_invoke;
  v13[3] = &unk_1E94A2838;
  v13[4] = self;
  v12 = v7;
  v14 = v12;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v13);

}

void __87__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v16 = a3;
  objc_msgSend(*(id *)(a1 + 32), "threadScopeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseIDForThreadScope:", v5);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __87__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_block___block_invoke_2;
  v22[3] = &unk_1E94A27C0;
  v8 = v7;
  v23 = v8;
  objc_msgSend(v16, "ef_groupBy:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E380]), "initWithConversationID:threadScope:", objc_msgSend(v13, "longLongValue"), v5);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }

}

id __87__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_block___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  return v5;
}

- (id)_wrappedMessagesByThreadScopeForPersistedMessages:(id)a3 messageFilter:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v7)
    v7 = &__block_literal_global_307;
  -[EDThreadPersistence _persistedMessagesByPossibleThreadScopeForPersistedMessages:](self, "_persistedMessagesByPossibleThreadScopeForPersistedMessages:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__EDThreadPersistence__wrappedMessagesByThreadScopeForPersistedMessages_messageFilter___block_invoke_2;
  v15[3] = &unk_1E94A28A0;
  v15[4] = self;
  v10 = v7;
  v17 = v10;
  v11 = v8;
  v16 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v16;
  v13 = v11;

  return v13;
}

uint64_t __87__EDThreadPersistence__wrappedMessagesByThreadScopeForPersistedMessages_messageFilter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "evaluateWithObject:");
}

void __87__EDThreadPersistence__wrappedMessagesByThreadScopeForPersistedMessages_messageFilter___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_wrappedMessageForPersistedMessages:threadScope:messageFilter:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)_persistedMessagesByPossibleThreadScopeForPersistedMessages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  id obj;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t i;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxPersistence");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadScopes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v28;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v7, "mailbox");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v8;
          if (!v9)
          {
            v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v10 = objc_alloc(MEMORY[0x1E0D1E1D8]);
            objc_msgSend(v34, "URL");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)objc_msgSend(v10, "initWithURL:", v11);

            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v13 = v29;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v43;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v43 != v15)
                    objc_enumerationMutation(v13);
                  v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
                  objc_msgSend(v17, "mailboxScope");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v18, "scopeContainsMailboxObjectID:mailboxTypeResolver:", v12, v37);

                  if (v19)
                    objc_msgSend(v36, "addObject:", v17);
                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
              }
              while (v14);
            }

            objc_msgSend(v31, "setObject:forKeyedSubscript:", v36, v34);
            v9 = v36;
          }
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v20 = v9;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v39;
            do
            {
              for (k = 0; k != v21; ++k)
              {
                if (*(_QWORD *)v39 != v22)
                  objc_enumerationMutation(v20);
                v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k);
                objc_msgSend(v4, "objectForKeyedSubscript:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v25;
                if (v25)
                {
                  objc_msgSend(v25, "addObject:", v7);
                }
                else
                {
                  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, v24);
                }

              }
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
            }
            while (v21);
          }

          v8 = v34;
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v33);
  }

  return v4;
}

- (id)_wrappedMessageForPersistedMessages:(id)a3 threadScope:(id)a4 messageFilter:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  _EDWrappedMessage *v28;
  void *v29;
  void *v30;
  _EDWrappedMessage *v31;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v34 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16, v8);
  if (v10)
  {
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "globalMessageID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (v16)
        {
          objc_msgSend(v13, "persistentID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v14);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v10);
  }

  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "mailboxScope");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messagesForPersistedMessages:mailboxScope:", obj, v19);
  v36 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "filterPredicate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v20;
  if (v20)
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __85__EDThreadPersistence__wrappedMessageForPersistedMessages_threadScope_messageFilter___block_invoke;
    v43[3] = &unk_1E94A28C8;
    v45 = v34;
    v44 = v20;
    objc_msgSend(v36, "ef_filter:", v43);
    v21 = objc_claimAutoreleasedReturnValue();

    v36 = (id)v21;
  }
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = v36;
  v23 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v40 != v24)
          objc_enumerationMutation(v37);
        v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v26, "objectID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = [_EDWrappedMessage alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v27, "globalMessageID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[_EDWrappedMessage initWithMessage:databaseID:](v28, "initWithMessage:databaseID:", v26, objc_msgSend(v30, "longLongValue"));

        objc_msgSend(v22, "addObject:", v31);
      }
      v23 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v23);
  }

  return v22;
}

uint64_t __85__EDThreadPersistence__wrappedMessageForPersistedMessages_threadScope_messageFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (id)_threadForWrappedMessages:(id)a3 objectID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "ef_mapSelector:", sel_message);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D1E198]);
  objc_msgSend(v6, "threadScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _threadQueryForThreadScope:](self, "_threadQueryForThreadScope:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadScope");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithMessages:originatingQuery:threadScope:", v7, v10, v11);

  objc_msgSend(v12, "thread");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_mailboxDatabaseIDsForWrappedMessages:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "message", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mailboxObjectIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mailboxPersistence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v5, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_addKeyPathsForBasicPropertiesChangeToKeyPaths:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D1DD68];
  v9[0] = *MEMORY[0x1E0D1DD60];
  v9[1] = v4;
  v5 = *MEMORY[0x1E0D1DD80];
  v9[2] = *MEMORY[0x1E0D1DE28];
  v9[3] = v5;
  v6 = *MEMORY[0x1E0D1DDC8];
  v9[4] = *MEMORY[0x1E0D1DD78];
  v9[5] = v6;
  v7 = *MEMORY[0x1E0D1DD58];
  v9[6] = *MEMORY[0x1E0D1DDC0];
  v9[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

}

- (void)_addKeyPathsForDisplayMessageChangeToKeyPaths:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D1DE78];
  v6[0] = *MEMORY[0x1E0D1DE70];
  v6[1] = v4;
  v6[2] = *MEMORY[0x1E0D1DD70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_addAbsentObjectsFromArrayAccordingToEquals:", v5);

}

- (BOOL)_updateNewestReadMessageWithWrappedMessage:(id)a3 threadExpression:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v6, "databaseID");
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    -[EDThreadPersistence database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _updateNewestReadMessageWithWrappedMessage:threadExpression:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__EDThreadPersistence__updateNewestReadMessageWithWrappedMessage_threadExpression___block_invoke;
    v16[3] = &unk_1E94A28F0;
    v20 = v10;
    v13 = v9;
    v17 = v13;
    v18 = v7;
    v19 = &v21;
    objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v16);

    v14 = v22[3] != 0;
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __83__EDThreadPersistence__updateNewestReadMessageWithWrappedMessage_threadExpression___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:conflictResolution:", CFSTR("threads"), 4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("newest_read_message"));

  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithResultColumn:table:", v6, v26);

  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", v26, *MEMORY[0x1E0D1EE00]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("threads"), CFSTR("newest_read_message"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "equalTo:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWhere:", v10);

  v11 = objc_alloc(MEMORY[0x1E0D1F020]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("newest_read_message"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "isNull");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D1EFA0]);
  v15 = a1[4];
  objc_msgSend(v7, "ef_SQLIsolatedExpression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithLeft:operator:right:", v15, 2, v16);
  v28[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v11, "initWithExpressions:", v18);

  v20 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v27[0] = a1[5];
  v27[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithExpressions:", v21);
  objc_msgSend(v3, "setWhereClause:", v22);

  v23 = objc_msgSend(v25, "executeUpdateStatement:rowsChanged:", v3, *(_QWORD *)(a1[6] + 8) + 24);
  return v23;
}

- (BOOL)_recalculateNewestMessageForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _messageThreadExpressionForThreadObjectID:](self, "_messageThreadExpressionForThreadObjectID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[EDThreadPersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _recalculateNewestMessageForThreadObjectID:threadScopeDatabaseID:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__EDThreadPersistence__recalculateNewestMessageForThreadObjectID_threadScopeDatabaseID___block_invoke;
  v15[3] = &unk_1E94A2918;
  v15[4] = self;
  v20 = a4;
  v11 = v6;
  v16 = v11;
  v12 = v7;
  v17 = v12;
  v13 = v8;
  v18 = v13;
  v19 = &v21;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v15);

  LOBYTE(v6) = v22[3] != 0;
  _Block_object_dispose(&v21, 8);

  return (char)v6;
}

uint64_t __88__EDThreadPersistence__recalculateNewestMessageForThreadObjectID_threadScopeDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_upsertForThreadsWithThreadScopeDatabaseID:conversation:", *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 40), "conversationID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D1F040]);
  v6 = (void *)objc_msgSend(v5, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "setWhere:", *(_QWORD *)(a1 + 56));
  +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderByColumn:ascending:", v7, 0);

  objc_msgSend(v6, "setLimit:", 1);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("newest_message"));
  objc_msgSend(v4, "excludedColumnExpressionForColumnName:", CFSTR("newest_message"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("newest_message"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isNot:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhereClause:", v10);

  v11 = objc_msgSend(v3, "executeUpsertStatement:rowsChanged:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  return v11;
}

- (BOOL)_recalculateNewestReadMessageForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _messageThreadExpressionForThreadObjectID:](self, "_messageThreadExpressionForThreadObjectID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[EDThreadPersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _recalculateNewestReadMessageForThreadObjectID:threadScopeDatabaseID:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__EDThreadPersistence__recalculateNewestReadMessageForThreadObjectID_threadScopeDatabaseID___block_invoke;
  v15[3] = &unk_1E94A2918;
  v15[4] = self;
  v20 = a4;
  v11 = v6;
  v16 = v11;
  v12 = v7;
  v17 = v12;
  v13 = v8;
  v18 = v13;
  v19 = &v21;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v15);

  LOBYTE(v6) = v22[3] != 0;
  _Block_object_dispose(&v21, 8);

  return (char)v6;
}

uint64_t __92__EDThreadPersistence__recalculateNewestReadMessageForThreadObjectID_threadScopeDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_upsertForThreadsWithThreadScopeDatabaseID:conversation:", *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 40), "conversationID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D1F040]);
  v6 = (void *)objc_msgSend(v5, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("read"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", &unk_1E94E4C58);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v18[0] = *(_QWORD *)(a1 + 56);
  v18[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExpressions:", v10);
  objc_msgSend(v6, "setWhere:", v11);

  +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderByColumn:ascending:", v12, 0);

  objc_msgSend(v6, "setLimit:", 1);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("newest_read_message"));
  objc_msgSend(v4, "excludedColumnExpressionForColumnName:", CFSTR("newest_read_message"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("newest_read_message"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "isNot:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhereClause:", v15);

  v16 = objc_msgSend(v3, "executeUpsertStatement:rowsChanged:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  return v16;
}

- (id)_recalculateDisplayMessageForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "conversationID", v7);
  -[EDThreadPersistence _threadExpressionForThreadScopeDatabaseID:conversation:](self, "_threadExpressionForThreadScopeDatabaseID:conversation:", a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _messageThreadExpressionForThreadObjectID:](self, "_messageThreadExpressionForThreadObjectID:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[EDThreadPersistence database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _recalculateDisplayMessageForThreadObjectID:threadScopeDatabaseID:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__EDThreadPersistence__recalculateDisplayMessageForThreadObjectID_threadScopeDatabaseID___block_invoke;
  v19[3] = &unk_1E94A2558;
  v19[4] = self;
  v24 = a4;
  v25 = v8;
  v13 = v7;
  v20 = v13;
  v14 = v9;
  v21 = v14;
  v15 = v10;
  v22 = v15;
  v23 = &v26;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v19);

  if (v27[3])
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = v8;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Thread with conversationID %lld display message updated", buf, 0xCu);
    }

    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[EDThreadPersistence _addKeyPathsForDisplayMessageChangeToKeyPaths:](self, "_addKeyPathsForDisplayMessageChangeToKeyPaths:", v17);
    if (-[EDThreadPersistence setPriorityForDisplayMessageSenderForThreadObjectID:](self, "setPriorityForDisplayMessageSenderForThreadObjectID:", v6))
    {
      objc_msgSend(v17, "ef_addObjectIfAbsent:", *MEMORY[0x1E0D1DE60]);
    }
  }
  else
  {
    v17 = (id)MEMORY[0x1E0C9AA60];
  }

  _Block_object_dispose(&v26, 8);
  return v17;
}

uint64_t __89__EDThreadPersistence__recalculateDisplayMessageForThreadObjectID_threadScopeDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v26 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_upsertForThreadsWithThreadScopeDatabaseID:conversation:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", v5, *(_QWORD *)(a1 + 40));

  v7 = *MEMORY[0x1E0D1EE00];
  v8 = (id)objc_msgSend(v6, "join:sourceColumn:targetColumn:", CFSTR("threads"), *MEMORY[0x1E0D1EE00], CFSTR("newest_read_message"));
  objc_msgSend(v6, "setWhere:", *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v6, &unk_1E94E4C40);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", v7, *(_QWORD *)(a1 + 40));
  v10 = (void *)MEMORY[0x1E0D1EFC0];
  v11 = *(_QWORD *)(a1 + 40);
  +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "table:column:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "greaterThan:", v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v28[0] = *(_QWORD *)(a1 + 56);
  v28[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithExpressions:", v16);
  objc_msgSend(v9, "setWhere:", v17);

  +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orderByColumn:ascending:", v18, 1);

  objc_msgSend(v9, "setLimit:", 1);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("newest_read_message"), CFSTR("threads"));
  objc_msgSend(v19, "setWhere:", *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0D1EFF0], "ifNull:second:", v9, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("display_message"));

  objc_msgSend(v3, "excludedColumnExpressionForColumnName:", CFSTR("display_message"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("display_message"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "isNot:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWhereClause:", v23);

  v24 = objc_msgSend(v26, "executeUpsertStatement:rowsChanged:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  return v24;
}

- (BOOL)setPriorityForDisplayMessageSenderForThreadObjectID:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDThreadPersistence _databaseIDForThreadObjectID:](self, "_databaseIDForThreadObjectID:", v4);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[EDThreadPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence setPriorityForDisplayMessageSenderForThreadObjectID:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke;
  v11[3] = &unk_1E949E298;
  v14 = v6;
  v9 = v5;
  v12 = v9;
  v13 = &v15;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v11);

  LOBYTE(v5) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v5;
}

uint64_t __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  v38 = a2;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("thread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "equalTo:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v36 = (void *)v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("address"), CFSTR("thread_senders"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("priority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", &unk_1E94E4DA8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v51[0] = v5;
  v51[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithExpressions:", v9);
  objc_msgSend(v6, "setWhere:", v10);

  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v11 = *MEMORY[0x1E0D1DC08];
  v12 = MEMORY[0x1E0C809B0];
  v48 = *MEMORY[0x1E0D1DC08];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke_314;
  v44[3] = &unk_1E949B090;
  v44[4] = &v45;
  if ((objc_msgSend(v38, "executeSelectStatement:withBlock:error:", v6, v44, 0) & 1) != 0)
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("display_message"), CFSTR("threads"));
    v13 = *MEMORY[0x1E0D1EE00];
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "equalTo:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWhere:", v16);

    v17 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesSenderColumnName](EDMessagePersistence, "messagesSenderColumnName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithResultColumn:table:", v18, a1[4]);

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "in:", v35);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWhere:", v21);

    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = v11;
    v39[0] = v12;
    v39[1] = 3221225472;
    v39[2] = __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke_2;
    v39[3] = &unk_1E949B090;
    v39[4] = &v40;
    if ((objc_msgSend(v38, "executeSelectStatement:withBlock:error:", v19, v39, 0) & 1) != 0)
    {
      v22 = 1;
      if (v46[3] != v41[3])
      {
        *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("thread_senders"));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_1E94E4DC0, CFSTR("priority"));
        v24 = objc_alloc(MEMORY[0x1E0D1EF90]);
        v50[0] = v5;
        v50[1] = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v24, "initWithExpressions:", v25);
        objc_msgSend(v23, "setWhereClause:", v26);

        if ((objc_msgSend(v38, "executeUpdateStatement:error:", v23, 0) & 1) != 0)
        {
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("thread_senders"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E94E4DA8, CFSTR("priority"));
          objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v41[3]);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "equalTo:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = objc_alloc(MEMORY[0x1E0D1EF90]);
          v49[0] = v36;
          v49[1] = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v31, "initWithExpressions:", v32);
          objc_msgSend(v27, "setWhereClause:", v33);

          v22 = objc_msgSend(v38, "executeUpdateStatement:error:", v27, 0);
        }
        else
        {
          v22 = 0;
        }

      }
    }
    else
    {
      v22 = 0;
    }
    _Block_object_dispose(&v40, 8);

  }
  else
  {
    v22 = 0;
  }
  _Block_object_dispose(&v45, 8);

  return v22;
}

void __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke_314(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "databaseIDValue");

  *a4 = 1;
}

void __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "databaseIDValue");

  *a4 = 1;
}

- (id)_upsertForThreadsWithThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc(MEMORY[0x1E0D1F060]);
  v14[0] = CFSTR("scope");
  v14[1] = CFSTR("conversation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTable:conflictTarget:", CFSTR("threads"), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("scope"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("conversation"));

  objc_msgSend(v8, "insertValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E94E4C40, CFSTR("date"));

  objc_msgSend(v8, "insertValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E94E4C40, CFSTR("count"));

  return v8;
}

- (id)_updateForThreadsWithThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4
{
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
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("threads"));
  v7 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("scope"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "equalTo:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("conversation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v7, "initWithExpressions:", v14);
  objc_msgSend(v6, "setWhereClause:", v15);

  return v6;
}

- (id)_countMessagesForExpression:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("message_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D1EFF0];
  objc_msgSend(v4, "concatenate:", CFSTR("-fake-message-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ifNull:second:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EF88], "countDistinct:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithResult:table:", v9, v11);

  objc_msgSend(v12, "setWhere:", v3);
  return v12;
}

- (id)_messageThreadExpressionForThreadObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("conversation_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "threadScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _messageThreadExpressionForThreadScope:conversationExpression:](self, "_messageThreadExpressionForThreadScope:conversationExpression:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_messageThreadExpressionForThreadScope:(id)a3 objectIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a4, "ef_map:", &__block_literal_global_323);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("conversation_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "in:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence _messageThreadExpressionForThreadScope:conversationExpression:](self, "_messageThreadExpressionForThreadScope:conversationExpression:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __72__EDThreadPersistence__messageThreadExpressionForThreadScope_objectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "conversationID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_messageThreadExpressionForThreadScope:(id)a3 conversationExpression:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDThreadPersistence _expressionForThreadScope:](self, "_expressionForThreadScope:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D1EFF0];
  v10 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "table:column:", v11, CFSTR("deleted"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "equalTo:", &unk_1E94E4C40);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "likely:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v19[0] = v14;
  v19[1] = v7;
  v19[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithExpressions:", v16);

  return v17;
}

- (id)_expressionForThreadScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "filterPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _messageFilterExpressionForFilterPredicate:](self, "_messageFilterExpressionForFilterPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "mailboxScope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      v12 = v6;
    }
    else
    {
      -[EDThreadPersistence _messageMailboxesExpressionForMailboxScope:](self, "_messageMailboxesExpressionForMailboxScope:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0D1EF90]);
      v15[0] = v9;
      v15[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v10, "initWithExpressions:", v11);

    }
  }
  else
  {
    objc_msgSend(v4, "mailboxScope");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDThreadPersistence _messageMailboxesExpressionForMailboxScope:](self, "_messageMailboxesExpressionForMailboxScope:", v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)_messageMailboxesExpressionForMailboxScope:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  char v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v10 = (void *)MEMORY[0x1E0C9AAB0];
  }
  else
  {
    v13 = 0;
    -[EDThreadPersistence messagePersistence](self, "messagePersistence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mailboxPersistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allMailboxObjectIDsWithMailboxTypeResolver:forExclusion:", v8, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDThreadPersistence.m"), 2941, CFSTR("Mailbox scope for pre-computed threads should never be for exclusion."));

    }
    -[EDThreadPersistence _messageMailboxesExpressionForMailboxObjectIDs:](self, "_messageMailboxesExpressionForMailboxObjectIDs:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_messageMailboxesExpressionForMailboxType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxPersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxObjectIDsForMailboxType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence _messageMailboxesExpressionForMailboxObjectIDs:](self, "_messageMailboxesExpressionForMailboxObjectIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_messageMailboxesExpressionForMailboxObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxPersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mailbox"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "in:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_messageMailboxesExpressionForAccountObjectIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[EDThreadPersistence messagePersistence](self, "messagePersistence", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxPersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allMailboxes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "accountIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "containsObject:", v13);

        if (v14)
        {
          objc_msgSend(v12, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mailboxPersistence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v5, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mailbox"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "in:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_messageActiveFollowUpExpressionForSentMailboxObjectIDs:(id)a3
{
  void *v4;
  uint64_t v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("follow_up_start_date"), CFSTR("message_global_data"));
  v5 = *MEMORY[0x1E0D1EE00];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("message_global_data"), *MEMORY[0x1E0D1EE00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "table:column:", v8, CFSTR("global_message_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "equalTo:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v10);

  objc_msgSend(v4, "setLimit:", 1);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("follow_up_end_date"), CFSTR("message_global_data"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("message_global_data"), v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "table:column:", v14, CFSTR("global_message_id"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "equalTo:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWhere:", v16);

  objc_msgSend(v11, "setLimit:", 1);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("display_date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "greaterThan:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lessThan:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count")
    && (-[EDThreadPersistence _messageMailboxesExpressionForMailboxObjectIDs:](self, "_messageMailboxesExpressionForMailboxObjectIDs:", v27), v20 = objc_claimAutoreleasedReturnValue(), (v21 = (void *)v20) != 0))
  {
    v22 = (void *)MEMORY[0x1E0D1EF90];
    v29[0] = v18;
    v29[1] = v19;
    v29[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "combined:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = (void *)MEMORY[0x1E0D1EF90];
    v28[0] = v18;
    v28[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "combined:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)_selectFromMessageGlobalDataColumn:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", v3, CFSTR("message_global_data"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("message_global_data"), *MEMORY[0x1E0D1EE00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "table:column:", v7, CFSTR("global_message_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v9);

  objc_msgSend(v4, "setLimit:", 1);
  return v4;
}

- (id)_messageFiredReadLaterExpression:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDThreadPersistence _selectFromMessageGlobalDataColumn:](self, "_selectFromMessageGlobalDataColumn:", CFSTR("read_later_date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("display_date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "greaterThanEqualTo:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count")
    && (-[EDThreadPersistence _messageMailboxesExpressionForAccountObjectIDs:](self, "_messageMailboxesExpressionForAccountObjectIDs:", v4), v8 = objc_claimAutoreleasedReturnValue(), (v9 = (void *)v8) != 0))
  {
    v10 = (void *)MEMORY[0x1E0D1EF90];
    v16[0] = v7;
    v16[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "combined:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D1EF90];
    v15 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "combined:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_expressionFromSelect:(id)a3 equalTo:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D1EFA0]);
  objc_msgSend(v5, "ef_SQLIsolatedExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_SQLIsolatedExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v6)
    v11 = 12;
  else
    v11 = 0;
  v12 = (void *)objc_msgSend(v7, "initWithLeft:operator:right:", v8, v11, v10);

  return v12;
}

- (id)_expressionForCategoryType:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
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
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  -[EDThreadPersistence _selectFromMessageGlobalDataColumn:](self, "_selectFromMessageGlobalDataColumn:", CFSTR("model_category"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _selectFromMessageGlobalDataColumn:](self, "_selectFromMessageGlobalDataColumn:", CFSTR("user_category"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D1EFF0];
  v30 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nullIf:second:", v5, v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v31 = (void *)v8;
  v9 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDBusinessPersistence businessAddressesCategoryColumnName](EDBusinessPersistence, "businessAddressesCategoryColumnName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDBusinessPersistence businessAddressesTableName](EDBusinessPersistence, "businessAddressesTableName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithResultColumn:table:", v10, v11);

  v13 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDBusinessPersistence businessAddressesTableName](EDBusinessPersistence, "businessAddressesTableName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDBusinessPersistence businessAddressesAddressColumnName](EDBusinessPersistence, "businessAddressesAddressColumnName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "table:column:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesSenderColumnName](EDMessagePersistence, "messagesSenderColumnName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "table:column:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "equalTo:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWhere:", v21);

  objc_msgSend(v12, "setLimit:", 1);
  v22 = (void *)MEMORY[0x1E0D1EFF0];
  v32[0] = v31;
  v32[1] = v12;
  v32[2] = v29;
  v32[3] = &unk_1E94E4CE8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "coalesce:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc(MEMORY[0x1E0D1EFA0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithLeft:operator:right:", v24, 0, v26);

  return v27;
}

- (id)_expressionForPredicateForPrimaryMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[EDThreadPersistence _selectFromMessageGlobalDataColumn:](self, "_selectFromMessageGlobalDataColumn:", CFSTR("model_high_impact"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadPersistence _expressionForCategoryType:](self, "_expressionForCategoryType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  -[EDThreadPersistence _expressionFromSelect:equalTo:](self, "_expressionFromSelect:equalTo:", v3, &unk_1E94E4C58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1F020], "combined:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_senderAddressesExpressionForMessages:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesSenderColumnName](EDMessagePersistence, "messagesSenderColumnName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", v5, v6);

  objc_msgSend(v7, "setWhere:", v3);
  return v7;
}

- (id)_recipientAddressesExpressionForRecipientType:(unint64_t)a3 messages:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("address"), CFSTR("recipients"));
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "join:sourceColumn:targetColumn:", v7, CFSTR("message"), *MEMORY[0x1E0D1EE00]);

  v9 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("recipients"), CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "equalTo:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithExpressions:", v13);
  objc_msgSend(v6, "setWhere:", v14);

  return v6;
}

- (id)_messageFilterExpressionForFilterPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v21;
  void *v22;
  uint64_t v23;
  id *v24;
  NSObject *v25;
  id v26;
  void *v27;
  char v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  char v34;

  v4 = a3;
  if (v4)
  {
    -[EDThreadPersistence messagePersistence](self, "messagePersistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxPersistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mailboxProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0;
    v32 = 0;
    v33 = -500;
    v8 = objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesInMailboxObjectID:mailboxObjectID:", v4, &v32);
    v9 = v32;
    v10 = v9;
    if (v8)
    {
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDThreadPersistence _messageMailboxesExpressionForMailboxObjectIDs:](self, "_messageMailboxesExpressionForMailboxObjectIDs:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = 0;
        v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
      goto LABEL_8;
    }
    if (objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesInMailboxWithType:mailboxType:", v4, &v33))
    {
      if (v33 != -500)
      {
        v13 = 0;
        -[EDThreadPersistence _messageMailboxesExpressionForMailboxType:](self, "_messageMailboxesExpressionForMailboxType:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        goto LABEL_19;
      }
LABEL_8:
      v13 = 0;
      v14 = 0;
LABEL_9:
      v12 = 0;
      goto LABEL_19;
    }
    v31 = 0;
    v15 = objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesWithActiveFollowUp:mailboxTypeResolver:inSent:sentMailboxObjectIDs:", v4, v7, &v34, &v31);
    v16 = v31;
    v13 = v16;
    if (v15)
    {
      if (v34 && !objc_msgSend(v16, "count"))
      {
        objc_msgSend(v7, "mailboxObjectIDsForMailboxType:", 4);
        v17 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v17;
      }
      v14 = 0;
      -[EDThreadPersistence _messageActiveFollowUpExpressionForSentMailboxObjectIDs:](self, "_messageActiveFollowUpExpressionForSentMailboxObjectIDs:", v13);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v30 = 0;
    v19 = objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesWithFiredReadLaterDate:accountObjectIDs:", v4, &v30);
    v14 = v30;
    if (v19)
    {
      -[EDThreadPersistence _messageFiredReadLaterExpression:](self, "_messageFiredReadLaterExpression:", v14);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v12 = (void *)v18;
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
    v21 = v4;
    objc_msgSend(v21, "subpredicates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __66__EDThreadPersistence__messageFilterExpressionForFilterPredicate___block_invoke;
    v29[3] = &unk_1E94A2940;
    v29[4] = self;
    objc_msgSend(v12, "ef_compactMap:", v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v21, "compoundPredicateType");
    if (v23)
    {
      if (v23 != 1)
      {
        if (v23 != 2)
        {
          v28 = 1;
LABEL_34:

          if ((v28 & 1) == 0)
            goto LABEL_19;
          goto LABEL_9;
        }
        v24 = (id *)0x1E0D1F020;
        goto LABEL_31;
      }
    }
    else if ((unint64_t)objc_msgSend(v22, "count") >= 2)
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[EDThreadPersistence _messageFilterExpressionForFilterPredicate:].cold.1();

      v26 = objc_alloc(MEMORY[0x1E0D1F010]);
      objc_msgSend(v22, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v26, "initWithExpression:", v27);

      goto LABEL_32;
    }
    v24 = (id *)0x1E0D1EF90;
LABEL_31:
    objc_msgSend(*v24, "combined:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
    v28 = 0;
    goto LABEL_34;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

id __66__EDThreadPersistence__messageFilterExpressionForFilterPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_messageFilterExpressionForFilterPredicate:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_messageIsNotDeletedExpression
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "table:column:", v3, CFSTR("deleted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "equalTo:", &unk_1E94E4C40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFF0], "likely:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_threadQueryForThreadScope:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithThreadScope:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v6 = objc_opt_class();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTargetClass:predicate:sortDescriptors:", v6, v3, v7);

  return v8;
}

- (id)beginMigratingThreadScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id location;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  id v35[5];

  v35[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDThreadPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  objc_msgSend(v5, "requestProtectedDatabaseBackgroundProcessingForDuration:error:", v35, 1200.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v35[0];

  if (!v6)
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDThreadPersistence beginMigratingThreadScope:].cold.1();
    }

  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "databaseIDForThreadScope:", v4);
  v11 = v10 == *MEMORY[0x1E0D1DC08];

  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[EDThreadPersistence _addThreadScopeToDatabase:needsUpdate:lastViewedDate:updateThreadScopeManager:](self, "_addThreadScopeToDatabase:needsUpdate:lastViewedDate:updateThreadScopeManager:", v4, 1, v13, 1);
    *((_BYTE *)v32 + 24) = v14;
  }
  else
  {
    -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "databaseIDForThreadScope:", v4);

    -[EDThreadPersistence database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence beginMigratingThreadScope:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __49__EDThreadPersistence_beginMigratingThreadScope___block_invoke;
    v30[3] = &unk_1E949B778;
    v30[4] = &v31;
    v30[5] = v16;
    objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v17, v30);

  }
  if (*((_BYTE *)v32 + 24))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18 = (void *)MEMORY[0x1E0D1EE90];
    v23 = v12;
    v24 = 3221225472;
    v25 = __49__EDThreadPersistence_beginMigratingThreadScope___block_invoke_2;
    v26 = &unk_1E949AD60;
    objc_copyWeak(&v28, &location);
    v19 = v4;
    v27 = v19;
    objc_msgSend(v18, "tokenWithCancelationBlock:", &v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v6)
    {
      objc_msgSend(v20, "addCancelable:", v6, v23, v24, v25, v26);
      os_unfair_lock_lock(&self->_migratingThreadScopesLock);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backgroundProcessingAssertionsByMigratingThreadScope, "setObject:forKeyedSubscript:", v6, v19);
      os_unfair_lock_unlock(&self->_migratingThreadScopesLock);
    }

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  else
  {
    if (v6)
      objc_msgSend(v6, "cancel");
    v21 = 0;
  }
  _Block_object_dispose(&v31, 8);

  return v21;
}

uint64_t __49__EDThreadPersistence_beginMigratingThreadScope___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("scope"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "equalTo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("threads"), v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "executeDeleteStatement:error:", v7, 0);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

  return v8;
}

void __49__EDThreadPersistence_beginMigratingThreadScope___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Migration cancelled or reset for threadscope - %{public}@", (uint8_t *)&v5, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 10);
    objc_msgSend(*((id *)WeakRetained + 3), "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*((id *)WeakRetained + 4), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 10);
  }

}

- (BOOL)endMigratingThreadScope:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[6];
  uint8_t buf[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "databaseIDForThreadScope:", v4);

  if (v6 == *MEMORY[0x1E0D1DC08])
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v4, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDThreadPersistence endMigratingThreadScope:].cold.1();
    }

    v8 = 0;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 1;
    -[EDThreadPersistence database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence endMigratingThreadScope:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__EDThreadPersistence_endMigratingThreadScope___block_invoke;
    v15[3] = &unk_1E949B778;
    v15[4] = &v18;
    v15[5] = v6;
    objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v15);

    if (*((_BYTE *)v19 + 24))
    {
      -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNeedsUpdate:forThreadScope:", 0, v4);

      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v4;
        _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Migration finished for threadscope - %{public}@", buf, 0xCu);
      }

      os_unfair_lock_lock(&self->_migratingThreadScopesLock);
      -[NSMutableArray removeObject:](self->_migratingThreadScopes, "removeObject:", v4);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundProcessingAssertionsByMigratingThreadScope, "objectForKeyedSubscript:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](self->_backgroundProcessingAssertionsByMigratingThreadScope, "removeObjectForKey:", v4);
      os_unfair_lock_unlock(&self->_migratingThreadScopesLock);
      objc_msgSend(v13, "cancel");

      v8 = *((_BYTE *)v19 + 24) != 0;
    }
    else
    {
      v8 = 0;
    }
    _Block_object_dispose(&v18, 8);
  }

  return v8;
}

uint64_t __47__EDThreadPersistence_endMigratingThreadScope___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("thread_scopes"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("needs_update"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhereClause:", v7);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "executeUpdateStatement:error:", v4, 0);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

  return v8;
}

- (BOOL)addThreads:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "threadScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "databaseIDForThreadScope:", v8);

  -[EDThreadPersistence _expressionForThreadScope:](self, "_expressionForThreadScope:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  -[EDThreadPersistence database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence addThreads:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34__EDThreadPersistence_addThreads___block_invoke;
  v17[3] = &unk_1E94A25F8;
  v17[4] = self;
  v21 = v10;
  v14 = v11;
  v18 = v14;
  v15 = v4;
  v19 = v15;
  v20 = &v22;
  objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v17);

  LOBYTE(v4) = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&v22, 8);

  return (char)v4;
}

uint64_t __34__EDThreadPersistence_addThreads___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _EDThreadPersistence_StatementCache *v4;
  _EDThreadPersistence_ThreadScope *v5;
  void *v6;
  _EDThreadPersistence_ThreadScope *v7;
  void *v8;
  _EDThreadPersistence_ThreadScope *v9;
  _QWORD v11[5];
  _EDThreadPersistence_ThreadScope *v12;
  uint64_t v13;

  v3 = a2;
  v4 = -[_EDThreadPersistence_StatementCache initWithConnection:]([_EDThreadPersistence_StatementCache alloc], "initWithConnection:", v3);
  v5 = [_EDThreadPersistence_ThreadScope alloc];
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_EDThreadPersistence_ThreadScope initWithCache:messagePersistence:threadScopeDatabaseID:threadScopeExpression:](v5, "initWithCache:messagePersistence:threadScopeDatabaseID:threadScopeExpression:", v4, v6, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__EDThreadPersistence_addThreads___block_invoke_2;
  v11[3] = &unk_1E94A2990;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v8 = *(void **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v9 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

  return 1;
}

void __34__EDThreadPersistence_addThreads___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  _QWORD v14[5];

  v13 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1D824B334]();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __34__EDThreadPersistence_addThreads___block_invoke_3;
  v14[3] = &unk_1E94A2968;
  v14[4] = a1[4];
  objc_msgSend(v5, "ef_map:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[5];
  objc_msgSend(v13, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createMessagesWithThreadObjectID:wrappedMessages:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1[6] + 8);
  if (*(_BYTE *)(v11 + 24))
  {
    v12 = objc_msgSend(v10, "addThreadReplacingExisting:journaled:", 1, 0);
    v11 = *(_QWORD *)(a1[6] + 8);
  }
  else
  {
    v12 = 0;
  }
  *(_BYTE *)(v11 + 24) = v12;

  objc_autoreleasePoolPop(v6);
}

_EDLazyWrappedMessage *__34__EDThreadPersistence_addThreads___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _EDLazyWrappedMessage *v4;
  void *v5;
  _EDLazyWrappedMessage *v6;

  v3 = a2;
  v4 = [_EDLazyWrappedMessage alloc];
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_EDLazyWrappedMessage initWithMessage:messagePersistence:](v4, "initWithMessage:messagePersistence:", v3, v5);

  return v6;
}

- (BOOL)deleteThreadsWithObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "databaseIDForThreadScope:", v7);

  objc_msgSend(v4, "ef_map:", &__block_literal_global_347_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  -[EDThreadPersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence deleteThreadsWithObjectIDs:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__EDThreadPersistence_deleteThreadsWithObjectIDs___block_invoke_2;
  v14[3] = &unk_1E949E298;
  v17 = v8;
  v12 = v9;
  v15 = v12;
  v16 = &v18;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v14);

  LOBYTE(v9) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v9;
}

id __50__EDThreadPersistence_deleteThreadsWithObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "conversationID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __50__EDThreadPersistence_deleteThreadsWithObjectIDs___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("scope"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "equalTo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("conversation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "in:", a1[4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D1EFE0]);
  v10 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v16[0] = v6;
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithExpressions:", v11);
  v13 = (void *)objc_msgSend(v9, "initWithTable:where:", CFSTR("threads"), v12);

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "executeDeleteStatement:error:", v13, 0);
  v14 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;

  return v14;
}

- (id)oldestThreadObjectIDForMailbox:(id)a3 threadScope:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD aBlock[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v6 = a3;
  v7 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__37;
  v36 = __Block_byref_object_dispose__37;
  v8 = MEMORY[0x1E0C809B0];
  v37 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke;
  aBlock[3] = &unk_1E94A29B8;
  v31 = &v32;
  v9 = v7;
  v30 = v9;
  v10 = _Block_copy(aBlock);
  -[EDThreadPersistence database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence oldestThreadObjectIDForMailbox:threadScope:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_3;
  v24[3] = &unk_1E94A29E0;
  v24[4] = self;
  v13 = v6;
  v25 = v13;
  v14 = v9;
  v26 = v14;
  v28 = &v38;
  v15 = v10;
  v27 = v15;
  objc_msgSend(v11, "__performReadWithCaller:usingBlock:", v12, v24);

  if (*((_BYTE *)v39 + 24))
  {
    -[EDThreadPersistence database](self, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence oldestThreadObjectIDForMailbox:threadScope:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_4;
    v20[3] = &unk_1E94A2A08;
    v20[4] = self;
    v21 = v13;
    v22 = v14;
    v23 = v15;
    objc_msgSend(v16, "__performWriteWithCaller:usingBlock:", v17, v20);

  }
  v18 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v18;
}

uint64_t __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_2;
  v9[3] = &unk_1E949ADD0;
  v8 = *(_OWORD *)(a1 + 32);
  v5 = (id)v8;
  v10 = v8;
  v6 = objc_msgSend(a2, "executeSelectStatement:withBlock:error:", a3, v9, 0);

  return v6;
}

void __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "databaseIDValue");

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E380]), "initWithConversationID:threadScope:", v4, *(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_statementForOldestThreadInMailbox:threadScope:createMailboxDatabaseIDIfNecessary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = 1;
    *(_BYTE *)(v6 + 24) = 1;
  }

  return v5;
}

uint64_t __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_statementForOldestThreadInMailbox:threadScope:createMailboxDatabaseIDIfNecessary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_4_cold_1();
    }

    v5 = 1;
  }

  return v5;
}

- (id)_statementForOldestThreadInMailbox:(id)a3 threadScope:(id)a4 createMailboxDatabaseIDIfNecessary:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
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
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  _QWORD v33[3];

  v5 = a5;
  v33[2] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v8 = a4;
  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "databaseIDForThreadScope:", v8);

  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mailboxPersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v13, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("conversation"), CFSTR("threads"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("scope"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "equalTo:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("thread"), CFSTR("thread_mailboxes"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mailbox"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "equalTo:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWhere:", v22);

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "in:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v33[0] = v19;
    v33[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithExpressions:", v26);
    objc_msgSend(v16, "setWhere:", v27);

    objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDThreadPersistence _addOrderByToThreadSelect:forSortDescriptors:](self, "_addOrderByToThreadSelect:forSortDescriptors:", v16, v29);

    objc_msgSend(v16, "setLimit:", 1);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)verifyConsistencyOfThreadScope:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EDThreadPersistence consistencyCheckScheduler](self, "consistencyCheckScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  objc_msgSend(*(id *)(a1 + 32), "threadScopeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "databaseIDForThreadScope:", *(_QWORD *)(a1 + 40));

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence verifyConsistencyOfThreadScope:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2;
  v14 = &unk_1E949C190;
  v17 = &v19;
  v18 = v3;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v15 = v6;
  v16 = v7;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, &v11);

  if (!*((_BYTE *)v20 + 24))
  {
    v9 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3, v11, v12, v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_resetThreadScope:withDatabaseID:", v8, v10);

  }
  _Block_object_dispose(&v19, 8);
}

uint64_t __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _BYTE *v57;
  _QWORD v58[8];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  _QWORD v67[4];
  _BYTE buf[24];
  void *v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[5];

  v72[2] = *MEMORY[0x1E0C80C00];
  v54 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("conversation"), CFSTR("threads"));
  objc_msgSend(v3, "addResultColumn:", CFSTR("display_message"));
  objc_msgSend(v3, "addResultColumn:", CFSTR("count"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("display_message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isNull");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", &unk_1E94E4C40);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D1F020];
  v72[0] = v52;
  v72[1] = v6;
  v50 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "combined:", v8);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("scope"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "equalTo:", v10);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D1EF90];
  v71[0] = v53;
  v71[1] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "combined:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWhere:", v13);

  objc_msgSend(v3, "setLimit:", 1);
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v67[3] = *MEMORY[0x1E0D1DC08];
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 1;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 1;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_3;
  v58[3] = &unk_1E94A2A30;
  v58[4] = v67;
  v58[5] = &v63;
  v14 = *(_QWORD *)(a1 + 48);
  v58[6] = &v59;
  v58[7] = v14;
  objc_msgSend(v54, "executeSelectStatement:withBlock:error:", v3, v58, 0);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (*((_BYTE *)v64 + 24))
    {
      if (*((_BYTE *)v60 + 24))
      {
        +[EDThreadPersistence log](EDThreadPersistence, "log");
        v31 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_28;
        objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        v32 = v31;
        __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_4();
      }
      else
      {
        +[EDThreadPersistence log](EDThreadPersistence, "log");
        v31 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_28;
        objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        v32 = v31;
        __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_3();
      }
    }
    else if (*((_BYTE *)v60 + 24))
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      v32 = v31;
      __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_2();
    }
    else
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      v32 = v31;
      __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_1();
    }
    v31 = v32;
    goto LABEL_28;
  }
  v15 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v15, "initWithResult:table:", v16, CFSTR("threads"));

  -[NSObject setWhere:](v49, "setWhere:", v53);
  v17 = objc_msgSend(v54, "countForSelectStatement:", v49);
  v18 = objc_alloc(MEMORY[0x1E0D1F040]);
  v19 = (void *)MEMORY[0x1E0D1EF88];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("conversation_id"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "countDistinct:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v18, "initWithResult:table:", v21, v22);

  objc_msgSend(*(id *)(a1 + 40), "_expressionForThreadScope:", *(_QWORD *)(a1 + 32));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_messageIsNotDeletedExpression");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0D1EF90];
  v70[0] = v48;
  v70[1] = v23;
  v46 = (void *)v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "combined:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "setWhere:", v26);
  v27 = objc_msgSend(v54, "countForSelectStatement:", v47);
  if (v17 == v27)
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v29;
      _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_INFO, "Thread scope is consistent: %{public}@", buf, 0xCu);

    }
    v30 = v46;
  }
  else
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2114;
      v69 = v44;
      _os_log_error_impl(&dword_1D2F2C000, v33, OS_LOG_TYPE_ERROR, "Thread scope is inconsistent - expected %lu threads but %lu threads exist: %{public}@", buf, 0x20u);

    }
    v30 = v46;
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("conversation"), CFSTR("threads"));
    -[NSObject setWhere:](v28, "setWhere:", v53);
    objc_msgSend(v54, "databaseIDsForSelectStatement:", v28);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_alloc(MEMORY[0x1E0D1F040]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "initWithResultColumn:table:", CFSTR("conversation_id"), v35);

    objc_msgSend(v36, "setWhere:", v26);
    objc_msgSend(v54, "databaseIDsForSelectStatement:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *(void **)(a1 + 40);
    if (v17 <= v27)
    {
      objc_msgSend(v38, "_int64SetFromSet:byRemovingIndexesFromSet:andLimitingTo:", v37, v45, 50);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v39, "commaSeparatedString");
        objc_claimAutoreleasedReturnValue();
        __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_6();
      }
    }
    else
    {
      objc_msgSend(v38, "_int64SetFromSet:byRemovingIndexesFromSet:andLimitingTo:", v45, v37, 50);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v39, "commaSeparatedString");
        objc_claimAutoreleasedReturnValue();
        __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_5();
      }
    }

    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v69 = 0;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_349;
    v55[3] = &unk_1E94A2A58;
    v42 = v41;
    v56 = v42;
    v57 = buf;
    objc_msgSend(v39, "enumerateIndexesUsingBlock:", v55);
    objc_msgSend(*(id *)(a1 + 40), "_logFailedVerifyConsistencyForConversationIDs:", v42);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

    _Block_object_dispose(buf, 8);
  }

  v31 = v49;
LABEL_28:

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(v67, 8);

  return 1;
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("conversation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v6, "databaseIDValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("display_message"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (!v10)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
  *a4 = 1;

}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_349(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v8 + 1;
  if (v8 >= 9)
    *a3 = 1;
}

- (void)_logFailedVerifyConsistencyForConversationIDs:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[EDThreadPersistence _logFailedVerifyConsistencyForConversationIDs:].cold.1();
  }

  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistedMessageIDsForMessagesForConversationIDs:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v21, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        +[EDThreadPersistence log](EDThreadPersistence, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = objc_msgSend(v12, "globalMessageID");
          v15 = objc_msgSend(v12, "conversationID");
          objc_msgSend(v12, "displayDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dateReceived");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "readLater");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "followUp");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219266;
          v28 = v14;
          v29 = 2048;
          v30 = v15;
          v31 = 2114;
          v32 = v16;
          v33 = 2114;
          v34 = v17;
          v35 = 2114;
          v36 = v18;
          v37 = 2114;
          v38 = v19;
          _os_log_error_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_ERROR, "\tmessage globalMessageID:%lld, conversationID:%lld, displayDate:%{public}@, dateReceived:%{public}@, readLater:%{public}@, followUp:%{public}@", buf, 0x3Eu);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
    }
    while (v9);
  }

}

- (id)_int64SetFromSet:(id)a3 byRemovingIndexesFromSet:(id)a4 andLimitingTo:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  v8 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v8, "removeIndexes:", v7);
  objc_msgSend(v8, "lowestIndexesInRange:maxCount:", *MEMORY[0x1E0D1ED80], *(_QWORD *)(MEMORY[0x1E0D1ED80] + 8), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_addThreadScopeToDatabase:(id)a3 needsUpdate:(BOOL)a4 lastViewedDate:(id)a5 updateThreadScopeManager:(BOOL)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  SEL v22;
  BOOL v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v11 = a3;
  v12 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  -[EDThreadPersistence database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence _addThreadScopeToDatabase:needsUpdate:lastViewedDate:updateThreadScopeManager:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__EDThreadPersistence__addThreadScopeToDatabase_needsUpdate_lastViewedDate_updateThreadScopeManager___block_invoke;
  v18[3] = &unk_1E94A2A80;
  v18[4] = self;
  v15 = v11;
  v19 = v15;
  v21 = &v25;
  v23 = a4;
  v16 = v12;
  v20 = v16;
  v22 = a2;
  v24 = a6;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, v18);

  LOBYTE(v11) = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v25, 8);

  return (char)v11;
}

uint64_t __101__EDThreadPersistence__addThreadScopeToDatabase_needsUpdate_lastViewedDate_updateThreadScopeManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;

  v3 = a2;
  v16 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_mailboxScopeForThreadScope:andFilterPredicate:", *(_QWORD *)(a1 + 40), &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "mailboxObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mailboxPersistence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v7, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "longLongValue");

    if (v12 == *MEMORY[0x1E0D1DC08])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("EDThreadPersistence.m"), 3444, CFSTR("No mailbox database ID for migrating thread scope"));

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_addThreadScopeToDatabase:withMailboxDatabaseID:filterPredicate:needsUpdate:lastViewedDate:updateThreadScopeManager:connection:", *(_QWORD *)(a1 + 40), v12, v16, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 73), v3);
    goto LABEL_7;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_addThreadScopeToDatabaseWithMailboxType:filterPredicate:needsUpdate:lastViewedDate:connection:", v6, v16, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), v3);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "threadScopeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addThreadScope:withDatabaseID:needsUpdate:lastViewedDate:", *(_QWORD *)(a1 + 40), objc_msgSend(v3, "lastInsertedDatabaseID"), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
LABEL_7:

  }
  v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v13;
}

- (id)_mailboxScopeForThreadScope:(id)a3 andFilterPredicate:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v13;

  v6 = a3;
  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxPersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "precomputedMailboxScopeForThreadScope:mailboxTypeResolver:foundPredicates:", v6, v9, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = v13;

  return v11;
}

- (BOOL)_addThreadScopeToDatabaseWithMailboxType:(id)a3 filterPredicate:(unint64_t)a4 needsUpdate:(BOOL)a5 lastViewedDate:(id)a6 connection:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a5;
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("thread_scopes"), 4);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("mailbox_type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("filter_predicate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("needs_update"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("last_viewed"));
  LOBYTE(v9) = objc_msgSend(v13, "executeInsertStatement:error:", v14, 0);

  return v9;
}

- (BOOL)_addThreadScopeToDatabase:(id)a3 withMailboxDatabaseID:(int64_t)a4 filterPredicate:(unint64_t)a5 needsUpdate:(BOOL)a6 lastViewedDate:(id)a7 updateThreadScopeManager:(BOOL)a8 connection:(id)a9
{
  _BOOL4 v9;
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v25;

  v9 = a8;
  v11 = a6;
  v15 = a3;
  v16 = a7;
  v17 = a9;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("thread_scopes"), 4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("mailbox"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("filter_predicate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("needs_update"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("last_viewed"));
  v25 = 0;
  v22 = objc_msgSend(v17, "executeInsertStatement:rowsChanged:", v18, &v25);
  if (v22 && v25 && v9)
  {
    -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addThreadScope:withDatabaseID:needsUpdate:lastViewedDate:", v15, objc_msgSend(v17, "lastInsertedDatabaseID"), v11, v16);

  }
  return v22;
}

- (BOOL)addThreadScopeToDatabase:(id)a3 needsUpdate:(BOOL)a4 lastViewedDate:(id)a5
{
  return -[EDThreadPersistence _addThreadScopeToDatabase:needsUpdate:lastViewedDate:updateThreadScopeManager:](self, "_addThreadScopeToDatabase:needsUpdate:lastViewedDate:updateThreadScopeManager:", a3, a4, a5, 0);
}

- (id)statisticsForThreadScopesWithDatabaseIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[EDThreadPersistence threadScopeManager](self, "threadScopeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__EDThreadPersistence_statisticsForThreadScopesWithDatabaseIDs___block_invoke;
  v9[3] = &unk_1E94A2AA8;
  v7 = v5;
  v10 = v7;
  -[EDThreadPersistence threadScopeManager:gatherStatisticsForThreadScopesWithDatabaseIDs:block:](self, "threadScopeManager:gatherStatisticsForThreadScopesWithDatabaseIDs:block:", v6, v4, v9);

  return v7;
}

void __64__EDThreadPersistence_statisticsForThreadScopesWithDatabaseIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = (void *)MEMORY[0x1E0D1EF38];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pairWithFirst:second:", v12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

}

- (BOOL)threadScopeManager:(id)a3 mailboxScopeExists:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v5 = a4;
  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxPersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") != 0;

  return v10;
}

- (BOOL)threadScopeManager:(id)a3 isValidMailboxObjectID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[EDThreadPersistence messagePersistence](self, "messagePersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxPersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "legacyMailboxForObjectID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (void)threadScopeManager:(id)a3 gatherStatisticsForThreadScopesWithDatabaseIDs:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  EDThreadPersistence *v15;
  id v16;

  v7 = a4;
  v8 = a5;
  -[EDThreadPersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence threadScopeManager:gatherStatisticsForThreadScopesWithDatabaseIDs:block:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke;
  v13[3] = &unk_1E94A1B78;
  v12 = v7;
  v14 = v12;
  v15 = self;
  v11 = v8;
  v16 = v11;
  objc_msgSend(v9, "__performReadWithCaller:usingBlock:", v10, v13);

}

uint64_t __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke_2;
  v9[3] = &unk_1E94A2B48;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v12 = &v13;
  v9[4] = v4;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _BYTE *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_expressionForThreadScope:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("last_viewed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("date_received"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "greaterThan:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a4;
  v12 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithResult:table:", v13, v14);

  v16 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v29[0] = v25;
  v29[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithExpressions:", v17);
  objc_msgSend(v15, "setWhere:", v18);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("last_viewed"), CFSTR("thread_scopes"));
  objc_msgSend(v19, "addResult:alias:", v15, CFSTR("count"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "equalTo:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWhere:", v21);

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke_3;
  v26[3] = &unk_1E94A2B20;
  v22 = *(void **)(a1 + 40);
  v28 = *(id *)(a1 + 48);
  v23 = v8;
  v27 = v23;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v22, "executeSelectStatement:withBlock:error:", v19, v26, 0);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *v24 = 1;

}

void __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(*(id *)(a1 + 32), "longLongValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("last_viewed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, v6, objc_msgSend(v8, "unsignedIntegerValue"));

}

- (BOOL)threadScopeManager:(id)a3 evictThreadScopesWithDatabaseIDs:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v7 = a4;
  v8 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[EDThreadPersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDThreadPersistence threadScopeManager:evictThreadScopesWithDatabaseIDs:completionBlock:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__EDThreadPersistence_threadScopeManager_evictThreadScopesWithDatabaseIDs_completionBlock___block_invoke;
  v14[3] = &unk_1E94A2B70;
  v11 = v7;
  v15 = v11;
  v17 = &v18;
  v12 = v8;
  v16 = v12;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v14);

  LOBYTE(v7) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v7;
}

uint64_t __91__EDThreadPersistence_threadScopeManager_evictThreadScopesWithDatabaseIDs_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "in:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("thread_scopes"), v5);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "executeDeleteStatement:error:", v6, 0);
  (*(void (**)(void))(a1[5] + 16))();
  v7 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);

  return v7;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (EFScheduler)consistencyCheckScheduler
{
  return self->_consistencyCheckScheduler;
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (EFScheduler)threadRecomputationScheduler
{
  return self->_threadRecomputationScheduler;
}

- (void)setThreadRecomputationScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_threadRecomputationScheduler, a3);
}

- (EFDebouncer)threadRecomputationDebouncer
{
  return self->_threadRecomputationDebouncer;
}

- (void)setThreadRecomputationDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_threadRecomputationDebouncer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadRecomputationDebouncer, 0);
  objc_storeStrong((id *)&self->_threadRecomputationScheduler, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_consistencyCheckScheduler, 0);
  objc_storeStrong((id *)&self->_threadScopeManager, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_backgroundProcessingAssertionsByMigratingThreadScope, 0);
  objc_storeStrong((id *)&self->_migratingThreadScopes, 0);
  objc_storeStrong((id *)&self->_threadObjectIDsToRecompute, 0);
}

id __55___EDThreadPersistence_ThreadMessages_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v2, "databaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v71;
  id v72;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "thread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadScopeDatabaseID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR(":scope"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithLongLong:", objc_msgSend(v7, "conversationID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR(":conversation_id"));

  v9 = *(void **)(a1 + 32);
  v72 = 0;
  objc_msgSend(v9, "_displayWrappedMessageWithNewestReadWrappedMessage:", &v72);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v72;
  v12 = v11;
  if (v11)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "databaseID"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR(":newest_read_message"));

  objc_msgSend(*(id *)(a1 + 32), "wrappedMessages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v15, "databaseID"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR(":newest_message"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "databaseID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR(":display_message"));

  objc_msgSend(v4, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR(":date"));

  objc_msgSend(v4, "displayDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR(":display_date"));

  objc_msgSend(v4, "readLater");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR(":read_later_date"));
  if (!v21)

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "read"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR(":read"));

  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flags");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "flagged"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR(":flagged"));

  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flagColors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberWithBool:", objc_msgSend(v30, "containsIndex:", 0));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR(":has_Red_flag"));

  v32 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flagColors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "containsIndex:", 1));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR(":has_Orange_flag"));

  v35 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flagColors");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "containsIndex:", 2));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR(":has_Yellow_flag"));

  v38 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flagColors");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "numberWithBool:", objc_msgSend(v39, "containsIndex:", 3));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR(":has_Green_flag"));

  v41 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flagColors");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "numberWithBool:", objc_msgSend(v42, "containsIndex:", 4));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR(":has_Blue_flag"));

  v44 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flagColors");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "numberWithBool:", objc_msgSend(v45, "containsIndex:", 5));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR(":has_Purple_flag"));

  v47 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flagColors");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "numberWithBool:", objc_msgSend(v48, "containsIndex:", 6));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR(":has_Gray_flag"));

  v50 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flags");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "numberWithBool:", objc_msgSend(v51, "draft"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR(":draft"));

  v53 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flags");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "numberWithBool:", objc_msgSend(v54, "replied"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR(":replied"));

  v56 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flags");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "numberWithBool:", objc_msgSend(v57, "forwarded"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR(":forwarded"));

  v59 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flags");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "numberWithBool:", objc_msgSend(v60, "redirected"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR(":redirected"));

  v62 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flags");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "numberWithBool:", objc_msgSend(v63, "junkLevelSetByUser"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR(":junk_level_set_by_user"));

  v65 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "flags");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "numberWithUnsignedInteger:", objc_msgSend(v66, "junkLevel"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR(":junk_level"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "hasUnflagged"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR(":has_unflagged"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "hasAttachments"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR(":has_attachments"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR(":count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR(":journaled"));

}

void __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke_2_cold_1();
  }

  if (objc_msgSend(v3, "code") == 19)
    objc_msgSend(*(id *)(a1 + 32), "_collectDebuggingInfo");

}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_cold_1((uint64_t)v2, v3, v4);

}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ROWID"));
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "stringValue");
    objc_claimAutoreleasedReturnValue();
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_91_cold_1();
  }

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_97(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR(":conversation_id"));

}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_98(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_98_cold_1((uint64_t)v2, v3, v4);

}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_100(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("conversation_id"));
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "stringValue");
    objc_claimAutoreleasedReturnValue();
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_100_cold_1();
  }

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_105(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (a1[4])
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1[4], "databaseID"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR(":newest_read_message"));

  if (a1[5])
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1[5], "databaseID"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR(":newest_message"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1[6], "databaseID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR(":display_message"));

}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_106(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_106_cold_1((uint64_t)v2, v3, v4);

}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ROWID"));
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "stringValue");
    objc_claimAutoreleasedReturnValue();
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_108_cold_1();
  }

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke(uint64_t a1, void *a2)
{
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;

  v65 = a2;
  objc_msgSend(*(id *)(a1 + 32), "thread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v4, CFSTR(":conversation_id"));

  objc_msgSend(*(id *)(a1 + 32), "thread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v6, CFSTR(":date"));

  objc_msgSend(*(id *)(a1 + 32), "thread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v8, CFSTR(":display_date"));

  objc_msgSend(v3, "readLater");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v11, CFSTR(":read_later_date"));
  if (!v10)

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadScopeDatabaseID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v12, CFSTR(":scope"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v13, CFSTR(":journaled"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "thread");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "hasUnflagged"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v16, CFSTR(":has_unflagged"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "thread");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "hasAttachments"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v19, CFSTR(":has_attachments"));

  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "flags");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithBool:", objc_msgSend(v21, "read"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v22, CFSTR(":read"));

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "flags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "flagged"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v25, CFSTR(":flagged"));

  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "flags");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "draft"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v28, CFSTR(":draft"));

  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "flags");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberWithBool:", objc_msgSend(v30, "replied"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v31, CFSTR(":replied"));

  v32 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "flags");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "forwarded"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v34, CFSTR(":forwarded"));

  v35 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "flags");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "redirected"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v37, CFSTR(":redirected"));

  v38 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "flags");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "numberWithBool:", objc_msgSend(v39, "junkLevelSetByUser"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v40, CFSTR(":junk_level_set_by_user"));

  v41 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "flags");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "junkLevel"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v43, CFSTR(":junk_level"));

  objc_msgSend(v3, "flagColors");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "containsIndex:", 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v46, CFSTR(":has_Red_flag"));

  objc_msgSend(v3, "flagColors");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "containsIndex:", 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v49, CFSTR(":has_Orange_flag"));

  objc_msgSend(v3, "flagColors");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "containsIndex:", 2);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v52, CFSTR(":has_Yellow_flag"));

  objc_msgSend(v3, "flagColors");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "containsIndex:", 3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v55, CFSTR(":has_Green_flag"));

  objc_msgSend(v3, "flagColors");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "containsIndex:", 4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v58, CFSTR(":has_Blue_flag"));

  objc_msgSend(v3, "flagColors");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "containsIndex:", 5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v61, CFSTR(":has_Purple_flag"));

  objc_msgSend(v3, "flagColors");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "containsIndex:", 6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v64, CFSTR(":has_Gray_flag"));

}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_cold_1();
  }

}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_114(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "thread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "conversationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR(":conversation_id"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadScopeDatabaseID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR(":scope"));

}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_115(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_115_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_116(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

uint64_t __96___EDThreadPersistence_ThreadMessages__newestUnreadWrappedMessagesWithNewestReadWrappedMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __90___EDThreadPersistence_ThreadMessages__displayWrappedMessageWithNewestReadWrappedMessage___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __56___EDThreadPersistence_PersistedThread_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v2, "databaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __64___EDThreadPersistence_PersistedThread_updateNewestReadMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "databaseID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR(":newest_read_message"));

  objc_msgSend(*(id *)(a1 + 40), "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR(":date"));

}

void __64___EDThreadPersistence_PersistedThread_updateNewestReadMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_cold_1();
  }

}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2_cold_1();
  }

}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_184(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateValue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2_185(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) || (objc_msgSend(v7, "ef_isLaterThanDate:") & 1) != 0)
    && ((objc_msgSend(v7, "ef_isEarlierThanDate:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)) & 1) != 0
     || *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40)
     && objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "isEqualToDate:")))
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v8, "databaseID");
    *a4 = 1;
  }

}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR(":display_message"));

}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_4_cold_1();
  }

}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_193(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2_194(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_4_cold_1();
  }

}

void __52___EDThreadPersistence_PersistedThread_addMailboxes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR(":mailbox"));
}

void __52___EDThreadPersistence_PersistedThread_addMailboxes__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __52___EDThreadPersistence_PersistedThread_addMailboxes__block_invoke_2_cold_1();
  }

}

void __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

}

void __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_2_cold_1();
  }

}

void __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_205(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "integerValue");

}

void __65___EDThreadPersistence_PersistedThread_senderDatabaseIDsAndDates__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __65___EDThreadPersistence_PersistedThread_senderDatabaseIDsAndDates__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __65___EDThreadPersistence_PersistedThread_senderDatabaseIDsAndDates__block_invoke_211(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sender"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("date_received"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || objc_msgSend(v6, "ef_isLaterThanDate:", v7))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v4);

  }
}

void __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "sqlHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke_2;
  v14[3] = &unk_1E94A2C48;
  v10 = *(_QWORD *)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v15 = v13;
  v11 = v8;
  v16 = v11;
  v12 = objc_msgSend(v9, "executeUpsertSQL:bindings:errorHandler:", v10, v14, &__block_literal_global_220);

  if (v12 == *MEMORY[0x1E0D1DC08])
    *a4 = 1;
  else
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

void __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR(":address"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR(":date"));

}

void __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke_3_cold_1();
  }

}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_2_cold_1();
  }

}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_225(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "databaseIDValue");

  *a4 = 1;
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_228(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3_cold_1();
  }

}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_230(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "databaseIDValue");

  *a4 = 1;
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_233(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3_234(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3_234_cold_1();
  }

}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_238(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR(":address"));

}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_239(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_239_cold_1();
  }

}

void __85___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR(":recipients_type"));

}

void __85___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __85___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType___block_invoke_2_cold_1();
  }

}

void __85___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType___block_invoke_247(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("address"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("date_received"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || objc_msgSend(v6, "ef_isLaterThanDate:", v7))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v4);

}

void __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "sqlHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke_2;
  v14[3] = &unk_1E94A2F50;
  v14[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v15 = v13;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 48);
  v16 = v10;
  v17 = v11;
  v12 = objc_msgSend(v9, "executeUpsertSQL:bindings:errorHandler:", CFSTR("INSERT INTO thread_recipients( thread,  address,  type,  date,  priority) VALUES( :thread,  :address,  :type,  :date,  0) ON CONFLICT (thread, type, address) DO UPDATE SET   date = max(date, excluded.date) ;"),
          v14,
          &__block_literal_global_254);

  if (v12 == *MEMORY[0x1E0D1DC08])
    *a4 = 1;
  else
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR(":thread"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR(":address"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR(":date"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR(":type"));

}

void __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke_3_cold_1();
  }

}

void __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "thread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR(":conversation_id"));

}

void __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke_2_cold_1();
  }

}

void __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke_258(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "databaseIDValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

void __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke_261(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_fault_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_FAULT, "Unable to create empty temp_persisted_messages: %{public}@", (uint8_t *)&v5, 0xCu);

  }
  __assert_rtn("-[_EDThreadPersistence_PersistedThread _ensureTempMessagesView]_block_invoke", "EDThreadPersistence_ThreadMessages.m", 1094, "0");
}

void __57___EDThreadPersistence_PersistedThread_dropTemporaryView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_fault_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_FAULT, "Failed to drop temp_persisted_messages temp view: %{public}@", (uint8_t *)&v5, 0xCu);

  }
  __assert_rtn("-[_EDThreadPersistence_PersistedThread dropTemporaryView]_block_invoke", "EDThreadPersistence_ThreadMessages.m", 1115, "0");
}

void __53___EDThreadPersistence_ThreadScope_dropTemporaryView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __53___EDThreadPersistence_ThreadScope_dropTemporaryView__block_invoke_cold_1();
  }

}

- (void)persistenceStateForThreadScope:wantsPrecomputed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_6_0(&dword_1D2F2C000, v0, v1, "Client wants to precompute, but we're unable to do so for threadscope: %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)threadForObjectID:originatingQuery:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "Thread has no sender: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)threadForObjectID:originatingQuery:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "Thread has no subject: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Unable to find database ID for thread: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Unable to return thread because database is locked: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Unable to find display message for thread: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Unable to form comparison expression to look up position", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Failed to find next thread", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Failed to find next unjournaled thread", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)threadObjectIDsByNextExistingForThreadObjectIDs:(uint64_t)a1 forSortDescriptors:(uint64_t)a2 journaledThreadsToCheck:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  os_log_t v4;

  OUTLINED_FUNCTION_6(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEBUG, "Looking up next existing threads before %lu threads: %{public}@", v3, 0x16u);
}

- (void)_comparisonExpressionForSortDescriptors:conversationID:threadExpression:threadScopeDatabaseID:connection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_6_0(&dword_1D2F2C000, v0, v1, "Cannot generate expression for unsupported sort descriptors: %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_databaseIDForThreadObjectID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v0, v1, "No conversation ID for thread: %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_databaseIDForThreadObjectID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v0, v1, "Unable to find thread scope database ID for thread: %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __40__EDThreadPersistence__recomputeThreads__block_invoke_3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_6(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to recompute %lu threads: %{public}@", v3, v4);
}

void __89__EDThreadPersistence__getIndividualMailboxScopes_unifiedMailboxThreadScopes_forAccount___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v0, v1, "Thread scope %{public}@ does not have a valid mailbox scope", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_messageFilterExpressionForFilterPredicate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v0, v1, "NOT predicate should only have one subpredicate: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)beginMigratingThreadScope:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "Unable to request background processing assertion: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)endMigratingThreadScope:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6_0(&dword_1D2F2C000, v3, (uint64_t)v3, "Attempting to finish migration for a thread scope which doesn't exist: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_4_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "Unable to get oldest thread object ID for mailbox: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Thread scope is inconsistent - conversation id %lld is empty and has null display message: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Thread scope is inconsistent - conversation id %lld has null display message: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Thread scope is inconsistent - conversation id %lld is empty: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Thread scope is inconsistent - conversation id %lld has unknown consistency issue: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "Conversation IDs in threads but not messages: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "Conversation IDs in messages but not threads: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_logFailedVerifyConsistencyForConversationIDs:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "%{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to add thread: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6_0(&dword_1D2F2C000, a2, a3, "Failed to query thread_scopes: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_91_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_11(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v4, v5, "thread_scopes — ROWID: %@", v6);

  OUTLINED_FUNCTION_2_0();
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_98_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6_0(&dword_1D2F2C000, a2, a3, "Failed to query conversations: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_100_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_11(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v4, v5, "conversations — conversation_id: %@", v6);

  OUTLINED_FUNCTION_2_0();
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_106_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6_0(&dword_1D2F2C000, a2, a3, "Failed to query messages: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_108_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_11(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v4, v5, "messages — ROWID: %@", v6);

  OUTLINED_FUNCTION_2_0();
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to update thread: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_115_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_1D2F2C000, a1, a3, "Failed to get current display message sender.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to get date of newest read / current display messages: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_4_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to update thread display message: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __52___EDThreadPersistence_PersistedThread_addMailboxes__block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to add thread mailbox: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to get current display message sender: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __65___EDThreadPersistence_PersistedThread_senderDatabaseIDsAndDates__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_1D2F2C000, a1, a3, "Failed to get message senders for thread.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke_3_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to add sender: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to get actual display message sender: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3_234_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to clear sender priority: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_239_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to set the sender priority: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __85___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to get message receipients for thread: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke_3_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to add recipient: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to get message row IDs for thread: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __53___EDThreadPersistence_ThreadScope_dropTemporaryView__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "Failed to drop temp_thread_scope_message temp view: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
