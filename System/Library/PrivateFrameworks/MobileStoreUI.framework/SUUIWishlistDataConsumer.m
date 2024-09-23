@implementation SUUIWishlistDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v8 = a3;
  objc_msgSend(a4, "MIMEType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("application/json"), 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SUUIWishlistDataConsumer _errorWithData:MIMEType:](self, "_errorWithData:MIMEType:", v8, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v13 = 0;
    -[SUUIWishlistDataConsumer _itemsWithJSONData:error:](self, "_itemsWithJSONData:error:", v8, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v13;
    if (!a5)
      goto LABEL_7;
  }
  if (!v11)
    *a5 = objc_retainAutorelease(v10);
LABEL_7:

  return v11;
}

- (id)_errorWithData:(id)a3 MIMEType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v5 = a3;
  if (objc_msgSend(a4, "rangeOfString:options:", CFSTR("xml"), 1) == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB2BC8], 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DF0]), "initWithResponseDictionary:", v6);
  objc_msgSend(v7, "actionsWithActionType:", *MEMORY[0x24BEB2A18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dialog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dialogKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB2220]);

    v13 = 0;
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB2BC8], 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = 0;
  }

  if (!v13)
    goto LABEL_10;
LABEL_11:

  return v13;
}

- (id)_itemsWithJSONData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  objc_opt_class();
  v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("storePlatformData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_opt_class();
      SUUIStorePageItemsWithStorePlatformDictionary(v8, 0, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("content"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __53__SUUIWishlistDataConsumer__itemsWithJSONData_error___block_invoke;
      v15[3] = &unk_2511F6180;
      v16 = v10;
      v7 = v12;
      v17 = v7;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);

    }
    else
    {
      v7 = 0;
    }

  }
  if (a4 && !v7)
    *a4 = objc_retainAutorelease(v6);
  v13 = v7;

  return v13;
}

void __53__SUUIWishlistDataConsumer__itemsWithJSONData_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("adamIds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

@end
