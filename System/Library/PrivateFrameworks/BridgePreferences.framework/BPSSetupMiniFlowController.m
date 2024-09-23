@implementation BPSSetupMiniFlowController

- (id)viewController
{
  NSLog(CFSTR("Warning! %s should be overridden by subclasses"), a2, "-[BPSSetupMiniFlowController viewController]");
  return 0;
}

- (id)navigationController
{
  void *v2;
  void *v3;

  -[BPSSetupMiniFlowController viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)pushController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[BPSSetupMiniFlowController navigationController](self, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v6, v4);

}

- (BPSBuddyControllerDelegate)delegate
{
  return (BPSBuddyControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDisplayingInSkippedMiniFlow
{
  return self->_isDisplayingInSkippedMiniFlow;
}

- (void)setIsDisplayingInSkippedMiniFlow:(BOOL)a3
{
  self->_isDisplayingInSkippedMiniFlow = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
