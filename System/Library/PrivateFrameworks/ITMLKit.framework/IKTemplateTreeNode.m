@implementation IKTemplateTreeNode

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[IKTemplateTreeNode nodeName](self, "nodeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTemplateTreeNode styleOverrides](self, "styleOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithNodeName:styleOverrides:parentNode:", v5, v6, 0);

  v8 = (void *)MEMORY[0x1E0C99E08];
  -[IKTemplateTreeNode childNodes](self, "childNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[IKTemplateTreeNode childNodes](self, "childNodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        -[IKTemplateTreeNode childNodes](self, "childNodes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id *)objc_msgSend(v17, "copy");

        objc_storeWeak(v18 + 1, v7);
        objc_msgSend(v10, "setObject:forKey:", v18, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(v7, "setChildNodes:", v10);
  objc_msgSend(v7, "setStyleComposer:", 0);

  return v7;
}

- (IKTemplateTreeNode)initWithNodeName:(id)a3 styleOverrides:(id)a4 parentNode:(id)a5
{
  id v8;
  id v9;
  id v10;
  IKTemplateTreeNode *v11;
  uint64_t v12;
  NSString *nodeName;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IKTemplateTreeNode;
  v11 = -[IKTemplateTreeNode init](&v15, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "ik_sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    nodeName = v11->_nodeName;
    v11->_nodeName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_styleOverrides, a4);
    objc_storeWeak((id *)&v11->_parentNode, v10);
  }

  return v11;
}

- (void)setChildNodes:(id)a3
{
  NSDictionary *v4;
  NSDictionary *childNodes;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = (NSDictionary *)objc_msgSend(v6, "copy");
    childNodes = self->_childNodes;
    self->_childNodes = v4;
  }
  else
  {
    childNodes = self->_childNodes;
    self->_childNodes = 0;
  }

}

- (IKTemplateTreeNode)parentNode
{
  return (IKTemplateTreeNode *)objc_loadWeakRetained((id *)&self->_parentNode);
}

- (NSString)nodeName
{
  return self->_nodeName;
}

- (IKViewElementStyle)styleOverrides
{
  return self->_styleOverrides;
}

- (NSDictionary)childNodes
{
  return self->_childNodes;
}

- (IKViewElementStyleComposer)styleComposer
{
  return self->_styleComposer;
}

- (void)setStyleComposer:(id)a3
{
  objc_storeStrong((id *)&self->_styleComposer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleComposer, 0);
  objc_storeStrong((id *)&self->_childNodes, 0);
  objc_storeStrong((id *)&self->_styleOverrides, 0);
  objc_storeStrong((id *)&self->_nodeName, 0);
  objc_destroyWeak((id *)&self->_parentNode);
}

@end
