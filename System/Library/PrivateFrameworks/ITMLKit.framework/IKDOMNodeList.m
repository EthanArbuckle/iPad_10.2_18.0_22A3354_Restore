@implementation IKDOMNodeList

+ (IKDOMNodeList)nodeListWithAppContext:(id)a3 contextNode:(id)a4 xpath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__IKDOMNodeList_nodeListWithAppContext_contextNode_xpath___block_invoke;
  v15[3] = &unk_1E9F4CE98;
  v16 = v8;
  v12 = v8;
  v13 = (void *)objc_msgSend(v11, "initWithAppContext:contextNode:evaluationBlock:", v10, v9, v15);

  return (IKDOMNodeList *)v13;
}

id __58__IKDOMNodeList_nodeListWithAppContext_contextNode_xpath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  objc_msgSend(a2, "nodesForXPath:error:", v2, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = v3;
  v6 = v5;

  if (v4)
  {
    ITMLKitGetLogObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__IKDOMNodeList_nodeListWithAppContext_contextNode_xpath___block_invoke_cold_1((uint64_t)v4, v7);

  }
  return v6;
}

- (IKDOMNodeList)initWithAppContext:(id)a3 contextNode:(id)a4 evaluationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  IKDOMNodeList *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id evaluationBlock;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)IKDOMNodeList;
  v11 = -[IKJSObject initWithAppContext:](&v18, sel_initWithAppContext_, v8);
  if (v11)
  {
    objc_msgSend(v8, "jsContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "virtualMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "managedSelf");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addManagedReference:withOwner:", v14, v11);

    objc_msgSend(v9, "addDOMObserver:", v11);
    objc_storeStrong((id *)&v11->_contextNode, a4);
    v15 = objc_msgSend(v10, "copy");
    evaluationBlock = v11->_evaluationBlock;
    v11->_evaluationBlock = (id)v15;

  }
  return v11;
}

- (int64_t)length
{
  void *v3;
  int64_t v4;

  -[IKDOMNodeList _updateNodes](self, "_updateNodes");
  -[IKDOMNodeList nodes](self, "nodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)item:(int64_t)a3
{
  void *v5;
  void *v6;

  -[IKDOMNodeList _updateNodes](self, "_updateNodes");
  if (a3 < 0 || -[IKDOMNodeList length](self, "length") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[IKDOMNodeList nodes](self, "nodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)domDidUpdateForContextNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[IKJSObject appContext](self, "appContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "virtualMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IKDOMNodeList nodes](self, "nodes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "managedSelf");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeManagedReference:withOwner:", v12, self);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[IKDOMNodeList setNodes:](self, "setNodes:", 0);
}

- (void)_updateNodes
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[IKDOMNodeList nodes](self, "nodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[IKDOMNodeList evaluationBlock](self, "evaluationBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (id)MEMORY[0x1E0C9AA60];
    if (v4)
    {
      -[IKDOMNodeList evaluationBlock](self, "evaluationBlock");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[IKDOMNodeList contextNode](self, "contextNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = (void *)v8;
      else
        v10 = v5;
      v5 = v10;

    }
    -[IKJSObject appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "jsContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "virtualMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "managedSelf", (_QWORD)v20);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addManagedReference:withOwner:", v19, self);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

    -[IKDOMNodeList setNodes:](self, "setNodes:", v14);
  }
}

- (IKDOMNode)contextNode
{
  return self->_contextNode;
}

- (void)setContextNode:(id)a3
{
  objc_storeStrong((id *)&self->_contextNode, a3);
}

- (id)evaluationBlock
{
  return self->_evaluationBlock;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong(&self->_evaluationBlock, 0);
  objc_storeStrong((id *)&self->_contextNode, 0);
}

void __58__IKDOMNodeList_nodeListWithAppContext_contextNode_xpath___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end
