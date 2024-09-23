@implementation VSTreeNode

+ (id)treeNodeWithRepresentedObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRepresentedObject:", v4);

  return v5;
}

- (VSTreeNode)initWithRepresentedObject:(id)a3
{
  id v5;
  VSTreeNode *v6;
  VSTreeNode *v7;
  NSMutableArray *v8;
  NSMutableArray *children;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VSTreeNode;
  v6 = -[VSTreeNode init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_representedObject, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    children = v7->_children;
    v7->_children = v8;

  }
  return v7;
}

- (VSTreeNode)init
{
  return -[VSTreeNode initWithRepresentedObject:](self, "initWithRepresentedObject:", 0);
}

+ (id)keyPathsForValuesAffectingIndexPath
{
  if (keyPathsForValuesAffectingIndexPath___vs_lazy_init_predicate != -1)
    dispatch_once(&keyPathsForValuesAffectingIndexPath___vs_lazy_init_predicate, &__block_literal_global_10);
  return (id)keyPathsForValuesAffectingIndexPath___vs_lazy_init_variable;
}

void __49__VSTreeNode_keyPathsForValuesAffectingIndexPath__block_invoke()
{
  uint64_t v0;
  void *v1;

  __49__VSTreeNode_keyPathsForValuesAffectingIndexPath__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathsForValuesAffectingIndexPath___vs_lazy_init_variable;
  keyPathsForValuesAffectingIndexPath___vs_lazy_init_variable = v0;

}

id __49__VSTreeNode_keyPathsForValuesAffectingIndexPath__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v0, "addObject:", CFSTR("parentNode.indexPath"));
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

- (NSIndexPath)indexPath
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
  -[VSTreeNode parentNode](self, "parentNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "childNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathByAddingIndex:", objc_msgSend(v6, "indexOfObject:", self));
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v8;
  }

  return (NSIndexPath *)v3;
}

+ (id)keyPathsForValuesAffectingLeaf
{
  if (keyPathsForValuesAffectingLeaf___vs_lazy_init_predicate != -1)
    dispatch_once(&keyPathsForValuesAffectingLeaf___vs_lazy_init_predicate, &__block_literal_global_9);
  return (id)keyPathsForValuesAffectingLeaf___vs_lazy_init_variable;
}

void __44__VSTreeNode_keyPathsForValuesAffectingLeaf__block_invoke()
{
  uint64_t v0;
  void *v1;

  __44__VSTreeNode_keyPathsForValuesAffectingLeaf__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathsForValuesAffectingLeaf___vs_lazy_init_variable;
  keyPathsForValuesAffectingLeaf___vs_lazy_init_variable = v0;

}

id __44__VSTreeNode_keyPathsForValuesAffectingLeaf__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v0, "addObject:", CFSTR("childNodes"));
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

- (BOOL)isLeaf
{
  void *v2;
  uint64_t v3;

  -[VSTreeNode childNodes](self, "childNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3 == 0;
}

- (void)insertChildNodes:(id)a3 atIndexes:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The insertedChildren parameter must not be nil."));
    if (v6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The indexes parameter must not be nil."));
    goto LABEL_3;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v8, "makeObjectsPerformSelector:withObject:", sel_setParentNode_, self);
  -[VSTreeNode children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObjects:atIndexes:", v8, v6);

}

- (void)removeChildNodesAtIndexes:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The indexes parameter must not be nil."));
  -[VSTreeNode children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:withObject:", sel_setParentNode_, 0);
  objc_msgSend(v4, "removeObjectsAtIndexes:", v6);

}

- (NSMutableArray)mutableChildNodes
{
  return (NSMutableArray *)-[VSTreeNode mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("childNodes"));
}

- (id)descendantNodeAtIndexPath:(id)a3
{
  id v4;
  VSTreeNode *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  VSTreeNode *v11;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The indexPath parameter must not be nil."));
  v5 = self;
  v6 = objc_msgSend(v4, "length");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      -[VSTreeNode childNodes](v5, "childNodes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "indexAtPosition:", v8);
      if (v10 >= objc_msgSend(v9, "count"))
        break;
      objc_msgSend(v9, "objectAtIndex:", v10);
      v11 = (VSTreeNode *)objc_claimAutoreleasedReturnValue();

      ++v8;
      v5 = v11;
      if (v7 == v8)
        goto LABEL_10;
    }

    v11 = 0;
  }
  else
  {
    v11 = v5;
  }
LABEL_10:

  return v11;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (VSTreeNode)parentNode
{
  return (VSTreeNode *)objc_loadWeakRetained((id *)&self->_parentNode);
}

- (void)setParentNode:(id)a3
{
  objc_storeWeak((id *)&self->_parentNode, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parentNode);
  objc_storeStrong(&self->_representedObject, 0);
}

- (id)_descendantNodesAtDepth:(unint64_t)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    -[VSTreeNode childNodes](self, "childNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      return v13;
    goto LABEL_10;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[VSTreeNode childNodes](self, "childNodes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = a3 - 1;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "_descendantNodesAtDepth:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  if (!v13)
LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The collectedDescendants parameter must not be nil."));
  return v13;
}

- (void)enumerateDescendantsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _BYTE *))a4;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
LABEL_3:
      v28 = 0;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[VSTreeNode childNodes](self, "childNodes", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
LABEL_5:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
          v6[2](v6, v12, &v28);
          if (v28)
            break;
          objc_msgSend(v12, "enumerateDescendantsWithOptions:usingBlock:", a3, v6);
          if (v28)
            break;
          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
            if (v9)
              goto LABEL_5;
            break;
          }
        }
      }

      goto LABEL_26;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The block parameter must not be nil."));
    if ((a3 & 1) == 0)
      goto LABEL_3;
  }
  v13 = 0;
  v14 = 0;
  v28 = 0;
  do
  {
    -[VSTreeNode _descendantNodesAtDepth:](self, "_descendantNodesAtDepth:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = v15;
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
LABEL_17:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v14);
        v6[2](v6, *(void **)(*((_QWORD *)&v24 + 1) + 8 * v19), &v28);
        if (v28)
          break;
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
          if (v17)
            goto LABEL_17;
          break;
        }
      }
    }

    if (v28)
      break;
    ++v13;
  }
  while (objc_msgSend(v14, "count"));

LABEL_26:
}

@end
