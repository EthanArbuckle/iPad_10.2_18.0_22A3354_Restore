@implementation WFContentCoercionNode

- (WFContentCoercionNode)initWithItemOrItemClass:(id)a3 parent:(id)a4
{
  id v7;
  id v8;
  WFContentCoercionNode *v9;
  WFContentCoercionNode *v10;
  WFContentCoercionNode *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[WFContentCoercionNode init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_itemOrItemClass, a3);
    objc_storeStrong((id *)&v10->_parent, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WFContentCoercionNode;
  -[WFContentCoercionNode description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentCoercionNode itemOrItemClass](self, "itemOrItemClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)successorsWithOptions:(id)a3
{
  return -[WFContentCoercionNode successorsWithOptions:goalType:](self, "successorsWithOptions:goalType:", a3, 0);
}

- (id)successorsWithOptions:(id)a3 goalType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[WFContentCoercionNode itemOrItemClass](self, "itemOrItemClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "supportedItemClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __56__WFContentCoercionNode_successorsWithOptions_goalType___block_invoke;
  v26[3] = &unk_24C4E3388;
  v11 = v7;
  v27 = v11;
  objc_msgSend(v10, "sortedArrayUsingComparator:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
        if (objc_msgSend((id)objc_opt_class(), "supportedItemClassMustBeDeterminedByInstance:", v18, (_QWORD)v22))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(v9, "canGenerateIntermediaryRepresentationForItemClass:", v18))
          {
            objc_msgSend(v9, "itemsByCoercingToItemClass:options:error:", v18, v6, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "count"))
              objc_msgSend(v8, "addObjectsFromArray:", v19);
            else
              objc_msgSend(v8, "addObject:", v18);

          }
        }
        else
        {
          objc_msgSend(v8, "addObject:", v18);
        }
        ++v17;
      }
      while (v15 != v17);
      v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      v15 = v20;
    }
    while (v20);
  }

  return v8;
}

- (NSOrderedSet)itemOrItemClassPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFContentCoercionNode parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFContentCoercionNode parent](self, "parent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemOrItemClassPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentCoercionNode itemOrItemClass](self, "itemOrItemClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "orderedSetByAddingObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBCF00];
    -[WFContentCoercionNode itemOrItemClass](self, "itemOrItemClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orderedSetWithObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSOrderedSet *)v7;
}

- (NSOrderedSet)coercionPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFContentCoercionNode parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFContentCoercionNode parent](self, "parent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemOrItemClassPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentCoercionNode itemOrItemClass](self, "itemOrItemClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "orderedSetByAddingObject:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBCF00];
    -[WFContentCoercionNode itemOrItemClass](self, "itemOrItemClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orderedSetWithObject:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSOrderedSet *)v7;
}

- (void)runCoercionWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[WFContentCoercionNode itemOrItemClassPath](self, "itemOrItemClassPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentCoercionNode continueCoercionUsingPathEnumerator:contentItems:options:error:completionHandler:](self, "continueCoercionUsingPathEnumerator:contentItems:options:error:completionHandler:", v9, v11, v7, 0, v6);

}

- (void)continueCoercionUsingPathEnumerator:(id)a3 contentItems:(id)a4 options:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "nextObject");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v13 && v17 && ((v19 = objc_msgSend(v13, "count"), !v15) || v19))
  {
    v20 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke;
    v25[3] = &unk_24C4E33D8;
    v26 = v18;
    v27 = v14;
    v21[0] = v20;
    v21[1] = 3221225472;
    v21[2] = __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke_3;
    v21[3] = &unk_24C4E3400;
    v21[4] = self;
    v22 = v12;
    v23 = v27;
    v24 = v16;
    objc_msgSend(v13, "if_flatMapAsynchronously:completionHandler:", v25, v21);

  }
  else
  {
    (*((void (**)(id, id, id))v16 + 2))(v16, v13, v15);
  }

}

- (id)runCoercionSynchronouslyWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WFContentCoercionNode itemOrItemClassPath](self, "itemOrItemClassPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentCoercionNode continueCoercionUsingPathEnumerator:contentItems:options:error:](self, "continueCoercionUsingPathEnumerator:contentItems:options:error:", v8, v10, v6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)continueCoercionUsingPathEnumerator:(id)a3 contentItems:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  WFContentCoercionNode *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "nextObject");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v11 && v13)
  {
    v24 = self;
    v25 = v10;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v20), "itemsByCoercingToItemClass:options:error:", objc_opt_class(), v12, a6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    v10 = v25;
    -[WFContentCoercionNode continueCoercionUsingPathEnumerator:contentItems:options:error:](v24, "continueCoercionUsingPathEnumerator:contentItems:options:error:", v25, v15, v12, a6);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = v11;
  }

  return v22;
}

- (id)itemOrItemClass
{
  return self->_itemOrItemClass;
}

- (WFContentCoercionNode)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong(&self->_itemOrItemClass, 0);
}

void __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a2;
  v13[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke_2;
  v11[3] = &unk_24C4E33B0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "forceCoerceToItemClasses:options:completionHandler:", v8, v9, v11);

}

void __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v8 = a2;
  v5 = a3;
  v6 = objc_msgSend(v8, "count");
  if (!v5 || v6)
  {
    v7 = v8;
  }
  else
  {

    v7 = 0;
  }
  v9 = v7;
  objc_msgSend(*(id *)(a1 + 32), "continueCoercionUsingPathEnumerator:contentItems:options:error:completionHandler:", *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 56));

}

uint64_t __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__WFContentCoercionNode_successorsWithOptions_goalType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;

  objc_msgSend(a2, "ownedTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(a3, "ownedTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v6 ^ 1 | v8)
    return (v6 ^ 1) & v8;
  else
    return -1;
}

+ (WFContentCoercionNode)coercionNodeWithItem:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItemOrItemClass:parent:", v7, v6);

  return (WFContentCoercionNode *)v8;
}

+ (WFContentCoercionNode)coercionNodeWithItemClass:(Class)a3 parent:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItemOrItemClass:parent:", a3, v6);

  return (WFContentCoercionNode *)v7;
}

+ (WFContentCoercionNode)coercionNodeWithItemOrItemClass:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItemOrItemClass:parent:", v7, v6);

  return (WFContentCoercionNode *)v8;
}

@end
