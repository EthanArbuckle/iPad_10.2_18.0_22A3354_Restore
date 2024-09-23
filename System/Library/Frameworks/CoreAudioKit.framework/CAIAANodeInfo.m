@implementation CAIAANodeInfo

- (CAIAANodeInfo)init
{
  CAIAANodeInfo *v2;
  CAIAANodeInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAIAANodeInfo;
  v2 = -[CAIAANodeInfo init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CAIAANodeInfo createNodeList](v2, "createNodeList");
  return v3;
}

- (id)nodeWithNodeInfo:(id)a3
{
  uint64_t v5;
  double v6;
  CANodeButton *v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "userInterfaceIdiom"))
  {
    v5 = 0x4053000000000000;
  }
  else
  {
    v5 = 0x404E000000000000;
  }
  v6 = *(double *)&v5;
  v7 = +[CANodeButton buttonWithType:](CANodeButton, "buttonWithType:", 0);
  -[CANodeButton setUrl:](v7, "setUrl:", objc_msgSend(a3, "url"));
  -[CANodeButton setTitle:forState:](v7, "setTitle:forState:", CFSTR("Node"), 0);
  -[CANodeButton setTitleColor:forState:](v7, "setTitleColor:forState:", self->labelColor, 0);
  -[CANodeButton setTitleColor:forState:](v7, "setTitleColor:forState:", -[UIColor colorWithAlphaComponent:](self->labelColor, "colorWithAlphaComponent:", 0.75), 2);
  -[CANodeButton setImage:forState:](v7, "setImage:forState:", objc_msgSend(a3, "icon"), 0);
  -[CANodeButton setFrame:](v7, "setFrame:", 0.0, 0.0, v6 + 12.0, v6 + 24.0);
  objc_msgSend((id)objc_msgSend((id)-[CANodeButton imageView](v7, "imageView"), "layer"), "setCornerRadius:", 8.0);
  objc_msgSend((id)-[CANodeButton titleLabel](v7, "titleLabel"), "setFont:", objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0));
  -[CANodeButton setContentMode:](v7, "setContentMode:", 2);
  -[CANodeButton setHasLabel:](v7, "setHasLabel:", 0);
  return v7;
}

- (void)refresh
{
  NSMutableArray *nodeList;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  nodeList = self->nodeList;
  if (!nodeList)
  {
    nodeList = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->nodeList = nodeList;
  }
  -[NSMutableArray removeAllObjects](nodeList, "removeAllObjects");
  v4 = (void *)objc_msgSend(MEMORY[0x24BE0A868], "sharedInstance");
  LODWORD(v5) = 1117257728;
  v6 = (void *)objc_msgSend(v4, "getApps:", v5);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12 = -[CAIAANodeInfo nodeWithNodeInfo:](self, "nodeWithNodeInfo:", v11);
        if (objc_msgSend(v11, "isCurrentApp"))
        {
          objc_msgSend(v12, "setEnabled:", 0);
LABEL_12:
          -[NSMutableArray addObject:](self->nodeList, "addObject:", v12);
          continue;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_msgSend((id)objc_msgSend(v11, "valueForKey:", CFSTR("isForeground")), "BOOLValue") & 1) == 0)
        {
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
}

- (unint64_t)numNodes
{
  return -[NSMutableArray count](self->nodeList, "count");
}

- (void)setLabelColor:(id)a3
{
  NSMutableArray *nodeList;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  self->labelColor = (UIColor *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  nodeList = self->nodeList;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodeList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(nodeList);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "setTitleColor:forState:", a3, 0);
        objc_msgSend(v9, "setTitleColor:forState:", objc_msgSend(a3, "colorWithAlphaComponent:", 0.75), 2);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodeList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (UIColor)labelColor
{
  return self->labelColor;
}

- (id)nodeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->nodeList, "objectAtIndexedSubscript:", a3);
}

@end
