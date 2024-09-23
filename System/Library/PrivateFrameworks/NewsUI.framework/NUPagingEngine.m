@implementation NUPagingEngine

- (NUPagingEngine)initWithArticlePageFactory:(id)a3
{
  id v5;
  NUPagingEngine *v6;
  NUPagingEngine *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUPagingEngine;
  v6 = -[NUPagingEngine init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_articlePageFactory, a3);

  return v7;
}

- (id)createPagingForArticleIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NUPagingBlueprint *v7;

  v4 = a3;
  -[NUPagingEngine articlePageFactory](self, "articlePageFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createPagesForArticleIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NUPagingBlueprint initWithPages:]([NUPagingBlueprint alloc], "initWithPages:", v6);
  return v7;
}

- (id)paging:(id)a3 byAddingPage:(id)a4 afterPage:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  NUPagingBlueprint *v17;
  void *v18;
  NUPagingBlueprint *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "allPages", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "addObject:", v16);
        if (v16 == v9)
          objc_msgSend(v10, "addObject:", v8);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  v17 = [NUPagingBlueprint alloc];
  v18 = (void *)objc_msgSend(v10, "copy");
  v19 = -[NUPagingBlueprint initWithPages:](v17, "initWithPages:", v18);

  return v19;
}

- (id)paging:(id)a3 byRemovingPage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NUPagingBlueprint *v13;
  void *v14;
  NUPagingBlueprint *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "allPages", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        if (*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12) != v6)
          objc_msgSend(v7, "addObject:");
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v13 = [NUPagingBlueprint alloc];
  v14 = (void *)objc_msgSend(v7, "copy");
  v15 = -[NUPagingBlueprint initWithPages:](v13, "initWithPages:", v14);

  return v15;
}

- (NUArticlePageFactory)articlePageFactory
{
  return self->_articlePageFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articlePageFactory, 0);
}

@end
