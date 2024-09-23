@implementation ICDispatchAfterHandler

+ (id)appLifeCycleHandler
{
  if (appLifeCycleHandler_predicate != -1)
    dispatch_once(&appLifeCycleHandler_predicate, &__block_literal_global_6);
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "+[ICDispatchAfterHandler appLifeCycleHandler]", 1, 0, CFSTR("The app handler should only be used on the main thread"));
  return (id)appLifeCycleHandler_sDispatchAfterHandler;
}

- (void)cancelBlocksWithStringIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICDispatchAfterHandler identifierForStringIdentifier:](self, "identifierForStringIdentifier:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  -[ICDispatchAfterHandler identifierBlockMap](self, "identifierBlockMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast(v4, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cancelAll");
}

- (void)dispatchAfter:(double)a3 stringIdentifier:(id)a4 withBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ICDispatchAfterBlocks *v12;
  void *v13;
  id v14;

  v14 = a5;
  -[ICDispatchAfterHandler identifierForStringIdentifier:](self, "identifierForStringIdentifier:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  -[ICDispatchAfterHandler identifierBlockMap](self, "identifierBlockMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast(v9, (uint64_t)v11);
  v12 = (ICDispatchAfterBlocks *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = -[ICDispatchAfterBlocks initWithIdentifier:]([ICDispatchAfterBlocks alloc], "initWithIdentifier:", v8);
    -[ICDispatchAfterHandler identifierBlockMap](self, "identifierBlockMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v8);

  }
  -[ICDispatchAfterBlocks dispatchAfter:withBlock:](v12, "dispatchAfter:withBlock:", v14, a3);

}

- (NSMutableDictionary)identifierBlockMap
{
  return self->_identifierBlockMap;
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

void __45__ICDispatchAfterHandler_appLifeCycleHandler__block_invoke()
{
  ICDispatchAfterHandler *v0;
  void *v1;

  v0 = objc_alloc_init(ICDispatchAfterHandler);
  v1 = (void *)appLifeCycleHandler_sDispatchAfterHandler;
  appLifeCycleHandler_sDispatchAfterHandler = (uint64_t)v0;

}

- (ICDispatchAfterHandler)init
{
  ICDispatchAfterHandler *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDispatchAfterHandler;
  v2 = -[ICDispatchAfterHandler init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[ICDispatchAfterHandler setIdentifierBlockMap:](v2, "setIdentifierBlockMap:", v3);

  }
  return v2;
}

- (void)setIdentifierBlockMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierBlockMap, a3);
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
  -[ICDispatchAfterHandler identifierBlockMap](self, "identifierBlockMap");
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
        ICCheckedDynamicCast(v8, (uint64_t)v9);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierBlockMap, 0);
}

@end
