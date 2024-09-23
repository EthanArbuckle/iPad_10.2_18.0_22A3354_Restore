@implementation FBSynchronizedTransactionGroup

uint64_t __46__FBSynchronizedTransactionGroup__didComplete__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSynchronizationDelegate:", 0);
}

- (void)synchronizedTransactionReadyToCommit:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_synchronizedTransactionsAwaitingCommitReadiness, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_synchronizedTransactionsAwaitingCommitReadiness, "removeObject:", v4);
    -[NSMutableSet addObject:](self->_synchronizedTransactionsReadyToCommit, "addObject:", v4);
    -[FBSynchronizedTransactionGroup _checkPreconditionsAndCommitIfReady](self, "_checkPreconditionsAndCommitIfReady");
  }

}

- (void)_childTransactionDidComplete:(id)a3
{
  NSMutableSet *synchronizedTransactionsAwaitingCommitReadiness;
  id v5;
  objc_super v6;

  synchronizedTransactionsAwaitingCommitReadiness = self->_synchronizedTransactionsAwaitingCommitReadiness;
  v5 = a3;
  -[NSMutableSet removeObject:](synchronizedTransactionsAwaitingCommitReadiness, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_synchronizedTransactionsReadyToCommit, "removeObject:", v5);
  -[FBSynchronizedTransactionGroup _checkPreconditionsAndCommitIfReady](self, "_checkPreconditionsAndCommitIfReady");
  v6.receiver = self;
  v6.super_class = (Class)FBSynchronizedTransactionGroup;
  -[FBSynchronizedTransactionGroup _childTransactionDidComplete:](&v6, sel__childTransactionDidComplete_, v5);

}

- (void)_performSynchronizedCommitIfReady
{
  id v3;

  if (-[FBSynchronizedTransactionGroup isReadyForSynchronizedCommit](self, "isReadyForSynchronizedCommit"))
  {
    self->_didCommit = 1;
    if (-[FBSynchronizedTransactionGroup isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[FBSynchronizedTransactionGroup _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Committing now!"));
    -[NSMutableSet allObjects](self->_synchronizedTransactionsReadyToCommit, "allObjects");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeAllObjects](self->_synchronizedTransactionsReadyToCommit, "removeAllObjects");
    -[FBSynchronizedTransactionGroup _performSynchronizedCommit:](self, "_performSynchronizedCommit:", v3);
    -[FBSynchronizedTransactionGroup satisfyMilestone:](self, "satisfyMilestone:", CFSTR("synchronizedCommit"));

  }
}

- (BOOL)isReadyForSynchronizedCommit
{
  return self->_commitAllowed && !self->_didCommit && self->_readyForCommit;
}

- (void)performSynchronizedCommit
{
  void *v3;

  self->_commitAllowed = 1;
  -[FBSynchronizedTransactionGroup synchronizationDelegate](self, "synchronizationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && -[FBSynchronizedTransactionGroup isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
    -[FBSynchronizedTransactionGroup _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Delegate says we're good to commit."));
  -[FBSynchronizedTransactionGroup _performSynchronizedCommitIfReady](self, "_performSynchronizedCommitIfReady");
}

- (void)_checkPreconditionsAndCommitIfReady
{
  void *v3;
  id v4;

  if (self->_readyForCommit || -[NSMutableSet count](self->_synchronizedTransactionsAwaitingCommitReadiness, "count"))
  {
    -[FBSynchronizedTransactionGroup _performSynchronizedCommitIfReady](self, "_performSynchronizedCommitIfReady");
  }
  else
  {
    self->_readyForCommit = 1;
    if (-[FBSynchronizedTransactionGroup isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[FBSynchronizedTransactionGroup _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Commit preconditions satisfied."));
    -[FBSynchronizedTransactionGroup addMilestone:](self, "addMilestone:", CFSTR("synchronizedCommit"));
    -[FBSynchronizedTransactionGroup synchronizationDelegate](self, "synchronizationDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 && !self->_commitAllowed)
    {
      if (-[FBSynchronizedTransactionGroup isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0D22FA0], "descriptionForObject:", v4);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSynchronizedTransactionGroup _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Using synchronization delegate: %@"), v3);

      }
      objc_msgSend(v4, "synchronizedTransactionReadyToCommit:", self);
    }
    else
    {
      self->_commitAllowed = 1;
      -[FBSynchronizedTransactionGroup _performSynchronizedCommitIfReady](self, "_performSynchronizedCommitIfReady");
    }

  }
}

- (void)_performSynchronizedCommit:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FBSynchronizedTransactionGroup synchronizationDelegate](self, "synchronizationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronizedTransaction:willCommitSynchronizedTransactions:", self, v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "performSynchronizedCommit", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "synchronizedTransaction:didCommitSynchronizedTransactions:", self, v6);
}

- (FBSynchronizedTransactionDelegate)synchronizationDelegate
{
  return (FBSynchronizedTransactionDelegate *)objc_loadWeakRetained((id *)&self->_synchronizationDelegate);
}

- (void)_didComplete
{
  objc_super v3;

  -[FBSynchronizedTransactionGroup setSynchronizationDelegate:](self, "setSynchronizationDelegate:", 0);
  -[NSMutableSet enumerateObjectsUsingBlock:](self->_synchronizedTransactions, "enumerateObjectsUsingBlock:", &__block_literal_global_27);
  v3.receiver = self;
  v3.super_class = (Class)FBSynchronizedTransactionGroup;
  -[FBSynchronizedTransactionGroup _didComplete](&v3, sel__didComplete);
}

- (void)setSynchronizationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_synchronizationDelegate, a3);
}

- (void)addSynchronizedTransaction:(id)a3
{
  NSMutableSet *synchronizedTransactions;
  id v5;

  if (a3)
  {
    synchronizedTransactions = self->_synchronizedTransactions;
    v5 = a3;
    -[NSMutableSet addObject:](synchronizedTransactions, "addObject:", v5);
    -[NSMutableSet addObject:](self->_synchronizedTransactionsAwaitingCommitReadiness, "addObject:", v5);
    objc_msgSend(v5, "setSynchronizationDelegate:", self);
    -[FBSynchronizedTransactionGroup addChildTransaction:](self, "addChildTransaction:", v5);

  }
}

- (FBSynchronizedTransactionGroup)init
{
  FBSynchronizedTransactionGroup *v2;
  NSMutableSet *v3;
  NSMutableSet *synchronizedTransactions;
  NSMutableSet *v5;
  NSMutableSet *synchronizedTransactionsAwaitingCommitReadiness;
  NSMutableSet *v7;
  NSMutableSet *synchronizedTransactionsReadyToCommit;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FBSynchronizedTransactionGroup;
  v2 = -[FBTransaction init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    synchronizedTransactions = v2->_synchronizedTransactions;
    v2->_synchronizedTransactions = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    synchronizedTransactionsAwaitingCommitReadiness = v2->_synchronizedTransactionsAwaitingCommitReadiness;
    v2->_synchronizedTransactionsAwaitingCommitReadiness = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    synchronizedTransactionsReadyToCommit = v2->_synchronizedTransactionsReadyToCommit;
    v2->_synchronizedTransactionsReadyToCommit = v7;

  }
  return v2;
}

- (id)synchronizedTransactions
{
  return (id)-[NSMutableSet allObjects](self->_synchronizedTransactions, "allObjects");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_synchronizationDelegate);
  objc_storeStrong((id *)&self->_synchronizedTransactionsReadyToCommit, 0);
  objc_storeStrong((id *)&self->_synchronizedTransactionsAwaitingCommitReadiness, 0);
  objc_storeStrong((id *)&self->_synchronizedTransactions, 0);
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_synchronizedTransactions, "containsObject:", v4))
  {
    -[FBSynchronizedTransactionGroup synchronizationDelegate](self, "synchronizationDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v5, "synchronizedTransactionGroup:shouldFailForSynchronizedTransaction:", self, v4);
    else
      v6 = 1;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

@end
