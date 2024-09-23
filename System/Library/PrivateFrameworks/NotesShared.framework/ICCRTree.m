@implementation ICCRTree

- (ICCRTree)init
{
  void *v3;
  ICCRTree *v4;
  ICCRTreeNode *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)ICCRTree;
  v4 = -[ICCRObject initWithDocument:identity:](&v8, sel_initWithDocument_identity_, 0, v3);

  if (v4)
  {
    v5 = -[ICCRTreeNode initWithValue:parent:tree:]([ICCRTreeNode alloc], "initWithValue:parent:tree:", CFSTR("root"), 0, v4);
    -[ICCRTree nodes](v4, "nodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObject:atIndex:", v5, 0);

  }
  return v4;
}

- (ICCRTree)initWithICCRCoder:(id)a3
{
  id v4;
  ICCRTree *v5;
  ICCRTree *v6;
  void *v7;
  _QWORD v9[4];
  ICCRTree *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCRTree;
  v5 = -[ICCRObject initWithICCRCoder:](&v11, sel_initWithICCRCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__ICCRTree_initWithICCRCoder___block_invoke;
    v9[3] = &unk_1E76C8FD0;
    v10 = v5;
    -[ICCRTree nodes](v10, "nodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addDecoderCompletionHandler:dependency:for:", v9, v7, v10);

  }
  return v6;
}

void __30__ICCRTree_initWithICCRCoder___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__ICCRTree_initWithICCRCoder___block_invoke_2;
  v3[3] = &unk_1E76C8FA8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateWithBlock:", v3);

}

uint64_t __30__ICCRTree_initWithICCRCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTree:", *(_QWORD *)(a1 + 32));
}

- (ICCROrderedSet)nodes
{
  void *v2;
  void *v3;

  -[ICCRObject fields](self, "fields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nodes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCROrderedSet *)v3;
}

- (ICCRTreeNode)root
{
  void *v2;
  void *v3;

  -[ICCRTree nodes](self, "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCRTreeNode *)v3;
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[ICCRTree nodes](self, "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (id)CRProperties
{
  ICCROrderedSet *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("nodes");
  v2 = objc_alloc_init(ICCROrderedSet);
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)insertIndexForNode:(id)a3 childIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(v6, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", a4 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICCRTree nodes](self, "nodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v11 = v9;
  }
  else
  {
    -[ICCRTree nodes](self, "nodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    v11 = v7;
  }
  v12 = objc_msgSend(v10, "indexOfObject:", v11);

  return v12 + 1;
}

- (id)insertNodeWithValue:(id)a3 inParent:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  ICCRTreeNode *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[ICCRTreeNode initWithValue:parent:tree:]([ICCRTreeNode alloc], "initWithValue:parent:tree:", v9, v8, self);

  -[ICCRTree insertNode:inParent:atIndex:](self, "insertNode:inParent:atIndex:", v10, v8, a5);
  return v10;
}

- (void)insertNode:(id)a3 inParent:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  unint64_t v10;

  v8 = a4;
  v9 = a3;
  v10 = -[ICCRTree insertIndexForNode:childIndex:](self, "insertIndexForNode:childIndex:", v8, a5);
  objc_msgSend(v9, "setParent:", v8);

  -[ICCRTree setNodeTree:insertAtIndex:](self, "setNodeTree:insertAtIndex:", v9, v10);
  -[ICCRTree invalidateChildren](self, "invalidateChildren");
}

- (void)setNodeTree:(id)a3 insertAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  ICCRTree *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICCRTree nodes](self, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v6, a4);

  objc_msgSend(v6, "tree");
  v8 = (ICCRTree *)objc_claimAutoreleasedReturnValue();

  if (v8 != self)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v6, "children", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      v13 = a4 + 1;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          -[ICCRTree setNodeTree:insertAtIndex:](self, "setNodeTree:insertAtIndex:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), v13);
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v6, "tree");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeNode:", v6);

    objc_msgSend(v6, "setTree:", self);
  }

}

- (void)moveNode:(id)a3 toParent:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  ICCRTree *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v8 = a4;
  objc_msgSend(v15, "tree");
  v9 = (ICCRTree *)objc_claimAutoreleasedReturnValue();

  if (v9 != self)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Can only move node from this tree."), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v10 = -[ICCRTree insertIndexForNode:childIndex:](self, "insertIndexForNode:childIndex:", v8, a5);
  -[ICCRTree nodes](self, "nodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v15);

  -[ICCRTree nodes](self, "nodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moveObject:toIndex:", v15, (_QWORD)((__PAIR128__(v10, v12) - v10) >> 64));

  objc_msgSend(v15, "setParent:", v8);
  -[ICCRTree invalidateChildren](self, "invalidateChildren");

}

- (void)removeNode:(id)a3
{
  id v4;
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

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "children", 0);
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
        -[ICCRTree removeNode:](self, "removeNode:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[ICCRTree nodes](self, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v4);

  -[ICCRTree invalidateChildren](self, "invalidateChildren");
}

- (void)setDocument:(id)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCRTree;
  -[ICCRObject setDocument:](&v6, sel_setDocument_, a3);
  -[ICCRTree nodes](self, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__ICCRTree_setDocument___block_invoke;
  v5[3] = &unk_1E76C8FA8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateWithBlock:", v5);

}

uint64_t __24__ICCRTree_setDocument___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTree:", *(_QWORD *)(a1 + 32));
}

- (void)mergeWith:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICCRTree;
  -[ICCRObject mergeWith:](&v4, sel_mergeWith_, a3);
  -[ICCRTree invalidateChildren](self, "invalidateChildren");
}

- (void)invalidateChildren
{
  id v2;

  -[ICCRTree nodes](self, "nodes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateWithBlock:", &__block_literal_global_12);

}

uint64_t __30__ICCRTree_invalidateChildren__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setChildren:", 0);
}

- (void)computeChildren
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ICCRTree *v9;

  -[ICCRTree root](self, "root");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRTree nodes](self, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateWithBlock:", &__block_literal_global_62);

  -[ICCRTree nodes](self, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__ICCRTree_computeChildren__block_invoke_2;
  v7[3] = &unk_1E76C9058;
  v8 = v3;
  v9 = self;
  v6 = v3;
  objc_msgSend(v5, "enumerateWithBlock:", v7);

}

void __27__ICCRTree_computeChildren__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;

  v2 = (objc_class *)MEMORY[0x1E0C99DE8];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "setChildren:", v4);

}

void __27__ICCRTree_computeChildren__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "parentReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v14, "parent");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(v14, "parent");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v14)
      {

      }
      else
      {
        v7 = objc_msgSend(v14, "isLoopNode");

        if ((v7 & 1) == 0)
        {
          objc_msgSend(v14, "parent");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "children");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v14);

LABEL_14:
          goto LABEL_15;
        }
      }
    }
    objc_msgSend(v14, "parent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != *(void **)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "nodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "parent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "containsObject:", v12) & 1) != 0)
      {
        v13 = objc_msgSend(v14, "isLoopNode");

        if ((v13 & 1) == 0)
          goto LABEL_15;
        goto LABEL_13;
      }

    }
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);
    goto LABEL_14;
  }
LABEL_15:

}

@end
