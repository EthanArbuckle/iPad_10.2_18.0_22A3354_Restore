@implementation UnifiedTabBar

- (id)newSearchField
{
  return objc_alloc_init(UnifiedField);
}

- (void)didSelectItem:(id)a3
{
  TabCollectionViewDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "tabCollectionView:didSelectItem:", self, v5);

}

- (BOOL)canCloseItem:(id)a3
{
  UnifiedTabBar *v3;
  TabCollectionViewDelegate **p_delegate;
  id v5;
  id WeakRetained;

  v3 = self;
  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "tabCollectionView:canCloseItem:", v3, v5);

  return (char)v3;
}

- (void)closeItem:(id)a3
{
  TabCollectionViewDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "tabCollectionView:closeItem:", self, v5);

}

- (NSArray)items
{
  void *v2;
  void *v3;
  void *v4;

  -[SFUnifiedTabBar itemArrangement](self, "itemArrangement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

id __22__UnifiedTabBar_items__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (int64_t)itemDragContentType
{
  if (-[SFUnifiedTabBar role](self, "role") == 1)
    return 2;
  else
    return 3;
}

- (void)activateItem:(id)a3
{
  TabCollectionViewDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "tabCollectionView:didSelectItem:", self, v5);

}

- (id)itemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  -[SFUnifiedTabBar itemArrangement](self, "itemArrangement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "activeItemIsExpanded");

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[SFUnifiedTabBar tabBarItemAtPoint:](self, "tabBarItemAtPoint:", x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBar viewForBarItem:](self, "viewForBarItem:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBar hitTest:withEvent:](self, "hitTest:withEvent:", 0, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (v8 = 0, v11 == v10))
      v8 = v9;

  }
  return v8;
}

- (unint64_t)layoutAxes
{
  return 1;
}

- (BOOL)supportsDropTransitionToItemView
{
  return 1;
}

- (id)targetedDragPreviewForLiftingItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[SFUnifiedTabBar viewForBarItem:](self, "viewForBarItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3770]);
    -[SFUnifiedTabBar itemContainerView](self, "itemContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "center");
    v8 = (void *)objc_msgSend(v6, "initWithContainer:center:", v7);

    v9 = objc_alloc(MEMORY[0x1E0DC3D88]);
    objc_msgSend(v4, "previewParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithView:parameters:target:", v4, v10, v8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)targetedPreviewForDismissingMenuForItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[SFUnifiedTabBar viewForBarItem:](self, "viewForBarItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3770]);
    -[SFUnifiedTabBar itemContainerView](self, "itemContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "center");
    v8 = (void *)objc_msgSend(v6, "initWithContainer:center:", v7);

    v9 = objc_alloc(MEMORY[0x1E0DC3D88]);
    objc_msgSend(v4, "previewParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithView:parameters:target:", v4, v10, v8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)contextMenuOptionsForItem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  int64_t v8;
  _BOOL4 v9;
  uint64_t v10;

  v4 = a3;
  if (-[UnifiedTabBar hidesInactiveTabs](self, "hidesInactiveTabs"))
    v5 = 0;
  else
    v5 = 4146;
  -[SFUnifiedTabBar itemArrangement](self, "itemArrangement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v4)
  {
    v8 = -[SFUnifiedTabBar role](self, "role");

    if (v8 != 2)
    {
      v9 = -[SFUnifiedTabBar searchFieldShowsPersistentStopReloadButton](self, "searchFieldShowsPersistentStopReloadButton");
      v10 = 133;
      if (v9)
        v10 = 5;
      v5 |= v10;
    }
  }
  else
  {

  }
  return v5;
}

- (void)willBeginShowingContextMenuForItem:(id)a3
{
  id v3;

  -[SFUnifiedTabBar itemContainerView](self, "itemContainerView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

}

- (void)didEndShowingContextMenuForItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFUnifiedTabBar itemContainerView](self, "itemContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  -[UnifiedTabBar cleanUpDragPreviewForItem:](self, "cleanUpDragPreviewForItem:", v5);
}

- (BOOL)shouldSpringLoadItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SFUnifiedTabBar itemArrangement](self, "itemArrangement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 != v4;
}

- (BOOL)shouldPinItemsDroppedAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[SFUnifiedTabBar pinnedItemDropArea](self, "pinnedItemDropArea");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (BOOL)hidesInactiveTabs
{
  return -[SFUnifiedTabBar role](self, "role") == 1;
}

- (BOOL)canDragOntoActiveTab
{
  return -[SFUnifiedTabBar role](self, "role") != 2;
}

- (void)performDropWithNavigationIntent:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SFUnifiedTabBar itemArrangement](self, "itemArrangement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "tabCollectionView:item:didProduceNavigationIntent:", self, v6, v7);

  }
}

- (TabCollectionViewDelegate)delegate
{
  return (TabCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  return (_SFNavigationIntentHandling *)objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
}

- (void)setNavigationIntentHandler:(id)a3
{
  objc_storeWeak((id *)&self->_navigationIntentHandler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
