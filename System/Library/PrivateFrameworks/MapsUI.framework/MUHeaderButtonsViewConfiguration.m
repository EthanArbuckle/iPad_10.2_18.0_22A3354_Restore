@implementation MUHeaderButtonsViewConfiguration

- (double)detourTime
{
  return self->_detourTime;
}

- (void)setDetourTime:(double)a3
{
  self->_detourTime = a3;
}

- (BOOL)showMoreButton
{
  return self->_showMoreButton;
}

- (void)setShowMoreButton:(BOOL)a3
{
  self->_showMoreButton = a3;
}

- (MUHeaderButtonMenuActionProvider)menuProvider
{
  return (MUHeaderButtonMenuActionProvider *)objc_loadWeakRetained((id *)&self->_menuProvider);
}

- (void)setMenuProvider:(id)a3
{
  objc_storeWeak((id *)&self->_menuProvider, a3);
}

- (NSArray)possibleAnalyticActions
{
  return self->_possibleAnalyticActions;
}

- (void)setPossibleAnalyticActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleAnalyticActions, 0);
  objc_destroyWeak((id *)&self->_menuProvider);
}

@end
