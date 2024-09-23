@implementation TabBarItemLayoutInfo

- (int64_t)_visibleEdge
{
  id WeakRetained;
  _BOOL4 trailingEdgeVisible;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  if (objc_msgSend(WeakRetained, "isPinned"))
  {
    trailingEdgeVisible = self->_trailingEdgeVisible;

    if (trailingEdgeVisible)
      return 2;
  }
  else
  {

  }
  if (self->_trailingActiveItem)
  {
    if (self->_trailingEdgeVisible)
      return 2;
  }
  else if (self->_leadingEdgeVisible)
  {
    return 1;
  }
  return 0;
}

- (void)setTitleAnchorAdditionalOffset:(double)a3
{
  self->_titleAnchorAdditionalOffset = a3;
  -[TabBarItemView setTitleAnchorAdditionalOffset:](self->_tabBarItemView, "setTitleAnchorAdditionalOffset:");
}

- (void)setHidesTitleText:(BOOL)a3
{
  self->_hidesTitleText = a3;
  -[TabBarItemLayoutInfo _updateHidesTitleText](self, "_updateHidesTitleText");
}

- (void)_updateHidesTitleText
{
  uint64_t v3;
  id WeakRetained;

  if (self->_hidesTitleText)
  {
    v3 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
    v3 = objc_msgSend(WeakRetained, "isPlaceholder");

  }
  -[TabBarItemView setHidesTitleText:](self->_tabBarItemView, "setHidesTitleText:", v3);
}

- (void)_clearViewsIfNeeded
{
  if (!-[TabBarItemLayoutInfo _requiresViews](self, "_requiresViews"))
    -[TabBarItemLayoutInfo _clearViews](self, "_clearViews");
}

- (BOOL)_requiresViews
{
  if (self->_removedFromTabBar)
    return 0;
  if (self->_visibleInTabBar)
    return 1;
  return self->_activeAnimationCount != 0;
}

- (BOOL)isVisibleInTabBar
{
  return self->_visibleInTabBar;
}

- (TabBarItemView)tabBarItemView
{
  TabBarItemView *v3;
  TabBarItemView *tabBarItemView;

  if (!self->_tabBarItemView && -[TabBarItemLayoutInfo _requiresViews](self, "_requiresViews"))
  {
    -[TabBarItemLayoutInfo _reusableView](self, "_reusableView");
    v3 = (TabBarItemView *)objc_claimAutoreleasedReturnValue();
    tabBarItemView = self->_tabBarItemView;
    self->_tabBarItemView = v3;

  }
  return self->_tabBarItemView;
}

- (void)setVisibleInTabBar:(BOOL)a3
{
  self->_visibleInTabBar = a3;
  -[TabBarItemLayoutInfo _clearViewsIfNeeded](self, "_clearViewsIfNeeded");
}

- (void)setTrailingEdgeVisible:(BOOL)a3
{
  self->_trailingEdgeVisible = a3;
  -[TabBarItemView setVisibleEdge:](self->_tabBarItemView, "setVisibleEdge:", -[TabBarItemLayoutInfo _visibleEdge](self, "_visibleEdge"));
}

- (void)setTrailingActiveItem:(BOOL)a3
{
  uint64_t v4;
  UIView *v5;
  UIView *itemSnapshotView;
  _QWORD v7[5];

  if (self->_trailingActiveItem != a3)
  {
    self->_trailingActiveItem = a3;
    -[TabBarItemView setVisibleEdge:](self->_tabBarItemView, "setVisibleEdge:", -[TabBarItemLayoutInfo _visibleEdge](self, "_visibleEdge"));
    if (self->_trailingActiveItem)
      v4 = 2;
    else
      v4 = 1;
    -[TabBarItemView setTitleAnchorEdge:](self->_tabBarItemView, "setTitleAnchorEdge:", v4);
    if (self->_activeAnimationCount)
    {
      -[UIView removeFromSuperview](self->_itemSnapshotView, "removeFromSuperview");
      -[TabBarItemView snapshotViewAfterScreenUpdates:](self->_tabBarItemView, "snapshotViewAfterScreenUpdates:", 0);
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
      itemSnapshotView = self->_itemSnapshotView;
      self->_itemSnapshotView = v5;

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __46__TabBarItemLayoutInfo_setTrailingActiveItem___block_invoke;
      v7[3] = &unk_1E9CF1900;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
    }
  }
}

- (void)setTitleLayoutWidth:(double)a3
{
  self->_titleLayoutWidth = a3;
  -[TabBarItemView setTitleLayoutWidth:](self->_tabBarItemView, "setTitleLayoutWidth:");
}

- (void)setLeadingEdgeVisible:(BOOL)a3
{
  self->_leadingEdgeVisible = a3;
  -[TabBarItemView setVisibleEdge:](self->_tabBarItemView, "setVisibleEdge:", -[TabBarItemLayoutInfo _visibleEdge](self, "_visibleEdge"));
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
  -[TabBarItemView setFrame:](self->_tabBarItemView, "setFrame:");
  -[UIView setFrame:](self->_itemSnapshotView, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
}

- (void)setContentOffset:(double)a3
{
  self->_contentOffset = a3;
  -[TabBarItemView setContentOffset:](self->_tabBarItemView, "setContentOffset:");
}

- (void)setActiveAnimationCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  UIView *itemSnapshotView;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_activeAnimationCount != a3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[TabBarItemView closeButton](self->_tabBarItemView, "closeButton", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v11, "invalidate");
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  self->_activeAnimationCount = a3;
  -[TabBarItemLayoutInfo _clearViewsIfNeeded](self, "_clearViewsIfNeeded");
  if (self->_activeAnimationCount)
  {
    -[UIView removeFromSuperview](self->_itemSnapshotView, "removeFromSuperview");
    itemSnapshotView = self->_itemSnapshotView;
    self->_itemSnapshotView = 0;

  }
}

- (void)setCanClose:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_canClose = a3;
  v3 = !a3;
  -[TabBarItemView closeButton](self->_tabBarItemView, "closeButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (TabBarItemLayoutInfo)initWithTabBar:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  TabBarItemLayoutInfo *v8;
  TabBarItemLayoutInfo *v9;
  TabBarItemLayoutInfo *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TabBarItemLayoutInfo;
  v8 = -[TabBarItemLayoutInfo init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_tabBar, v6);
    objc_storeWeak((id *)&v9->_tabBarItem, v7);
    v10 = v9;
  }

  return v9;
}

- (id)_reusableView
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__TabBarItemLayoutInfo__reusableView__block_invoke;
  v4[3] = &unk_1E9CF2BB0;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (unint64_t)activeAnimationCount
{
  return self->_activeAnimationCount;
}

uint64_t __45__TabBarItemLayoutInfo_itemDidUpdateIsActive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setActive:", *(unsigned __int8 *)(a1 + 40));
}

- (void)itemDidUpdateIsActive
{
  id WeakRetained;
  char v4;
  id v5;
  _QWORD v6[5];
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  v4 = objc_msgSend(WeakRetained, "isActive");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__TabBarItemLayoutInfo_itemDidUpdateIsActive__block_invoke;
  v6[3] = &unk_1E9CF1EE8;
  v6[4] = self;
  v7 = v4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v6, 0);
  if (-[TabBarItemLayoutInfo hasViews](self, "hasViews"))
  {
    v5 = objc_loadWeakRetained((id *)&self->_tabBar);
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (BOOL)hasViews
{
  return self->_tabBarItemView != 0;
}

void __37__TabBarItemLayoutInfo__reusableView__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(v2, "_requestReusableTabBarItemView");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setActive:", objc_msgSend(WeakRetained, "isActive"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setIsPlaceholder:", objc_msgSend(WeakRetained, "isPlaceholder"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 88), *(double *)(*(_QWORD *)(a1 + 32) + 96), *(double *)(*(_QWORD *)(a1 + 32) + 104), *(double *)(*(_QWORD *)(a1 + 32) + 112));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 37))
    v6 = 1;
  else
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isPlaceholder");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setHidesTitleText:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setReordering:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 33));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTitleAnchorAdditionalOffset:", *(double *)(*(_QWORD *)(a1 + 32) + 64));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 36))
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTitleAnchorEdge:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTitleLayoutWidth:", *(double *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTitleText:", v8);

  objc_msgSend(WeakRetained, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setIcon:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setHidesTitleText:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "hidesTitleText"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setVisibleEdge:", objc_msgSend(*(id *)(a1 + 32), "_visibleEdge"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setMediaStateIcon:", objc_msgSend(WeakRetained, "mediaStateIcon"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setPinned:", objc_msgSend(WeakRetained, "isPinned"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setUnread:", objc_msgSend(WeakRetained, "isUnread"));
  objc_msgSend(WeakRetained, "shareParticipants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setShareParticipants:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "mediaStateMuteButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_mediaStateMuteButtonTapped_, 0x2000);

  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(WeakRetained, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateEntityAnnotationWithUUID:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "closeButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) == 0);
  objc_msgSend(v14, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_closeButtonTapped_, 64);

}

- (void)itemDidUpdateIcon
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  objc_msgSend(WeakRetained, "icon");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[TabBarItemView setIcon:](self->_tabBarItemView, "setIcon:", v4);
}

- (TabBarItemLayoutInfo)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[TabBarItemLayoutInfo _clearViews](self, "_clearViews");
  -[TabBarItemLayoutInfo clearPreviewView](self, "clearPreviewView");
  v3.receiver = self;
  v3.super_class = (Class)TabBarItemLayoutInfo;
  -[TabBarItemLayoutInfo dealloc](&v3, sel_dealloc);
}

- (void)itemDidUpdateTitle
{
  void *v3;
  TabBarItemView *tabBarItemView;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  objc_msgSend(WeakRetained, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabBarItemView setTitleText:](self->_tabBarItemView, "setTitleText:", v3);

  tabBarItemView = self->_tabBarItemView;
  objc_msgSend(WeakRetained, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabBarItemView updateEntityAnnotationWithUUID:](tabBarItemView, "updateEntityAnnotationWithUUID:", v5);

}

- (void)itemDidUpdateIsPlaceholder
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  v4 = objc_msgSend(WeakRetained, "isPlaceholder");

  -[TabBarItemView setIsPlaceholder:](self->_tabBarItemView, "setIsPlaceholder:", v4);
  -[TabBarItemLayoutInfo _updateHidesTitleText](self, "_updateHidesTitleText");
}

- (void)itemDidUpdateMediaState
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  v4 = objc_msgSend(WeakRetained, "mediaStateIcon");

  -[TabBarItemView setMediaStateIcon:](self->_tabBarItemView, "setMediaStateIcon:", v4);
}

- (void)itemDidUpdateIsPinned
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  -[TabBarItemView setPinned:](self->_tabBarItemView, "setPinned:", objc_msgSend(WeakRetained, "isPinned"));

  -[TabBarItemView setVisibleEdge:](self->_tabBarItemView, "setVisibleEdge:", -[TabBarItemLayoutInfo _visibleEdge](self, "_visibleEdge"));
}

- (void)itemDidUpdateIsUnread
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  -[TabBarItemView setUnread:](self->_tabBarItemView, "setUnread:", objc_msgSend(WeakRetained, "isUnread"));

}

- (void)itemDidUpdateShareParticipants
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarItem);
  objc_msgSend(WeakRetained, "shareParticipants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabBarItemView setShareParticipants:](self->_tabBarItemView, "setShareParticipants:", v3);

}

- (void)closeButtonTapped:(id)a3
{
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  v4 = objc_loadWeakRetained((id *)&self->_tabBarItem);
  if (WeakRetained && v4)
    objc_msgSend(WeakRetained, "_itemDidPressCloseButton:", v4);

}

- (void)mediaStateMuteButtonTapped:(id)a3
{
  id v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  v4 = objc_loadWeakRetained((id *)&self->_tabBarItem);
  v5 = objc_msgSend(v4, "mediaStateIcon");
  if (WeakRetained && v5)
    objc_msgSend(WeakRetained, "_toggleMediaStateMutedForItem:", v4);

}

- (void)setReordering:(BOOL)a3
{
  self->_reordering = a3;
  -[TabBarItemView setReordering:](self->_tabBarItemView, "setReordering:");
}

void __46__TabBarItemLayoutInfo_setTrailingActiveItem___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "frame");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "superview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertSubview:belowSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

}

- (void)updateTitleTruncation
{
  -[TabBarItemView updateTitleTruncation](self->_tabBarItemView, "updateTitleTruncation");
}

- (void)updateTabBarStyle
{
  -[TabBarItemView updateTabBarStyle](self->_tabBarItemView, "updateTabBarStyle");
}

- (TabBarItemView)viewForDragPreview
{
  void *v2;

  -[TabBarItemLayoutInfo _reusableView](self, "_reusableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");
  objc_msgSend(v2, "configureForDragPreview");
  return (TabBarItemView *)v2;
}

- (TabBarItemView)tabBarItemPreviewView
{
  TabBarItemView *tabBarItemPreviewView;
  TabBarItemView *v4;
  TabBarItemView *v5;

  tabBarItemPreviewView = self->_tabBarItemPreviewView;
  if (!tabBarItemPreviewView)
  {
    -[TabBarItemLayoutInfo viewForDragPreview](self, "viewForDragPreview");
    v4 = (TabBarItemView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tabBarItemPreviewView;
    self->_tabBarItemPreviewView = v4;

    tabBarItemPreviewView = self->_tabBarItemPreviewView;
  }
  return tabBarItemPreviewView;
}

- (void)_clearView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v4 = a3;
  objc_msgSend(v4, "closeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, sel_closeButtonTapped_, 64);

  objc_msgSend(v4, "mediaStateMuteButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, sel_mediaStateMuteButtonTapped_, 0x2000);

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  objc_msgSend(WeakRetained, "_relinquishReusableTabBarItemView:", v4);

}

- (void)_clearViews
{
  TabBarItemView *tabBarItemView;
  UIView *itemSnapshotView;

  -[TabBarItemLayoutInfo _clearView:](self, "_clearView:", self->_tabBarItemView);
  tabBarItemView = self->_tabBarItemView;
  self->_tabBarItemView = 0;

  -[UIView removeFromSuperview](self->_itemSnapshotView, "removeFromSuperview");
  itemSnapshotView = self->_itemSnapshotView;
  self->_itemSnapshotView = 0;

}

- (void)clearPreviewView
{
  TabBarItemView *tabBarItemPreviewView;

  -[TabBarItemLayoutInfo _clearView:](self, "_clearView:", self->_tabBarItemPreviewView);
  -[TabBarItemView removeFromSuperview](self->_tabBarItemPreviewView, "removeFromSuperview");
  tabBarItemPreviewView = self->_tabBarItemPreviewView;
  self->_tabBarItemPreviewView = 0;

}

- (void)setRemovedFromTabBar:(BOOL)a3
{
  self->_removedFromTabBar = a3;
  if (a3)
    -[TabBarItemLayoutInfo _clearViewsIfNeeded](self, "_clearViewsIfNeeded");
}

- (TabBar)tabBar
{
  return (TabBar *)objc_loadWeakRetained((id *)&self->_tabBar);
}

- (TabBarItem)tabBarItem
{
  return (TabBarItem *)objc_loadWeakRetained((id *)&self->_tabBarItem);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)canClose
{
  return self->_canClose;
}

- (BOOL)isReordering
{
  return self->_reordering;
}

- (BOOL)isLeadingEdgeVisible
{
  return self->_leadingEdgeVisible;
}

- (BOOL)isTrailingEdgeVisible
{
  return self->_trailingEdgeVisible;
}

- (BOOL)isTrailingActiveItem
{
  return self->_trailingActiveItem;
}

- (double)titleLayoutWidth
{
  return self->_titleLayoutWidth;
}

- (BOOL)hidesTitleText
{
  return self->_hidesTitleText;
}

- (double)titleAnchorAdditionalOffset
{
  return self->_titleAnchorAdditionalOffset;
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (BOOL)isRemovedFromTabBar
{
  return self->_removedFromTabBar;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBarItem);
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_itemSnapshotView, 0);
  objc_storeStrong((id *)&self->_tabBarItemPreviewView, 0);
  objc_storeStrong((id *)&self->_tabBarItemView, 0);
}

@end
