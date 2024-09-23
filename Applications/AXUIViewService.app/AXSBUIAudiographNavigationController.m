@implementation AXSBUIAudiographNavigationController

- (BOOL)accessibilityPerformEscape
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBUIAudiographNavigationController dismissDelegate](self, "dismissDelegate"));
  objc_msgSend(v2, "dismiss");

  return 1;
}

- (AXSBUIAudiographDismissDelegate)dismissDelegate
{
  return (AXSBUIAudiographDismissDelegate *)objc_loadWeakRetained((id *)&self->_dismissDelegate);
}

- (void)setDismissDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dismissDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dismissDelegate);
}

@end
