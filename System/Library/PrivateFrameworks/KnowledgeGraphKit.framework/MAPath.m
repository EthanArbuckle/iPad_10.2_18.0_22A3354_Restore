@implementation MAPath

- (MAPath)init
{
  MAPath *v2;
  uint64_t v3;
  NSMutableArray *edges;
  uint64_t v5;
  NSMutableSet *nodes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MAPath;
  v2 = -[MAPath init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    edges = v2->_edges;
    v2->_edges = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableSet *)v5;

  }
  return v2;
}

- (id)description
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __21__MAPath_description__block_invoke;
  v6[3] = &unk_1E83E4DF8;
  v4 = v3;
  v7 = v4;
  -[MAPath enumerateWithBlock:](self, "enumerateWithBlock:", v6);

  return v4;
}

- (BOOL)isEqualToPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  v5 = -[MAPath nodesCount](self, "nodesCount");
  if (v5 != objc_msgSend(v4, "nodesCount")
    || (v6 = -[MAPath edgesCount](self, "edgesCount"), v6 != objc_msgSend(v4, "edgesCount")))
  {
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  if (-[MAPath nodesCount](self, "nodesCount"))
  {
    v7 = 0;
    do
    {
      -[MAPath nodeAtIndex:](self, "nodeAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nodeAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToNode:", v9);

      if ((v10 & 1) == 0)
        goto LABEL_12;
    }
    while (++v7 < -[MAPath nodesCount](self, "nodesCount"));
  }
  if (-[MAPath edgesCount](self, "edgesCount"))
  {
    v11 = 0;
    do
    {
      -[MAPath edgeAtIndex:](self, "edgeAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "edgeAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToEdge:", v13);

      if ((v14 & 1) == 0)
        break;
      ++v11;
    }
    while (v11 < -[MAPath edgesCount](self, "edgesCount"));
  }
  else
  {
    v14 = 1;
  }
LABEL_13:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_edges);
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)sourceNode
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[NSMutableArray count](self->_edges, "count"))
  {
    v3 = -[NSMutableArray count](self->_edges, "count");
    -[NSMutableArray firstObject](self->_edges, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 == 1)
    {
      objc_msgSend(v4, "sourceNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_edges, "objectAtIndex:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "commonNode:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oppositeNode:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)targetNode
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[NSMutableArray count](self->_edges, "count"))
  {
    v3 = -[NSMutableArray count](self->_edges, "count");
    -[NSMutableArray lastObject](self->_edges, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 == 1)
    {
      objc_msgSend(v4, "targetNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_edges, "objectAtIndex:", -[NSMutableArray count](self->_edges, "count") - 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "commonNode:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oppositeNode:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)nodesForLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __24__MAPath_nodesForLabel___block_invoke;
  v13 = &unk_1E83E4E20;
  v14 = v4;
  v15 = v5;
  v6 = v5;
  v7 = v4;
  -[MAPath enumerateWithBlock:](self, "enumerateWithBlock:", &v10);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v6, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)edgesForLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __24__MAPath_edgesForLabel___block_invoke;
  v13 = &unk_1E83E4E20;
  v14 = v4;
  v15 = v5;
  v6 = v5;
  v7 = v4;
  -[MAPath enumerateWithBlock:](self, "enumerateWithBlock:", &v10);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v6, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)nodeAtIndex:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  if (!a3)
  {
    -[MAPath sourceNode](self, "sourceNode");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[MAPath nodesCount](self, "nodesCount") - 1 != a3)
  {
    if (-[MAPath nodesCount](self, "nodesCount") <= a3)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MAPathInvalidIndex"), CFSTR("Out of bounds path node index \"%ld\"), a3);
      v6 = 0;
      return v6;
    }
    -[NSMutableArray objectAtIndex:](self->_edges, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_edges, "objectAtIndex:", a3 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sourceNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isSameNodeAsNode:", v10) & 1) == 0)
    {
      objc_msgSend(v9, "targetNode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "isSameNodeAsNode:", v11);

      if ((v12 & 1) != 0)
      {
LABEL_12:

        return v6;
      }
      objc_msgSend(v8, "targetNode");
      v10 = v6;
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_12;
  }
  -[MAPath targetNode](self, "targetNode");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v6 = (void *)v5;
  return v6;
}

- (id)edgeAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_edges, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MAPathInvalidIndex"), CFSTR("Out of bounds path edge index \"%ld\"), a3);
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_edges, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)nodesCount
{
  unint64_t result;

  result = -[NSMutableArray count](self->_edges, "count");
  if (result)
    return -[NSMutableArray count](self->_edges, "count") + 1;
  return result;
}

- (unint64_t)edgesCount
{
  return -[NSMutableArray count](self->_edges, "count");
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_edges, "count") == 0;
}

- (double)edgesWeight
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  float v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_edges;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "weight", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (BOOL)containsEdge:(id)a3
{
  return -[NSMutableArray containsObject:](self->_edges, "containsObject:", a3);
}

- (BOOL)containsNode:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_edges;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "sourceNode", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v4))
        {

LABEL_13:
          v14 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v10, "targetNode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
          goto LABEL_13;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  return v14;
}

- (void)addFirstEdge:(id)a3
{
  MAPath *v4;
  uint64_t v5;
  NSMutableArray *edges;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSMutableArray count](v4->_edges, "count");
  edges = v4->_edges;
  if (v5)
  {
    -[NSMutableArray firstObject](edges, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "commonNode:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[NSMutableArray insertObject:atIndex:](v4->_edges, "insertObject:atIndex:", v9, 0);
    else
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MAPathInvalidPath"), CFSTR("Edge does not connect to \"%@\"), v7);

  }
  else
  {
    -[NSMutableArray addObject:](edges, "addObject:", v9);
  }
  objc_sync_exit(v4);

}

- (void)addLastEdge:(id)a3
{
  MAPath *v4;
  uint64_t v5;
  NSMutableArray *edges;
  void *v7;
  void *v8;
  NSMutableSet *nodes;
  void *v10;
  NSMutableSet *v11;
  void *v12;
  NSMutableSet *v13;
  id v14;

  v14 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSMutableArray count](v4->_edges, "count");
  edges = v4->_edges;
  if (v5)
  {
    -[NSMutableArray lastObject](edges, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "commonNode:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSMutableArray addObject:](v4->_edges, "addObject:", v14);
      nodes = v4->_nodes;
      objc_msgSend(v14, "oppositeNode:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](nodes, "addObject:", v10);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MAPathInvalidPath"), CFSTR("Edge does not connect to \"%@\"), v7);
    }

  }
  else
  {
    -[NSMutableArray addObject:](edges, "addObject:", v14);
    v11 = v4->_nodes;
    objc_msgSend(v14, "sourceNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v11, "addObject:", v12);

    v13 = v4->_nodes;
    objc_msgSend(v14, "targetNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v13, "addObject:", v7);
  }

  objc_sync_exit(v4);
}

- (void)removeFirstEdge
{
  MAPath *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[NSMutableArray count](obj->_edges, "count"))
    -[NSMutableArray removeObjectAtIndex:](obj->_edges, "removeObjectAtIndex:", 0);
  objc_sync_exit(obj);

}

- (void)removeLastEdge
{
  MAPath *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableArray removeLastObject](obj->_edges, "removeLastObject");
  objc_sync_exit(obj);

}

- (void)setEdges:(id)a3
{
  id v4;
  MAPath *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableArray removeAllObjects](v5->_edges, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        -[MAPath addLastEdge:](v5, "addLastEdge:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)removeAllEdges
{
  MAPath *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](obj->_edges, "removeAllObjects");
  objc_sync_exit(obj);

}

- (id)graphRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  +[MAGraph graph](MAGraph, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __29__MAPath_graphRepresentation__block_invoke;
  v16[3] = &unk_1E83E4E20;
  v6 = v3;
  v17 = v6;
  v7 = v4;
  v18 = v7;
  -[MAPath enumerateWithBlock:](self, "enumerateWithBlock:", v16);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __29__MAPath_graphRepresentation__block_invoke_2;
  v13[3] = &unk_1E83E4E20;
  v14 = v7;
  v8 = v6;
  v15 = v8;
  v9 = v7;
  -[MAPath enumerateWithBlock:](self, "enumerateWithBlock:", v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

- (void)enumerateWithBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v17 = 0;
  -[MAPath sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_edges;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    v11 = v5;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v4[2](v4, v11, v12, &v17);
      objc_msgSend(v12, "oppositeNode:", v11, (_QWORD)v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        break;
      ++v10;
      v11 = v5;
      if (v8 == v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[MAPath targetNode](self, "targetNode");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v4[2](v4, v6, 0, &v17);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_edges, 0);
}

void __29__MAPath_graphRepresentation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addNodeFromBase:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v4);

}

void __29__MAPath_graphRepresentation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v12 = v4;
    objc_msgSend(v4, "sourceNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v12, "targetNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && v10)
      v11 = (id)objc_msgSend(*(id *)(a1 + 40), "addEdgeFromBase:sourceNode:targetNode:", v12, v7, v10);
    else
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MAPathInvalidGraph"), CFSTR("Graph invalid for edge \"%@\"), v12);

    v4 = v12;
  }

}

void __24__MAPath_edgesForLabel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v8)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }

}

void __24__MAPath_nodesForLabel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    objc_msgSend(v8, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v7)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void __21__MAPath_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v14, "visualString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v7);

  if (v5)
  {
    objc_msgSend(v5, "sourceNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    if (objc_msgSend(v8, "isEqual:", v14))
      v10 = &stru_1E83E6588;
    else
      v10 = CFSTR("<");
    objc_msgSend(v5, "visualString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqual:", v14);
    v13 = CFSTR(">");
    if (!v12)
      v13 = &stru_1E83E6588;
    objc_msgSend(v9, "appendFormat:", CFSTR("%@-%@-%@"), v10, v11, v13);

  }
}

+ (id)path
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)pathWithEdges:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setEdges:", v3);

  return v4;
}

@end
