@implementation ICCRTreeNode

- (ICCRTreeNode)initWithValue:(id)a3 parent:(id)a4 tree:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ICCRTreeNode *v12;
  ICCRWeakReference *v13;
  void *v14;
  ICCRWeakReference *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)ICCRTreeNode;
  v12 = -[ICCRObject initWithDocument:identity:](&v17, sel_initWithDocument_identity_, 0, v11);

  if (v12)
  {
    objc_storeWeak((id *)&v12->_tree, v10);
    -[ICCRTreeNode setValue:](v12, "setValue:", v8);
    if (v9)
    {
      v13 = [ICCRWeakReference alloc];
      objc_msgSend(v10, "document");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[ICCRWeakReference initWithContents:document:](v13, "initWithContents:document:", v9, v14);
      -[ICCRTreeNode setParentRef:](v12, "setParentRef:", v15);

    }
  }

  return v12;
}

+ (id)CRProperties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("value");
  +[ICCRConstant constant](ICCRConstant, "constant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("parentRef");
  v7[0] = v2;
  +[ICCRRegister registerWithType:contents:](ICCRRegister, "registerWithType:contents:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)parentReference
{
  void *v2;
  void *v3;
  void *v4;

  -[ICCRObject fields](self, "fields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("parentRef"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ICCRTreeNode)parent
{
  void *v2;
  void *v3;

  -[ICCRTreeNode parentReference](self, "parentReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCRTreeNode *)v3;
}

- (void)setParent:(id)a3
{
  id v4;
  ICCRWeakReference *v5;
  void *v6;
  ICCRWeakReference *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = [ICCRWeakReference alloc];
  -[ICCRTreeNode tree](self, "tree");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICCRWeakReference initWithContents:document:](v5, "initWithContents:document:", v4, v6);

  -[ICCRObject fields](self, "fields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("parentRef"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContents:", v7);

}

- (BOOL)isInLoop
{
  uint64_t v3;
  ICCRTreeNode *v4;
  BOOL i;
  ICCRTreeNode *v6;

  -[ICCRTreeNode parent](self, "parent");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (ICCRTreeNode *)v3;
  for (i = v3 != 0; v4 != self && v4; i = v4 != 0)
  {
    v6 = v4;
    -[ICCRTreeNode parent](v4, "parent");
    v4 = (ICCRTreeNode *)objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (BOOL)isLoopNode
{
  ICCRTreeNode *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (-[ICCRTreeNode isInLoop](self, "isInLoop"))
  {
    -[ICCRTreeNode parent](self, "parent");
    v3 = (ICCRTreeNode *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = -1;
      while (1)
      {
        -[ICCRTreeNode tree](self, "tree");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "nodes");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "indexOfObject:", v3);

        if (v4 >= v7)
          v4 = v7;
        if (v3 == self)
          break;
        -[ICCRTreeNode parent](v3, "parent");
        v8 = objc_claimAutoreleasedReturnValue();

        v3 = (ICCRTreeNode *)v8;
        if (!v8)
          return (char)v3;
      }
      -[ICCRTreeNode tree](self, "tree");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nodes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = v4 == objc_msgSend(v10, "indexOfObject:", self);

    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (NSArray)children
{
  NSArray *children;
  void *v4;
  NSArray *v5;

  children = self->_children;
  if (!children)
  {
    -[ICCRTreeNode tree](self, "tree");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "computeChildren");

    children = self->_children;
  }
  if (children)
    v5 = children;
  else
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v5;
}

- (void)insertNode:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[ICCRTreeNode tree](self, "tree");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v11);

  -[ICCRTreeNode tree](self, "tree");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "moveNode:toParent:atIndex:", v11, self, a4);
  else
    objc_msgSend(v9, "insertNode:inParent:atIndex:", v11, self, a4);

}

- (id)insertNodeWithValue:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[ICCRTreeNode tree](self, "tree");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertNodeWithValue:inParent:atIndex:", v6, self, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)moveNode:(id)a3 toIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[ICCRTreeNode tree](self, "tree");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moveNode:toParent:atIndex:", v6, self, a4);

}

- (void)removeNode:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICCRTreeNode children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if (v5)
  {
    -[ICCRTreeNode tree](self, "tree");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeNode:", v7);

  }
}

- (ICCRTree)tree
{
  return (ICCRTree *)objc_loadWeakRetained((id *)&self->_tree);
}

- (void)setTree:(id)a3
{
  objc_storeWeak((id *)&self->_tree, a3);
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_tree);
}

@end
