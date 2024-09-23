@implementation SYTransaction

- (SYTransaction)initWithStore:(id)a3
{
  id v5;
  SYTransaction *v6;
  SYTransaction *v7;
  NSMutableArray *v8;
  NSMutableArray *changes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SYTransaction;
  v6 = -[SYTransaction init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    changes = v7->_changes;
    v7->_changes = v8;

  }
  return v7;
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "-[SYTransaction dealloc]: XPC transaction wasn't ended properly", v1, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (BOOL)_beginTransaction
{
  BOOL *p_inTransaction;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  OS_os_transaction *v14;
  OS_os_transaction *transaction;

  p_inTransaction = &self->_inTransaction;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_inTransaction))
    {
      v5 = 0;
      __clrex();
      return v5;
    }
    v5 = 1;
  }
  while (__stlxr(1u, (unsigned __int8 *)p_inTransaction));
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v6 = qword_253D84AD8;
  if (os_log_type_enabled((os_log_t)qword_253D84AD8, OS_LOG_TYPE_DEBUG))
    -[SYTransaction _beginTransaction].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v14;

  return v5;
}

- (BOOL)_endTransaction
{
  BOOL *p_inTransaction;
  int v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  OS_os_transaction *transaction;

  p_inTransaction = &self->_inTransaction;
  do
  {
    v4 = __ldaxr((unsigned __int8 *)p_inTransaction);
    if (v4 != 1)
    {
      v5 = 0;
      __clrex();
      return v5;
    }
  }
  while (__stlxr(0, (unsigned __int8 *)p_inTransaction));
  v5 = 1;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v6 = qword_253D84AD8;
  if (os_log_type_enabled((os_log_t)qword_253D84AD8, OS_LOG_TYPE_DEBUG))
    -[SYTransaction _endTransaction].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  transaction = self->_transaction;
  self->_transaction = 0;

  return v5;
}

- (id)changeList
{
  return self->_changes;
}

- (void)addObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SYTransaction _beginTransaction](self, "_beginTransaction");
  -[SYTransaction store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYChange changeWithObject:updateType:store:](SYChange, "changeWithObject:updateType:store:", v4, 0, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SYTransaction changes](self, "changes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (void)updateObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SYTransaction _beginTransaction](self, "_beginTransaction");
  -[SYTransaction store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYChange changeWithObject:updateType:store:](SYChange, "changeWithObject:updateType:store:", v4, 1, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SYTransaction changes](self, "changes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (void)deleteObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[SYStore allowsDeletes](self->_store, "allowsDeletes"))
  {
    -[SYTransaction _beginTransaction](self, "_beginTransaction");
    -[SYTransaction store](self, "store");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYChange changeWithObject:updateType:store:](SYChange, "changeWithObject:updateType:store:", v7, 2, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SYTransaction changes](self, "changes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

  }
  else
  {
    -[SYLegacyStore postUserNotification:message:](self->_store, "postUserNotification:message:", CFSTR("Delete Denied"), CFSTR("A client attempted to send a delete message while deletes were denied."));
  }

}

- (void)commit
{
  -[SYTransaction commitBlocking:reportError:](self, "commitBlocking:reportError:", 0, 0);
}

- (void)commitBlocking:(BOOL)a3 reportError:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  -[SYTransaction store](self, "store");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SYTransaction changes](self, "changes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYTransaction contextInfo](self, "contextInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYTransaction idsOptions](self, "idsOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_handleObjectChanges:contextInfo:idsOptions:blockUntilSent:reportError:notifyingTransaction:", v7, v8, v9, v4, v6, self);

}

- (void)rollback
{
  id v2;

  -[SYTransaction changes](self, "changes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (void)setContextInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)idsOptions
{
  return self->_idsOptions;
}

- (void)setIdsOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SYLegacyStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (NSMutableArray)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
  objc_storeStrong((id *)&self->_changes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_idsOptions, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)_beginTransaction
{
  OUTLINED_FUNCTION_0_4(&dword_211704000, a1, a3, "SYTransaction: beginning XPC transaction, to stop us being Jetsammed until it's done.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

- (void)_endTransaction
{
  OUTLINED_FUNCTION_0_4(&dword_211704000, a1, a3, "SYTransaction: ending XPC transaction. We can now be jetsammed safely.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

@end
