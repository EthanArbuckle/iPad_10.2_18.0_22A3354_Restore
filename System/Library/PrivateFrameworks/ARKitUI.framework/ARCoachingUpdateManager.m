@implementation ARCoachingUpdateManager

- (id)init:(id)a3 metalLayer:(id)a4
{
  id v6;
  id v7;
  ARCoachingUpdateManager *v8;
  ARCoachingUpdateManager *v9;
  uint64_t v10;
  MTLCommandQueue *commandQueue;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARCoachingUpdateManager;
  v8 = -[ARCoachingUpdateManager init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metalLayer, a4);
    -[CAMetalLayer setDevice:](v9->_metalLayer, "setDevice:", v6);
    -[CAMetalLayer setPresentsWithTransaction:](v9->_metalLayer, "setPresentsWithTransaction:", 1);
    v10 = objc_msgSend(v6, "newCommandQueue");
    commandQueue = v9->_commandQueue;
    v9->_commandQueue = (MTLCommandQueue *)v10;

    -[MTLCommandQueue setLabel:](v9->_commandQueue, "setLabel:", CFSTR("MetalRenderer command queue"));
    v9->_lastUpdateTime = 0.0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[ARCoachingUpdateManager stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)ARCoachingUpdateManager;
  -[ARCoachingUpdateManager dealloc](&v3, sel_dealloc);
}

- (void)start
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  void *v6;

  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_update);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 60);
    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99748]);

    self->_lastUpdateTime = CACurrentMediaTime();
  }
}

- (void)stop
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (void)update
{
  CFTimeInterval v3;
  CFTimeInterval v4;
  void *v5;

  v3 = CACurrentMediaTime();
  v4 = v3 - self->_lastUpdateTime;
  -[ARCoachingUpdateManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateForCurrentTime:timeDelta:", v3, v4);

  -[ARCoachingUpdateManager drawWithTimeDelta:](self, "drawWithTimeDelta:", v4);
  self->_lastUpdateTime = v3;
}

- (void)drawWithTimeDelta:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  CGRect v11;

  -[CAMetalLayer bounds](self->_metalLayer, "bounds");
  if (!CGRectEqualToRect(v11, *MEMORY[0x1E0C9D648]))
  {
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v10 = v5;
      -[CAMetalLayer nextDrawable](self->_metalLayer, "nextDrawable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v10, "setLabel:", CFSTR("Frame command buffer"));
        kdebug_trace();
        objc_msgSend(v10, "addCompletedHandler:", &__block_literal_global_2);
        -[ARCoachingUpdateManager delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[ARCoachingUpdateManager delegate](self, "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "resizeForDrawable:", v6);

          -[ARCoachingUpdateManager delegate](self, "delegate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "drawInDrawable:withCommandBuffer:timeDelta:", v6, v10, a3);

        }
        objc_msgSend(v10, "commit");
        objc_msgSend(v10, "waitUntilScheduled");
        objc_msgSend(v6, "present");
      }

      v5 = v10;
    }

  }
}

uint64_t __45__ARCoachingUpdateManager_drawWithTimeDelta___block_invoke()
{
  return kdebug_trace();
}

- (ARCoachingUpdateManagerDelegate)delegate
{
  return (ARCoachingUpdateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
}

@end
