@implementation CLKUIQuadViewRenderCoordinator

- (CLKUIQuadViewRenderCoordinator)initWithQuadView:(id)a3 synchronizeWithClockTimer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CLKUIQuadViewRenderCoordinator *v7;
  CLKUIQuadViewRenderCoordinator *v8;
  CLKUIClockTimerLink *v9;
  uint64_t v10;
  CLKUIRenderFrequencyLink *renderFrequencyLink;
  CLKUIDisplayLink *v12;
  CLKUIRenderFrequencyLink *v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v4 = a4;
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLKUIQuadViewRenderCoordinator;
  v7 = -[CLKUIQuadViewRenderCoordinator init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_quadView, v6);
    if (v4)
    {
      objc_initWeak(&location, v8);
      v9 = [CLKUIClockTimerLink alloc];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __77__CLKUIQuadViewRenderCoordinator_initWithQuadView_synchronizeWithClockTimer___block_invoke;
      v15[3] = &unk_1E86E0000;
      objc_copyWeak(&v16, &location);
      v10 = -[CLKUIClockTimerLink initWithUpdateHandler:](v9, "initWithUpdateHandler:", v15);
      renderFrequencyLink = v8->_renderFrequencyLink;
      v8->_renderFrequencyLink = (CLKUIRenderFrequencyLink *)v10;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      v12 = -[CLKUIDisplayLink initWithTarget:selector:]([CLKUIDisplayLink alloc], "initWithTarget:selector:", v8, sel__renderLinkFired_);
      v13 = v8->_renderFrequencyLink;
      v8->_renderFrequencyLink = &v12->super;

    }
  }

  return v8;
}

void __77__CLKUIQuadViewRenderCoordinator_initWithQuadView_synchronizeWithClockTimer___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_renderLinkFired:", WeakRetained);

}

- (void)_renderLinkFired:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_quadView);
  if (WeakRetained)
  {
    objc_msgSend(v5, "timestamp");
    objc_msgSend(WeakRetained, "_prepareAndRenderForTime:inGroup:checkForDrawable:renderDiscontinuity:completion:", 0, 1, self->_renderDiscontinuity, 0);
  }
  self->_renderDiscontinuity = 0;

}

- (void)invalidate
{
  -[CLKUIRenderFrequencyLink invalidate](self->_renderFrequencyLink, "invalidate");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CLKUIQuadViewRenderCoordinator isPaused](self, "isPaused") && !v3)
    self->_renderDiscontinuity = 1;
  -[CLKUIRenderFrequencyLink setPaused:](self->_renderFrequencyLink, "setPaused:", v3);
}

- (BOOL)isPaused
{
  return -[CLKUIRenderFrequencyLink isPaused](self->_renderFrequencyLink, "isPaused");
}

- (void)setPreferredFramesPerSecond:(unint64_t)a3
{
  -[CLKUIRenderFrequencyLink setPreferredFramesPerSecond:](self->_renderFrequencyLink, "setPreferredFramesPerSecond:", a3);
}

- (unint64_t)preferredFramesPerSecond
{
  return -[CLKUIRenderFrequencyLink preferredFramesPerSecond](self->_renderFrequencyLink, "preferredFramesPerSecond");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderFrequencyLink, 0);
  objc_destroyWeak((id *)&self->_quadView);
}

@end
