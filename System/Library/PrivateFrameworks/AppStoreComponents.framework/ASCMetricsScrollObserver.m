@implementation ASCMetricsScrollObserver

+ (id)observerForScrollView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  ASCMetricsScrollObserver *v6;

  v3 = a3;
  objc_getAssociatedObject(v3, "ASCMetricsScrollObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = -[ASCMetricsScrollObserver initWithScrollView:]([ASCMetricsScrollObserver alloc], "initWithScrollView:", v3);
    objc_setAssociatedObject(v3, "ASCMetricsScrollObserver", v6, (void *)1);
  }

  return v6;
}

- (ASCMetricsScrollObserver)initWithScrollView:(id)a3
{
  id v4;
  ASCMetricsScrollObserver *v5;
  ASCMetricsScrollObserver *v6;
  uint64_t v7;
  NSHashTable *delegates;
  NSMutableSet *v9;
  NSMutableSet *appearedModelIDs;
  NSMutableSet *v11;
  NSMutableSet *renderedModelIDs;
  id WeakRetained;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASCMetricsScrollObserver;
  v5 = -[ASCMetricsScrollObserver init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrollView, v4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    delegates = v6->_delegates;
    v6->_delegates = (NSHashTable *)v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    appearedModelIDs = v6->_appearedModelIDs;
    v6->_appearedModelIDs = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    renderedModelIDs = v6->_renderedModelIDs;
    v6->_renderedModelIDs = v11;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_scrollView);
    objc_msgSend(WeakRetained, "_addScrollViewScrollObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "_removeScrollViewScrollObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCMetricsScrollObserver;
  -[ASCMetricsScrollObserver dealloc](&v4, sel_dealloc);
}

- (CGSize)contentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[ASCMetricsScrollObserver scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)visibleRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[ASCMetricsScrollObserver scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)centerOfView:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  objc_msgSend(v4, "frame");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  v9 = floor(CGRectGetWidth(v19) * 0.5);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v10 = floor(CGRectGetHeight(v20) * 0.5);
  -[ASCMetricsScrollObserver scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromView:", v4, v9, v10);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (BOOL)isDelegateAdded:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ASCMetricsScrollObserver delegates](self, "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)addDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCMetricsScrollObserver delegates](self, "delegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCMetricsScrollObserver delegates](self, "delegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ASCMetricsScrollObserver delegates](self, "delegates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "scrollViewDidScroll:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)modelDidAppear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASCMetricsScrollObserver appearedModelIDs](self, "appearedModelIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v5);
}

- (void)modelDidDisappear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASCMetricsScrollObserver appearedModelIDs](self, "appearedModelIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObject:", v5);
}

- (BOOL)hasModelAppeared:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ASCMetricsScrollObserver appearedModelIDs](self, "appearedModelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (void)modelDidRender:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASCMetricsScrollObserver renderedModelIDs](self, "renderedModelIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v5);
}

- (BOOL)hasModelRendered:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ASCMetricsScrollObserver renderedModelIDs](self, "renderedModelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;

  -[ASCMetricsScrollObserver scrollView](self, "scrollView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCMetricsScrollObserver scrollViewDidScroll:](self, "scrollViewDidScroll:", v4);

}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (NSMutableSet)appearedModelIDs
{
  return self->_appearedModelIDs;
}

- (NSMutableSet)renderedModelIDs
{
  return self->_renderedModelIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedModelIDs, 0);
  objc_storeStrong((id *)&self->_appearedModelIDs, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_destroyWeak((id *)&self->_scrollView);
}

@end
