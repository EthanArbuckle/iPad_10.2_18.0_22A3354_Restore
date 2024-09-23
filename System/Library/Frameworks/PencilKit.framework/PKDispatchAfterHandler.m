@implementation PKDispatchAfterHandler

+ (id)appLifeCycleHandler
{
  if (qword_1ECEE6118 != -1)
    dispatch_once(&qword_1ECEE6118, &__block_literal_global_16);
  return (id)_MergedGlobals_116;
}

void __45__PKDispatchAfterHandler_appLifeCycleHandler__block_invoke()
{
  PKDispatchAfterHandler *v0;
  void *v1;

  v0 = objc_alloc_init(PKDispatchAfterHandler);
  v1 = (void *)_MergedGlobals_116;
  _MergedGlobals_116 = (uint64_t)v0;

}

- (PKDispatchAfterHandler)init
{
  PKDispatchAfterHandler *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDispatchAfterHandler;
  v2 = -[PKDispatchAfterHandler init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PKDispatchAfterHandler setIdentifierBlockMap:](v2, "setIdentifierBlockMap:", v3);

  }
  return v2;
}

- (id)identifierForStringIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)dispatchAfter:(double)a3 stringIdentifier:(id)a4 withBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PKDispatchAfterBlocks *v12;
  void *v13;
  id v14;

  v14 = a5;
  -[PKDispatchAfterHandler identifierForStringIdentifier:](self, "identifierForStringIdentifier:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  -[PKDispatchAfterHandler identifierBlockMap](self, "identifierBlockMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKCheckedDynamicCast(v9, v11);
  v12 = (PKDispatchAfterBlocks *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = -[PKDispatchAfterBlocks initWithIdentifier:]([PKDispatchAfterBlocks alloc], "initWithIdentifier:", v8);
    -[PKDispatchAfterHandler identifierBlockMap](self, "identifierBlockMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v8);

  }
  -[PKDispatchAfterBlocks dispatchAfter:withBlock:](v12, "dispatchAfter:withBlock:", v14, a3);

}

- (void)cancelBlocksWithStringIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PKDispatchAfterHandler identifierForStringIdentifier:](self, "identifierForStringIdentifier:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  -[PKDispatchAfterHandler identifierBlockMap](self, "identifierBlockMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKCheckedDynamicCast(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cancelAll");
}

- (void)cancelAll
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PKDispatchAfterHandler identifierBlockMap](self, "identifierBlockMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v8 = objc_opt_class();
        objc_msgSend(v2, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKCheckedDynamicCast(v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "cancelAll");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (NSMutableDictionary)identifierBlockMap
{
  return self->_identifierBlockMap;
}

- (void)setIdentifierBlockMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierBlockMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierBlockMap, 0);
}

@end
