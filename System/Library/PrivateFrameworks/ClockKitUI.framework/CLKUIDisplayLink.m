@implementation CLKUIDisplayLink

- (CLKUIDisplayLink)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  CLKUIDisplayLink *v7;
  uint64_t v8;
  CADisplayLink *displayLink;
  CADisplayLink *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKUIDisplayLink;
  v7 = -[CLKUIRenderFrequencyLink init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    displayLink = v7->_displayLink;
    v7->_displayLink = (CADisplayLink *)v8;

    -[CADisplayLink setPaused:](v7->_displayLink, "setPaused:", 1);
    v10 = v7->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v10, "addToRunLoop:forMode:", v11, *MEMORY[0x1E0C99860]);

  }
  return v7;
}

- (void)updateCoordinator
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKUIDisplayLink;
  -[CLKUIRenderFrequencyLink updateCoordinator](&v3, sel_updateCoordinator);
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", -[CLKUIRenderFrequencyLink preferredFramesPerSecond](self, "preferredFramesPerSecond"));
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", -[CLKUIRenderFrequencyLink isPaused](self, "isPaused"));
}

- (void)invalidate
{
  CADisplayLink *displayLink;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKUIDisplayLink;
  -[CLKUIRenderFrequencyLink invalidate](&v4, sel_invalidate);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
