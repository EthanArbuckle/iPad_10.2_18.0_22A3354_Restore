@implementation SBAXFakeAppSwitcherAccessibilityElement

- (BOOL)_accessibilityScrollToVisible
{
  AXPerformSafeBlock();
  return 1;
}

void __72__SBAXFakeAppSwitcherAccessibilityElement__accessibilityScrollToVisible__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "deckSwitcherDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scrollToAppLayout:animated:alignment:completion:", v2, 1, 2, 0);

}

- (id)deckSwitcherDelegate
{
  return objc_loadWeakRetained(&self->_deckSwitcherDelegate);
}

- (void)setDeckSwitcherDelegate:(id)a3
{
  objc_storeWeak(&self->_deckSwitcherDelegate, a3);
}

- (id)appLayout
{
  return self->_appLayout;
}

- (void)setAppLayout:(id)a3
{
  objc_storeStrong(&self->_appLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appLayout, 0);
  objc_destroyWeak(&self->_deckSwitcherDelegate);
}

@end
