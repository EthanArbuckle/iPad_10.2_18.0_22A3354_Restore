@implementation EDMessagePersistence

uint64_t __42__EDMessagePersistence__countForSQLQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "countForSelectStatement:", *(_QWORD *)(a1 + 32));

  return 1;
}

- (int64_t)_countForSQLQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "where"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqual:", MEMORY[0x1E0C9AAA0]),
        v6,
        (v7 & 1) == 0))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    -[EDMessagePersistence database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence _countForSQLQuery:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__EDMessagePersistence__countForSQLQuery___block_invoke;
    v12[3] = &unk_1E949BBD8;
    v14 = &v15;
    v13 = v5;
    objc_msgSend(v9, "__performReadWithCaller:usingBlock:", v10, v12);

    v8 = v16[3];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

uint64_t __49__EDMessagePersistence_performDatabaseReadBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v3, "transactionGeneration"));

  return 1;
}

- (int64_t)countOfJournaledMessagesMatchingQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[EDMessagePersistence queryParser](self, "queryParser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sqlQueryToCountJournaledMessagesForQuery:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[EDMessagePersistence _countForSQLQuery:](self, "_countForSQLQuery:", v6);
  return v7;
}

- (void)performDatabaseReadBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[EDMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence performDatabaseReadBlock:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__EDMessagePersistence_performDatabaseReadBlock___block_invoke;
  v8[3] = &unk_1E949DD40;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v8);

}

- (id)queryWithExpandedMailboxesFromQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessagePersistence mailboxPersistence](self, "mailboxPersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _expandPredicate(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "label");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = CFSTR("<none>");
  -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR(" (expanded mailbox query)"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v12 = objc_msgSend(v4, "targetClass");
  objc_msgSend(v4, "sortDescriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "limit");
  v16 = objc_msgSend(v4, "queryOptions");
  objc_msgSend(v4, "targetClassOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v11, "initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:", v12, v7, v13, v14, v15, v16, v17, v10);

  return v18;
}

+ (NSString)messagesTableName
{
  return (NSString *)CFSTR("messages");
}

+ (NSString)globalMessageIDColumnName
{
  return (NSString *)CFSTR("global_message_id");
}

- (int64_t)countOfMessagesMatchingQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[EDMessagePersistence queryParser](self, "queryParser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sqlCountQueryForQuery:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[EDMessagePersistence _countForSQLQuery:](self, "_countForSQLQuery:", v6);
  return v7;
}

- (EDMessageQueryParser)queryParser
{
  return self->_queryParser;
}

- (void)performDatabaseWorkInBlockWithHighPriority:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDMessagePersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performDatabaseWorkInBlockWithHighPriority:", v5);

}

- (EDMailboxPersistence)mailboxPersistence
{
  return (EDMailboxPersistence *)objc_loadWeakRetained((id *)&self->_mailboxPersistence);
}

- (EFSQLValueExpressable)expressionForFilteringUnavailableMessages
{
  return (EFSQLValueExpressable *)-[EDMessagePersistence _expressionForNonDeletedMessagesDisqualifyingColumn:](self, "_expressionForNonDeletedMessagesDisqualifyingColumn:", 0);
}

+ (NSString)messageGlobalDataTableName
{
  return (NSString *)CFSTR("message_global_data");
}

+ (id)objectPropertyMapperForSchema:(id)a3 protectedSchema:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[19];

  v30[17] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(a1, "addStandardKeyPathMappersToDictionary:schema:protectedSchema:", v8, v6, v7);
  objc_msgSend(a1, "addAdditionalKeyPathMappersToDictionary:schema:", v8, v6);
  objc_msgSend(a1, "addCategoryKeyPathMappersToDictionary:schema:", v8, v6);
  v30[0] = CFSTR("remote_id");
  v30[1] = CFSTR("flags");
  v30[2] = CFSTR("date_sent");
  v30[3] = CFSTR("size");
  v30[4] = CFSTR("mailbox");
  v30[5] = CFSTR("global_message_id");
  v30[6] = CFSTR("message_id");
  v30[7] = CFSTR("subject_prefix");
  v30[8] = CFSTR("date_last_viewed");
  v30[9] = CFSTR("unsubscribe_type");
  v30[10] = CFSTR("document_id");
  v30[11] = CFSTR("journaled");
  v30[12] = CFSTR("content_type");
  v30[13] = CFSTR("original_mailbox");
  v30[14] = CFSTR("encoding");
  v30[15] = CFSTR("external_id");
  v30[16] = CFSTR("unique_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "additionalSelectExpressions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tableRelationshipsForSchema:protectedSchema:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    objc_msgSend(v6, "tableForName:", CFSTR("message_global_data"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D1F048]);
    objc_msgSend(v29, "columnForName:", CFSTR("generated_summary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableForName:", CFSTR("generated_summaries"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rowIDColumn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v12, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:tableAlias:isProtectedTable:", v13, v15, 1, 0, 1);

    v27 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("generated_summaries"));
    v16 = v27;

    v17 = objc_alloc(MEMORY[0x1E0D1EFD0]);
    objc_msgSend(v7, "tableForName:", CFSTR("generated_summaries"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "columnForName:", CFSTR("summary"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithColumn:columnAlias:", v19, CFSTR("generated_summary"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D1DDA0]);

    v21 = objc_alloc(MEMORY[0x1E0D1EFD0]);
    objc_msgSend(v29, "columnForName:", CFSTR("urgent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithColumn:", v22);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D1DDB8]);

  }
  else
  {
    v16 = v11;
  }
  objc_msgSend(v6, "tableForName:", CFSTR("messages"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F018]), "initWithTable:keyPathMappers:tableRelationships:additionalColumns:additionalSelectExpressions:", v24, v8, v16, v9, v10);

  return v25;
}

+ (id)bitExpressionForConversationFlag:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("conversations"), CFSTR("flags"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchesMask:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)protectedTablesAndForeignKeysToResolve:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  *a3 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(a1, "_addressesTableSchema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_subjectsTableSchema", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(a1, "_summariesTableSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  objc_msgSend(a1, "_generatedSummariesTableSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  objc_msgSend(a1, "_protectedMessageDataTableSchema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v8;
  objc_msgSend(a1, "_brandIndicatorsTableSchema");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v9;
  objc_msgSend(a1, "_addressMetadataTableSchema");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)bitExpressionForIsToMe
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D1EFB0];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("messages"), CFSTR("flags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFB0], "leftShift:by:", &unk_1E94E47F0, &unk_1E94E4808);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "and:with:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)bitExpressionForIsCCMe
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D1EFB0];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("messages"), CFSTR("flags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFB0], "leftShift:by:", &unk_1E94E47F0, &unk_1E94E4820);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "and:with:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)bitExpressionForAttachments
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0D1EFB0];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("messages"), CFSTR("flags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFB0], "leftShift:by:", &unk_1E94E4838, &unk_1E94E4850);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "and:with:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightShift:by:", v5, &unk_1E94E4850);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EF98]), "initWithLeft:firstValue:secondValue:between:", v6, &unk_1E94E47F0, &unk_1E94E4868, 1);
  return v7;
}

+ (id)_summariesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("summary"), 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("summaries"), 2, v4);

  v8 = CFSTR("summary");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addUniquenessConstraintForColumns:conflictResolution:", v6, 1);

  return v5;
}

+ (id)_subjectsTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("subject"), 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("subjects"), 2, v4);

  v8 = CFSTR("subject");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addUniquenessConstraintForColumns:conflictResolution:", v6, 1);

  return v5;
}

+ (id)_protectedMessageDataTableSchema
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

+ (id)_addressesTableSchema
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("address"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("comment"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("addresses"), 2, v5);

  v9[0] = CFSTR("address");
  v9[1] = CFSTR("comment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addUniquenessConstraintForColumns:conflictResolution:", v7, 1);

  return v6;
}

+ (id)_addressMetadataTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("address"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("smime_capabilities"), 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("smime_capabilities_date"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("address_metadata"), 2, v6);

  v10 = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addUniquenessConstraintForColumns:conflictResolution:", v8, 1);

  return v7;
}

- (void)setQueryParser:(id)a3
{
  objc_storeStrong((id *)&self->_queryParser, a3);
}

+ (id)_cachedMetadataTableSchema
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
  const __CFString *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("timestamp"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("json_values"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("message_metadata"), 1, CFSTR("message_id"), v5);

  v7 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithTableName:columnNames:", v8, v9);
  objc_msgSend(v6, "addIndex:", v10);

  return v6;
}

+ (id)recipientsTableSchemaAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  EDPersistenceForeignKeyPlaceholder *v14;
  void *v15;
  void *v16;
  EDPersistenceForeignKeyPlaceholder *v17;
  EDPersistenceAssociationPlaceholder *v18;
  void *v19;
  EDPersistenceAssociationPlaceholder *v20;
  EDPersistenceAssociationPlaceholder *v24;
  EDPersistenceForeignKeyPlaceholder *v25;
  const __CFString *v26;
  _QWORD v27[4];
  _QWORD v28[3];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("address"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("type"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("position"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithName:rowIDType:columns:", CFSTR("recipients"), 1, v9);

  v28[0] = CFSTR("message");
  v28[1] = CFSTR("type");
  v28[2] = CFSTR("position");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addUniquenessConstraintForColumns:conflictResolution:", v11, 1);

  v27[0] = CFSTR("message");
  v27[1] = CFSTR("position");
  v27[2] = CFSTR("type");
  v27[3] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addIndexForColumns:", v12);

  v26 = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addIndexForColumns:", v13);

  v14 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v10, "columnForName:", CFSTR("message"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v14, "initWithColumn:tableName:onDelete:onUpdate:", v15, v16, 2, 0);
  v25 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  v18 = [EDPersistenceAssociationPlaceholder alloc];
  objc_msgSend(v10, "columnForName:", CFSTR("address"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v18, "initWithColumn:tableName:", v19, CFSTR("addresses"));
  v24 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)partialMessagesTableSchemaAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  id v5;
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
  EDPersistenceForeignKeyPlaceholder *v36;
  EDPersistenceForeignKeyPlaceholder *v37;
  void *v38;
  EDPersistenceForeignKeyPlaceholder *v39;
  EDPersistenceAssociationPlaceholder *v40;
  EDPersistenceAssociationPlaceholder *v41;
  void *v42;
  EDPersistenceAssociationPlaceholder *v43;
  EDPersistenceAssociationPlaceholder *v44;
  void *v45;
  EDPersistenceAssociationPlaceholder *v46;
  EDPersistenceAssociationPlaceholder *v47;
  void *v48;
  EDPersistenceAssociationPlaceholder *v49;
  EDPersistenceAssociationPlaceholder *v50;
  void *v51;
  EDPersistenceAssociationPlaceholder *v52;
  EDPersistenceAssociationPlaceholder *v53;
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
  EDPersistenceAssociationPlaceholder *v74;
  void *v75;
  void *v76;
  _QWORD v77[6];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[4];
  _QWORD v81[5];
  _QWORD v82[3];
  _QWORD v83[4];
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  _QWORD v87[5];
  _QWORD v88[2];
  const __CFString *v89;
  _QWORD v90[4];
  _QWORD v91[2];
  _QWORD v92[2];
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[27];

  v99[25] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("searchable_message"), 1);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("brand_indicator"), 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(a1, "messagesTableName");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("message_id"), 0, &unk_1E94E4880);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v71;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("global_message_id"), 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v70;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("remote_id"), 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v69;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("document_id"), 1, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v68;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("sender"), 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v99[4] = v67;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("subject_prefix"), 1, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v99[5] = v66;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("subject"), 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v99[6] = v65;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("summary"), 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v99[7] = v64;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date_sent"), 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v99[8] = v63;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date_received"), 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v99[9] = v62;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("mailbox"), 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v99[10] = v61;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("remote_mailbox"), 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v99[11] = v60;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flags"), 0, &unk_1E94E4880);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v99[12] = v59;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("read"), 0, &unk_1E94E4880);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v99[13] = v58;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flagged"), 0, &unk_1E94E4880);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v99[14] = v57;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("deleted"), 0, &unk_1E94E4880);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v99[15] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("size"), 0, &unk_1E94E4880);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v99[16] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("conversation_id"), 0, &unk_1E94E4880);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v99[17] = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date_last_viewed"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v99[18] = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("list_id_hash"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v99[19] = v10;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("unsubscribe_type"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v99[20] = v11;
  v99[21] = v76;
  v99[22] = v75;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("display_date"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v99[23] = v12;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("flag_color"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v99[24] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v5, "initWithName:rowIDType:columns:", v73, 2, v14);

  v98[0] = CFSTR("message_id");
  v98[1] = CFSTR("mailbox");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v16);

  v97[0] = CFSTR("global_message_id");
  v97[1] = CFSTR("mailbox");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v17);

  objc_msgSend(v15, "addIndexForColumns:", &unk_1E94E54E8);
  v96 = CFSTR("sender");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v18);

  v95 = CFSTR("subject");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v19);

  v94 = CFSTR("summary");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v20);

  v93 = CFSTR("date_received");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v21);

  v92[0] = CFSTR("mailbox");
  v92[1] = CFSTR("date_received");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v22);

  v91[0] = CFSTR("mailbox");
  v91[1] = CFSTR("display_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v23);

  v90[0] = CFSTR("mailbox");
  v90[1] = CFSTR("conversation_id");
  v90[2] = CFSTR("date_received");
  v90[3] = CFSTR("deleted");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v24);

  objc_msgSend(v15, "addIndexForColumns:", &unk_1E94E5500);
  v89 = CFSTR("flagged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v25);

  v88[0] = CFSTR("deleted");
  v88[1] = CFSTR("date_received");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v26);

  v87[0] = CFSTR("conversation_id");
  v87[1] = CFSTR("mailbox");
  v87[2] = CFSTR("read");
  v87[3] = CFSTR("date_received");
  v87[4] = CFSTR("deleted");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v27);

  v86 = CFSTR("date_received");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v28);

  objc_msgSend(v15, "addIndexForColumns:", &unk_1E94E5518);
  v85 = CFSTR("list_id_hash");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v29);

  v84 = CFSTR("brand_indicator");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v30);

  v83[0] = CFSTR("conversation_id");
  v83[1] = CFSTR("mailbox");
  v83[2] = CFSTR("flagged");
  v83[3] = CFSTR("deleted");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v31);

  v82[0] = CFSTR("conversation_id");
  v82[1] = CFSTR("mailbox");
  v82[2] = CFSTR("deleted");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v32);

  v81[0] = CFSTR("conversation_id");
  v81[1] = CFSTR("mailbox");
  v81[2] = CFSTR("sender");
  v81[3] = CFSTR("date_received");
  v81[4] = CFSTR("deleted");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v33);

  v80[0] = CFSTR("conversation_id");
  v80[1] = CFSTR("mailbox");
  v80[2] = CFSTR("flags");
  v80[3] = CFSTR("deleted");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v34);

  v79[0] = CFSTR("searchable_message");
  v79[1] = CFSTR("deleted");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndexForColumns:", v35);

  v36 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:]([EDPersistenceForeignKeyPlaceholder alloc], "initWithColumn:tableName:onDelete:onUpdate:", v76, CFSTR("searchable_messages"), 3, 0);
  v78[0] = v36;
  v37 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v15, "columnForName:", CFSTR("global_message_id"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v37, "initWithColumn:tableName:onDelete:onUpdate:", v38, CFSTR("message_global_data"), 2, 0);
  v78[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  v40 = [EDPersistenceAssociationPlaceholder alloc];
  objc_msgSend(v15, "columnForName:", CFSTR("sender"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v40, "initWithColumn:tableName:");
  v77[0] = v74;
  v41 = [EDPersistenceAssociationPlaceholder alloc];
  objc_msgSend(v15, "columnForName:", CFSTR("subject"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v41, "initWithColumn:tableName:", v42, CFSTR("subjects"));
  v77[1] = v43;
  v44 = [EDPersistenceAssociationPlaceholder alloc];
  objc_msgSend(v15, "columnForName:", CFSTR("summary"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v44, "initWithColumn:tableName:", v45, CFSTR("summaries"));
  v77[2] = v46;
  v47 = [EDPersistenceAssociationPlaceholder alloc];
  objc_msgSend(v15, "columnForName:", CFSTR("mailbox"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v47, "initWithColumn:tableName:", v48, CFSTR("mailboxes"));
  v77[3] = v49;
  v50 = [EDPersistenceAssociationPlaceholder alloc];
  objc_msgSend(v15, "columnForName:", CFSTR("conversation_id"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v50, "initWithColumn:tableName:", v51, CFSTR("conversations"));
  v77[4] = v52;
  v53 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:]([EDPersistenceAssociationPlaceholder alloc], "initWithColumn:tableName:", v75, CFSTR("brand_indicators"));
  v77[5] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 6);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_brandIndicatorsTableSchema
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
  _QWORD v14[2];
  const __CFString *v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("url"), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("evidence_url"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "blobColumnWithName:nullable:", CFSTR("indicator"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("indicator_hash"), 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("hash_algorithm"), 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("verified"), 0, &unk_1E94E4880);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("brand_indicators"), 2, v9);

  v15 = CFSTR("url");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addUniquenessConstraintForColumns:conflictResolution:", v11, 1);

  v14[0] = CFSTR("url");
  v14[1] = CFSTR("verified");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addIndexForColumns:", v12);

  return v10;
}

- (id)_expressionForNonDeletedMessagesDisqualifyingColumn:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D1EFE8], "table:column:", CFSTR("messages"), CFSTR("deleted"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "equalTo:", &unk_1E94E4880);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D1EFF0];
    objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("messages"), CFSTR("deleted"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "equalTo:", &unk_1E94E4880);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "likely:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (EFSQLValueExpressable)expressionForFilteringUnavailableMessagesFromCount
{
  return (EFSQLValueExpressable *)-[EDMessagePersistence _expressionForNonDeletedMessagesDisqualifyingColumn:](self, "_expressionForNonDeletedMessagesDisqualifyingColumn:", 0);
}

- (EFSQLValueExpressable)expressionForFilteringUnavailableMessagesFromCountForGlobalMessageQuery
{
  return (EFSQLValueExpressable *)-[EDMessagePersistence _expressionForNonDeletedMessagesDisqualifyingColumn:](self, "_expressionForNonDeletedMessagesDisqualifyingColumn:", 1);
}

+ (NSString)addressesTableName
{
  return (NSString *)CFSTR("addresses");
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  void *v7;
  EDPersistenceForeignKeyPlaceholder *v8;
  void *v9;
  void *v10;
  EDPersistenceForeignKeyPlaceholder *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_messageReferencesTableSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v7, "columnForName:", CFSTR("message"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "messagesTableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v8, "initWithColumn:tableName:onDelete:onUpdate:", v9, v10, 2, 0);
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  *a4 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(a1, "_cachedMetadataTableSchema");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_messageReferencesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("reference"), 0, &unk_1E94E4880);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("is_originator"), 0, &unk_1E94E4880);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("message_references"), 1, v6);

  v12[0] = CFSTR("message");
  v12[1] = CFSTR("reference");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v8);

  v11[0] = CFSTR("reference");
  v11[1] = CFSTR("message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v9);

  return v7;
}

void __27__EDMessagePersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_51;
  log_log_51 = (uint64_t)v1;

}

uint64_t __68__EDMessagePersistence_updateBeforeDisplayForMessagesMatchingQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  v5 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("message_global_data"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("read_later_date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isNotNull");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhere:", v7);

  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__EDMessagePersistence_updateBeforeDisplayForMessagesMatchingQuery___block_invoke_2;
  v25[3] = &unk_1E949AF78;
  v9 = v22;
  v26 = v9;
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v5, v25, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("ROWID"), CFSTR("message_global_data"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("follow_up_end_date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "greaterThan:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWhere:", v13);

  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __68__EDMessagePersistence_updateBeforeDisplayForMessagesMatchingQuery___block_invoke_3;
  v23[3] = &unk_1E949AF78;
  v14 = v9;
  v24 = v14;
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v10, v23, 0);
  if (objc_msgSend(v14, "count"))
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v14, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "persistedMessageIDsForGlobalMessageIDs:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v17, 1, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  return 1;
}

uint64_t __61__EDMessagePersistence__checkForFollowUpExpirationWithQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("ROWID"), CFSTR("message_global_data"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("follow_up_end_date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lessThan:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhere:", v8);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__EDMessagePersistence__checkForFollowUpExpirationWithQuery___block_invoke_2;
  v17[3] = &unk_1E949AF78;
  v9 = v4;
  v18 = v9;
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v5, v17, 0);
  if (objc_msgSend(v9, "count"))
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v9, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistedMessageIDsForGlobalMessageIDs:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v12, 1, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  return 1;
}

- (void)_checkForFollowUpExpirationWithQuery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
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
  uint64_t v21;
  void *v22;
  EDPersistenceDatabaseGenerationWindow *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[6];
  void *v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDMessagePersistence log](EDMessagePersistence, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Checking for expired follow ups for query: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__16;
  v32 = __Block_byref_object_dispose__16;
  v33 = 0;
  -[EDMessagePersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence _checkForFollowUpExpirationWithQuery:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__EDMessagePersistence__checkForFollowUpExpirationWithQuery___block_invoke;
  v27[3] = &unk_1E949AFC8;
  v27[4] = self;
  v27[5] = &buf;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v27);

  if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
  {
    v8 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v4, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_mailboxPersistence);
    objc_msgSend(v8, "mailboxScopeForPredicate:withMailboxTypeResolver:", v9, WeakRetained);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDMessagePersistence messagesForPersistedMessages:mailboxScope:](self, "messagesForPersistedMessages:mailboxScope:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v4, "predicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithActiveFollowUp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateFromPredicate:ignoringPredicates:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1E248], "predicateStrippingSpotlightOnlyTerms:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "filteredArrayUsingPredicate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ef_mapSelector:", sel_objectID);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessagePersistence persistedMessagesForObjectIDs:requireProtectedData:](self, "persistedMessagesForObjectIDs:requireProtectedData:", v20, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v21;

  }
  if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
  {
    v23 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    -[EDMessagePersistence hookRegistry](self, "hookRegistry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "persistenceWillBeginUpdates");

    -[EDMessagePersistence persistFollowUp:forMessages:](self, "persistFollowUp:forMessages:", 0, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    -[EDMessagePersistence hookRegistry](self, "hookRegistry");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "persistenceDidUpdateFollowUpForMessages:generationWindow:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v23);

    -[EDMessagePersistence hookRegistry](self, "hookRegistry");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "persistenceDidFinishUpdates");

  }
  _Block_object_dispose(&buf, 8);

}

- (void)updateBeforeDisplayForMessagesMatchingQuery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[6];
  uint8_t v24[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDMessagePersistence _checkForFollowUpExpirationWithQuery:](self, "_checkForFollowUpExpirationWithQuery:", v4);
  +[EDMessagePersistence log](EDMessagePersistence, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Updating display dates for query %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__16;
  v31 = __Block_byref_object_dispose__16;
  v32 = 0;
  -[EDMessagePersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence updateBeforeDisplayForMessagesMatchingQuery:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68__EDMessagePersistence_updateBeforeDisplayForMessagesMatchingQuery___block_invoke;
  v23[3] = &unk_1E949AFC8;
  v23[4] = self;
  v23[5] = &buf;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v23);

  if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
  {
    v8 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v4, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_mailboxPersistence);
    objc_msgSend(v8, "mailboxScopeForPredicate:withMailboxTypeResolver:", v9, WeakRetained);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDMessagePersistence messagesForPersistedMessages:mailboxScope:](self, "messagesForPersistedMessages:mailboxScope:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v4, "predicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateStrippingSpotlightOnlyTerms:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "filteredArrayUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ef_filter:", &__block_literal_global_499);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "ef_mapSelector:", sel_objectID);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessagePersistence persistedMessagesForObjectIDs:requireProtectedData:](self, "persistedMessagesForObjectIDs:requireProtectedData:", v18, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v19;

  }
  if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
    -[EDMessagePersistence updateBeforeDisplayForPersistedMessages:](self, "updateBeforeDisplayForPersistedMessages:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  +[EDMessagePersistence log](EDMessagePersistence, "log");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
    *(_DWORD *)v24 = 138543618;
    v25 = v4;
    v26 = 2048;
    v27 = v22;
    _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "Updated display dates for query %{public}@ (%lu messages)", v24, 0x16u);
  }

  _Block_object_dispose(&buf, 8);
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EDMessagePersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_51 != -1)
    dispatch_once(&log_onceToken_51, block);
  return (id)log_log_51;
}

uint64_t __115__EDMessagePersistence__iteratePersistedMessagesMatchingQuery_limit_cancelationToken_requireProtectedData_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  NSObject *v10;
  char v11;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 72) && (objc_msgSend(v3, "protectedDatabaseAttached") & 1) == 0)
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      objc_claimAutoreleasedReturnValue();
      __85__EDMessagePersistence__iterateMessagesMatchingQuery_limit_cancelationToken_handler___block_invoke_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sqlQueryForQuery:connection:", *(_QWORD *)(a1 + 40), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v5, "length"))
    {
      objc_msgSend(v4, "preparedStatementForQueryString:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "createContextForIteration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __115__EDMessagePersistence__iteratePersistedMessagesMatchingQuery_limit_cancelationToken_requireProtectedData_handler___block_invoke_364;
      v16[3] = &unk_1E949DEA0;
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v4;
      v8 = v7;
      v18 = v8;
      v20 = *(id *)(a1 + 56);
      v19 = *(id *)(a1 + 48);
      v15 = 0;
      v9 = objc_msgSend(v6, "executeUsingBlock:error:", v16, &v15);
      v10 = v15;
      if (v10)
        v11 = v9;
      else
        v11 = 1;
      if ((v11 & 1) == 0)
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    else
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "protectedDatabaseAttached");
        NSStringFromBOOL();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v13;
        v23 = 2114;
        v24 = v14;
        _os_log_error_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Unable to form sql query, protected data available: %{public}@", buf, 0x16u);

      }
    }

  }
  return 1;
}

- (id)sqlQueryForQuery:(id)a3 connection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id obj;
  EDMessagePersistence *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = self;
  v32 = a4;
  v28 = v6;
  -[EDMessagePersistence queriesSeparatedByMailboxForQuery:](self, "queriesSeparatedByMailboxForQuery:", v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v29, "count") < 2)
  {
    -[EDMessagePersistence queryParser](self, "queryParser");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sqlQueryForQuery:protectedDataAvailable:", v6, objc_msgSend(v32, "protectedDatabaseAttached"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "queryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v29;
  v7 = 0;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v8)
    goto LABEL_25;
  v9 = 0;
  v10 = 1;
  v11 = *(_QWORD *)v34;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v34 != v11)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x1D824B334]();
      -[EDMessagePersistence queryParser](v31, "queryParser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sqlQueryForQuery:protectedDataAvailable:", v13, objc_msgSend(v32, "protectedDatabaseAttached"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queryString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17 || (++v10, v10 > 0x1F4))
      {
LABEL_11:

        v7 = 0;
        v19 = 2;
        goto LABEL_12;
      }
      if (v7)
      {
        v18 = objc_msgSend(v7, "length");
        if ((unint64_t)(v18 + objc_msgSend(v17, "length") - 49000001) < 0xFFFFFFFFFD050F7FLL)
          goto LABEL_11;
        v23 = objc_msgSend(v7, "rangeOfString:options:range:", CFSTR(" ORDER "), 5, v9, v18 - v9);
        if (v23 != 0x7FFFFFFFFFFFFFFFLL
          || (v23 = objc_msgSend(v7, "rangeOfString:options:range:", CFSTR(" LIMIT "), 5, v9, v18 - v9),
              v9 = v18,
              v23 != 0x7FFFFFFFFFFFFFFFLL))
        {
          v9 = v23;
          objc_msgSend(v7, "deleteCharactersInRange:");
        }
        objc_msgSend(v7, "appendString:", CFSTR(" UNION "));
        objc_msgSend(v7, "appendString:", v17);
        v19 = 0;
      }
      else
      {
        v20 = objc_msgSend(v17, "length");
        v21 = objc_msgSend(obj, "count");
        if ((unint64_t)(v21 * v20) >= 0x2FAF080)
          v22 = 50000000;
        else
          v22 = v21 * v20;
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", v22);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v17);
        v19 = 3;
      }
LABEL_12:

      objc_autoreleasePoolPop(v14);
      if (v19 != 3 && v19)
        goto LABEL_25;
      ++v12;
    }
    while (v8 != v12);
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v8 = v24;
  }
  while (v24);
LABEL_25:

LABEL_27:
  return v7;
}

- (id)queriesSeparatedByMailboxForQuery:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "sortDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_simplifiedPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessagePersistence _predicatesSeparatedByMailboxOrAccountForPredicate:containsMailboxPredicate:](self, "_predicatesSeparatedByMailboxOrAccountForPredicate:containsMailboxPredicate:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__EDMessagePersistence_queriesSeparatedByMailboxForQuery___block_invoke;
    v12[3] = &unk_1E949DEF0;
    v13 = v4;
    objc_msgSend(v9, "ef_map:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)persistedMessagesMatchingQuery:(id)a3 limit:(int64_t)a4 requireProtectedData:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v5 = a5;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __82__EDMessagePersistence_persistedMessagesMatchingQuery_limit_requireProtectedData___block_invoke;
  v24[3] = &unk_1E949DDB0;
  v11 = v9;
  v25 = v11;
  -[EDMessagePersistence iteratePersistedMessagesMatchingQuery:limit:cancelationToken:requireProtectedData:handler:](self, "iteratePersistedMessagesMatchingQuery:limit:cancelationToken:requireProtectedData:handler:", v8, a4, 0, v5, v24);
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v8, "sortDescriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    v20 = 3221225472;
    v21 = __82__EDMessagePersistence_persistedMessagesMatchingQuery_limit_requireProtectedData___block_invoke_362;
    v22 = &unk_1E949DE78;
    v13 = v11;
    v23 = v13;
    v14 = objc_msgSend(v12, "ef_all:", &v19);

    if (v14)
    {
      objc_msgSend(v8, "sortDescriptors", v19, v20, v21, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sortUsingDescriptors:", v15);

    }
    v16 = v13;

  }
  else
  {
    v17 = v11;
  }

  return v11;
}

- (void)_iteratePersistedMessagesMatchingQuery:(id)a3 limit:(int64_t)a4 cancelationToken:(id)a5 requireProtectedData:(BOOL)a6 handler:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  SEL v34;
  BOOL v35;

  v11 = a3;
  v29 = a5;
  v28 = a7;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = objc_alloc(MEMORY[0x1E0D1E2C0]);
    v13 = objc_msgSend(v11, "targetClass");
    objc_msgSend(v11, "predicate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortDescriptors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suggestion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "queryOptions");
    objc_msgSend(v11, "targetClassOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v12, "initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:", v13, v24, v14, v15, a4, v16, v17, v18);

    v11 = (id)v19;
  }
  -[EDMessagePersistence database](self, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence _iteratePersistedMessagesMatchingQuery:limit:cancelationToken:requireProtectedData:handler:]");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __115__EDMessagePersistence__iteratePersistedMessagesMatchingQuery_limit_cancelationToken_requireProtectedData_handler___block_invoke;
  v30[3] = &unk_1E949DEC8;
  v35 = a6;
  v34 = a2;
  v30[4] = self;
  v27 = v11;
  v31 = v27;
  v22 = v28;
  v33 = v22;
  v23 = v29;
  v32 = v23;
  objc_msgSend(v20, "__performReadWithCaller:usingBlock:", v21, v30);

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EDMessagePersistence_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_3 != -1)
    dispatch_once(&signpostLog_onceToken_3, block);
  return (OS_os_log *)(id)signpostLog_log_3;
}

void __35__EDMessagePersistence_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_3;
  signpostLog_log_3 = (uint64_t)v1;

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

- (EDMessagePersistence)initWithMailboxPersistence:(id)a3 database:(id)a4 hookRegistry:(id)a5 userProfileProvider:(id)a6 blockedSenderManager:(id)a7 vipReader:(id)a8 gmailLabelPersistence:(id)a9
{
  id v15;
  id v16;
  id v17;
  EDMessagePersistence *v18;
  EDMessagePersistence *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *cachedMetadataIsolation;
  EDMessageTransformer *v23;
  void *v24;
  uint64_t v25;
  EDMessageTransformer *messageTransformer;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v15 = a3;
  v29 = a4;
  v28 = a5;
  v30 = a6;
  v16 = a7;
  v17 = a8;
  v31.receiver = self;
  v31.super_class = (Class)EDMessagePersistence;
  v18 = -[EDMessagePersistence init](&v31, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_mailboxPersistence, v15);
    objc_storeStrong((id *)&v19->_database, a4);
    objc_storeStrong((id *)&v19->_hookRegistry, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.mail.EDMessagePersistence.message_metadata", v20);
    cachedMetadataIsolation = v19->_cachedMetadataIsolation;
    v19->_cachedMetadataIsolation = (OS_dispatch_queue *)v21;

    v23 = [EDMessageTransformer alloc];
    objc_msgSend(v15, "mailboxProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[EDMessageTransformer initWithMailboxProvider:userProfileProvider:blockedSenderManager:vipReader:](v23, "initWithMailboxProvider:userProfileProvider:blockedSenderManager:vipReader:", v24, v30, v16, v17);
    messageTransformer = v19->_messageTransformer;
    v19->_messageTransformer = (EDMessageTransformer *)v25;

    objc_storeStrong((id *)&v19->_blockedSenderManager, a7);
    objc_storeStrong((id *)&v19->_userProfileProvider, a6);
    objc_storeStrong((id *)&v19->_vipReader, a8);
  }

  return v19;
}

- (void)test_tearDown
{
  id v4;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessagePersistence.m"), 167, CFSTR("%s can only be called from unit tests"), "-[EDMessagePersistence test_tearDown]");

  }
}

+ (id)messagesDateReceivedColumnName
{
  return CFSTR("date_received");
}

+ (id)messagesDisplayDateColumnName
{
  return CFSTR("display_date");
}

+ (id)messagesSenderColumnName
{
  return CFSTR("sender");
}

+ (NSString)generatedSummariesTableName
{
  return (NSString *)CFSTR("generated_summaries");
}

+ (NSString)messageGlobalDataUserCategoryColumnName
{
  return (NSString *)CFSTR("user_category");
}

+ (NSString)messageGlobalDataModelCategoryColumnName
{
  return (NSString *)CFSTR("model_category");
}

+ (NSString)messageGlobalDataCategoryModelVersionColumnName
{
  return (NSString *)CFSTR("category_model_version");
}

+ (NSString)messageGlobalDataModelSubcategoryColumnName
{
  return (NSString *)CFSTR("model_subcategory");
}

+ (NSString)messageGlobalDataHighImpactColumnName
{
  return (NSString *)CFSTR("model_high_impact");
}

+ (NSString)messageBusinessCategoryColumnAlias
{
  return (NSString *)CFSTR("business_category");
}

+ (NSString)messageGlobalDataModelAnalyticsColumnName
{
  return (NSString *)CFSTR("model_analytics");
}

+ (NSString)messageGlobalDataValidationState
{
  return (NSString *)CFSTR("validation_state");
}

+ (NSString)addressesTableDomainColumnName
{
  return (NSString *)CFSTR("domain");
}

+ (NSString)addressesTableBusinessesColumnName
{
  return (NSString *)CFSTR("business");
}

+ (void)addStandardKeyPathMappersToDictionary:(id)a3 schema:(id)a4 protectedSchema:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  _QWORD v96[5];
  _QWORD v97[5];
  _QWORD v98[5];
  _QWORD v99[6];

  v8 = a3;
  v9 = a4;
  v95 = a5;
  v93 = v9;
  objc_msgSend(v9, "tableForName:", CFSTR("messages"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tableForName:", CFSTR("message_global_data"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v10, "columnForName:", CFSTR("read"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithColumn:", v13);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D1DE20]);

  v15 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v10, "columnForName:", CFSTR("deleted"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithColumn:", v16);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("flags.deleted"));

  v18 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v10, "columnForName:", CFSTR("flagged"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithColumn:", v19);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D1DE18]);

  v21 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v10, "columnForName:", CFSTR("flag_color"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithColumn:", v22);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D1DE10]);

  v24 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v95, "tableForName:", CFSTR("addresses"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "columnForName:", CFSTR("address"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v24, "initWithColumn:sourceTableAlias:columnAlias:", v26, CFSTR("sender"), CFSTR("sender_address"));

  v92 = (void *)v27;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("senderAddress.emailAddressValue.simpleAddress"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D1DE50]);
  v28 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v95, "tableForName:", CFSTR("addresses"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "columnForName:", CFSTR("comment"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v28, "initWithColumn:sourceTableAlias:columnAlias:", v30, CFSTR("sender"), CFSTR("sender_comment"));

  v94 = (void *)v31;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("senderAddress.emailAddressValue.displayName"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D1DE58]);
  v32 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v10, "columnForName:", CFSTR("date_received"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithColumn:", v33);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, CFSTR("date"));

  v35 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v10, "columnForName:", CFSTR("display_date"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v35, "initWithColumn:", v36);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D1DD68]);

  v38 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v10, "rowIDColumn");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v38, "initWithColumn:", v39);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v40, CFSTR("rowid"));

  v41 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v95, "tableForName:", CFSTR("subjects"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "columnForName:", CFSTR("subject"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v41, "initWithColumn:", v43);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v44, CFSTR("subject.subjectWithoutPrefix"));

  v45 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v95, "tableForName:", CFSTR("summaries"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "columnForName:", CFSTR("summary"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v45, "initWithColumn:", v47);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0D1DE78]);

  v49 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v10, "columnForName:", CFSTR("conversation_id"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v49, "initWithColumn:", v50);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, CFSTR("conversationID"));

  v52 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  +[EDPersistenceDatabaseSchema mailboxesTableName](EDPersistenceDatabaseSchema, "mailboxesTableName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tableForName:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDPersistenceDatabaseSchema mailboxURLColumnName](EDPersistenceDatabaseSchema, "mailboxURLColumnName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "columnForName:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v52, "initWithColumn:", v56);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v57, CFSTR("mailboxObjectIDs.url.absoluteString"));

  v58 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v10, "columnForName:", CFSTR("message_id"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v58, "initWithColumn:", v59);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v60, CFSTR("messageID"));

  v61 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v11, "columnForName:", CFSTR("read_later_date"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v61, "initWithColumn:columnAlias:", v62, CFSTR("read_later_date"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v63, *MEMORY[0x1E0D1DE28]);

  v64 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v11, "columnForName:", CFSTR("send_later_date"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v64, "initWithColumn:columnAlias:", v65, CFSTR("send_later_date"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v66, *MEMORY[0x1E0D1DE48]);

  v67 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v11, "columnForName:", CFSTR("follow_up_start_date"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v67, "initWithColumn:columnAlias:", v68, CFSTR("follow_up_start_date"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v69, *MEMORY[0x1E0D1DD98]);

  v70 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v11, "columnForName:", CFSTR("follow_up_end_date"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v70, "initWithColumn:columnAlias:", v71, CFSTR("follow_up_end_date"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0D1DD88]);

  v73 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v11, "columnForName:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)objc_msgSend(v73, "initWithColumn:", v74);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v75, CFSTR("followUp.jsonStringForModelEvaluationForSuggestions"));

  v76 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v95, "tableForName:", CFSTR("brand_indicators"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "columnForName:", CFSTR("url"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)objc_msgSend(v76, "initWithColumn:columnAlias:", v78, CFSTR("brand_indicator_location"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v79, CFSTR("brandIndicatorLocation"));

  v80 = objc_alloc(MEMORY[0x1E0D1EFD0]);
  objc_msgSend(v10, "columnForName:", CFSTR("list_id_hash"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)objc_msgSend(v80, "initWithColumn:", v81);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v82, CFSTR("listIDHash"));

  v83 = objc_alloc(MEMORY[0x1E0D1EFB8]);
  v84 = MEMORY[0x1E0C809B0];
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __85__EDMessagePersistence_addStandardKeyPathMappersToDictionary_schema_protectedSchema___block_invoke;
  v99[3] = &__block_descriptor_40_e61____EFSQLValueExpressable__24__0___EFSQLValueExpressable__8Q16l;
  v99[4] = a1;
  v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:table:", CFSTR("flags"), CFSTR("conversations"));
  v86 = (void *)objc_msgSend(v83, "initWithSourceTableName:creationBlock:selectResultExpression:selectResultAlias:", CFSTR("conversations"), v99, v85, CFSTR("conversation_flags"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v86, CFSTR("conversationNotificationLevel.isNotify"));

  v98[0] = v84;
  v98[1] = 3221225472;
  v98[2] = __85__EDMessagePersistence_addStandardKeyPathMappersToDictionary_schema_protectedSchema___block_invoke_2;
  v98[3] = &__block_descriptor_40_e61____EFSQLValueExpressable__24__0___EFSQLValueExpressable__8Q16l;
  v98[4] = a1;
  v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFB8]), "initWithSourceTableName:creationBlock:selectResultExpression:selectResultAlias:", CFSTR("conversations"), v98, 0, 0);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v87, CFSTR("conversationNotificationLevel.isMute"));

  v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFB8]), "initWithSourceTableName:creationBlock:selectResultExpression:selectResultAlias:", CFSTR("conversations"), &__block_literal_global_40, 0, 0);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v88, *MEMORY[0x1E0D1DDC0]);

  v97[0] = v84;
  v97[1] = 3221225472;
  v97[2] = __85__EDMessagePersistence_addStandardKeyPathMappersToDictionary_schema_protectedSchema___block_invoke_4;
  v97[3] = &__block_descriptor_40_e61____EFSQLValueExpressable__24__0___EFSQLValueExpressable__8Q16l;
  v97[4] = a1;
  v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFB8]), "initWithSourceTableName:creationBlock:selectResultExpression:selectResultAlias:", CFSTR("messages"), v97, 0, 0);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v89, *MEMORY[0x1E0D1DE80]);

  v96[0] = v84;
  v96[1] = 3221225472;
  v96[2] = __85__EDMessagePersistence_addStandardKeyPathMappersToDictionary_schema_protectedSchema___block_invoke_5;
  v96[3] = &__block_descriptor_40_e61____EFSQLValueExpressable__24__0___EFSQLValueExpressable__8Q16l;
  v96[4] = a1;
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFB8]), "initWithSourceTableName:creationBlock:selectResultExpression:selectResultAlias:", CFSTR("messages"), v96, 0, 0);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v90, *MEMORY[0x1E0D1DD38]);

  v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFB8]), "initWithSourceTableName:creationBlock:selectResultExpression:selectResultAlias:", CFSTR("messages"), &__block_literal_global_199, 0, 0);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v91, CFSTR("recipients"));

}

id __85__EDMessagePersistence_addStandardKeyPathMappersToDictionary_schema_protectedSchema___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bitExpressionForConversationFlag:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __85__EDMessagePersistence_addStandardKeyPathMappersToDictionary_schema_protectedSchema___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bitExpressionForConversationFlag:", 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __85__EDMessagePersistence_addStandardKeyPathMappersToDictionary_schema_protectedSchema___block_invoke_3()
{
  +[EDMessagePersistence bitExpressionForAttachments](EDMessagePersistence, "bitExpressionForAttachments");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __85__EDMessagePersistence_addStandardKeyPathMappersToDictionary_schema_protectedSchema___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_recipientClauseForType:addressValue:", 1, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __85__EDMessagePersistence_addStandardKeyPathMappersToDictionary_schema_protectedSchema___block_invoke_5(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_recipientClauseForType:addressValue:", 2, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __85__EDMessagePersistence_addStandardKeyPathMappersToDictionary_schema_protectedSchema___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("message"), CFSTR("recipients"));
  v4 = *MEMORY[0x1E0D1EE00];
  v5 = (id)objc_msgSend(v3, "join:sourceColumn:targetColumn:", CFSTR("addresses"), CFSTR("address"), *MEMORY[0x1E0D1EE00]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("addresses"), CFSTR("address"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EFCFBE98))
  {
    objc_msgSend(v6, "in:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWhere:", v7);
  }
  else
  {
    objc_msgSend(v2, "ef_SQLIsolatedExpression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "equalTo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWhere:", v8);

  }
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("messages"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_SQLIsolatedExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "in:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_recipientClauseForType:(unint64_t)a3 addressValue:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
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
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("message"), CFSTR("recipients"));
  v7 = *MEMORY[0x1E0D1EE00];
  v8 = (id)objc_msgSend(v6, "join:sourceColumn:targetColumn:", CFSTR("addresses"), CFSTR("address"), *MEMORY[0x1E0D1EE00]);
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EFCFBE98))
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("addresses"), CFSTR("address"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "in:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("addresses"), CFSTR("address"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_SQLIsolatedExpression");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "equalTo:", v10);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("recipients"), CFSTR("type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "equalTo:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D1EF90];
  v22[0] = v11;
  v22[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "combined:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v17);

  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("messages"), v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_SQLIsolatedExpression");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "in:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (void)addAdditionalKeyPathMappersToDictionary:(id)a3 schema:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(a4, "tableForName:", CFSTR("messages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFB8]), "initWithSourceTableName:creationBlock:selectResultExpression:selectResultAlias:", CFSTR("conversations"), &__block_literal_global_259, 0, 0);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D1DDD8]);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFB8]), "initWithSourceTableName:creationBlock:selectResultExpression:selectResultAlias:", CFSTR("conversations"), &__block_literal_global_260, 0, 0);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D1DDD0]);

  objc_msgSend(v5, "columnForName:", CFSTR("sender_vip"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D1EFD0]);
    objc_msgSend(v5, "columnForName:", CFSTR("sender_vip"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithColumn:", v10);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D1DDE0]);

  }
}

id __71__EDMessagePersistence_addAdditionalKeyPathMappersToDictionary_schema___block_invoke()
{
  +[EDMessagePersistence bitExpressionForIsToMe](EDMessagePersistence, "bitExpressionForIsToMe");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __71__EDMessagePersistence_addAdditionalKeyPathMappersToDictionary_schema___block_invoke_2()
{
  +[EDMessagePersistence bitExpressionForIsCCMe](EDMessagePersistence, "bitExpressionForIsCCMe");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)addCategoryKeyPathMappersToDictionary:(id)a3 schema:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v5 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    objc_msgSend(v5, "tableForName:", CFSTR("message_global_data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D1EFD0]);
    objc_msgSend(v6, "columnForName:", CFSTR("user_category"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithColumn:", v8);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v9, CFSTR("category.userCategory"));

    v10 = objc_alloc(MEMORY[0x1E0D1EFD0]);
    objc_msgSend(v6, "columnForName:", CFSTR("model_category"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithColumn:", v11);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v12, CFSTR("category.modelCategory"));

    v13 = objc_alloc(MEMORY[0x1E0D1EFD0]);
    objc_msgSend(v6, "columnForName:", CFSTR("model_high_impact"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithColumn:", v14);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D1DD28]);

    v16 = objc_alloc(MEMORY[0x1E0D1EFD0]);
    objc_msgSend(v6, "columnForName:", CFSTR("validation_state"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithColumn:", v17);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v18, CFSTR("validation.state"));

    v19 = objc_alloc(MEMORY[0x1E0D1EFD0]);
    objc_msgSend(v6, "columnForName:", CFSTR("model_subcategory"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithColumn:", v20);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v21, CFSTR("category.subCategory"));

    v22 = objc_alloc(MEMORY[0x1E0D1EFD0]);
    objc_msgSend(v6, "columnForName:", CFSTR("category_model_version"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithColumn:", v23);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v24, CFSTR("category.modelVersion"));

    if (_os_feature_enabled_impl())
    {
      +[EDBusinessPersistence businessAddressesTableName](EDBusinessPersistence, "businessAddressesTableName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tableForName:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_alloc(MEMORY[0x1E0D1EFD0]);
      +[EDBusinessPersistence businessAddressesBusinessColumnName](EDBusinessPersistence, "businessAddressesBusinessColumnName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "columnForName:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v27, "initWithColumn:", v29);
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D1DD18]);

      v31 = objc_alloc(MEMORY[0x1E0D1EFD0]);
      +[EDBusinessPersistence businessAddressesCategoryColumnName](EDBusinessPersistence, "businessAddressesCategoryColumnName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "columnForName:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDMessagePersistence messageBusinessCategoryColumnAlias](EDMessagePersistence, "messageBusinessCategoryColumnAlias");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v31, "initWithColumn:columnAlias:", v33, v34);
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("category.senderCategory"));

    }
  }

}

+ (id)tableRelationshipsForSchema:(id)a3 protectedSchema:(id)a4
{
  id v5;
  void *v6;
  void *v7;
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
  id v22;
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
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
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
  id v73;
  void *v74;
  _QWORD v75[9];
  _QWORD v76[11];

  v76[9] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v73 = a4;
  v74 = v5;
  objc_msgSend(v5, "tableForName:", CFSTR("messages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableForName:", CFSTR("message_global_data"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSenderPersistence sendersTableName](EDSenderPersistence, "sendersTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableForName:", v7);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v73, "tableForName:", CFSTR("brand_indicators"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D1F048]);
  objc_msgSend(v6, "columnForName:", CFSTR("brand_indicator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "rowIDColumn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v8, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:tableAlias:isProtectedTable:", v9, v10, 1, 0, 1);

  +[EDSenderPersistence senderAddressesTableName](EDSenderPersistence, "senderAddressesTableName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "tableForName:", v11);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D1F048]);
  objc_msgSend(v6, "columnForName:", CFSTR("sender"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSenderPersistence senderAddressesAddressColumnName](EDSenderPersistence, "senderAddressesAddressColumnName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "columnForName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v12, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:", v13, v15, 1);

  v16 = objc_alloc(MEMORY[0x1E0D1F048]);
  +[EDSenderPersistence senderAddressesSenderColumnName](EDSenderPersistence, "senderAddressesSenderColumnName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "columnForName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "rowIDColumn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v16, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:", v18, v19, 1);

  if (_os_feature_enabled_impl())
  {
    +[EDBusinessPersistence businessAddressesTableName](EDBusinessPersistence, "businessAddressesTableName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "tableForName:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc(MEMORY[0x1E0D1F048]);
    objc_msgSend(v6, "columnForName:", CFSTR("sender"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDBusinessPersistence businessAddressesAddressColumnName](EDBusinessPersistence, "businessAddressesAddressColumnName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "columnForName:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v22, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:", v23, v25, 1);

  }
  else
  {
    v62 = 0;
  }
  v26 = objc_alloc(MEMORY[0x1E0D1F048]);
  objc_msgSend(v6, "columnForName:", CFSTR("sender"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "tableForName:", CFSTR("addresses"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowIDColumn");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v26, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:tableAlias:isProtectedTable:", v27, v29, 1, CFSTR("sender"), 1);

  v30 = objc_alloc(MEMORY[0x1E0D1F048]);
  objc_msgSend(v6, "columnForName:", CFSTR("subject"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "tableForName:", CFSTR("subjects"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowIDColumn");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v30, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:tableAlias:isProtectedTable:", v31, v33, 1, 0, 1);

  v34 = objc_alloc(MEMORY[0x1E0D1F048]);
  objc_msgSend(v6, "columnForName:", CFSTR("summary"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "tableForName:", CFSTR("summaries"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowIDColumn");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v34, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:tableAlias:isProtectedTable:", v35, v37, 1, 0, 1);

  v38 = objc_alloc(MEMORY[0x1E0D1F048]);
  objc_msgSend(v6, "columnForName:", CFSTR("global_message_id"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "rowIDColumn");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v38, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:", v39, v40, 1);

  v42 = objc_alloc(MEMORY[0x1E0D1F048]);
  objc_msgSend(v6, "columnForName:", CFSTR("mailbox"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDPersistenceDatabaseSchema mailboxesTableName](EDPersistenceDatabaseSchema, "mailboxesTableName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "tableForName:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowIDColumn");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v42, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:", v43, v46, 1);

  v48 = objc_alloc(MEMORY[0x1E0D1F048]);
  objc_msgSend(v6, "columnForName:", CFSTR("conversation_id"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "tableForName:", CFSTR("conversations"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rowIDColumn");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v48, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:", v49, v51, 1);

  v53 = objc_alloc(MEMORY[0x1E0C99E08]);
  v75[0] = CFSTR("brand_indicators");
  v76[0] = v68;
  +[EDSenderPersistence senderAddressesTableName](EDSenderPersistence, "senderAddressesTableName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v54;
  v76[1] = v67;
  +[EDSenderPersistence sendersTableName](EDSenderPersistence, "sendersTableName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v55;
  v75[3] = CFSTR("addresses");
  v76[2] = v66;
  v76[3] = v65;
  v75[4] = CFSTR("subjects");
  v75[5] = CFSTR("summaries");
  v76[4] = v64;
  v76[5] = v63;
  v75[6] = CFSTR("message_global_data");
  v76[6] = v41;
  +[EDPersistenceDatabaseSchema mailboxesTableName](EDPersistenceDatabaseSchema, "mailboxesTableName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v75[7] = v56;
  v75[8] = CFSTR("conversations");
  v76[7] = v47;
  v76[8] = v52;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 9);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v53, "initWithDictionary:", v57);

  if (_os_feature_enabled_impl())
  {
    +[EDBusinessPersistence businessAddressesTableName](EDBusinessPersistence, "businessAddressesTableName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forKeyedSubscript:", v62, v59);

  }
  v60 = (void *)objc_msgSend(v58, "copy");

  return v60;
}

+ (id)additionalSelectExpressions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (EFSQLValueExpressable)expressionForFindingOnlyJournaledMessages
{
  return (EFSQLValueExpressable *)MEMORY[0x1E0C9AAA0];
}

+ (id)messageGlobalDataTableSchemaAndAssociationsToResolve:(id *)a3
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
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  EDPersistenceAssociationPlaceholder *v27;
  void *v28;
  EDPersistenceAssociationPlaceholder *v29;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  EDPersistenceAssociationPlaceholder *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[2];
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  void *v50;
  uint64_t v51;
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
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message_id"), 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v39;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("follow_up_start_date"), 1);
  v51 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v51;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("follow_up_end_date"), 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v36;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"), 1, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v35;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("download_state"), 0, &unk_1E94E4880);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v34;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("read_later_date"), 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v33;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("send_later_date"), 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v32;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("validation_state"), 0, &unk_1E94E4880);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("model_category"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("model_subcategory"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("category_model_version"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("user_category"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("model_analytics"), 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("model_high_impact"), 0, &unk_1E94E4880);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("generated_summary"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v10;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("urgent"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 16);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F050]), "initWithName:rowIDType:columns:", CFSTR("message_global_data"), 2, v38);
  v49 = CFSTR("message_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addUniquenessConstraintForColumns:conflictResolution:", v13, 1);

  v48 = CFSTR("follow_up_start_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIndexForColumns:", v14);

  v47 = CFSTR("follow_up_end_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIndexForColumns:", v15);

  v46 = CFSTR("follow_up_jsonstringformodelevaluationforsuggestions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIndexForColumns:", v16);

  v45 = CFSTR("read_later_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIndexForColumns:", v17);

  v44 = CFSTR("send_later_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIndexForColumns:", v18);

  v43[0] = CFSTR("user_category");
  v43[1] = CFSTR("model_category");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIndexForColumns:", v19);

  v42[0] = CFSTR("category_model_version");
  v42[1] = CFSTR("model_category");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIndexForColumns:", v20);

  v21 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F000]), "initWithColumnName:", CFSTR("validation_state"));
  v41 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("validation_state"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "equalTo:", &unk_1E94E4880);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v21, "initWithName:tableName:indexedColumns:where:unique:", CFSTR("message_global_data_validation_state_equals_zero_index"), CFSTR("message_global_data"), v23, v25, 0);

  objc_msgSend(v12, "addIndex:", v26);
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    v27 = [EDPersistenceAssociationPlaceholder alloc];
    objc_msgSend(v12, "columnForName:", CFSTR("generated_summary"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v27, "initWithColumn:tableName:", v28, CFSTR("generated_summaries"));
    v40 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    *a3 = (id)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

+ (id)_generatedSummariesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "blobColumnWithName:nullable:", CFSTR("summary"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("status"), 0, &unk_1E94E4880);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("generated_summaries"), 2, v5);

  return v6;
}

+ (id)selectAddressesStatementWithResultColumns:(id *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithTable:", CFSTR("addresses"));
  objc_msgSend(v4, "addResultColumn:alias:", CFSTR("comment"), CFSTR("addresses_comment"));
  objc_msgSend(v4, "addResultColumn:alias:", CFSTR("address"), CFSTR("addresses_address"));
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", CFSTR("addresses_comment"), CFSTR("addresses_address"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)addJoinsForAddressToSelectComponent:(id)a3 withSourceAddressColumn:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("addresses"), a4, *MEMORY[0x1E0D1EE00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addResultColumn:alias:", CFSTR("comment"), CFSTR("addresses_comment"));
  objc_msgSend(v4, "addResultColumn:alias:", CFSTR("address"), CFSTR("addresses_address"));
  objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", CFSTR("addresses_comment"), CFSTR("addresses_address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)reconcileJournalWithCompletionBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDMessagePersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reconcileJournalWithCompletionBlock:", v5);

}

- (id)messageObjectIDCriterionExpressionForPredicateValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[128];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D1E258], "objectIDFromSerializedRepresentation:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      v23 = buf;
      v24 = 0x2020000000;
      v25 = 1;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __76__EDMessagePersistence_messageObjectIDCriterionExpressionForPredicateValue___block_invoke;
      v21[3] = &unk_1E949DD68;
      v21[4] = buf;
      objc_msgSend(v4, "ef_map:", v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v7;
      if (!v23[24])
      {

        v6 = 0;
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      v6 = 0;
    }
  }
  if (objc_msgSend(v6, "count"))
  {
    -[EDMessagePersistence databaseIDsDictionaryForMessageObjectIDs:](self, "databaseIDsDictionaryForMessageObjectIDs:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "ef_mapSelector:", sel_stringValue);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ef_reduce:", &__block_literal_global_320_0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Unable to find databaseIDs for messageObjectIDs", buf, 2u);
      }

      v11 = (void *)objc_opt_new();
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = v6;
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v18;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v10);
            objc_msgSend(v11, "appendFormat:", CFSTR("%lld"), objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "globalMessageID"));
          }
          while (v13 != v15);
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
        }
        while (v13);
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __76__EDMessagePersistence_messageObjectIDCriterionExpressionForPredicateValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(MEMORY[0x1E0D1E258], "objectIDFromSerializedRepresentation:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

  return v4;
}

id __76__EDMessagePersistence_messageObjectIDCriterionExpressionForPredicateValue___block_invoke_318(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@, %@"), v4, v5);

  return v6;
}

- (int64_t)countOfMessagesWithGlobalMessageID:(int64_t)a3 matchingQuery:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  -[EDMessagePersistence queryParser](self, "queryParser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sqlQueryToCountMessagesWithGlobalMessageID:matchingQuery:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[EDMessagePersistence _countForSQLQuery:](self, "_countForSQLQuery:", v8);
  return v9;
}

- (id)countOfMessagesMatchingQueryPerMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  -[EDMessagePersistence queryParser](self, "queryParser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sqlCountQueryByMailboxForQuery:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  -[EDMessagePersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence countOfMessagesMatchingQueryPerMailbox:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__EDMessagePersistence_countOfMessagesMatchingQueryPerMailbox___block_invoke;
  v15[3] = &unk_1E949AFA0;
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v15);

  v12 = v17;
  v13 = v11;

  return v13;
}

uint64_t __63__EDMessagePersistence_countOfMessagesMatchingQueryPerMailbox___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__EDMessagePersistence_countOfMessagesMatchingQueryPerMailbox___block_invoke_2;
  v5[3] = &unk_1E949AF78;
  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "executeSelectStatement:withBlock:error:", v3, v5, 0);

  return 1;
}

void __63__EDMessagePersistence_countOfMessagesMatchingQueryPerMailbox___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

- (int64_t)countOfMessageStatement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[EDMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence countOfMessageStatement:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__EDMessagePersistence_countOfMessageStatement___block_invoke;
  v10[3] = &unk_1E949BBD8;
  v12 = &v13;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __48__EDMessagePersistence_countOfMessageStatement___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "countForSelectStatement:", *(_QWORD *)(a1 + 32));

  return 1;
}

- (id)messagesMatchingQuery:(id)a3
{
  -[EDMessagePersistence messagesMatchingQuery:limit:](self, "messagesMatchingQuery:limit:", a3, 0x7FFFFFFFFFFFFFFFLL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)messagesMatchingQuery:(id)a3 limit:(int64_t)a4
{
  -[EDMessagePersistence messagesMatchingQuery:limit:cancelationToken:](self, "messagesMatchingQuery:limit:cancelationToken:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)messagesMatchingQuery:(id)a3 limit:(int64_t)a4 cancelationToken:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__EDMessagePersistence_messagesMatchingQuery_limit_cancelationToken___block_invoke;
  v13[3] = &unk_1E949DDB0;
  v11 = v10;
  v14 = v11;
  -[EDMessagePersistence iterateMessagesMatchingQuery:batchSize:firstBatchSize:limit:cancelationToken:handler:](self, "iterateMessagesMatchingQuery:batchSize:firstBatchSize:limit:cancelationToken:handler:", v8, 512, 0, a4, v9, v13);

  return v11;
}

void __69__EDMessagePersistence_messagesMatchingQuery_limit_cancelationToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
  }
  else
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __69__EDMessagePersistence_messagesMatchingQuery_limit_cancelationToken___block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  }

}

- (void)iterateMessagesMatchingQuery:(id)a3 batchSize:(int64_t)a4 firstBatchSize:(int64_t)a5 limit:(int64_t)a6 cancelationToken:(id)a7 handler:(id)a8
{
  id v15;
  id v16;
  id v17;
  EDBatchingMessageQueryIterator *v18;
  id v19;
  EDBatchingMessageQueryIterator *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, void *, void *);
  void *v25;
  EDBatchingMessageQueryIterator *v26;
  id v27;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  if ((objc_msgSend(v15, "queryOptions") & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessagePersistence.m"), 951, CFSTR("Spotlight search query sent to EMMessagePersistence"));

  }
  v18 = -[EDBatchingMessageQueryIterator initWithMessagePersistence:query:batchSize:firstBatchSize:limit:handler:]([EDBatchingMessageQueryIterator alloc], "initWithMessagePersistence:query:batchSize:firstBatchSize:limit:handler:", self, v15, a4, a5, a6, v17);
  objc_msgSend(v16, "addCancelable:", v18);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __109__EDMessagePersistence_iterateMessagesMatchingQuery_batchSize_firstBatchSize_limit_cancelationToken_handler___block_invoke;
  v25 = &unk_1E949DDD8;
  v19 = v17;
  v27 = v19;
  v20 = v18;
  v26 = v20;
  -[EDMessagePersistence _iterateMessagesMatchingQuery:limit:cancelationToken:handler:](self, "_iterateMessagesMatchingQuery:limit:cancelationToken:handler:", v15, a6, v16, &v22);
  -[EDBatchingMessageQueryIterator flush](v20, "flush", v22, v23, v24, v25);

}

void __109__EDMessagePersistence_iterateMessagesMatchingQuery_batchSize_firstBatchSize_limit_cancelationToken_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "addMessage:withDatabaseID:", v8, a2);

}

- (void)_iterateMessagesMatchingQuery:(id)a3 limit:(int64_t)a4 cancelationToken:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  EDMessagePersistence *v30;
  id v31;
  id v32;
  SEL v33;

  v10 = a3;
  v27 = a5;
  v26 = a6;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = objc_alloc(MEMORY[0x1E0D1E2C0]);
    v12 = objc_msgSend(v10, "targetClass");
    objc_msgSend(v10, "predicate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortDescriptors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suggestion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "queryOptions");
    objc_msgSend(v10, "targetClassOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v11, "initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:", v12, v23, v13, v14, a4, v15, v16, v17);

    v10 = (id)v18;
  }
  -[EDMessagePersistence database](self, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence _iterateMessagesMatchingQuery:limit:cancelationToken:handler:]");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __85__EDMessagePersistence__iterateMessagesMatchingQuery_limit_cancelationToken_handler___block_invoke;
  v28[3] = &unk_1E949DE28;
  v33 = a2;
  v25 = v10;
  v29 = v25;
  v30 = self;
  v21 = v26;
  v32 = v21;
  v22 = v27;
  v31 = v22;
  objc_msgSend(v19, "__performReadWithCaller:usingBlock:", v20, v28);

}

uint64_t __85__EDMessagePersistence__iterateMessagesMatchingQuery_limit_cancelationToken_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  NSObject *v13;
  char v14;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "protectedDatabaseAttached") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(*(id *)(a1 + 32), "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "mailboxPersistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mailboxScopeForPredicate:withMailboxTypeResolver:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "sqlQueryForQuery:connection:", *(_QWORD *)(a1 + 32), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v3, "preparedStatementForQueryString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_new();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __85__EDMessagePersistence__iterateMessagesMatchingQuery_limit_cancelationToken_handler___block_invoke_332;
      v19[3] = &unk_1E949DE00;
      v19[4] = *(_QWORD *)(a1 + 40);
      v20 = v3;
      v21 = v7;
      v11 = v10;
      v22 = v11;
      v24 = *(id *)(a1 + 56);
      v23 = *(id *)(a1 + 48);
      v18 = 0;
      v12 = objc_msgSend(v9, "executeUsingBlock:error:", v19, &v18);
      v13 = v18;
      if (v13)
        v14 = v12;
      else
        v14 = 1;
      if ((v14 & 1) == 0)
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    else
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "protectedDatabaseAttached");
        NSStringFromBOOL();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        v27 = 2114;
        v28 = v17;
        _os_log_error_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Unable to form sql query, protected data available: %{public}@", buf, 0x16u);

      }
    }

  }
  else
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      objc_claimAutoreleasedReturnValue();
      __85__EDMessagePersistence__iterateMessagesMatchingQuery_limit_cancelationToken_handler___block_invoke_cold_1();
    }
  }

  return 1;
}

void __85__EDMessagePersistence__iterateMessagesMatchingQuery_limit_cancelationToken_handler___block_invoke_332(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_messageForSQLRow:connection:mailboxScope:recipientsCache:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v8 + 16))(v8, objc_msgSend(v9, "databaseIDValue"), v7, 0);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "isCanceled"))
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Message enumeration canceled", v11, 2u);
    }

    *a4 = 1;
  }

}

- (id)_messageForSQLRow:(id)a3 connection:(id)a4 mailboxScope:(id)a5 recipientsCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v28[4];
  id v29;
  id v30;
  EDMessagePersistence *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "databaseIDValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("global_message_id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "longLongValue");

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E258]), "initWithGlobalMessageID:mailboxScope:", v18, v12);
  v20 = objc_alloc(MEMORY[0x1E0D1E1E8]);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __82__EDMessagePersistence__messageForSQLRow_connection_mailboxScope_recipientsCache___block_invoke;
  v28[3] = &unk_1E949DE50;
  v21 = v10;
  v29 = v21;
  v22 = v11;
  v33 = v15;
  v34 = v18;
  v30 = v22;
  v31 = self;
  v23 = v13;
  v32 = v23;
  v24 = (void *)objc_msgSend(v20, "initWithObjectID:builder:", v19, v28);
  objc_msgSend(v24, "mailboxes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (!v26)
  {

    v24 = 0;
  }

  return v24;
}

void __82__EDMessagePersistence__messageForSQLRow_connection_mailboxScope_recipientsCache___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  _BOOL8 v71;
  NSObject *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  EDPersistedMessageID *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  void *v119;
  _BYTE v120[128];
  _QWORD v121[3];

  v121[1] = *MEMORY[0x1E0C80C00];
  v112 = a2;
  v113 = a1;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("date_received"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setDate:", v4);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("display_date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setDisplayDate:", v6);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("read_later_date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateValue");
  v8 = objc_claimAutoreleasedReturnValue();

  v97 = (void *)v8;
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2C8]), "initWithDate:", v8);
    objc_msgSend(v112, "setReadLater:", v9);

  }
  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("send_later_date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setSendLaterDate:", v11);

  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("follow_up_start_date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateValue");
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("follow_up_end_date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateValue");
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106 && v105)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E178]), "initWithStartDate:endDate:jsonStringForModelEvaluationForSuggestions:", v106, v105, v96);
    objc_msgSend(v112, "setFollowUp:", v15);

  }
  if (objc_msgSend(*(id *)(v113 + 32), "columnExistsWithName:", CFSTR("subject")))
  {
    objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("subject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("subject_prefix"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "length"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E7A0]), "initWithPrefix:subjectWithoutPrefix:", v19, v17);
  }
  else
  {
    if (!v17 && objc_msgSend(*(id *)(v113 + 40), "protectedDatabaseAttached"))
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __82__EDMessagePersistence__messageForSQLRow_connection_mailboxScope_recipientsCache___block_invoke_cold_4();

    }
    v20 = 0;
  }

  objc_msgSend(v112, "setSubject:", v20);
  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("summary"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setSummary:", v23);

  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("generated_summary"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dataValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v25, "length"))
    {
      objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("urgent"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "BOOLValue");

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v25, 0);
      objc_msgSend(v28, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D1DDB0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D1DDA8]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1F0]), "initWithGlobalMessageID:", *(_QWORD *)(v113 + 72));
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E188]), "initWithTopLine:synopsis:urgent:messageItemID:", v29, v30, v27, v31);
        objc_msgSend(v112, "setGeneratedSummary:", v32);

      }
    }

  }
  if (objc_msgSend(*(id *)(v113 + 32), "columnExistsWithName:", CFSTR("sender_comment")))
  {
    objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("sender_comment"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringValue");
    v95 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v95 = 0;
  }
  if (objc_msgSend(*(id *)(v113 + 32), "columnExistsWithName:", CFSTR("sender_address")))
  {
    objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("sender_address"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringValue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
  }
  v36 = v35;
  v111 = v36;
  v102 = v95;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v36);
  objc_msgSend(v37, "setDisplayName:", v102);
  objc_msgSend(v37, "emailAddressValue");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    v40 = v38;
  }
  else
  {
    objc_msgSend(v37, "stringValue");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v41)
      v43 = (void *)v41;
    else
      v43 = v36;
    v40 = v43;

  }
  objc_msgSend(v40, "stringValue");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      __82__EDMessagePersistence__messageForSQLRow_connection_mailboxScope_recipientsCache___block_invoke_cold_3();
    goto LABEL_41;
  }
  if (objc_msgSend(v103, "length"))
  {
    v121[0] = v103;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 1);
    v44 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setSenderList:", v44);
LABEL_41:

    goto LABEL_43;
  }
  objc_msgSend(v112, "setSenderList:", MEMORY[0x1E0C9AA60]);
LABEL_43:
  objc_msgSend(*(id *)(v113 + 48), "blockedSenderManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setIsBlocked:", objc_msgSend(v45, "isEmailAddressBlocked:", v36));

  objc_msgSend(*(id *)(v113 + 48), "vipReader");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setIsVIP:", objc_msgSend(v46, "isVIPAddress:", v36));

  v110 = (void *)objc_opt_new();
  v47 = (uint64_t *)(v113 + 64);
  v109 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(v113 + 48), "_recipientsForMessageWithDatabaseID:connection:recipientsCache:toRecipientStrings:ccRecipientStrings:", *(_QWORD *)(v113 + 64), *(_QWORD *)(v113 + 40), *(_QWORD *)(v113 + 56), v110);
  objc_msgSend(v112, "setToList:", v110);
  objc_msgSend(v112, "setCcList:", v109);
  objc_msgSend(*(id *)(v113 + 48), "userProfileProvider");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setIsToMe:", objc_msgSend(v101, "isMyEmailAddressContainedInAddressList:", v110));
  objc_msgSend(v112, "setIsCCMe:", objc_msgSend(v101, "isMyEmailAddressContainedInAddressList:", v109));
  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("flags"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "numberValue");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "longLongValue");

  v118 = 0;
  objc_msgSend(*(id *)(v113 + 48), "flagsForLegacyFlags:numberOfAttachments:", v50, &v118);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setFlags:", v51);

  objc_msgSend(v112, "setHasAttachments:", v118 > 0);
  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("unsubscribe_type"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "numberValue");
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
    v53 = objc_msgSend(v100, "integerValue");
  else
    v53 = 0;
  objc_msgSend(v112, "setUnsubscribeType:", v53);
  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("conversation_flags"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "int64Value");

  objc_msgSend(v112, "setConversationNotificationLevel:", +[EDConversationPersistence conversationNotificationLevelForConversationFlags:](EDConversationPersistence, "conversationNotificationLevelForConversationFlags:", v55));
  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("brand_indicator_location"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "stringValue");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v108);
    objc_msgSend(v112, "setBrandIndicatorLocation:", v57);

  }
  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("conversation_id"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setConversationID:", objc_msgSend(v58, "databaseIDValue"));

  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("document_id"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "stringValue");
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = objc_msgSend(v107, "length");
  if (v60)
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v107);
  else
    v61 = 0;
  objc_msgSend(v112, "setDocumentID:", v61);
  if (v60)

  v94 = -[EDPersistedMessageID initWithDatabaseID:]([EDPersistedMessageID alloc], "initWithDatabaseID:", *v47);
  +[EDSearchableIndexItem searchableMessageIDForPersistedMessageID:](EDSearchableIndexItem, "searchableMessageIDForPersistedMessageID:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setSearchableMessageID:", v62);

  if ((_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    +[EDCategoryPersistence categoryForResultRow:](EDCategoryPersistence, "categoryForResultRow:", *(_QWORD *)(v113 + 32));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setCategory:", v63);

  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("business"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setBusinessID:", objc_msgSend(v64, "int64Value"));

    v65 = *(void **)(v113 + 32);
    +[EDMessagePersistence messageGlobalDataValidationState](EDMessagePersistence, "messageGlobalDataValidationState");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectForKeyedSubscript:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "numberValue");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "integerValue");
    if ((v69 & 0x10000) == 0)
    {
      v70 = (v69 >> 9) & 7;
      if ((v69 & 8) != 0 && v70 == 2)
      {
        if ((v69 & 0x34) == 0x14)
        {
LABEL_62:
          v71 = v70 == 0;
          goto LABEL_65;
        }
      }
      else if ((v69 & 4) != 0)
      {
        goto LABEL_62;
      }
    }
    v71 = 1;
LABEL_65:
    objc_msgSend(v112, "setIsAuthenticated:", v71);

    if (!objc_msgSend(v112, "businessID"))
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
        __82__EDMessagePersistence__messageForSQLRow_connection_mailboxScope_recipientsCache___block_invoke_cold_2();

    }
  }
  objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("url"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "stringValue");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = objc_alloc(MEMORY[0x1E0D1E1D8]);
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v104);
  v98 = (void *)objc_msgSend(v74, "initWithURL:", v75);

  objc_msgSend(*(id *)(v113 + 48), "mailboxPersistence");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "mailboxProvider");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "mailboxForObjectID:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(v113 + 32), "columnExistsWithName:", CFSTR("message_labels")))
  {
    v78 = (void *)objc_opt_new();
    objc_msgSend(v78, "ef_addOptionalObject:", v99);
    objc_msgSend(*(id *)(v113 + 32), "objectForKeyedSubscript:", CFSTR("message_labels"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "stringValue");
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v93, "componentsSeparatedByString:", CFSTR(","));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "valueForKey:", CFSTR("longLongValue"));
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v80 = (id)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v114, v120, 16);
    if (v81)
    {
      v82 = *(_QWORD *)v115;
      do
      {
        for (i = 0; i != v81; ++i)
        {
          if (*(_QWORD *)v115 != v82)
            objc_enumerationMutation(v80);
          v84 = objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * i), "longLongValue");
          objc_msgSend(*(id *)(v113 + 48), "gmailLabelPersistence");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "labelURLForDatabaseID:", v84);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          if (v86)
          {
            v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v86);
            objc_msgSend(*(id *)(v113 + 48), "mailboxPersistence");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "mailboxProvider");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "mailboxForObjectID:", v87);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v78, "addObject:", v90);
          }

        }
        v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v114, v120, 16);
      }
      while (v81);
    }

    objc_msgSend(v112, "setMailboxes:", v78);
    goto LABEL_82;
  }
  if (v99)
  {
    v119 = v99;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setMailboxes:", v78);
LABEL_82:

    goto LABEL_83;
  }
  +[EDMessagePersistence log](EDMessagePersistence, "log");
  v91 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    __82__EDMessagePersistence__messageForSQLRow_connection_mailboxScope_recipientsCache___block_invoke_cold_1(v47, (uint64_t)v104, v91);

  objc_msgSend(v112, "setMailboxes:", MEMORY[0x1E0C9AA60]);
LABEL_83:

}

- (void)_recipientsForMessageWithDatabaseID:(int64_t)a3 connection:(id)a4 recipientsCache:(id)a5 toRecipientStrings:(id)a6 ccRecipientStrings:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v11, "preparedStatementForQueryString:", CFSTR("SELECT addresses.ROWID, addresses.address, addresses.comment, recipients.type FROM recipients JOIN addresses ON recipients.address = addresses.ROWID WHERE recipients.message = ? ORDER BY recipients.position"), v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __125__EDMessagePersistence__recipientsForMessageWithDatabaseID_connection_recipientsCache_toRecipientStrings_ccRecipientStrings___block_invoke;
  v23[3] = &unk_1E949C8B8;
  v18 = v12;
  v24 = v18;
  v19 = v13;
  v25 = v19;
  v20 = v14;
  v26 = v20;
  v22 = 0;
  LOBYTE(a7) = objc_msgSend(v15, "executeWithIndexedBindings:usingBlock:error:", v17, v23, &v22);
  v21 = v22;

  if ((a7 & 1) == 0)
    objc_msgSend(v11, "handleError:message:", v21, CFSTR("Fetching recipients"));

}

void __125__EDMessagePersistence__recipientsForMessageWithDatabaseID_connection_recipientsCache_toRecipientStrings_ccRecipientStrings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64Value");

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("address"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("comment"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v11);
    objc_msgSend(v14, "setDisplayName:", v13);
    objc_msgSend(v14, "stringValue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v11;
    v9 = v17;

    v18 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, v19);

  }
  if (v6 == 2)
  {
    v20 = (id *)(a1 + 48);
    goto LABEL_10;
  }
  if (v6 == 1)
  {
    v20 = (id *)(a1 + 40);
LABEL_10:
    objc_msgSend(*v20, "addObject:", v9);
  }

}

- (id)persistedMessagesMatchingQuery:(id)a3 limit:(int64_t)a4
{
  -[EDMessagePersistence persistedMessagesMatchingQuery:limit:requireProtectedData:](self, "persistedMessagesMatchingQuery:limit:requireProtectedData:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __82__EDMessagePersistence_persistedMessagesMatchingQuery_limit_requireProtectedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
  }
  else
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __69__EDMessagePersistence_messagesMatchingQuery_limit_cancelationToken___block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  }

}

uint64_t __82__EDMessagePersistence_persistedMessagesMatchingQuery_limit_requireProtectedData___block_invoke_362(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSString *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSSelectorFromString(v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D1DE28]) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D1DE30]);

    }
  }

  return v6;
}

- (void)iteratePersistedMessagesMatchingQuery:(id)a3 limit:(int64_t)a4 cancelationToken:(id)a5 handler:(id)a6
{
  -[EDMessagePersistence _iteratePersistedMessagesMatchingQuery:limit:cancelationToken:requireProtectedData:handler:](self, "_iteratePersistedMessagesMatchingQuery:limit:cancelationToken:requireProtectedData:handler:", a3, a4, a5, 0, a6);
}

void __115__EDMessagePersistence__iteratePersistedMessagesMatchingQuery_limit_cancelationToken_requireProtectedData_handler___block_invoke_364(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "persistedMessageForSQLRow:connection:iterationContext:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v9 = *(_QWORD *)(a1 + 64);
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "isCanceled"))
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Message enumeration canceled", v12, 2u);
    }

    *a4 = 1;
  }

}

- (id)createContextForIteration
{
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessagePersistence createContextForIteration]", "EDMessagePersistence.m", 1353, "0");
}

- (id)flagsForLegacyFlags:(int64_t)a3 numberOfAttachments:(int64_t *)a4
{
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  __assert_rtn("-[EDMessagePersistence flagsForLegacyFlags:numberOfAttachments:]", "EDMessagePersistence.m", 1357, "0");
}

- (id)sortableMessagesMatchingQuery:(id)a3 limit:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[EDMessagePersistence persistedMessagesMatchingQuery:limit:](self, "persistedMessagesMatchingQuery:limit:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D1E248];
  objc_msgSend(v6, "predicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessagePersistence mailboxPersistence](self, "mailboxPersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxScopeForPredicate:withMailboxTypeResolver:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessagePersistence sortableMessagesForPersistedMessages:mailboxScope:](self, "sortableMessagesForPersistedMessages:mailboxScope:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)persistedMessageForSQLRow:(id)a3 connection:(id)a4 iterationContext:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessagePersistence persistedMessageForSQLRow:connection:iterationContext:]", "EDMessagePersistence.m", 1377, "0");
}

- (void)recipientsForMessageWithDatabaseID:(int64_t)a3 connection:(id)a4 recipientsCache:(id)a5 toRecipientStrings:(id)a6 ccRecipientStrings:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v11, "preparedStatementForQueryString:", CFSTR("SELECT addresses.ROWID, addresses.address, addresses.comment, recipients.type FROM recipients JOIN addresses ON recipients.address = addresses.ROWID WHERE recipients.message = ? ORDER BY recipients.position"), v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __124__EDMessagePersistence_recipientsForMessageWithDatabaseID_connection_recipientsCache_toRecipientStrings_ccRecipientStrings___block_invoke;
  v23[3] = &unk_1E949C8B8;
  v18 = v12;
  v24 = v18;
  v19 = v13;
  v25 = v19;
  v20 = v14;
  v26 = v20;
  v22 = 0;
  LOBYTE(a7) = objc_msgSend(v15, "executeWithIndexedBindings:usingBlock:error:", v17, v23, &v22);
  v21 = v22;

  if ((a7 & 1) == 0)
    objc_msgSend(v11, "handleError:message:", v21, CFSTR("Fetching recipients"));

}

void __124__EDMessagePersistence_recipientsForMessageWithDatabaseID_connection_recipientsCache_toRecipientStrings_ccRecipientStrings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64Value");

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("address"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("comment"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v11);
    objc_msgSend(v14, "setDisplayName:", v13);
    objc_msgSend(v14, "stringValue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v11;
    v9 = v17;

    v18 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, v19);

  }
  if (v6 == 2)
  {
    v20 = (id *)(a1 + 48);
    goto LABEL_10;
  }
  if (v6 == 1)
  {
    v20 = (id *)(a1 + 40);
LABEL_10:
    objc_msgSend(*v20, "addObject:", v9);
  }

}

id __58__EDMessagePersistence_queriesSeparatedByMailboxForQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v5 = objc_msgSend(*(id *)(a1 + 32), "targetClass");
  objc_msgSend(*(id *)(a1 + 32), "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "suggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "limit");
  v9 = objc_msgSend(*(id *)(a1 + 32), "queryOptions");
  objc_msgSend(*(id *)(a1 + 32), "targetClassOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:", v5, v3, v6, v7, v8, v9, v10, v11);

  return v12;
}

- (id)_predicatesSeparatedByMailboxOrAccountForPredicate:(id)a3 containsMailboxPredicate:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  if ((objc_msgSend(v6, "ef_matchesEverything") & 1) != 0 || objc_msgSend(v6, "ef_matchesNothing"))
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v9 = objc_msgSend(v8, "compoundPredicateType");
    if (v9)
    {
      if (v9 == 1)
      {
        -[EDMessagePersistence _predicatesSeparatedByMailboxOrAccountForAndPredicate:containsMailboxPredicate:](self, "_predicatesSeparatedByMailboxOrAccountForAndPredicate:containsMailboxPredicate:", v8, a4);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v9 != 2)
        {

          goto LABEL_3;
        }
        -[EDMessagePersistence _predicatesSeparatedByMailboxOrAccountForOrPredicate:containsMailboxPredicate:](self, "_predicatesSeparatedByMailboxOrAccountForOrPredicate:containsMailboxPredicate:", v8, a4);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v7 = (void *)v10;
    }
    else
    {
      v7 = 0;
      if (a4)
        *a4 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesInMailboxObjectID:mailboxObjectID:", v6, 0)|| objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesInAccountObjectID:accountObjectID:", v6, 0))
  {
    if (a4)
    {
      v7 = 0;
      *a4 = 1;
      goto LABEL_20;
    }
LABEL_14:
    v7 = 0;
    goto LABEL_20;
  }
  v14 = -500;
  if (objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesInMailboxWithType:mailboxType:", v6, &v14))
  {
    -[EDMessagePersistence mailboxPersistence](self, "mailboxPersistence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mailboxObjectIDsForMailboxType:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "ef_map:", &__block_literal_global_376);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      *a4 = 1;
    goto LABEL_19;
  }
LABEL_3:
  if (!a4)
    goto LABEL_14;
  v7 = 0;
  *a4 = 0;
LABEL_20:

  return v7;
}

id __100__EDMessagePersistence__predicatesSeparatedByMailboxOrAccountForPredicate_containsMailboxPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInMailboxWithObjectID:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_predicatesSeparatedByMailboxOrAccountForAndPredicate:(id)a3 containsMailboxPredicate:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  objc_msgSend(v6, "subpredicates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16;
  v29 = __Block_byref_object_dispose__16;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16;
  v23 = __Block_byref_object_dispose__16;
  v24 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__EDMessagePersistence__predicatesSeparatedByMailboxOrAccountForAndPredicate_containsMailboxPredicate___block_invoke;
  v14[3] = &unk_1E949DF80;
  v14[4] = self;
  v16 = &v31;
  v17 = &v25;
  v9 = v7;
  v15 = v9;
  v18 = &v19;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);
  if (*((_BYTE *)v32 + 24))
  {
    if ((unint64_t)objc_msgSend((id)v20[5], "count") <= 1)
    {
      if (a4)
      {
        v10 = 0;
LABEL_9:
        *a4 = 1;
        goto LABEL_14;
      }
LABEL_10:
      v10 = 0;
      goto LABEL_14;
    }
    if (objc_msgSend((id)v26[5], "count"))
    {
      v11 = (void *)v20[5];
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __103__EDMessagePersistence__predicatesSeparatedByMailboxOrAccountForAndPredicate_containsMailboxPredicate___block_invoke_3;
      v13[3] = &unk_1E949DFA8;
      v13[4] = &v25;
      objc_msgSend(v11, "ef_map:", v13);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (a4)
        goto LABEL_9;
    }
    else
    {
      if (a4)
        *a4 = 1;
      v10 = (id)v20[5];
    }
  }
  else
  {
    if (!a4)
      goto LABEL_10;
    v10 = 0;
    *a4 = 0;
  }
LABEL_14:

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v10;
}

void __103__EDMessagePersistence__predicatesSeparatedByMailboxOrAccountForAndPredicate_containsMailboxPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_predicatesSeparatedByMailboxOrAccountForPredicate:containsMailboxPredicate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v3);

}

id __103__EDMessagePersistence__predicatesSeparatedByMailboxOrAccountForAndPredicate_containsMailboxPredicate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3528];
  v5 = *(_QWORD *)(a1 + 32);
  v10[0] = v3;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_simplifiedPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __103__EDMessagePersistence__predicatesSeparatedByMailboxOrAccountForAndPredicate_containsMailboxPredicate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "mutableCopy");
  objc_msgSend(v4, "addObject:", v3);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_simplifiedPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_predicatesSeparatedByMailboxOrAccountForOrPredicate:(id)a3 containsMailboxPredicate:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16;
  v23 = __Block_byref_object_dispose__16;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(v6, "subpredicates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__EDMessagePersistence__predicatesSeparatedByMailboxOrAccountForOrPredicate_containsMailboxPredicate___block_invoke;
  v11[3] = &unk_1E949DFD0;
  v11[4] = self;
  v13 = &v15;
  v14 = &v19;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  if ((unint64_t)v16[3] < 2)
  {
    v9 = 0;
    if (a4)
      *a4 = 0;
  }
  else
  {
    if (a4)
      *a4 = 1;
    v9 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __102__EDMessagePersistence__predicatesSeparatedByMailboxOrAccountForOrPredicate_containsMailboxPredicate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a2;
  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_predicatesSeparatedByMailboxOrAccountForPredicate:containsMailboxPredicate:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "subpredicates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ef_prefix:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "mutableCopy");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v6)
      objc_msgSend(v12, "addObjectsFromArray:", v6);
    else
      objc_msgSend(v12, "addObject:", v5);
  }

}

- (id)baseMessageForOutgoingMessage:(id)a3 isDraft:(BOOL)a4
{
  id v6;

  v6 = a3;
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessagePersistence baseMessageForOutgoingMessage:isDraft:]", "EDMessagePersistence.m", 1622, "0");
}

- (id)databaseIDsDictionaryForMessageObjectIDs:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  -[EDMessagePersistence _groupMessageObjectIDsByMailboxScope:](self, "_groupMessageObjectIDsByMailboxScope:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__EDMessagePersistence_databaseIDsDictionaryForMessageObjectIDs___block_invoke;
  v10[3] = &unk_1E949E020;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __65__EDMessagePersistence_databaseIDsDictionaryForMessageObjectIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v15 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v15;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "globalMessageID", v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);
        objc_msgSend(v6, "addObject:", v12);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "_databaseIDsDictionaryForGlobalMessageIDs:mailboxScope:", v6, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__EDMessagePersistence_databaseIDsDictionaryForMessageObjectIDs___block_invoke_2;
  v17[3] = &unk_1E949DFF8;
  v18 = *(id *)(a1 + 40);
  v14 = v5;
  v19 = v14;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v17);

}

void __65__EDMessagePersistence_databaseIDsDictionaryForMessageObjectIDs___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v7);

}

- (id)_databaseIDsDictionaryForGlobalMessageIDs:(id)a3 mailboxScope:(id)a4
{
  id v6;
  id v7;
  id v8;
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
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  EDMessagePersistence *v28;
  id v29;
  char v30;
  char v31;

  v6 = a3;
  v7 = a4;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v12 = 0;
  }
  else
  {
    -[EDMessagePersistence mailboxPersistence](self, "mailboxPersistence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allMailboxObjectIDsWithMailboxTypeResolver:forExclusion:", v9, &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDMessagePersistence mailboxPersistence](self, "mailboxPersistence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = (void *)objc_opt_new();
  -[EDMessagePersistence cachedDatabaseIDsDictionaryForGlobalMessageIDs:](self, "cachedDatabaseIDsDictionaryForGlobalMessageIDs:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v13, "addEntriesFromDictionary:", v14);
    v15 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v14, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectsInArray:", v16);

    v6 = v15;
  }
  -[EDMessagePersistence database](self, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence _databaseIDsDictionaryForGlobalMessageIDs:mailboxScope:]");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __79__EDMessagePersistence__databaseIDsDictionaryForGlobalMessageIDs_mailboxScope___block_invoke;
  v25[3] = &unk_1E949E048;
  v19 = v6;
  v26 = v19;
  v20 = v12;
  v30 = v31;
  v27 = v20;
  v28 = self;
  v21 = v13;
  v29 = v21;
  objc_msgSend(v17, "__performReadWithCaller:usingBlock:", v18, v25);

  v22 = v29;
  v23 = v21;

  return v23;
}

uint64_t __79__EDMessagePersistence__databaseIDsDictionaryForGlobalMessageIDs_mailboxScope___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("global_message_id"));
  objc_msgSend(v4, "in:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("mailbox"));
      objc_msgSend(v6, "notIn:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("mailbox"));
      objc_msgSend(v6, "in:", *(_QWORD *)(a1 + 40));
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v24[0] = v5;
    v24[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v9, "initWithExpressions:", v10);

  }
  else
  {
    v7 = v5;
  }
  objc_msgSend(*(id *)(a1 + 48), "enabledAccountMailboxesExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v23[0] = v7;
    v23[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithExpressions:", v13);

    v7 = (id)v14;
  }
  v15 = objc_alloc(MEMORY[0x1E0D1F040]);
  v16 = (void *)objc_msgSend(v15, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("messages"));
  objc_msgSend(v16, "addResultColumn:", CFSTR("global_message_id"));
  objc_msgSend(v16, "setWhere:", v7);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__EDMessagePersistence__databaseIDsDictionaryForGlobalMessageIDs_mailboxScope___block_invoke_2;
  v21[3] = &unk_1E949AF78;
  v22 = *(id *)(a1 + 56);
  v20 = 0;
  v17 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v16, v21, &v20);
  v18 = v20;
  if ((v17 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v18, CFSTR("Fetching messages for messageIDHashes"));

  return 1;
}

void __79__EDMessagePersistence__databaseIDsDictionaryForGlobalMessageIDs_mailboxScope___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("global_message_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v4);
}

- (id)enabledAccountMailboxesExpression
{
  return 0;
}

- (id)persistedMessagesForObjectIDs:(id)a3 requireProtectedData:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v4 = a4;
  v6 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__EDMessagePersistence_persistedMessagesForObjectIDs_requireProtectedData___block_invoke;
  v13[3] = &unk_1E949E070;
  v13[4] = self;
  objc_msgSend(v6, "ef_flatMap:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_compactMap:", &__block_literal_global_394);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessagePersistence persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:](self, "persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:", v8, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count") + objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v7);
  objc_msgSend(v10, "addObjectsFromArray:", v9);
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __75__EDMessagePersistence_persistedMessagesForObjectIDs_requireProtectedData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_threadQueryForThreadObjectID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "persistedMessagesMatchingQuery:limit:", v4, 0x7FFFFFFFFFFFFFFFLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

id __75__EDMessagePersistence_persistedMessagesForObjectIDs_requireProtectedData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)_threadQueryForThreadObjectID:(id)a3
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
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D1E248];
  objc_msgSend(v3, "threadScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForMessagesWithThreadScope:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInConversation:", objc_msgSend(v3, "conversationID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v6;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v12 = (void *)objc_msgSend(v11, "initWithTargetClass:predicate:sortDescriptors:", objc_opt_class(), v10, MEMORY[0x1E0C9AA60]);

  return v12;
}

- (id)persistedMessagesForMessageObjectIDs:(id)a3 requireProtectedData:(BOOL)a4 temporarilyUnavailableMessageObjectIDs:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a4;
  v8 = a3;
  -[EDMessagePersistence databaseIDsDictionaryForMessageObjectIDs:](self, "databaseIDsDictionaryForMessageObjectIDs:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    v11 = &v17;
  else
    v11 = 0;
  if (a5)
    v17 = 0;
  -[EDMessagePersistence persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:](self, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v10, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v13 = v17;

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __121__EDMessagePersistence_persistedMessagesForMessageObjectIDs_requireProtectedData_temporarilyUnavailableMessageObjectIDs___block_invoke;
    v15[3] = &unk_1E949E0B8;
    v16 = v9;
    objc_msgSend(v13, "ef_compactMap:", v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v10;
  }

  return v12;
}

id __121__EDMessagePersistence_persistedMessagesForMessageObjectIDs_requireProtectedData_temporarilyUnavailableMessageObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)persistedMessagesForDatabaseIDs:(id)a3 requireProtectedData:(BOOL)a4 temporarilyUnavailableDatabaseIDs:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  EDMessagePersistence *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  objc_msgSend(v8, "ef_map:", &__block_literal_global_399);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessageListItemPredicates predicateForMessagesWithPersistentIDs:](EDMessageListItemPredicates, "predicateForMessagesWithPersistentIDs:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v12 = (void *)objc_msgSend(v11, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", objc_opt_class(), v10, MEMORY[0x1E0C9AA60], 512, 0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__16;
  v37 = __Block_byref_object_dispose__16;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__16;
  v31 = __Block_byref_object_dispose__16;
  v32 = 0;
  -[EDMessagePersistence database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __111__EDMessagePersistence_persistedMessagesForDatabaseIDs_requireProtectedData_temporarilyUnavailableDatabaseIDs___block_invoke_2;
  v20[3] = &unk_1E949E0E0;
  v26 = a4;
  v24 = &v27;
  v15 = v8;
  v25 = &v33;
  v21 = v15;
  v22 = self;
  v16 = v12;
  v23 = v16;
  objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v20);

  if (a5)
  {
    v17 = (void *)v28[5];
    if (v17)
      *a5 = objc_retainAutorelease(v17);
  }
  v18 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

id __111__EDMessagePersistence_persistedMessagesForDatabaseIDs_requireProtectedData_temporarilyUnavailableDatabaseIDs___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "stringValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __111__EDMessagePersistence_persistedMessagesForDatabaseIDs_requireProtectedData_temporarilyUnavailableDatabaseIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 72))
  {
    if (!objc_msgSend(v3, "protectedDatabaseAttached"))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "copy");
      v7 = *(_QWORD *)(a1 + 56);
      goto LABEL_7;
    }
    v5 = *(_BYTE *)(a1 + 72) != 0;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "persistedMessagesMatchingQuery:limit:requireProtectedData:", *(_QWORD *)(a1 + 48), 0x7FFFFFFFFFFFFFFFLL, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 64);
LABEL_7:
  v8 = *(_QWORD *)(v7 + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  return 1;
}

- (id)persistedMessageIDsForMessagesForConversationIDs:(id)a3
{
  -[EDMessagePersistence _persistedMessageIDsForMessagesForConversationIDs:onlyFollowUps:](self, "_persistedMessageIDsForMessagesForConversationIDs:onlyFollowUps:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)persistedMessageIDsForMessagesWithFollowUpsForConversationIDs:(id)a3
{
  -[EDMessagePersistence _persistedMessageIDsForMessagesForConversationIDs:onlyFollowUps:](self, "_persistedMessageIDsForMessagesForConversationIDs:onlyFollowUps:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_persistedMessageIDsForMessagesForConversationIDs:(id)a3 onlyFollowUps:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
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
  id v19;
  id v20;
  void *v21;
  id v22;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];

  v4 = a4;
  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("messages"), CFSTR("conversation_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "in:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("message_global_data"), CFSTR("follow_up_start_date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "isNotNull");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v11;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("message_global_data"), CFSTR("follow_up_end_date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "isNotNull");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("message_global_data"), CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "isNotNull");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v16);

  }
  -[EDMessagePersistence database](self, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence _persistedMessageIDsForMessagesForConversationIDs:onlyFollowUps:]");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__EDMessagePersistence__persistedMessageIDsForMessagesForConversationIDs_onlyFollowUps___block_invoke;
  v25[3] = &unk_1E949AFA0;
  v19 = v7;
  v26 = v19;
  v20 = v24;
  v27 = v20;
  objc_msgSend(v17, "__performReadWithCaller:usingBlock:", v18, v25);

  v21 = v27;
  v22 = v20;

  return v22;
}

uint64_t __88__EDMessagePersistence__persistedMessageIDsForMessagesForConversationIDs_onlyFollowUps___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  v5 = *MEMORY[0x1E0D1EE00];
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("messages"));
  v7 = (id)objc_msgSend(v6, "join:sourceColumn:targetColumn:", CFSTR("message_global_data"), CFSTR("global_message_id"), v5);
  objc_msgSend(MEMORY[0x1E0D1EF90], "combined:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v8);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__EDMessagePersistence__persistedMessageIDsForMessagesForConversationIDs_onlyFollowUps___block_invoke_2;
  v13[3] = &unk_1E949AF78;
  v14 = *(id *)(a1 + 40);
  v12 = 0;
  v9 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v13, &v12);
  v10 = v12;
  if ((v9 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v10, CFSTR("Selecting message_ids for messages with follow-ups with certain conversation_ids"));

  return v9;
}

void __88__EDMessagePersistence__persistedMessageIDsForMessagesForConversationIDs_onlyFollowUps___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)persistedMessagesForBusinessID:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  int64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDMessagePersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence persistedMessagesForBusinessID:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __55__EDMessagePersistence_persistedMessagesForBusinessID___block_invoke;
  v16 = &unk_1E949B068;
  v18 = a3;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, &v13);

  -[EDMessagePersistence persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:](self, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v8, 1, 0, v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218240;
      v20 = v11;
      v21 = 2048;
      v22 = a3;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "successfully found %lu persisted messages for business ID %lld", buf, 0x16u);
    }

  }
  return v9;
}

uint64_t __55__EDMessagePersistence_persistedMessagesForBusinessID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  v5 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("messages"));
  +[EDBusinessPersistence businessAddressesTableName](EDBusinessPersistence, "businessAddressesTableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDBusinessPersistence businessAddressesAddressColumnName](EDBusinessPersistence, "businessAddressesAddressColumnName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "join:sourceColumn:targetColumn:", v6, CFSTR("sender"), v7);

  v9 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDBusinessPersistence businessAddressesBusinessColumnName](EDBusinessPersistence, "businessAddressesBusinessColumnName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "column:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhere:", v13);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__EDMessagePersistence_persistedMessagesForBusinessID___block_invoke_2;
  v18[3] = &unk_1E949AF78;
  v19 = *(id *)(a1 + 32);
  v17 = 0;
  v14 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v5, v18, &v17);
  v15 = v17;
  if ((v14 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v15, CFSTR("Selecting persistentMessageIDs for businessID "));

  return v14;
}

void __55__EDMessagePersistence_persistedMessagesForBusinessID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)persistedMessagesFromSendersWithAddressIDs:(id)a3 temporarilyUnavailableMessageObjectIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[EDMessagePersistence persistedMessagesFromSendersWithAddressIDs:temporarilyUnavailableMessageObjectIDs:].cold.1((uint64_t)v7, (uint64_t)v29, objc_msgSend(v7, "count"), v8);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDMessagePersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence persistedMessagesFromSendersWithAddressIDs:temporarilyUnavailableMessageObjectIDs:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __106__EDMessagePersistence_persistedMessagesFromSendersWithAddressIDs_temporarilyUnavailableMessageObjectIDs___block_invoke;
  v22 = &unk_1E949AFA0;
  v12 = v6;
  v23 = v12;
  v13 = v9;
  v24 = v13;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, &v19);

  -[EDMessagePersistence persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:](self, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v13, 1, 0, v19, v20, v21, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v14, "count");
      v17 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134218240;
      v26 = v16;
      v27 = 2048;
      v28 = v17;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "successfully found %lu persisted messages for %lu address IDs", buf, 0x16u);
    }

  }
  return v14;
}

uint64_t __106__EDMessagePersistence_persistedMessagesFromSendersWithAddressIDs_temporarilyUnavailableMessageObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  v5 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("messages"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("sender"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "in:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhere:", v7);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__EDMessagePersistence_persistedMessagesFromSendersWithAddressIDs_temporarilyUnavailableMessageObjectIDs___block_invoke_2;
  v12[3] = &unk_1E949AF78;
  v13 = *(id *)(a1 + 40);
  v11 = 0;
  v8 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v5, v12, &v11);
  v9 = v11;
  if ((v8 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v9, CFSTR("Selecting persistentMessageIDs for addressID"));

  return v8;
}

void __106__EDMessagePersistence_persistedMessagesFromSendersWithAddressIDs_temporarilyUnavailableMessageObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)persistedMessageIDsForGlobalMessageIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDMessagePersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence persistedMessageIDsForGlobalMessageIDs:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63__EDMessagePersistence_persistedMessageIDsForGlobalMessageIDs___block_invoke;
  v15 = &unk_1E949AFA0;
  v8 = v4;
  v16 = v8;
  v9 = v5;
  v17 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, &v12);

  v10 = (void *)objc_msgSend(v9, "copy", v12, v13, v14, v15);
  return v10;
}

uint64_t __63__EDMessagePersistence_persistedMessageIDsForGlobalMessageIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], v5);

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "in:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setWhere:", v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__EDMessagePersistence_persistedMessageIDsForGlobalMessageIDs___block_invoke_2;
  v13[3] = &unk_1E949AF78;
  v14 = *(id *)(a1 + 40);
  v12 = 0;
  v9 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v13, &v12);
  v10 = v12;
  if ((v9 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v10, CFSTR("Fetch persistentMessageIDs for globalMessageIDs"));

  return v9;
}

void __63__EDMessagePersistence_persistedMessageIDsForGlobalMessageIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)messagesForPersistedMessages:(id)a3 mailboxScope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[EDMessagePersistence messageTransformer](self, "messageTransformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transformPersistedMessages:mailboxScope:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ef_filter:", &__block_literal_global_410);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __66__EDMessagePersistence_messagesForPersistedMessages_mailboxScope___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "mailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)sortableMessagesForPersistedMessages:(id)a3 mailboxScope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[EDMessagePersistence messageTransformer](self, "messageTransformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transformPersistedMessages:mailboxScope:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ef_filter:", &__block_literal_global_411);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ef_map:", &__block_literal_global_413);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

BOOL __74__EDMessagePersistence_sortableMessagesForPersistedMessages_mailboxScope___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "mailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

id __74__EDMessagePersistence_sortableMessagesForPersistedMessages_mailboxScope___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D1E368]);
  objc_msgSend(v2, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readLater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendLaterDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithObjectID:date:displayDate:readLater:sendLaterDate:", v4, v5, v6, v7, v8);

  return v9;
}

- (id)messagesForMessageObjectIDs:(id)a3 missedMessageObjectIDs:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  id *v41;
  void *v42;
  id v43;
  id v44;
  EDMessagePersistence *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id obj;
  id v53;
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v41 = a4;
  v80 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v45 = self;
  -[EDMessagePersistence _groupMessageObjectIDsByMailboxScope:](self, "_groupMessageObjectIDsByMailboxScope:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "count") == 1)
  {
    objc_msgSend(v42, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v76 = 0;
    -[EDMessagePersistence persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:](v45, "persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:", v44, 1, &v76);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v55 = v76;
    -[EDMessagePersistence messagesForPersistedMessages:mailboxScope:](v45, "messagesForPersistedMessages:mailboxScope:", v7, v6);
    v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = MEMORY[0x1E0C809B0];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __75__EDMessagePersistence_messagesForMessageObjectIDs_missedMessageObjectIDs___block_invoke;
    v73[3] = &unk_1E949E188;
    v73[4] = self;
    v10 = v8;
    v74 = v10;
    v6 = v53;
    v75 = v6;
    objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v73);
    objc_msgSend(v6, "ef_notEmpty");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v7 = v10;
    v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v70 != v13)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v15, "objectID", v41);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, v16);

        }
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      }
      while (v12);
    }

    v67[0] = v9;
    v67[1] = 3221225472;
    v67[2] = __75__EDMessagePersistence_messagesForMessageObjectIDs_missedMessageObjectIDs___block_invoke_2;
    v67[3] = &unk_1E949E1B0;
    v17 = v11;
    v68 = v17;
    objc_msgSend(v44, "ef_compactMap:", v67);
    v43 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v41)
  {
    v18 = objc_msgSend(v43, "count");
    if (v18 < objc_msgSend(v44, "count"))
    {
      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v44);
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      obj = v43;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v64 != v20)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * j), "objectID", v41);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "removeObject:", v22);

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
        }
        while (v19);
      }

      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v49 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v47 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Exchange message may have a different message-id"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v50 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 1025, 0);
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v51 = v54;
      v25 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v59, v77, 16);
      if (!v25)
      {
        v46 = 0;
        goto LABEL_47;
      }
      v46 = 0;
      v26 = *(_QWORD *)v60;
      while (1)
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v60 != v26)
            objc_enumerationMutation(v51);
          v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * k);
          if (objc_msgSend(v55, "containsObject:", v28, v41))
          {
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v50, v28);
            continue;
          }
          objc_msgSend(v28, "mailboxScope");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            if (objc_msgSend(v49, "containsObject:", v29))
            {
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v48, v28);
            }
            else
            {
              if (!objc_msgSend(v47, "containsObject:", v29))
              {
                v58 = 0;
                -[EDMessagePersistence mailboxPersistence](v45, "mailboxPersistence");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "allMailboxObjectIDsWithMailboxTypeResolver:forExclusion:", v32, &v58);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                if (v58)
                {
                  v34 = v46;
                  if (!v46)
                  {
                    -[EDMessagePersistence mailboxPersistence](v45, "mailboxPersistence");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "allMailboxes");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "ef_filter:", &__block_literal_global_420);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  v56[0] = MEMORY[0x1E0C809B0];
                  v56[1] = 3221225472;
                  v56[2] = __75__EDMessagePersistence_messagesForMessageObjectIDs_missedMessageObjectIDs___block_invoke_4;
                  v56[3] = &unk_1E949CB28;
                  v57 = v33;
                  v46 = v34;
                  v37 = objc_msgSend(v34, "ef_any:", v56);

                  if ((v37 & 1) != 0)
                  {
LABEL_37:
                    objc_msgSend(v49, "addObject:", v29);
                    objc_msgSend(v23, "setObject:forKeyedSubscript:", v48, v28);
LABEL_40:

                    goto LABEL_41;
                  }
                }
                else if (objc_msgSend(v33, "ef_any:", &__block_literal_global_422))
                {
                  goto LABEL_37;
                }
                objc_msgSend(v47, "addObject:", v29);
                objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", v28);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setObject:forKeyedSubscript:", v38, v28);

                goto LABEL_40;
              }
              objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", v28);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v31, v28);

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, v28);

          }
LABEL_41:

        }
        v25 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v59, v77, 16);
        if (!v25)
        {
LABEL_47:

          v39 = objc_retainAutorelease(v23);
          *v41 = v39;

          goto LABEL_48;
        }
      }
    }
    *v41 = 0;
  }
LABEL_48:

  return v43;
}

void __75__EDMessagePersistence_messagesForMessageObjectIDs_missedMessageObjectIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v10 = 0;
  objc_msgSend(v6, "persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:", a3, 1, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  objc_msgSend(v6, "messagesForPersistedMessages:mailboxScope:", v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v9);
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v8);

}

id __75__EDMessagePersistence_messagesForMessageObjectIDs_missedMessageObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __75__EDMessagePersistence_messagesForMessageObjectIDs_missedMessageObjectIDs___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "ef_hasScheme:", *MEMORY[0x1E0D1DB58]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __75__EDMessagePersistence_messagesForMessageObjectIDs_missedMessageObjectIDs___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __75__EDMessagePersistence_messagesForMessageObjectIDs_missedMessageObjectIDs___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "ef_hasScheme:", *MEMORY[0x1E0D1DB58]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_groupMessageObjectIDsByMailboxScope:(id)a3
{
  objc_msgSend(a3, "ef_groupBy:", &__block_literal_global_424);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __61__EDMessagePersistence__groupMessageObjectIDsByMailboxScope___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "mailboxScope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E1E0], "noMailboxesScope");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)cachedMetadataJSONForKey:(id)a3 messageID:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[EDMessagePersistence _cachedMetadataJSONForKey:globalMessageID:](self, "_cachedMetadataJSONForKey:globalMessageID:", v6, objc_msgSend(v7, "globalMessageID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_cachedMetadataJSONForKey:(id)a3 globalMessageID:(int64_t)a4
{
  id v6;
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
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  if ((cachedMetadataArgumentsAreValid(v6, a4) & 1) != 0)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__16;
    v19 = __Block_byref_object_dispose__16;
    v20 = 0;
    -[EDMessagePersistence database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence _cachedMetadataJSONForKey:globalMessageID:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__EDMessagePersistence__cachedMetadataJSONForKey_globalMessageID___block_invoke;
    v11[3] = &unk_1E949E298;
    v12 = v6;
    v13 = &v15;
    v14 = a4;
    objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v11);

    v9 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __66__EDMessagePersistence__cachedMetadataJSONForKey_globalMessageID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v13;
  _QWORD v14[5];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT json_extract(%@ , :path) FROM %@ WHERE %@ == :message"), CFSTR("json_values"), CFSTR("message_metadata"), CFSTR("message_id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("$."), "stringByAppendingString:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v15[0] = CFSTR(":path");
  v15[1] = CFSTR(":message");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__EDMessagePersistence__cachedMetadataJSONForKey_globalMessageID___block_invoke_2;
  v14[3] = &unk_1E949B090;
  v14[4] = a1[5];
  v9 = objc_msgSend(v5, "executeWithNamedBindings:usingBlock:error:", v8, v14, &v13);
  v10 = v13;

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v3, "handleError:message:", v10, CFSTR("Fetching cached metadata JSON"));
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __66__EDMessagePersistence__cachedMetadataJSONForKey_globalMessageID___block_invoke_cold_1();
    }

  }
  return 1;
}

void __66__EDMessagePersistence__cachedMetadataJSONForKey_globalMessageID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a2;
  *a4 = 1;
  v11 = v6;
  if (objc_msgSend(v6, "columnExistsAtIndex:", 0))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)completeCachedMetadataJSONForGlobalMessageID:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (!a3 || *MEMORY[0x1E0D1DC08] == a3)
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[EDMessagePersistence completeCachedMetadataJSONForGlobalMessageID:].cold.1();

    v6 = 0;
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__16;
    v14 = __Block_byref_object_dispose__16;
    v15 = 0;
    -[EDMessagePersistence database](self, "database");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence completeCachedMetadataJSONForGlobalMessageID:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__EDMessagePersistence_completeCachedMetadataJSONForGlobalMessageID___block_invoke;
    v9[3] = &unk_1E949B778;
    v9[4] = &v10;
    v9[5] = a3;
    objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v9);

    objc_msgSend((id)v11[5], "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v10, 8);

  }
  return v6;
}

uint64_t __69__EDMessagePersistence_completeCachedMetadataJSONForGlobalMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  _QWORD v12[5];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ == :message"), CFSTR("json_values"), CFSTR("message_metadata"), CFSTR("message_id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR(":message");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__EDMessagePersistence_completeCachedMetadataJSONForGlobalMessageID___block_invoke_2;
  v12[3] = &unk_1E949B090;
  v12[4] = *(_QWORD *)(a1 + 32);
  LOBYTE(a1) = objc_msgSend(v5, "executeWithNamedBindings:usingBlock:error:", v7, v12, &v11);
  v8 = v11;

  if ((a1 & 1) == 0)
  {
    objc_msgSend(v3, "handleError:message:", v8, CFSTR("Fetching cached metadata JSON"));
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __69__EDMessagePersistence_completeCachedMetadataJSONForGlobalMessageID___block_invoke_cold_1();
    }

  }
  return 1;
}

void __69__EDMessagePersistence_completeCachedMetadataJSONForGlobalMessageID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a2;
  *a4 = 1;
  v11 = v6;
  if (objc_msgSend(v6, "columnExistsAtIndex:", 0))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)setCachedMetadataJSON:(id)a3 forKey:(id)a4 messageID:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  -[EDMessagePersistence _setCachedMetadataJSON:forKey:globalMessageID:](self, "_setCachedMetadataJSON:forKey:globalMessageID:", v10, v8, objc_msgSend(v9, "globalMessageID"));

}

- (void)_setCachedMetadataJSON:(id)a3 forKey:(id)a4 globalMessageID:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  EDMessagePersistence *v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a4;
  if ((cachedMetadataArgumentsAreValid(v9, a5) & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v8, "length") < 0x3E9)
    {
      -[EDMessagePersistence database](self, "database");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence _setCachedMetadataJSON:forKey:globalMessageID:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __70__EDMessagePersistence__setCachedMetadataJSON_forKey_globalMessageID___block_invoke;
      v13[3] = &unk_1E949C9D0;
      v14 = v8;
      v15 = self;
      v16 = v9;
      v17 = a5;
      objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v13);

    }
    else
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[EDMessagePersistence _setCachedMetadataJSON:forKey:globalMessageID:].cold.1();

    }
  }

}

uint64_t __70__EDMessagePersistence__setCachedMetadataJSON_forKey_globalMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_checkCachedMetadataRowLimitWithConnection:", v3);
    objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("INSERT INTO message_metadata(message_id, timestamp, json_values) VALUES(:message, :timestamp, json_set(json_object(), :path, :json_string)) ON CONFLICT(message_id) DO UPDATE SET json_values = json_set(json_values, :path, :json_string), timestamp = :timestamp;"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("$."), "stringByAppendingString:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v25[0] = *(_QWORD *)(a1 + 32);
    v24[0] = CFSTR(":json_string");
    v24[1] = CFSTR(":timestamp");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", llround(v7 + v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v8;
    v25[2] = v6;
    v24[2] = CFSTR(":path");
    v24[3] = CFSTR(":message");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v11 = objc_msgSend(v5, "executeWithNamedBindings:usingBlock:error:", v10, &__block_literal_global_443, &v21);
    v12 = v21;

    if ((v11 & 1) == 0)
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __70__EDMessagePersistence__setCachedMetadataJSON_forKey_globalMessageID___block_invoke_cold_2();
      }
LABEL_8:

    }
  }
  else
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE OR IGNORE message_metadata SET json_values = json_remove(json_values, :path), timestamp = :timestamp WHERE message_id == :message;"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("$."), "stringByAppendingString:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v22[0] = CFSTR(":timestamp");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", llround(v14 + v14));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = v6;
    v22[1] = CFSTR(":path");
    v22[2] = CFSTR(":message");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v18 = objc_msgSend(v5, "executeWithNamedBindings:usingBlock:error:", v17, &__block_literal_global_447, &v20);
    v12 = v20;

    if ((v18 & 1) == 0)
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __70__EDMessagePersistence__setCachedMetadataJSON_forKey_globalMessageID___block_invoke_cold_1();
      }
      goto LABEL_8;
    }
  }

  return 1;
}

void __70__EDMessagePersistence__setCachedMetadataJSON_forKey_globalMessageID___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 1;
}

void __70__EDMessagePersistence__setCachedMetadataJSON_forKey_globalMessageID___block_invoke_446(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 1;
}

- (void)_checkCachedMetadataRowLimitWithConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[EDMessagePersistence cachedMetadataIsolation](self, "cachedMetadataIsolation");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke;
  block[3] = &unk_1E949B6D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t buf[4];
  int v26;
  const __CFString *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCachedMetadataUpdatesSinceLastCheck:", objc_msgSend(*(id *)(a1 + 32), "cachedMetadataUpdatesSinceLastCheck") + 1);
  v2 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke_2;
  v24[3] = &unk_1E949E320;
  v24[4] = *(_QWORD *)(a1 + 32);
  if (__67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke_2((uint64_t)v24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedMetadataUpdatesSinceLastCheck:", 0);
    objc_msgSend(*(id *)(a1 + 40), "preparedStatementForQueryString:", CFSTR("SELECT COUNT(*) FROM message_metadata;"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23[0] = v2;
    v23[1] = 3221225472;
    v23[2] = __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke_3;
    v23[3] = &unk_1E949AF78;
    v23[4] = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(v3, "executeUsingBlock:error:", v23, &v22);
    v5 = v22;
    if (v4)
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "cachedMetadataEstimatedRowCount");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "intValue");
        *(_DWORD *)buf = 67109120;
        v26 = v8;
        _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_INFO, "Fetched cached metadata row count from database: %d", buf, 8u);

      }
    }
    else
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke_cold_2();
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "cachedMetadataEstimatedRowCount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (int)objc_msgSend(v9, "intValue") > 2500;

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "cachedMetadataEstimatedRowCount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");

      if (v12 > 1500)
      {
        objc_msgSend(*(id *)(a1 + 40), "preparedStatementForQueryString:", CFSTR("DELETE FROM message_metadata ORDER BY timestamp LIMIT :limit;"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12 - 1500;
        v27 = CFSTR(":limit");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v12 - 1500));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v17 = objc_msgSend(v13, "executeWithNamedBindings:usingBlock:error:", v16, &__block_literal_global_456, &v21);
        v18 = v21;

        if (v17)
        {
          +[EDMessagePersistence log](EDMessagePersistence, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            v26 = v14;
            _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_INFO, "Pruned %d rows from cached metadata.", buf, 8u);
          }

          objc_msgSend(*(id *)(a1 + 32), "setCachedMetadataUpdatesSinceLastCheck:", 0);
          objc_msgSend(*(id *)(a1 + 32), "setCachedMetadataEstimatedRowCount:", &unk_1E94E4898);
        }
        else
        {
          +[EDMessagePersistence log](EDMessagePersistence, "log");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v18, "ef_publicDescription");
            objc_claimAutoreleasedReturnValue();
            __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke_cold_1();
          }

        }
      }
    }
  }
}

uint64_t __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke_2(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  void *v5;
  _BOOL4 v8;
  uint64_t v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "cachedMetadataUpdatesSinceLastCheck");
  v3 = v2;
  if (v2 >= 0)
    v4 = v2;
  else
    v4 = v2 + 1;
  objc_msgSend(*(id *)(a1 + 32), "cachedMetadataEstimatedRowCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (int)(objc_msgSend(v5, "intValue") + (v4 >> 1)) > 2500 && v3 > 203 || v3 > 1127;
  if (v5)
    v9 = v8;
  else
    v9 = 1;

  return v9;
}

void __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a2;
  *a4 = 1;
  v12 = v6;
  if (objc_msgSend(v6, "columnExistsAtIndex:", 0))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "int64Value");

    if (v9 >= 0x7FFFFFFF)
      v10 = 0x7FFFFFFFLL;
    else
      v10 = v9;
    objc_msgSend(v7, "numberWithLongLong:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCachedMetadataEstimatedRowCount:", v11);

  }
}

void __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke_455(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 1;
}

- (id)cachedDatabaseIDsDictionaryForGlobalMessageIDs:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessagePersistence cachedDatabaseIDsDictionaryForGlobalMessageIDs:]", "EDMessagePersistence.m", 2228, "0");
}

- (id)messageIDsWithBasePaths:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessagePersistence messageIDsWithBasePaths:]", "EDMessagePersistence.m", 2232, "0");
}

- (BOOL)compressFile:(id)a3 error:(id *)a4
{
  return objc_msgSend(MEMORY[0x1E0D1EEB0], "compressFile:error:", a3, a4);
}

- (BOOL)compressDirectory:(id)a3 shouldCancel:(id)a4 error:(id *)a5
{
  return objc_msgSend(MEMORY[0x1E0D1EEB0], "compressDirectory:shouldCancel:error:", a3, a4, a5);
}

- (BOOL)persistMessageAuthenticationState:(int64_t)a3 forMessageWithGlobalMessageID:(int64_t)a4
{
  void *v7;
  void *v8;
  _QWORD v10[7];

  -[EDMessagePersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence persistMessageAuthenticationState:forMessageWithGlobalMessageID:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__EDMessagePersistence_persistMessageAuthenticationState_forMessageWithGlobalMessageID___block_invoke;
  v10[3] = &unk_1E949E368;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  LOBYTE(a4) = objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v10);

  return a4;
}

uint64_t __88__EDMessagePersistence_persistMessageAuthenticationState_forMessageWithGlobalMessageID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "_persistAuthenticationState:forGlobalMessageID:connection:", v5, v6, v3);

  return v7;
}

- (BOOL)persistMessageAuthenticationStates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[4];
  id v10;
  EDMessagePersistence *v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[EDMessagePersistence database](self, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence persistMessageAuthenticationStates:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__EDMessagePersistence_persistMessageAuthenticationStates___block_invoke;
    v9[3] = &unk_1E949AFA0;
    v10 = v4;
    v11 = self;
    v7 = objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __59__EDMessagePersistence_persistMessageAuthenticationStates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__EDMessagePersistence_persistMessageAuthenticationStates___block_invoke_2;
  v8[3] = &unk_1E949E390;
  v9 = v3;
  v10 = &v11;
  v4 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__EDMessagePersistence_persistMessageAuthenticationStates___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_persistAuthenticationState:forGlobalMessageID:connection:", v7, v8, *(_QWORD *)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

- (BOOL)_persistAuthenticationState:(id)a3 forGlobalMessageID:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("message_global_data"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("validation_state"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWhereClause:", v12);

  LOBYTE(v11) = objc_msgSend(v9, "executeUpdateStatement:error:", v10, 0);
  return (char)v11;
}

- (id)brandIndicatorForDatabaseID:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  v14 = 0;
  -[EDMessagePersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence brandIndicatorForDatabaseID:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__EDMessagePersistence_brandIndicatorForDatabaseID___block_invoke;
  v8[3] = &unk_1E949B778;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __52__EDMessagePersistence_brandIndicatorForDatabaseID___block_invoke(uint64_t a1, void *a2)
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
  id v13;
  id v15;
  _QWORD v16[5];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("indicator"), CFSTR("brand_indicators"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("verified"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "is:", MEMORY[0x1E0C9AAB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v17[0] = v7;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithExpressions:", v11);
  objc_msgSend(v4, "setWhere:", v12);

  v15 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__EDMessagePersistence_brandIndicatorForDatabaseID___block_invoke_2;
  v16[3] = &unk_1E949B090;
  v16[4] = *(_QWORD *)(a1 + 32);
  LOBYTE(a1) = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v16, &v15);
  v13 = v15;
  if ((a1 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v13, CFSTR("Seleting brand indicator"));

  return 1;
}

void __52__EDMessagePersistence_brandIndicatorForDatabaseID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)brandIndicatorForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
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
  v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  v18 = 0;
  -[EDMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence brandIndicatorForURL:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__EDMessagePersistence_brandIndicatorForURL___block_invoke;
  v10[3] = &unk_1E949AFC8;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __45__EDMessagePersistence_brandIndicatorForURL___block_invoke(uint64_t a1, void *a2)
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
  id v13;
  id v15;
  _QWORD v16[5];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("indicator"), CFSTR("brand_indicators"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("verified"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "is:", MEMORY[0x1E0C9AAB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v17[0] = v7;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithExpressions:", v11);
  objc_msgSend(v4, "setWhere:", v12);

  v15 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__EDMessagePersistence_brandIndicatorForURL___block_invoke_2;
  v16[3] = &unk_1E949B090;
  v16[4] = *(_QWORD *)(a1 + 40);
  LOBYTE(a1) = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v16, &v15);
  v13 = v15;
  if ((a1 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v13, CFSTR("Seleting brand indicator"));

  return 1;
}

void __45__EDMessagePersistence_brandIndicatorForURL___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)brandIndicatorsForURLs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
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
  v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  v18 = (id)0xAAAAAAAAAAAAAAAALL;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[EDMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence brandIndicatorsForURLs:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__EDMessagePersistence_brandIndicatorsForURLs___block_invoke;
  v10[3] = &unk_1E949AFC8;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __47__EDMessagePersistence_brandIndicatorsForURLs___block_invoke(uint64_t a1, void *a2)
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
  id v13;
  id v15;
  _QWORD v16[5];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("indicator"), CFSTR("brand_indicators"));
  objc_msgSend(v4, "addResultColumn:", CFSTR("url"));
  objc_msgSend(*(id *)(a1 + 32), "ef_mapSelector:", sel_absoluteString);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "in:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("verified"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "is:", MEMORY[0x1E0C9AAB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v17[0] = v7;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithExpressions:", v11);
  objc_msgSend(v4, "setWhere:", v12);

  v15 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__EDMessagePersistence_brandIndicatorsForURLs___block_invoke_2;
  v16[3] = &unk_1E949B090;
  v16[4] = *(_QWORD *)(a1 + 40);
  LOBYTE(a1) = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v16, &v15);
  v13 = v15;
  if ((a1 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v13, CFSTR("Seleting brand indicators"));

  return 1;
}

void __47__EDMessagePersistence_brandIndicatorsForURLs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("indicator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v7, v5);
}

- (int64_t)addBrandIndicatorWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v4, "evidenceLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_8;
  objc_msgSend(v4, "indicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v4, "indicatorHash");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v4, "hashAlgorithm");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_5;
    }
LABEL_8:
    v13 = *MEMORY[0x1E0D1DC08];
    goto LABEL_9;
  }

LABEL_5:
  objc_msgSend(v4, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = *MEMORY[0x1E0D1DC08];
  -[EDMessagePersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence addBrandIndicatorWithData:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__EDMessagePersistence_addBrandIndicatorWithData___block_invoke;
  v17[3] = &unk_1E949AF00;
  v12 = v9;
  v18 = v12;
  v19 = v4;
  v20 = &v21;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v17);

  v13 = v22[3];
  _Block_object_dispose(&v21, 8);

LABEL_9:
  return v13;
}

uint64_t __50__EDMessagePersistence_addBrandIndicatorWithData___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  _QWORD v26[5];
  id v27;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("brand_indicators"), 4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("url"));
  objc_msgSend(*(id *)(a1 + 40), "evidenceLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("evidence_url"));

  objc_msgSend(*(id *)(a1 + 40), "indicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "indicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("indicator"));

    v9 = MEMORY[0x1E0C9AAB0];
  }
  else
  {
    v9 = MEMORY[0x1E0C9AAA0];
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("verified"));
  objc_msgSend(*(id *)(a1 + 40), "indicatorHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "hashAlgorithm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "indicatorHash");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("indicator_hash"));

      objc_msgSend(*(id *)(a1 + 40), "hashAlgorithm");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("hash_algorithm"));

    }
  }
  objc_msgSend(v3, "clearLastInsertedDatabaseID");
  v27 = 0;
  v14 = objc_msgSend(v3, "executeInsertStatement:error:", v4, &v27);
  v15 = v27;
  if ((v14 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v15, CFSTR("Inserting brand indicator"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "lastInsertedDatabaseID");
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(_QWORD *)(v16 + 24);
  v18 = *MEMORY[0x1E0D1DC08];
  if (!v17)
  {
    *(_QWORD *)(v16 + 24) = v18;
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v17 == v18)
  {
    v19 = objc_alloc(MEMORY[0x1E0D1F040]);
    v20 = (void *)objc_msgSend(v19, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("brand_indicators"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("url"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "is:", *(_QWORD *)(a1 + 32));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWhere:", v22);

    v25 = v15;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __50__EDMessagePersistence_addBrandIndicatorWithData___block_invoke_2;
    v26[3] = &unk_1E949B090;
    v26[4] = *(_QWORD *)(a1 + 48);
    v14 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v20, v26, &v25);
    v23 = v25;

    if ((v14 & 1) == 0)
      objc_msgSend(v3, "handleError:message:", v23, CFSTR("Seleting existing brand indicator"));

  }
  else
  {
    v23 = v15;
  }

  return v14;
}

void __50__EDMessagePersistence_addBrandIndicatorWithData___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (id)undownloadedBrandIndicatorsWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = (id)0xAAAAAAAAAAAAAAAALL;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence undownloadedBrandIndicatorsWithLimit:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__EDMessagePersistence_undownloadedBrandIndicatorsWithLimit___block_invoke;
  v9[3] = &unk_1E949B778;
  v9[4] = &v10;
  v9[5] = a3;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __61__EDMessagePersistence_undownloadedBrandIndicatorsWithLimit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v10;
  _QWORD v11[5];

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("url"), CFSTR("brand_indicators"));
  objc_msgSend(v4, "addResultColumn:", CFSTR("evidence_url"));
  objc_msgSend(v4, "addResultColumn:", CFSTR("indicator_hash"));
  objc_msgSend(v4, "addResultColumn:", CFSTR("hash_algorithm"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("indicator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isNull");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v6);

  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v4, "setLimit:");
  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__EDMessagePersistence_undownloadedBrandIndicatorsWithLimit___block_invoke_2;
  v11[3] = &unk_1E949B090;
  v11[4] = *(_QWORD *)(a1 + 32);
  v7 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v11, &v10);
  v8 = v10;
  if ((v7 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v8, CFSTR("Seleting undownloaded brand indicators"));

  return 1;
}

void __61__EDMessagePersistence_undownloadedBrandIndicatorsWithLimit___block_invoke_2(uint64_t a1, void *a2)
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
  id v14;

  v14 = a2;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("evidence_url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("indicator_hash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hash_algorithm"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E690]), "initWithIndicator:location:evidenceLocation:indicatorHash:hashAlgorithm:", 0, v5, v8, v10, v12);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v13);

}

- (void)setBrandIndicator:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[EDMessagePersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence setBrandIndicator:forURL:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__EDMessagePersistence_setBrandIndicator_forURL___block_invoke;
  v13[3] = &unk_1E949AFA0;
  v12 = v6;
  v14 = v12;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v13);

  -[EDMessagePersistence hookRegistry](self, "hookRegistry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistenceDidAddBrandIndicator:forLocation:", v12, v10);

}

uint64_t __49__EDMessagePersistence_setBrandIndicator_forURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:conflictResolution:", CFSTR("brand_indicators"), 4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("indicator"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("verified"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "is:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhereClause:", v7);

  v11 = 0;
  v8 = objc_msgSend(v3, "executeUpdateStatement:error:", v4, &v11);
  v9 = v11;
  if ((v8 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v9, CFSTR("Updating brand indicator"));

  return v8;
}

- (void)removeBrandIndicatorForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[EDMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence removeBrandIndicatorForURL:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__EDMessagePersistence_removeBrandIndicatorForURL___block_invoke;
  v8[3] = &unk_1E949B7F0;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);

}

uint64_t __51__EDMessagePersistence_removeBrandIndicatorForURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  v5 = *MEMORY[0x1E0D1EE00];
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("brand_indicators"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("url"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "is:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v9);

  objc_msgSend(v6, "setLimit:", 1);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = *MEMORY[0x1E0D1DC08];
  v24 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __51__EDMessagePersistence_removeBrandIndicatorForURL___block_invoke_2;
  v25[3] = &unk_1E949B090;
  v25[4] = &v26;
  LOBYTE(v7) = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v25, &v24);
  v10 = v24;
  if ((v7 & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:conflictResolution:", CFSTR("messages"), 4);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("brand_indicator"));

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("brand_indicator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v27[3]);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "is:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWhereClause:", v15);

    v23 = v10;
    LOBYTE(v14) = objc_msgSend(v3, "executeUpdateStatement:error:", v11, &v23);
    v16 = v23;

    if ((v14 & 1) != 0)
    {

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v27[3]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "is:", v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("brand_indicators"), v11);
      v22 = v16;
      v20 = objc_msgSend(v3, "executeDeleteStatement:error:", v19, &v22);
      v10 = v22;

      if ((v20 & 1) == 0)
        objc_msgSend(v3, "handleError:message:", v10, CFSTR("Deleting brand indicator"));

    }
    else
    {
      objc_msgSend(v3, "handleError:message:", v16, CFSTR("Nulling out brand indicator for messages"));
      v20 = 0;
      v10 = v16;
    }

  }
  else
  {
    objc_msgSend(v3, "handleError:message:", v10, CFSTR("Selecting brand indicator to remove"));
    v20 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v20;
}

void __51__EDMessagePersistence_removeBrandIndicatorForURL___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "databaseIDValue");
  v8 = *MEMORY[0x1E0D1DC08];
  if (v7)
    v8 = v7;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;

  *a4 = 1;
}

- (void)setBrandIndicatorDatabaseID:(int64_t)a3 location:(id)a4 forMessages:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[EDMessagePersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence setBrandIndicatorDatabaseID:location:forMessages:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __73__EDMessagePersistence_setBrandIndicatorDatabaseID_location_forMessages___block_invoke;
  v22[3] = &unk_1E949E298;
  v25 = a3;
  v12 = v9;
  v23 = v12;
  v24 = &v26;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v22);

  if (*((_BYTE *)v27 + 24))
  {
    -[EDMessagePersistence brandIndicatorForDatabaseID:](self, "brandIndicatorForDatabaseID:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setBrandIndicatorLocation:andData:", v8, v13, (_QWORD)v18);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v15);
    }

  }
  _Block_object_dispose(&v26, 8);

}

BOOL __73__EDMessagePersistence_setBrandIndicatorDatabaseID_location_forMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  id v12;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:conflictResolution:", CFSTR("messages"), 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("brand_indicator"));

  objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_485);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "in:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhereClause:", v8);

  v12 = 0;
  LOBYTE(v8) = objc_msgSend(v3, "executeUpdateStatement:error:", v4, &v12);
  v9 = v12;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v8;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v3, "handleError:message:", v9, CFSTR("Updating brand indicator"));
    v10 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  }

  return v10;
}

id __73__EDMessagePersistence_setBrandIndicatorDatabaseID_location_forMessages___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "persistedMessageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "databaseID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)retrieveFollowUpJsonStringForModelEvaluationForSuggestionsForMessages:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  SEL v18;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "ef_map:", &__block_literal_global_486);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessagePersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence retrieveFollowUpJsonStringForModelEvaluationForSuggestionsForMessages:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__EDMessagePersistence_retrieveFollowUpJsonStringForModelEvaluationForSuggestionsForMessages___block_invoke_2;
  v15[3] = &unk_1E949AF28;
  v10 = v7;
  v16 = v10;
  v11 = v6;
  v17 = v11;
  v18 = a2;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v15);

  v12 = v17;
  v13 = v11;

  return v13;
}

id __94__EDMessagePersistence_retrieveFollowUpJsonStringForModelEvaluationForSuggestionsForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __94__EDMessagePersistence_retrieveFollowUpJsonStringForModelEvaluationForSuggestionsForMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResult:table:", v4, CFSTR("message_global_data"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "in:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "isNotNull");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v21[0] = v7;
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExpressions:", v10);
  objc_msgSend(v5, "setWhere:", v11);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__EDMessagePersistence_retrieveFollowUpJsonStringForModelEvaluationForSuggestionsForMessages___block_invoke_3;
  v18[3] = &unk_1E949BF18;
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v19 = v12;
  v20 = v13;
  v17 = 0;
  v14 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v5, v18, &v17);
  v15 = v17;
  if (v15)
    objc_msgSend(v3, "handleError:message:", v15, &stru_1E94A4508);

  return v14;
}

void __94__EDMessagePersistence_retrieveFollowUpJsonStringForModelEvaluationForSuggestionsForMessages___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else
  {
    objc_msgSend(v4, "dataValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543875;
      v11 = v8;
      v12 = 2048;
      v13 = v4;
      v14 = 2113;
      v15 = v9;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: failed to load followup JSON as string (bad utf-8 encoding?). column:%p base64 data: %{private}@", (uint8_t *)&v10, 0x20u);

    }
  }

}

- (void)persistFollowUp:(id)a3 forMessages:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  EDMessagePersistence *v20;
  uint64_t *v21;
  SEL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    if (v7)
    {
      objc_msgSend(v7, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9
        || (objc_msgSend(v7, "endDate"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            v9,
            !v10))
      {

        v7 = 0;
      }
    }
    objc_msgSend(v8, "ef_filter:", &__block_literal_global_490);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      -[EDMessagePersistence hookRegistry](self, "hookRegistry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "persistenceWillUpdateDisplayDateForMessages:", v11);

    }
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    -[EDMessagePersistence database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence persistFollowUp:forMessages:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__EDMessagePersistence_persistFollowUp_forMessages___block_invoke_2;
    v17[3] = &unk_1E949E418;
    v21 = &v23;
    v15 = v7;
    v18 = v15;
    v19 = v8;
    v20 = self;
    v22 = a2;
    objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, v17);

    if (objc_msgSend(v11, "count"))
    {
      -[EDMessagePersistence hookRegistry](self, "hookRegistry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "persistenceDidUpdateDisplayDateForMessages:changeIsRemote:generation:", v11, 0, v24[3]);

    }
    _Block_object_dispose(&v23, 8);

    v7 = v15;
  }

}

uint64_t __52__EDMessagePersistence_persistFollowUp_forMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "dateReceived");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToDate:", v4) ^ 1;

  return v5;
}

uint64_t __52__EDMessagePersistence_persistFollowUp_forMessages___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v35, "transactionGeneration");
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:conflictResolution:", CFSTR("message_global_data"), 1);
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v4, CFSTR("follow_up_start_date"));
  if (!v3)

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v6, CFSTR("follow_up_end_date"));
  if (!v5)

  objc_msgSend(*(id *)(a1 + 32), "jsonStringForModelEvaluationForSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v8, CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));
  if (!v7)

  objc_msgSend(*(id *)(a1 + 40), "ef_map:", &__block_literal_global_491);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "in:", v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWhereClause:", v10);

  v46 = 0;
  LOBYTE(v9) = objc_msgSend(v35, "executeUpdateStatement:error:", v36, &v46);
  v11 = v46;
  if ((v9 & 1) != 0)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v12 = *(id *)(a1 + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v43 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "setFollowUp:", *(_QWORD *)(a1 + 32));
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v13);
    }

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("messages"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("date_received"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v16, CFSTR("display_date"));

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "in:", v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWhereClause:", v18);

    v41 = v11;
    v19 = objc_msgSend(v35, "executeUpdateStatement:error:", v33, &v41);
    v32 = v41;

    if ((v19 & 1) != 0)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v20 = *(id *)(a1 + 40);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
            objc_msgSend(v24, "displayDate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "dateReceived");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v26, "isEqualToDate:", v25) & 1) == 0)
            {
              objc_msgSend(v24, "setDisplayDate:", v26);
              objc_msgSend(*(id *)(a1 + 48), "hookRegistry");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "persistenceIsUpdatingDisplayDateForMessage:fromDate:generation:", v24, v25, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

            }
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
        }
        while (v21);
      }

    }
    else
    {
      objc_msgSend(v35, "handleError:message:");
    }

    v11 = v32;
  }
  else
  {
    objc_msgSend(v35, "handleError:message:", v11, CFSTR("Updating follow up"));
    v19 = 0;
  }
  +[EDMessagePersistence log](EDMessagePersistence, "log");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v48 = v29;
    v49 = 1024;
    v50 = v19;
    v51 = 2114;
    v52 = v30;
    _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ success:%d globalMessageIDs:%{public}@", buf, 0x1Cu);

  }
  return v19;
}

id __52__EDMessagePersistence_persistFollowUp_forMessages___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)persistSendLaterForMessages:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  EDPersistenceDatabaseGenerationWindow *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessagePersistence hookRegistry](self, "hookRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistenceWillBeginUpdates");

  +[EDMessagePersistence log](EDMessagePersistence, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v7;
    v25 = 2048;
    v26 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Persist send later date (%{public}@) for %lu messages", buf, 0x16u);
  }

  -[EDMessagePersistence database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence persistSendLaterForMessages:date:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __57__EDMessagePersistence_persistSendLaterForMessages_date___block_invoke;
  v20 = &unk_1E949AFA0;
  v13 = v7;
  v21 = v13;
  v14 = v6;
  v22 = v14;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, &v17);

  -[EDMessagePersistence hookRegistry](self, "hookRegistry", v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "persistenceDidUpdateSendLaterDate:messages:generationWindow:", v13, v14, v8);

  -[EDMessagePersistence hookRegistry](self, "hookRegistry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistenceDidFinishUpdates");

}

uint64_t __57__EDMessagePersistence_persistSendLaterForMessages_date___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:conflictResolution:", CFSTR("message_global_data"), 1);
  v5 = *(void **)(a1 + 32);
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("send_later_date"));
  if (!v5)

  objc_msgSend(*(id *)(a1 + 40), "ef_map:", &__block_literal_global_497);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "in:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhereClause:", v9);

  v21 = 0;
  v10 = objc_msgSend(v3, "executeUpdateStatement:error:", v4, &v21);
  v11 = v21;
  if ((v10 & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = *(id *)(a1 + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "setSendLaterDate:", *(_QWORD *)(a1 + 32), (_QWORD)v17);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v13);
    }

  }
  else
  {
    objc_msgSend(v3, "handleError:message:", v11, CFSTR("Updating follow up"));
  }

  return v10;
}

id __57__EDMessagePersistence_persistSendLaterForMessages_date___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __68__EDMessagePersistence_updateBeforeDisplayForMessagesMatchingQuery___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __68__EDMessagePersistence_updateBeforeDisplayForMessagesMatchingQuery___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

uint64_t __68__EDMessagePersistence_updateBeforeDisplayForMessagesMatchingQuery___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "displayDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToDate:", v4);

  return v5;
}

- (void)updateBeforeDisplayForPersistedMessages:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  EDPersistenceDatabaseGenerationWindow *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v15 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ec_integerDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__EDMessagePersistence_updateBeforeDisplayForPersistedMessages___block_invoke;
  v16[3] = &unk_1E949E460;
  v8 = v5;
  v17 = v8;
  v9 = v7;
  v18 = v9;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v15, "ef_filter:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessagePersistence updateDisplayDateForPersistedMessages:displayDate:changeIsRemote:](self, "updateDisplayDateForPersistedMessages:displayDate:changeIsRemote:", v11, v8, 0);
  -[EDMessagePersistence hookRegistry](self, "hookRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistenceDidUpdateFollowUpForMessages:generationWindow:", v10, v12);

  -[EDMessagePersistence hookRegistry](self, "hookRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "persistenceDidUpdateDisplayDateForReadLaterDateMessages:generationWindow:", v9, v12);

}

uint64_t __64__EDMessagePersistence_updateBeforeDisplayForPersistedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "readLater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "ef_isEarlierThanOrEqualDate:", *(_QWORD *)(a1 + 32)))
    {
      v6 = v5;
      goto LABEL_6;
    }
LABEL_12:
    v19 = 0;
    v6 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v3, "followUp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsDate:", *(_QWORD *)(a1 + 32));

  if (!v8)
    goto LABEL_12;
  objc_msgSend(v3, "followUp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
LABEL_6:
  objc_msgSend(v3, "displayDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "ef_isEarlierThanDate:", v6);

  if (!v11)
    goto LABEL_13;
  EDRemindMeLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v3, "globalMessageID");
    objc_msgSend(v3, "subject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ef_publicDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "readLater");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ef_publicDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v23 = v13;
    v24 = 2114;
    v25 = v14;
    v26 = 2114;
    v27 = v15;
    v28 = 2114;
    v29 = v17;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Updating display date for message: id=%lld, subject=%{public}@, displayDate=%{public}@, remindMe=%{public}@, potentialDate=%{public}@", buf, 0x34u);

  }
  v18 = 40;
  if (!v5)
    v18 = 48;
  objc_msgSend(*(id *)(a1 + v18), "addObject:", v3);
  v19 = 1;
LABEL_14:

  return v19;
}

- (void)updateDisplayDateForPersistedMessages:(id)a3 displayDate:(id)a4 changeIsRemote:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  EDPersistenceDatabaseGenerationWindow *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  EDMessagePersistence *v27;
  _BYTE *v28;
  _BYTE buf[32];
  uint64_t v30;

  v5 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "ef_map:", &__block_literal_global_502);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    EDRemindMeLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v5;
      *(_WORD *)&buf[18] = 2114;
      *(_QWORD *)&buf[20] = v9;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Updating display date for messages with database IDs: %{public}@, changeIsRemote:%{BOOL}d date: %{public}@", buf, 0x1Cu);
    }

    -[EDMessagePersistence hookRegistry](self, "hookRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistenceWillUpdateDisplayDateForMessages:", v8);

    v13 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    *(_QWORD *)&buf[24] = 0;
    -[EDMessagePersistence database](self, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence updateDisplayDateForPersistedMessages:displayDate:changeIsRemote:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __89__EDMessagePersistence_updateDisplayDateForPersistedMessages_displayDate_changeIsRemote___block_invoke_503;
    v22 = &unk_1E949E4A8;
    v28 = buf;
    v16 = v13;
    v23 = v16;
    v24 = v9;
    v25 = v10;
    v17 = v8;
    v26 = v17;
    v27 = self;
    objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, &v19);

    -[EDMessagePersistence hookRegistry](self, "hookRegistry", v19, v20, v21, v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "persistenceDidUpdateDisplayDateForMessages:changeIsRemote:generation:", v17, v5, *(_QWORD *)(*(_QWORD *)&buf[8] + 24));

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "No database IDs found for messages to update display date", buf, 2u);
    }
  }

}

id __89__EDMessagePersistence_updateDisplayDateForPersistedMessages_displayDate_changeIsRemote___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "persistedMessageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "databaseID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __89__EDMessagePersistence_updateDisplayDateForPersistedMessages_displayDate_changeIsRemote___block_invoke_503(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v15, "transactionGeneration");
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("messages"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("display_date"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "in:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWhereClause:", v5);

  v6 = objc_msgSend(v15, "executeUpdateStatement:error:", v3, 0);
  if ((_DWORD)v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = *(id *)(a1 + 56);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "displayDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setDisplayDate:", *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 64), "hookRegistry");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "persistenceIsUpdatingDisplayDateForMessage:fromDate:generation:", v11, v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  return v6;
}

void __61__EDMessagePersistence__checkForFollowUpExpirationWithQuery___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

+ (int64_t)databaseIDForEmailAddress:(id)a3 connection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v37 = a4;
  objc_msgSend(v6, "emailAddressValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "displayName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E94A4508;
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    v13 = v8;
    objc_msgSend(v13, "emailAddressValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "simpleAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(v13, "stringValue");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v17;

    v27 = objc_alloc(MEMORY[0x1E0D1F040]);
    v28 = (void *)objc_msgSend(v27, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("addresses"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("comment"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "equalTo:", v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "equalTo:", v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_alloc(MEMORY[0x1E0D1EF90]);
    v38[0] = v30;
    v38[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithExpressions:", v34);
    objc_msgSend(v28, "setWhere:", v35);

    v23 = objc_msgSend(a1, "_databaseIDFromSelect:connection:", v28, v37);
  }
  else
  {
    objc_msgSend(v6, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0D1F040]);
    v20 = (void *)objc_msgSend(v19, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("addresses"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "equalTo:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWhere:", v22);

    v23 = objc_msgSend(a1, "_databaseIDFromSelect:connection:", v20, v37);
    if (v23 == *MEMORY[0x1E0D1DC08])
    {
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("comment"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "equalTo:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWhere:", v25);

      v23 = objc_msgSend(a1, "_databaseIDFromSelect:connection:", v20, v37);
    }

  }
  return v23;
}

+ (id)allDatabaseIDsForSimpleAddresses:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D1F040]);
  v8 = (void *)objc_msgSend(v7, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("addresses"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "in:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhere:", v10);

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__EDMessagePersistence_allDatabaseIDsForSimpleAddresses_connection___block_invoke;
  v14[3] = &unk_1E949AF78;
  v12 = v11;
  v15 = v12;
  objc_msgSend(v6, "executeSelectStatement:withBlock:error:", v8, v14, 0);

  return v12;
}

void __68__EDMessagePersistence_allDatabaseIDsForSimpleAddresses_connection___block_invoke(uint64_t a1, void *a2)
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

+ (int64_t)_databaseIDFromSelect:(id)a3 connection:(id)a4
{
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = *MEMORY[0x1E0D1DC08];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__EDMessagePersistence__databaseIDFromSelect_connection___block_invoke;
  v6[3] = &unk_1E949B090;
  v6[4] = &v7;
  objc_msgSend(a4, "executeSelectStatement:withBlock:error:", a3, v6, 0);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __57__EDMessagePersistence__databaseIDFromSelect_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (int64_t)findAddressIDForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = *MEMORY[0x1E0D1DC08];
    -[EDMessagePersistence database](self, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence findAddressIDForAddress:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__EDMessagePersistence_findAddressIDForAddress___block_invoke;
    v9[3] = &unk_1E949BBD8;
    v11 = &v12;
    v10 = v4;
    objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

    v7 = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = *MEMORY[0x1E0D1DC08];
  }

  return v7;
}

uint64_t __48__EDMessagePersistence_findAddressIDForAddress___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[EDMessagePersistence databaseIDForEmailAddress:connection:](EDMessagePersistence, "databaseIDForEmailAddress:connection:", *(_QWORD *)(a1 + 32), v3);

  return 1;
}

- (id)metadataForAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[EDMessagePersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence metadataForAddresses:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__EDMessagePersistence_metadataForAddresses___block_invoke;
  v13[3] = &unk_1E949AFA0;
  v8 = v4;
  v14 = v8;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  v10 = v15;
  v11 = v9;

  return v11;
}

uint64_t __45__EDMessagePersistence_metadataForAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("address"), CFSTR("address_metadata"));
  objc_msgSend(v4, "addResultColumn:", CFSTR("smime_capabilities"));
  objc_msgSend(v4, "addResultColumn:", CFSTR("smime_capabilities_date"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "in:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v6);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__EDMessagePersistence_metadataForAddresses___block_invoke_2;
  v8[3] = &unk_1E949AF78;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v8, 0);

  return 1;
}

void __45__EDMessagePersistence_metadataForAddresses___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("smime_capabilities"));

  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("smime_capabilities_date"));

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v5);
}

- (void)setMetadata:(id)a3 forAddress:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "date");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend(v6, "capabilities");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v9, "dataWithJSONObject:options:error:", v10, 0, &v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v24;

      if (v11)
      {
        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
        v14 = objc_alloc(MEMORY[0x1E0D1F060]);
        v25[0] = CFSTR("address");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithTable:conflictTarget:", CFSTR("address_metadata"), v15);

        objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, CFSTR("address"));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("smime_capabilities"));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, CFSTR("smime_capabilities_date"));
        objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("smime_capabilities_date"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lessThan:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWhereClause:", v18);

        -[EDMessagePersistence database](self, "database");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence setMetadata:forAddress:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __47__EDMessagePersistence_setMetadata_forAddress___block_invoke;
        v22[3] = &unk_1E949B7F0;
        v21 = v16;
        v23 = v21;
        objc_msgSend(v19, "__performWriteWithCaller:usingBlock:", v20, v22);

      }
      else
      {
        +[EDMessagePersistence log](EDMessagePersistence, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(MEMORY[0x1E0D1EF48], "ec_partiallyRedactedStringForAddress:", v7);
          objc_claimAutoreleasedReturnValue();
          -[NSObject ef_publicDescription](v12, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[EDMessagePersistence setMetadata:forAddress:].cold.3();
        }
      }

    }
    else
    {
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(MEMORY[0x1E0D1EF48], "ec_partiallyRedactedStringForAddress:", v7);
        objc_claimAutoreleasedReturnValue();
        -[EDMessagePersistence setMetadata:forAddress:].cold.2();
      }
    }

  }
  else
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[EDMessagePersistence setMetadata:forAddress:].cold.1();
  }

}

uint64_t __47__EDMessagePersistence_setMetadata_forAddress___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "executeUpsertStatement:error:", *(_QWORD *)(a1 + 32), 0);
}

- (id)messageObjectIDForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "em_messageIDHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[EDMessagePersistence globalIDForMessageIDHeader:](self, "globalIDForMessageIDHeader:", v5);
    objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v4, "em_internalMessageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v11 = 0;
    v6 = -[EDMessagePersistence globalIDForMessageWithDatabaseID:mailboxScope:](self, "globalIDForMessageWithDatabaseID:mailboxScope:", objc_msgSend(v8, "databaseID"), &v11);
    v7 = v11;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  if (v6)
LABEL_8:
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E258]), "initWithGlobalMessageID:mailboxScope:", v6, v7);
LABEL_9:

  return v6;
}

- (void)setGeneratedSummaries:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id obj;
  id obja;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(v28, "ef_filter:", &__block_literal_global_508);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v30, "ef_map:", &__block_literal_global_510);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Setting generated summaries for %{public}@", buf, 0xCu);
    }

    -[EDMessagePersistence persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:](self, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v29, 0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v27, "count");
    if (v4 != objc_msgSend(v30, "count"))
    {
      objc_msgSend(v27, "ef_map:", &__block_literal_global_513);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __46__EDMessagePersistence_setGeneratedSummaries___block_invoke_2_514;
      v42[3] = &unk_1E949E550;
      v6 = v5;
      v43 = v6;
      objc_msgSend(v29, "ef_filter:", v42);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDMessagePersistence log](EDMessagePersistence, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[EDMessagePersistence setGeneratedSummaries:].cold.1();

    }
    v9 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v30;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v13, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v14);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v10);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obja = v27;
    v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(obja);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(v18, "persistentID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "attributeSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_alloc(MEMORY[0x1E0D1E188]);
          objc_msgSend(v21, "summarizationContentTopLine");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "summarizationContentSynopsis");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "isUrgent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v22, "initWithTopLine:synopsis:urgent:", v23, v24, objc_msgSend(v25, "BOOLValue"));

          -[EDMessagePersistence setGeneratedSummary:forPersistedMessage:](self, "setGeneratedSummary:forPersistedMessage:", v26, v18);
        }
        v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v15);
    }

  }
}

BOOL __46__EDMessagePersistence_setGeneratedSummaries___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summarizationContentTopLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "summarizationStatus") == 1;

  return v4;
}

id __46__EDMessagePersistence_setGeneratedSummaries___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __46__EDMessagePersistence_setGeneratedSummaries___block_invoke_511(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "persistedMessageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "databaseID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __46__EDMessagePersistence_setGeneratedSummaries___block_invoke_2_514(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)setGeneratedSummary:(id)a3 forSearchableItemIdentifer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "longLongValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessagePersistence persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:](self, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[EDMessagePersistence setGeneratedSummary:forPersistedMessage:](self, "setGeneratedSummary:forPersistedMessage:", v6, v11);
  }
  else
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[EDMessagePersistence setGeneratedSummary:forSearchableItemIdentifer:].cold.1();

  }
}

- (void)setGeneratedSummary:(id)a3 forPersistedMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  EDPersistenceDatabaseGenerationWindow *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl() && (EMIsGreymatterSupportedWithOverride() & 1) != 0)
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "persistentID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "globalMessageID");
      objc_msgSend(v6, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v9;
      v24 = 2048;
      v25 = v10;
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Setting generated summary for message: %{public}@ (global ID:%lld), summary: %{public}@", buf, 0x20u);

    }
    v12 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    -[EDMessagePersistence database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence setGeneratedSummary:forPersistedMessage:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __64__EDMessagePersistence_setGeneratedSummary_forPersistedMessage___block_invoke;
    v19 = &unk_1E949AFA0;
    v20 = v6;
    v15 = v7;
    v21 = v15;
    objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, &v16);

    -[EDMessagePersistence notifyGeneratedSummaryChangeForMessage:window:](self, "notifyGeneratedSummaryChangeForMessage:window:", v15, v12, v16, v17, v18, v19);
  }

}

uint64_t __64__EDMessagePersistence_setGeneratedSummary_forPersistedMessage___block_invoke(uint64_t a1, void *a2)
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
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("generated_summaries"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(*(id *)(a1 + 32), "topLine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, *MEMORY[0x1E0D1DDB0]);

  objc_msgSend(*(id *)(a1 + 32), "synopsis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, *MEMORY[0x1E0D1DDA8]);

  objc_msgSend(v5, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("summary"));

  if (objc_msgSend(v3, "executeInsertStatement:error:", v4, 0))
  {
    v9 = objc_msgSend(v3, "lastInsertedDatabaseID");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("message_global_data"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("generated_summary"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "urgent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("urgent"));

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "globalMessageID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "equalTo:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWhereClause:", v15);

    v16 = objc_msgSend(v3, "executeUpdateStatement:error:", v10, 0);
    if ((_DWORD)v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1F0]), "initWithGlobalMessageID:", objc_msgSend(*(id *)(a1 + 40), "globalMessageID"));
      v18 = objc_alloc(MEMORY[0x1E0D1E188]);
      objc_msgSend(*(id *)(a1 + 32), "topLine");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "synopsis");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v18, "initWithTopLine:synopsis:urgent:messageItemID:", v19, v20, objc_msgSend(*(id *)(a1 + 32), "urgent"), v17);

      objc_msgSend(*(id *)(a1 + 40), "setGeneratedSummary:", v21);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)notifyGeneratedSummaryChangeForMessage:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDMessagePersistence hookRegistry](self, "hookRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("GeneratedSummary");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistenceDidUpdateProperties:message:generationWindow:", v9, v6, v7);

}

- (id)messageObjectIDsForSearchableItemIdentifiers:(id)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  EDMessagePersistence *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  +[EDMessagePersistence signpostLog](EDMessagePersistence, "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[EDMessagePersistence signpostID](self, "signpostID");
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 138412802;
    v43 = objc_opt_class();
    v44 = 2048;
    v45 = self;
    v46 = 2048;
    v47 = objc_msgSend(v31, "count");
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PersistentIDMapping", "<%@ %p> Begin mapping %lu searchable item identifiers.", buf, 0x20u);
  }

  v30 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
  v29 = (void *)objc_opt_new();
  v28 = (void *)objc_opt_new();
  v27 = (void *)objc_opt_new();
  v26 = (void *)objc_opt_new();
  objc_msgSend(v31, "ef_compactMap:", &__block_literal_global_519);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessagePersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence messageObjectIDsForSearchableItemIdentifiers:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __69__EDMessagePersistence_messageObjectIDsForSearchableItemIdentifiers___block_invoke_2;
  v38[3] = &unk_1E949B0B8;
  v9 = v25;
  v39 = v9;
  v10 = v27;
  v40 = v10;
  v11 = v26;
  v41 = v11;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v38);

  v32[0] = v8;
  v32[1] = 3221225472;
  v32[2] = __69__EDMessagePersistence_messageObjectIDsForSearchableItemIdentifiers___block_invoke_4;
  v32[3] = &unk_1E949E5C0;
  v12 = v10;
  v33 = v12;
  v13 = v11;
  v34 = v13;
  v14 = v30;
  v35 = v14;
  v15 = v29;
  v36 = v15;
  v16 = v28;
  v37 = v16;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v32);
  +[EDMessagePersistence log](EDMessagePersistence, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 138543618;
    v43 = (uint64_t)v31;
    v44 = 2048;
    v45 = (EDMessagePersistence *)v18;
    _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Mapped spotlight identifiers %{public}@ to %lu message objectIDs", buf, 0x16u);
  }

  +[EDMessagePersistence signpostLog](EDMessagePersistence, "signpostLog");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = -[EDMessagePersistence signpostID](self, "signpostID");
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    v21 = objc_opt_class();
    v22 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 138412802;
    v43 = v21;
    v44 = 2048;
    v45 = self;
    v46 = 2048;
    v47 = v22;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PersistentIDMapping", "<%@ %p> End mapping %lu searchable item identifiers.", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v15, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __69__EDMessagePersistence_messageObjectIDsForSearchableItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __69__EDMessagePersistence_messageObjectIDsForSearchableItemIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", CFSTR("global_message_id"), v5);

  v7 = *MEMORY[0x1E0D1EE00];
  objc_msgSend(v6, "addResultColumn:", *MEMORY[0x1E0D1EE00]);
  objc_msgSend(v6, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("mailboxes"), CFSTR("mailbox"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addResultColumn:", CFSTR("url"));
  v9 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "table:column:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "in:", *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v12);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__EDMessagePersistence_messageObjectIDsForSearchableItemIdentifiers___block_invoke_3;
  v15[3] = &unk_1E949E598;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v13 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v15, 0);

  return v13;
}

void __69__EDMessagePersistence_messageObjectIDsForSearchableItemIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v6);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v6);

}

void __69__EDMessagePersistence_messageObjectIDsForSearchableItemIdentifiers___block_invoke_4(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");

  objc_msgSend(a1[5], "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v7);
    v9 = (void *)MEMORY[0x1E0D1E1E0];
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mailboxScopeForMailboxObjectIDs:forExclusion:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E1E0], "noMailboxesScope");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(a1[6], "containsIndex:", v5) & 1) == 0)
  {
    objc_msgSend(a1[6], "addIndex:", v5);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E258]), "initWithGlobalMessageID:mailboxScope:", v5, v11);
    objc_msgSend(a1[7], "addObject:", v12);
    objc_msgSend(a1[8], "setObject:forKeyedSubscript:", v12, v3);

  }
}

- (int64_t)globalIDForMessageIDHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[EDMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence globalIDForMessageIDHash:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__EDMessagePersistence_globalIDForMessageIDHash___block_invoke;
  v10[3] = &unk_1E949AF00;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __49__EDMessagePersistence_globalIDForMessageIDHash___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend((id)objc_opt_class(), "messageGlobalDataTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], v5);

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("message_id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "int64Value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__EDMessagePersistence_globalIDForMessageIDHash___block_invoke_2;
  v12[3] = &unk_1E949B090;
  v12[4] = *(_QWORD *)(a1 + 48);
  v10 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v12, 0);

  return v10;
}

void __49__EDMessagePersistence_globalIDForMessageIDHash___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (int64_t)globalIDForMessageIDHeader:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E680]), "initWithAngleBracketID:", v4);
  v6 = -[EDMessagePersistence globalIDForMessageIDHash:](self, "globalIDForMessageIDHash:", v5);

  return v6;
}

- (id)persistedMessagesForForMessageIDHeader:(id)a3 requireProtectedData:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[EDMessagePersistence globalIDForMessageIDHeader:](self, "globalIDForMessageIDHeader:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessagePersistence persistedMessageIDsForGlobalMessageIDs:](self, "persistedMessageIDsForGlobalMessageIDs:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessagePersistence persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:](self, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v9, v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)globalIDForMessageWithDatabaseID:(int64_t)a3 mailboxScope:(id *)a4
{
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  __assert_rtn("-[EDMessagePersistence globalIDForMessageWithDatabaseID:mailboxScope:]", "EDMessagePersistence.m", 3159, "0");
}

- (id)requestContentForMessageObjectID:(id)a3 requestID:(unint64_t)a4 options:(id)a5 delegate:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessagePersistence requestContentForMessageObjectID:requestID:options:delegate:completionHandler:]", "EDMessagePersistence.m", 3165, "0");
}

- (id)fullDataIfAvailableForMessage:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessagePersistence fullDataIfAvailableForMessage:]", "EDMessagePersistence.m", 3171, "0");
}

- (id)requestSummaryForMessageObjectID:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessagePersistence requestSummaryForMessageObjectID:]", "EDMessagePersistence.m", 3177, "0");
}

- (id)diagnosticsForForMessageObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id *, void *, void *);
  void *v17;
  EDMessagePersistence *v18;
  id v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessagePersistence persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:](self, "persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessagePersistence _groupMessageObjectIDsByMailboxScope:](self, "_groupMessageObjectIDsByMailboxScope:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __58__EDMessagePersistence_diagnosticsForForMessageObjectIDs___block_invoke;
  v17 = &unk_1E949E188;
  v18 = self;
  v8 = v5;
  v19 = v8;
  v9 = v6;
  v20 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v14);
  v10 = (void *)MEMORY[0x1E0CB36D8];
  v21 = CFSTR("diagnostics");
  v22[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1, v14, v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataWithJSONObject:options:error:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __58__EDMessagePersistence_diagnosticsForForMessageObjectIDs___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id obj;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  v29 = 0u;
  v5 = v18;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v8), "globalMessageID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

  objc_msgSend(a1[4], "_databaseIDsDictionaryForGlobalMessageIDs:mailboxScope:", v21, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "addObject:", v15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "globalMessageID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("global-message-id"));

        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __58__EDMessagePersistence_diagnosticsForForMessageObjectIDs___block_invoke_2;
        v22[3] = &unk_1E949E5E8;
        v22[4] = v14;
        v17 = v15;
        v23 = v17;
        v24 = a1[6];
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v22);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v11);
  }

}

void __58__EDMessagePersistence_diagnosticsForForMessageObjectIDs___block_invoke_2(id *a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v33 = a2;
  v32 = a3;
  v7 = objc_msgSend(v32, "longLongValue");
  if (v7 == objc_msgSend(a1[4], "globalMessageID"))
  {
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v33, CFSTR("database-id"));
    *a4 = 1;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = a1[6];
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "globalMessageID");
        if (v12 == objc_msgSend(a1[4], "globalMessageID"))
        {
          objc_msgSend(v11, "account");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v14, CFSTR("account"));

          v15 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "persistedMessageID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "databaseID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v17, CFSTR("persisted-message-id"));

          objc_msgSend(v11, "displayDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v18, "timeIntervalSince1970");
            objc_msgSend(v20, "numberWithLong:", llround(v21));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v22, CFSTR("display-date"));

          }
          objc_msgSend(v11, "summary");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "length");
          if (v24 >= 4)
            v25 = 4;
          else
            v25 = v24;
          objc_msgSend(v23, "substringToIndex:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v26, CFSTR("summary"));

          objc_msgSend(v11, "subjectIfAvailable");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "subjectString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = objc_msgSend(v28, "length");
          if (v29 >= 4)
            v30 = 4;
          else
            v30 = v29;
          objc_msgSend(v28, "substringToIndex:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v31, CFSTR("subject"));

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

}

- (id)collectStatistics
{
  -[EDMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessagePersistence collectStatistics]", "EDMessagePersistence.m", 3233, "0");
}

- (void)collectStatisticsWithStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[EDMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessagePersistence collectStatisticsWithStatistics:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__EDMessagePersistence_collectStatisticsWithStatistics___block_invoke;
  v8[3] = &unk_1E949B7F0;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v8);

}

uint64_t __56__EDMessagePersistence_collectStatisticsWithStatistics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t (**v5)(void *, const __CFString *);
  double Current;
  double v7;
  _QWORD aBlock[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setStart:", CFAbsoluteTimeGetCurrent());
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__EDMessagePersistence_collectStatisticsWithStatistics___block_invoke_2;
  aBlock[3] = &unk_1E949E610;
  v4 = v3;
  v10 = v4;
  v5 = (uint64_t (**)(void *, const __CFString *))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "setMessages:", v5[2](v5, CFSTR("SELECT COUNT(*) FROM messages")));
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "start");
  objc_msgSend(*(id *)(a1 + 32), "setDuration:", Current - v7);

  return 1;
}

uint64_t __56__EDMessagePersistence_collectStatisticsWithStatistics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "preparedStatementForQueryString:", v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    if (sqlite3_step(v5) == 100)
      v6 = sqlite3_column_int(v5, 0);
    else
      v6 = 0;
    sqlite3_reset(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EDMessagePersistenceStatistics)persistenceStatistics
{
  return self->_persistenceStatistics;
}

- (OS_dispatch_queue)cachedMetadataIsolation
{
  return self->_cachedMetadataIsolation;
}

- (NSNumber)cachedMetadataEstimatedRowCount
{
  return self->_cachedMetadataEstimatedRowCount;
}

- (void)setCachedMetadataEstimatedRowCount:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMetadataEstimatedRowCount, a3);
}

- (int)cachedMetadataUpdatesSinceLastCheck
{
  return self->_cachedMetadataUpdatesSinceLastCheck;
}

- (void)setCachedMetadataUpdatesSinceLastCheck:(int)a3
{
  self->_cachedMetadataUpdatesSinceLastCheck = a3;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (EMVIPReader)vipReader
{
  return self->_vipReader;
}

- (EDGmailLabelPersistence)gmailLabelPersistence
{
  return self->_gmailLabelPersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (EDMessageTransformer)messageTransformer
{
  return self->_messageTransformer;
}

- (void)setMessageTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_messageTransformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryParser, 0);
  objc_storeStrong((id *)&self->_messageTransformer, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_gmailLabelPersistence, 0);
  objc_storeStrong((id *)&self->_vipReader, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_cachedMetadataEstimatedRowCount, 0);
  objc_storeStrong((id *)&self->_cachedMetadataIsolation, 0);
  objc_storeStrong((id *)&self->_persistenceStatistics, 0);
  objc_destroyWeak((id *)&self->_mailboxPersistence);
}

void __69__EDMessagePersistence_messagesMatchingQuery_limit_cancelationToken___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "received error while querying for messages: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __85__EDMessagePersistence__iterateMessagesMatchingQuery_limit_cancelationToken_handler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "%{public}@: Couldn't return messages because database is locked", v4);

  OUTLINED_FUNCTION_2_0();
}

void __82__EDMessagePersistence__messageForSQLRow_connection_mailboxScope_recipientsCache___block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, a3, (uint64_t)a3, "Couldn't map mailbox for message with id %lld, url = %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __82__EDMessagePersistence__messageForSQLRow_connection_mailboxScope_recipientsCache___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_10_0(&dword_1D2F2C000, v0, v1, "Found a message with a 0 business ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __82__EDMessagePersistence__messageForSQLRow_connection_mailboxScope_recipientsCache___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, v0, v1, "Message has no sender: %lld (globalID = %lld)", v2);
  OUTLINED_FUNCTION_1_0();
}

void __82__EDMessagePersistence__messageForSQLRow_connection_mailboxScope_recipientsCache___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, v0, v1, "Message has no subject: %lld (globalID = %lld)", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)persistedMessagesFromSendersWithAddressIDs:(uint64_t)a3 temporarilyUnavailableMessageObjectIDs:(NSObject *)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, a4, a3, "Received %lu temporarily unavailable message object IDs: %@", (uint8_t *)a2);
}

void __66__EDMessagePersistence__cachedMetadataJSONForKey_globalMessageID___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, v6, v4, "Failed to read metadata for key '%{public}@': %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)completeCachedMetadataJSONForGlobalMessageID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Trying to access cached metadata for global message ID 0 or -1.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__EDMessagePersistence_completeCachedMetadataJSONForGlobalMessageID___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "Failed to read metadata: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_setCachedMetadataJSON:forKey:globalMessageID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v0, v1, "JSON for cached metadata key '%{public}@' is too big.", v2);
  OUTLINED_FUNCTION_1_0();
}

void __70__EDMessagePersistence__setCachedMetadataJSON_forKey_globalMessageID___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, v6, v4, "Failed to remove metadata for key '%{public}@': %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __70__EDMessagePersistence__setCachedMetadataJSON_forKey_globalMessageID___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, v6, v4, "Failed to add metadata for key '%{public}@': %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint8_t *v4;
  os_log_t v5;

  OUTLINED_FUNCTION_8();
  *(_DWORD *)v1 = 67109378;
  *(_DWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 8) = 2114;
  *(_QWORD *)(v1 + 10) = v3;
  _os_log_error_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_ERROR, "Failed to prune %d rows from cached metadata: %{public}@", v4, 0x12u);

  OUTLINED_FUNCTION_2_0();
}

void __67__EDMessagePersistence__checkCachedMetadataRowLimitWithConnection___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "Failed to get number of rows in cached metadata: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)setMetadata:forAddress:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_10_0(&dword_1D2F2C000, v0, v1, "Unable to save metadata for nil address", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setMetadata:forAddress:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  _os_log_fault_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_FAULT, "Unable to save metadata for address %{public}@ without date", v4, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

- (void)setMetadata:forAddress:.cold.3()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_4_0();
  v2 = (void *)v1;
  OUTLINED_FUNCTION_1_1(v1, v3, v4, 5.8382e-34);
  _os_log_fault_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_FAULT, "Unable to serialize metadata into JSON for address %{public}@: %{public}@", v5, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)setGeneratedSummaries:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v0, v1, "Couldn't find messages for ids %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)setGeneratedSummary:forSearchableItemIdentifer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v0, v1, "Couldn't find message for searchable item identifier %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
