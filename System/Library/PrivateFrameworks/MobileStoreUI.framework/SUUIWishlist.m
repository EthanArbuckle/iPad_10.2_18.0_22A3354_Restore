@implementation SUUIWishlist

- (SUUIWishlist)initWithAccountIdentifier:(int64_t)a3
{
  SUUIWishlist *v5;
  uint64_t v6;
  SSWishlist *database;
  objc_super v9;

  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid accountID"));
  v9.receiver = self;
  v9.super_class = (Class)SUUIWishlist;
  v5 = -[SUUIWishlist init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEB20C8]), "initWithAccountIdentifier:", a3);
    database = v5->_database;
    v5->_database = (SSWishlist *)v6;

  }
  return v5;
}

+ (id)activeWishlist
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SUUIWishlist *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");

  v6 = (void *)activeWishlist_sActiveWishlist;
  if (!v3)
  {
    v7 = 0;
    goto LABEL_6;
  }
  if (!activeWishlist_sActiveWishlist || objc_msgSend((id)activeWishlist_sActiveWishlist, "accountIdentifier") != v5)
  {
    v7 = -[SUUIWishlist initWithAccountIdentifier:]([SUUIWishlist alloc], "initWithAccountIdentifier:", v5);
    v6 = (void *)activeWishlist_sActiveWishlist;
LABEL_6:
    activeWishlist_sActiveWishlist = (uint64_t)v7;

  }
  v8 = (id)activeWishlist_sActiveWishlist;

  return v8;
}

- (int64_t)accountIdentifier
{
  return -[SSWishlist accountIdentifier](self->_database, "accountIdentifier");
}

- (void)addItem:(id)a3
{
  id v4;
  SSWishlist *database;
  id v6;
  SUUIAddToWishlistOperation *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  SUUIWishlist *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  database = self->_database;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __24__SUUIWishlist_addItem___block_invoke;
  v9[3] = &unk_2511FE1E0;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  -[SSWishlist performTransactionWithBlock:](database, "performTransactionWithBlock:", v9);
  if (*((_BYTE *)v14 + 24))
  {
    v7 = -[SUUIAddToWishlistOperation initWithItem:reason:]([SUUIAddToWishlistOperation alloc], "initWithItem:reason:", v6, 0);
    SUUIWishlistOperationQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperation:", v7);

  }
  _Block_object_dispose(&v13, 8);

}

BOOL __24__SUUIWishlist_addItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BEB1FA8], "predicateWithProperty:equalToLongLong:", *MEMORY[0x24BEB2BD8], objc_msgSend(*(id *)(a1 + 32), "itemIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB20D0], "anyInDatabase:predicate:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setValue:forProperty:", &unk_2512EEE98, *MEMORY[0x24BEB2BF0]);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    SUUIWishlistItemPropertiesWithItem(*(void **)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *MEMORY[0x24BEB2BE8];
      objc_msgSend(MEMORY[0x24BEB20D0], "maxValueForProperty:predicate:database:", *MEMORY[0x24BEB2BE8], 0, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "integerValue") + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v10, v8);

      objc_msgSend(v7, "setObject:forKey:", &unk_2512EEE98, *MEMORY[0x24BEB2BF0]);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB20D0]), "initWithPropertyValues:inDatabase:", v7, v3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastSyncTime:", v12);

    v13 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)containsItemWithIdentifier:(int64_t)a3
{
  SSWishlist *database;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  database = self->_database;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__SUUIWishlist_containsItemWithIdentifier___block_invoke;
  v6[3] = &unk_2511FE208;
  v6[4] = &v7;
  v6[5] = a3;
  -[SSWishlist performTransactionWithBlock:](database, "performTransactionWithBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__SUUIWishlist_containsItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BEB1FA8];
  v4 = *MEMORY[0x24BEB2BD8];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v3, "predicateWithProperty:equalToLongLong:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB20D0], "anyInDatabase:predicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8 != 0;
  v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

  return v9;
}

- (NSArray)items
{
  void *v3;
  SSWishlist *database;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __21__SUUIWishlist_items__block_invoke;
  v7[3] = &unk_2511F70E0;
  v5 = v3;
  v8 = v5;
  -[SSWishlist performTransactionWithBlock:](database, "performTransactionWithBlock:", v7);

  return (NSArray *)v5;
}

uint64_t __21__SUUIWishlist_items__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BEB1FC0];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setEntityClass:", objc_opt_class());
  v15[0] = *MEMORY[0x24BEB2A40];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOrderingDirections:", v6);

  v14 = *MEMORY[0x24BEB2BE8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOrderingProperties:", v7);

  objc_msgSend(MEMORY[0x24BEB1FA8], "predicateWithProperty:value:comparisonType:", *MEMORY[0x24BEB2BF0], &unk_2512EEEB0, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1FB8]), "initWithDatabase:descriptor:", v4, v5);
  v13 = (id)*MEMORY[0x24BEB2BD0];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __21__SUUIWishlist_items__block_invoke_17;
  v11[3] = &unk_2511F85A0;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v9, "enumeratePersistentIDsAndProperties:count:usingBlock:", &v13, 1, v11);

  return 1;
}

void __21__SUUIWishlist_items__block_invoke_17(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  SUUIItem *v7;

  v5 = (void *)MEMORY[0x2426A2860]();
  if (*a3)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", *a3, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[SUUIItem initWithCacheRepresentation:]([SUUIItem alloc], "initWithCacheRepresentation:", v6);
      if (v7)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

    }
  }
  objc_autoreleasePoolPop(v5);
}

- (void)postChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SUUIWishlistDidChangeNotification"), self);

}

- (void)removeItemsWithItemIdentifiers:(id)a3
{
  id v4;
  void *v5;
  SSWishlist *database;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  SUUIWishlistOperationQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__SUUIWishlist_removeItemsWithItemIdentifiers___block_invoke;
  v9[3] = &unk_2511FE230;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  -[SSWishlist performTransactionWithBlock:](database, "performTransactionWithBlock:", v9);

}

uint64_t __47__SUUIWishlist_removeItemsWithItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)*MEMORY[0x24BEB2BD8];
  objc_msgSend(MEMORY[0x24BEB1FB0], "containsPredicateWithProperty:values:", *MEMORY[0x24BEB2BD8], *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB20D0], "queryWithDatabase:predicate:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__SUUIWishlist_removeItemsWithItemIdentifiers___block_invoke_2;
  v9[3] = &unk_2511F85C8;
  v10 = v3;
  v11 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v6, "enumeratePersistentIDsAndProperties:count:usingBlock:", v12, 1, v9);

  return 1;
}

void __47__SUUIWishlist_removeItemsWithItemIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, id *a3)
{
  void *v6;
  void *v7;
  SUUIRemoveFromWishlistOperation *v8;

  v6 = (void *)MEMORY[0x2426A2860]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB20D0]), "initWithPersistentID:inDatabase:", a2, *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "setValue:forProperty:", &unk_2512EEEB0, *MEMORY[0x24BEB2BF0]);
  v8 = -[SUUIRemoveFromWishlistOperation initWithItemIdentifier:entityIdentifier:reason:]([SUUIRemoveFromWishlistOperation alloc], "initWithItemIdentifier:entityIdentifier:reason:", objc_msgSend(*a3, "longLongValue"), a2, 0);
  objc_msgSend(*(id *)(a1 + 40), "addOperation:", v8);

  objc_autoreleasePoolPop(v6);
}

- (unint64_t)hash
{
  return -[SSWishlist accountIdentifier](self->_database, "accountIdentifier");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  int64_t v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = -[SUUIWishlist accountIdentifier](self, "accountIdentifier");
    v6 = v7 == objc_msgSend(v4, "accountIdentifier");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
