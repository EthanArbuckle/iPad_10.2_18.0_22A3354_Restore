@implementation MFSearchResponseQueue

- (MFSearchResponseQueue)init
{
  MFSearchResponseQueue *v2;
  MFSearchResponseQueue *v3;
  NSMutableIndexSet *v4;
  NSMutableIndexSet *indexSet;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFSearchResponseQueue;
  v2 = -[MFBaseSyncResponseQueue init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MFBufferedQueue setMaximumLatency:](v2, "setMaximumLatency:", 60.0);
    v4 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    indexSet = v3->indexSet;
    v3->indexSet = v4;

  }
  return v3;
}

- (BOOL)addItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  unsigned int v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "responseType") == 14)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "searchResults", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (!v6)
      goto LABEL_13;
    v7 = *(_QWORD *)v13;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "unsignedIntValue");
        if (-[NSMutableIndexSet count](self->indexSet, "count") >= (unint64_t)self->limit)
        {
          v10 = -[NSMutableIndexSet firstIndex](self->indexSet, "firstIndex");
          if (v10 >= v9)
            continue;
          -[NSMutableIndexSet removeIndex:](self->indexSet, "removeIndex:", v10);
        }
        -[NSMutableIndexSet addIndex:](self->indexSet, "addIndex:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (!v6)
      {
LABEL_13:

        break;
      }
    }
  }

  return 1;
}

- (BOOL)flush
{
  NSMutableIndexSet *indexSet;
  uint64_t v4;
  uint64_t i;
  void *v6;
  objc_super v8;
  objc_super v9;

  indexSet = self->indexSet;
  if (indexSet)
  {
    v4 = -[NSMutableIndexSet lastIndex](indexSet, "lastIndex");
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v4;
            i != 0x7FFFFFFFFFFFFFFFLL;
            i = -[NSMutableIndexSet indexLessThanIndex:](self->indexSet, "indexLessThanIndex:", i))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9.receiver = self;
        v9.super_class = (Class)MFSearchResponseQueue;
        -[MFBufferedQueue addItem:](&v9, sel_addItem_, v6);

      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)MFSearchResponseQueue;
  return -[MFBufferedQueue flush](&v8, sel_flush);
}

- (unint64_t)uidForItem:(id)a3
{
  return objc_msgSend(a3, "unsignedIntegerValue");
}

- (unint64_t)flagsForItem:(id)a3
{
  return 0;
}

- (void)dealloc
{
  NSMutableIndexSet *indexSet;
  objc_super v4;

  indexSet = self->indexSet;
  self->indexSet = 0;

  v4.receiver = self;
  v4.super_class = (Class)MFSearchResponseQueue;
  -[MFSearchResponseQueue dealloc](&v4, sel_dealloc);
}

- (NSIndexSet)indexSet
{
  return &self->indexSet->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->indexSet, 0);
}

@end
