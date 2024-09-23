@implementation FCProxyOperation

+ (void)initialize
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D60B18]);
    v3 = (void *)_MergedGlobals_151;
    _MergedGlobals_151 = (uint64_t)v2;

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)qword_1ED0F7F18;
    qword_1ED0F7F18 = (uint64_t)v4;

  }
}

+ (id)proxyForOperation:(id)a3
{
  id v3;
  FCProxyOperation *v4;
  void *v5;
  FCProxyOperation *v6;
  id v7;
  FCProxyOperation *v8;
  FCProxyOperation *v9;
  _QWORD v11[4];
  id v12;
  FCProxyOperation *v13;

  v3 = a3;
  v4 = objc_alloc_init(FCProxyOperation);
  -[FCProxyOperation setUnderlyingOperation:]((uint64_t)v4, v3);
  v5 = (void *)_MergedGlobals_151;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__FCProxyOperation_proxyForOperation___block_invoke;
  v11[3] = &unk_1E463AD10;
  v12 = v3;
  v6 = v4;
  v13 = v6;
  v7 = v3;
  objc_msgSend(v5, "performWithLockSync:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (void)setUnderlyingOperation:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 368), a2);
}

void __38__FCProxyOperation_proxyForOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = (void *)qword_1ED0F7F18;
  objc_msgSend(*(id *)(a1 + 32), "operationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v4;
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
  v5 = (void *)qword_1ED0F7F18;
  objc_msgSend(*(id *)(a1 + 32), "operationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v6);

}

- (void)performOperation
{
  FCProxyOperation *v2;
  FCProxyOperation *v3;
  FCOperation *underlyingOperation;
  FCProxyOperation *v5;
  FCOperation *v6;
  _QWORD v7[4];
  FCProxyOperation *v8;

  v2 = self;
  v3 = v2;
  if (v2)
    underlyingOperation = v2->_underlyingOperation;
  else
    underlyingOperation = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__FCProxyOperation_performOperation__block_invoke;
  v7[3] = &unk_1E463AB18;
  v5 = v2;
  v8 = v5;
  -[FCOperation addCompletionHandler:](underlyingOperation, "addCompletionHandler:", v7);
  if (v3)
    v6 = v5->_underlyingOperation;
  else
    v6 = 0;
  -[FCOperation startIfNeeded](v6, "startIfNeeded");

}

uint64_t __36__FCProxyOperation_performOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
}

- (void)operationDidFinishWithError:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__FCProxyOperation_operationDidFinishWithError___block_invoke;
  v4[3] = &unk_1E463AB18;
  v4[4] = self;
  objc_msgSend((id)_MergedGlobals_151, "performWithLockSync:", v4);
  -[FCProxyOperation setUnderlyingOperation:]((uint64_t)self, 0);
}

void __48__FCProxyOperation_operationDidFinishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  id v6;

  v2 = (void *)qword_1ED0F7F18;
  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[46];
  v4 = v3;
  objc_msgSend(v4, "operationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));
    -[FCProxyOperation _revisitRelativePriority](*(_QWORD *)(a1 + 32));
    -[FCProxyOperation _revisitQualityOfService](*(_QWORD *)(a1 + 32));
  }

}

- (void)_revisitRelativePriority
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)qword_1ED0F7F18;
    v3 = *(id *)(a1 + 368);
    objc_msgSend(v3, "operationID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      v10 = -1;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "relativePriority", (_QWORD)v13);
          if (v10 <= v12)
            v10 = v12;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    else
    {
      v10 = -1;
    }

    objc_msgSend(*(id *)(a1 + 368), "setRelativePriority:", v10);
  }
}

- (void)_revisitQualityOfService
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)qword_1ED0F7F18;
    v3 = *(id *)(a1 + 368);
    objc_msgSend(v3, "operationID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      v10 = 9;
      do
      {
        v11 = 0;
        v12 = v10;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "qualityOfService", (_QWORD)v16);
          v10 = v13;
          if (v12 != -1 || v13 <= 24)
          {
            if (v12 <= v13)
              v14 = v13;
            else
              v14 = v12;
            if (v12 < 18 && v13 == -1)
              v10 = -1;
            else
              v10 = v14;
          }
          ++v11;
          v12 = v10;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 9;
    }

    objc_msgSend(*(id *)(a1 + 368), "setQualityOfService:", v10);
  }
}

- (unint64_t)propertiesInheritedByChildOperations
{
  return 0;
}

- (void)setRelativePriority:(int64_t)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FCProxyOperation;
  -[FCOperation setRelativePriority:](&v5, sel_setRelativePriority_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__FCProxyOperation_setRelativePriority___block_invoke;
  v4[3] = &unk_1E463AB18;
  v4[4] = self;
  objc_msgSend((id)_MergedGlobals_151, "performWithLockSync:", v4);
}

void __40__FCProxyOperation_setRelativePriority___block_invoke(uint64_t a1)
{
  -[FCProxyOperation _revisitRelativePriority](*(_QWORD *)(a1 + 32));
}

- (void)setQualityOfService:(int64_t)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FCProxyOperation;
  -[FCOperation setQualityOfService:](&v5, sel_setQualityOfService_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__FCProxyOperation_setQualityOfService___block_invoke;
  v4[3] = &unk_1E463AB18;
  v4[4] = self;
  objc_msgSend((id)_MergedGlobals_151, "performWithLockSync:", v4);
}

void __40__FCProxyOperation_setQualityOfService___block_invoke(uint64_t a1)
{
  -[FCProxyOperation _revisitQualityOfService](*(_QWORD *)(a1 + 32));
}

- (void)setPurpose:(id)a3
{
  id v4;
  FCOperation *underlyingOperation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCProxyOperation;
  v4 = a3;
  -[FCOperation setPurpose:](&v6, sel_setPurpose_, v4);
  if (self)
    underlyingOperation = self->_underlyingOperation;
  else
    underlyingOperation = 0;
  -[FCOperation setPurpose:](underlyingOperation, "setPurpose:", v4, v6.receiver, v6.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingOperation, 0);
}

@end
