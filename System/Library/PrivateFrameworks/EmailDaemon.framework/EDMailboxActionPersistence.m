@implementation EDMailboxActionPersistence

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
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
  void *v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("account_identifier"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("action_type"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("mailbox_name"), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("mailbox"), 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("new_mailbox_name"), 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithName:rowIDType:columns:", CFSTR("mailbox_actions"), 2, v10);

  v14 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (EDMailboxActionPersistence)initWithDatabase:(id)a3
{
  id v5;
  EDMailboxActionPersistence *v6;
  EDMailboxActionPersistence *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDMailboxActionPersistence;
  v6 = -[EDMailboxActionPersistence init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_database, a3);

  return v7;
}

- (void)saveMailboxActionForAccountID:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[EDMailboxActionPersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMailboxActionPersistence saveMailboxActionForAccountID:action:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__EDMailboxActionPersistence_saveMailboxActionForAccountID_action___block_invoke;
  v12[3] = &unk_1E949AFA0;
  v11 = v6;
  v13 = v11;
  v10 = v7;
  v14 = v10;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);

}

uint64_t __67__EDMailboxActionPersistence_saveMailboxActionForAccountID_action___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v14;
  id v15;
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT INTO mailbox_actions (account_identifier, action_type, mailbox, mailbox_name, new_mailbox_name) VALUES (?, ?, ?, ?, ?)"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v16[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "actionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "mailboxID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v6;
  objc_msgSend(*(id *)(a1 + 40), "mailboxName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v7;
  objc_msgSend(*(id *)(a1 + 40), "renamedMailboxName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v14, "executeWithIndexedBindings:usingBlock:error:", v10, 0, &v15);
  v12 = v15;

  if (!v8)
  if ((v11 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v12, CFSTR("inserting mailbox action"));

  return 1;
}

- (id)allMailboxActionForAccountID:(id)a3
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMailboxActionPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMailboxActionPersistence allMailboxActionForAccountID:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__EDMailboxActionPersistence_allMailboxActionForAccountID___block_invoke;
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

uint64_t __59__EDMailboxActionPersistence_allMailboxActionForAccountID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "preparedStatementForQueryString:", CFSTR("SELECT ROWID, action_type, mailbox, mailbox_name, new_mailbox_name FROM mailbox_actions WHERE (account_identifier = ?) ORDER BY ROWID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFA8], "bindingWithString:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__EDMailboxActionPersistence_allMailboxActionForAccountID___block_invoke_2;
  v7[3] = &unk_1E949AF78;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "executeWithIndexedBindings:usingBlock:error:", v5, v7, 0);

  return 1;
}

void __59__EDMailboxActionPersistence_allMailboxActionForAccountID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  EDMailboxAction *v12;
  EDMailboxAction *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v14 = [EDMailboxAction alloc];
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v16, "int64Value");
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("action_type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("mailbox"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("mailbox_name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("new_mailbox_name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EDMailboxAction initWithID:actionType:mailboxID:mailboxName:renamedMailboxName:](v14, "initWithID:actionType:mailboxID:mailboxName:renamedMailboxName:", v2, v4, v7, v9, v11);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
}

- (id)nextMailboxActionForAccountID:(id)a3
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
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  v18 = 0;
  -[EDMailboxActionPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMailboxActionPersistence nextMailboxActionForAccountID:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__EDMailboxActionPersistence_nextMailboxActionForAccountID___block_invoke;
  v10[3] = &unk_1E949AFC8;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __60__EDMailboxActionPersistence_nextMailboxActionForAccountID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "preparedStatementForQueryString:", CFSTR("SELECT ROWID, action_type, mailbox, mailbox_name, new_mailbox_name FROM mailbox_actions WHERE (account_identifier = ?) ORDER BY ROWID LIMIT 1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFA8], "bindingWithString:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__EDMailboxActionPersistence_nextMailboxActionForAccountID___block_invoke_2;
  v7[3] = &unk_1E949B090;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "executeWithIndexedBindings:usingBlock:error:", v5, v7, 0);

  return 1;
}

void __60__EDMailboxActionPersistence_nextMailboxActionForAccountID___block_invoke_2(uint64_t a1, void *a2)
{
  EDMailboxAction *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v2 = [EDMailboxAction alloc];
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v18, "int64Value");
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("action_type"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v16, "longLongValue");
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("mailbox"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("mailbox_name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("new_mailbox_name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EDMailboxAction initWithID:actionType:mailboxID:mailboxName:renamedMailboxName:](v2, "initWithID:actionType:mailboxID:mailboxName:renamedMailboxName:", v3, v4, v7, v9, v11);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (void)deleteMailboxAction:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  -[EDMailboxActionPersistence database](self, "database");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMailboxActionPersistence deleteMailboxAction:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__EDMailboxActionPersistence_deleteMailboxAction___block_invoke;
  v6[3] = &__block_descriptor_40_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  v6[4] = a3;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v4, v6);

}

uint64_t __50__EDMailboxActionPersistence_deleteMailboxAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "preparedStatementForQueryString:", CFSTR("DELETE FROM mailbox_actions WHERE ROWID = ?"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeWithIndexedBindings:usingBlock:error:", v5, 0, 0);

  return 1;
}

- (void)deleteMailboxActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[EDMailboxActionPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMailboxActionPersistence deleteMailboxActions:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__EDMailboxActionPersistence_deleteMailboxActions___block_invoke;
  v8[3] = &unk_1E949B7F0;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);

}

uint64_t __51__EDMailboxActionPersistence_deleteMailboxActions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM mailbox_actions WHERE ROWID IN (%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeWithIndexedBindings:usingBlock:error:", MEMORY[0x1E0C9AA60], 0, 0);

  return 1;
}

id __51__EDMailboxActionPersistence_deleteMailboxActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v2, "longLongValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
