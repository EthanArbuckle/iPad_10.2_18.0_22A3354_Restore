@implementation AFTreeNode

- (AFTreeNode)init
{
  AFTreeNode *v2;
  uint64_t v3;
  NSMutableArray *childNodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFTreeNode;
  v2 = -[AFTreeNode init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    childNodes = v2->_childNodes;
    v2->_childNodes = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)_appendDescriptionToString:(id)a3 withIndentation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  AFTreeNode *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "appendString:", v7);
  v8 = objc_opt_class();
  -[AFTreeNode item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFTreeNode _childNodes](self, "_childNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("<%@ %p: item=%@; %lu children=("), v8, self, v9, objc_msgSend(v10, "count"));

  -[AFTreeNode _childNodes](self, "_childNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("  "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = self;
    v15 = -[AFTreeNode countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
          objc_msgSend(v6, "appendString:", CFSTR("\n"));
          objc_msgSend(v19, "_appendDescriptionToString:withIndentation:", v6, v13);
          ++v18;
        }
        while (v16 != v18);
        v16 = -[AFTreeNode countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

    objc_msgSend(v6, "appendString:", v7);
    objc_msgSend(v6, "appendString:", CFSTR("\n)>"));

  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR("none)>"));
  }

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFTreeNode _appendDescriptionToString:withIndentation:](self, "_appendDescriptionToString:withIndentation:", v3, &stru_1E3A37708);
  return v3;
}

- (id)indexPathFromAncestorNode:(id)a3
{
  AFTreeNode *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = (AFTreeNode *)a3;
  if (self == v4)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
  }
  else
  {
    -[AFTreeNode parentNode](self, "parentNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot generate an index path relative to node %@, which isn't an ancestor"), v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v14);
    }
    -[AFTreeNode parentNode](self, "parentNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathFromAncestorNode:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFTreeNode parentNode](self, "parentNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathByAddingIndex:", objc_msgSend(v8, "indexOfChildNode:", self));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)absoluteIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AFTreeNode parentNode](self, "parentNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AFTreeNode parentNode](self, "parentNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFTreeNode parentNode](self, "parentNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathByAddingIndex:", objc_msgSend(v6, "indexOfChildNode:", self));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
  }
  return v7;
}

- (BOOL)containsNodeAtIndexPath:(id)a3
{
  id v5;
  AFTreeNode *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFTreeNode.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relativeIndexPath"));

  }
  v6 = self;
  if (objc_msgSend(v5, "length"))
  {
    v7 = 0;
    while (1)
    {
      v8 = objc_msgSend(v5, "indexAtPosition:", v7);
      v9 = -[AFTreeNode numberOfChildNodes](v6, "numberOfChildNodes");
      v10 = v8 < v9;
      if (v8 >= v9)
        break;
      -[AFTreeNode childNodeAtIndex:](v6, "childNodeAtIndex:", v8);
      v11 = objc_claimAutoreleasedReturnValue();

      ++v7;
      v6 = (AFTreeNode *)v11;
      if (v7 >= objc_msgSend(v5, "length"))
      {
        v10 = 1;
        v6 = (AFTreeNode *)v11;
        break;
      }
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)nodeAtIndexPath:(id)a3
{
  id v5;
  AFTreeNode *v6;
  unint64_t v7;
  AFTreeNode *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFTreeNode.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relativeIndexPath"));

  }
  v6 = self;
  if (objc_msgSend(v5, "length"))
  {
    v7 = 0;
    do
    {
      -[AFTreeNode childNodeAtIndex:](v6, "childNodeAtIndex:", objc_msgSend(v5, "indexAtPosition:", v7));
      v8 = (AFTreeNode *)objc_claimAutoreleasedReturnValue();

      ++v7;
      v6 = v8;
    }
    while (v7 < objc_msgSend(v5, "length"));
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (id)indexPathOfNodeWithItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned int (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  unsigned int (**v13)(_QWORD, _QWORD);
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9502;
  v21 = __Block_byref_object_dispose__9503;
  v22 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__AFTreeNode_indexPathOfNodeWithItem___block_invoke;
  v15[3] = &unk_1E3A2F138;
  v6 = v4;
  v16 = v6;
  v7 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1A1AC0C3C](v15);
  if (((unsigned int (**)(_QWORD, AFTreeNode *))v7)[2](v7, self))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
    v9 = (void *)v18[5];
    v18[5] = (uint64_t)v8;
  }
  else
  {
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __38__AFTreeNode_indexPathOfNodeWithItem___block_invoke_2;
    v12[3] = &unk_1E3A2F160;
    v13 = v7;
    v14 = &v17;
    v12[4] = self;
    -[AFTreeNode enumerateDescendentNodesUsingBlock:](self, "enumerateDescendentNodesUsingBlock:", v12);
    v9 = v13;
  }

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (void)removeFromParentNode
{
  id v3;

  -[AFTreeNode parentNode](self, "parentNode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeChildNode:", self);

}

- (int64_t)numberOfChildNodes
{
  void *v2;
  int64_t v3;

  -[AFTreeNode _childNodes](self, "_childNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)indexOfChildNode:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[AFTreeNode _childNodes](self, "_childNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)childNodeAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[AFTreeNode _childNodes](self, "_childNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)lastChildNode
{
  void *v2;
  void *v3;

  -[AFTreeNode _childNodes](self, "_childNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)insertChildNode:(id)a3 atIndex:(int64_t)a4
{
  AFTreeNode *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  AFTreeNode *v17;
  SEL v18;

  v7 = (AFTreeNode *)a3;
  if (v7 == self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("AFTreeNode.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("child != self"));

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFTreeNode parentNode](self, "parentNode");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      objc_msgSend(v8, "addObject:", v10);
      objc_msgSend(v10, "parentNode");
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    while (v11);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__AFTreeNode_insertChildNode_atIndex___block_invoke;
  v15[3] = &unk_1E3A2F188;
  v17 = self;
  v18 = a2;
  v16 = v8;
  v12 = v8;
  -[AFTreeNode enumerateDescendentNodesUsingBlock:](v7, "enumerateDescendentNodesUsingBlock:", v15);
  -[AFTreeNode removeFromParentNode](v7, "removeFromParentNode");
  -[AFTreeNode _childNodes](self, "_childNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertObject:atIndex:", v7, a4);

  -[AFTreeNode _setParentNode:](v7, "_setParentNode:", self);
}

- (void)addChildNode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFTreeNode _childNodes](self, "_childNodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AFTreeNode insertChildNode:atIndex:](self, "insertChildNode:atIndex:", v4, objc_msgSend(v5, "count"));

}

- (void)removeChildNodeAtIndex:(int64_t)a3
{
  void *v6;
  AFTreeNode *v7;
  void *v8;
  void *v9;
  id v10;

  -[AFTreeNode _childNodes](self, "_childNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "parentNode");
  v7 = (AFTreeNode *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFTreeNode.m"), 194, CFSTR("Cannot remove a child if we're not its parent"));

  }
  -[AFTreeNode _childNodes](self, "_childNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", a3);

  objc_msgSend(v10, "_setParentNode:", 0);
}

- (void)removeChildNode:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  -[AFTreeNode _childNodes](self, "_childNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFTreeNode.m"), 203, CFSTR("Cannot remove a child that we don't contain"));

  }
  -[AFTreeNode removeChildNodeAtIndex:](self, "removeChildNodeAtIndex:", v7);
}

- (void)replaceChildNodeAtIndex:(int64_t)a3 withNode:(id)a4
{
  id v6;

  v6 = a4;
  -[AFTreeNode removeChildNodeAtIndex:](self, "removeChildNodeAtIndex:", a3);
  -[AFTreeNode insertChildNode:atIndex:](self, "insertChildNode:atIndex:", v6, a3);

}

- (void)enumerateChildNodesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a4;
  if (v7)
  {
    -[AFTreeNode _childNodes](self, "_childNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__AFTreeNode_enumerateChildNodesWithOptions_usingBlock___block_invoke;
    v8[3] = &unk_1E3A2F1B0;
    v9 = v7;
    objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", a3, v8);

  }
}

- (void)enumerateChildNodesUsingBlock:(id)a3
{
  -[AFTreeNode enumerateChildNodesWithOptions:usingBlock:](self, "enumerateChildNodesWithOptions:usingBlock:", 0, a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[AFTreeNode _childNodes](self, "_childNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (void)enumerateDescendentNodesUsingBlock:(id)a3
{
  void (**v4)(id, AFTreeNode *, _BYTE *);
  AFQueue *v5;
  void *v6;
  void *v7;
  AFTreeNode *v8;
  void *v9;
  char v10;

  v4 = (void (**)(id, AFTreeNode *, _BYTE *))a3;
  if (v4)
  {
    v10 = 0;
    v5 = objc_alloc_init(AFQueue);
    -[AFTreeNode _childNodes](self, "_childNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFQueue enqueueObjects:](v5, "enqueueObjects:", v6);

    do
    {
      -[AFQueue frontObject](v5, "frontObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        break;
      -[AFQueue dequeueObject](v5, "dequeueObject");
      v8 = (AFTreeNode *)objc_claimAutoreleasedReturnValue();
      if (v8 != self)
      {
        v4[2](v4, v8, &v10);
        -[AFTreeNode _childNodes](v8, "_childNodes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFQueue enqueueObjects:](v5, "enqueueObjects:", v9);

      }
    }
    while (!v10);

  }
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong(&self->_item, a3);
}

- (AFTreeNode)parentNode
{
  return (AFTreeNode *)objc_loadWeakRetained((id *)&self->_parentNode);
}

- (void)_setParentNode:(id)a3
{
  objc_storeWeak((id *)&self->_parentNode, a3);
}

- (NSMutableArray)_childNodes
{
  return self->_childNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childNodes, 0);
  objc_destroyWeak((id *)&self->_parentNode);
  objc_storeStrong(&self->_item, 0);
}

uint64_t __56__AFTreeNode_enumerateChildNodesWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __38__AFTreeNode_insertChildNode_atIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("AFTreeNode.m"), 178, CFSTR("Attempt to create cycle"));

  }
}

uint64_t __38__AFTreeNode_indexPathOfNodeWithItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == *(void **)(a1 + 32))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  return v6;
}

void __38__AFTreeNode_indexPathOfNodeWithItem___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    objc_msgSend(v8, "indexPathFromAncestorNode:", a1[4]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *a3 = 1;
  }

}

+ (id)absoluteIndexPathsForTreeNodes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "absoluteIndexPath", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

@end
