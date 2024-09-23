@implementation BNPenderQueue

- (BOOL)setSuspended:(BOOL)a3 forRequesterWithIdentifier:(id)a4 reason:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  BNPenderQueue *v13;
  NSMutableSet *suspendedPenders;
  NSMutableSet *v15;
  NSMutableSet *v16;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "length");
  LOBYTE(v11) = 0;
  if (v9 && v10)
  {
    -[BNPenderQueue _penderForRequesterWithIdentifier:creatingIfNecessary:](self, "_penderForRequesterWithIdentifier:creatingIfNecessary:", v8, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "setSuspended:forReason:", v6, v9);
    if (v11)
    {
      v13 = self;
      objc_sync_enter(v13);
      suspendedPenders = v13->_suspendedPenders;
      if (v6)
      {
        if (!suspendedPenders)
        {
          v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
          v16 = v13->_suspendedPenders;
          v13->_suspendedPenders = v15;

          suspendedPenders = v13->_suspendedPenders;
        }
        -[NSMutableSet addObject:](suspendedPenders, "addObject:", v12);
      }
      else
      {
        -[NSMutableSet removeObject:](suspendedPenders, "removeObject:", v12);
      }
      objc_sync_exit(v13);

    }
  }

  return v11;
}

- (void)enqueuePresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BNPenderQueue *v13;
  BNPenderQueueEntry *v14;
  NSMutableArray *penderQueue;
  NSMutableArray *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v8, "requesterIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNPenderQueue _penderForRequesterWithIdentifier:creatingIfNecessary:](self, "_penderForRequesterWithIdentifier:creatingIfNecessary:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = self;
      objc_sync_enter(v13);
      v14 = -[BNPenderQueueEntry initWithPender:]([BNPenderQueueEntry alloc], "initWithPender:", v12);
      penderQueue = v13->_penderQueue;
      if (!penderQueue)
      {
        v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v17 = v13->_penderQueue;
        v13->_penderQueue = v16;

        penderQueue = v13->_penderQueue;
      }
      -[NSMutableArray addObject:](penderQueue, "addObject:", v14);
      if (v10)
      {
        v18 = (void *)objc_msgSend(v10, "mutableCopy");
        -[BNPenderQueueEntry entryIdentifier](v14, "entryIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("BNPresentableQueueUserInfoUniquePendingIdentifierKey"));

      }
      else
      {
        v22 = CFSTR("BNPresentableQueueUserInfoUniquePendingIdentifierKey");
        -[BNPenderQueueEntry entryIdentifier](v14, "entryIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v12, "enqueuePresentable:withOptions:userInfo:", v8, a4, v18);

      objc_sync_exit(v13);
    }
    else
    {
      v20 = (void *)BNLogPending;
      if (os_log_type_enabled((os_log_t)BNLogPending, OS_LOG_TYPE_ERROR))
        -[BNPenderQueue enqueuePresentable:withOptions:userInfo:].cold.1((uint64_t)self, v20, v8);
      v18 = v10;
    }

  }
  else
  {
    v18 = v9;
  }

}

- (id)peekPresentable
{
  BNPenderQueue *v2;
  NSMutableArray *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2->_penderQueue;
  v4 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "pender", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isSuspended") & 1) == 0)
        {
          objc_msgSend(v7, "peekPresentable");
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v4 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (id)pullPresentablesWithIdentification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "requesterIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNPenderQueue _penderForRequesterWithIdentifier:creatingIfNecessary:](self, "_penderForRequesterWithIdentifier:creatingIfNecessary:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pullPresentablesWithIdentification:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isSuspended
{
  uint64_t v3;
  BNPenderQueue *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[BNSuspensionController isSuspended](self->_suspensionController, "isSuspended"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4->_penderQueue;
    v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "pender", (_QWORD)v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isSuspended");

          if ((v9 & 1) == 0)
          {
            LOBYTE(v3) = 0;
            goto LABEL_13;
          }
        }
        v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v3)
          continue;
        break;
      }
      LOBYTE(v3) = 1;
    }
LABEL_13:

    objc_sync_exit(v4);
  }
  return v3;
}

- (NSSet)activeSuspensionReasons
{
  id v4;
  void *v5;
  BNPenderQueue *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[BNPenderQueue isSuspended](self, "isSuspended"))
    goto LABEL_15;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (-[BNSuspensionController isSuspended](self->_suspensionController, "isSuspended"))
  {
    -[BNSuspensionController activeSuspensionReasons](self->_suspensionController, "activeSuspensionReasons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v5);

  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v6->_penderQueue;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "pender", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isSuspended") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("BNPenderQueue.m"), 126, CFSTR("We claim to be suspended, but the suspension controller isn't suspended, and a queued pender isn't either"));

          }
          objc_msgSend(v11, "activeSuspensionReasons");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }
  if (!v4)
LABEL_15:
    v4 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  return (NSSet *)v4;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  BNSuspensionController *v7;
  BNSuspensionController *suspensionController;
  BOOL v9;

  v4 = a3;
  v6 = a4;
  if (v6 && v4 && !self->_suspensionController)
  {
    v7 = objc_alloc_init(BNSuspensionController);
    suspensionController = self->_suspensionController;
    self->_suspensionController = v7;

    -[BNSuspensionController setIdentifier:](self->_suspensionController, "setIdentifier:", self->_penderIdentifier);
  }
  v9 = -[BNSuspensionController setSuspended:forReason:](self->_suspensionController, "setSuspended:forReason:", v4, v6);

  return v9;
}

- (void)presentableQueue:(id)a3 didDequeuePresentableWithPendingIdentifier:(id)a4
{
  id v7;
  id v8;
  BNPenderQueue *v9;
  NSMutableArray *penderQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BNPenderQueue *v16;
  uint64_t *v17;
  SEL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  penderQueue = v9->_penderQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__BNPenderQueue_presentableQueue_didDequeuePresentableWithPendingIdentifier___block_invoke;
  v13[3] = &unk_1E7044EC8;
  v11 = v8;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  v16 = v9;
  v17 = &v19;
  v18 = a2;
  -[NSMutableArray enumerateObjectsUsingBlock:](penderQueue, "enumerateObjectsUsingBlock:", v13);
  -[NSMutableArray removeObjectAtIndex:](v9->_penderQueue, "removeObjectAtIndex:", v20[3]);

  _Block_object_dispose(&v19, 8);
  objc_sync_exit(v9);

}

void __77__BNPenderQueue_presentableQueue_didDequeuePresentableWithPendingIdentifier___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "entryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", a1[4]);

  v9 = v18;
  if (v8)
  {
    objc_msgSend(v18, "pender");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)a1[5];

    if (v10 != v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = a1[8];
      v15 = a1[5];
      v14 = a1[6];
      v16 = a1[4];
      objc_msgSend(v18, "pender");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("BNPenderQueue.m"), 152, CFSTR("PendingID matches, but pender does not: pendingID: %@; expected pender: %@; found pender: %@"),
        v16,
        v15,
        v17);

    }
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
    *a4 = 1;
    v9 = v18;
  }

}

- (id)_penderForRequesterWithIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BNPenderQueue *v7;
  NSMutableArray *penderQueue;
  uint64_t v9;
  id v10;
  void *v11;
  BNPresentableQueue *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = self;
    objc_sync_enter(v7);
    penderQueue = v7->_penderQueue;
    v9 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __71__BNPenderQueue__penderForRequesterWithIdentifier_creatingIfNecessary___block_invoke;
    v22[3] = &unk_1E7044EF0;
    v10 = v6;
    v23 = v10;
    -[NSMutableArray bs_firstObjectPassingTest:](penderQueue, "bs_firstObjectPassingTest:", v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pender");
    v12 = (BNPresentableQueue *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[NSMutableSet allObjects](v7->_suspendedPenders, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v9;
      v18 = 3221225472;
      v19 = __71__BNPenderQueue__penderForRequesterWithIdentifier_creatingIfNecessary___block_invoke_2;
      v20 = &unk_1E7044F18;
      v14 = v10;
      v21 = v14;
      objc_msgSend(v13, "bs_firstObjectPassingTest:", &v17);
      v12 = (BNPresentableQueue *)objc_claimAutoreleasedReturnValue();

      if (!v12 && v4)
      {
        v12 = objc_alloc_init(BNPresentableQueue);
        -[BNPresentableQueue setPenderIdentifier:](v12, "setPenderIdentifier:", v14, v17, v18, v19, v20);
        -[BNPresentableQueue setDelegate:](v12, "setDelegate:", v7);
      }
    }

    objc_sync_exit(v7);
  }
  else
  {
    v15 = BNLogPending;
    if (os_log_type_enabled((os_log_t)BNLogPending, OS_LOG_TYPE_ERROR))
      -[BNPenderQueue _penderForRequesterWithIdentifier:creatingIfNecessary:].cold.1((uint64_t)self, v15);
    v12 = 0;
  }

  return v12;
}

uint64_t __71__BNPenderQueue__penderForRequesterWithIdentifier_creatingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "pender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "penderIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __71__BNPenderQueue__penderForRequesterWithIdentifier_creatingIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "penderIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSString)penderIdentifier
{
  return self->_penderIdentifier;
}

- (void)setPenderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_penderIdentifier, 0);
  objc_storeStrong((id *)&self->_suspensionController, 0);
  objc_storeStrong((id *)&self->_suspendedPenders, 0);
  objc_storeStrong((id *)&self->_penderQueue, 0);
}

- (void)enqueuePresentable:(uint64_t)a1 withOptions:(void *)a2 userInfo:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  BNEffectivePresentableDescription(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1B9628000, v5, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to obtain pender for presentable: %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)_penderForRequesterWithIdentifier:(uint64_t)a1 creatingIfNecessary:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B9628000, a2, OS_LOG_TYPE_ERROR, "(%{public}@) Pender request missing requesterID", (uint8_t *)&v3, 0xCu);
}

@end
