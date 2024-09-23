@implementation TabOverviewItemLayoutInfo

- (void)updateItemView
{
  id WeakRetained;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  id *v13;
  void *v14;
  __int128 v15;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 216), *(double *)(a1 + 224), *(double *)(a1 + 232), *(double *)(a1 + 240));
    objc_msgSend(*(id *)(a1 + 56), "layer", *(_QWORD *)(a1 + 312), *(_QWORD *)(a1 + 320), *(_QWORD *)(a1 + 328), *(_QWORD *)(a1 + 336), *(_QWORD *)(a1 + 344), *(_QWORD *)(a1 + 352), *(_QWORD *)(a1 + 360), *(_QWORD *)(a1 + 368), *(_QWORD *)(a1 + 376), *(_QWORD *)(a1 + 384), *(_QWORD *)(a1 + 392), *(_QWORD *)(a1 + 400), *(_QWORD *)(a1 + 408), *(_QWORD *)(a1 + 416), *(_QWORD *)(a1 + 424), *(_QWORD *)(a1 + 432));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTransform:", &v15);

    v4 = *(double *)(a1 + 136);
    objc_msgSend(*(id *)(a1 + 56), "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setZPosition:", v4);

    objc_msgSend(WeakRetained, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setTitle:", v6);

    objc_msgSend(WeakRetained, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setIcon:", v7);

    objc_msgSend(*(id *)(a1 + 56), "setRecording:", objc_msgSend(WeakRetained, "isRecording"));
    objc_msgSend(*(id *)(a1 + 56), "setMediaStateIcon:", objc_msgSend(WeakRetained, "mediaStateIcon"));
    objc_msgSend(*(id *)(a1 + 56), "setUnread:", objc_msgSend(WeakRetained, "isUnread"));
    objc_msgSend(WeakRetained, "shareParticipants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setShareParticipants:", v8);

    objc_msgSend(*(id *)(a1 + 56), "setPinned:", objc_msgSend(WeakRetained, "isPinned"));
    v9 = *(double *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 56), "snapshotView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", v9);

    v11 = *(double *)(a1 + 128);
    objc_msgSend(*(id *)(a1 + 56), "dimmingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", v11);

    objc_msgSend(*(id *)(a1 + 56), "setAttachedView:", *(_QWORD *)(a1 + 120));
    objc_msgSend(*(id *)(a1 + 56), "setAttachedViewReferenceRect:", *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208));
    v13 = (id *)objc_loadWeakRetained((id *)(a1 + 24));
    -[TabOverview _topBarThemeForItem:](v13, WeakRetained);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setTopBarTheme:", v14);

    if (objc_msgSend(WeakRetained, "dragState") != 2)
      objc_msgSend(*(id *)(a1 + 56), "setAlpha:", *(double *)(a1 + 72));

  }
}

- (uint64_t)borrowedContentView
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (double)snapshotAlpha
{
  if (a1)
    return *(double *)(a1 + 80);
  else
    return 0.0;
}

- (void)setZPosition:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 136) != a2)
    {
      *(double *)(a1 + 136) = a2;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
}

- (void)setVisibleInTabOverview:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 17) != a2)
  {
    *(_BYTE *)(a1 + 17) = a2;
    if ((a2 & 1) == 0)
      -[TabOverviewItemLayoutInfo _clearViews](a1);
  }
}

- (__n128)setTransform:(uint64_t)a1
{
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __n128 result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CATransform3D v20;
  CATransform3D a;

  if (a1)
  {
    v4 = (_OWORD *)(a1 + 312);
    v5 = a2[5];
    *(_OWORD *)&a.m31 = a2[4];
    *(_OWORD *)&a.m33 = v5;
    v6 = a2[7];
    *(_OWORD *)&a.m41 = a2[6];
    *(_OWORD *)&a.m43 = v6;
    v7 = a2[1];
    *(_OWORD *)&a.m11 = *a2;
    *(_OWORD *)&a.m13 = v7;
    v8 = a2[3];
    *(_OWORD *)&a.m21 = a2[2];
    *(_OWORD *)&a.m23 = v8;
    v9 = *(_OWORD *)(a1 + 392);
    *(_OWORD *)&v20.m31 = *(_OWORD *)(a1 + 376);
    *(_OWORD *)&v20.m33 = v9;
    v10 = *(_OWORD *)(a1 + 424);
    *(_OWORD *)&v20.m41 = *(_OWORD *)(a1 + 408);
    *(_OWORD *)&v20.m43 = v10;
    v11 = *(_OWORD *)(a1 + 328);
    *(_OWORD *)&v20.m11 = *(_OWORD *)(a1 + 312);
    *(_OWORD *)&v20.m13 = v11;
    v12 = *(_OWORD *)(a1 + 360);
    *(_OWORD *)&v20.m21 = *(_OWORD *)(a1 + 344);
    *(_OWORD *)&v20.m23 = v12;
    if (!CATransform3DEqualToTransform(&a, &v20))
    {
      v14 = *a2;
      v15 = a2[1];
      v16 = a2[3];
      v4[2] = a2[2];
      v4[3] = v16;
      *v4 = v14;
      v4[1] = v15;
      v17 = a2[4];
      v18 = a2[5];
      v19 = a2[7];
      v4[6] = a2[6];
      v4[7] = v19;
      v4[4] = v17;
      v4[5] = v18;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
  return result;
}

- (void)setSnapshotAlpha:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 80) != a2)
    {
      *(double *)(a1 + 80) = a2;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
}

- (void)setFrame:(CGFloat)a3
{
  double v10;
  double v11;
  BOOL v12;
  char v13;
  BOOL v14;
  char v15;
  id WeakRetained;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v32.origin.x = a2;
    v32.origin.y = a3;
    v32.size.width = a4;
    v32.size.height = a5;
    if (!CGRectEqualToRect(*(CGRect *)(a1 + 216), v32))
    {
      if (fabs(a2) == INFINITY
        || ((v10 = fabs(a4), v11 = fabs(a5), fabs(a3) != INFINITY) ? (v12 = v10 == INFINITY) : (v12 = 1),
            !v12 ? (v13 = 0) : (v13 = 1),
            !v13 ? (v14 = v11 == INFINITY) : (v14 = 1),
            !v14 ? (v15 = 0) : (v15 = 1),
            v15))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
        objc_msgSend(WeakRetained, "items");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_loadWeakRetained((id *)(a1 + 32));
        v19 = objc_msgSend(v17, "indexOfObject:", v18);

        v20 = WBS_LOG_CHANNEL_PREFIXTabView();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          v22 = objc_msgSend(v17, "count");
          objc_msgSend(WeakRetained, "frame");
          NSStringFromCGRect(v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 134218498;
          v25 = v19;
          v26 = 2048;
          v27 = v22;
          v28 = 2114;
          v29 = v23;
          _os_log_error_impl(&dword_1D7CA3000, v21, OS_LOG_TYPE_ERROR, "Frame will be undefined for tab overview item at index: %ld, number of items: %ld, tab overview frame: %{public}@", (uint8_t *)&v24, 0x20u);

        }
      }
      *(CGFloat *)(a1 + 216) = a2;
      *(CGFloat *)(a1 + 224) = a3;
      *(CGFloat *)(a1 + 232) = a4;
      *(CGFloat *)(a1 + 240) = a5;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
}

- (void)setDimmingAlpha:(double)a3 animated:
{
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  double v10;

  if (a1)
  {
    *(double *)(a1 + 128) = a3;
    objc_msgSend(*(id *)(a1 + 56), "dimmingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0DC3F10];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__TabOverviewItemLayoutInfo_setDimmingAlpha_animated___block_invoke;
    v8[3] = &unk_1E9CF2538;
    v9 = v5;
    v10 = a3;
    v7 = v5;
    +[UIView safari_animate:withDuration:delay:options:animations:completion:](0.35, 0.0, v6, a2, 327682, v8, 0);

  }
}

- (void)setAlpha:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 72) != a2)
    {
      *(double *)(a1 + 72) = a2;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
}

- (double)alpha
{
  if (a1)
    return *(double *)(a1 + 72);
  else
    return 0.0;
}

uint64_t __54__TabOverviewItemLayoutInfo_setDimmingAlpha_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (uint64_t)interpolatedLocation
{
  if (result)
    return *(_QWORD *)(result + 144);
  return result;
}

- (uint64_t)interpolatedSnapshotAlpha
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (uint64_t)interpolatedHeightTransitionPercent
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (uint64_t)interpolatedCornerRadius
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

- (uint64_t)interpolatedBoundsLogScale
{
  if (result)
    return *(_QWORD *)(result + 112);
  return result;
}

- (void)setInterpolatedSnapshotAlpha:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (void)setInterpolatedLocation:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 144), a2);
}

- (void)setInterpolatedHeightTransitionPercent:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 104), a2);
}

- (void)setInterpolatedCornerRadius:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

- (void)setInterpolatedBoundsLogScale:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 112), a2);
}

- (id)initWithTabOverview:(void *)a3 item:
{
  id v5;
  id v6;
  id *v7;
  objc_super v9;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)TabOverviewItemLayoutInfo;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 3, v5);
      objc_storeWeak(a1 + 4, v6);
    }
  }

  return a1;
}

- (void)_updateSnapshotImage
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 56))
    {
      v6 = 0;
      WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 24));
      v3 = objc_loadWeakRetained((id *)(a1 + 32));
      v4 = *(void **)(a1 + 56);
      -[TabOverview _snapshotForItem:isBlank:](WeakRetained, v3, &v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateSnapshotWithImage:", v5);

      objc_msgSend(*(id *)(a1 + 56), "setAllowsSnapshotTopBackdropUnderlap:", -[TabOverview _itemHasAdditionalHeaderHeight:]((uint64_t)WeakRetained, v3));
      *(_BYTE *)(a1 + 16) = v6;

    }
  }
}

- (void)updateSnapshot
{
  if (a1)
    -[TabOverviewItemLayoutInfo _updateSnapshotImage](a1);
}

void __41__TabOverviewItemLayoutInfo__ensureViews__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  -[TabOverviewItemLayoutInfo updateItemView](*(_QWORD *)(a1 + 32));
  -[TabOverviewItemLayoutInfo _updateSnapshotImage](*(_QWORD *)(a1 + 32));
  -[TabOverviewItemLayoutInfo _insertBorrowedContentView](*(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "closeButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel__close_, 64);

  -[TabOverview scrollingContainerView](*(id **)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));

}

- (void)_insertBorrowedContentView
{
  id v2;
  id WeakRetained;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 56), "insertBorrowedContentView:headerHeight:", *(double *)(a1 + 48));
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      v2 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 56), "setAllowsBorrowedContentTopBackdropUnderlap:", -[TabOverview _itemHasAdditionalHeaderHeight:]((uint64_t)WeakRetained, v2));

    }
  }
}

- (id)itemView
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[TabOverviewItemLayoutInfo _ensureViews]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_ensureViews
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  id *v6;
  _QWORD v7[5];
  id *v8;

  if (a1 && *(_BYTE *)(a1 + 17) && !*(_QWORD *)(a1 + 56))
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 24));
    -[TabOverview _requestReusableTabOverviewItemView](WeakRetained);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v3;

    v5 = (void *)MEMORY[0x1E0DC3F10];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__TabOverviewItemLayoutInfo__ensureViews__block_invoke;
    v7[3] = &unk_1E9CF1830;
    v7[4] = a1;
    v8 = WeakRetained;
    v6 = WeakRetained;
    objc_msgSend(v5, "performWithoutAnimation:", v7);

  }
}

- (BOOL)visibleInTabOverview
{
  if (result)
    return *(_BYTE *)(result + 17) != 0;
  return result;
}

- (BOOL)interactivelyInserted
{
  if (result)
    return *(_BYTE *)(result + 18) != 0;
  return result;
}

- (double)frame
{
  if (a1)
    return *(double *)(a1 + 216);
  else
    return 0.0;
}

- (_QWORD)interpolatedValues
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[1];
    if (!v2)
    {
      v6 = a1[11];
      v7 = *((_OWORD *)a1 + 6);
      v8 = a1[14];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 4);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v1[1];
      v1[1] = v3;

      v2 = (void *)v1[1];
    }
    a1 = v2;
  }
  return a1;
}

- (TabOverviewItemLayoutInfo)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[TabOverviewItemLayoutInfo _clearViews]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)TabOverviewItemLayoutInfo;
  -[TabOverviewItemLayoutInfo dealloc](&v3, sel_dealloc);
}

- (void)_clearViews
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(*(id *)(a1 + 56), "setAttachedView:", 0);
    objc_msgSend(*(id *)(a1 + 56), "closeButton");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeTarget:action:forControlEvents:", WeakRetained, sel__close_, 64);

    v3 = objc_msgSend(*(id *)(a1 + 56), "containsBorrowedContentView:", *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 40);
    if ((v3 & 1) == 0)
    {
      if (!v4)
      {
LABEL_6:
        -[TabOverview _relinquishReusableTabOverviewItemView:]((uint64_t)WeakRetained, *(void **)(a1 + 56));
        objc_msgSend(*(id *)(a1 + 56), "updateSnapshotWithImage:", 0);
        v5 = *(void **)(a1 + 56);
        *(_QWORD *)(a1 + 56) = 0;

        return;
      }
      v4 = 0;
    }
    objc_msgSend(*(id *)(a1 + 56), "removeBorrowedContentView:", v4);
    goto LABEL_6;
  }
}

- (void)setBorrowedContentView:(double)a3 headerHeight:
{
  id v6;
  char v7;
  uint64_t v8;
  id v9;

  v6 = a2;
  if (a1 && (*(id *)(a1 + 40) != v6 || *(double *)(a1 + 48) != a3))
  {
    v9 = v6;
    v7 = objc_msgSend(*(id *)(a1 + 56), "containsBorrowedContentView:");
    v8 = *(_QWORD *)(a1 + 40);
    if ((v7 & 1) == 0)
    {
      if (!v8)
      {
LABEL_7:
        objc_storeStrong((id *)(a1 + 40), a2);
        *(double *)(a1 + 48) = a3;
        -[TabOverviewItemLayoutInfo _insertBorrowedContentView](a1);
        v6 = v9;
        goto LABEL_9;
      }
      v8 = 0;
    }
    objc_msgSend(*(id *)(a1 + 56), "removeBorrowedContentView:", v8);
    goto LABEL_7;
  }
LABEL_9:

}

- (void)pulseDimmingView
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 56), "dimmingView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0DC3F10];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke;
    v5[3] = &unk_1E9CF1830;
    v6 = v2;
    v7 = a1;
    v4 = v2;
    objc_msgSend(v3, "animateKeyframesWithDuration:delay:options:animations:completion:", 2, v5, 0, 0.5, 0.0);

  }
}

void __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke_2;
  v10[3] = &unk_1E9CF1900;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v10, 0.0, 0.5);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke_3;
  v7[3] = &unk_1E9CF1830;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.5, 0.5);

}

uint64_t __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.5);
}

uint64_t __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(*(_QWORD *)(a1 + 40) + 128));
}

- (uint64_t)interpolatedValuesAreSteady
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1 || !objc_msgSend(*(id *)(a1 + 144), "isInSteadyStateWithConstraints:", 0))
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[TabOverviewItemLayoutInfo interpolatedValues]((_QWORD *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!-[TabOverviewInterpolatedValue isInSteadyState](*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6)))
        {
          v7 = 0;
          goto LABEL_14;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_14:

  return v7;
}

- (void)setAttachedView:(uint64_t)a1
{
  id v4;
  id v5;

  v4 = a2;
  if (a1 && *(id *)(a1 + 120) != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(a1 + 120), a2);
    -[TabOverviewItemLayoutInfo updateItemView](a1);
    v4 = v5;
  }

}

- (void)setAttachedViewReferenceRect:(double)a3
{
  if (a1)
  {
    if (!CGRectEqualToRect(*(CGRect *)&a2, *(CGRect *)(a1 + 184)))
    {
      *(double *)(a1 + 184) = a2;
      *(double *)(a1 + 192) = a3;
      *(double *)(a1 + 200) = a4;
      *(double *)(a1 + 208) = a5;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
}

- (void)copyGeometryFromLayoutInfo:(_QWORD *)a1
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;

  if (a1)
  {
    v3 = (void *)a1[18];
    v4 = (void *)a2[18];
    v5 = a2;
    objc_msgSend(v4, "targetLocation");
    objc_msgSend(v3, "resetToLocation:");
    -[TabOverviewItemLayoutInfo interpolatedValues](a1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedValues](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "safari_enumerateZippedValuesWithArray:withBlock:", v6, &__block_literal_global_1);
  }
}

void __56__TabOverviewItemLayoutInfo_copyGeometryFromLayoutInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v4;
  id v5;

  v5 = a2;
  v4 = -[TabOverviewInterpolatedValue targetValue](a3);
  -[TabOverviewInterpolatedValue resetToValue:]((uint64_t)v5, v4);

}

- (BOOL)isSnapshotBlank
{
  if (result)
    return *(_BYTE *)(result + 16) != 0;
  return result;
}

- (double)interactiveInsertionProgress
{
  if (a1)
    return *(double *)(a1 + 64);
  else
    return 0.0;
}

- (uint64_t)setInteractiveInsertionProgress:(uint64_t)result
{
  if (result)
    *(double *)(result + 64) = a2;
  return result;
}

- (uint64_t)setInteractivelyInserted:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 18) = a2;
  return result;
}

- (uint64_t)attachedView
{
  if (result)
    return *(_QWORD *)(result + 120);
  return result;
}

- (double)zPosition
{
  if (a1)
    return *(double *)(a1 + 136);
  else
    return 0.0;
}

- (double)transform
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if (a1)
  {
    v2 = *(_OWORD *)(a1 + 392);
    a2[4] = *(_OWORD *)(a1 + 376);
    a2[5] = v2;
    v3 = *(_OWORD *)(a1 + 424);
    a2[6] = *(_OWORD *)(a1 + 408);
    a2[7] = v3;
    v4 = *(_OWORD *)(a1 + 328);
    *a2 = *(_OWORD *)(a1 + 312);
    a2[1] = v4;
    v5 = *(_OWORD *)(a1 + 344);
    v6 = *(_OWORD *)(a1 + 360);
    a2[2] = v5;
    a2[3] = v6;
  }
  else
  {
    *(_QWORD *)&v5 = 0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return *(double *)&v5;
}

- (double)setCloseLastLayoutLocation:(double)a3
{
  if (result)
  {
    result[31] = a2;
    result[32] = a3;
    result[33] = a4;
    result[34] = a5;
  }
  return result;
}

- (double)closeStartLocation
{
  if (a1)
    return *(double *)(a1 + 280);
  else
    return 0.0;
}

- (double)setCloseStartLocation:(double)a3
{
  if (result)
  {
    result[35] = a2;
    result[36] = a3;
    result[37] = a4;
    result[38] = a5;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpolatedLocation, 0);
  objc_storeStrong((id *)&self->_attachedView, 0);
  objc_storeStrong((id *)&self->_interpolatedBoundsLogScale, 0);
  objc_storeStrong((id *)&self->_interpolatedHeightTransitionPercent, 0);
  objc_storeStrong((id *)&self->_interpolatedCornerRadius, 0);
  objc_storeStrong((id *)&self->_interpolatedSnapshotAlpha, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_borrowedContentView, 0);
  objc_destroyWeak((id *)&self->_tabOverviewItem);
  objc_destroyWeak((id *)&self->_tabOverview);
  objc_storeStrong((id *)&self->_interpolatedValues, 0);
}

@end
