@implementation ASCPendingPromises

- (ASCPendingPromises)init
{
  ASCPendingPromises *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *stateLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCPendingPromises;
  v2 = -[ASCPendingPromises init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    stateLock = v2->_stateLock;
    v2->_stateLock = v3;

  }
  return v2;
}

- (void)withLock:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[ASCPendingPromises stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  v6[2]();
  -[ASCPendingPromises stateLock](self, "stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (NSMutableArray)binaryPromises
{
  void *v3;
  void *v4;
  id v5;

  -[ASCPendingPromises binaryPromisesIfLoaded](self, "binaryPromisesIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[ASCPendingPromises setBinaryPromisesIfLoaded:](self, "setBinaryPromisesIfLoaded:", v5);
  }

  return (NSMutableArray *)v5;
}

- (NSMutableArray)promises
{
  void *v3;
  void *v4;
  id v5;

  -[ASCPendingPromises promisesIfLoaded](self, "promisesIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[ASCPendingPromises setPromisesIfLoaded:](self, "setPromisesIfLoaded:", v5);
  }

  return (NSMutableArray *)v5;
}

- (BOOL)containsBinaryPromise:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ASCPendingPromises_containsBinaryPromise___block_invoke;
  v7[3] = &unk_1E7561658;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[ASCPendingPromises withLock:](self, "withLock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __44__ASCPendingPromises_containsBinaryPromise___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "binaryPromisesIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(*(id *)(a1 + 32), "binaryPromisesIfLoaded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "indexOfObjectIdenticalTo:", *(_QWORD *)(a1 + 40)) != 0x7FFFFFFFFFFFFFFFLL;

    v2 = v4;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

- (void)addBinaryPromise:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__ASCPendingPromises_addBinaryPromise___block_invoke;
  v6[3] = &unk_1E75605A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ASCPendingPromises withLock:](self, "withLock:", v6);

}

void __39__ASCPendingPromises_addBinaryPromise___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id from;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "binaryPromises");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, *(id *)(a1 + 40));
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__ASCPendingPromises_addBinaryPromise___block_invoke_2;
  v4[3] = &unk_1E7561680;
  objc_copyWeak(&v5, &location);
  objc_copyWeak(&v6, &from);
  objc_msgSend(v3, "addFinishBlock:", v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __39__ASCPendingPromises_addBinaryPromise___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __39__ASCPendingPromises_addBinaryPromise___block_invoke_3;
    v4[3] = &unk_1E75605A0;
    v5 = WeakRetained;
    v6 = v2;
    objc_msgSend(v5, "withLock:", v4);

  }
}

void __39__ASCPendingPromises_addBinaryPromise___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "binaryPromises");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));

}

- (BOOL)hasPromises
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__ASCPendingPromises_hasPromises__block_invoke;
  v4[3] = &unk_1E75616A8;
  v4[4] = self;
  v4[5] = &v5;
  -[ASCPendingPromises withLock:](self, "withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__ASCPendingPromises_hasPromises__block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "binaryPromisesIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "binaryPromisesIfLoaded");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "count"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "promisesIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "promisesIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

  if (v5)
    goto LABEL_8;
LABEL_9:

}

- (BOOL)containsPromise:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__ASCPendingPromises_containsPromise___block_invoke;
  v7[3] = &unk_1E7561658;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[ASCPendingPromises withLock:](self, "withLock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __38__ASCPendingPromises_containsPromise___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "promisesIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(*(id *)(a1 + 32), "promisesIfLoaded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "indexOfObjectIdenticalTo:", *(_QWORD *)(a1 + 40)) != 0x7FFFFFFFFFFFFFFFLL;

    v2 = v4;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

- (void)addPromise:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__ASCPendingPromises_addPromise___block_invoke;
  v6[3] = &unk_1E75605A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ASCPendingPromises withLock:](self, "withLock:", v6);

}

void __33__ASCPendingPromises_addPromise___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id from;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "promises");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, *(id *)(a1 + 40));
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__ASCPendingPromises_addPromise___block_invoke_2;
  v4[3] = &unk_1E75616D0;
  objc_copyWeak(&v5, &location);
  objc_copyWeak(&v6, &from);
  objc_msgSend(v3, "addFinishBlock:", v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __33__ASCPendingPromises_addPromise___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __33__ASCPendingPromises_addPromise___block_invoke_3;
    v4[3] = &unk_1E75605A0;
    v5 = WeakRetained;
    v6 = v2;
    objc_msgSend(v5, "withLock:", v4);

  }
}

void __33__ASCPendingPromises_addPromise___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "promises");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));

}

- (void)enumerateBinaryPromises:(id)a3 andPromises:(id)a4
{
  void (**v6)(id, _QWORD);
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[ASCPendingPromises stateLock](self, "stateLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  -[ASCPendingPromises binaryPromisesIfLoaded](self, "binaryPromisesIfLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[ASCPendingPromises promisesIfLoaded](self, "promisesIfLoaded");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  -[ASCPendingPromises stateLock](self, "stateLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unlock");

  if (v10)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v16);
    }

  }
  if (v12)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v12;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          v7[2](v7, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v23++));
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v21);
    }

  }
}

- (void)cancelAll
{
  -[ASCPendingPromises enumerateBinaryPromises:andPromises:](self, "enumerateBinaryPromises:andPromises:", &__block_literal_global_22, &__block_literal_global_6_0);
}

uint64_t __31__ASCPendingPromises_cancelAll__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

uint64_t __31__ASCPendingPromises_cancelAll__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (void)finishAllWithError:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__ASCPendingPromises_finishAllWithError___block_invoke;
  v9[3] = &unk_1E7561738;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __41__ASCPendingPromises_finishAllWithError___block_invoke_2;
  v7[3] = &unk_1E7561760;
  v8 = v10;
  v6 = v10;
  -[ASCPendingPromises enumerateBinaryPromises:andPromises:](self, "enumerateBinaryPromises:andPromises:", v9, v7);

}

uint64_t __41__ASCPendingPromises_finishAllWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finishWithError:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__ASCPendingPromises_finishAllWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finishWithError:", *(_QWORD *)(a1 + 32));
}

- (NSRecursiveLock)stateLock
{
  return self->_stateLock;
}

- (NSMutableArray)binaryPromisesIfLoaded
{
  return self->_binaryPromisesIfLoaded;
}

- (void)setBinaryPromisesIfLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_binaryPromisesIfLoaded, a3);
}

- (NSMutableArray)promisesIfLoaded
{
  return self->_promisesIfLoaded;
}

- (void)setPromisesIfLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_promisesIfLoaded, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promisesIfLoaded, 0);
  objc_storeStrong((id *)&self->_binaryPromisesIfLoaded, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end
