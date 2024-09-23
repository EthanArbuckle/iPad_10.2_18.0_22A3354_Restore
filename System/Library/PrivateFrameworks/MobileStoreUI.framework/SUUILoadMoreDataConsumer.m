@implementation SUUILoadMoreDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  objc_opt_class();
  v9 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUUILoadMoreDataConsumer _itemsWithDictionary:](self, "_itemsWithDictionary:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a5 && !v9)
    *a5 = objc_retainAutorelease(v8);

  return v9;
}

- (id)_itemsWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "objectForKey:", CFSTR("charts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("contentIds"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v7;
        v22 = v4;
        objc_msgSend(v4, "objectForKey:", CFSTR("storePlatformData"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_class();
        SUUIStorePageItemsWithStorePlatformDictionary(v9, 0, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v20 = v8;
        v12 = v8;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && !-[NSSet containsObject:](self->_unavailableItemIdentifiers, "containsObject:", v17))
              {
                objc_msgSend(v11, "objectForKey:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                  objc_msgSend(v5, "addObject:", v18);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v14);
        }

        v4 = v22;
        v8 = v20;
        v7 = v21;
      }

    }
  }

  return v5;
}

- (NSSet)unavailableItemIdentifiers
{
  return self->_unavailableItemIdentifiers;
}

- (void)setUnavailableItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableItemIdentifiers, 0);
}

@end
