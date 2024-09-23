@implementation GVLayout

- (void)dealloc
{
  unint64_t *savedOrder;
  objc_super v4;

  savedOrder = self->savedOrder;
  if (savedOrder)
    free(savedOrder);
  v4.receiver = self;
  v4.super_class = (Class)GVLayout;
  -[GVLayout dealloc](&v4, sel_dealloc);
}

+ (CGSize)layoutGraph:(id)a3 withDirection:(int)a4 separation:(CGSize)a5
{
  double height;
  double width;
  uint64_t v7;
  GVLayout *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a5.height;
  width = a5.width;
  v7 = *(_QWORD *)&a4;
  v9 = objc_alloc_init(GVLayout);
  -[GVLayout doLayout:direction:separation:](v9, "doLayout:direction:separation:", a3, v7, width, height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)doLayout:(id)a3 direction:(int)a4 separation:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  NSMutableOrderedSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGSize result;

  height = a5.height;
  width = a5.width;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1D826CAD0](self, a2);
  self->graph = (GVGraph *)a3;
  self->direction = a4;
  self->separation.width = width;
  self->separation.height = height;
  -[GVLayout removeSelfEdges](self, "removeSelfEdges");
  -[GVLayout removeCycles](self, "removeCycles");
  -[GVLayout assignRanks](self, "assignRanks");
  -[GVLayout orderVertices](self, "orderVertices");
  -[GVLayout assignCoordinates](self, "assignCoordinates");
  -[GVLayout undoRemoveCycles](self, "undoRemoveCycles");
  -[GVLayout undoRemoveCycles](self, "undoRemoveCycles");
  objc_autoreleasePoolPop(v10);
  -[GVGraph bounds](self->graph, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = fabs(v11) <= 2.22044605e-16;
  v19 = fabs(v13);
  v20 = v20 && v19 <= 2.22044605e-16;
  if (!v20)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = -[GVGraph nodes](self->graph, "nodes", 0);
    v22 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v26, "x");
          objc_msgSend(v26, "setX:", v27 - v12);
          objc_msgSend(v26, "y");
          objc_msgSend(v26, "setY:", v28 - v14);
        }
        v23 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v23);
    }
  }
  v29 = v16;
  v30 = v18;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)removeSelfEdges
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->selfEdges = (NSMutableArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[GVGraph edges](self->graph, "edges", 0);
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "from");
        if (v9 == objc_msgSend(v8, "to"))
        {
          -[NSMutableArray addObject:](self->selfEdges, "addObject:", v8);
          -[GVGraph removeEdgeFrom:to:](self->graph, "removeEdgeFrom:to:", objc_msgSend(v8, "from"), objc_msgSend(v8, "to"));
        }
      }
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
}

- (void)undoRemoveSelfEdges
{
  NSMutableArray *selfEdges;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  selfEdges = self->selfEdges;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](selfEdges, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(selfEdges);
        -[GVGraph addEdgeFrom:to:](self->graph, "addEdgeFrom:to:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "from"), objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "to"));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](selfEdges, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->selfEdges, "removeAllObjects");
}

- (void)_removeCycleDFS:(id)a3 visistedNodes:(id)a4 nodesInStack:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a4, "containsObject:") & 1) == 0)
  {
    objc_msgSend(a4, "addObject:", a3);
    objc_msgSend(a5, "addObject:", a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (void *)objc_msgSend(a3, "outNodes", 0);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(a5, "containsObject:", v14))
          {
            -[GVGraph reverseEdge:](self->graph, "reverseEdge:", -[GVGraph edgeFrom:to:](self->graph, "edgeFrom:to:", a3, v14));
          }
          else if ((objc_msgSend(a4, "containsObject:", v14) & 1) == 0)
          {
            -[GVLayout _removeCycleDFS:visistedNodes:nodesInStack:](self, "_removeCycleDFS:visistedNodes:nodesInStack:", v14, a4, a5);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }
    objc_msgSend(a5, "removeObject:", a3);
  }
}

- (void)removeCycles
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
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
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(-[GVGraph allNodes](self->graph, "allNodes"), "mutableCopy");
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_139);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GVLayout _removeCycleDFS:visistedNodes:nodesInStack:](self, "_removeCycleDFS:visistedNodes:nodesInStack:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v3, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)undoRemoveCycles
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[GVGraph edges](self->graph, "edges", 0);
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[GVGraph undoReverseEdge:](self->graph, "undoReverseEdge:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)assignRanks
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  GVDummyNode *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  GVDummyNode *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableOrderedSet *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[GVLayout makeFeasibleTree](self, "makeFeasibleTree");
  -[GVLayout minimizeCutValues](self, "minimizeCutValues");
  -[GVLayout normalizeRanks](self, "normalizeRanks");
  -[GVLayout balanceRanks](self, "balanceRanks");
  -[GVLayout buildRankIterators](self, "buildRankIterators");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = -[GVGraph edges](self->graph, "edges");
  v3 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    v16 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      v17 = v4;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        v8 = (GVDummyNode *)objc_msgSend(v7, "from");
        v9 = (void *)objc_msgSend(v7, "to");
        v10 = -[GVNode rank](v8, "rank");
        v11 = objc_msgSend(v9, "rank");
        if ((unint64_t)(v11 - v10) >= 2)
        {
          v12 = v11;
          -[GVNode removeEdgeTo:](v8, "removeEdgeTo:", v9);
          v13 = v10 + 1;
          if (v13 >= v12)
          {
            v15 = v8;
          }
          else
          {
            do
            {
              v14 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", v13);
              v15 = objc_alloc_init(GVDummyNode);
              objc_msgSend(v14, "sizeForDummy");
              -[GVNode setSize:](v15, "setSize:");
              -[GVGraph addNode:](self->graph, "addNode:", v15);
              -[GVNode addEdgeTo:](v8, "addEdgeTo:", v15);
              objc_msgSend((id)objc_msgSend(v7, "dummies"), "addObject:", v15);
              objc_msgSend(v14, "addNode:", v15);
              -[GVNode setRank:](v15, "setRank:", v13);

              ++v13;
              v8 = v15;
            }
            while (v12 != v13);
          }
          -[GVNode addEdgeTo:](v15, "addEdgeTo:", v9);
          v5 = v16;
          v4 = v17;
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }
}

- (void)initializeRanks
{
  uint64_t v3;
  void *v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableOrderedSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = -[GVGraph nodes](self->graph, "nodes");
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v46 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "setIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "inDegree"));
      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v7);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = -[GVGraph nodes](self->graph, "nodes");
  v11 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        if (!objc_msgSend(v15, "index"))
          objc_msgSend(v4, "addObject:", v15);
      }
      v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v12);
  }
  while (objc_msgSend(v4, "count"))
  {
    v16 = (void *)objc_msgSend(v4, "firstObject");
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v17 = (void *)objc_msgSend(v16, "inNodes");
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
          v23 = objc_msgSend(v16, "rank");
          v24 = objc_msgSend(v22, "rank");
          if (v23 <= v24 + 1)
            v25 = v24 + 1;
          else
            v25 = v23;
          objc_msgSend(v16, "setRank:", v25);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      }
      while (v19);
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = (void *)objc_msgSend(v16, "outNodes", 0);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v34;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * m);
          v32 = objc_msgSend(v31, "index");
          objc_msgSend(v31, "setIndex:", v32 - 1);
          if (v32 <= 1)
            objc_msgSend(v4, "addObject:", v31);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      }
      while (v28);
    }
  }
}

- (void)makeFeasibleTree
{
  __assert_rtn("-[GVLayout makeFeasibleTree]", "GVLayout.m", 1102, "treeNode && incidentNode");
}

uint64_t __28__GVLayout_makeFeasibleTree__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD v9[8];
  _QWORD v10[4];

  v7 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", a2);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0xFFFFFFFFLL;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__GVLayout_makeFeasibleTree__block_invoke_2;
  v9[3] = &unk_1E98C63C8;
  v9[4] = v7;
  v9[5] = v10;
  v9[6] = a3;
  v9[7] = a4;
  objc_msgSend(a2, "traversePreorder:withCallback:randomize:", 2, v9, 0);
  _Block_object_dispose(v10, 8);
  return v7;
}

uint64_t __28__GVLayout_makeFeasibleTree__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!a3)
    return 0;
  v6 = objc_msgSend(a3, "rank");
  v7 = objc_msgSend(a2, "rank");
  v8 = v6 - v7;
  if (v6 - v7 < 0)
    v8 = v7 - v6;
  v9 = v8 - 1;
  if (v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v9 < *(_QWORD *)(v10 + 24))
    {
      *(_QWORD *)(v10 + 24) = v9;
      **(_QWORD **)(a1 + 48) = a3;
      **(_QWORD **)(a1 + 56) = a2;
    }
    return 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
    return 0;
  }
}

- (void)normalizeRanks
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  NSMutableOrderedSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = -[GVGraph nodes](self->graph, "nodes");
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = -2147483647;
    v8 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v10, "rank") > v7)
          v7 = objc_msgSend(v10, "rank");
        if (objc_msgSend(v10, "rank") < v8)
          v8 = objc_msgSend(v10, "rank");
      }
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }
  else
  {
    v7 = -2147483647;
    v8 = 0x7FFFFFFFLL;
  }
  v11 = v7 - v8 + 1;
  self->ranks = (NSMutableArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
  v12 = objc_opt_class();
  if (v7 - v8 != -1)
  {
    v13 = (objc_class *)v12;
    do
    {
      -[NSMutableArray addObject:](self->ranks, "addObject:", objc_msgSend([v13 alloc], "initWithSeparation:", self->separation.width, self->separation.height));
      --v11;
    }
    while (v11);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = -[GVGraph nodes](self->graph, "nodes", 0);
  v15 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        objc_msgSend(v19, "setRank:", objc_msgSend(v19, "rank") - v8);
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", objc_msgSend(v19, "rank")), "addNode:", v19);
      }
      v16 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }
}

- (void)balanceRanks
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSMutableOrderedSet *obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = -[GVGraph nodes](self->graph, "nodes");
  v3 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v3)
  {
    v4 = v3;
    v26 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v6, "inNodes"), "count"))
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v7 = (void *)objc_msgSend(v6, "inNodes");
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v32;
            v11 = -2147483647;
            do
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v32 != v10)
                  objc_enumerationMutation(v7);
                v13 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "rank");
                if (v13 > v11)
                  v11 = v13;
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            }
            while (v9);
          }
          else
          {
            v11 = -2147483647;
          }
          v14 = v11 + 1;
        }
        else
        {
          v14 = -2147483647;
        }
        if (objc_msgSend((id)objc_msgSend(v6, "outNodes"), "count"))
        {
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v15 = (void *)objc_msgSend(v6, "outNodes");
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v28;
            v19 = 0x7FFFFFFFLL;
            do
            {
              for (k = 0; k != v17; ++k)
              {
                if (*(_QWORD *)v28 != v18)
                  objc_enumerationMutation(v15);
                v21 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * k), "rank");
                if (v21 < v19)
                  v19 = v21;
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
            }
            while (v17);
          }
          else
          {
            v19 = 0x7FFFFFFFLL;
          }
          if (v14 != -2147483647)
          {
            v22 = v19 - 1;
            if (v14 != v22)
            {
              v23 = objc_msgSend(v6, "rank");
              while (v14 <= v22)
              {
                v24 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", v14), "nodes"), "count");
                if (v24 < objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", v23), "nodes"), "count"))v23 = v14;
                ++v14;
              }
              objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", objc_msgSend(v6, "rank")), "removeNode:", v6);
              objc_msgSend(v6, "setRank:", v23);
              objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", objc_msgSend(v6, "rank")), "addNode:", v6);
            }
          }
        }
      }
      v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v4);
  }
}

- (void)buildRankIterators
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)-[NSMutableArray objectEnumerator](self->ranks, "objectEnumerator");
  v4 = (void *)objc_msgSend(v3, "nextObject");
  if (v4)
  {
    v5 = 0;
    do
    {
      v6 = v4;
      objc_msgSend(v4, "setPrev:", v5);
      v4 = (void *)objc_msgSend(v3, "nextObject");
      v5 = v6;
    }
    while (v4);
  }
  v7 = (void *)-[NSMutableArray reverseObjectEnumerator](self->ranks, "reverseObjectEnumerator", v5);
  v8 = (void *)objc_msgSend(v7, "nextObject");
  if (v8)
  {
    v9 = 0;
    do
    {
      v10 = v8;
      objc_msgSend(v8, "setNext:", v9);
      v8 = (void *)objc_msgSend(v7, "nextObject");
      v9 = v10;
    }
    while (v8);
  }
}

- (void)orderVertices
{
  char *v3;
  unint64_t v4;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  uint64_t j;
  unint64_t v9;
  NSMutableArray *ranks;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[GVLayout initializeOrder](self, "initializeOrder");
  v3 = (char *)&v15
     - ((8 * -[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count") + 15) & 0xFFFFFFFFFFFFFFF0);
  if (-[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count"))
  {
    v4 = 0;
    do
    {
      *(_QWORD *)&v3[8 * v4] = objc_msgSend((id)-[NSMutableOrderedSet objectAtIndexedSubscript:](-[GVGraph nodes](self->graph, "nodes"), "objectAtIndexedSubscript:", v4), "index");
      ++v4;
    }
    while (v4 < -[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count"));
  }
  if (self->currentCrossings)
  {
    for (i = 0; i != 24; ++i)
    {
      -[GVLayout weightedMedian:](self, "weightedMedian:", i);
      -[GVLayout transpose](self, "transpose");
    }
    -[GVLayout commitOrder](self, "commitOrder");
    v6 = -[GVLayout crossings](self, "crossings");
    if (v6 < self->currentCrossings)
    {
      self->currentCrossings = v6;
      -[GVLayout saveOrder](self, "saveOrder");
    }
    if (-[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend((id)-[NSMutableOrderedSet objectAtIndexedSubscript:](-[GVGraph nodes](self->graph, "nodes"), "objectAtIndexedSubscript:", v7), "setIndex:", *(_QWORD *)&v3[8 * v7]);
        ++v7;
      }
      while (v7 < -[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count"));
    }
    for (j = 1; j != 25; ++j)
    {
      -[GVLayout weightedMedian:](self, "weightedMedian:", j);
      -[GVLayout transpose](self, "transpose");
    }
    -[GVLayout commitOrder](self, "commitOrder");
    v9 = -[GVLayout crossings](self, "crossings");
    if (v9 >= self->currentCrossings)
      -[GVLayout restoreOrder](self, "restoreOrder");
    else
      self->currentCrossings = v9;
    -[GVLayout commitOrder](self, "commitOrder");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  ranks = self->ranks;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(ranks);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "buildNodeIterators");
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }
}

- (unint64_t)crossings
{
  NSMutableArray *ranks;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  ranks = self->ranks;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(ranks);
      v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "inCrossings");
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (void)saveOrder
{
  unint64_t v3;

  if (!self->savedOrder)
    self->savedOrder = (unint64_t *)malloc_type_malloc(8* -[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count"), 0x100004000313F17uLL);
  if (-[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count"))
  {
    v3 = 0;
    do
    {
      self->savedOrder[v3] = objc_msgSend((id)-[NSMutableOrderedSet objectAtIndexedSubscript:](-[GVGraph nodes](self->graph, "nodes"), "objectAtIndexedSubscript:", v3), "index");
      ++v3;
    }
    while (v3 < -[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count"));
  }
}

- (void)restoreOrder
{
  unint64_t v3;

  if (self->savedOrder && -[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend((id)-[NSMutableOrderedSet objectAtIndexedSubscript:](-[GVGraph nodes](self->graph, "nodes"), "objectAtIndexedSubscript:", v3), "setIndex:", self->savedOrder[v3]);
      ++v3;
    }
    while (v3 < -[NSMutableOrderedSet count](-[GVGraph nodes](self->graph, "nodes"), "count"));
  }
}

- (void)commitOrder
{
  NSMutableArray *ranks;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  ranks = self->ranks;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(ranks);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "sortByIndex");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)initializeOrder
{
  char *v3;
  uint64_t v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *j;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t m;
  NSMutableOrderedSet *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t n;
  void *v27;
  void *ii;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t jj;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = (char *)&v38 - ((8 * -[NSMutableArray count](self->ranks, "count") + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v3, 8 * -[NSMutableArray count](self->ranks, "count"));
  v4 = 0;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __27__GVLayout_initializeOrder__block_invoke;
  v54[3] = &__block_descriptor_40_e30_B32__0__GVNode_8__GVNode_16Q24l;
  v54[4] = v3;
  self->currentCrossings = 0xFFFFFFFFLL;
  while (1)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v5 = -[GVGraph nodes](self->graph, "nodes");
    v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v51 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "setIndex:", -1);
        }
        v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v7);
    }
    v10 = (void *)-[NSMutableArray objectEnumerator](self->ranks, "objectEnumerator");
    for (j = v10; ; v10 = j)
    {
      v12 = (void *)objc_msgSend(v10, "nextObject");
      if (!v12)
        break;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v13 = (void *)objc_msgSend(v12, "nodes");
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v47;
        do
        {
          for (k = 0; k != v15; ++k)
          {
            if (*(_QWORD *)v47 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
            if (objc_msgSend(v18, "index") <= 0)
              objc_msgSend(v18, "traversePreorder:withCallback:randomize:", 0, v54, 1);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
        }
        while (v15);
      }
    }
    -[GVLayout commitOrder](self, "commitOrder");
    v19 = -[GVLayout crossings](self, "crossings");
    if (v19 < self->currentCrossings)
    {
      v20 = v19;
      -[GVLayout saveOrder](self, "saveOrder");
      self->currentCrossings = v20;
      if (!v20)
        break;
    }
    if (++v4 == 10)
    {
      for (m = 0; ; ++m)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v22 = -[GVGraph nodes](self->graph, "nodes");
        v23 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v43;
          do
          {
            for (n = 0; n != v24; ++n)
            {
              if (*(_QWORD *)v43 != v25)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * n), "setIndex:", -1);
            }
            v24 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
          }
          while (v24);
        }
        v27 = (void *)-[NSMutableArray reverseObjectEnumerator](self->ranks, "reverseObjectEnumerator");
        for (ii = v27; ; v27 = ii)
        {
          v29 = (void *)objc_msgSend(v27, "nextObject");
          if (!v29)
            break;
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v30 = (void *)objc_msgSend(v29, "nodes", 0);
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v39;
            do
            {
              for (jj = 0; jj != v32; ++jj)
              {
                if (*(_QWORD *)v39 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * jj);
                if (objc_msgSend(v35, "index") <= 0)
                  objc_msgSend(v35, "traversePreorder:withCallback:randomize:", 1, v54, 1);
              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
            }
            while (v32);
          }
        }
        -[GVLayout commitOrder](self, "commitOrder");
        v36 = -[GVLayout crossings](self, "crossings");
        if (v36 >= self->currentCrossings)
        {
          if (m > 8)
            return;
        }
        else
        {
          v37 = v36;
          -[GVLayout saveOrder](self, "saveOrder");
          self->currentCrossings = v37;
          if (!v37 || m >= 9)
            return;
        }
      }
    }
  }
}

BOOL __27__GVLayout_initializeOrder__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend(a2, "index");
  if (v4 < 0)
  {
    objc_msgSend(a2, "setIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * objc_msgSend(a2, "rank")));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(a2, "rank");
    ++*(_QWORD *)(v5 + 8 * v6);
  }
  return v4 >= 0;
}

- (unint64_t)medianValueOf:(id)a3 withRespectTo:(id)a4
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = (void *)objc_msgSend(a4, "neighborsOfNode:", a3);
  v5 = objc_msgSend(v4, "count");
  if (!v5)
    return -1;
  v6 = v5;
  v7 = v5 >> 1;
  if ((v5 & 1) != 0)
    return objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v7), "index");
  if (v5 == 2)
  {
    v8 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0), "index");
    v9 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), "index");
    v10 = v9 + v8;
    if (v9 + v8 < 0 != __OFADD__(v9, v8))
      ++v10;
    return v10 >> 1;
  }
  else
  {
    v12 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v7 - 1), "index");
    v13 = v12 - objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0), "index");
    v14 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v6 - 1), "index");
    v15 = v14 - objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v7), "index");
    v16 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v7 - 1), "index") * v15;
    return (v16 + objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v7), "index") * v13) / (v15 + v13);
  }
}

- (void)medianSort:(id)a3 withRespectTo:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "nodes"), "count") >= 2)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (void *)objc_msgSend(a3, "nodes", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "setIndex:", -[GVLayout medianValueOf:withRespectTo:](self, "medianValueOf:withRespectTo:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11), a4));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }
    v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "nodes"), "mutableCopy");
    objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_136);
    v13 = -1;
    do
      ++v13;
    while (objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v13), "index") < 0);
    if (objc_msgSend((id)objc_msgSend(a3, "nodes"), "count"))
    {
      v14 = 0;
      do
      {
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "nodes"), "objectAtIndexedSubscript:", v14), "index") & 0x8000000000000000) == 0)
          objc_msgSend((id)objc_msgSend(a3, "nodes"), "setObject:atIndexedSubscript:", objc_msgSend(v12, "objectAtIndexedSubscript:", v13++), v14);
        ++v14;
      }
      while (v14 < objc_msgSend((id)objc_msgSend(a3, "nodes"), "count"));
    }
    if (objc_msgSend((id)objc_msgSend(a3, "nodes"), "count"))
    {
      v15 = 0;
      do
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "nodes"), "objectAtIndexedSubscript:", v15), "setIndex:", v15);
        ++v15;
      }
      while (v15 < objc_msgSend((id)objc_msgSend(a3, "nodes"), "count"));
    }
  }
}

- (void)weightedMedian:(unint64_t)a3
{
  NSMutableArray *ranks;
  void *j;
  void *v6;
  void *i;
  void *v8;

  ranks = self->ranks;
  if ((a3 & 1) != 0)
  {
    for (i = (void *)-[NSMutableArray lastObject](ranks, "lastObject"); ; i = (void *)objc_msgSend(v8, "prev"))
    {
      v8 = i;
      if (!objc_msgSend(i, "prev"))
        break;
      -[GVLayout medianSort:withRespectTo:](self, "medianSort:withRespectTo:", objc_msgSend(v8, "prev"), v8);
    }
  }
  else
  {
    for (j = (void *)-[NSMutableArray firstObject](ranks, "firstObject"); ; j = (void *)objc_msgSend(v6, "next"))
    {
      v6 = j;
      if (!objc_msgSend(j, "next"))
        break;
      -[GVLayout medianSort:withRespectTo:](self, "medianSort:withRespectTo:", objc_msgSend(v6, "next"), v6);
    }
  }
}

- (void)transpose
{
  NSMutableArray *ranks;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  do
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    ranks = self->ranks;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v4)
      break;
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(ranks);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v9, "nodes"), "count") != 1)
        {
          v10 = 0;
          do
          {
            v11 = objc_msgSend(v9, "inCrossings");
            v12 = objc_msgSend(v9, "outCrossings") + v11;
            v13 = v10 + 1;
            objc_msgSend(v9, "exchangeNodeAtIndex:withNodeAtIndex:", v10, v10 + 1);
            v14 = objc_msgSend(v9, "inCrossings");
            v15 = objc_msgSend(v9, "outCrossings") + v14;
            if (v12 <= v15)
              objc_msgSend(v9, "exchangeNodeAtIndex:withNodeAtIndex:", v10 + 1, v10);
            ++v10;
          }
          while (v13 < objc_msgSend((id)objc_msgSend(v9, "nodes"), "count") - 1);
          v6 = v12 > v15;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  while (v6);
}

- (void)assignCoordinates
{
  -[GVLayout assignNodePriorities](self, "assignNodePriorities");
  -[GVLayout assignNodeCoordinates](self, "assignNodeCoordinates");
  -[GVLayout assignRankCoordinates](self, "assignRankCoordinates");
}

- (void)assignNodePriorities
{
  NSMutableOrderedSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[GVGraph nodes](self->graph, "nodes", 0);
  v3 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "computePriority");
      }
      while (v4 != v6);
      v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)initializeNodeCoordinates
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t k;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t m;
  void *v15;
  double v16;
  NSMutableArray *ranks;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t j;
  void *v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (self->direction > 1u)
  {
    v37 = 0uLL;
    v38 = 0uLL;
    v35 = 0uLL;
    v36 = 0uLL;
    ranks = self->ranks;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(ranks);
          v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v23 = (void *)objc_msgSend(v22, "nodes", 0);
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v32;
            v27 = 0.0;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v32 != v26)
                  objc_enumerationMutation(v23);
                v29 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
                objc_msgSend(v29, "setY:", v27);
                objc_msgSend(v29, "h");
                v27 = v27 + v30 + self->separation.height;
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
            }
            while (v25);
          }
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      }
      while (v19);
    }
  }
  else
  {
    v45 = 0uLL;
    v46 = 0uLL;
    v43 = 0uLL;
    v44 = 0uLL;
    v3 = self->ranks;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v44;
      do
      {
        for (k = 0; k != v5; ++k)
        {
          if (*(_QWORD *)v44 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v9 = (void *)objc_msgSend(v8, "nodes");
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v40;
            v13 = 0.0;
            do
            {
              for (m = 0; m != v11; ++m)
              {
                if (*(_QWORD *)v40 != v12)
                  objc_enumerationMutation(v9);
                v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * m);
                objc_msgSend(v15, "setX:", v13);
                objc_msgSend(v15, "w");
                v13 = v13 + v16 + self->separation.width;
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
            }
            while (v11);
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v5);
    }
  }
}

- (void)medianPosition:(unint64_t)a3
{
  NSMutableArray *ranks;
  void *j;
  void *v5;
  void *i;
  void *v7;

  ranks = self->ranks;
  if ((a3 & 1) != 0)
  {
    for (i = (void *)-[NSMutableArray lastObject](ranks, "lastObject"); ; i = (void *)objc_msgSend(v7, "prev"))
    {
      v7 = i;
      if (!objc_msgSend(i, "prev"))
        break;
      objc_msgSend((id)objc_msgSend(v7, "prev"), "centerNodesWithRespectoTo:", v7);
    }
  }
  else
  {
    for (j = (void *)-[NSMutableArray firstObject](ranks, "firstObject"); ; j = (void *)objc_msgSend(v5, "next"))
    {
      v5 = j;
      if (!objc_msgSend(j, "next"))
        break;
      objc_msgSend((id)objc_msgSend(v5, "next"), "centerNodesWithRespectoTo:", v5);
    }
  }
}

- (void)packCutX:(unint64_t)a3
{
  NSMutableArray *ranks;
  uint64_t v5;
  void *v6;
  uint64_t k;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t m;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t j;
  void *v23;
  void *v24;

  ranks = self->ranks;
  if ((a3 & 1) != 0)
  {
    v15 = objc_msgSend((id)-[NSMutableArray firstObject](ranks, "firstObject"), "next");
    if (v15)
    {
      v16 = (void *)v15;
      do
      {
        for (i = objc_msgSend((id)objc_msgSend(v16, "nodes"), "lastObject"); ; i = objc_msgSend(v18, "prev"))
        {
          v18 = (void *)i;
          if (!i)
            break;
          v19 = (void *)objc_msgSend((id)objc_msgSend(v16, "prev"), "neighborsOfNode:", i);
          if (objc_msgSend(v19, "count"))
          {
            medianX(v19);
            objc_msgSend(v16, "centerNode:at:", v18);
          }
        }
        v16 = (void *)objc_msgSend(v16, "next");
      }
      while (v16);
    }
    v20 = objc_msgSend((id)-[NSMutableArray firstObject](self->ranks, "firstObject"), "next");
    if (v20)
    {
      v21 = (void *)v20;
      do
      {
        for (j = objc_msgSend((id)objc_msgSend(v21, "nodes"), "firstObject"); ; j = objc_msgSend(v23, "next"))
        {
          v23 = (void *)j;
          if (!j)
            break;
          v24 = (void *)objc_msgSend((id)objc_msgSend(v21, "prev"), "neighborsOfNode:", j);
          if (objc_msgSend(v24, "count"))
          {
            medianX(v24);
            objc_msgSend(v21, "centerNode:at:", v23);
          }
        }
        v21 = (void *)objc_msgSend(v21, "next");
      }
      while (v21);
    }
  }
  else
  {
    v5 = objc_msgSend((id)-[NSMutableArray lastObject](ranks, "lastObject"), "prev");
    if (v5)
    {
      v6 = (void *)v5;
      do
      {
        for (k = objc_msgSend((id)objc_msgSend(v6, "nodes"), "lastObject"); ; k = objc_msgSend(v8, "prev"))
        {
          v8 = (void *)k;
          if (!k)
            break;
          v9 = (void *)objc_msgSend((id)objc_msgSend(v6, "next"), "neighborsOfNode:", k);
          if (objc_msgSend(v9, "count"))
          {
            medianX(v9);
            objc_msgSend(v6, "centerNode:at:", v8);
          }
        }
        v6 = (void *)objc_msgSend(v6, "prev");
      }
      while (v6);
    }
    v10 = objc_msgSend((id)-[NSMutableArray lastObject](self->ranks, "lastObject"), "prev");
    if (v10)
    {
      v11 = (void *)v10;
      do
      {
        for (m = objc_msgSend((id)objc_msgSend(v11, "nodes"), "firstObject"); ; m = objc_msgSend(v13, "next"))
        {
          v13 = (void *)m;
          if (!m)
            break;
          v14 = (void *)objc_msgSend((id)objc_msgSend(v11, "next"), "neighborsOfNode:", m);
          if (objc_msgSend(v14, "count"))
          {
            medianX(v14);
            objc_msgSend(v11, "centerNode:at:", v13);
          }
        }
        v11 = (void *)objc_msgSend(v11, "prev");
      }
      while (v11);
    }
  }
}

- (void)packCutY:(unint64_t)a3
{
  NSMutableArray *ranks;
  uint64_t v5;
  void *v6;
  uint64_t k;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t m;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t j;
  void *v23;
  void *v24;

  ranks = self->ranks;
  if ((a3 & 1) != 0)
  {
    v15 = objc_msgSend((id)-[NSMutableArray firstObject](ranks, "firstObject"), "next");
    if (v15)
    {
      v16 = (void *)v15;
      do
      {
        for (i = objc_msgSend((id)objc_msgSend(v16, "nodes"), "lastObject"); ; i = objc_msgSend(v18, "prev"))
        {
          v18 = (void *)i;
          if (!i)
            break;
          v19 = (void *)objc_msgSend((id)objc_msgSend(v16, "prev"), "neighborsOfNode:", i);
          if (objc_msgSend(v19, "count"))
          {
            medianY(v19);
            objc_msgSend(v16, "centerNode:at:", v18);
          }
        }
        v16 = (void *)objc_msgSend(v16, "next");
      }
      while (v16);
    }
    v20 = objc_msgSend((id)-[NSMutableArray firstObject](self->ranks, "firstObject"), "next");
    if (v20)
    {
      v21 = (void *)v20;
      do
      {
        for (j = objc_msgSend((id)objc_msgSend(v21, "nodes"), "firstObject"); ; j = objc_msgSend(v23, "next"))
        {
          v23 = (void *)j;
          if (!j)
            break;
          v24 = (void *)objc_msgSend((id)objc_msgSend(v21, "prev"), "neighborsOfNode:", j);
          if (objc_msgSend(v24, "count"))
          {
            medianY(v24);
            objc_msgSend(v21, "centerNode:at:", v23);
          }
        }
        v21 = (void *)objc_msgSend(v21, "next");
      }
      while (v21);
    }
  }
  else
  {
    v5 = objc_msgSend((id)-[NSMutableArray lastObject](ranks, "lastObject"), "prev");
    if (v5)
    {
      v6 = (void *)v5;
      do
      {
        for (k = objc_msgSend((id)objc_msgSend(v6, "nodes"), "lastObject"); ; k = objc_msgSend(v8, "prev"))
        {
          v8 = (void *)k;
          if (!k)
            break;
          v9 = (void *)objc_msgSend((id)objc_msgSend(v6, "next"), "neighborsOfNode:", k);
          if (objc_msgSend(v9, "count"))
          {
            medianY(v9);
            objc_msgSend(v6, "centerNode:at:", v8);
          }
        }
        v6 = (void *)objc_msgSend(v6, "prev");
      }
      while (v6);
    }
    v10 = objc_msgSend((id)-[NSMutableArray lastObject](self->ranks, "lastObject"), "prev");
    if (v10)
    {
      v11 = (void *)v10;
      do
      {
        for (m = objc_msgSend((id)objc_msgSend(v11, "nodes"), "firstObject"); ; m = objc_msgSend(v13, "next"))
        {
          v13 = (void *)m;
          if (!m)
            break;
          v14 = (void *)objc_msgSend((id)objc_msgSend(v11, "next"), "neighborsOfNode:", m);
          if (objc_msgSend(v14, "count"))
          {
            medianY(v14);
            objc_msgSend(v11, "centerNode:at:", v13);
          }
        }
        v11 = (void *)objc_msgSend(v11, "prev");
      }
      while (v11);
    }
  }
}

- (void)straightenX
{
  NSMutableArray *ranks;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  ranks = self->ranks;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v24;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(ranks);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "width");
        if (v10 >= v7)
        {
          v5 = v9;
          v7 = v10;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  v11 = objc_msgSend(v5, "next");
  if (v11)
  {
    v12 = (void *)v11;
    do
    {
      v13 = objc_msgSend((id)objc_msgSend(v12, "nodes"), "firstObject");
      if (v13)
      {
        v14 = (void *)v13;
        do
        {
          if (objc_msgSend(v14, "inDegree") == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "inNodes"), "objectAtIndexedSubscript:", 0), "outDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "inNodes"), "objectAtIndexedSubscript:", 0), "cx");
            objc_msgSend(v12, "centerNode:at:", v14);
          }
          v14 = (void *)objc_msgSend(v14, "next");
        }
        while (v14);
      }
      v15 = objc_msgSend((id)objc_msgSend(v12, "nodes"), "lastObject");
      if (v15)
      {
        v16 = (void *)v15;
        do
        {
          if (objc_msgSend(v16, "inDegree") == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "inNodes"), "objectAtIndexedSubscript:", 0), "outDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "inNodes"), "objectAtIndexedSubscript:", 0), "cx");
            objc_msgSend(v12, "centerNode:at:", v16);
          }
          v16 = (void *)objc_msgSend(v16, "prev");
        }
        while (v16);
      }
      v12 = (void *)objc_msgSend(v12, "next");
    }
    while (v12);
  }
  v17 = objc_msgSend(v5, "prev");
  if (v17)
  {
    v18 = (void *)v17;
    do
    {
      v19 = objc_msgSend((id)objc_msgSend(v18, "nodes"), "firstObject");
      if (v19)
      {
        v20 = (void *)v19;
        do
        {
          if (objc_msgSend(v20, "outDegree") == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "outNodes"), "objectAtIndexedSubscript:", 0), "inDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "outNodes"), "objectAtIndexedSubscript:", 0), "cx");
            objc_msgSend(v18, "centerNode:at:", v20);
          }
          v20 = (void *)objc_msgSend(v20, "next");
        }
        while (v20);
      }
      v21 = objc_msgSend((id)objc_msgSend(v18, "nodes"), "lastObject");
      if (v21)
      {
        v22 = (void *)v21;
        do
        {
          if (objc_msgSend(v22, "outDegree") == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "outNodes"), "objectAtIndexedSubscript:", 0), "inDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "outNodes"), "objectAtIndexedSubscript:", 0), "cx");
            objc_msgSend(v18, "centerNode:at:", v22);
          }
          v22 = (void *)objc_msgSend(v22, "prev");
        }
        while (v22);
      }
      v18 = (void *)objc_msgSend(v18, "prev");
    }
    while (v18);
  }
}

- (void)straightenY
{
  NSMutableArray *ranks;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  ranks = self->ranks;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v24;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(ranks);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "height");
        if (v10 >= v7)
        {
          v5 = v9;
          v7 = v10;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ranks, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  v11 = objc_msgSend(v5, "next");
  if (v11)
  {
    v12 = (void *)v11;
    do
    {
      v13 = objc_msgSend((id)objc_msgSend(v12, "nodes"), "firstObject");
      if (v13)
      {
        v14 = (void *)v13;
        do
        {
          if (objc_msgSend(v14, "inDegree") == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "inNodes"), "objectAtIndexedSubscript:", 0), "outDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "inNodes"), "objectAtIndexedSubscript:", 0), "cy");
            objc_msgSend(v12, "centerNode:at:", v14);
          }
          v14 = (void *)objc_msgSend(v14, "next");
        }
        while (v14);
      }
      v15 = objc_msgSend((id)objc_msgSend(v12, "nodes"), "lastObject");
      if (v15)
      {
        v16 = (void *)v15;
        do
        {
          if (objc_msgSend(v16, "inDegree") == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "inNodes"), "objectAtIndexedSubscript:", 0), "outDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "inNodes"), "objectAtIndexedSubscript:", 0), "cy");
            objc_msgSend(v12, "centerNode:at:", v16);
          }
          v16 = (void *)objc_msgSend(v16, "prev");
        }
        while (v16);
      }
      v12 = (void *)objc_msgSend(v12, "next");
    }
    while (v12);
  }
  v17 = objc_msgSend(v5, "prev");
  if (v17)
  {
    v18 = (void *)v17;
    do
    {
      v19 = objc_msgSend((id)objc_msgSend(v18, "nodes"), "firstObject");
      if (v19)
      {
        v20 = (void *)v19;
        do
        {
          if (objc_msgSend(v20, "outDegree") == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "outNodes"), "objectAtIndexedSubscript:", 0), "inDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "outNodes"), "objectAtIndexedSubscript:", 0), "cy");
            objc_msgSend(v18, "centerNode:at:", v20);
          }
          v20 = (void *)objc_msgSend(v20, "next");
        }
        while (v20);
      }
      v21 = objc_msgSend((id)objc_msgSend(v18, "nodes"), "lastObject");
      if (v21)
      {
        v22 = (void *)v21;
        do
        {
          if (objc_msgSend(v22, "outDegree") == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "outNodes"), "objectAtIndexedSubscript:", 0), "inDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "outNodes"), "objectAtIndexedSubscript:", 0), "cy");
            objc_msgSend(v18, "centerNode:at:", v22);
          }
          v22 = (void *)objc_msgSend(v22, "prev");
        }
        while (v22);
      }
      v18 = (void *)objc_msgSend(v18, "prev");
    }
    while (v18);
  }
}

- (void)assignNodeCoordinates
{
  uint64_t j;
  uint64_t i;

  -[GVLayout initializeNodeCoordinates](self, "initializeNodeCoordinates");
  if (self->direction >= 2u)
  {
    for (i = 0; i != 8; ++i)
    {
      -[GVLayout medianPosition:](self, "medianPosition:", i);
      -[GVLayout packCutY:](self, "packCutY:", i);
      -[GVLayout straightenY](self, "straightenY");
    }
  }
  else
  {
    for (j = 0; j != 8; ++j)
    {
      -[GVLayout medianPosition:](self, "medianPosition:", j);
      -[GVLayout packCutX:](self, "packCutX:", j);
      -[GVLayout straightenX](self, "straightenX");
    }
  }
}

- (void)assignRankCoordinates
{
  unsigned int v3;
  NSMutableArray *ranks;
  void *v5;
  void *v6;
  unsigned int direction;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  unint64_t v26;
  double height;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  double v36;
  unint64_t v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  unint64_t v45;
  double width;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = self->direction - 1;
  ranks = self->ranks;
  if (v3 > 1)
    v5 = (void *)-[NSMutableArray reverseObjectEnumerator](ranks, "reverseObjectEnumerator");
  else
    v5 = (void *)-[NSMutableArray objectEnumerator](ranks, "objectEnumerator");
  v6 = v5;
  direction = self->direction;
  v8 = objc_msgSend(v5, "nextObject");
  v9 = (void *)v8;
  if (direction >= 2)
  {
    if (v8)
    {
      v29 = 0.0;
      do
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v30 = (void *)objc_msgSend(v9, "nodes");
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        v32 = 0.0;
        if (v31)
        {
          v33 = v31;
          v34 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v53 != v34)
                objc_enumerationMutation(v30);
              objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "size");
              if (v32 < v36)
                v32 = v36;
            }
            v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
          }
          while (v33);
        }
        v37 = objc_msgSend((id)objc_msgSend(v9, "nodes"), "count");
        v38 = 0.0;
        if (v37 >= 6)
          v38 = self->separation.width * 0.5;
        v39 = v29 + v38;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v40 = (void *)objc_msgSend(v9, "nodes", 0);
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v49;
          do
          {
            for (j = 0; j != v42; ++j)
            {
              if (*(_QWORD *)v49 != v43)
                objc_enumerationMutation(v40);
              objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "setCx:", v32 * 0.5 + v39);
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
          }
          while (v42);
        }
        v45 = objc_msgSend((id)objc_msgSend(v9, "nodes"), "count");
        width = self->separation.width;
        v47 = width * 0.5;
        if (v45 <= 5)
          v47 = 0.0;
        v29 = v39 + v47 + v32 + width;
        v9 = (void *)objc_msgSend(v6, "nextObject");
      }
      while (v9);
    }
  }
  else if (v8)
  {
    v10 = 0.0;
    do
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v11 = (void *)objc_msgSend(v9, "nodes");
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
      v13 = 0.0;
      if (v12)
      {
        v14 = v12;
        v15 = *(_QWORD *)v61;
        do
        {
          for (k = 0; k != v14; ++k)
          {
            if (*(_QWORD *)v61 != v15)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "size");
            if (v13 < v17)
              v13 = v17;
          }
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        }
        while (v14);
      }
      v18 = objc_msgSend((id)objc_msgSend(v9, "nodes"), "count");
      v19 = 0.0;
      if (v18 >= 6)
        v19 = self->separation.height * 0.5;
      v20 = v10 + v19;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v21 = (void *)objc_msgSend(v9, "nodes");
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v57;
        do
        {
          for (m = 0; m != v23; ++m)
          {
            if (*(_QWORD *)v57 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * m), "setCy:", v13 * 0.5 + v20);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        }
        while (v23);
      }
      v26 = objc_msgSend((id)objc_msgSend(v9, "nodes"), "count");
      height = self->separation.height;
      v28 = height * 0.5;
      if (v26 <= 5)
        v28 = 0.0;
      v10 = v20 + v28 + v13 + height;
      v9 = (void *)objc_msgSend(v6, "nextObject");
    }
    while (v9);
  }
}

- (GVGraph)graph
{
  return self->graph;
}

- (void)setGraph:(id)a3
{
  self->graph = (GVGraph *)a3;
}

- (int)direction
{
  return self->direction;
}

- (void)setDirection:(int)a3
{
  self->direction = a3;
}

- (CGSize)separation
{
  double width;
  double height;
  CGSize result;

  width = self->separation.width;
  height = self->separation.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSeparation:(CGSize)a3
{
  self->separation = a3;
}

- (NSMutableArray)selfEdges
{
  return self->selfEdges;
}

- (void)setSelfEdges:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)ranks
{
  return self->ranks;
}

- (void)setRanks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
