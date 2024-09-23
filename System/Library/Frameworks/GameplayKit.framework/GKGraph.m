@implementation GKGraph

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)makeCGraph
{
  GKCGraph *v2;

  v2 = (GKCGraph *)operator new();
  GKCGraph::GKCGraph(v2);
  return v2;
}

- (void)cGraph
{
  return self->_cGraph;
}

- (NSArray)nodes
{
  return (NSArray *)self->_nodes;
}

- (id)nodesMut
{
  return self->_nodes;
}

+ (id)graph
{
  return objc_alloc_init(GKGraph);
}

- (void)dealloc
{
  void *cGraph;
  objc_super v4;

  cGraph = self->_cGraph;
  if (cGraph)
    (*(void (**)(void *, SEL))(*(_QWORD *)cGraph + 8))(cGraph, a2);
  v4.receiver = self;
  v4.super_class = (Class)GKGraph;
  -[GKGraph dealloc](&v4, sel_dealloc);
}

- (GKGraph)init
{
  GKGraph *v2;
  uint64_t v3;
  NSMutableArray *nodes;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKGraph;
  v2 = -[GKGraph init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableArray *)v3;

    v5 = -[GKGraph makeCGraph](v2, "makeCGraph");
    v2->_cGraph = (void *)v5;
    objc_storeWeak((id *)(v5 + 32), v2);
  }
  return v2;
}

+ (GKGraph)graphWithNodes:(NSArray *)nodes
{
  NSArray *v3;
  GKGraph *v4;

  v3 = nodes;
  v4 = -[GKGraph initWithNodes:]([GKGraph alloc], "initWithNodes:", v3);

  return v4;
}

- (GKGraph)initWithNodes:(NSArray *)nodes
{
  NSArray *v4;
  GKGraph *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = nodes;
  v5 = -[GKGraph init](self, "init");
  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          GKCGraph::addNode((GKCGraph *)v5->_cGraph, (id *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "cGraphNode", (_QWORD)v11));
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  return v5;
}

- (void)connectNodeToLowestCostNode:(GKGraphNode *)node bidirectional:(BOOL)bidirectional
{
  GKGraphNode *v6;

  v6 = node;
  GKCGraph::connectNodeToLowestCostNode((GKCGraph *)self->_cGraph, (id *)-[GKGraphNode cGraphNode](v6, "cGraphNode"), bidirectional);

}

- (void)removeNodes:(NSArray *)nodes
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = nodes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(void *, uint64_t))(*(_QWORD *)self->_cGraph + 16))(self->_cGraph, objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cGraphNode", (_QWORD)v8));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)addNodes:(NSArray *)nodes
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = nodes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        GKCGraph::addNode((GKCGraph *)self->_cGraph, (id *)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cGraphNode", (_QWORD)v8));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSArray)findPathFromNode:(GKGraphNode *)startNode toNode:(GKGraphNode *)endNode
{
  -[GKGraphNode findPathToNode:](startNode, "findPathToNode:", endNode);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (GKGraph)initWithCoder:(id)a3
{
  id v4;
  GKGraph *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSMutableArray *nodes;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSMutableDictionary *info;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  _QWORD v34[8];

  v34[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[GKGraph initWithNodes:](self, "initWithNodes:", MEMORY[0x24BDBD1A8]);
  if (v5)
  {
    v26 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v34[2] = objc_opt_class();
    v34[3] = objc_opt_class();
    v34[4] = objc_opt_class();
    v34[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObjectsFromArray:", v6);

    objc_msgSend(v4, "allowedClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "unionSet:", v7);

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v10, CFSTR("_nodes"), &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v32;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v11;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v25, "count"));
      v13 = objc_claimAutoreleasedReturnValue();
      nodes = v5->_nodes;
      v5->_nodes = (NSMutableArray *)v13;

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v15 = (NSMutableArray *)v25;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v29;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(v15);
            v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[NSMutableArray addObject:](v5->_nodes, "addObject:", v19);
            ++v18;
          }
          while (v16 != v18);
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v16);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v20 = objc_claimAutoreleasedReturnValue();
      v15 = v5->_nodes;
      v5->_nodes = (NSMutableArray *)v20;
    }

    v27 = v12;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v26, CFSTR("_info"), &v27);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v27;

    info = v5->__info;
    v5->__info = (NSMutableDictionary *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_nodes, CFSTR("_nodes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->__info, CFSTR("_info"));

}

- (id)copy
{
  return -[GKGraph copyWithZone:](self, "copyWithZone:", MEMORY[0x22E2A4F5C](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableDictionary)_info
{
  return self->__info;
}

- (void)set_info:(id)a3
{
  objc_storeStrong((id *)&self->__info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__info, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
