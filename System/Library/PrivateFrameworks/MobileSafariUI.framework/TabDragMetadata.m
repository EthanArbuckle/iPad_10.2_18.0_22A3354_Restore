@implementation TabDragMetadata

- (WBTab)tab
{
  return self->_tab;
}

- (void)setTab:(id)a3
{
  objc_storeStrong((id *)&self->_tab, a3);
}

- (TabCollectionItem)tabItem
{
  return self->_tabItem;
}

- (void)setTabItem:(id)a3
{
  objc_storeStrong((id *)&self->_tabItem, a3);
}

- (BrowserController)browserController
{
  return (BrowserController *)objc_loadWeakRetained((id *)&self->_browserController);
}

- (void)setBrowserController:(id)a3
{
  objc_storeWeak((id *)&self->_browserController, a3);
}

- (BOOL)dragPreviewPinned
{
  return self->_dragPreviewPinned;
}

- (void)setDragPreviewPinned:(BOOL)a3
{
  self->_dragPreviewPinned = a3;
}

- (TabCollectionView)targetTabViewForDragPreview
{
  return (TabCollectionView *)objc_loadWeakRetained((id *)&self->_targetTabViewForDragPreview);
}

- (void)setTargetTabViewForDragPreview:(id)a3
{
  objc_storeWeak((id *)&self->_targetTabViewForDragPreview, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetTabViewForDragPreview);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_tabItem, 0);
  objc_storeStrong((id *)&self->_tab, 0);
}

@end
