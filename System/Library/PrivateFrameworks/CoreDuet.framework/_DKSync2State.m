@implementation _DKSync2State

- (void)addCompletionBlock:(uint64_t)a1
{
  void *v2;
  id v3;

  if (a1)
  {
    if (a2)
    {
      v2 = *(void **)(a1 + 32);
      v3 = (id)MEMORY[0x193FEEAF4](a2);
      objc_msgSend(v2, "addObject:", v3);

    }
  }
}

- (_QWORD)initWithType:(void *)a3 completion:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)_DKSync2State;
    v8 = objc_msgSendSuper2(&v14, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 2, a2);
      v9 = (void *)MEMORY[0x1E0C99DE8];
      v10 = (void *)MEMORY[0x193FEEAF4](v7);
      objc_msgSend(v9, "arrayWithObjects:", v10, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)a1[4];
      a1[4] = v11;

    }
  }

  return a1;
}

- (void)finishWithError:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        v10 = v7;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x193FEEAF4](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));

          ((void (**)(_QWORD, id))v7)[2](v7, v3);
          ++v9;
          v10 = v7;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);

    }
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", (_QWORD)v12);
    v11 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
