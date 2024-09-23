@implementation MUPlaceUnifiedActionRowSectionControllerConfiguration

- (MKPlaceActionManager)actionManager
{
  return (MKPlaceActionManager *)objc_loadWeakRetained((id *)&self->_actionManager);
}

- (void)setActionManager:(id)a3
{
  objc_storeWeak((id *)&self->_actionManager, a3);
}

- (unint64_t)primaryButtonType
{
  return self->_primaryButtonType;
}

- (void)setPrimaryButtonType:(unint64_t)a3
{
  self->_primaryButtonType = a3;
}

- (MUHeaderButtonMenuActionProvider)moreActionsProvider
{
  return (MUHeaderButtonMenuActionProvider *)objc_loadWeakRetained((id *)&self->_moreActionsProvider);
}

- (void)setMoreActionsProvider:(id)a3
{
  objc_storeWeak((id *)&self->_moreActionsProvider, a3);
}

- (MUPlaceActionRowMenuProvider)actionRowMenuProvider
{
  return (MUPlaceActionRowMenuProvider *)objc_loadWeakRetained((id *)&self->_actionRowMenuProvider);
}

- (void)setActionRowMenuProvider:(id)a3
{
  objc_storeWeak((id *)&self->_actionRowMenuProvider, a3);
}

- (MKETAProvider)etaProvider
{
  return (MKETAProvider *)objc_loadWeakRetained((id *)&self->_etaProvider);
}

- (void)setEtaProvider:(id)a3
{
  objc_storeWeak((id *)&self->_etaProvider, a3);
}

- (MUExternalActionHandling)externalActionHandler
{
  return (MUExternalActionHandling *)objc_loadWeakRetained((id *)&self->_externalActionHandler);
}

- (void)setExternalActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_externalActionHandler, a3);
}

- (GEOUnifiedActionButtonModuleConfiguration)buttonModuleConfiguration
{
  return self->_buttonModuleConfiguration;
}

- (void)setButtonModuleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_buttonModuleConfiguration, a3);
}

- (BOOL)shouldPerformMapsExtensionDiscovery
{
  return self->_shouldPerformMapsExtensionDiscovery;
}

- (void)setShouldPerformMapsExtensionDiscovery:(BOOL)a3
{
  self->_shouldPerformMapsExtensionDiscovery = a3;
}

- (BOOL)canShowDetourTime
{
  return self->_canShowDetourTime;
}

- (void)setCanShowDetourTime:(BOOL)a3
{
  self->_canShowDetourTime = a3;
}

- (BOOL)isSearchAlongRoute
{
  return self->_isSearchAlongRoute;
}

- (void)setIsSearchAlongRoute:(BOOL)a3
{
  self->_isSearchAlongRoute = a3;
}

- (BOOL)showMoreButtonIfAvailable
{
  return self->_showMoreButtonIfAvailable;
}

- (void)setShowMoreButtonIfAvailable:(BOOL)a3
{
  self->_showMoreButtonIfAvailable = a3;
}

- (BOOL)shouldShowContactsAction
{
  return self->_shouldShowContactsAction;
}

- (void)setShouldShowContactsAction:(BOOL)a3
{
  self->_shouldShowContactsAction = a3;
}

- (_MKPlaceActionButtonController)secondaryActionButtonController
{
  return self->_secondaryActionButtonController;
}

- (void)setSecondaryActionButtonController:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryActionButtonController, a3);
}

- (MUTimeExpirableLRUCache)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCache, a3);
}

- (MUAMSResultProvider)amsResultProvider
{
  return self->_amsResultProvider;
}

- (void)setAmsResultProvider:(id)a3
{
  objc_storeStrong((id *)&self->_amsResultProvider, a3);
}

- (BOOL)canShowDownloadOffline
{
  return self->_canShowDownloadOffline;
}

- (void)setCanShowDownloadOffline:(BOOL)a3
{
  self->_canShowDownloadOffline = a3;
}

- (BOOL)shouldPromoteDownloadOffline
{
  return self->_shouldPromoteDownloadOffline;
}

- (void)setShouldPromoteDownloadOffline:(BOOL)a3
{
  self->_shouldPromoteDownloadOffline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_storeStrong((id *)&self->_artworkCache, 0);
  objc_storeStrong((id *)&self->_secondaryActionButtonController, 0);
  objc_storeStrong((id *)&self->_buttonModuleConfiguration, 0);
  objc_destroyWeak((id *)&self->_externalActionHandler);
  objc_destroyWeak((id *)&self->_etaProvider);
  objc_destroyWeak((id *)&self->_actionRowMenuProvider);
  objc_destroyWeak((id *)&self->_moreActionsProvider);
  objc_destroyWeak((id *)&self->_actionManager);
}

@end
