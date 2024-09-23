@implementation GKCollectionMultiDataSource

- (id)dataSourceForIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = objc_msgSend(a3, "section");
  if (-[NSArray count](self->_dataSources, "count") <= v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionMultiDataSource.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (_dataSources.count > section)\n[%s (%s:%d)]"), v6, "-[GKCollectionMultiDataSource dataSourceForIndexPath:]", objc_msgSend(v8, "UTF8String"), 18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  return -[NSArray objectAtIndexedSubscript:](self->_dataSources, "objectAtIndexedSubscript:", v4);
}

- (void)setupCollectionView:(id)a3
{
  id v4;
  NSArray *v5;
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
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_dataSources;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setupCollectionView:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)loadDataWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[3];
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v4 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionMultiDataSource.m", 35, "-[GKCollectionMultiDataSource loadDataWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_dataSources;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke;
        v20[3] = &unk_1E59C57D0;
        v20[4] = v12;
        v22 = v27;
        v21 = v6;
        objc_msgSend(v21, "perform:", v20);

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v8);
  }

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke_3;
  v16[3] = &unk_1E59C6FC8;
  v13 = v15;
  v18 = v13;
  v19 = v27;
  v14 = v6;
  v17 = v14;
  objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v16);

  _Block_object_dispose(v27, 8);
}

void __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E59C7B60;
  v9 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadDataWithCompletionHandler:", v6);

}

void __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v6 = v5;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

- (int64_t)itemCount
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
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
  v2 = self->_dataSources;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "itemCount", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)itemCountInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;

  if (-[NSArray count](self->_dataSources, "count") <= a3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionMultiDataSource.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (_dataSources.count > section)\n[%s (%s:%d)]"), v6, "-[GKCollectionMultiDataSource itemCountInSection:]", objc_msgSend(v8, "UTF8String"), 69);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  -[NSArray objectAtIndexedSubscript:](self->_dataSources, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "itemCount");

  return v11;
}

- (double)preferredCollectionHeight
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
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
  v2 = self->_dataSources;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "preferredCollectionHeight", (_QWORD)v10);
        if (v8 > v6)
          v6 = v8;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)itemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKCollectionMultiDataSource dataSourceForIndexPath:](self, "dataSourceForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[NSArray count](self->_dataSources, "count", a3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[GKCollectionMultiDataSource itemCountInSection:](self, "itemCountInSection:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[GKCollectionMultiDataSource dataSourceForIndexPath:](self, "dataSourceForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView:cellForItemAtIndexPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[GKCollectionMultiDataSource dataSourceForIndexPath:](self, "dataSourceForIndexPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if (-[NSArray count](self->_dataSources, "count") <= a5)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionMultiDataSource.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (_dataSources.count > section)\n[%s (%s:%d)]"), v11, "-[GKCollectionMultiDataSource collectionView:layout:referenceSizeForHeaderInSection:]", objc_msgSend(v13, "UTF8String"), 125);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  -[NSArray objectAtIndexedSubscript:](self->_dataSources, "objectAtIndexedSubscript:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "collectionView:layout:referenceSizeForHeaderInSection:", v8, v9, a5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = *MEMORY[0x1E0C9D820];
      v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_9;
    }
    objc_msgSend(v9, "headerReferenceSize");
  }
  v18 = v16;
  v19 = v17;
LABEL_9:

  v20 = v18;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if (-[NSArray count](self->_dataSources, "count") <= a5)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionMultiDataSource.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (_dataSources.count > section)\n[%s (%s:%d)]"), v11, "-[GKCollectionMultiDataSource collectionView:layout:referenceSizeForFooterInSection:]", objc_msgSend(v13, "UTF8String"), 143);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  -[NSArray objectAtIndexedSubscript:](self->_dataSources, "objectAtIndexedSubscript:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "collectionView:layout:referenceSizeForFooterInSection:", v8, v9, a5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = *MEMORY[0x1E0C9D820];
      v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_9;
    }
    objc_msgSend(v9, "footerReferenceSize");
  }
  v18 = v16;
  v19 = v17;
LABEL_9:

  v20 = v18;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[GKCollectionMultiDataSource dataSourceForIndexPath:](self, "dataSourceForIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "collectionView:layout:sizeForItemAtIndexPath:", v8, v9, v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = *MEMORY[0x1E0C9D820];
      v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_7;
    }
    objc_msgSend(v9, "itemSize");
  }
  v14 = v12;
  v15 = v13;
LABEL_7:

  v16 = v14;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  -[GKCollectionMultiDataSource dataSourceForIndexPath:](self, "dataSourceForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v8, "collectionView:shouldSelectItemAtIndexPath:", v6, v7);
  else
    v9 = 1;

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[GKCollectionMultiDataSource dataSourceForIndexPath:](self, "dataSourceForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "presentationViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPresentationViewController:", v9);

    }
    objc_msgSend(v7, "collectionView:didSelectItemAtIndexPath:", v10, v6);
  }

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[GKCollectionMultiDataSource dataSourceForIndexPath:](self, "dataSourceForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "collectionView:didDeselectItemAtIndexPath:", v8, v6);

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[GKCollectionMultiDataSource dataSourceForIndexPath:](self, "dataSourceForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "collectionView:canFocusItemAtIndexPath:", v7, v6);

  return v9;
}

- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKCollectionMultiDataSource dataSourceForIndexPath:](self, "dataSourceForIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView:didFocusItemAtIndexPath:", v7, v6);

}

- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKCollectionMultiDataSource dataSourceForIndexPath:](self, "dataSourceForIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView:didUnfocusItemAtIndexPath:", v7, v6);

}

- (NSArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_dataSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSources, 0);
}

@end
