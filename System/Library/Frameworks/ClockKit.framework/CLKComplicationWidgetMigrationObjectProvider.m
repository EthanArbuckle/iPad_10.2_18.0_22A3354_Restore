@implementation CLKComplicationWidgetMigrationObjectProvider

- (CLKComplicationWidgetMigrationObjectProvider)init
{
  CLKComplicationWidgetMigrationObjectProvider *v2;
  uint64_t v3;
  NSMutableDictionary *itemsByAppIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationWidgetMigrationObjectProvider;
  v2 = -[CLKComplicationWidgetMigrationObjectProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    itemsByAppIdentifier = v2->_itemsByAppIdentifier;
    v2->_itemsByAppIdentifier = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)itemForAppIdentifier:(id)a3 key:(id)a4
{
  NSMutableDictionary *itemsByAppIdentifier;
  id v6;
  void *v7;
  void *v8;

  itemsByAppIdentifier = self->_itemsByAppIdentifier;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](itemsByAppIdentifier, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)enumerateAppIdentifiersWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_itemsByAppIdentifier, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateItemsForAppIdentifier:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, _QWORD, char *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, char *))a4;
  -[NSMutableDictionary objectForKey:](self->_itemsByAppIdentifier, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v18 = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v7, "objectEnumerator", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13), &v18);
        if (v18)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v11)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)removeItemsForAppIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_itemsByAppIdentifier, "removeObjectForKey:", a3);
}

- (void)setItem:(id)a3 forAppIdentifier:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKey:](self->_itemsByAppIdentifier, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKey:](self->_itemsByAppIdentifier, "setObject:forKey:", v10, v8);
  }
  objc_msgSend(v10, "setObject:forKey:", v11, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsByAppIdentifier, 0);
}

@end
