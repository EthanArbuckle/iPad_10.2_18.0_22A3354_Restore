@implementation SKScrollDetector

- (SKScrollDetector)initWithDelegate:(id)a3
{
  id v4;
  SKScrollDetector *v5;
  NSMutableArray *v6;
  NSMutableArray *subscribedScrollers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKScrollDetector;
  v5 = -[SKScrollDetector init](&v9, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subscribedScrollers = v5->_subscribedScrollers;
    v5->_subscribedScrollers = v6;

    objc_storeWeak((id *)&v5->_screenTrakingDelegate, v4);
  }

  return v5;
}

- (SKScrollDetector)init
{
  return -[SKScrollDetector initWithDelegate:](self, "initWithDelegate:", 0);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SKScrollDetector subscribedScrollers](self, "subscribedScrollers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "scrollingView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObserver:forKeyPath:context:", self, CFSTR("contentOffset"), &scrollingKVOContext);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[SKScrollDetector subscribedScrollers](self, "subscribedScrollers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  v10.receiver = self;
  v10.super_class = (Class)SKScrollDetector;
  -[SKScrollDetector dealloc](&v10, sel_dealloc);
}

- (void)findAndListenForScrollingOfView:(id)a3
{
  void *v4;
  id v5;
  SKWeakContainer *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v19 = a3;
  if (v19)
  {
    v4 = v19;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("contentOffset"), 1, &scrollingKVOContext);
        v6 = objc_alloc_init(SKWeakContainer);
        -[SKWeakContainer setScrollingView:](v6, "setScrollingView:", v5);
        -[SKWeakContainer setTrackingView:](v6, "setTrackingView:", v19);
        v7 = objc_msgSend(v19, "_sk_isAtLeast50PercentOnScreen");

        -[SKWeakContainer setWasOnScreen:](v6, "setWasOnScreen:", v7);
        -[SKScrollDetector subscribedScrollers](self, "subscribedScrollers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v6);

      }
      objc_msgSend(v4, "frame");
      objc_msgSend(v4, "frame");
      objc_msgSend(v4, "bounds");
      objc_msgSend(v4, "bounds");
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      objc_msgSend(v4, "bounds");
      CGRectGetHeight(v20);
      v21.origin.x = v11;
      v21.origin.y = v13;
      v21.size.width = v15;
      v21.size.height = v17;
      objc_msgSend(v4, "bounds", CGRectGetHeight(v21));
      CGRectGetWidth(v22);
      v23.origin.x = v11;
      v23.origin.y = v13;
      v23.size.width = v15;
      v23.size.height = v17;
      objc_msgSend(v4, "superview", CGRectGetWidth(v23));
      v18 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v18;
    }
    while (v18);
  }

}

- (void)stopListeningForScrollingOfView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SKScrollDetector subscribedScrollers](self, "subscribedScrollers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "trackingView");
        v12 = objc_claimAutoreleasedReturnValue();
        if ((id)v12 == v4)
        {

        }
        else
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "trackingView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            continue;
        }
        objc_msgSend(v11, "scrollingView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObserver:forKeyPath:context:", self, CFSTR("contentOffset"), &scrollingKVOContext);

        objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[SKScrollDetector subscribedScrollers](self, "subscribedScrollers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectsInArray:", v5);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (a6 == &scrollingKVOContext)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_24;
    v32 = v10;
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[SKScrollDetector subscribedScrollers](self, "subscribedScrollers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (!v14)
      goto LABEL_23;
    v15 = v14;
    v16 = *(_QWORD *)v35;
LABEL_6:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v17);
      objc_msgSend(v18, "trackingView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v18, "scrollingView");
        v20 = (id)objc_claimAutoreleasedReturnValue();

        if (v20 == v11)
        {
          objc_msgSend(v18, "trackingView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "_sk_isAtLeast50PercentOnScreen"))
          {
            v22 = objc_msgSend(v18, "wasOnScreen");

            if ((v22 & 1) == 0)
            {
              -[SKScrollDetector screenTrakingDelegate](self, "screenTrakingDelegate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "trackingView");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "sk_didBecomeOnScreen:", v24);

              v25 = v18;
              v26 = 1;
LABEL_20:
              objc_msgSend(v25, "setWasOnScreen:", v26);
              goto LABEL_21;
            }
          }
          else
          {

          }
          objc_msgSend(v18, "trackingView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v27, "_sk_isAtLeast50PercentOnScreen") & 1) != 0)
          {

          }
          else
          {
            v28 = objc_msgSend(v18, "wasOnScreen");

            if (v28)
            {
              -[SKScrollDetector screenTrakingDelegate](self, "screenTrakingDelegate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "trackingView");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "sk_didBecomeOffScreen:", v30);

              v25 = v18;
              v26 = 0;
              goto LABEL_20;
            }
          }
        }
      }
      else
      {
        objc_msgSend(v12, "addObject:", v18);
      }
LABEL_21:
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (!v15)
        {
LABEL_23:

          -[SKScrollDetector subscribedScrollers](self, "subscribedScrollers");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "removeObjectsInArray:", v12);

          v10 = v32;
          goto LABEL_24;
        }
        goto LABEL_6;
      }
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)SKScrollDetector;
  -[SKScrollDetector observeValueForKeyPath:ofObject:change:context:](&v33, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
LABEL_24:

}

- (SKScreenTrackingDelegate)screenTrakingDelegate
{
  return (SKScreenTrackingDelegate *)objc_loadWeakRetained((id *)&self->_screenTrakingDelegate);
}

- (void)setScreenTrakingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_screenTrakingDelegate, a3);
}

- (NSMutableArray)subscribedScrollers
{
  return self->_subscribedScrollers;
}

- (void)setSubscribedScrollers:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedScrollers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedScrollers, 0);
  objc_destroyWeak((id *)&self->_screenTrakingDelegate);
}

@end
