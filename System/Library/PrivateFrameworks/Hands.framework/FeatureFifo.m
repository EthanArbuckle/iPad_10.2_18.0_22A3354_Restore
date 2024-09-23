@implementation FeatureFifo

- (FeatureFifo)initWithFifoDepth:(unsigned int)a3 withBufSize:(unsigned int)a4
{
  FeatureFifo *v6;
  uint64_t v7;
  NSMutableArray *bufArray;
  unsigned int v9;
  NSMutableArray *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FeatureFifo;
  v6 = -[FeatureFifo init](&v13, sel_init);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  bufArray = v6->_bufArray;
  v6->_bufArray = (NSMutableArray *)v7;

  if (a3)
  {
    v9 = a3;
    do
    {
      v10 = v6->_bufArray;
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v10, "addObject:", v11);

      --v9;
    }
    while (v9);
  }
  v6->_fifoDepth = a3;
  v6->_bufSize = a4;
  *(_QWORD *)&v6->_endIndex = a3 - 1;
  v6->_currentDepth = 0;
  return v6;
}

- (void)resetAllBuffers
{
  FeatureFifo *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2->_bufArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        bzero((void *)objc_msgSend(v7, "mutableBytes", (_QWORD)v8), v2->_bufSize);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  *(_QWORD *)&v2->_endIndex = v2->_fifoDepth - 1;
  v2->_currentDepth = 0;
  objc_sync_exit(v2);

}

- (void)resetAllBuffers:(void *)a3
{
  FeatureFifo *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unsigned int fifoDepth;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4->_bufArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        memcpy((void *)objc_msgSend(v9, "mutableBytes", (_QWORD)v11), a3, v4->_bufSize);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  fifoDepth = v4->_fifoDepth;
  *(_QWORD *)&v4->_endIndex = fifoDepth - 1;
  v4->_currentDepth = fifoDepth;
  objc_sync_exit(v4);

}

- (unsigned)nextIndex:(unsigned int)a3
{
  if (a3 + 1 < self->_fifoDepth)
    return a3 + 1;
  else
    return 0;
}

- (unsigned)pushBuffer:(const void *)a3
{
  FeatureFifo *v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned int currentDepth;
  unsigned int fifoDepth;

  v4 = self;
  objc_sync_enter(v4);
  v5 = -[FeatureFifo nextIndex:](v4, "nextIndex:", v4->_endIndex);
  v4->_endIndex = v5;
  v4->_currentIndex = -[FeatureFifo nextIndex:](v4, "nextIndex:", v5);
  -[NSMutableArray objectAtIndexedSubscript:](v4->_bufArray, "objectAtIndexedSubscript:", v4->_endIndex);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (void *)objc_msgSend(v6, "mutableBytes");

  memcpy(v7, a3, v4->_bufSize);
  currentDepth = v4->_currentDepth;
  if (currentDepth + 1 < v4->_fifoDepth)
    fifoDepth = currentDepth + 1;
  else
    fifoDepth = v4->_fifoDepth;
  v4->_currentDepth = fifoDepth;
  objc_sync_exit(v4);

  return 1;
}

- (void)getNextBuffer
{
  FeatureFifo *v2;
  id v3;
  void *v4;
  int v5;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_currentIndex < 0)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](v2->_bufArray, "objectAtIndexedSubscript:");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (void *)objc_msgSend(v3, "mutableBytes");

    if (v2->_currentIndex == v2->_endIndex)
      v5 = -1;
    else
      v5 = -[FeatureFifo nextIndex:](v2, "nextIndex:");
    v2->_currentIndex = v5;
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)resetHead
{
  FeatureFifo *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_currentIndex = -[FeatureFifo nextIndex:](obj, "nextIndex:", obj->_endIndex);
  obj->_currentDepth = 0;
  objc_sync_exit(obj);

}

- (unsigned)currentIndex
{
  FeatureFifo *v2;
  unsigned int currentIndex;

  v2 = self;
  objc_sync_enter(v2);
  currentIndex = v2->_currentIndex;
  objc_sync_exit(v2);

  return currentIndex;
}

- (void)resetHeadToIndex:(unsigned int)a3 andDepth:(int)a4
{
  FeatureFifo *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_currentIndex = a3;
  obj->_currentDepth = a4;
  objc_sync_exit(obj);

}

- (int)currentDepth
{
  FeatureFifo *v2;
  int currentDepth;

  v2 = self;
  objc_sync_enter(v2);
  currentDepth = v2->_currentDepth;
  objc_sync_exit(v2);

  return currentDepth;
}

- (int)maxDepth
{
  FeatureFifo *v2;
  int fifoDepth;

  v2 = self;
  objc_sync_enter(v2);
  fifoDepth = v2->_fifoDepth;
  objc_sync_exit(v2);

  return fifoDepth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufArray, 0);
}

@end
