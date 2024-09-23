@implementation NAFuture

- (id)recover:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NAFuture *v8;
  uint64_t v9;
  id v10;
  id v11;
  NAFuture *v12;
  NAFuture *v13;
  _QWORD *v14;
  id v15;
  NSError *v16;
  NAScheduler *v17;
  NSMutableArray *completionBlocks;
  NSMutableArray *v19;
  NSMutableArray *v20;
  void *v21;
  NAFuture *v22;
  NAFuture *v23;
  NAFuture *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  NAFuture *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  NSError *v33;
  _QWORD *v34;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = (void *)MEMORY[0x1B5E0F7A8](v4);
  objc_msgSend(v5, "_descriptorForChainOperation:onFuture:withBlock:", CFSTR("recover"), self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(NAFuture);
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __20__NAFuture_recover___block_invoke;
  v27[3] = &unk_1E6227FD0;
  v10 = v7;
  v28 = v10;
  v11 = v4;
  v30 = v11;
  v12 = v8;
  v29 = v12;
  v13 = self;
  v14 = v27;
  if (v13)
  {
    -[NAFuture willAddCompletionBlock](v13, "willAddCompletionBlock");
    os_unfair_lock_lock(&v13->_lock);
    v15 = v13->_resultValue;
    v16 = v13->_resultError;
    v17 = v13->_completionScheduler;
    if (v13->_finished)
    {
      os_unfair_lock_unlock(&v13->_lock);
      v31[0] = v9;
      v31[1] = 3221225472;
      v31[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v31[3] = &unk_1E6228178;
      v34 = v14;
      v32 = v15;
      v33 = v16;
      -[NAScheduler performBlock:](v17, "performBlock:", v31);

    }
    else
    {
      v26 = v15;
      completionBlocks = v13->_completionBlocks;
      if (!completionBlocks)
      {
        v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v20 = v13->_completionBlocks;
        v13->_completionBlocks = v19;

        completionBlocks = v13->_completionBlocks;
      }
      v21 = (void *)objc_msgSend(v14, "copy");
      -[NSMutableArray addObject:](completionBlocks, "addObject:", v21);

      os_unfair_lock_unlock(&v13->_lock);
      v15 = v26;
    }
    v22 = v13;

  }
  v23 = v29;
  v24 = v12;

  return v24;
}

void __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_3;
  v6[3] = &unk_1E6228100;
  v14 = *(_BYTE *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 56);
  v12 = a3;
  v7 = *(id *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 80);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v5 = (id)objc_msgSend(a2, "addCompletionBlock:", v6);

}

- (id)addCompletionBlock:(id)a3
{
  id v4;
  NAFuture *v5;
  id v6;
  id v7;
  NSError *v8;
  NAScheduler *v9;
  NSMutableArray *completionBlocks;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  NAFuture *v14;
  _QWORD v16[4];
  id v17;
  NSError *v18;
  id v19;

  v4 = a3;
  v5 = self;
  v6 = v4;
  if (v5)
  {
    -[NAFuture willAddCompletionBlock](v5, "willAddCompletionBlock");
    os_unfair_lock_lock(&v5->_lock);
    v7 = v5->_resultValue;
    v8 = v5->_resultError;
    v9 = v5->_completionScheduler;
    if (v5->_finished)
    {
      os_unfair_lock_unlock(&v5->_lock);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v16[3] = &unk_1E6228178;
      v19 = v6;
      v17 = v7;
      v18 = v8;
      -[NAScheduler performBlock:](v9, "performBlock:", v16);

    }
    else
    {
      completionBlocks = v5->_completionBlocks;
      if (!completionBlocks)
      {
        v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v12 = v5->_completionBlocks;
        v5->_completionBlocks = v11;

        completionBlocks = v5->_completionBlocks;
      }
      v13 = (void *)objc_msgSend(v6, "copy");
      -[NSMutableArray addObject:](completionBlocks, "addObject:", v13);

      os_unfair_lock_unlock(&v5->_lock);
    }
    v14 = v5;

  }
  return v5;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NAFuture *v9;
  id v10;
  id v11;
  void *v12;
  id *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  BOOL v26;
  id *v28;
  BOOL v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = v7;
  v11 = v8;
  v12 = v11;
  if (v9)
  {
    v30 = v11;
    v31 = v10;
    os_unfair_lock_lock(&v9->_lock);
    v29 = !v9->_finished;
    if (!v9->_finished)
    {
      objc_storeStrong(&v9->_resultValue, a3);
      objc_storeStrong((id *)&v9->_resultError, a4);
      v9->_finished = 1;
    }
    os_unfair_lock_unlock(&v9->_lock);
    v13 = v9;
    os_unfair_lock_lock(&v9->_lock);
    v14 = v13[4];
    v15 = v13[5];
    v16 = v13[2];
    v17 = (void *)objc_msgSend(v13[3], "copy");
    v18 = v13[3];
    v28 = v13;
    v13[3] = 0;

    os_unfair_lock_unlock(&v9->_lock);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      v23 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          v32[0] = v23;
          v32[1] = 3221225472;
          v32[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v32[3] = &unk_1E6228178;
          v35 = v25;
          v33 = v14;
          v34 = v15;
          objc_msgSend(v16, "performBlock:", v32, v28);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v21);
    }

    v10 = v31;
    v12 = v30;
    v26 = v29;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong(&self->_resultValue, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_completionScheduler, 0);
}

- (id)flatMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NAFuture *v8;
  uint64_t v9;
  NAFuture *v10;
  id v11;
  id v12;
  NAFuture *v13;
  _QWORD *v14;
  id v15;
  NSError *v16;
  NAScheduler *v17;
  NSMutableArray *completionBlocks;
  NSMutableArray *v19;
  NSMutableArray *v20;
  void *v21;
  NAFuture *v22;
  void *v23;
  NAFuture *v24;
  id v26;
  _QWORD v27[4];
  NAFuture *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  NSError *v33;
  _QWORD *v34;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = (void *)MEMORY[0x1B5E0F7A8](v4);
  objc_msgSend(v5, "_descriptorForChainOperation:onFuture:withBlock:", CFSTR("flatMap"), self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(NAFuture);
  -[NAFuture setDescriptor:](v8, "setDescriptor:", v7);
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __20__NAFuture_flatMap___block_invoke;
  v27[3] = &unk_1E6227FA8;
  v10 = v8;
  v28 = v10;
  v11 = v7;
  v29 = v11;
  v12 = v4;
  v30 = v12;
  v13 = self;
  v14 = v27;
  if (v13)
  {
    -[NAFuture willAddCompletionBlock](v13, "willAddCompletionBlock");
    os_unfair_lock_lock(&v13->_lock);
    v15 = v13->_resultValue;
    v16 = v13->_resultError;
    v17 = v13->_completionScheduler;
    if (v13->_finished)
    {
      os_unfair_lock_unlock(&v13->_lock);
      v31[0] = v9;
      v31[1] = 3221225472;
      v31[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v31[3] = &unk_1E6228178;
      v34 = v14;
      v32 = v15;
      v33 = v16;
      -[NAScheduler performBlock:](v17, "performBlock:", v31);

    }
    else
    {
      v26 = v15;
      completionBlocks = v13->_completionBlocks;
      if (!completionBlocks)
      {
        v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v20 = v13->_completionBlocks;
        v13->_completionBlocks = v19;

        completionBlocks = v13->_completionBlocks;
      }
      v21 = (void *)objc_msgSend(v14, "copy");
      -[NSMutableArray addObject:](completionBlocks, "addObject:", v21);

      os_unfair_lock_unlock(&v13->_lock);
      v15 = v26;
    }
    v22 = v13;

  }
  v23 = v30;
  v24 = v10;

  return v24;
}

- (NAFuture)init
{
  NAFuture *v2;
  uint64_t v3;
  NAScheduler *completionScheduler;
  void *v5;
  uint64_t v6;
  NSString *descriptor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NAFuture;
  v2 = -[NAFuture init](&v9, sel_init);
  if (v2)
  {
    +[NAScheduler immediateScheduler](NAScheduler, "immediateScheduler");
    v3 = objc_claimAutoreleasedReturnValue();
    completionScheduler = v2->_completionScheduler;
    v2->_completionScheduler = (NAScheduler *)v3;

    _NAScopedDescriptor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    descriptor = v2->_descriptor;
    v2->_descriptor = (NSString *)v6;

    if (__enforceThreadSafety)
      v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)_descriptorForChainOperation:(id)a3 onFuture:(id)a4 withBlock:(id)a5
{
  return 0;
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

void __20__NAFuture_flatMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(id *)(a1 + 32);
    v8 = v6;
    v9 = v8;
    if (v7)
    {
      v37 = v8;
      v39 = v5;
      os_unfair_lock_lock((os_unfair_lock_t)v7 + 2);
      if (!*((_BYTE *)v7 + 12))
      {
        v10 = (void *)*((_QWORD *)v7 + 4);
        *((_QWORD *)v7 + 4) = 0;

        objc_storeStrong((id *)v7 + 5, a3);
        *((_BYTE *)v7 + 12) = 1;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
      v38 = v7;
      v11 = (id *)v7;
      os_unfair_lock_lock((os_unfair_lock_t)v7 + 2);
      v12 = v11[4];
      v13 = v11[5];
      v14 = v11[2];
      v15 = (void *)objc_msgSend(v11[3], "copy");
      v16 = v11[3];
      v36 = v11;
      v11[3] = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v45;
        v21 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v45 != v20)
              objc_enumerationMutation(v17);
            v23 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            v40[0] = v21;
            v40[1] = 3221225472;
            v40[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
            v40[3] = &unk_1E6228178;
            v43 = v23;
            v41 = v12;
            v42 = v13;
            objc_msgSend(v14, "performBlock:", v40);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v19);
      }

      v5 = v39;
      v9 = v37;
      v7 = v38;
    }
  }
  else
  {
    _NAPushScopedDescriptor(*(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v25 = (void *)MEMORY[0x1B5E0F7A8](*(_QWORD *)(a1 + 48));
      _NABlockDescriptor();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("-[NAFuture flatMap:] block %@ provided a nil future! This is not permitted and will result in undefined behavior."), v26);

    }
    _NAPopScopedDescriptor();
    objc_msgSend(*(id *)(a1 + 32), "completionHandlerAdapter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;
    v9 = v27;
    if (v24)
    {
      objc_msgSend(v7, "willAddCompletionBlock");
      os_unfair_lock_lock((os_unfair_lock_t)v7 + 2);
      v28 = *((id *)v7 + 4);
      v29 = *((id *)v7 + 5);
      v30 = *((id *)v7 + 2);
      if (*((_BYTE *)v7 + 12))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = ___NAFutureAddCompletionBlock_block_invoke;
        v48[3] = &unk_1E6228178;
        v51 = v9;
        v49 = v28;
        v50 = v29;
        objc_msgSend(v30, "performBlock:", v48);

      }
      else
      {
        v31 = (void *)*((_QWORD *)v7 + 3);
        if (!v31)
        {
          v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v33 = (void *)*((_QWORD *)v7 + 3);
          *((_QWORD *)v7 + 3) = v32;

          v31 = (void *)*((_QWORD *)v7 + 3);
        }
        v34 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v31, "addObject:", v34);

        os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
      }
      v35 = v7;

    }
  }

}

- (id)completionHandlerAdapter
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__NAFuture_completionHandlerAdapter__block_invoke;
  v3[3] = &unk_1E6227F30;
  v3[4] = self;
  return (id)MEMORY[0x1B5E0F7A8](v3, a2);
}

void __36__NAFuture_completionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  id *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  v11 = v10;
  if (v8)
  {
    v26 = v10;
    v27 = v9;
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
    if (!*((_BYTE *)v8 + 12))
    {
      objc_storeStrong((id *)v8 + 4, a2);
      objc_storeStrong((id *)v8 + 5, a3);
      *((_BYTE *)v8 + 12) = 1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
    v12 = (id *)v8;
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
    v13 = v12[4];
    v14 = v12[5];
    v15 = v12[2];
    v16 = (void *)objc_msgSend(v12[3], "copy");
    v17 = v12[3];
    v25 = v12;
    v12[3] = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      v22 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v28[0] = v22;
          v28[1] = 3221225472;
          v28[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v28[3] = &unk_1E6228178;
          v31 = v24;
          v29 = v13;
          v30 = v14;
          objc_msgSend(v15, "performBlock:", v28);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v20);
    }

    v9 = v27;
    v11 = v26;
  }

}

void __20__NAFuture_recover___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id *v36;
  id v37;
  id *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _NAPushScopedDescriptor(*(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = (void *)MEMORY[0x1B5E0F7A8](*(_QWORD *)(a1 + 48));
      _NABlockDescriptor();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("-[NAFuture recover:] block %@ provided a nil future! This is not permitted and will result in undefined behavior."), v10);

    }
    _NAPopScopedDescriptor();
    objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    v13 = v11;
    if (v8)
    {
      objc_msgSend(v12, "willAddCompletionBlock");
      os_unfair_lock_lock((os_unfair_lock_t)v12 + 2);
      v14 = v12[4];
      v15 = v12[5];
      v16 = v12[2];
      if (*((_BYTE *)v12 + 12))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)v12 + 2);
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = ___NAFutureAddCompletionBlock_block_invoke;
        v48[3] = &unk_1E6228178;
        v51 = v13;
        v49 = v14;
        v50 = v15;
        objc_msgSend(v16, "performBlock:", v48);

      }
      else
      {
        v32 = v12[3];
        if (!v32)
        {
          v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v34 = v12[3];
          v12[3] = v33;

          v32 = v12[3];
        }
        v35 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v32, "addObject:", v35);

        os_unfair_lock_unlock((os_unfair_lock_t)v12 + 2);
      }
      v36 = v12;

    }
  }
  else
  {
    v12 = (id *)*(id *)(a1 + 40);
    v17 = v6;
    v13 = v17;
    if (v12)
    {
      v37 = v17;
      v39 = v6;
      os_unfair_lock_lock((os_unfair_lock_t)v12 + 2);
      if (!*((_BYTE *)v12 + 12))
      {
        objc_storeStrong(v12 + 4, a2);
        v18 = v12[5];
        v12[5] = 0;

        *((_BYTE *)v12 + 12) = 1;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v12 + 2);
      v19 = v12;
      os_unfair_lock_lock((os_unfair_lock_t)v12 + 2);
      v20 = v19[4];
      v21 = v19[5];
      v22 = v19[2];
      v23 = (void *)objc_msgSend(v19[3], "copy");
      v24 = v19[3];
      v38 = v19;
      v19[3] = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)v12 + 2);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v25 = v23;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v45;
        v29 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v45 != v28)
              objc_enumerationMutation(v25);
            v31 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            v40[0] = v29;
            v40[1] = 3221225472;
            v40[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
            v40[3] = &unk_1E6228178;
            v43 = v31;
            v41 = v20;
            v42 = v21;
            objc_msgSend(v22, "performBlock:", v40);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v27);
      }

      v12 = v38;
      v6 = v39;
      v13 = v37;
    }
  }

}

void __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if (!v7)
  {
    if (*(_BYTE *)(a1 + 96))
      v8 = v6;
    else
      v8 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 8 * *(_QWORD *)(a1 + 80)), v8);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v9 = --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  v12 = v11;
  if (*(_BYTE *)(v10 + 24))
    v13 = 1;
  else
    v13 = v12 == 0;
  if (v13)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    if (!v9)
      goto LABEL_20;
  }
  else
  {
    *(_BYTE *)(v10 + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    if (!v8)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_5;
      v21[3] = &unk_1E6227C70;
      v20 = *(void **)(a1 + 40);
      v22 = *(id *)(a1 + 32);
      v23 = v6;
      objc_msgSend(v20, "performBlock:", v21);

      if (v9)
        goto LABEL_21;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 88));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_4;
    v24[3] = &unk_1E6227C70;
    v18 = *(void **)(a1 + 40);
    v25 = *(id *)(a1 + 32);
    v26 = v17;
    v19 = v17;
    objc_msgSend(v18, "performBlock:", v24);

    if (!v9)
LABEL_20:
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, v15, v16);
  }
LABEL_21:

}

- (BOOL)finishWithResult:(id)a3
{
  id v5;
  NAFuture *v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  NSError *resultError;
  id *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  BOOL v24;
  BOOL v26;
  id v27;
  NAFuture *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    v27 = v7;
    p_lock = &v6->_lock;
    os_unfair_lock_lock(&v6->_lock);
    v26 = !v6->_finished;
    if (!v6->_finished)
    {
      objc_storeStrong(&v6->_resultValue, a3);
      resultError = v6->_resultError;
      v6->_resultError = 0;

      v6->_finished = 1;
    }
    os_unfair_lock_unlock(&v6->_lock);
    v28 = v6;
    v11 = v6;
    os_unfair_lock_lock(p_lock);
    v12 = v11[4];
    v13 = v11[5];
    v14 = v11[2];
    v15 = (void *)objc_msgSend(v11[3], "copy");
    v16 = v11[3];
    v11[3] = 0;

    os_unfair_lock_unlock(p_lock);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      v21 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29[0] = v21;
          v29[1] = 3221225472;
          v29[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v29[3] = &unk_1E6228178;
          v32 = v23;
          v30 = v12;
          v31 = v13;
          objc_msgSend(v14, "performBlock:", v29);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }

    v8 = v27;
    v6 = v28;
    v24 = v26;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

uint64_t __28__NAFuture_addFailureBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

void __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = 0;
    do
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v4 = *(void **)(v3 + 8 * v2);
      *(_QWORD *)(v3 + 8 * v2) = 0;

      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 40));
  }
  free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (id)addSuccessBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NAFuture *v7;
  uint64_t *v8;
  id v9;
  NSError *v10;
  NAScheduler *v11;
  NSMutableArray *completionBlocks;
  NSMutableArray *v13;
  NSMutableArray *v14;
  void *v15;
  NAFuture *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  NSError *v25;
  uint64_t *v26;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __28__NAFuture_addSuccessBlock___block_invoke;
  v21 = &unk_1E6227F80;
  v6 = v4;
  v22 = v6;
  v7 = self;
  v8 = &v18;
  if (v7)
  {
    -[NAFuture willAddCompletionBlock](v7, "willAddCompletionBlock", v18, v19, v20, v21, v22);
    os_unfair_lock_lock(&v7->_lock);
    v9 = v7->_resultValue;
    v10 = v7->_resultError;
    v11 = v7->_completionScheduler;
    if (v7->_finished)
    {
      os_unfair_lock_unlock(&v7->_lock);
      v23[0] = v5;
      v23[1] = 3221225472;
      v23[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v23[3] = &unk_1E6228178;
      v26 = v8;
      v24 = v9;
      v25 = v10;
      -[NAScheduler performBlock:](v11, "performBlock:", v23);

    }
    else
    {
      completionBlocks = v7->_completionBlocks;
      if (!completionBlocks)
      {
        v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v14 = v7->_completionBlocks;
        v7->_completionBlocks = v13;

        completionBlocks = v7->_completionBlocks;
      }
      v15 = (void *)objc_msgSend(v8, "copy");
      -[NSMutableArray addObject:](completionBlocks, "addObject:", v15);

      os_unfair_lock_unlock(&v7->_lock);
    }
    v16 = v7;

  }
  return v7;
}

uint64_t __28__NAFuture_addSuccessBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

id __46__NAFuture_NAConveniences__futureWithNoResult__block_invoke()
{
  if (_block_invoke_na_once_token_1 != -1)
    dispatch_once(&_block_invoke_na_once_token_1, &__block_literal_global_147);
  return (id)_block_invoke_na_once_object_1;
}

uint64_t __54__NAFuture_NAConveniences__futureWithBlock_scheduler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __23__NAFuture_reschedule___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  id *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  v11 = v10;
  if (v8)
  {
    v26 = v10;
    v27 = v9;
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
    if (!*((_BYTE *)v8 + 12))
    {
      objc_storeStrong((id *)v8 + 4, a2);
      objc_storeStrong((id *)v8 + 5, a3);
      *((_BYTE *)v8 + 12) = 1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
    v12 = (id *)v8;
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
    v13 = v12[4];
    v14 = v12[5];
    v15 = v12[2];
    v16 = (void *)objc_msgSend(v12[3], "copy");
    v17 = v12[3];
    v25 = v12;
    v12[3] = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      v22 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v28[0] = v22;
          v28[1] = 3221225472;
          v28[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v28[3] = &unk_1E6228178;
          v31 = v24;
          v29 = v13;
          v30 = v14;
          objc_msgSend(v15, "performBlock:", v28);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v20);
    }

    v9 = v27;
    v11 = v26;
  }

}

+ (id)futureWithError:(id)a3
{
  id v3;
  NAFuture *v4;

  v3 = a3;
  v4 = -[NAFuture initWithResult:error:]([NAFuture alloc], "initWithResult:error:", 0, v3);

  return v4;
}

+ (id)futureWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "futureWithBlock:scheduler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)combineAllFutures:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "combineAllFutures:scheduler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)combineAllFutures:(id)a3 ignoringErrors:(BOOL)a4 scheduler:(id)a5
{
  id v7;
  id v8;
  NAFuture *v9;
  size_t v10;
  uint64_t v11;
  void *v12;
  NAFuture *v13;
  id v14;
  void *v15;
  NAFuture *v16;
  _QWORD v18[4];
  NAFuture *v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  size_t v25;
  BOOL v26;
  _QWORD v27[6];
  _QWORD v28[3];
  void *v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[5];

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v9 = objc_alloc_init(NAFuture);
    v10 = objc_msgSend(v7, "count");
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = v10;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 0;
    v29 = malloc_type_calloc(8uLL, v10, 0x4B4246BAuLL);
    v11 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke;
    v27[3] = &unk_1E62280D8;
    v27[4] = v28;
    v27[5] = v10;
    v12 = (void *)MEMORY[0x1B5E0F7A8](v27);
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_2;
    v18[3] = &unk_1E6228128;
    v26 = a4;
    v22 = v28;
    v13 = v9;
    v19 = v13;
    v23 = v32;
    v24 = v30;
    v25 = v10;
    v20 = v8;
    v14 = v12;
    v21 = v14;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
    v15 = v21;
    v16 = v13;

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v16 = (NAFuture *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)futureWithResult:(id)a3
{
  id v3;
  NAFuture *v4;

  v3 = a3;
  v4 = -[NAFuture initWithResult:error:]([NAFuture alloc], "initWithResult:error:", v3, 0);

  return v4;
}

- (NAFuture)initWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NAFuture *v9;
  NAFuture *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[NAFuture init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_finished = 1;
    objc_storeStrong(&v9->_resultValue, a3);
    objc_storeStrong((id *)&v10->_resultError, a4);
  }

  return v10;
}

+ (id)combineAllFutures:(id)a3 scheduler:(id)a4
{
  return (id)objc_msgSend(a1, "combineAllFutures:ignoringErrors:scheduler:", a3, 0, a4);
}

+ (id)futureWithBlock:(id)a3 scheduler:(id)a4
{
  id v5;
  id v6;
  NAPromise *v7;
  NAPromise *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  NAPromise *v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(NAPromise);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __54__NAFuture_NAConveniences__futureWithBlock_scheduler___block_invoke;
  v15 = &unk_1E62280B0;
  v16 = v7;
  v17 = v5;
  v8 = v7;
  v9 = v5;
  objc_msgSend(v6, "performBlock:", &v12);

  -[NAPromise future](v8, "future", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isFinished
{
  NAFuture *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)addFailureBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NAFuture *v7;
  uint64_t *v8;
  id v9;
  NSError *v10;
  NAScheduler *v11;
  NSMutableArray *completionBlocks;
  NSMutableArray *v13;
  NSMutableArray *v14;
  void *v15;
  NAFuture *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  NSError *v25;
  uint64_t *v26;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __28__NAFuture_addFailureBlock___block_invoke;
  v21 = &unk_1E6227F80;
  v6 = v4;
  v22 = v6;
  v7 = self;
  v8 = &v18;
  if (v7)
  {
    -[NAFuture willAddCompletionBlock](v7, "willAddCompletionBlock", v18, v19, v20, v21, v22);
    os_unfair_lock_lock(&v7->_lock);
    v9 = v7->_resultValue;
    v10 = v7->_resultError;
    v11 = v7->_completionScheduler;
    if (v7->_finished)
    {
      os_unfair_lock_unlock(&v7->_lock);
      v23[0] = v5;
      v23[1] = 3221225472;
      v23[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v23[3] = &unk_1E6228178;
      v26 = v8;
      v24 = v9;
      v25 = v10;
      -[NAScheduler performBlock:](v11, "performBlock:", v23);

    }
    else
    {
      completionBlocks = v7->_completionBlocks;
      if (!completionBlocks)
      {
        v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v14 = v7->_completionBlocks;
        v7->_completionBlocks = v13;

        completionBlocks = v7->_completionBlocks;
      }
      v15 = (void *)objc_msgSend(v8, "copy");
      -[NSMutableArray addObject:](completionBlocks, "addObject:", v15);

      os_unfair_lock_unlock(&v7->_lock);
    }
    v16 = v7;

  }
  return v7;
}

+ (id)chainFutures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "reverseObjectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_chainFuturesWithFutureStack:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)_chainFuturesWithFutureStack:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 < 2)
  {
    v8 = v6;
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__NAFuture_NAConveniences___chainFuturesWithFutureStack___block_invoke;
    v10[3] = &unk_1E6228150;
    v11 = v4;
    v12 = a1;
    objc_msgSend(v7, "flatMap:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __46__NAFuture_NAConveniences__futureWithNoResult__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_na_once_object_1;
  _block_invoke_na_once_object_1 = v0;

}

void __45__NAFuture_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  char *v6;
  id v7;
  id v8;
  os_unfair_lock_s *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  char *v25;
  void *v26;
  id *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  id *v40;
  id *v41;
  id v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(_QWORD *);
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = v5;
    v7 = v4;
    v8 = v7;
    if (v6)
    {
      v42 = v7;
      v9 = (os_unfair_lock_s *)(v6 + 8);
      os_unfair_lock_lock((os_unfair_lock_t)v6 + 2);
      if (!v6[12])
      {
        v10 = (void *)*((_QWORD *)v6 + 4);
        *((_QWORD *)v6 + 4) = 0;

        objc_storeStrong((id *)v6 + 5, a2);
        v6[12] = 1;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
      v43 = v6;
      v11 = v6;
      os_unfair_lock_lock(v9);
      v12 = v11[4];
      v13 = v11[5];
      v14 = v11[2];
      v15 = (void *)objc_msgSend(v11[3], "copy");
      v16 = v11[3];
      v40 = v11;
      v11[3] = 0;

      os_unfair_lock_unlock(v9);
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v53;
        v21 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v53 != v20)
              objc_enumerationMutation(v17);
            v23 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
            v45 = v21;
            v46 = 3221225472;
            v47 = ___NAFutureFlushCompletionBlocks_block_invoke;
            v48 = &unk_1E6228178;
            v51 = v23;
            v49 = v12;
            v50 = v13;
            objc_msgSend(v14, "performBlock:", &v45);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v19);
      }

      v6 = v43;
      v8 = v42;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v25 = v24;
    v6 = v25;
    if (v8)
    {
      v44 = v25;
      os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
      if (!*((_BYTE *)v8 + 12))
      {
        objc_storeStrong((id *)v8 + 4, v24);
        v26 = (void *)*((_QWORD *)v8 + 5);
        *((_QWORD *)v8 + 5) = 0;

        *((_BYTE *)v8 + 12) = 1;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
      v27 = (id *)v8;
      os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
      v28 = v27[4];
      v29 = v27[5];
      v30 = v27[2];
      v31 = (void *)objc_msgSend(v27[3], "copy");
      v32 = v27[3];
      v41 = v27;
      v27[3] = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v33 = v31;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v53;
        v37 = MEMORY[0x1E0C809B0];
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v53 != v36)
              objc_enumerationMutation(v33);
            v39 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
            v45 = v37;
            v46 = 3221225472;
            v47 = ___NAFutureFlushCompletionBlocks_block_invoke;
            v48 = &unk_1E6228178;
            v51 = v39;
            v49 = v28;
            v50 = v29;
            objc_msgSend(v30, "performBlock:", &v45);

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v35);
      }

      v6 = v44;
    }

  }
}

- (BOOL)finishWithNoResult
{
  void *v3;
  NAFuture *v4;
  id v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  NSError *resultError;
  id *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  BOOL v22;
  BOOL v24;
  id v25;
  NAFuture *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  v5 = v3;
  v6 = v5;
  if (v4)
  {
    v25 = v5;
    p_lock = &v4->_lock;
    os_unfair_lock_lock(&v4->_lock);
    v24 = !v4->_finished;
    if (!v4->_finished)
    {
      objc_storeStrong(&v4->_resultValue, v3);
      resultError = v4->_resultError;
      v4->_resultError = 0;

      v4->_finished = 1;
    }
    os_unfair_lock_unlock(&v4->_lock);
    v26 = v4;
    v9 = v4;
    os_unfair_lock_lock(p_lock);
    v10 = v9[4];
    v11 = v9[5];
    v12 = v9[2];
    v13 = (void *)objc_msgSend(v9[3], "copy");
    v14 = v9[3];
    v9[3] = 0;

    os_unfair_lock_unlock(p_lock);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      v19 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v27[0] = v19;
          v27[1] = 3221225472;
          v27[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v27[3] = &unk_1E6228178;
          v30 = v21;
          v28 = v10;
          v29 = v11;
          objc_msgSend(v12, "performBlock:", v27);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v17);
    }

    v6 = v25;
    v4 = v26;
    v22 = v24;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)recoverIgnoringError
{
  return -[NAFuture recover:](self, "recover:", &__block_literal_global_3);
}

- (BOOL)cancel
{
  os_unfair_lock_s *p_lock;
  _BOOL4 finished;
  NSError *v5;
  NSError *resultError;
  NAFuture *v7;
  id v8;
  NSError *v9;
  NAScheduler *v10;
  void *v11;
  NSMutableArray *completionBlocks;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NAFuture *v21;
  _BOOL4 v22;
  _QWORD v23[4];
  id v24;
  NSError *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  finished = self->_finished;
  if (self->_finished)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v22 = self->_finished;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v5 = (NSError *)objc_claimAutoreleasedReturnValue();
    resultError = self->_resultError;
    self->_resultError = v5;

    self->_finished = 1;
    os_unfair_lock_unlock(p_lock);
    v7 = self;
    os_unfair_lock_lock(p_lock);
    v8 = v7->_resultValue;
    v9 = self->_resultError;
    v10 = v7->_completionScheduler;
    v11 = (void *)-[NSMutableArray copy](v7->_completionBlocks, "copy");
    completionBlocks = v7->_completionBlocks;
    v21 = v7;
    v7->_completionBlocks = 0;

    os_unfair_lock_unlock(p_lock);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      v17 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v23[0] = v17;
          v23[1] = 3221225472;
          v23[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v23[3] = &unk_1E6228178;
          v26 = v19;
          v24 = v8;
          v25 = v9;
          -[NAScheduler performBlock:](v10, "performBlock:", v23);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }

    -[NAFuture didCancel](v21, "didCancel");
    finished = v22;
  }
  return !finished;
}

- (id)reschedule:(id)a3
{
  id v5;
  NAFuture *v6;
  void *v7;
  uint64_t v8;
  NAFuture *v9;
  NAFuture *v10;
  uint64_t *v11;
  id v12;
  NSError *v13;
  NAScheduler *v14;
  NSMutableArray *completionBlocks;
  NSMutableArray *v16;
  NSMutableArray *v17;
  void *v18;
  NAFuture *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  NAFuture *v25;
  _QWORD v26[4];
  id v27;
  NSError *v28;
  uint64_t *v29;

  v5 = a3;
  v6 = objc_alloc_init(NAFuture);
  objc_storeStrong((id *)&v6->_completionScheduler, a3);
  +[NAFuture _descriptorForChainOperation:onFuture:withBlock:](NAFuture, "_descriptorForChainOperation:onFuture:withBlock:", CFSTR("reschedule"), self, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAFuture setDescriptor:](v6, "setDescriptor:", v7);

  v8 = MEMORY[0x1E0C809B0];
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __23__NAFuture_reschedule___block_invoke;
  v24 = &unk_1E6227F30;
  v9 = v6;
  v25 = v9;
  v10 = self;
  v11 = &v21;
  if (v10)
  {
    -[NAFuture willAddCompletionBlock](v10, "willAddCompletionBlock", v21, v22, v23, v24, v25);
    os_unfair_lock_lock(&v10->_lock);
    v12 = v10->_resultValue;
    v13 = v10->_resultError;
    v14 = v10->_completionScheduler;
    if (v10->_finished)
    {
      os_unfair_lock_unlock(&v10->_lock);
      v26[0] = v8;
      v26[1] = 3221225472;
      v26[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v26[3] = &unk_1E6228178;
      v29 = v11;
      v27 = v12;
      v28 = v13;
      -[NAScheduler performBlock:](v14, "performBlock:", v26);

    }
    else
    {
      completionBlocks = v10->_completionBlocks;
      if (!completionBlocks)
      {
        v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v17 = v10->_completionBlocks;
        v10->_completionBlocks = v16;

        completionBlocks = v10->_completionBlocks;
      }
      v18 = (void *)objc_msgSend(v11, "copy");
      -[NSMutableArray addObject:](completionBlocks, "addObject:", v18);

      os_unfair_lock_unlock(&v10->_lock);
    }
    v19 = v10;

  }
  return v9;
}

- (id)errorOnlyCompletionHandlerAdapter
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__NAFuture_errorOnlyCompletionHandlerAdapter__block_invoke;
  v3[3] = &unk_1E6227F58;
  v3[4] = self;
  return (id)MEMORY[0x1B5E0F7A8](v3, a2);
}

+ (void)_setShouldEnforceThreadSafety:(BOOL)a3
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  __enforceThreadSafety = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = __enforceThreadSafety;
    _os_log_impl(&dword_1B0CB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Updating NAFuture thread safety enabled: %d", (uint8_t *)v3, 8u);
  }
}

- (BOOL)isCancelled
{
  NAFuture *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NAFuture _queue_isCancelled](v2, "_queue_isCancelled");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_queue_isCancelled
{
  return self->_finished && -[NSError na_isCancelledError](self->_resultError, "na_isCancelledError");
}

- (BOOL)finishWithError:(id)a3
{
  id v5;
  NAFuture *v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  id resultValue;
  id *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  BOOL v24;
  BOOL v26;
  id v27;
  NAFuture *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    v27 = v7;
    p_lock = &v6->_lock;
    os_unfair_lock_lock(&v6->_lock);
    v26 = !v6->_finished;
    if (!v6->_finished)
    {
      resultValue = v6->_resultValue;
      v6->_resultValue = 0;

      objc_storeStrong((id *)&v6->_resultError, a3);
      v6->_finished = 1;
    }
    os_unfair_lock_unlock(&v6->_lock);
    v28 = v6;
    v11 = v6;
    os_unfair_lock_lock(p_lock);
    v12 = v11[4];
    v13 = v11[5];
    v14 = v11[2];
    v15 = (void *)objc_msgSend(v11[3], "copy");
    v16 = v11[3];
    v11[3] = 0;

    os_unfair_lock_unlock(p_lock);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      v21 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29[0] = v21;
          v29[1] = 3221225472;
          v29[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v29[3] = &unk_1E6228178;
          v32 = v23;
          v30 = v12;
          v31 = v13;
          objc_msgSend(v14, "performBlock:", v29);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }

    v8 = v27;
    v6 = v28;
    v24 = v26;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSError *v5;
  BOOL finished;
  BOOL v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSError *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  __CFString *(*v19)(uint64_t);
  void *v20;
  id v21;
  NSError *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  BOOL v26;
  BOOL v27;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_resultValue;
  v5 = self->_resultError;
  finished = self->_finished;
  v7 = -[NAFuture _queue_isCancelled](self, "_queue_isCancelled");
  os_unfair_lock_unlock(p_lock);
  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __23__NAFuture_description__block_invoke;
  v24[3] = &unk_1E6227FF8;
  v26 = v7;
  v27 = finished;
  v9 = v4;
  v25 = v9;
  __23__NAFuture_description__block_invoke((uint64_t)v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __23__NAFuture_description__block_invoke_2;
  v23[3] = &unk_1E6228020;
  v23[4] = self;
  __23__NAFuture_description__block_invoke_2((uint64_t)v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8;
  v18 = 3221225472;
  v19 = __23__NAFuture_description__block_invoke_3;
  v20 = &unk_1E6228048;
  v21 = v9;
  v22 = v5;
  v12 = v5;
  v13 = v9;
  __23__NAFuture_description__block_invoke_3((uint64_t)&v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p (%@)%@%@>"), objc_opt_class(), self, v10, v11, v14, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

__CFString *__23__NAFuture_description__block_invoke(uint64_t a1)
{
  __CFString *v2;

  if (*(_BYTE *)(a1 + 40))
    return CFSTR("canceled");
  if (!*(_BYTE *)(a1 + 41))
    return CFSTR("active");
  if (*(_QWORD *)(a1 + 32))
    v2 = CFSTR("succeeded");
  else
    v2 = CFSTR("failed");
  return v2;
}

__CFString *__23__NAFuture_description__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(*(id *)(a1 + 32), "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR(": \"%@\"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E6228C10;
  }
  return v5;
}

__CFString *__23__NAFuture_description__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", result = %@"), v1);
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (!v2)
      return &stru_1E6228C10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", error = %@"), v2);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)descriptor
{
  return self->_descriptor;
}

NAFuture *__48__NAFuture_NAConveniences__recoverIgnoringError__block_invoke()
{
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

+ (id)lazyFutureWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lazyFutureWithBlock:scheduler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)lazyFutureWithBlock:(id)a3 scheduler:(id)a4
{
  id v5;
  id v6;
  _NALazyFuture *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_NALazyFuture initWithBlock:scheduler:]([_NALazyFuture alloc], "initWithBlock:scheduler:", v6, v5);

  return v7;
}

void __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "finishWithError:", v2);

  }
}

uint64_t __57__NAFuture_NAConveniences___chainFuturesWithFutureStack___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
  return objc_msgSend(*(id *)(a1 + 40), "_chainFuturesWithFutureStack:", *(_QWORD *)(a1 + 32));
}

+ (id)futureWithCompletionHandlerAdapterBlock:(id)a3
{
  void (**v3)(id, void *);
  NAFuture *v4;
  void *v5;

  v3 = (void (**)(id, void *))a3;
  v4 = objc_alloc_init(NAFuture);
  -[NAFuture completionHandlerAdapter](v4, "completionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5);

  return v4;
}

+ (id)futureWithErrorOnlyHandlerAdapterBlock:(id)a3
{
  void (**v3)(id, void *);
  NAFuture *v4;
  void *v5;

  v3 = (void (**)(id, void *))a3;
  v4 = objc_alloc_init(NAFuture);
  -[NAFuture errorOnlyCompletionHandlerAdapter](v4, "errorOnlyCompletionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5);

  return v4;
}

@end
