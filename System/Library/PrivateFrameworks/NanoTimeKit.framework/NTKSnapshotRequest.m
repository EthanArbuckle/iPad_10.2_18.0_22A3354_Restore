@implementation NTKSnapshotRequest

- (NTKSnapshotRequest)init
{
  NTKSnapshotRequest *v2;
  NTKSnapshotRequest *v3;
  uint64_t v4;
  NSHashTable *lock_tokens;
  uint64_t v6;
  NTKSnapshotLoadState *lock_loadState;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKSnapshotRequest;
  v2 = -[NTKSnapshotRequest init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    lock_tokens = v3->_lock_tokens;
    v3->_lock_tokens = (NSHashTable *)v4;

    +[NTKSnapshotLoadState pending](NTKSnapshotLoadState, "pending");
    v6 = objc_claimAutoreleasedReturnValue();
    lock_loadState = v3->_lock_loadState;
    v3->_lock_loadState = (NTKSnapshotLoadState *)v6;

    v3->_lock_priority = 1;
  }
  return v3;
}

- (NTKSnapshotLoadState)loadState
{
  os_unfair_lock_s *p_lock;
  NTKSnapshotLoadState *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_loadState;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLoadState:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  _QWORD block[4];
  void (**v12)(_QWORD);
  _QWORD aBlock[4];
  id v14;
  id v15;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_loadState, a3);
  -[NSHashTable allObjects](self->_lock_tokens, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__NTKSnapshotRequest_setLoadState___block_invoke;
  aBlock[3] = &unk_1E6BCD778;
  v8 = v6;
  v14 = v8;
  v9 = v5;
  v15 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v10[2](v10);
  }
  else
  {
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __35__NTKSnapshotRequest_setLoadState___block_invoke_2;
    block[3] = &unk_1E6BCDF60;
    v12 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __35__NTKSnapshotRequest_setLoadState___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "callback", (_QWORD)v9);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
          (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

uint64_t __35__NTKSnapshotRequest_setLoadState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updatePriority
{
  os_unfair_lock_s *p_lock;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_lock_tokens, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__NTKSnapshotRequest_updatePriority__block_invoke;
  v5[3] = &unk_1E6BD2B58;
  v5[4] = &v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  self->_lock_priority = v7[3];
  os_unfair_lock_unlock(p_lock);
  _Block_object_dispose(&v6, 8);

}

unint64_t __36__NTKSnapshotRequest_updatePriority__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t result;
  uint64_t v7;

  result = objc_msgSend(a2, "priority");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result > *(_QWORD *)(v7 + 24))
    *(_QWORD *)(v7 + 24) = result;
  if (result == 3)
    *a4 = 1;
  return result;
}

- (unint64_t)priority
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_priority;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_priority = self->_lock_priority;
  os_unfair_lock_unlock(p_lock);
  return lock_priority;
}

- (void)observeChangesToLoadStateWithToken:(id)a3
{
  id v4;
  NTKSnapshotLoadState *v5;
  void (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  NTKSnapshotLoadState *v11;
  void (**v12)(_QWORD, _QWORD);

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_lock_tokens, "addObject:", v4);
  v5 = self->_lock_loadState;
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v4, "callback");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      ((void (**)(_QWORD, NTKSnapshotLoadState *))v6)[2](v6, v5);
    }
    else
    {
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __57__NTKSnapshotRequest_observeChangesToLoadStateWithToken___block_invoke;
      v10 = &unk_1E6BCE3C8;
      v12 = v6;
      v11 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], &v7);

    }
  }
  objc_msgSend(v4, "setRequest:", self, v7, v8, v9, v10);
  -[NTKSnapshotRequest updatePriority](self, "updatePriority");

}

uint64_t __57__NTKSnapshotRequest_observeChangesToLoadStateWithToken___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)observeChangesToLoadStateWithPriority:(unint64_t)a3 callback:(id)a4
{
  id v6;
  NTKSnapshotToken *v7;

  v6 = a4;
  v7 = -[NTKSnapshotToken initWithPriority:callback:]([NTKSnapshotToken alloc], "initWithPriority:callback:", a3, v6);

  -[NTKSnapshotRequest observeChangesToLoadStateWithToken:](self, "observeChangesToLoadStateWithToken:", v7);
  return v7;
}

- (void)stopObservingChanges:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_tokens, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
  -[NTKSnapshotRequest updatePriority](self, "updatePriority");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_loadState, 0);
  objc_storeStrong((id *)&self->_lock_tokens, 0);
}

@end
