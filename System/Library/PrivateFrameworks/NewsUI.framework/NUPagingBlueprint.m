@implementation NUPagingBlueprint

- (NUPagingBlueprint)initWithPages:(id)a3
{
  id v4;
  NUPagingBlueprint *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSOrderedSet *blueprintItems;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NUPagingBlueprint;
  v5 = -[NUPagingBlueprint init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF00];
    objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "orderedSetWithArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    blueprintItems = v5->_blueprintItems;
    v5->_blueprintItems = (NSOrderedSet *)v8;

  }
  return v5;
}

NUPagingBlueprintItem *__35__NUPagingBlueprint_initWithPages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NUPagingBlueprintItem *v3;

  v2 = a2;
  v3 = -[NUPagingBlueprintItem initWithPage:]([NUPagingBlueprintItem alloc], "initWithPage:", v2);

  return v3;
}

- (id)pageBeforeForIdentifier:(id)a3
{
  id v4;
  NUPagingBlueprintItem *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[NUPagingBlueprintItem initWithPageID:]([NUPagingBlueprintItem alloc], "initWithPageID:", v4);

  -[NUPagingBlueprint blueprintItems](self, "blueprintItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (v7)
    v8 = v7 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = 1;
  if (v8)
  {
    v11 = 0;
  }
  else
  {
    -[NUPagingBlueprint blueprintItems](self, "blueprintItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v7 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "page");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)pageForIdentifier:(id)a3
{
  id v4;
  NUPagingBlueprintItem *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[NUPagingBlueprintItem initWithPageID:]([NUPagingBlueprintItem alloc], "initWithPageID:", v4);

  -[NUPagingBlueprint blueprintItems](self, "blueprintItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NUPagingBlueprint blueprintItems](self, "blueprintItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "page");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pageAfterIdentifier:(id)a3
{
  id v4;
  NUPagingBlueprintItem *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[NUPagingBlueprintItem initWithPageID:]([NUPagingBlueprintItem alloc], "initWithPageID:", v4);

  -[NUPagingBlueprint blueprintItems](self, "blueprintItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL
    || (v8 = v7 + 1,
        -[NUPagingBlueprint blueprintItems](self, "blueprintItems"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8 >= v10))
  {
    v13 = 0;
  }
  else
  {
    -[NUPagingBlueprint blueprintItems](self, "blueprintItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "page");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)forEachPage:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NUPagingBlueprint blueprintItems](self, "blueprintItems", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "page");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            v4[2](v4, v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (NUPage)firstPage
{
  void *v2;
  void *v3;
  void *v4;

  -[NUPagingBlueprint blueprintItems](self, "blueprintItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "page");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NUPage *)v4;
}

- (NUPage)lastPage
{
  void *v2;
  void *v3;
  void *v4;

  -[NUPagingBlueprint blueprintItems](self, "blueprintItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "page");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NUPage *)v4;
}

- (NSArray)allPages
{
  void *v2;
  void *v3;

  -[NUPagingBlueprint blueprintItems](self, "blueprintItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("page"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSOrderedSet)blueprintItems
{
  return self->_blueprintItems;
}

- (void)setBlueprintItems:(id)a3
{
  objc_storeStrong((id *)&self->_blueprintItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blueprintItems, 0);
}

@end
