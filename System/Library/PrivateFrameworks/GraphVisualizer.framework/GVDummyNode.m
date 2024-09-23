@implementation GVDummyNode

- (void)computePriority
{
  NSMutableOrderedSet *inNodes;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSMutableOrderedSet *outNodes;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  self->super.inPriority = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  inNodes = self->super.inNodes;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](inNodes, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(inNodes);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "isMemberOfClass:", objc_opt_class()))
          v8 = 8;
        else
          v8 = 2;
        self->super.inPriority += v8;
      }
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](inNodes, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }
  self->super.outPriority = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  outNodes = self->super.outNodes;
  v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](outNodes, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(outNodes);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "isMemberOfClass:", objc_opt_class()))
          v14 = 8;
        else
          v14 = 2;
        self->super.inPriority += v14;
      }
      v11 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](outNodes, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }
}

@end
