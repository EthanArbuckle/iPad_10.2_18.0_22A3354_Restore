@implementation LibraryConfiguration

- (void)setTabGroupProvider:(id)a3
{
  objc_storeWeak((id *)&self->_tabGroupProvider, a3);
}

- (void)setPinnedTabsManager:(id)a3
{
  objc_storeWeak((id *)&self->_pinnedTabsManager, a3);
}

- (void)setNavigationIntentHandler:(id)a3
{
  objc_storeWeak((id *)&self->_navigationIntentHandler, a3);
}

- (void)setLinkPreviewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_linkPreviewProvider, a3);
}

- (void)setLibraryItemOpenHandler:(id)a3
{
  objc_storeWeak((id *)&self->_libraryItemOpenHandler, a3);
}

- (void)setDownloadOpenHandler:(id)a3
{
  objc_storeWeak((id *)&self->_downloadOpenHandler, a3);
}

- (void)setBookmarksNavigationControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_bookmarksNavigationControllerDelegate, a3);
}

- (DownloadOpenHandler)downloadOpenHandler
{
  return (DownloadOpenHandler *)objc_loadWeakRetained((id *)&self->_downloadOpenHandler);
}

- (LinkPreviewProvider)linkPreviewProvider
{
  return (LinkPreviewProvider *)objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
}

- (LibraryItemOpenHandler)libraryItemOpenHandler
{
  return (LibraryItemOpenHandler *)objc_loadWeakRetained((id *)&self->_libraryItemOpenHandler);
}

- (TabGroupProvider)tabGroupProvider
{
  return (TabGroupProvider *)objc_loadWeakRetained((id *)&self->_tabGroupProvider);
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  return (_SFNavigationIntentHandling *)objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
}

- (BookmarksNavigationControllerDelegate)bookmarksNavigationControllerDelegate
{
  return (BookmarksNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
}

- (PinnedTabsManager)pinnedTabsManager
{
  return (PinnedTabsManager *)objc_loadWeakRetained((id *)&self->_pinnedTabsManager);
}

- (SFTabIconPool)tabIconPool
{
  return (SFTabIconPool *)objc_loadWeakRetained((id *)&self->_tabIconPool);
}

- (void)setTabIconPool:(id)a3
{
  objc_storeWeak((id *)&self->_tabIconPool, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabIconPool);
  objc_destroyWeak((id *)&self->_pinnedTabsManager);
  objc_destroyWeak((id *)&self->_bookmarksNavigationControllerDelegate);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_destroyWeak((id *)&self->_libraryItemOpenHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_downloadOpenHandler);
}

@end
