@implementation AVScrollingObserver

- (void)update
{
  NSHashTable *v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSHashTable *observedScrollViews;
  NSHashTable *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[NSHashTable addObject:](v3, "addObject:", v6);
        if ((objc_msgSend(v6, "_isScrollViewScrollObserver:", self) & 1) == 0)
          objc_msgSend(v6, "_addScrollViewScrollObserver:", self);

      }
      objc_msgSend(v5, "superview");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    while (v7);
  }
  v8 = (void *)-[NSHashTable copy](self->_observedScrollViews, "copy");
  objc_msgSend(v8, "minusHashTable:", v3);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13++), "_removeScrollViewScrollObserver:", self, (_QWORD)v17);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  observedScrollViews = self->_observedScrollViews;
  self->_observedScrollViews = v3;
  v15 = v3;

  -[NSHashTable anyObject](v15, "anyObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVScrollingObserver _observeScrollViewDidScroll:](self, "_observeScrollViewDidScroll:", v16);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  NSTimer *scrollingDidEndTimer;
  id WeakRetained;
  double v7;
  void *v8;
  NSTimer *v9;
  NSTimer *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  -[NSTimer invalidate](self->_scrollingDidEndTimer, "invalidate");
  scrollingDidEndTimer = self->_scrollingDidEndTimer;
  self->_scrollingDidEndTimer = 0;

  if (-[AVScrollingObserver isScrolling](self, "isScrolling"))
  {
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    if (objc_msgSend(WeakRetained, "avkit_isBeingScrollTested"))
      v7 = 0.1;
    else
      v7 = 0.0333333333;

    v8 = (void *)MEMORY[0x1E0C99E88];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __51__AVScrollingObserver__observeScrollViewDidScroll___block_invoke;
    v14 = &unk_1E5BB49A8;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v11, v7);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v10 = self->_scrollingDidEndTimer;
    self->_scrollingDidEndTimer = v9;

    -[NSTimer setTolerance:](self->_scrollingDidEndTimer, "setTolerance:", v7 * 0.5, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    -[AVScrollingObserver _updateScrollingStatus](self, "_updateScrollingStatus");
  }

}

- (void)_updateScrollingStatus
{
  NSObject *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[AVScrollingObserver _updateScrollingStatus]";
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", buf, 0xCu);
    }

  }
  -[NSTimer invalidate](self->_scrollingDidEndTimer, "invalidate");
  v4 = -[AVScrollingObserver isScrolling](self, "isScrolling");
  v5 = -[AVScrollingObserver isScrollingQuickly](self, "isScrollingQuickly");
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v7 = objc_msgSend(WeakRetained, "avkit_isBeingScrolled");

  v8 = objc_loadWeakRetained((id *)&self->_view);
  v9 = objc_msgSend(v8, "avkit_isBeingScrolledQuickly");

  -[AVScrollingObserver setScrolling:](self, "setScrolling:", v7);
  -[AVScrollingObserver setScrollingQuickly:](self, "setScrollingQuickly:", v9);
  if (v4 != -[AVScrollingObserver isScrolling](self, "isScrolling")
    || v5 != -[AVScrollingObserver isScrollingQuickly](self, "isScrollingQuickly"))
  {
    v10 = (void *)-[NSHashTable copy](self->_delegates, "copy");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "scrollingObserverDidChangeScrollingState:", self, (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (BOOL)isScrolling
{
  return self->_scrolling;
}

- (BOOL)isScrollingQuickly
{
  return self->_scrollingQuickly;
}

- (void)setScrollingQuickly:(BOOL)a3
{
  self->_scrollingQuickly = a3;
}

- (void)setScrolling:(BOOL)a3
{
  self->_scrolling = a3;
}

- (AVScrollingObserver)initWithView:(id)a3
{
  id v4;
  AVScrollingObserver *v5;
  uint64_t v6;
  NSHashTable *observedScrollViews;
  uint64_t v8;
  NSHashTable *delegates;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVScrollingObserver;
  v5 = -[AVScrollingObserver init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    observedScrollViews = v5->_observedScrollViews;
    v5->_observedScrollViews = (NSHashTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    delegates = v5->_delegates;
    v5->_delegates = (NSHashTable *)v8;

    objc_storeWeak((id *)&v5->_view, v4);
  }

  return v5;
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[AVScrollingObserver addDelegate:]";
      _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", (uint8_t *)&v6, 0xCu);
    }

  }
  -[NSHashTable addObject:](self->_delegates, "addObject:", v4);

}

- (void)dealloc
{
  void *v3;
  id v4;
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
  v3 = (void *)-[NSHashTable copy](self->_observedScrollViews, "copy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "_removeScrollViewScrollObserver:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)AVScrollingObserver;
  -[AVScrollingObserver dealloc](&v9, sel_dealloc);
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[AVScrollingObserver removeDelegate:]";
      _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", (uint8_t *)&v6, 0xCu);
    }

  }
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollingDidEndTimer, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_observedScrollViews, 0);
  objc_destroyWeak((id *)&self->_view);
}

void __51__AVScrollingObserver__observeScrollViewDidScroll___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateScrollingStatus");
    if ((id)v4[4] == v5)
    {
      v4[4] = 0;

    }
  }

}

@end
