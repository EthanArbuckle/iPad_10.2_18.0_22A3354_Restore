@implementation GVGraph

- (GVGraph)init
{
  GVGraph *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GVGraph;
  v2 = -[GVGraph init](&v4, sel_init);
  if (v2)
  {
    v2->nodes = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v2->edges = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GVGraph;
  -[GVGraph dealloc](&v3, sel_dealloc);
}

- (id)allNodes
{
  return (id)-[NSMutableOrderedSet array](self->nodes, "array");
}

- (BOOL)hasNode:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->nodes, "containsObject:", a3);
}

- (void)addNode:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->nodes, "addObject:", a3);
}

- (void)removeNode:(id)a3
{
  -[NSMutableOrderedSet removeObject:](self->nodes, "removeObject:", a3);
}

- (id)allEdges
{
  return (id)-[NSMutableOrderedSet array](self->edges, "array");
}

- (id)edgeFrom:(id)a3 to:(id)a4
{
  NSMutableOrderedSet *edges;
  void *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  edges = self->edges;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __23__GVGraph_edgeFrom_to___block_invoke;
  v7[3] = &unk_1E98C6320;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = &v8;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](edges, "enumerateObjectsUsingBlock:", v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __23__GVGraph_edgeFrom_to___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "from");
  if (result == a1[4])
  {
    result = objc_msgSend(a2, "to");
    if (result == a1[5])
    {
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = a2;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)hasEdgeFrom:(id)a3 to:(id)a4
{
  if (-[NSMutableOrderedSet containsObject:](self->nodes, "containsObject:")
    && -[NSMutableOrderedSet containsObject:](self->nodes, "containsObject:", a4))
  {
    return objc_msgSend(a3, "hasEdgeTo:", a4);
  }
  else
  {
    return 0;
  }
}

- (void)addEdgeFrom:(id)a3 to:(id)a4
{
  -[NSMutableOrderedSet addObject:](self->nodes, "addObject:");
  -[NSMutableOrderedSet addObject:](self->nodes, "addObject:", a4);
  if ((objc_msgSend(a3, "hasEdgeTo:", a4) & 1) == 0)
  {
    -[NSMutableOrderedSet addObject:](self->edges, "addObject:", -[GVEdge initWithFromNode:to:]([GVEdge alloc], "initWithFromNode:to:", a3, a4));
    objc_msgSend(a3, "addEdgeTo:", a4);
  }
}

- (void)removeEdgeFrom:(id)a3 to:(id)a4
{
  if (-[GVGraph hasEdgeFrom:to:](self, "hasEdgeFrom:to:"))
  {
    -[NSMutableOrderedSet removeObject:](self->edges, "removeObject:", -[GVGraph edgeFrom:to:](self, "edgeFrom:to:", a3, a4));
    objc_msgSend(a3, "removeEdgeTo:", a4);
  }
}

- (void)addEdgeFrom:(id)a3 to:(id)a4 reversed:(BOOL)a5
{
  _BOOL8 v5;
  GVEdge *v9;

  v5 = a5;
  -[NSMutableOrderedSet addObject:](self->nodes, "addObject:");
  -[NSMutableOrderedSet addObject:](self->nodes, "addObject:", a4);
  if ((objc_msgSend(a3, "hasEdgeTo:", a4) & 1) == 0)
  {
    v9 = -[GVEdge initWithFromNode:to:]([GVEdge alloc], "initWithFromNode:to:", a3, a4);
    -[GVEdge setReversed:](v9, "setReversed:", v5);
    -[NSMutableOrderedSet addObject:](self->edges, "addObject:", v9);
    objc_msgSend(a3, "addEdgeTo:", a4);
  }
}

- (void)reverseEdge:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if ((objc_msgSend(a3, "reversed") & 1) == 0)
  {
    v5 = objc_msgSend(a3, "from");
    v6 = objc_msgSend(a3, "to");
    -[GVGraph removeEdgeFrom:to:](self, "removeEdgeFrom:to:", v5, v6);
    -[GVGraph addEdgeFrom:to:reversed:](self, "addEdgeFrom:to:reversed:", v6, v5, 1);
  }
}

- (void)undoReverseEdge:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend(a3, "reversed"))
  {
    v5 = objc_msgSend(a3, "from");
    v6 = objc_msgSend(a3, "to");
    -[GVGraph removeEdgeFrom:to:](self, "removeEdgeFrom:to:", v5, v6);
    -[GVGraph addEdgeFrom:to:reversed:](self, "addEdgeFrom:to:reversed:", v6, v5, 0);
  }
}

- (id)connectedSubgraphs
{
  return 0;
}

- (CGRect)bounds
{
  NSMutableOrderedSet *nodes;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect result;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  nodes = self->nodes;
  v3 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v27;
    v6 = 1.79769313e308;
    v7 = -1.79769313e308;
    v8 = -1.79769313e308;
    v9 = 1.79769313e308;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(nodes);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "x");
        if (v9 >= v12)
          v9 = v12;
        objc_msgSend(v11, "x");
        v14 = v13;
        objc_msgSend(v11, "w");
        v16 = v14 + v15;
        if (v8 < v16)
          v8 = v16;
        objc_msgSend(v11, "y");
        if (v6 >= v17)
          v6 = v17;
        objc_msgSend(v11, "y");
        v19 = v18;
        objc_msgSend(v11, "h");
        v21 = v19 + v20;
        if (v7 < v21)
          v7 = v21;
      }
      v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1.79769313e308;
    v7 = -1.79769313e308;
    v8 = -1.79769313e308;
    v9 = 1.79769313e308;
  }
  v22 = v8 - v9;
  v23 = v7 - v6;
  v24 = v9;
  v25 = v6;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)render:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(a3, "direction");
  else
    v5 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "separation");
  }
  else
  {
    v6 = 50.0;
    v7 = 50.0;
  }
  +[GVLayout layoutGraph:withDirection:separation:](GVLayout, "layoutGraph:withDirection:separation:", self, v5, v6, v7);
  v10 = objc_msgSend(a3, "setCanvasWidth:height:", v8, v9);
  if (v10)
    +[GVInternalRenderer render:renderer:](GVInternalRenderer, "render:renderer:", self, a3);
  return v10;
}

- (void)iterateOverAllEdges:(id)a3
{
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](self->edges, "enumerateObjectsUsingBlock:", a3);
}

- (void)iterateOverAllNodes:(id)a3
{
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](self->nodes, "enumerateObjectsUsingBlock:", a3);
}

- (id)description
{
  void *v3;
  NSMutableOrderedSet *nodes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableOrderedSet *edges;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "string"), "stringByAppendingString:", CFSTR("\nNodes:\n\n"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  nodes = self->nodes;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(nodes);
        v3 = (void *)objc_msgSend((id)objc_msgSend(v3, "stringByAppendingString:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "description")), "stringByAppendingString:", CFSTR("\n"));
      }
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }
  v9 = (void *)objc_msgSend(v3, "stringByAppendingString:", CFSTR("\nEdges:\n\n"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  edges = self->edges;
  v11 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](edges, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(edges);
        v9 = (void *)objc_msgSend((id)objc_msgSend(v9, "stringByAppendingString:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "description")), "stringByAppendingString:", CFSTR("\n"));
      }
      v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](edges, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }
  return v9;
}

- (NSMutableOrderedSet)nodes
{
  return self->nodes;
}

- (void)setNodes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableOrderedSet)edges
{
  return self->edges;
}

- (void)setEdges:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
