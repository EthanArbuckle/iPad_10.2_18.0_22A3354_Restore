@implementation CAMTorchPatternController

- (CAMTorchPatternController)initWithCaptureController:(id)a3
{
  id v5;
  CAMTorchPatternController *v6;
  CAMTorchPatternController *v7;
  CAMTorchPatternController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMTorchPatternController;
  v6 = -[CAMTorchPatternController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__captureController, a3);
    v8 = v7;
  }

  return v7;
}

- (void)startPerformingPattern:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[CAMTorchPatternController _isPerforming](self, "_isPerforming"))
  {
    objc_storeStrong((id *)&self->__currentPattern, a3);
    self->__startTime = CACurrentMediaTime();
    -[CAMTorchPattern setStartTime:](self->__currentPattern, "setStartTime:");
    -[CAMTorchPatternController _setPerforming:](self, "_setPerforming:", 1);
  }

}

- (void)stopPerformingPattern
{
  CAMTorchPattern *currentPattern;

  if (-[CAMTorchPatternController _isPerforming](self, "_isPerforming"))
  {
    -[CAMTorchPatternController _resetTorchLevel](self, "_resetTorchLevel");
    currentPattern = self->__currentPattern;
    self->__currentPattern = 0;

    -[CAMTorchPatternController _setPerforming:](self, "_setPerforming:", 0);
  }
}

- (void)_resetTorchLevel
{
  id v2;

  -[CAMTorchPatternController _captureController](self, "_captureController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeToTorchMode:", 0);

}

- (void)_applyTorchLevel:(float)a3
{
  double v4;
  id v5;

  if (a3 >= 0.01)
  {
    -[CAMTorchPatternController _captureController](self, "_captureController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v4 = a3;
    objc_msgSend(v5, "changeToTorchLevel:", v4);

  }
  else
  {
    -[CAMTorchPatternController _resetTorchLevel](self, "_resetTorchLevel");
  }
}

- (void)blink
{
  CAMTorchPattern *v3;
  CAMTorchPattern *currentPattern;

  -[CAMTorchPatternController _setPerforming:](self, "_setPerforming:", 1);
  v3 = -[CAMTorchPattern initWithType:]([CAMTorchPattern alloc], "initWithType:", 2);
  currentPattern = self->__currentPattern;
  self->__currentPattern = v3;

  self->__startTime = CACurrentMediaTime();
  -[CAMTorchPattern setStartTime:](self->__currentPattern, "setStartTime:");
}

- (void)doubleBlink
{
  CAMTorchPattern *v3;
  CAMTorchPattern *currentPattern;

  -[CAMTorchPatternController _setPerforming:](self, "_setPerforming:", 1);
  v3 = -[CAMTorchPattern initWithType:]([CAMTorchPattern alloc], "initWithType:", 3);
  currentPattern = self->__currentPattern;
  self->__currentPattern = v3;

  self->__startTime = CACurrentMediaTime();
  -[CAMTorchPattern setStartTime:](self->__currentPattern, "setStartTime:");
}

- (void)_setPerforming:(BOOL)a3
{
  CADisplayLink *v4;
  CADisplayLink *displayLink;
  CADisplayLink *v6;
  void *v7;
  CADisplayLink *v8;

  if (self->__performing != a3)
  {
    self->__performing = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_displayLinkFired_);
      v4 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->__displayLink;
      self->__displayLink = v4;

      v6 = self->__displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

      -[CADisplayLink setPaused:](self->__displayLink, "setPaused:", 0);
    }
    else
    {
      -[CADisplayLink setPaused:](self->__displayLink, "setPaused:", 1);
      -[CADisplayLink invalidate](self->__displayLink, "invalidate");
      v8 = self->__displayLink;
      self->__displayLink = 0;

    }
  }
}

- (void)displayLinkFired:(id)a3
{
  -[CAMTorchPattern updateAtTime:](self->__currentPattern, "updateAtTime:", CACurrentMediaTime() - self->__startTime);
  -[CAMTorchPattern torchLevel](self->__currentPattern, "torchLevel");
  -[CAMTorchPatternController _applyTorchLevel:](self, "_applyTorchLevel:");
}

- (double)stepInterval
{
  return self->_stepInterval;
}

- (void)setStepInterval:(double)a3
{
  self->_stepInterval = a3;
}

- (CUCaptureController)_captureController
{
  return self->__captureController;
}

- (BOOL)_isPerforming
{
  return self->__performing;
}

- (CAMTorchPattern)_currentPattern
{
  return self->__currentPattern;
}

- (double)_startTime
{
  return self->__startTime;
}

- (CADisplayLink)_displayLink
{
  return self->__displayLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayLink, 0);
  objc_storeStrong((id *)&self->__currentPattern, 0);
  objc_storeStrong((id *)&self->__captureController, 0);
}

@end
