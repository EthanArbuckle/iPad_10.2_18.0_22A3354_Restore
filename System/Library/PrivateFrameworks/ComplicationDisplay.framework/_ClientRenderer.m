@implementation _ClientRenderer

- (_ClientRenderer)init
{
  _ClientRenderer *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *sema;
  uint64_t v5;
  CDComplicationHostingView *host;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, double, double);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_ClientRenderer;
  v2 = -[_ClientRenderer init](&v19, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    sema = v2->_sema;
    v2->_sema = (OS_dispatch_semaphore *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    +[CDComplicationHostingView async](CDComplicationHostingView, "async");
    v5 = objc_claimAutoreleasedReturnValue();
    host = v2->_host;
    v2->_host = (CDComplicationHostingView *)v5;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v2->_renderTime = _Q0;
    objc_initWeak(&location, v2);
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __23___ClientRenderer_init__block_invoke;
    v16 = &unk_24CF212A8;
    objc_copyWeak(&v17, &location);
    -[CDComplicationHostingView setRenderStatsHandler:](v2->_host, "setRenderStatsHandler:", &v13);
    -[CDComplicationHostingView setShouldCallRenderStatsHandlerOnMainQueue:](v2->_host, "setShouldCallRenderStatsHandlerOnMainQueue:", 0, v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)renderWithViewData:(id)a3 scale:(double)a4 handler:(id)a5
{
  void (**v8)(_QWORD, double, double);
  void *v9;
  _ClientRendererWindow *v10;
  id v11;
  void *v12;
  void *v13;
  double renderTime;
  double renderCost;
  id v16;

  v16 = a3;
  v8 = (void (**)(_QWORD, double, double))a5;
  v9 = (void *)MEMORY[0x2199AA250](-[CDComplicationHostingView setViewData:](self->_host, "setViewData:", v16));
  v10 = objc_alloc_init(_ClientRendererWindow);
  -[_ClientRendererWindow setHidden:](v10, "setHidden:", 0);
  -[_ClientRendererWindow setContentScaleFactor:](v10, "setContentScaleFactor:", a4);
  v11 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  -[_ClientRendererWindow setRootViewController:](v10, "setRootViewController:", v11);
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_host);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CDComplicationHostingView sizeToFit](self->_host, "sizeToFit");
  -[CDComplicationHostingView setNeedsLayout](self->_host, "setNeedsLayout");
  -[CDComplicationHostingView layoutIfNeeded](self->_host, "layoutIfNeeded");
  -[CDComplicationHostingView frame](self->_host, "frame");
  -[_ClientRendererWindow setFrame:](v10, "setFrame:");
  objc_msgSend(v11, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDComplicationHostingView frame](self->_host, "frame");
  objc_msgSend(v13, "setFrame:");

  -[_ClientRendererWindow setNeedsLayout](v10, "setNeedsLayout");
  -[_ClientRendererWindow layoutIfNeeded](v10, "layoutIfNeeded");
  -[_ClientRendererWindow setNeedsDisplay](v10, "setNeedsDisplay");
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  objc_msgSend(MEMORY[0x24BDE57D8], "flush");
  -[CDComplicationHostingView waitForAsyncRendering](self->_host, "waitForAsyncRendering");
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
  -[CDComplicationHostingView removeFromSuperview](self->_host, "removeFromSuperview");
  -[_ClientRendererWindow setHidden:](v10, "setHidden:", 1);
  -[_ClientRendererWindow setRootViewController:](v10, "setRootViewController:", 0);

  objc_autoreleasePoolPop(v9);
  os_unfair_lock_lock(&self->_lock);
  renderTime = self->_renderTime;
  renderCost = self->_renderCost;
  os_unfair_lock_unlock(&self->_lock);
  v8[2](v8, renderTime, renderCost);

}

- (void)_handleRenderStatsTime:(double)a3 cost:(double)a4
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_renderTime = a3;
  self->_renderCost = a4;
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sema, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
