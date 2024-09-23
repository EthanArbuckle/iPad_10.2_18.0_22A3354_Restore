@implementation SUUIProductPageProductInfo

- (SUUIProductPageProductInfo)initWithInfoSectionDictionaries:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *labels;
  NSMutableArray *v7;
  NSMutableArray *values;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  SUUIProductPageProductInfo *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUUIProductPageProductInfo;
  v20 = -[SUUIProductPageProductInfo init](&v26, sel_init);
  if (v20)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    labels = v20->_labels;
    v20->_labels = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    values = v20->_values;
    v20->_values = v7;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        v21 = v11;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x2426A2860]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "objectForKey:", CFSTR("label"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKey:", CFSTR("value"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[NSMutableArray addObject:](v20->_labels, "addObject:", v16);
                v11 = v21;
                -[NSMutableArray addObject:](v20->_values, "addObject:", v17);
              }
            }

          }
          objc_autoreleasePoolPop(v15);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v11);
    }

    v4 = v19;
  }

  return v20;
}

- (void)enumerateEntriesWithBlock:(id)a3
{
  id v4;
  NSMutableArray *labels;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  labels = self->_labels;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUUIProductPageProductInfo_enumerateEntriesWithBlock___block_invoke;
  v7[3] = &unk_2511F9D18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](labels, "enumerateObjectsUsingBlock:", v7);

}

void __56__SUUIProductPageProductInfo_enumerateEntriesWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t, uint64_t))(v6 + 16))(v6, v8, v9, a3, a4);

}

- (int64_t)numberOfEntries
{
  return -[NSMutableArray count](self->_labels, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
