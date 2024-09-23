@implementation BWReverseBreadthFirstEnumerator

- (BWReverseBreadthFirstEnumerator)initWithGraph:(id)a3
{
  BWReverseBreadthFirstEnumerator *v4;
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
  v16.super_class = (Class)BWReverseBreadthFirstEnumerator;
  v4 = -[BWNodeEnumerator initWithGraph:](&v16, sel_initWithGraph_);
  if (v4)
  {
    v4->_queue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_msgSend(a3, "_sinkNodes", 0);
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
  v3.super_class = (Class)BWReverseBreadthFirstEnumerator;
  -[BWNodeEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_queue, "count"))
    return 0;
  v3 = (void *)-[NSMutableArray firstObject](self->_queue, "firstObject");
  -[NSMutableArray removeObjectAtIndex:](self->_queue, "removeObjectAtIndex:", 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_msgSend(v3, "inputs", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "connection"), "output"), "node");
        if (v9)
        {
          v10 = v9;
          if (!-[BWNodeEnumerator _updateVisitedCount:]((uint64_t)self, v9))
            -[NSMutableArray addObject:](self->_queue, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v3;
}

@end
