@implementation BWDepthFirstEnumerator

- (BWDepthFirstEnumerator)initWithGraph:(id)a3 vertexOrdering:(int)a4
{
  BWDepthFirstEnumerator *v5;
  BWDepthFirstEnumerator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWDepthFirstEnumerator;
  v5 = -[BWNodeEnumerator initWithGraph:](&v8, sel_initWithGraph_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_ordering = a4;
    v5->_stack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6->_currentSourceIndex = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDepthFirstEnumerator;
  -[BWNodeEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  id v3;
  unint64_t currentSourceIndex;
  NSMutableArray *stack;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_stack, "count"))
  {
    v3 = -[BWGraph _sourceNodes](self->super._graph, "_sourceNodes");
    currentSourceIndex = self->_currentSourceIndex;
    if (currentSourceIndex >= objc_msgSend(v3, "count"))
      return 0;
    -[NSMutableArray bw_push:](self->_stack, "bw_push:", objc_msgSend(v3, "objectAtIndexedSubscript:", self->_currentSourceIndex));
    -[BWNodeEnumerator _updateVisitedCount:]((uint64_t)self, objc_msgSend(v3, "objectAtIndexedSubscript:", self->_currentSourceIndex));
    ++self->_currentSourceIndex;
  }
  stack = self->_stack;
  if (self->_ordering)
  {
    v6 = -[BWDepthFirstEnumerator _nextUnvisitedChild:]((uint64_t)self, -[NSMutableArray bw_peek](stack, "bw_peek"));
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        -[NSMutableArray bw_push:](self->_stack, "bw_push:", v7);
        v7 = (void *)-[BWDepthFirstEnumerator _nextUnvisitedChild:]((uint64_t)self, v7);
      }
      while (v7);
    }
    v8 = -[NSMutableArray bw_pop](self->_stack, "bw_pop");
  }
  else
  {
    v8 = -[NSMutableArray bw_pop](stack, "bw_pop");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "outputs", 0), "reverseObjectEnumerator");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "connection"), "input"), "node");
          if (v14)
          {
            v15 = v14;
            if (!-[BWNodeEnumerator _updateVisitedCount:]((uint64_t)self, v14))
              -[NSMutableArray bw_push:](self->_stack, "bw_push:", v15);
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }
  }
  self->super._depth = 0;
  return v8;
}

- (uint64_t)_nextUnvisitedChild:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend((id)objc_msgSend(a2, "outputs", 0), "reverseObjectEnumerator");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v12;
LABEL_4:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v6)
      objc_enumerationMutation(v3);
    v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "connection"), "input"), "node");
    if (v8)
    {
      v9 = v8;
      if (!-[BWNodeEnumerator _updateVisitedCount:](a1, v8))
        return v9;
    }
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        goto LABEL_4;
      return 0;
    }
  }
}

@end
