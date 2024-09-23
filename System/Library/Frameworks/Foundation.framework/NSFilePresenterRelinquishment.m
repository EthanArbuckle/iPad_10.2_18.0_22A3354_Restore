@implementation NSFilePresenterRelinquishment

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFilePresenterRelinquishment;
  -[NSFilePresenterRelinquishment dealloc](&v3, sel_dealloc);
}

- (void)performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock:(id)a3 withReply:(id)a4
{
  os_unfair_lock_s *p_lock;
  unint64_t v9;
  _BOOL4 prerelinquishInProgress;
  NSObject *v11;
  _BOOL4 v12;
  BOOL v13;
  _QWORD v14[6];
  _QWORD v15[5];
  uint8_t buf[8];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = -[NSCountedSet count](self->_blockingAccessClaimIDs, "count");
  prerelinquishInProgress = self->_prerelinquishInProgress;
  v11 = _NSFCPresenterLog();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (prerelinquishInProgress)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEBUG, "Prerelinquishment already in progress. Adding a new prelinquishment reply", buf, 2u);
      if (!v9)
        goto LABEL_4;
    }
    else if (!v9)
    {
LABEL_4:
      -[NSFilePresenterRelinquishment _locked_addPrerelinquishReply:](self, "_locked_addPrerelinquishReply:", a4);
      os_unfair_lock_unlock(p_lock);
      return;
    }
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFilePresenterRelinquishment.m"), 39, CFSTR("Somehow relinquishment and prerelinquishment are happening concurrently?"));
    goto LABEL_4;
  }
  if (v9)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEBUG, "Prelinquishment requested, but already asked to relinquish. Adding a new relinquishment reply", buf, 2u);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __101__NSFilePresenterRelinquishment_performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock_withReply___block_invoke;
    v15[3] = &unk_1E0F4E870;
    v15[4] = a4;
    v13 = -[NSFilePresenterRelinquishment _locked_addRelinquishReply:](self, "_locked_addRelinquishReply:", v15);
    os_unfair_lock_unlock(p_lock);
    if (!v13)
      (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEBUG, "Starting prelinquishment for remote deletion request", buf, 2u);
    }
    if (self->_blockingPrerelinquishReplies)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFilePresenterRelinquishment.m"), 56, CFSTR("A presenter previously finished prerelinquishment without clearing its prerelinquishment replies"));
    self->_prerelinquishInProgress = 1;
    self->_blockingPrerelinquishReplies = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    os_unfair_lock_unlock(p_lock);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __101__NSFilePresenterRelinquishment_performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock_withReply___block_invoke_7;
    v14[3] = &unk_1E0F54140;
    v14[4] = self;
    v14[5] = a4;
    (*((void (**)(id, _QWORD *))a3 + 2))(a3, v14);
  }
}

uint64_t __101__NSFilePresenterRelinquishment_performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __101__NSFilePresenterRelinquishment_performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock_withReply___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    }
    while (v4);
  }

}

- (void)performRelinquishmentToAccessClaimIfNecessary:(id)a3 usingBlock:(id)a4 withReply:(id)a5
{
  os_unfair_lock_s *p_lock;
  NSObject *v11;
  unint64_t v12;
  NSCountedSet *blockingAccessClaimIDs;
  NSObject *v14;
  _BOOL4 v15;
  BOOL v16;
  BOOL v17;
  _QWORD v18[5];
  _QWORD v19[8];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_prerelinquishInProgress)
  {
    v11 = _NSFCPresenterLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v21 = a3;
      _os_log_debug_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEBUG, "Deferring relinquishment to %{public}@ because of pre-relinquishment in progress", buf, 0xCu);
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __100__NSFilePresenterRelinquishment_performRelinquishmentToAccessClaimIfNecessary_usingBlock_withReply___block_invoke;
    v19[3] = &unk_1E0F54FB8;
    v19[4] = self;
    v19[5] = a3;
    v19[6] = a4;
    v19[7] = a5;
    -[NSFilePresenterRelinquishment _locked_addPrerelinquishReply:](self, "_locked_addPrerelinquishReply:", v19);
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v12 = -[NSCountedSet count](self->_blockingAccessClaimIDs, "count");
    blockingAccessClaimIDs = self->_blockingAccessClaimIDs;
    if (!blockingAccessClaimIDs)
    {
      blockingAccessClaimIDs = objc_alloc_init(NSCountedSet);
      self->_blockingAccessClaimIDs = blockingAccessClaimIDs;
    }
    -[NSCountedSet addObject:](blockingAccessClaimIDs, "addObject:", a3);
    v14 = _NSFCPresenterLog();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        v21 = a3;
        _os_log_debug_impl(&dword_1817D9000, v14, OS_LOG_TYPE_DEBUG, "Not explicitly asking presenter to relinquish to claim %{public}@ because it has already relinquished", buf, 0xCu);
      }
      v16 = -[NSFilePresenterRelinquishment _locked_addRelinquishReply:](self, "_locked_addRelinquishReply:", a5);
      os_unfair_lock_unlock(p_lock);
      if (!v16)
        (*((void (**)(id))a5 + 2))(a5);
    }
    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        v21 = a3;
        _os_log_debug_impl(&dword_1817D9000, v14, OS_LOG_TYPE_DEBUG, "Starting relinquishment to claim %{public}@", buf, 0xCu);
      }
      if (self->_relinquishReplies)
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFilePresenterRelinquishment.m"), 107, CFSTR("A presenter previously relinquished without clearing its relinquishment replies"));
      self->_relinquishReplies = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = -[NSFilePresenterRelinquishment _locked_addRelinquishReply:](self, "_locked_addRelinquishReply:", a5);
      os_unfair_lock_unlock(p_lock);
      if (!v17)
        (*((void (**)(id))a5 + 2))(a5);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __100__NSFilePresenterRelinquishment_performRelinquishmentToAccessClaimIfNecessary_usingBlock_withReply___block_invoke_12;
      v18[3] = &unk_1E0F4D2D8;
      v18[4] = self;
      (*((void (**)(id, _QWORD *))a4 + 2))(a4, v18);
    }
  }
}

uint64_t __100__NSFilePresenterRelinquishment_performRelinquishmentToAccessClaimIfNecessary_usingBlock_withReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performRelinquishmentToAccessClaimIfNecessary:usingBlock:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __100__NSFilePresenterRelinquishment_performRelinquishmentToAccessClaimIfNecessary_usingBlock_withReply___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didRelinquish");
}

- (void)setReacquirer:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  uint8_t v7[8];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSCountedSet count](self->_blockingAccessClaimIDs, "count"))
  {
    self->_reacquirer = (id)objc_msgSend(a3, "copy");
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1817D9000, v6, OS_LOG_TYPE_DEBUG, "Reacquiring immediately, because there are no more claims", v7, 2u);
    }
    (*((void (**)(id, void *))a3 + 2))(a3, &__block_literal_global_80);
  }
}

- (void)removeBlockingAccessClaimID:(id)a3 thenContinue:(id)a4
{
  os_unfair_lock_s *p_lock;
  NSObject *v8;
  void (**reacquirer)(id, id);
  uint8_t v10[8];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSCountedSet removeObject:](self->_blockingAccessClaimIDs, "removeObject:", a3);
  if (-[NSCountedSet count](self->_blockingAccessClaimIDs, "count"))
    goto LABEL_2;
  v8 = _NSFCPresenterLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEBUG, "Invoking reacquirer, because no claims remain", v10, 2u);
  }
  reacquirer = (void (**)(id, id))self->_reacquirer;
  if (!reacquirer)
  {
LABEL_2:
    os_unfair_lock_unlock(p_lock);
    (*((void (**)(id))a4 + 2))(a4);
  }
  else
  {
    self->_reacquirer = 0;
    os_unfair_lock_unlock(p_lock);
    reacquirer[2](reacquirer, a4);

  }
}

- (void)removeBlockingAccessClaimID:(id)a3
{
  -[NSFilePresenterRelinquishment removeBlockingAccessClaimID:thenContinue:](self, "removeBlockingAccessClaimID:thenContinue:", a3, &__block_literal_global_13);
}

- (void)removeAllBlockingAccessClaimIDs
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void (**reacquirer)(id, void *);
  uint8_t v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  self->_blockingAccessClaimIDs = 0;
  if (self->_reacquirer)
  {
    v4 = _NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_debug_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEBUG, "Invoking reacquirer because all claims were removed", v6, 2u);
    }
    reacquirer = (void (**)(id, void *))self->_reacquirer;
    self->_reacquirer = 0;
    os_unfair_lock_unlock(p_lock);
    if (reacquirer)
    {
      reacquirer[2](reacquirer, &__block_literal_global_14_0);

    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (BOOL)_locked_addRelinquishReply:(id)a3
{
  NSMutableArray *relinquishReplies;
  void *v6;

  os_unfair_lock_assert_owner(&self->_lock);
  relinquishReplies = self->_relinquishReplies;
  if (relinquishReplies)
  {
    v6 = (void *)objc_msgSend(a3, "copy");
    -[NSMutableArray addObject:](self->_relinquishReplies, "addObject:", v6);

  }
  return relinquishReplies != 0;
}

- (void)_locked_addPrerelinquishReply:(id)a3
{
  id v6;

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_blockingPrerelinquishReplies)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFilePresenterRelinquishment.m"), 226, CFSTR("addPrerelinquishReply called, but we're not in the middle of prerelinquishing"));
  v6 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_blockingPrerelinquishReplies, "addObject:", v6);

}

- (void)didRelinquish
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_relinquishReplies)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFilePresenterRelinquishment.m"), 234, CFSTR("didRelinquish called, but there are no replies"));
  os_unfair_lock_lock(&self->_lock);
  v3 = (void *)-[NSMutableArray copy](self->_relinquishReplies, "copy");

  self->_relinquishReplies = 0;
  os_unfair_lock_unlock(&self->_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i) + 16))();
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }

}

@end
