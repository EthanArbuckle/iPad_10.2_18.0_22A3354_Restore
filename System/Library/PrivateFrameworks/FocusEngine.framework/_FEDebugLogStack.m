@implementation _FEDebugLogStack

- (_FEDebugLogStack)init
{
  _FEDebugLogStack *v2;
  void *v3;
  uint64_t v4;
  NSMutableArray *stack;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_FEDebugLogStack;
  v2 = -[_FEDebugLogStack init](&v7, sel_init);
  if (v2)
  {
    +[_FEDebugLogNode rootNode](_FEDebugLogNode, "rootNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    stack = v2->_stack;
    v2->_stack = (NSMutableArray *)v4;

  }
  return v2;
}

- (id)_topNode
{
  return (id)-[NSMutableArray lastObject](self->_stack, "lastObject");
}

- (_FEDebugLogNode)rootNode
{
  return (_FEDebugLogNode *)-[NSMutableArray firstObject](self->_stack, "firstObject");
}

- (void)addMessage:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEDebugLogTree.m"), 327, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message != nil && [message isKindOfClass:[_FEDebugLogMessage class]]"));

  }
  -[_FEDebugLogStack _topNode](self, "_topNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMessage:", v7);

}

- (void)pushNode:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEDebugLogTree.m"), 333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node != nil && [node isKindOfClass:[_FEDebugLogNode class]]"));

  }
  -[_FEDebugLogStack _topNode](self, "_topNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMessage:", v7);

  -[NSMutableArray addObject:](self->_stack, "addObject:", v7);
}

- (id)popNode
{
  void *v4;
  void *v6;

  if ((unint64_t)-[NSMutableArray count](self->_stack, "count") <= 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEDebugLogTree.m"), 340, CFSTR("Unable to pop the last node on the stack. This indicates an imbalance in push and pop calls."));

  }
  -[_FEDebugLogStack _topNode](self, "_topNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");
  return v4;
}

- (void)performWithPushedNode:(id)a3 block:(id)a4
{
  void (**v7)(_QWORD);
  id v8;
  void (**v9)(_QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_class *v16;
  void *v17;
  __CFString *v18;
  id v19;
  void *v20;
  objc_class *v21;
  void *v22;
  __CFString *v23;
  id v24;

  v24 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = v24;
  v9 = v7;
  if (v24)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEDebugLogTree.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node != nil"));

    v8 = 0;
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEDebugLogTree.m"), 349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

  v8 = v24;
LABEL_3:
  -[_FEDebugLogStack pushNode:](self, "pushNode:", v8);
  v9[2](v9);
  -[_FEDebugLogStack popNode](self, "popNode");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 != v24)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v24;
    if (v24)
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p>"), v17, v14);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = CFSTR("(nil)");
    }

    v19 = v10;
    if (v19)
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p>"), v22, v19);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = CFSTR("(nil)");
    }

    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEDebugLogTree.m"), 353, CFSTR("Imbalanced calls to push and pop. Expected node %@ to be popped but got %@."), v18, v23);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
}

@end
