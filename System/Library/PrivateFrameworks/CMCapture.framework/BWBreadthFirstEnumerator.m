@implementation BWBreadthFirstEnumerator

- (BWBreadthFirstEnumerator)initWithGraph:(id)a3
{
  BWBreadthFirstEnumerator *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)BWBreadthFirstEnumerator;
  v4 = -[BWNodeEnumerator initWithGraph:](&v16, sel_initWithGraph_);
  if (v4)
  {
    v4->_queue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_holdQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_msgSend(a3, "_sourceNodes", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          -[NSMutableArray addObject:](v4->_queue, "addObject:", v10);
          -[BWNodeEnumerator _updateVisitedCount:]((uint64_t)v4, v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWBreadthFirstEnumerator;
  -[BWNodeEnumerator dealloc](&v3, sel_dealloc);
}

- (uint64_t)addChildren:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  int *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = (void *)objc_msgSend(a2, "outputs", 0);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v14;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v3);
          v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v6), "connection"), "input"), "node");
          if (v7)
          {
            if ((v8 = (void *)v7,
                  v9 = -[BWNodeEnumerator _updateVisitedCount:](v2, v7),
                  v9 == objc_msgSend((id)objc_msgSend(v8, "inputs"), "count") - 1)
              && (v10 = objc_msgSend(*(id *)(v2 + 40), "containsObject:", v8),
                  v11 = &OBJC_IVAR___BWBreadthFirstEnumerator__queue,
                  !v10)
              || (v12 = objc_msgSend(*(id *)(v2 + 40), "containsObject:", v8),
                  v11 = &OBJC_IVAR___BWBreadthFirstEnumerator__holdQueue,
                  (v12 & 1) == 0))
            {
              objc_msgSend(*(id *)(v2 + *v11), "addObject:", v8);
            }
          }
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (id)nextObject
{
  void *v3;

  if (-[NSMutableArray count](self->_queue, "count"))
  {
    v3 = (void *)-[NSMutableArray firstObject](self->_queue, "firstObject");
    -[NSMutableArray removeObjectAtIndex:](self->_queue, "removeObjectAtIndex:", 0);
  }
  else
  {
    if (!-[NSMutableArray count](self->_holdQueue, "count"))
      return 0;
    v3 = (void *)-[NSMutableArray firstObject](self->_holdQueue, "firstObject");
    -[NSMutableArray removeObjectAtIndex:](self->_holdQueue, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObjectsFromArray:](self->_queue, "addObjectsFromArray:", self->_holdQueue);
    -[NSMutableArray removeAllObjects](self->_holdQueue, "removeAllObjects");
  }
  -[BWBreadthFirstEnumerator addChildren:]((uint64_t)self, v3);
  return v3;
}

@end
