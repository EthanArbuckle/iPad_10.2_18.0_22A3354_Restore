@implementation MSStickerBrowserView

- (MSStickerBrowserView)initWithFrame:(CGRect)frame
{
  MSStickerBrowserView *v3;
  MSStickerBrowserView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserView;
  v3 = -[MSStickerBrowserView initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_stickerSize = 1;
    -[MSStickerBrowserView configureStickerView](v3, "configureStickerView");
  }
  return v4;
}

- (MSStickerBrowserView)initWithCoder:(id)a3
{
  MSStickerBrowserView *v3;
  MSStickerBrowserView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserView;
  v3 = -[MSStickerBrowserView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_stickerSize = 1;
    -[MSStickerBrowserView configureStickerView](v3, "configureStickerView");
  }
  return v4;
}

- (MSStickerBrowserView)initWithFrame:(CGRect)frame stickerSize:(MSStickerSize)stickerSize
{
  MSStickerBrowserView *v5;
  MSStickerBrowserView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSStickerBrowserView;
  v5 = -[MSStickerBrowserView initWithFrame:](&v8, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_stickerSize = stickerSize;
    -[MSStickerBrowserView configureStickerView](v5, "configureStickerView");
  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MSStickerBrowserView animationTimer](self, "animationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)MSStickerBrowserView;
  -[MSStickerBrowserView dealloc](&v4, sel_dealloc);
}

- (void)setDataSource:(id)dataSource
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[MSStickerBrowserView reloadData](self, "reloadData");
    v5 = obj;
  }

}

- (CGPoint)contentOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[MSStickerBrowserView collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setContentOffset:(CGPoint)contentOffset
{
  double y;
  double x;
  id v5;

  y = contentOffset.y;
  x = contentOffset.x;
  -[MSStickerBrowserView collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:", x, y);

}

- (UIEdgeInsets)contentInset
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
  UIEdgeInsets result;

  -[MSStickerBrowserView collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = contentInset.right;
  bottom = contentInset.bottom;
  left = contentInset.left;
  top = contentInset.top;
  -[MSStickerBrowserView collectionView](self, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInset:", top, left, bottom, right);

}

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated
{
  _BOOL8 v4;
  double y;
  double x;
  id v7;

  v4 = animated;
  y = contentOffset.y;
  x = contentOffset.x;
  -[MSStickerBrowserView collectionView](self, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:animated:", v4, x, y);

}

- (void)configureStickerView
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  -[MSStickerBrowserView setBackgroundColor:](self, "setBackgroundColor:", 0);
  v10 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  objc_msgSend(v10, "setScrollDirection:", 0);
  -[MSStickerBrowserView setFlowLayout:](self, "setFlowLayout:", v10);
  v3 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[MSStickerBrowserView bounds](self, "bounds");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v10);
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 1);
  if (+[_MSPresentationState isRunningInCameraContext](_MSPresentationState, "isRunningInCameraContext"))
    v5 = 1;
  else
    v5 = 2;
  objc_msgSend(v4, "setIndicatorStyle:", v5);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setPrefetchingEnabled:", 1);
  objc_msgSend(v4, "setPrefetchDataSource:", self);
  objc_msgSend(v4, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("_kMSStickerCollectionViewCellReuseIdentifier"));
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  -[MSStickerBrowserView setCollectionView:](self, "setCollectionView:", v4);
  -[MSStickerBrowserView addSubview:](self, "addSubview:", v4);
  -[MSStickerBrowserView _updateCollectionViewSpecIfNeeded](self, "_updateCollectionViewSpecIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStickerBrowserView setCellsToAnimate:](self, "setCellsToAnimate:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MSStickerBrowserView setStickerCache:](self, "setStickerCache:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v9, "setQualityOfService:", 25);
  objc_msgSend(v9, "setSuspended:", 1);
  objc_msgSend(v9, "setUnderlyingQueue:", MEMORY[0x1E0C80D38]);
  -[MSStickerBrowserView setStickerCacheQueue:](self, "setStickerCacheQueue:", v9);

}

- (void)animateNextCell
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;

  -[MSStickerBrowserView cellsToAnimate](self, "cellsToAnimate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = -[MSStickerBrowserView currentlyAnimatingIndex](self, "currentlyAnimatingIndex");
    v6 = v5 + 1;
    -[MSStickerBrowserView cellsToAnimate](self, "cellsToAnimate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v5 + 1 < v8)
    {
      -[MSStickerBrowserView cellsToAnimate](self, "cellsToAnimate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "stickerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isPeeled");

      if (v12)
        v6 = v5 + 2;

    }
    -[MSStickerBrowserView cellsToAnimate](self, "cellsToAnimate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v6 >= v14)
      v6 = 0;
    -[MSStickerBrowserView cellsToAnimate](self, "cellsToAnimate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = 0;
      v18 = *MEMORY[0x1E0C99860];
      do
      {
        -[MSStickerBrowserView cellsToAnimate](self, "cellsToAnimate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndex:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6 == v17)
        {
          objc_msgSend(v20, "stickerView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "animationDuration");
          v23 = v22;

          v24 = v23 + v23;
          if (v23 >= 0.5)
            v24 = v23;
          objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_animateNextCell, 0, 0, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addTimer:forMode:", v25, v18);

          -[MSStickerBrowserView setAnimationTimer:](self, "setAnimationTimer:", v25);
        }
        objc_msgSend(v20, "setAnimating:", v6 == v17);

        ++v17;
        -[MSStickerBrowserView cellsToAnimate](self, "cellsToAnimate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

      }
      while (v17 < v28);
    }
    -[MSStickerBrowserView setCurrentlyAnimatingIndex:](self, "setCurrentlyAnimatingIndex:", v6);
  }
  else
  {
    -[MSStickerBrowserView animationTimer](self, "animationTimer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "invalidate");

    -[MSStickerBrowserView setAnimationTimer:](self, "setAnimationTimer:", 0);
  }
}

- (void)reloadData
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  -[MSStickerBrowserView setLayoutSpec:](self, "setLayoutSpec:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_dataSource);
    self->_stickerSize = objc_msgSend(v5, "stickerSize");

  }
  -[MSStickerBrowserView _updateCollectionViewSpecIfNeeded](self, "_updateCollectionViewSpecIfNeeded");
  -[MSStickerBrowserView stickerCache](self, "stickerCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

- (void)_reloadStickersAtIndexes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__MSStickerBrowserView__reloadStickersAtIndexes___block_invoke;
  v10[3] = &unk_1EA25C8B8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v10);

  -[MSStickerBrowserView stickerCache](self, "stickerCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsForKeys:", v9);

  -[MSStickerBrowserView collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadItemsAtIndexPaths:", v9);

}

void __49__MSStickerBrowserView__reloadStickersAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_stickerAtIndexPath:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v7, "stickerBrowserView:stickerAtIndex:", self, objc_msgSend(v4, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t i;
  void *v14;
  double x;
  double y;
  double width;
  double height;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;

  v42 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)MSStickerBrowserView;
  -[MSStickerBrowserView layoutSubviews](&v40, sel_layoutSubviews);
  -[MSStickerBrowserView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v4, "childViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend(v14, "conformsToProtocol:", &unk_1F02D8448))
        {
          objc_msgSend(v14, "initialFrameBeforeAppearance");
          x = v43.origin.x;
          y = v43.origin.y;
          width = v43.size.width;
          height = v43.size.height;
          v44.origin.x = v9;
          v44.origin.y = v10;
          v44.size.width = v11;
          v44.size.height = v12;
          if (!CGRectEqualToRect(v43, v44))
          {
            objc_msgSend(v14, "view");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSStickerBrowserView convertRect:fromView:](self, "convertRect:fromView:", v19, x, y, width, height);
            v21 = v20;
            v23 = v22;
            v25 = v24;
            v27 = v26;

            -[MSStickerBrowserView collectionView](self, "collectionView");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[MSStickerBrowserView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStickerBrowserView bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");
LABEL_12:

  -[MSStickerBrowserView _updateCollectionViewSpecIfNeeded](self, "_updateCollectionViewSpecIfNeeded");
  if (-[MSStickerBrowserView isRestoringContentOffset](self, "isRestoringContentOffset"))
  {
    -[MSStickerBrowserView browserSizeToRestoreFrom](self, "browserSizeToRestoreFrom");
    v30 = v29;
    v32 = v31;
    -[MSStickerBrowserView bounds](self, "bounds");
    if (v30 == v34 && v32 == v33)
    {
      -[MSStickerBrowserView collectionView](self, "collectionView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSStickerBrowserView restoredContentOffset](self, "restoredContentOffset");
      objc_msgSend(v35, "setContentOffset:");

    }
    -[MSStickerBrowserView setIsRestoringContentOffset:](self, "setIsRestoringContentOffset:", 0);
  }

}

- (void)didMoveToWindow
{
  void *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSStickerBrowserView;
  -[MSStickerBrowserView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[MSStickerBrowserView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__MSStickerBrowserView_didMoveToWindow__block_invoke;
    block[3] = &unk_1EA25C5A0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __39__MSStickerBrowserView_didMoveToWindow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAnimating");
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  MSStickerBrowserViewDataSource **p_dataSource;
  id WeakRetained;
  char v7;
  id v8;
  int64_t v9;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
    return 0;
  v8 = objc_loadWeakRetained((id *)p_dataSource);
  v9 = objc_msgSend(v8, "numberOfStickersInStickerBrowserView:", self);

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("_kMSStickerCollectionViewCellReuseIdentifier"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  -[MSStickerBrowserView stickerCache](self, "stickerCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[MSStickerBrowserView _stickerAtIndexPath:](self, "_stickerAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "setSticker:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_displayDelegate);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)&self->_displayDelegate);
    v12 = objc_msgSend(v11, "stickerBrowserView:shouldDrawBorderAroundSticker:", self, v9);

    objc_msgSend(v14, "showCellBorder:", v12);
  }
  if (-[MSStickerBrowserView isAnimating](self, "isAnimating"))
  {
    objc_msgSend(v14, "stickerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAnimating:", 1);

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5;

  objc_msgSend(a4, "stickerView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimating:", 0);

}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[MSStickerBrowserView stickerCacheQueue](self, "stickerCacheQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuspended:", 0);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v21 = *(_QWORD *)v27;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[MSStickerBrowserView _stickerAtIndexPath:](self, "_stickerAtIndexPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v9;
        v24[1] = 3221225472;
        v24[2] = __65__MSStickerBrowserView_collectionView_prefetchItemsAtIndexPaths___block_invoke;
        v24[3] = &unk_1EA25C5A0;
        v13 = v12;
        v25 = v13;
        v14 = (void *)MEMORY[0x1DF0AA1E8](v24);
        v22[0] = v9;
        v22[1] = 3221225472;
        v22[2] = __65__MSStickerBrowserView_collectionView_prefetchItemsAtIndexPaths___block_invoke_2;
        v22[3] = &unk_1EA25C5A0;
        v23 = v13;
        v15 = v13;
        v16 = (void *)MEMORY[0x1DF0AA1E8](v22);
        -[MSStickerBrowserView stickerCache](self, "stickerCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v15, v11);

        -[MSStickerBrowserView stickerCacheQueue](self, "stickerCacheQueue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addOperationWithBlock:", v14);

        -[MSStickerBrowserView stickerCacheQueue](self, "stickerCacheQueue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addOperationWithBlock:", v16);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

}

uint64_t __65__MSStickerBrowserView_collectionView_prefetchItemsAtIndexPaths___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateImageData");
}

uint64_t __65__MSStickerBrowserView_collectionView_prefetchItemsAtIndexPaths___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateThumbnail");
}

- (void)_updateCollectionViewSpecIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[MSStickerBrowserView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation");

  -[MSStickerBrowserView layoutSpec](self, "layoutSpec");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[MSStickerBrowserView layoutSpec](self, "layoutSpec"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "interfaceOrientation"),
        v8,
        v7,
        v9 != v5))
  {
    -[MSStickerBrowserView setLayoutSpec:](self, "setLayoutSpec:", 0);
    +[MSStickerBrowserViewLayoutSpec specWithSizeClass:interfaceOrientation:](MSStickerBrowserViewLayoutSpec, "specWithSizeClass:interfaceOrientation:", -[MSStickerBrowserView stickerSize](self, "stickerSize"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerBrowserView setLayoutSpec:](self, "setLayoutSpec:", v10);

    -[MSStickerBrowserView flowLayout](self, "flowLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerBrowserView layoutSpec](self, "layoutSpec");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minimumInteritemSpacing");
    objc_msgSend(v11, "setMinimumInteritemSpacing:");
    objc_msgSend(v12, "itemSize");
    objc_msgSend(v11, "setItemSize:");
    objc_msgSend(v12, "minimumLineSpacing");
    objc_msgSend(v11, "setMinimumLineSpacing:");
    objc_msgSend(v12, "sectionInset");
    objc_msgSend(v11, "setSectionInset:");

  }
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

- (void)prepareForSnapshotting
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MSStickerBrowserView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MSStickerBrowserView collectionView](self, "collectionView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "stickerView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "prepareForSnapshotting");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserView;
  -[MSStickerBrowserView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  -[MSStickerBrowserView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);
  objc_msgSend(v5, "setScrollEnabled:", v3);
  if (!v3)
  {
    objc_msgSend(v5, "contentOffset");
    objc_msgSend(v5, "setContentOffset:animated:", 0);
  }

}

- (NSDictionary)stateRestorationInfo
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  -[MSStickerBrowserView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;

  v18[0] = CFSTR("x-offset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v18[1] = CFSTR("y-offset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  v18[2] = CFSTR("x-size");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[MSStickerBrowserView bounds](self, "bounds");
  objc_msgSend(v10, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  v18[3] = CFSTR("y-size");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[MSStickerBrowserView bounds](self, "bounds");
  objc_msgSend(v13, "numberWithDouble:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v16;
}

- (void)restoreFromState:(id)a3
{
  id v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  float v14;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x-offset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y-offset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  -[MSStickerBrowserView setRestoredContentOffset:](self, "setRestoredContentOffset:", v7, v9);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x-size"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y-size"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "floatValue");
  -[MSStickerBrowserView setBrowserSizeToRestoreFrom:](self, "setBrowserSizeToRestoreFrom:", v12, v14);

  -[MSStickerBrowserView setIsRestoringContentOffset:](self, "setIsRestoringContentOffset:", 1);
}

- (void)invalidateFlowLayout
{
  id v2;

  -[MSStickerBrowserView flowLayout](self, "flowLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

}

- (void)_startAnimating
{
  void *v3;
  void *v4;
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
  -[MSStickerBrowserView setAnimating:](self, "setAnimating:", 1);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MSStickerBrowserView collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAnimating:", 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_stopAnimating
{
  void *v3;
  void *v4;
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
  -[MSStickerBrowserView setAnimating:](self, "setAnimating:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MSStickerBrowserView collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAnimating:", 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (MSStickerSize)stickerSize
{
  return self->_stickerSize;
}

- (id)dataSource
{
  return objc_loadWeakRetained((id *)&self->_dataSource);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_flowLayout, a3);
}

- (MSStickerBrowserViewLayoutSpec)layoutSpec
{
  return self->_layoutSpec;
}

- (void)setLayoutSpec:(id)a3
{
  objc_storeStrong((id *)&self->_layoutSpec, a3);
}

- (NSMutableArray)cellsToAnimate
{
  return self->_cellsToAnimate;
}

- (void)setCellsToAnimate:(id)a3
{
  objc_storeStrong((id *)&self->_cellsToAnimate, a3);
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void)setAnimationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_animationTimer, a3);
}

- (unint64_t)currentlyAnimatingIndex
{
  return self->_currentlyAnimatingIndex;
}

- (void)setCurrentlyAnimatingIndex:(unint64_t)a3
{
  self->_currentlyAnimatingIndex = a3;
}

- (CGPoint)restoredContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_restoredContentOffset.x;
  y = self->_restoredContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRestoredContentOffset:(CGPoint)a3
{
  self->_restoredContentOffset = a3;
}

- (CGSize)browserSizeToRestoreFrom
{
  double width;
  double height;
  CGSize result;

  width = self->_browserSizeToRestoreFrom.width;
  height = self->_browserSizeToRestoreFrom.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBrowserSizeToRestoreFrom:(CGSize)a3
{
  self->_browserSizeToRestoreFrom = a3;
}

- (BOOL)isRestoringContentOffset
{
  return self->_isRestoringContentOffset;
}

- (void)setIsRestoringContentOffset:(BOOL)a3
{
  self->_isRestoringContentOffset = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (NSMutableDictionary)stickerCache
{
  return self->_stickerCache;
}

- (void)setStickerCache:(id)a3
{
  objc_storeStrong((id *)&self->_stickerCache, a3);
}

- (NSOperationQueue)stickerCacheQueue
{
  return self->_stickerCacheQueue;
}

- (void)setStickerCacheQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stickerCacheQueue, a3);
}

- (MSStickerBrowserViewDisplayDelegate)displayDelegate
{
  return (MSStickerBrowserViewDisplayDelegate *)objc_loadWeakRetained((id *)&self->_displayDelegate);
}

- (void)setDisplayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_displayDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayDelegate);
  objc_storeStrong((id *)&self->_stickerCacheQueue, 0);
  objc_storeStrong((id *)&self->_stickerCache, 0);
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_storeStrong((id *)&self->_cellsToAnimate, 0);
  objc_storeStrong((id *)&self->_layoutSpec, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
