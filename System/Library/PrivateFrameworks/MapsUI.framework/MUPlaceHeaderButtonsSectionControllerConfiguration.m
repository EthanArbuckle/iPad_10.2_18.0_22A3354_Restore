@implementation MUPlaceHeaderButtonsSectionControllerConfiguration

- (MKETAProvider)etaProvider
{
  return (MKETAProvider *)objc_loadWeakRetained((id *)&self->_etaProvider);
}

- (void)setEtaProvider:(id)a3
{
  objc_storeWeak((id *)&self->_etaProvider, a3);
}

- (BOOL)showMoreButton
{
  return self->_showMoreButton;
}

- (void)setShowMoreButton:(BOOL)a3
{
  self->_showMoreButton = a3;
}

- (BOOL)canShowDetourTime
{
  return self->_canShowDetourTime;
}

- (void)setCanShowDetourTime:(BOOL)a3
{
  self->_canShowDetourTime = a3;
}

- (GEOHeaderButtonModuleConfiguration)buttonModuleConfiguration
{
  return self->_buttonModuleConfiguration;
}

- (void)setButtonModuleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_buttonModuleConfiguration, a3);
}

- (MUHeaderButtonMenuActionProvider)menuProvider
{
  return (MUHeaderButtonMenuActionProvider *)objc_loadWeakRetained((id *)&self->_menuProvider);
}

- (void)setMenuProvider:(id)a3
{
  objc_storeWeak((id *)&self->_menuProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_storeStrong((id *)&self->_buttonModuleConfiguration, 0);
  objc_destroyWeak((id *)&self->_etaProvider);
}

@end
