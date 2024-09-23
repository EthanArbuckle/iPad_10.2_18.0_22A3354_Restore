@implementation PKDisplayLinkObserver

- (PKDisplayLinkObserver)initWithHandler:(id)a3
{
  id v4;
  PKDisplayLinkObserver *v5;
  uint64_t v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDisplayLinkObserver;
  v5 = -[PKDisplayLinkObserver init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    handler = v5->_handler;
    v5->_handler = (id)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PKDisplayLinkObserver stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)PKDisplayLinkObserver;
  -[PKDisplayLinkObserver dealloc](&v3, sel_dealloc);
}

- (BOOL)startWithPreferredFramesPerSecond:(CAFrameRateRange)a3 addToRunLoop:(id)a4 forMode:(id)a5
{
  CADisplayLink *displayLink;
  float preferred;
  float maximum;
  float minimum;
  void *v11;
  id v12;
  id v13;
  CADisplayLink *v14;
  CADisplayLink *v15;
  double v16;
  double v17;
  double v18;

  displayLink = self->_displayLink;
  if (!displayLink)
  {
    preferred = a3.preferred;
    maximum = a3.maximum;
    minimum = a3.minimum;
    v11 = (void *)MEMORY[0x1E0CD2730];
    v12 = a5;
    v13 = a4;
    objc_msgSend(v11, "displayLinkWithTarget:selector:", self, sel__displayLinkHandler_);
    v14 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v15 = self->_displayLink;
    self->_displayLink = v14;

    *(float *)&v16 = minimum;
    *(float *)&v17 = maximum;
    *(float *)&v18 = preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", v16, v17, v18);
    -[CADisplayLink addToRunLoop:forMode:](self->_displayLink, "addToRunLoop:forMode:", v13, v12);

  }
  return displayLink == 0;
}

- (BOOL)stop
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
  return displayLink != 0;
}

- (void)_displayLinkHandler:(id)a3
{
  id v4;
  uint64_t (**handler)(void);
  char v6;
  id v7;

  v4 = a3;
  handler = (uint64_t (**)(void))self->_handler;
  if (handler)
  {
    v7 = v4;
    v6 = handler[2]();
    v4 = v7;
    if ((v6 & 1) == 0)
    {
      -[PKDisplayLinkObserver stop](self, "stop");
      v4 = v7;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
