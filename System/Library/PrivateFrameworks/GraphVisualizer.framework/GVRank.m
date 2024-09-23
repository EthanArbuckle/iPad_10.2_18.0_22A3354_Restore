@implementation GVRank

- (GVRank)initWithSeparation:(CGSize)a3
{
  GVRank *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GVRank;
  v3 = -[GVRank init](&v5, sel_init, a3.width, a3.height);
  if (v3)
  {
    v3->nodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->prev = 0;
    v3->next = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray dealloc](self->nodes, "dealloc");
  v3.receiver = self;
  v3.super_class = (Class)GVRank;
  -[GVRank dealloc](&v3, sel_dealloc);
}

- (id)nodes
{
  return self->nodes;
}

- (void)addNode:(id)a3
{
  uint64_t v5;

  -[NSMutableArray addObject:](self->nodes, "addObject:");
  objc_msgSend(a3, "setIndex:", -[NSMutableArray count](self->nodes, "count") - 1);
  if (objc_msgSend(a3, "index"))
    v5 = -[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", objc_msgSend(a3, "index") - 1);
  else
    v5 = 0;
  objc_msgSend(a3, "setPrev:", v5);
  objc_msgSend(a3, "setNext:", 0);
}

- (void)removeNode:(id)a3
{
  unint64_t v5;

  -[NSMutableArray removeObject:](self->nodes, "removeObject:");
  if (objc_msgSend(a3, "prev"))
    objc_msgSend((id)objc_msgSend(a3, "prev"), "setNext:", objc_msgSend(a3, "next"));
  if (objc_msgSend(a3, "next"))
    objc_msgSend((id)objc_msgSend(a3, "next"), "setPrev:", objc_msgSend(a3, "prev"));
  objc_msgSend(a3, "setPrev:", 0);
  objc_msgSend(a3, "setNext:", 0);
  if (-[NSMutableArray count](self->nodes, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v5), "setIndex:", v5);
      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->nodes, "count"));
  }
}

- (id)neighborsOfNode:(id)a3
{
  void *v5;
  NSMutableArray *nodes;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  nodes = self->nodes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(nodes);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(a3, "hasEdgeTo:", v11) & 1) != 0 || objc_msgSend(a3, "hasEdgeFrom:", v11))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

- (void)sortByIndex
{
  unint64_t v3;

  -[NSMutableArray sortUsingComparator:](self->nodes, "sortUsingComparator:", &__block_literal_global_136);
  if (-[NSMutableArray count](self->nodes, "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v3), "setIndex:", v3);
      ++v3;
    }
    while (v3 < -[NSMutableArray count](self->nodes, "count"));
  }
}

- (void)exchangeNodeAtIndex:(unint64_t)a3 withNodeAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;

  v7 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:");
  v8 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", a4);
  objc_msgSend(v7, "setIndex:", a4);
  -[NSMutableArray setObject:atIndexedSubscript:](self->nodes, "setObject:atIndexedSubscript:", v7, a4);
  objc_msgSend(v8, "setIndex:", a3);
  -[NSMutableArray setObject:atIndexedSubscript:](self->nodes, "setObject:atIndexedSubscript:", v8, a3);
}

- (void)buildNodeIterators
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)-[NSMutableArray objectEnumerator](self->nodes, "objectEnumerator");
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
  v7 = (void *)-[NSMutableArray reverseObjectEnumerator](self->nodes, "reverseObjectEnumerator", v5);
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

- (unint64_t)inCrossings
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->nodes, "count"))
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = v3++;
    if (v3 < -[NSMutableArray count](self->nodes, "count"))
    {
      v22 = v3;
      do
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        obj = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v5), "inNodes");
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v28;
          v17 = v5;
          v18 = v3;
          do
          {
            v6 = 0;
            do
            {
              if (*(_QWORD *)v28 != v21)
                objc_enumerationMutation(obj);
              v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v6);
              v23 = 0u;
              v24 = 0u;
              v25 = 0u;
              v26 = 0u;
              v8 = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v22, v17, v18), "inNodes");
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v9)
              {
                v10 = v9;
                v11 = *(_QWORD *)v24;
                do
                {
                  v12 = 0;
                  do
                  {
                    if (*(_QWORD *)v24 != v11)
                      objc_enumerationMutation(v8);
                    v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
                    v14 = objc_msgSend(v7, "rank");
                    if (v14 != objc_msgSend(v13, "rank"))
                      -[GVRank inCrossings].cold.1();
                    v15 = objc_msgSend(v13, "index");
                    if (v15 < objc_msgSend(v7, "index"))
                      ++v4;
                    ++v12;
                  }
                  while (v10 != v12);
                  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                }
                while (v10);
              }
              ++v6;
            }
            while (v6 != v20);
            v5 = v17;
            v3 = v18;
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          }
          while (v20);
        }
        ++v22;
      }
      while (v22 < -[NSMutableArray count](self->nodes, "count"));
    }
  }
  while (v3 < -[NSMutableArray count](self->nodes, "count"));
  return v4;
}

- (unint64_t)outCrossings
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->nodes, "count"))
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = v3++;
    if (v3 < -[NSMutableArray count](self->nodes, "count"))
    {
      v22 = v3;
      do
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        obj = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v5), "outNodes");
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v28;
          v17 = v5;
          v18 = v3;
          do
          {
            v6 = 0;
            do
            {
              if (*(_QWORD *)v28 != v21)
                objc_enumerationMutation(obj);
              v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v6);
              v23 = 0u;
              v24 = 0u;
              v25 = 0u;
              v26 = 0u;
              v8 = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v22, v17, v18), "outNodes");
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v9)
              {
                v10 = v9;
                v11 = *(_QWORD *)v24;
                do
                {
                  v12 = 0;
                  do
                  {
                    if (*(_QWORD *)v24 != v11)
                      objc_enumerationMutation(v8);
                    v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
                    v14 = objc_msgSend(v7, "rank");
                    if (v14 != objc_msgSend(v13, "rank"))
                      -[GVRank outCrossings].cold.1();
                    v15 = objc_msgSend(v13, "index");
                    if (v15 < objc_msgSend(v7, "index"))
                      ++v4;
                    ++v12;
                  }
                  while (v10 != v12);
                  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                }
                while (v10);
              }
              ++v6;
            }
            while (v6 != v20);
            v5 = v17;
            v3 = v18;
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          }
          while (v20);
        }
        ++v22;
      }
      while (v22 < -[NSMutableArray count](self->nodes, "count"));
    }
  }
  while (v3 < -[NSMutableArray count](self->nodes, "count"));
  return v4;
}

- (double)width
{
  return 0.0;
}

- (double)height
{
  return 0.0;
}

- (CGSize)sizeForDummy
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (GVRank)prev
{
  return self->prev;
}

- (void)setPrev:(id)a3
{
  self->prev = (GVRank *)a3;
}

- (GVRank)next
{
  return self->next;
}

- (void)setNext:(id)a3
{
  self->next = (GVRank *)a3;
}

- (void)inCrossings
{
  __assert_rtn("-[GVRank inCrossings]", "GVLayout.m", 329, "inNodeI.rank == inNodeJ.rank");
}

- (void)outCrossings
{
  __assert_rtn("-[GVRank outCrossings]", "GVLayout.m", 345, "outNodeI.rank == outNodeJ.rank");
}

@end
