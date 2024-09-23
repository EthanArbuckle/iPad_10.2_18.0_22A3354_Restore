@implementation EDMessageQueryEvaluator

- (EDMessageQueryEvaluator)initWithQuery:(id)a3 messagePersistence:(id)a4
{
  id v7;
  id v8;
  EDMessageQueryEvaluator *v9;
  EDMessageQueryEvaluator *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  EMMailboxScope *mailboxScope;
  void *v16;
  void *v17;
  uint64_t v18;
  NSPredicate *filterPredicate;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)EDMessageQueryEvaluator;
  v9 = -[EDMessageQueryEvaluator init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageQuery, a3);
    objc_storeStrong((id *)&v10->_messagePersistence, a4);
    v11 = (void *)MEMORY[0x1E0D1E248];
    -[EMQuery predicate](v10->_messageQuery, "predicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessagePersistence mailboxPersistence](v10->_messagePersistence, "mailboxPersistence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mailboxScopeForPredicate:withMailboxTypeResolver:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    mailboxScope = v10->_mailboxScope;
    v10->_mailboxScope = (EMMailboxScope *)v14;

    v16 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v7, "predicate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateStrippingSpotlightOnlyTerms:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    filterPredicate = v10->_filterPredicate;
    v10->_filterPredicate = (NSPredicate *)v18;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_messageQuery, 0);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__EDMessageQueryEvaluator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_52 != -1)
    dispatch_once(&log_onceToken_52, block);
  return (OS_os_log *)(id)log_log_52;
}

void __30__EDMessageQueryEvaluator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_52;
  log_log_52 = (uint64_t)v1;

}

- (id)transformAndFilterMessages:(id)a3
{
  -[EDMessageQueryEvaluator transformAndFilterMessages:includeDeleted:](self, "transformAndFilterMessages:includeDeleted:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transformAndFilterMessages:(id)a3 includeDeleted:(BOOL)a4
{
  void *v5;
  void *v6;

  -[EDMessageQueryEvaluator transformMessages:includeDeleted:](self, "transformMessages:includeDeleted:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryEvaluator filterMessages:unmatchedMessages:](self, "filterMessages:unmatchedMessages:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transformMessages:(id)a3
{
  -[EDMessageQueryEvaluator transformMessages:includeDeleted:](self, "transformMessages:includeDeleted:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transformMessages:(id)a3 includeDeleted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  -[EDMessageQueryEvaluator messagePersistence](self, "messagePersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryEvaluator mailboxScope](self, "mailboxScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messagesForPersistedMessages:mailboxScope:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v9, "ef_filter:", &__block_literal_global_41);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

uint64_t __60__EDMessageQueryEvaluator_transformMessages_includeDeleted___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deleted") ^ 1;

  return v3;
}

- (id)filterMessages:(id)a3 unmatchedMessages:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EDMessageQueryEvaluator messageQuery](self, "messageQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryEvaluator messageQuery](self, "messageQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortDescriptors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__EDMessageQueryEvaluator_filterMessages_unmatchedMessages___block_invoke;
    v17[3] = &unk_1E949B4A0;
    v17[4] = self;
    objc_msgSend(v6, "ef_partition:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "second");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingDescriptors:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "first");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingDescriptors:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EDMessageQueryEvaluator filterPredicate](self, "filterPredicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingDescriptors:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  return v15;
}

uint64_t __60__EDMessageQueryEvaluator_filterMessages_unmatchedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "filterPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "evaluateWithObject:", v3);

  return v5;
}

- (EMQuery)messageQuery
{
  return self->_messageQuery;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_filterPredicate, a3);
}

- (void)filterMessages:(uint8_t *)buf unmatchedMessages:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_FAULT, "Exception occured: %{public}@\nSymbols:\n%{public}@", buf, 0x16u);

}

@end
