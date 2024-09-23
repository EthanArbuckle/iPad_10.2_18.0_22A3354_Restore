@implementation SFTipsCoordinator

- (void)startObserving
{
  -[_SFTipsCoordinator startObserving](self->_internal, "startObserving");
}

uint64_t __25__SFTipsCoordinator_init__block_invoke()
{
  return +[_SFTipsCoordinator configureTipsCenter](_SFTipsCoordinator, "configureTipsCenter");
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (SFTipsCoordinator)init
{
  SFTipsCoordinator *v2;
  _SFTipsCoordinator *v3;
  _SFTipsCoordinator *internal;
  SFTipsCoordinator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFTipsCoordinator;
  v2 = -[SFTipsCoordinator init](&v7, sel_init);
  if (v2)
  {
    if (init_once[0] != -1)
      dispatch_once(init_once, &__block_literal_global);
    v3 = objc_alloc_init(_SFTipsCoordinator);
    internal = v2->_internal;
    v2->_internal = v3;

    -[_SFTipsCoordinator setObserver:](v2->_internal, "setObserver:", v2);
    v5 = v2;
  }

  return v2;
}

- (void)webSearchTipDidBecomeUnavailable
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "webSearchTipDidBecomeUnavailable");

}

- (UIViewController)webSearchTipViewController
{
  return -[_SFTipsCoordinator webSearchTipViewController](self->_internal, "webSearchTipViewController");
}

- (UIView)webSearchTipView
{
  return -[_SFTipsCoordinator webSearchTipView](self->_internal, "webSearchTipView");
}

- (void)donatePerformSearchFromDefaultSearchEngineWebPageEvent
{
  -[_SFTipsCoordinator donatePerformSearchFromDefaultSearchEngineWebPageEvent](self->_internal, "donatePerformSearchFromDefaultSearchEngineWebPageEvent");
}

- (void)invalidateWebSearchTip
{
  -[_SFTipsCoordinator invalidateWebSearchTip](self->_internal, "invalidateWebSearchTip");
}

- (BOOL)webSearchTipAvailable
{
  return -[_SFTipsCoordinator webSearchTipAvailable](self->_internal, "webSearchTipAvailable");
}

- (SFTipsObserver)observer
{
  return (SFTipsObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
