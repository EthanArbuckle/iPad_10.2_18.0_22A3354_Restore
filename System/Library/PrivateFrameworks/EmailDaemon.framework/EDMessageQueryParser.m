@implementation EDMessageQueryParser

- (id)sqlQueryToCountJournaledMessagesForQuery:(id)a3
{
  -[EDMessageQueryParser _sqlQueryToCountResultsForQuery:distinctByGlobalMessageID:](self, "_sqlQueryToCountResultsForQuery:distinctByGlobalMessageID:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_sqlQueryToCountResultsForQuery:(id)a3 distinctByGlobalMessageID:(BOOL)a4
{
  _BOOL4 v4;
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
  void *v16;
  void *v17;
  void *v18;

  v4 = a4;
  v6 = a3;
  -[EDMessageQueryParser transformer](self, "transformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transformPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence globalMessageIDColumnName](EDMessagePersistence, "globalMessageIDColumnName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "table:column:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D1F030];
  -[EDMessageQueryParser sqlPropertyMapper](self, "sqlPropertyMapper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v16 = v13;
  else
    v16 = 0;
  objc_msgSend(v14, "countStatementForPredicate:propertyMapper:distinctBy:", v9, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "queryOptions") & 0x100) != 0)
    -[EDMessageQueryParser additionalSQLClauseForJournaledMessages](self, "additionalSQLClauseForJournaledMessages");
  else
    -[EDMessageQueryParser additionalSQLClauseForCountQuery](self, "additionalSQLClauseForCountQuery");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryParser _modifySelectStatement:byAddingAdditionalClause:](self, "_modifySelectStatement:byAddingAdditionalClause:", v17, v18);

  return v17;
}

- (EFSQLObjectPropertyMapper)sqlPropertyMapper
{
  return self->_sqlPropertyMapper;
}

- (EDMessageQueryTransformer)transformer
{
  return self->_transformer;
}

- (void)_modifySelectStatement:(id)a3 byAddingAdditionalClause:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "where");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAA0]) & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1E0D1EF90];
      v12[0] = v8;
      v12[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "combined:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v11;
    }
  }
  else
  {
    v8 = v6;
  }
  objc_msgSend(v5, "setWhere:", v8);

}

- (EFSQLValueExpressable)additionalSQLClauseForCountQuery
{
  return self->_additionalSQLClauseForCountQuery;
}

- (id)sqlCountQueryForQuery:(id)a3
{
  -[EDMessageQueryParser _sqlQueryToCountResultsForQuery:distinctByGlobalMessageID:](self, "_sqlQueryToCountResultsForQuery:distinctByGlobalMessageID:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (EFSQLValueExpressable)additionalSQLClauseForJournaledMessages
{
  return self->_additionalSQLClauseForJournaledMessages;
}

- (EDMessageQueryParser)initWithSchema:(id)a3 protectedSchema:(id)a4 accountsProvider:(id)a5 vipManager:(id)a6 messagePersistence:(id)a7 mailboxPersistence:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  EDMessageQueryParser *v20;
  EDMessageQueryTransformer *v21;
  EDMessageQueryTransformer *transformer;
  uint64_t v23;
  EFSQLObjectPropertyMapper *sqlPropertyMapper;
  uint64_t v25;
  EFSQLValueExpressable *additionalSQLClause;
  uint64_t v27;
  EFSQLValueExpressable *additionalSQLClauseForCountQuery;
  uint64_t v29;
  EFSQLValueExpressable *additionalSQLClauseForGlobalMessageCountQuery;
  uint64_t v31;
  EFSQLValueExpressable *additionalSQLClauseForJournaledMessages;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)EDMessageQueryParser;
  v20 = -[EDMessageQueryParser init](&v34, sel_init);
  if (v20)
  {
    v21 = -[EDMessageQueryTransformer initWithAccountsProvider:mailboxPersistence:messagePersistence:vipManager:]([EDMessageQueryTransformer alloc], "initWithAccountsProvider:mailboxPersistence:messagePersistence:vipManager:", v16, v19, v18, v17);
    transformer = v20->_transformer;
    v20->_transformer = v21;

    +[EDMessagePersistence objectPropertyMapperForSchema:protectedSchema:](EDMessagePersistence, "objectPropertyMapperForSchema:protectedSchema:", v14, v15);
    v23 = objc_claimAutoreleasedReturnValue();
    sqlPropertyMapper = v20->_sqlPropertyMapper;
    v20->_sqlPropertyMapper = (EFSQLObjectPropertyMapper *)v23;

    objc_msgSend(v18, "expressionForFilteringUnavailableMessages");
    v25 = objc_claimAutoreleasedReturnValue();
    additionalSQLClause = v20->_additionalSQLClause;
    v20->_additionalSQLClause = (EFSQLValueExpressable *)v25;

    objc_msgSend(v18, "expressionForFilteringUnavailableMessagesFromCount");
    v27 = objc_claimAutoreleasedReturnValue();
    additionalSQLClauseForCountQuery = v20->_additionalSQLClauseForCountQuery;
    v20->_additionalSQLClauseForCountQuery = (EFSQLValueExpressable *)v27;

    objc_msgSend(v18, "expressionForFilteringUnavailableMessagesFromCountForGlobalMessageQuery");
    v29 = objc_claimAutoreleasedReturnValue();
    additionalSQLClauseForGlobalMessageCountQuery = v20->_additionalSQLClauseForGlobalMessageCountQuery;
    v20->_additionalSQLClauseForGlobalMessageCountQuery = (EFSQLValueExpressable *)v29;

    objc_msgSend(v18, "expressionForFindingOnlyJournaledMessages");
    v31 = objc_claimAutoreleasedReturnValue();
    additionalSQLClauseForJournaledMessages = v20->_additionalSQLClauseForJournaledMessages;
    v20->_additionalSQLClauseForJournaledMessages = (EFSQLValueExpressable *)v31;

  }
  return v20;
}

- (id)sqlQueryForQuery:(id)a3 protectedDataAvailable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v4 = a4;
  v6 = a3;
  -[EDMessageQueryParser transformer](self, "transformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transformPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D1F030];
  objc_msgSend(v6, "sortDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "limit");
  -[EDMessageQueryParser sqlPropertyMapper](self, "sqlPropertyMapper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectStatementForReturnObjectKeypaths:predicate:sortDescriptors:limit:propertyMapper:protectedDataAvailable:", MEMORY[0x1E0C9AA60], v9, v11, v12, v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "queryOptions") & 0x100) != 0)
  {
    -[EDMessageQueryParser additionalSQLClauseForJournaledMessages](self, "additionalSQLClauseForJournaledMessages");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v6, "queryOptions") & 0x200) != 0)
    {
      v16 = 0;
      goto LABEL_8;
    }
    -[EDMessageQueryParser additionalSQLClause](self, "additionalSQLClause");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
  if (v15)
    -[EDMessageQueryParser _modifySelectStatement:byAddingAdditionalClause:](self, "_modifySelectStatement:byAddingAdditionalClause:", v14, v15);
LABEL_8:
  objc_msgSend(v6, "sortDescriptors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "orderByColumn:fromTable:ascending:", *MEMORY[0x1E0D1EE00], v19, 0);

  }
  return v14;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EDMessageQueryParser_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_55 != -1)
    dispatch_once(&log_onceToken_55, block);
  return (id)log_log_55;
}

void __27__EDMessageQueryParser_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_55;
  log_log_55 = (uint64_t)v1;

}

- (id)sqlQueryToCountMessagesWithGlobalMessageID:(int64_t)a3 matchingQuery:(id)a4
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[EDMessageQueryParser transformer](self, "transformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transformPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D1F030];
  -[EDMessageQueryParser sqlPropertyMapper](self, "sqlPropertyMapper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "countStatementForPredicate:propertyMapper:distinctBy:", v9, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "where");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence globalMessageIDColumnName](EDMessagePersistence, "globalMessageIDColumnName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "table:column:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "equalTo:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v24 = (void *)MEMORY[0x1E0D1EF90];
    -[EDMessageQueryParser additionalSQLClauseForGlobalMessageCountQuery](self, "additionalSQLClauseForGlobalMessageCountQuery", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "combined:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if ((objc_msgSend(v13, "isEqual:", MEMORY[0x1E0C9AAA0]) & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0D1EF90];
    v27[0] = v19;
    v27[1] = v13;
    -[EDMessageQueryParser additionalSQLClauseForGlobalMessageCountQuery](self, "additionalSQLClauseForGlobalMessageCountQuery");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "combined:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v23;
LABEL_5:

  }
  objc_msgSend(v12, "setWhere:", v13);

  return v12;
}

- (id)sqlCountQueryByMailboxForQuery:(id)a3
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
  void *v14;
  void *v15;

  v4 = a3;
  -[EDMessageQueryParser transformer](self, "transformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transformPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence globalMessageIDColumnName](EDMessagePersistence, "globalMessageIDColumnName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "table:column:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D1F030];
  -[EDMessageQueryParser sqlPropertyMapper](self, "sqlPropertyMapper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "countStatementForPredicate:propertyMapper:distinctBy:groupBy:groupByTable:", v7, v13, v11, CFSTR("url"), CFSTR("mailboxes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "queryOptions") & 0x100) != 0)
    -[EDMessageQueryParser additionalSQLClauseForJournaledMessages](self, "additionalSQLClauseForJournaledMessages");
  else
    -[EDMessageQueryParser additionalSQLClauseForCountQuery](self, "additionalSQLClauseForCountQuery");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryParser _modifySelectStatement:byAddingAdditionalClause:](self, "_modifySelectStatement:byAddingAdditionalClause:", v14, v15);

  return v14;
}

- (EFSQLValueExpressable)additionalSQLClause
{
  return self->_additionalSQLClause;
}

- (EFSQLValueExpressable)additionalSQLClauseForGlobalMessageCountQuery
{
  return self->_additionalSQLClauseForGlobalMessageCountQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSQLClauseForJournaledMessages, 0);
  objc_storeStrong((id *)&self->_additionalSQLClauseForGlobalMessageCountQuery, 0);
  objc_storeStrong((id *)&self->_additionalSQLClauseForCountQuery, 0);
  objc_storeStrong((id *)&self->_additionalSQLClause, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_sqlPropertyMapper, 0);
}

@end
