@implementation NATreeNodeDeepNodeEnumerator

- (NATreeNodeDeepNodeEnumerator)initWithNode:(id)a3
{
  id v4;
  NATreeNodeDeepNodeEnumerator *v5;
  uint64_t v6;
  NATreeNode *node;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NATreeNodeDeepNodeEnumerator;
  v5 = -[NATreeNodeDeepNodeEnumerator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    node = v5->_node;
    v5->_node = (NATreeNode *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NATreeNodeDeepNodeEnumerator *v4;
  void *v5;
  NATreeNodeDeepNodeEnumerator *v6;

  v4 = +[NATreeNodeDeepNodeEnumerator allocWithZone:](NATreeNodeDeepNodeEnumerator, "allocWithZone:", a3);
  -[NATreeNodeDeepNodeEnumerator node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NATreeNodeDeepNodeEnumerator initWithNode:](v4, "initWithNode:", v5);

  return v6;
}

- (id)nextObject
{
  NSMutableArray *enumeratorStack;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;

  enumeratorStack = self->_enumeratorStack;
  if (!enumeratorStack)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[NATreeNodeDeepNodeEnumerator node](self, "node");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shallowNodeEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithObject:", v6);
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_enumeratorStack;
    self->_enumeratorStack = v7;

    enumeratorStack = self->_enumeratorStack;
  }
  if (-[NSMutableArray count](enumeratorStack, "count"))
  {
    do
    {
      -[NSMutableArray lastObject](self->_enumeratorStack, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nextObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = self->_enumeratorStack;
      if (v10)
      {
        objc_msgSend(v10, "shallowNodeEnumerator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray na_safeAddObject:](v11, "na_safeAddObject:", v12);

      }
      else
      {
        -[NSMutableArray removeLastObject](self->_enumeratorStack, "removeLastObject");
      }
    }
    while (-[NSMutableArray count](self->_enumeratorStack, "count") && !v10);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (NSArray)allObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)-[NATreeNodeDeepNodeEnumerator copy](self, "copy");
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v3, "addObject:", v6);
      objc_msgSend(v4, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NATreeNode)node
{
  return self->_node;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_enumeratorStack, 0);
}

@end
