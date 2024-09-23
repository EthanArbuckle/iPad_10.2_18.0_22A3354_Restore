@implementation ViewReuseManager

- (ViewReuseManager)init
{

  return 0;
}

- (ViewReuseManager)initWithReusableViewClass:(Class)a3
{
  ViewReuseManager *v4;
  ViewReuseManager *v5;
  NSMutableSet *v6;
  NSMutableSet *reusableViews;
  void *v8;
  ViewReuseManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ViewReuseManager;
  v4 = -[ViewReuseManager init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_reusableViewClass = a3;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    reusableViews = v5->_reusableViews;
    v5->_reusableViews = v6;

    v5->_firstPreviouslyVisibleRepresentedObjectIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__didReceiveMemoryWarning_, *MEMORY[0x1E0DC4778], 0);

    v9 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_reusableViews;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "removeFromSuperview");
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)ViewReuseManager;
  -[ViewReuseManager dealloc](&v9, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *trackedViews;
  NSMutableSet *v8;
  NSMutableSet *viewsPendingRecycling;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (obj)
    {
      if (!self->_trackedViews)
      {
        v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        trackedViews = self->_trackedViews;
        self->_trackedViews = v6;

        v5 = obj;
      }
      if (!self->_viewsPendingRecycling)
      {
        v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        viewsPendingRecycling = self->_viewsPendingRecycling;
        self->_viewsPendingRecycling = v8;

        v5 = obj;
      }
    }
  }

}

- (void)insertView:(id)a3 inTrackedViewsAtIndex:(int64_t)a4
{
  NSMutableArray *trackedViews;
  id v7;

  trackedViews = self->_trackedViews;
  v7 = a3;
  -[NSMutableArray insertObject:atIndex:](trackedViews, "insertObject:atIndex:", v7, a4);
  -[NSMutableSet removeObject:](self->_viewsPendingRecycling, "removeObject:", v7);

}

- (void)removeViewFromTrackedViews:(id)a3
{
  NSMutableSet *viewsPendingRecycling;
  id v5;

  viewsPendingRecycling = self->_viewsPendingRecycling;
  v5 = a3;
  -[NSMutableSet addObject:](viewsPendingRecycling, "addObject:", v5);
  -[NSMutableArray removeObject:](self->_trackedViews, "removeObject:", v5);

}

- (id)makeView
{
  uint64_t v3;
  id v4;

  -[NSMutableSet anyObject](self->_reusableViews, "anyObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (id)v3;
    -[NSMutableSet removeObject:](self->_reusableViews, "removeObject:", v3);
    objc_msgSend(v4, "setHidden:", 0);
  }
  else
  {
    v4 = objc_alloc_init(self->_reusableViewClass);
  }
  return v4;
}

- (void)recycleView:(id)a3
{
  NSMutableSet *reusableViews;
  id v4;

  reusableViews = self->_reusableViews;
  v4 = a3;
  -[NSMutableSet addObject:](reusableViews, "addObject:", v4);
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)updateTrackedViewsForRepresentedObjectsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id WeakRetained;
  NSUInteger v7;
  NSRange v8;
  NSRange v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger j;
  void *v24;
  NSUInteger v25;
  NSUInteger v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  NSRange v33;

  length = a3.length;
  location = a3.location;
  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (-[NSMutableSet count](self->_viewsPendingRecycling, "count"))
  {
    -[ViewReuseManager _recycleViewsInCollection:](self, "_recycleViewsInCollection:", self->_viewsPendingRecycling);
    -[ViewReuseManager _recycleViewsInCollection:](self, "_recycleViewsInCollection:", self->_trackedViews);
  }
  v7 = -[NSMutableArray count](self->_trackedViews, "count");
  if (v7)
  {
    v8.length = v7;
    v8.location = self->_firstPreviouslyVisibleRepresentedObjectIndex;
    if (!self->_alwaysSendPrepareForReuse && v8.location == location && v7 == length)
    {
      v13 = 0;
      goto LABEL_11;
    }
    v33.location = location;
    v33.length = length;
    v9 = NSIntersectionRange(v33, v8);
    v10 = v9.location;
    v11 = v9.length;
    if (v9.length)
    {
      v12 = v9.location - self->_firstPreviouslyVisibleRepresentedObjectIndex;
      -[NSMutableArray subarrayWithRange:](self->_trackedViews, "subarrayWithRange:", v12, v9.length);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInRange:](self->_trackedViews, "removeObjectsInRange:", v12, v9.length);
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    v11 = 0;
    v10 = 0;
  }
  if (v11)
    v14 = v10;
  else
    v14 = location;
  self->_firstPreviouslyVisibleRepresentedObjectIndex = location;
  -[ViewReuseManager _recycleViewsInCollection:](self, "_recycleViewsInCollection:", self->_trackedViews);
  if (location < v14)
  {
    v15 = location;
    do
      -[ViewReuseManager _addTrackedViewForRepresentedObjectAtIndex:](self, "_addTrackedViewForRepresentedObjectAtIndex:", v15++);
    while (v14 != v15);
  }
  if (v11)
  {
    v25 = location;
    v26 = length;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v13;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (self->_alwaysSendPrepareForReuse)
            objc_msgSend(WeakRetained, "viewReuseManager:prepareView:toRepresentObjectAtIndex:", self, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v10 + i);
          -[NSMutableArray addObject:](self->_trackedViews, "addObject:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v10 += i;
      }
      while (v18);
    }

    location = v25;
    length = v26;
    v13 = v24;
  }
  v22 = location + length;
  for (j = v14 + v11; j < v22; ++j)
    -[ViewReuseManager _addTrackedViewForRepresentedObjectAtIndex:](self, "_addTrackedViewForRepresentedObjectAtIndex:", j);
LABEL_11:

}

- (void)_didReceiveMemoryWarning:(id)a3
{
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v4 = self->_reusableViews;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeFromSuperview", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableSet removeAllObjects](self->_reusableViews, "removeAllObjects");
}

- (void)_recycleViewsInCollection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[ViewReuseManager _recycleView:](self, "_recycleView:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "removeAllObjects");

}

- (void)_recycleView:(id)a3
{
  ViewReuseManagerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "viewReuseManager:willRecycleView:", self, v5);
  -[ViewReuseManager recycleView:](self, "recycleView:", v5);

}

- (void)_addTrackedViewForRepresentedObjectAtIndex:(unint64_t)a3
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[ViewReuseManager makeView](self, "makeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "viewReuseManager:prepareView:toRepresentObjectAtIndex:", self, v5, a3);
  -[NSMutableArray addObject:](self->_trackedViews, "addObject:", v5);

}

- (Class)reusableViewClass
{
  return self->_reusableViewClass;
}

- (ViewReuseManagerDelegate)delegate
{
  return (ViewReuseManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)alwaysSendPrepareForReuse
{
  return self->_alwaysSendPrepareForReuse;
}

- (void)setAlwaysSendPrepareForReuse:(BOOL)a3
{
  self->_alwaysSendPrepareForReuse = a3;
}

- (NSArray)trackedViews
{
  return &self->_trackedViews->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewsPendingRecycling, 0);
  objc_storeStrong((id *)&self->_reusableViews, 0);
  objc_storeStrong((id *)&self->_trackedViews, 0);
}

@end
