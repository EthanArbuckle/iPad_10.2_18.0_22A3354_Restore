@implementation GKGraphNode

- (void)cGraphNode
{
  return self->_cGraphNode;
}

- (void)makeCGraphNode
{
  GKCGraphNode *v2;

  v2 = (GKCGraphNode *)operator new();
  GKCGraphNode::GKCGraphNode(v2);
  return v2;
}

- (void)deleteCGraphNode
{
  void *cGraphNode;

  cGraphNode = self->_cGraphNode;
  if (cGraphNode)
    (*(void (**)(void *, SEL))(*(_QWORD *)cGraphNode + 8))(cGraphNode, a2);
  self->_cGraphNode = 0;
}

- (NSArray)connectedNodes
{
  return (NSArray *)self->_connectedNodes;
}

- (id)mutConnectedNodes
{
  return self->_connectedNodes;
}

+ (id)node
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (GKGraphNode)init
{
  GKGraphNode *v2;
  uint64_t v3;
  NSMutableArray *connectedNodes;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKGraphNode;
  v2 = -[GKGraphNode init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    connectedNodes = v2->_connectedNodes;
    v2->_connectedNodes = (NSMutableArray *)v3;

    v5 = -[GKGraphNode makeCGraphNode](v2, "makeCGraphNode");
    v2->_cGraphNode = (void *)v5;
    objc_storeWeak((id *)(v5 + 56), v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[GKGraphNode deleteCGraphNode](self, "deleteCGraphNode");
  v3.receiver = self;
  v3.super_class = (Class)GKGraphNode;
  -[GKGraphNode dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addConnection:(id)a3 bidirectional:(BOOL)a4
{
  id v6;

  v6 = a3;
  GKCGraphNode::addConnectionToNode((id *)self->_cGraphNode, (id *)objc_msgSend(v6, "cGraphNode"), a4);

}

- (void)addConnectionsToNodes:(NSArray *)nodes bidirectional:(BOOL)bidirectional
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = nodes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        GKCGraphNode::addConnectionToNode((id *)self->_cGraphNode, (id *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "cGraphNode", (_QWORD)v10), bidirectional);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)removeConnection:(id)a3
{
  id v4;

  v4 = a3;
  GKCGraphNode::removeConnectionToNode((id *)self->_cGraphNode, (id *)objc_msgSend(v4, "cGraphNode"), 0);

}

- (void)removeConnectionsToNodes:(NSArray *)nodes bidirectional:(BOOL)bidirectional
{
  int v6;
  unint64_t v7;
  void *v8;
  NSArray *v9;

  v9 = nodes;
  v6 = -[NSArray count](v9, "count");
  if (v6 >= 1)
  {
    v7 = v6 + 1;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", (v7 - 2));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      GKCGraphNode::removeConnectionToNode((id *)self->_cGraphNode, (id *)objc_msgSend(v8, "cGraphNode"), bidirectional);

      --v7;
    }
    while (v7 > 1);
  }

}

- (float)estimatedCostToNode:(GKGraphNode *)node
{
  return 0.0;
}

- (float)costToNode:(GKGraphNode *)node
{
  return 1.0;
}

- (NSArray)findPathToNode:(GKGraphNode *)goalNode
{
  GKGraphNode *v4;
  void *v5;
  char *v6;
  id WeakRetained;
  void *__p;
  char *v10;
  uint64_t v11;

  v4 = goalNode;
  __p = 0;
  v10 = 0;
  v11 = 0;
  GKFindPath((unint64_t)-[GKGraphNode cGraphNode](self, "cGraphNode"), (uint64_t *)-[GKGraphNode cGraphNode](v4, "cGraphNode"), (char **)&__p);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (v10 - (_BYTE *)__p) >> 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (char *)__p;
  if (__p != v10)
  {
    do
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)v6 + 56));
      objc_msgSend(v5, "addObject:", WeakRetained);

      v6 += 8;
    }
    while (v6 != v10);
  }
  if (__p)
  {
    v10 = (char *)__p;
    operator delete(__p);
  }

  return (NSArray *)v5;
}

- (NSArray)findPathFromNode:(GKGraphNode *)startNode
{
  -[GKGraphNode findPathFromNode:](startNode, "findPathFromNode:", self);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (GKGraphNode)initWithCoder:(id)a3
{
  id v4;
  GKGraphNode *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[GKGraphNode init](self, "init");
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);

    objc_msgSend(v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_connectedNodes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGraphNode addConnectionsToNodes:bidirectional:](v5, "addConnectionsToNodes:bidirectional:", v9, 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_obstacle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_extrudedObstacle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      *((_QWORD *)v5->_cGraphNode + 4) = objc_msgSend(v10, "cPolygonObstacle");
    if (v11)
      *((_QWORD *)v5->_cGraphNode + 5) = objc_msgSend(v11, "cPolygonObstacle");
    *((_DWORD *)v5->_cGraphNode + 12) = objc_msgSend(v4, "decodeIntForKey:", CFSTR("_vertIndex"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _QWORD *cGraphNode;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", self->_connectedNodes, CFSTR("_connectedNodes"));
  cGraphNode = self->_cGraphNode;
  v5 = cGraphNode[4];
  if (v5)
  {
    objc_msgSend(v7, "encodeObject:forKey:", *(_QWORD *)(v5 + 64), CFSTR("_obstacle"));
    cGraphNode = self->_cGraphNode;
  }
  v6 = cGraphNode[5];
  if (v6)
  {
    objc_msgSend(v7, "encodeObject:forKey:", *(_QWORD *)(v6 + 64), CFSTR("_extrudedObstacle"));
    cGraphNode = self->_cGraphNode;
  }
  objc_msgSend(v7, "encodeInt:forKey:", *((unsigned int *)cGraphNode + 12), CFSTR("_vertIndex"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedNodes, 0);
}

@end
