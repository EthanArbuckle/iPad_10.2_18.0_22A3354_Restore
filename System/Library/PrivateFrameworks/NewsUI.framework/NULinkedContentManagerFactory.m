@implementation NULinkedContentManagerFactory

- (void)addLinkedContentProviderFactory:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_factories, "addObject:");
}

- (id)createLinkedContentManagerForArticle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NULinkedContentManager *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)-[NSMutableArray copy](self->_factories, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "createLinkedContentProviderForArticle:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[NULinkedContentManager initWithLinkedContentProviders:]([NULinkedContentManager alloc], "initWithLinkedContentProviders:", v5);
  return v12;
}

- (NULinkedContentManagerFactory)init
{
  NULinkedContentManagerFactory *v2;
  uint64_t v3;
  NSMutableArray *factories;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NULinkedContentManagerFactory;
  v2 = -[NULinkedContentManagerFactory init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    factories = v2->_factories;
    v2->_factories = (NSMutableArray *)v3;

  }
  return v2;
}

- (NSMutableArray)factories
{
  return self->_factories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factories, 0);
}

@end
